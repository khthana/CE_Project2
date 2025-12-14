des_check:	des_check.o
	gcc -O3 -fomit-frame-pointer -DRAND -DTERMIO -DDES_UNROLL -Ilibdes -o des_check des_check.o libdes/libdes.a

des_check.o:
	gcc -O3 -fomit-frame-pointer -DRAND -DTERMIO -DDES_UNROLL -Ilibdes -c -o des_check.o des_check.c

clean:
	rm -rf *.o des_check.exe
