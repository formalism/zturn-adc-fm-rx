connect arm hw
rst -slcr
fpga -f design_1_wrapper.bit
source ps7_init.tcl
ps7_init
ps7_post_config
targets 64
dow -data u-boot.bin 0x04000000
con 0x04000000

