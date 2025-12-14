#TARGET := ipt_webprevent.o
#WARN := -W -Wall -Wstrict-prototypes -Wmissing-prototypes
#INCLUDE := -isystem /lib/modules/`uname -r`/build/include
#CFLAGS := -O2 -DMODULE -D__KERNEL__  ${WARN} ${INCLUDE}
#CC := gcc

#${TARGET}.o : ${TARGET}.c
#
#.PHONY: clean
#
#clean:
#	rm -rf ${TARGET}.o

CC := gcc

KERNELDIR := /usr/src/linux
include $(KERNELDIR)/.config

CFLAGS := -D__KERNEL__ -DMODULE -I$(KERNELDIR)/include -O2 -Wall

ipt_WEBDROP.o: ipt_WEBDROP.c ipt_WEBDROP.h#ipt_webprevent.h
	$(CC) -c $(CFLAGS) ipt_WEBDROP.c

clean:
	rm *.o
