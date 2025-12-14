PCAP_PATH = ../../lib
CFLAGS = -g -O -mno-cygwin -I ../../include

OBJS = pktdump.o
LIBS = -L ${PCAP_PATH} -lwpcap

all: ${OBJS}
	${CC} ${CFLAGS} -o pktdump.exe ${OBJS} ${LIBS}

clean:
	rm -f ${OBJS} pktdump.exe

.c.o:
	${CC} ${CFLAGS} -c -o $*.o $<
