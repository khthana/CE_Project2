#choose compiler
CC=gcc

configModule : configModule.c ../define.h ../config.h auditModule
	$(CC) -o configModule configModule.c
auditModule  : log.c ../define.h ../config.h
	$(CC) -c -O3 log.c
clean:
	-rm configModule.o

