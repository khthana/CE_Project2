# comment/uncomment the following line to disable/enable debugging
# DEBUG = y

# Add your debugging flag (or not) to CFLAGS
ifeq ($(DEBUG), y)
	FLAGS = -O -g # "-O" is needed to expand in lines
ifeq ($(CONVERT), y )
	DEBFLAGS = $(FLAGS) -DCONVERT_DEBUG
endif
ifeq ($(CIPHER), y)
	DEBFLAGS = $(FLAGS) -DCIPHER_DEBUG
endif
else
	DEBFLAGS = -O2
endif

CFLAGS += $(DEBFLAGS)
CFLAGS += -I$(LDDINC)

ifneq ($(KERNELRELEASE),)
	obj-m := crypto_des.o
else
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD	:= $(shell pwd)

modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) LDDINC=$(PWD)/../include modules

endif

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions

depend .depend dep:
	$(CC) $(CFLAGS) -M *.c > .depend

ifeq (.depend,$(wildcard .depend))
include .depend
endif
