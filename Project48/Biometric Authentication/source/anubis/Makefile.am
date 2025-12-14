## Process this file with automake to produce Makefile.in

SUBDIRS = glade_gui_src\
	src \
	scripts

EXTRA_DIST = \
	autogen.sh \
	gaborrg_recog.glade

install-data-local:
	@$(NORMAL_INSTALL)
	if test -d $(srcdir)/pixmaps; then \
	  $(mkinstalldirs) $(DESTDIR)$(pkgdatadir)/pixmaps; \
	  for pixmap in $(srcdir)/pixmaps/*; do \
	    if test -f $$pixmap; then \
	      $(INSTALL_DATA) $$pixmap $(DESTDIR)$(pkgdatadir)/pixmaps; \
	    fi \
	  done \
	fi
	if test -d $(srcdir)/data; then \
	  $(mkinstalldirs) $(DESTDIR)$(pkgdatadir)/data; \
	  for pixmap in $(srcdir)/data/*; do \
	    if test -f $$pixmap; then \
	      $(INSTALL_DATA) $$pixmap $(DESTDIR)$(pkgdatadir)/data; \
	    fi \
	  done \
	fi


dist-hook:
	if test -d pixmaps; then \
	  mkdir $(distdir)/pixmaps; \
	  for pixmap in pixmaps/*; do \
	    if test -f $$pixmap; then \
	      cp -p $$pixmap $(distdir)/pixmaps; \
	    fi \
	  done \
	fi
	if test -d data; then \
	  mkdir $(distdir)/data; \
	  for pixmap in data/*; do \
	    if test -f $$pixmap; then \
	      cp -p $$pixmap $(distdir)/data; \
	    fi \
	  done \
	fi

