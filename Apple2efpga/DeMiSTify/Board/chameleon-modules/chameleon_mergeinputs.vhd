library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------

entity chameleon_mergeinputs is
	generic (
		joybits : integer :=8;
		button1 : integer :=4;
		button2 : integer :=5;
		button3 : integer :=6;
		button4 : integer :=7
	);
	port (
		clk : in std_logic; -- 100 MHz input clock
		reset_n : in std_logic;
		ena_1mhz : in std_logic;
		ir_data : in std_logic;
		
		button_menu_n : in std_logic;
		button_freeze_n : in std_logic;
		button_reset_n : in std_logic;
		
		c64_joy1 : in unsigned(6 downto 0);
		c64_joy2 : in unsigned(6 downto 0);
		c64_joy3 : in unsigned(6 downto 0);
		c64_joy4 : in unsigned(6 downto 0);
		c64_keys : in unsigned(63 downto 0);
		c64_joykey_ena : in std_logic;
		
		c64_restore_in : in std_logic := '1'; -- C64 restore key tends to be a very narrow momentary pulse
		c64_restore_out : out std_logic; -- So we convert it to something wider and more likely to be noticed...

		keypad : out std_logic_vector(11 downto 0);
		
		joy1_out : out unsigned(joybits-1 downto 0);
		joy2_out : out unsigned(joybits-1 downto 0);
		joy3_out : out unsigned(joybits-1 downto 0);
		joy4_out : out unsigned(joybits-1 downto 0);
		menu_out_n : out std_logic;
		freeze_out_n : out std_logic;
		
		usart_cts : in std_logic;
		usart_rxd : in std_logic;
		usart_txd : out std_logic;
		usart_clk : in std_logic
	);
end entity;

architecture rtl of chameleon_mergeinputs is

-- CDTV pad signals:
signal ir : std_logic;
signal ir_d : std_logic;
signal cdtv_port : std_logic;
signal cdtv_joya : unsigned(5 downto 0);
signal cdtv_joyb : unsigned(5 downto 0);
signal cdtv_power : std_logic;
signal cdtv_play : std_logic;
signal cdtv_volup : std_logic;
signal cdtv_voldown : std_logic;

-- c64 keyboard-related signals
signal keys_safe : std_logic;
signal c64_menu : std_logic :='1';
signal c64_start1 : std_logic :='1';
signal c64_select1 :std_logic :='1';
signal c64_start2 : std_logic :='1';
signal c64_select2 : std_logic :='1';

-- Merged signals for buttons 3/4	
signal porta_start : std_logic;
signal porta_select : std_logic;
signal portb_start : std_logic;
signal portb_select : std_logic;

-- Menu button - debouncing
signal menu_s2 : std_logic;
signal menu_s : std_logic;
signal menu_d : std_logic;
signal menu_stable : std_logic;

-- Reconfiguration - triggered by pressing middle and right buttons simultaneously
signal reconfig_trigger : std_logic := '0';

signal debounce_ctr : unsigned(5 downto 0);
signal debouncer1 : std_logic_vector(3 downto 0);
signal debouncer2 : std_logic_vector(3 downto 0);
signal debouncer3 : std_logic_vector(3 downto 0);

signal db_menu_n : std_logic := '1';
signal db_freeze_n : std_logic := '1';
signal db_reset_n : std_logic := '1';

-- Widening of restore key pulses
signal ena_1khz : std_logic;
signal restore_key_ctr : unsigned(8 downto 0);

