EXEC= IsagNids
G++=g++
INSTALLDIR=/usr/local/bin
LOGDIR=/var/log
INSTALL=/usr/bin/ginstall -c
MANDIR=/usr/local/man

all:IPdefragment.o flood.o hostdb.o html.o land.o manage.o node.o report.o scan.o signature.o slog.o sniff4.o
	g++ -o IsagNids IPdefragment.o flood.o hostdb.o html.o land.o manage.o node.o report.o scan.o signature.o slog.o sniff4.o -lpthread -lpcap -Wall -g

clean: 
	rm -f IPdefragment.o flood.o hostdb.o html.o land.o manage.o node.o report.o scan.o signature.o slog.o sniff4.o IsagNids


install:	all
	$(INSTALL) -m 755 $(EXEC) $(INSTALLDIR)/$(EXEC)
	$(INSTALL) -m 644 $(EXEC).1 $(MANDIR)/man1/$(EXEC).1
	$(INSTALL) -m 644 $(EXEC).conf /etc/$(EXEC).conf


uninstall: 
	rm -f $(INSTALLDIR)/$(EXEC)
	rm -f $(MANDIR)/man1/$(EXEC).1

IPdefragment.o:IPdefragment.cpp IPdefragment.h
	g++ -w -g -c IPdefragment.cpp

flood.o:flood.cpp flood.h
	g++ -w -g -c flood.cpp

hostdb.o:hostdb.cpp hostdb.h
	g++ -w -g -c hostdb.cpp

html.o:html.cpp html.h
	g++ -w -g -c html.cpp

land.o:land.cpp land.h
	g++ -w -g -c land.cpp


manage.o:manage.cpp manage.h
	g++ -w -g -c manage.cpp 


node.o:node.cpp node.h
	g++ -w -g -c node.cpp


report.o:report.cpp report.h
	g++ -w -g -c report.cpp


scan.o:scan.cpp scan.h
	g++ -w -g -c scan.cpp


signature.o:signature.cpp signature.h
	g++ -w -g -c signature.cpp


slog.o:slog.cpp slog.h
	g++ -w -g -c slog.cpp


sniff4.o:sniff4.cpp
	g++ -w -g -c sniff4.cpp

