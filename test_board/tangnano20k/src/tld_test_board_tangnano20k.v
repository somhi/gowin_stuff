`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:24:02 08/15/2016 
// Design Name: 
// Module Name:    tld_test_prod 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module tld_test_board_tangnano20k (
   input wire SYS_CLK,
   //---------------------------
   input wire ps2_clk,
   input wire ps2_dat,
   //---------------------------
   inout wire mouse_data,
   inout wire mouse_clk,
   //---------------------------
   //input wire ear,
   //---------------------------
   // output wire [18:0] sram_addr,
   // inout wire [7:0] sram_dq,
   // output wire sram_we_n,
   //---------------------------
   // output wire joy_load_n,
   // output wire joy_clk,
   // input wire joy_data,
   //---------------------------
   output wire [1:0] led,
   //---------------------------
   output wire sd_cs_n,
   output wire sd_clk,
   output wire sd_mosi,
   input wire sd_miso,
   //---------------------------
   // output wire flash_cs_n,
   // output wire flash_clk,
   // output wire flash_mosi,
   // input wire flash_miso,
   //---------------------------
   // output wire sdram_clk,          // señales validas en flanco de suida de CK
   // output wire sdram_cke,
   // output wire sdram_dqmh_n,      // mascara para byte alto o bajo
   // output wire sdram_dqml_n,      // durante operaciones de escritura
   // output wire [12:0] sdram_addr, // pag.14. row=[12:0], col=[8:0]. A10=1 significa precharge all.
   // output wire [1:0] sdram_ba,    // banco al que se accede
   // output wire sdram_cs_n,
   // output wire sdram_we_n,
   // output wire sdram_ras_n,
   // output wire sdram_cas_n,
   // inout tri [15:0] sdram_dq,
   //---------------------------
   output wire [1:0] vga_r,
   output wire [1:0] vga_g,
   output wire [1:0] vga_b,
   output wire vga_hs,
   output wire vga_vs,
   //
   output wire pwm_audio_out_l,
   output wire pwm_audio_out_r
   );

   wire clk100, clk14, clk7;

   wire mode, vga;
   wire [5:0] vga_r_x;
   wire [5:0] vga_g_x;
   wire [5:0] vga_b_x;
   
   wire [5:0] r_to_vga, g_to_vga, b_to_vga;
   wire hsync_to_vga, vsync_to_vga, csync_to_vga;
   
   wire memtest_init_fast, memtest_init_slow, memtest_progress, memtest_result;
   wire sdtest_init, sdtest_progress, sdtest_result;
   wire flashtest_init, flashtest_progress, flashtest_result;
   wire sdramtest_init, sdramtest_progress, sdramtest_result;
   wire hidetextwindow;
   
   wire [7:0] earcode;
   wire [2:0] mousebutton;  // M R L
   wire mousetest_init;
   
   wire [15:0] flash_vendor_id;
   
   wire master_reset;
   wire clocks_ready;

   wire joy1up, joy1down, joy1left, joy1right, joy1fire1, joy1fire2, joy1fire3, joy1start;
   wire joy2up, joy2down, joy2left, joy2right, joy2fire1, joy2fire2, joy2fire3, joy2start;
   
   Gowin_rPLL_100 reoloj100(
      .clkout(clk100), //output clkout
      .lock(clocks_ready), //output lock
      .clkin(SYS_CLK) //input clkin
   );

  Gowin_rPLL_14 relojes_14_7(
   .clkout(clk14), //output clkout
   //.lock(clocks_ready), //output lock
   .clkoutd(clk7), //output clkoutd
   .clkin(SYS_CLK) //input clkin
   );


   switch_mode teclas (
      .clk(clk7),
      .clkps2(ps2_clk),
      .dataps2(ps2_dat),
      .mode(mode),
      .vga(vga),
      .memtestf(memtest_init_fast),
      .memtests(memtest_init_slow),
      .sdtest(sdtest_init),
      .flashtest(flashtest_init),
      .mousetest(mousetest_init),
      .sdramtests(sdramtest_init),
      .hidetextwindow(hidetextwindow),
      .master_reset(master_reset)
   );


   sdtest test_slot_sd (
      .clk(clk7),
      .rst(sdtest_init),
      .spi_clk(sd_clk),
      .spi_di(sd_mosi),
      .spi_do(sd_miso),
      .spi_cs(sd_cs_n),
      .test_in_progress(sdtest_progress),
      .test_result(sdtest_result)
   );

   // eartest test_ear (
   //    .clk(clk7),
   //    .ear(1'b0),
   //    .vs(vsync_to_vga),
   //    .code(earcode)
   // );

   mousetest test_raton (
      .clk(clk7),
      .rst(mousetest_init),
      .ps2clk(mouse_clk),
      .ps2data(mouse_data),
      .botones(mousebutton)
   );

   // sdramtest test_sdram (
   //   .clk(clk100),
   //   .rst(sdramtest_init),
   //   .pll_locked(clocks_ready),
   //   .test_in_progress(sdramtest_progress),
   //   .test_result(sdramtest_result),
   //   .sdram_clk(sdram_clk),          // se�ales validas en flanco de suida de CK
   //   .sdram_cke(sdram_cke),
   //   .sdram_dqmh_n(sdram_dqmh_n),      // mascara para byte alto o bajo
   //   .sdram_dqml_n(sdram_dqml_n),      // durante operaciones de escritura
   //   .sdram_addr(sdram_addr), // pag.14. row=[12:0], col=[8:0]. A10=1 significa precharge all.
   //   .sdram_ba(sdram_ba),    // banco al que se accede
   //   .sdram_cs_n(sdram_cs_n),
   //   .sdram_we_n(sdram_we_n),
   //   .sdram_ras_n(sdram_ras_n),
   //   .sdram_cas_n(sdram_cas_n),
   //   .sdram_dq(sdram_dq)    
   // );

   updater mensajes (
     .clk(clk7),
     .mode(mode),
     .vga(vga),
     
   //   .dna(dna),
     .memtest_progress(memtest_progress),
     .memtest_result(memtest_result),
   //   .joystick1({joy1up,joy1down,joy1left,joy1right,joy1fire1,joy1fire2,joy1fire3,joy1start}),
   //   .joystick2({joy2up,joy2down,joy2left,joy2right,joy2fire1,joy2fire2,joy2fire3,joy2start}),
     .earcode(earcode),
     .sdtest_progress(sdtest_progress),
     .sdtest_result(sdtest_result),
         //   .flashtest_progress(flashtest_progress),
         //   .flashtest_result(flashtest_result),
         //   .flash_vendor_id(flash_vendor_id),
     .sdramtest_progress(sdramtest_progress),
     .sdramtest_result(sdramtest_result),
     .mousebutton(mousebutton),
     .hidetextwindow(hidetextwindow),
     
     .r(r_to_vga),
     .g(g_to_vga),
     .b(b_to_vga),
     .hsync(hsync_to_vga),
     .vsync(vsync_to_vga),
     .csync(csync_to_vga)
     );

   vga_scandoubler #(.CLKVIDEO(7000)) modo_vga (
      .clkvideo(clk7),
      .clkvga(clk14),
      .enable_scandoubling(vga),
      .disable_scaneffect(1'b0),
      .ri(r_to_vga),
      .gi(g_to_vga),
      .bi(b_to_vga),
      .hsync_ext_n(hsync_to_vga),
      .vsync_ext_n(vsync_to_vga),
      .csync_ext_n(csync_to_vga),
      .ro(vga_r_x),
      .go(vga_g_x),
      .bo(vga_b_x),
      .hsync(vga_hs),
      .vsync(vga_vs)
   );
   
   assign vga_r = vga_r_x[5:4];
   assign vga_g = vga_g_x[5:4];
   assign vga_b = vga_b_x[5:4];

   audio_test audio (
      .clk(clk14),
      .left(pwm_audio_out_l),
      .right(pwm_audio_out_r),
      .led(led[0])
   );
   

endmodule
