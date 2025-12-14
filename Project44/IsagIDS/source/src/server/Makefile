#choose compiler
CC=gcc

server: mainserver.c response.o analyse.o filter.o md5c.o log2cvs viewlog
	$(CC) -o server mainserver.c filter.o analyse.o response.o  md5c.o
response.o: response.c ../define.h ../config.h
	$(CC) -c response.c
analyse.o: analyse.c ../define.h ../config.h
	$(CC) -c analyse.c
filter.o: filter.c ../define.h ../config.h
	$(CC) -c filter.c
md5c.o: global.h md5.h md5c.c
	$(CC) -c md5c.c 
log2cvs: log2cvs.c
	$(CC) -o log2cvs log2cvs.c
viewlog:viewlog.c
	$(CC) -o viewlog viewlog.c
clean:
	-rm *.o -f

