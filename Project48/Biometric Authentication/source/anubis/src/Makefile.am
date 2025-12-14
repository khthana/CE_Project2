## Process this file with automake to produce Makefile.in

SUBDIRS = \
	csu

main_sources = \
	anubisrecog.c \
	anubissampling.c \
	gaborrg_recog.c \
	gaborrg_recog_file_io_test.c \
	discriminator_test.c \
	kd_tree_test.c \
	gaborrg_maker_ebgm_test.c \
	gaborrg_recog_jet_file_io_test.c \
	anubissaver.c \
	anubisfacesampling.c

other_sources= \
	anubis_common.h \
	anubis_common.c \
	gaborrg_recog.h \
	gaborrg_recog_gui.h \
	gaborrg_recog_gui.c \
	recog_by_gabor.c \
	recog_by_gabor.h \
	gaborrg_recog_file_io.c \
	gaborrg_recog_file_io.h \
	discriminator.h \
	discriminator.c \
	kd_tree.h \
	kd_tree.c \
	recog_by_ebgm.h \
	recog_by_ebgm.c \
	gaborrg_maker_file_io.c \
	gaborrg_maker_file_io.h \
	gaborrg_maker_file_io_gui.c \
	gaborrg_maker_file_io_gui.h \
	gaborrg_maker_gui.c \
	gaborrg_maker_gui.h \
	gaborrg_maker_ebgm.h \
	gaborrg_maker_ebgm.c \
	node_data.c \
	node_data.h \
	recog_by_jets.c \
	recog_by_jets.h \
	gaborrg_recog_jet_file_io.c \
	gaborrg_recog_jet_file_io.h \
	anubis_marker.c \
	anubis_marker.h \
	anubis_color_config.c \
	anubis_color_config.h \
	anubis_skin.c \
	anubis_skin.h \
	anubis_cv_snake.c \
	anubis_cv_snake.h \
	anubisrecog_gui.c \
	anubisrecog_gui.h \
	anubis_cv_haar_detect_obj.c \
	anubis_cv_haar_detect_obj.h \
	anubis_cv_capture.c \
	anubis_cv_capture.h \
	anubis_cv_rgb2gray.c \
	anubis_cv_rgb2gray.h \
	anubis_cv_gtkdisplay.c \
	anubis_cv_gtkdisplay.h \
	anubissimple_gui.c \
	anubissimple_gui.h \
	anubis_cv_multi_haar.c \
	anubis_cv_multi_haar.h \
	anubis_toggle_screensaver.c \
	anubis_toggle_screensaver.h \
	anubis_face_graph_measure.c \
	anubis_face_graph_measure.h \
	anubis_marker_filter.h \
	anubisrecog_gui_update.c \
	anubisrecog_gui_update.h \
	anubisfacesampling_gui.c \
	anubisfacesampling_gui.h \
	anubis_haar_data_sampling.c \
	anubis_haar_data_sampling.h \
	anubishaarsampling_gui_with_update.c \
	anubishaarsampling_gui_with_update.h \
	anubis_cv_track.c \
	anubis_cv_track.h \
	anubis_cv_track_with_jet.c \
	anubis_cv_track_with_jet.h \
	anubis_face_parts_detect.c \
	anubis_face_parts_detect.h


common_ldadd = \
	@GTK_LIBS@ \
	@XML_LIBS@ \
	-lmalib \
	-lm \
	-Lcsu \
	-lcsuCommon \
	-lcxcore \
	-lcv \
	-lhighgui \
	-lcvaux

common_ldflags = \
	../glade_gui_src/glade_interface.o \
	../glade_gui_src/glade_callbacks.o \
	../glade_gui_src/glade_support.o

common_cflags = \
	-Wall

INCLUDES = \
	@GTK_CFLAGS@ \
	@XML_CPPFLAGS@ \
	-I/usr/local/include \
	-I/usr/src/linux/drivers/ieee1394 \
	-Icsu

