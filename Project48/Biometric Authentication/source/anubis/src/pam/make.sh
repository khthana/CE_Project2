#!/bin/sh
#pwd=`pwd`

gcc -DHAVE_CONFIG_H -I. -I. -I.. -I/usr/include/gtk-1.2 -I/usr/include/glib-1.2 -I/usr/lib/glib/include -I/usr/X11R6/include    -I/usr/include/libxml2  -I/usr/local/include    -I/usr/src/linux/drivers/ieee1394 -Icsu -g -O2  -Wall -c pam_anubis.c

gcc -shared -Xlinker -x -o pam_anubis.so pam_anubis.o -lpam -rdynamic -L/usr/lib -L/usr/X11R6/lib /usr/lib/libgtk.so /usr/lib/libgdk.so /usr/lib/libgmodule.so /usr/lib/libglib.so -ldl -lXi -lXext -lX11 -lmalib -L`pwd`/csu -lcsuCommon -lcxcore -lcv -lcvaux -lhighgui /usr/lib/libxml2.so -lz -lm -L`pwd` -lpamanubis -L/usr/lib -lgtk -lgdk -lgmodule -L/usr/lib -lxml2 -lz -lm 
