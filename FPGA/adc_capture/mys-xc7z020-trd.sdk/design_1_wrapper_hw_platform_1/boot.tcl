connect -url tcp:localhost:3121
targets 2
rst -cores
fpga -f design_1_wrapper.bit
source ps7_init.tcl
ps7_init
ps7_post_config
dow -data u-boot.bin 0x04000000
con -addr 0x04000000
