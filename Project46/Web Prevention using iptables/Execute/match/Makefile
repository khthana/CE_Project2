CC = gcc
KERNELDIR = /usr/src/linux
include $(KERNELDIR)/.config

CFLAGS = -D__KERNEL__ -DMODULE -Wall -O -I$(KERNELDIR)/include 

all: ipt_webprevent.h 
	$(CC) $(CFLAGS) -c ipt_webprevent.c 

clean:
	rm *.o
