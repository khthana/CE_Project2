TEMPLATE	= app
LANGUAGE	= C++

CONFIG	+= qt warn_on release

HEADERS	+= connectdatabase.h

SOURCES	+= main.cpp

FORMS	= honeywallmm.ui \
	userpass.ui \
	wizardform.ui \
	aboutdialog.ui

IMAGES	= images/cache.png \
	images/encrypted.png \
	images/find.png \
	images/kcontrol.png \
	images/window_list.png \
	images/agt_print.png \
	images/package_settings.png \
	images/kfloppy.png \
	images/windows_users.png \
	images/forward.png \
	images/next-sail.png \
	images/previos-sail.png \
	images/xmag.png \
	images/tartitle.png \
	images/reload.png \
	images/configure.png

DBFILE	= honeypot.db
unix {
  UI_DIR = .ui
  MOC_DIR = .moc
  OBJECTS_DIR = .obj
}




