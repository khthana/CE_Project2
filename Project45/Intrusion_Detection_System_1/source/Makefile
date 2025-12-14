all:
	@if [ ! -d /dev/skeleton ]; \
	then	\
		mknod -m 666 /dev/skeleton c 32 0;	\
	fi;	\
	if [ ! -d /dev/auditsuccess ];	\
	then	\
		mknod -m 666 /dev/auditsuccess c 33 0;	\
	fi;	\
	mkdir /usr/local/ids;	\
	cd ./audit;	\
	make;	\
	mv ./transfer /usr/local/ids/;	\
	mv ./tracesys.o /usr/local/ids/;	\
	cd ..;		\
	cd ./bash-2.05a;	\
	./configure;	\
	make;	\
	cp ./bash /usr/local/ids/;	\
	cd ..;		\
	cd ./src;	\
	make;	\
	mv ./ids /usr/local/ids/;	\
	make clean;	\
	cd ..;		\
	mkdir /usr/local/ids/temp;	\
	mkdir /usr/local/ids/seq;	\
	chmod 777 /usr/local/ids/temp;	\
	cp sys_data.ref /usr/local/ids;	\
	cp sc.conf /usr/local/ids;	\
	cp -r ./normal_db /usr/local/ids;	\

clean:
	-rm /dev/skeleton;	\
	rm /dev/auditsuccess;	\
	rm -rf /usr/local/ids;	\

