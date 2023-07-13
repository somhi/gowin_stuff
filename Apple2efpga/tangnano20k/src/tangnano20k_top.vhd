library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-------------------------------------------------------------------------

entity tangnano20k_top is
	port (
		SYS_CLK			: IN  STD_LOGIC;

		KEY           	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LED0        	: OUT STD_LOGIC;

		-- sdram magic ports 
		O_sdram_clk   	: OUT STD_LOGIC;
		O_sdram_cke   	: OUT STD_LOGIC;
		O_sdram_cs_n  	: OUT STD_LOGIC;
		O_sdram_cas_n 	: OUT STD_LOGIC;
		O_sdram_ras_n 	: OUT STD_LOGIC;
		O_sdram_wen_n 	: OUT STD_LOGIC;
		IO_sdram_dq   	: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		O_sdram_addr  	: OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
		O_sdram_ba    	: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		O_sdram_dqm   	: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);

		--VGA
		-- VGA_HS			: OUT STD_LOGIC;
		-- VGA_VS			: OUT STD_LOGIC;
		-- VGA_R			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		-- VGA_G			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		-- VGA_B			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- tmds
		tmds_d_p 		: out std_logic_vector(2 downto 0);
		tmds_d_n 		: out std_logic_vector(2 downto 0);
		tmds_clk_p 		: out std_logic;
		tmds_clk_n 		: out std_logic;

		-- AUDIO
		SIGMA_R			: OUT STD_LOGIC;
		SIGMA_L			: OUT STD_LOGIC;

		AUDIO_INPUT     : IN STD_LOGIC;

		-- I2S audio		
		I2S_BCLK		: OUT   STD_LOGIC	:= '0';
		I2S_LRCLK		: OUT   STD_LOGIC	:= '0';
		I2S_DATA		: OUT   STD_LOGIC	:= '0';	
		I2S_EN			: OUT   STD_LOGIC	:= '0';	

		-- JOYSTICK 


		-- PS2
		PS2_KEYBOARD_CLK: INOUT STD_LOGIC;
		PS2_KEYBOARD_DAT: INOUT STD_LOGIC;
		PS2_MOUSE_CLK   : INOUT STD_LOGIC;
		PS2_MOUSE_DAT   : INOUT STD_LOGIC;

		-- UART

		-- SD Card
		SD_SCK 			: OUT 	STD_LOGIC := '0';	--CLK
		SD_CMD 			: OUT 	STD_LOGIC := '0';	--MOSI
		SD_DAT0			: IN 	STD_LOGIC;			--MISO
		SD_DAT3			: INOUT STD_LOGIC := '1'	--CS
		-- SD_DAT1		: INOUT STD_LOGIC := '1';
		-- SD_DAT2		: INOUT STD_LOGIC := '1';	

	);
END entity;

architecture RTL of tangnano20k_top is
	
-- System clocks
	signal locked : std_logic;
	signal reset_n : std_logic;

-- SPI signals
	signal sd_clk : std_logic;
	signal sd_cs : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;
	
-- internal SPI signals
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;

-- PS/2 Keyboard socket - used for second mouse
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

	signal intercept : std_logic;

-- Video
	signal vga_red: std_logic_vector(7 downto 0);
	signal vga_green: std_logic_vector(7 downto 0);
	signal vga_blue: std_logic_vector(7 downto 0);
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;

	signal VGA_R	: std_logic_vector(2 downto 0);
	signal VGA_G	: std_logic_vector(2 downto 0);
	signal VGA_B	: std_logic_vector(2 downto 0);
	signal VGA_HS 	: std_logic;
	signal VGA_VS 	: std_logic;

-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;
	
-- IO
	signal joya : std_logic_vector(7 downto 0);
	signal joyb : std_logic_vector(7 downto 0);
	signal joyc : std_logic_vector(7 downto 0);
	signal joyd : std_logic_vector(7 downto 0);


component audio_top is
Port ( 	
		clk_50MHz : in STD_LOGIC; -- system clock (50 MHz)
		dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC
		dac_LRCK : out STD_LOGIC;
		dac_SCLK : out STD_LOGIC;
		dac_SDIN : out STD_LOGIC;
		L_data : 	in std_logic_vector(15 downto 0);  	-- LEFT data (15-bit signed)
		R_data : 	in std_logic_vector(15 downto 0)  	-- RIGHT data (15-bit signed) 
);
end component;

-- DAC AUDIO     
	signal dac_l	: signed(9 downto 0);
	signal dac_r	: signed(9 downto 0);
	signal dac_l_s  : signed(15 downto 0);
	signal dac_r_s  : signed(15 downto 0);

	signal i2s_mclk	    : std_logic;

--
	signal sdram_addr	: std_logic_vector(12 downto 0);
	signal act_led 		: std_logic;

	signal vga_clk5  : std_logic;
	signal vga_clk   : std_logic;
	signal vga_blank : std_logic;
	signal vga_x_r   : std_logic_vector(5 downto 0);
	signal vga_x_g   : std_logic_vector(5 downto 0);
	signal vga_x_b   : std_logic_vector(5 downto 0);
	signal vga_x_hs  : std_logic;
	signal vga_x_vs  : std_logic;

begin


-- SPI
SD_DAT3<=sd_cs;
SD_CMD<=sd_mosi;
sd_miso<=SD_DAT0;
SD_SCK<=sd_clk;

-- External devices tied to GPIOs
ps2_mouse_dat_in<=ps2_mouse_dat;
ps2_mouse_dat <= '0' when ps2_mouse_dat_out='0' else 'Z';
ps2_mouse_clk_in<=ps2_mouse_clk;
ps2_mouse_clk <= '0' when ps2_mouse_clk_out='0' else 'Z';

