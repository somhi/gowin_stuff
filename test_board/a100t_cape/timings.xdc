# Contraints de tiempo
#set_property DONT_TOUCH true [get_nets clk7]
create_clock -name clk_50 -period 20 [get_ports clk_50]
#create_clock -name clkdna -period 570 [get_pins dna_fpga/bclkdna/O]
#create_generated_clock -name clkramtest -source [get_pins los_relojes/clk_out3] -divide_by 2 [get_pins clkcpu_bufg/O]

set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
#set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]
#set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 0x0100000 [current_design]

