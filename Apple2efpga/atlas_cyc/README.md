# Apple//e DeMiSTified - Atlas CYC1000 port

22/09/21 Atlas CYC1000 port DeMiSTified by Somhic from original MiST core https://github.com/gyurco/apple2efpga 

Special thanks to Alastair M. Robinson creator of [DeMiSTify](https://github.com/robinsonb5/DeMiSTify) for helping me. 

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

**Features:**

* ~~HDMI video output~~
* VGA 222 video output is available through an HDMI to VGA adapter
* ~~HDMI audio output~~
* Sigma-Delta audio
* Joystick (tested with a Megadrive gamepad)

**Additional hardware required**:

- PS/2 Keyboard 

##### Versions:

v0.51 new board Atlas_cyc

### STATUS

* To be tested VGA output
* ~~HDMI video outputs special resolution so will not work on all monitors.~~ 



### Instructions to compile the project for a specific board:

(Note that sof/rbf files are already included in /atlas_cyc/output_files/)

```sh
git clone https://github.com/somhi/apple2efpga
cd apple2efpga
#Do a first make (will finish in error) but it will download missing submodules 
make
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q18)
gedit site.mk
#[DECA ONLY]Copy mofified deca_pins.tcl file to Demistify folder (MODIFICATION FOR 3 PINS SDRAM. THIS IS A TEMPORARY FIX)
cd ../deca
cp deca_pins.tcl_copy_to_demistify_board_deca ../DeMiSTify/Board/deca/deca_pins.tcl 
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=atlas_cyc
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /atlas_cyc/apple2efpga_atlas_cyc.qpf

**Others:**

* User Button is a reset button

### OSD Controls

* F12 show/hide OSD 
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

