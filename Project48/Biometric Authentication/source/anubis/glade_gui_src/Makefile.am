## Process this file with automake to produce Makefile.in

INCLUDES = \
	@GTK_CFLAGS@

bin_PROGRAMS = anubis_glade_gui

anubis_glade_gui_SOURCES = \
	main.c \
	glade_support.c glade_support.h \
	glade_interface.c glade_interface.h \
	glade_callbacks.c glade_callbacks.h

anubis_glade_gui_LDADD = @GTK_LIBS@