begin

	my1Khz : entity work.chameleon_1khz
	port map (
		clk => clk,
		ena_1mhz => ena_1mhz,
		ena_1khz => ena_1khz
	);

	-- Debounce buttons, and assert reconfig_trigger if reset and freeze are pressed together.
	-- Doesn't have a reset, since the reset button is being debounced!
	process(clk)
	begin
		if rising_edge(clk) then
			reconfig_trigger<='0';
			if ena_1khz='1' then
				debouncer1<=debouncer1(2 downto 0) & button_menu_n;
				debouncer2<=debouncer2(2 downto 0) & button_freeze_n;
				debouncer3<=debouncer3(2 downto 0) & button_reset_n;
				if (debouncer1(3) xor debouncer1(2))='1'
						or (debouncer2(3) xor debouncer2(2))='1'
						or (debouncer3(3) xor debouncer3(2))='1' then
					debounce_ctr<=(others=>'0');
				elsif debounce_ctr(debounce_ctr'high)='1' then
					db_menu_n<=debouncer1(3);
					db_freeze_n<=debouncer2(3);
					db_reset_n<=debouncer3(3);
					
					if db_freeze_n='0' and db_reset_n='0' then
						reconfig_trigger<='1';
					end if;
				else
					debounce_ctr<=debounce_ctr+1;
				end if;
			end if;
		end if;
	end process;

	-- Synchronise IR signal
	process (clk)
	begin
		if rising_edge(clk) then
			ir_d<=ir_data;
			ir<=ir_d;
		end if;
	end process;


	cdtv : entity work.chameleon_cdtv_remote
	port map(
		clk => clk,
		ena_1mhz => ena_1mhz,
		ir => ir,
		key_power => cdtv_power,
		key_play => cdtv_play,
		joystick_a => cdtv_joya,
		joystick_b => cdtv_joyb,
		key_vol_up => cdtv_volup,
		key_vol_dn => cdtv_voldown,
		currentport => cdtv_port,
		key_0 => keypad(0),
		key_1 => keypad(1),
		key_2 => keypad(2),
		key_3 => keypad(3),
		key_4 => keypad(4),
		key_5 => keypad(5),
		key_6 => keypad(6),
		key_7 => keypad(7),
		key_8 => keypad(8),
		key_9 => keypad(9),
		key_enter => keypad(10),
		key_escape => keypad(11)		
	);

	keys_safe <= '1' when c64_joy1="1111111" else '0';

	-- Update c64 keys only when the joystick isn't active.
	process (clk,reset_n)
	begin
		if reset_n='0' then
			c64_start1<='1';
			c64_select1<='1';
			c64_start2<='1';
			c64_select2<='1';
			c64_menu<='1';
		elsif rising_edge(clk) then
			if keys_safe='1' then
				c64_start1 <= not c64_joykey_ena or c64_keys(8); -- Return
				c64_select1 <= not c64_joykey_ena or c64_keys(38); -- Right shift
				c64_start2 <= not c64_joykey_ena or c64_keys(63); -- Run/stop
				c64_select2 <= not c64_joykey_ena or c64_keys(57); -- Left shift;
				c64_menu <= not c64_joykey_ena or c64_keys(15); -- Left arrow;
			end if;
		end if;
	end process;

	-- 3rd and 4th buttons, active low
	porta_start <= (cdtv_port or not cdtv_play) and c64_start1;
	porta_select <= ((cdtv_port or not cdtv_volup) and c64_select1) and c64_joy1(6);

	portb_start <= (not cdtv_port or not cdtv_play) and c64_start2;
	portb_select <= ((not cdtv_port or not cdtv_volup) and c64_select2) and c64_joy2(6);

	-- Output mapping
	process(c64_joy1,c64_joy2,c64_joy3,c64_joy4,cdtv_joya,cdtv_joyb,porta_select,portb_select,porta_start,portb_start)
	begin
		joy1_out<=(others=>'1');
		joy2_out<=(others=>'1');
		joy3_out<=(others=>'1');
		joy4_out<=(others=>'1');

		joy1_out(3 downto 0)<=c64_joy1(3 downto 0) and cdtv_joya(3 downto 0);
		joy2_out(3 downto 0)<=c64_joy2(3 downto 0) and cdtv_joyb(3 downto 0);
		joy3_out(3 downto 0)<=c64_joy3(3 downto 0);
		joy4_out(3 downto 0)<=c64_joy4(3 downto 0);

		-- First button
		joy1_out(button1)<=c64_joy1(4) and cdtv_joya(4);
		joy2_out(button1)<=c64_joy2(4) and cdtv_joyb(4);
		joy3_out(button1)<=c64_joy3(4);
		joy4_out(button1)<=c64_joy4(4);

		-- Second button
		joy1_out(button2)<=c64_joy1(5) and cdtv_joya(5);
		joy2_out(button2)<=c64_joy2(5) and cdtv_joyb(5);
		joy3_out(button2)<=c64_joy3(5);
		joy4_out(button2)<=c64_joy4(5);

		-- Third button
		joy1_out(button3)<=porta_select and c64_joy1(6);
		joy2_out(button3)<=portb_select and c64_joy2(6);
		joy3_out(button3)<=c64_joy3(6);
		joy4_out(button3)<=c64_joy4(6);

		-- Fourth button
		joy1_out(button4)<=porta_start;
		joy2_out(button4)<=portb_start;
		joy3_out(button4)<='1';
		joy4_out(button4)<='1';
	end process;

	menu_out_n<=db_menu_n and c64_menu and not cdtv_power;
	freeze_out_n<=db_freeze_n;

	usbmcu : entity work.chameleon_reconfig
	port map (
		clk => clk,

		reconfig => reconfig_trigger,
		reconfig_slot => X"0",

		serial_clk => usart_clk,
		serial_rxd => usart_rxd,
		serial_txd => usart_txd,
		serial_cts_n => usart_cts
	);


	-- Restore key: widen the pulse to make it more likely to be picked up by the guest core...

	process(clk)
	begin
		if rising_edge(clk) then
			if ena_1khz='1' and restore_key_ctr(8)='0' then
				restore_key_ctr<=restore_key_ctr+1;
			else
				restore_key_ctr(8)<=restore_key_ctr(8) and c64_restore_in;
			end if;
		end if;
	end process;
		
	c64_restore_out <= restore_key_ctr(8);
	
end architecture;
