#!/bin/bash
cd ..;
make clean;
make distclean;
qmake -o Makefile honeypot.pro;
make;
./honeypot