bin_PROGRAMS = \
	anubisrecog \
	anubissampling \
	anubissaver \
	anubisfacesampling \
	anubishaarsampling \
	anubispartsdetect

noinst_PROGRAMS= \
	gaborrg_recog_jet_file_io_test \
	gaborrg_recog_file_io_test \
	discriminator_test \
	kd_tree_test \
	gaborrg_maker_ebgm_test \
	gaborrg_recog \
	anubiscvtracktest



#lib_LTLIBRARIES = anubis_common.la
#anubis_common_la_SOURCES = anubis_common.c
#anubis_common_la_LDFLAGS = -module -avoid-version $(common_ldflags)
#anubis_common_la_LIBADD  = $(common_ldadd)


anubisrecog_SOURCES= \
	$(other_sources) \
	anubisrecog.c

anubisrecog_LDFLAGS = \
	$(common_ldflags)

anubisrecog_LDADD = \
	$(common_ldadd)

anubisrecog_CFLAGS = \
	$(common_cflags)

anubissampling_SOURCES = \
	$(other_sources) \
	anubissampling.c

anubissampling_LDFLAGS = \
	$(common_ldflags)

anubissampling_LDADD = \
	$(common_ldadd)

anubisfacesampling_SOURCES= \
	$(other_sources) \
	anubisfacesampling.c

anubisfacesampling_LDFLAGS = \
	$(common_ldflags)

anubisfacesampling_LDADD = \
	$(common_ldadd)

gaborrg_recog_SOURCES = \
	$(other_sources) \
	gaborrg_recog.c

gaborrg_recog_LDFLAGS = \
	$(common_ldflags)

gaborrg_recog_LDADD = \
	$(common_ldadd)

gaborrg_recog_file_io_test_SOURCES = \
	$(other_sources) \
	gaborrg_recog_file_io_test.c

gaborrg_recog_file_io_test_LDFLAGS = \
	$(common_ldflags)

gaborrg_recog_file_io_test_LDADD = \
	$(common_ldadd)

discriminator_test_SOURCES= \
	$(other_sources) \
	discriminator_test.c

discriminator_test_LDFLAGS = \
	$(common_ldflags)


discriminator_test_LDADD = \
	$(common_ldadd)

kd_tree_test_SOURCES= \
	$(other_sources) \
	kd_tree_test.c

kd_tree_test_LDFLAGS = \
	$(common_ldflags)

kd_tree_test_LDADD = \
	$(common_ldadd)

gaborrg_maker_ebgm_test_SOURCES= \
	$(other_sources) \
	gaborrg_maker_ebgm_test.c

gaborrg_maker_ebgm_test_LDFLAGS = \
	$(common_ldflags)

gaborrg_maker_ebgm_test_LDADD = \
	$(common_ldadd)

gaborrg_recog_jet_file_io_test_SOURCES= \
	$(other_sources) \
	gaborrg_recog_jet_file_io_test.c

gaborrg_recog_jet_file_io_test_LDFLAGS = \
	$(common_ldflags)

gaborrg_recog_jet_file_io_test_LDADD = \
	$(common_ldadd)

anubissaver_SOURCES = \
	$(other_sources) \
	anubissaver.c

anubissaver_LDFLAGS = \
	$(common_ldflags)

anubissaver_LDADD = \
	$(common_ldadd)

anubishaarsampling_SOURCES= \
	$(other_sources) \
	anubishaarsampling.c

anubishaarsampling_LDFLAGS = \
	$(common_ldflags)

anubishaarsampling_LDADD = \
	$(common_ldadd)


anubiscvtracktest_SOURCES= \
	$(other_sources) \
	anubiscvtracktest.c
anubiscvtracktest_LDFLAGS = \
	$(common_ldflags)

anubiscvtracktest_LDADD = \
	$(common_ldadd)

anubispartsdetect_SOURCES= \
	$(other_sources) \
	anubispartsdetect_main.c
anubispartsdetect_LDFLAGS = \
	$(common_ldflags)

anubispartsdetect_LDADD = \
	$(common_ldadd)
