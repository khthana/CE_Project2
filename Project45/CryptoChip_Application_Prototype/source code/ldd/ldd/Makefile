KERNELDIR = /usr/src/linux
include $(KERNELDIR)/.config
#CFLAGS = -D__KERNEL__ -D__NO_VERSION__ -DMODULE -I$(KERNELDIR)/include -O -Wall
#CFLAGS = -D__KERNEL__ -D__NO_VERSION__ -DMODULE -O -Wall
#CFLAGS = -DMODULE -I$(KERNELDIR)/include -O -Wall
#CC = gcc

all: mind.o no_mind.o foo

mind.o: mind.c mind.h ldd.h
	gcc -Wall -c -D__KERNEL__ -DMODULE -D__NO_VERSION__ -O2 mind.c -o mind.o

no_mind.o: mind.c mind.h ldd.h
	gcc -Wall -c -DNO_MIND -D__KERNEL__ -DMODULE -D__NO_VERSION__ -O2 \
		mind.c -o no_mind.o

foo: foo.c ldd.h
	gcc -Wall -ggdb -o foo foo.c
clean: 
	rm -f *~ core *.o foo
