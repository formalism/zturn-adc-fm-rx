obj-m += vdmadrv.o jpegdrv.o
KERNEL_SRC = /home/tomo/proj/zynq-linux/build/tmp/work/zc702_zynq7-poky-linux-gnueabi/linux-xlnx/3.14-xilinx+gitAUTOINC+2b48a8aeea-r0/linux-zc702_zynq7-standard-build

BUILD_DIR := $(shell pwd)

CROSS_COMPILE = /home/tomo/proj/zynq-linux/build/tmp/sysroots/x86_64-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-
ARCH = arm

#CC = gcc
#LD = ld

all:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_SRC) SUBDIRS=$(BUILD_DIR) modules

clean:
	make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_SRC) M=$(PWD) clean

capture:
	$(CROSS_COMPILE)gcc -o capture capture.c -pthread

test:
	gcc -O2 -o capture capture.c -pthread -lm
