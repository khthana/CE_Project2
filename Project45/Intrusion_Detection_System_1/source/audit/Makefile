audit:
	gcc -o transfer transfer.c;	\
	gcc -c -D__KERNEL__ -DMODULE -Wall -I/usr/src/linux/include -DMODVERSIONS -include /usr/src/linux/include/linux/modversions.h tracesys.c;	\
