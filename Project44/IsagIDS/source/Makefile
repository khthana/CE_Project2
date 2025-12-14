CC=gcc

config_out: ./src/config.c
	$(CC) -o ./src/config ./src/config.c;
	./src/config;    \
	mv config.h src; \
	cd ./src; 	 \
	rm ./config; \
	# try to compile log module 
	cd ./src;         \
	cd ./auditModule; \
	make;             \
	cp ./log.o ../..; \
	rm ./log.o;       \
	cp ./configModule ../..; \
	rm ./configModule;       \
	# try to compile server part 
	cd ./src;    \
	cd ./server; \
	make;        \
	cp ./server ../..; \
	rm ./server;       \
	cp ./log2cvs ../..;\
	rm ./log2cvs;      \
	cp ./viewlog ../..;\
	rm ./viewlog;      \
        # change permission for each file	
	chmod 500 configModule;  \
	chmod 400 log.o;         \
	chmod 500 log2cvs;       \
	chmod 500 server;        \
	chmod 500 viewlog;