ps2_keyboard_dat_in <=ps2_keyboard_dat;
ps2_keyboard_dat <= '0' when ps2_keyboard_dat_out='0' else 'Z';
ps2_keyboard_clk_in<=ps2_keyboard_clk;
ps2_keyboard_clk <= '0' when ps2_keyboard_clk_out='0' else 'Z';
	
joya<="11111111";
joyb<="11111111";


VGA_R<=vga_red(7 downto 5);
VGA_G<=vga_green(7 downto 5);
VGA_B<=vga_blue(7 downto 5);
VGA_HS<=vga_hsync;
VGA_VS<=vga_vsync;


U4: entity work.svo_hdmi_out
port map (
    resetn => '1',
	--video clocks
    clk_pixel => vga_clk,
    clk_5x_pixel => vga_clk5,
    locked => '1',
	--input VGA
    rout => vga_x_r,
    bout => vga_x_b,
    gout => vga_x_g,
    hsync_n => not vga_x_hs,
    vsync_n => not vga_x_vs,
    blank => vga_blank,
	--output signals
    tmds_clk_n => tmds_clk_n,
    tmds_clk_p => tmds_clk_p,
    tmds_d_n => tmds_d_n,
    tmds_d_p => tmds_d_p,
    tmds_ts => open
);



I2S_EN <= '1';

-- I2S audio
audio_i2s: entity work.audio_top
port map(
	clk_50MHz => SYS_CLK,
	dac_MCLK  => I2S_MCLK,
	dac_LRCK  => I2S_LRCLK,
	dac_SCLK  => I2S_BCLK,
	dac_SDIN  => I2S_DATA,
	L_data    => std_logic_vector(dac_l_s),
	R_data    => std_logic_vector(dac_r_s)
);		


dac_l_s <= ((not dac_l(9)) & dac_l(8 downto 0) & dac_l(9 downto 4));
dac_r_s <= ((not dac_r(9)) & dac_r(8 downto 0) & dac_r(9 downto 4));
	
O_sdram_addr <= sdram_addr(10 downto 0);

guest: COMPONENT  mist_top
  port map (
    CLOCK_27 => SYS_CLK&SYS_CLK,
    LED => act_led,
	
	--SPI
	SPI_DO => spi_fromguest,
	SPI_DI => spi_toguest,
	SPI_SCK => spi_clk_int,
	SPI_SS2 => spi_ss2,
	SPI_SS3 => spi_ss3,
	CONF_DATA0 => conf_data0,

	--SDRAM
	SDRAM_DQ => IO_sdram_dq(15 downto 0),
	SDRAM_A => sdram_addr,
	SDRAM_DQML => O_sdram_dqm(0),
	SDRAM_DQMH => O_sdram_dqm(1),
	SDRAM_nWE => O_sdram_wen_n,
	SDRAM_nCAS => O_sdram_cas_n,
	SDRAM_nRAS => O_sdram_ras_n,
	SDRAM_nCS => O_sdram_cs_n,
	SDRAM_BA => O_sdram_ba,
	SDRAM_CLK => O_sdram_clk,
	SDRAM_CKE => O_sdram_cke,

	--AUDIO
    AUDIO_L => SIGMA_L,
    AUDIO_R => SIGMA_R,
	DAC_C_L => dac_l,
	DAC_C_R => dac_r,

	--EAR
	UART_RX => AUDIO_INPUT,

	--VGA
	VGA_HS => vga_hsync,
	VGA_VS => vga_vsync,
	VGA_R  => vga_red(7 downto 2),
	VGA_G  => vga_green(7 downto 2),
	VGA_B  => vga_blue(7 downto 2),

	VGA_CLK   => vga_clk,
	VGA_CLK5  => vga_clk5,
	VGA_BLANK => vga_blank,
	vga_x_r   => vga_x_r,
	vga_x_g   => vga_x_g,
	vga_x_b   => vga_x_b,
	vga_x_hs  => vga_x_hs,
	vga_x_vs  => vga_x_vs

  );


-- Pass internal signals to external SPI interface
sd_clk <= spi_clk_int;

controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
--		SPI_FASTBIT=>3,
		debug => false,
		jtag_uart => false
	)
	port map (
		clk => SYS_CLK,
		reset_in  => not KEY(0),  --'1'		--reset_in  when 0
		reset_out => reset_n,				--reset_out when 0

		-- SPI signals
		spi_miso => sd_miso,
		spi_mosi	=> sd_mosi,
		spi_clk => spi_clk_int,
		spi_cs => sd_cs,
		spi_fromguest => spi_fromguest,
		spi_toguest => spi_toguest,
		spi_ss2 => spi_ss2,
		spi_ss3 => spi_ss3,
		spi_ss4 => spi_ss4,
		conf_data0 => conf_data0,
		
		-- PS/2 signals
		ps2k_clk_in => ps2_keyboard_clk_in,
		ps2k_dat_in => ps2_keyboard_dat_in,
		ps2k_clk_out => ps2_keyboard_clk_out,
		ps2k_dat_out => ps2_keyboard_dat_out,
		ps2m_clk_in => ps2_mouse_clk_in,
		ps2m_dat_in => ps2_mouse_dat_in,
		ps2m_clk_out => ps2_mouse_clk_out,
		ps2m_dat_out => ps2_mouse_dat_out,

		buttons => (0 => not KEY(1), others => '1'),	-- 0 => OSD_button   

		-- JOYSTICKS
		joy1 => joya,
		joy2 => joyb,

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd,
		intercept => intercept

);

--LED <= (0 => not act_led, others => '1');
LED0 <= not act_led;

end rtl;

