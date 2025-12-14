common_ldadd = \
	@GTK_LIBS@ \
	@XML_LIBS@ \
	-lm \
	-lcxcore \
	-lcv \
	-lhighgui \
	-lcvaux

common_ldflags = \
	../glade_gui_src/glade_interface.o \
	../glade_gui_src/glade_callbacks.o \
	../glade_gui_src/glade_support.o

bin_SCRIPTS = \
	xmltocvhaardata.py \
	randcat.py

xmltocvhaardata.py:

randcat.py:

#pkgpython_LTLIBRARIES = anubis_pycvseq.la
#anubis_pycvseq_LTLIBRARIES = anubis_pycvseq.la
#noinst_LTLIBRARIES = anubis_pycvseq.la

#anubis_pycvseq_la_SOURCES = \
#	anubis_pycvseq.c \
#	anubis_pycvseq.h
#anubis_pycvseq_la_LDFLAGS = -module -avoid-version $(common_ldflags)
#anubis_pycvseq_la_LIBADD = $(common_ldadd)
