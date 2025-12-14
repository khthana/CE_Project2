all: ids

#which compiler
CC=g++

# Where to install
INSTDIR=/usr/local/bin

#Where are include files kept
INCLUDE=.

#Option for release
CFLAGS=-O -Wall

ids: anomallseq.o auditdetail.o sc_config.o seqtree.o sequence.o  ids.o
	$(CC) -o ids anomallseq.o auditdetail.o sc_config.o seqtree.o sequence.o ids.o

ids.o: ids.cc sc_config.h sequence.h dblist.h auditdetail.h dblistnode.h
	$(CC) -I$(INCLUDE) $(CFLAGS) -c ids.cc
	
anomallseq.o: anomallseq.cc anomallseq.h t_array.h t_linklist.h
	$(CC) -I$(INCLUDE) $(CFLAGS) -c anomallseq.cc

auditdetail.o: auditdetail.cc auditdetail.h	
	$(CC) -I$(INCLUDE) $(CFLAGS) -c auditdetail.cc

sc_config.o: sc_config.cc sc_config.h t_linklist.h
	$(CC) -I$(INCLUDE) $(CFLAGS) -c sc_config.cc

seqtree.o: seqtree.cc seqtree.h t_array.h
	$(CC) -I$(INCLUDE) $(CFLAGS) -c seqtree.cc
	
sequence.o: sequence.cc sequence.h t_array.h anomallseq.h seqtree.h sc_config.h auditdetail.h
	$(CC) -I$(INCLUDE) $(CFLAGS) -c sequence.cc

clean:
	-rm *.o
