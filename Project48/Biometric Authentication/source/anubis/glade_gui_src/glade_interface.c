/*
 * 編集禁止! - このファイルはGladeによって生成されています.
 */

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>

#include <gdk/gdkkeysyms.h>
#include <gtk/gtk.h>

#include "glade_callbacks.h"
#include "glade_interface.h"
#include "glade_support.h"

GtkWidget*
create_gaborrg_recog_window (void)
{
  GtkWidget *gaborrg_recog_window;
  GtkWidget *fixed1;
  GtkWidget *viewport1;
  GtkWidget *drawingarea1;
  GtkWidget *dummy_pixmap;
  GtkWidget *statusbar1;
  GtkWidget *control_scrolledwindow;
  GtkWidget *viewport2;
  GtkWidget *fixed2;
  GtkWidget *toggle_running;

  gaborrg_recog_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_object_set_data (GTK_OBJECT (gaborrg_recog_window), "gaborrg_recog_window", gaborrg_recog_window);
  gtk_window_set_title (GTK_WINDOW (gaborrg_recog_window), "gaborrg_recog");

  fixed1 = gtk_fixed_new ();
  gtk_widget_ref (fixed1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "fixed1", fixed1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed1);
  gtk_container_add (GTK_CONTAINER (gaborrg_recog_window), fixed1);

  viewport1 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "viewport1", viewport1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport1);
  gtk_fixed_put (GTK_FIXED (fixed1), viewport1, 0, 0);
  gtk_widget_set_uposition (viewport1, 0, 0);
  gtk_widget_set_usize (viewport1, 320, 240);

  drawingarea1 = gtk_drawing_area_new ();
  gtk_widget_ref (drawingarea1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "drawingarea1", drawingarea1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (drawingarea1);
  gtk_fixed_put (GTK_FIXED (fixed1), drawingarea1, 0, 368);
  gtk_widget_set_uposition (drawingarea1, 0, 368);
  gtk_widget_set_usize (drawingarea1, 50, 50);

  dummy_pixmap = create_pixmap (gaborrg_recog_window, "indicate_dummy_10.xpm");
  gtk_widget_ref (dummy_pixmap);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "dummy_pixmap", dummy_pixmap,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (dummy_pixmap);
  gtk_fixed_put (GTK_FIXED (fixed1), dummy_pixmap, 56, 392);
  gtk_widget_set_uposition (dummy_pixmap, 56, 392);
  gtk_widget_set_usize (dummy_pixmap, 21, 21);

  statusbar1 = gtk_statusbar_new ();
  gtk_widget_ref (statusbar1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "statusbar1", statusbar1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (statusbar1);
  gtk_fixed_put (GTK_FIXED (fixed1), statusbar1, 0, 440);
  gtk_widget_set_uposition (statusbar1, 0, 440);
  gtk_widget_set_usize (statusbar1, 496, 32);

  control_scrolledwindow = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (control_scrolledwindow);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "control_scrolledwindow", control_scrolledwindow,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (control_scrolledwindow);
  gtk_fixed_put (GTK_FIXED (fixed1), control_scrolledwindow, 320, 0);
  gtk_widget_set_uposition (control_scrolledwindow, 320, 0);
  gtk_widget_set_usize (control_scrolledwindow, 174, 442);

  viewport2 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport2);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "viewport2", viewport2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport2);
  gtk_container_add (GTK_CONTAINER (control_scrolledwindow), viewport2);

  fixed2 = gtk_fixed_new ();
  gtk_widget_ref (fixed2);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "fixed2", fixed2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed2);
  gtk_container_add (GTK_CONTAINER (viewport2), fixed2);

  toggle_running = gtk_button_new_with_label ("start and stop");
  gtk_widget_ref (toggle_running);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_recog_window), "toggle_running", toggle_running,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (toggle_running);
  gtk_fixed_put (GTK_FIXED (fixed2), toggle_running, 24, 24);
  gtk_widget_set_uposition (toggle_running, 24, 24);
  gtk_widget_set_usize (toggle_running, 120, 32);

  gtk_signal_connect (GTK_OBJECT (toggle_running), "clicked",
                      GTK_SIGNAL_FUNC (dummy_on_toggle_running_clicked),
                      NULL);

  return gaborrg_recog_window;
}

GtkWidget*
create_gaborrg_maker_window (void)
{
  GtkWidget *gaborrg_maker_window;
  GtkWidget *fixed1;
  GtkWidget *viewport2;
  GtkWidget *drawingarea1;
  GtkWidget *pixmap1;
  GtkWidget *statusbar1;
  GtkWidget *scrolledwindow1;
  GtkWidget *viewport1;
  GtkWidget *fixed2;
  GtkWidget *file_io_scrolledwindow;
  GtkWidget *viewport3;
  GtkWidget *file_io_fixed;
  GtkWidget *output_file_entry;
  GtkWidget *output_file_browse;
  GtkWidget *data_output_button;
  GtkWidget *data_type_enter_button;
  GtkWidget *data_type_title;
  GtkWidget *data_output;
  GtkWidget *output_file_name_label1;
  GSList *data_type_radio_group = NULL;
  GtkWidget *data_type_rbu_jet;
  GtkWidget *label22;
  GtkWidget *label23;

  gaborrg_maker_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_object_set_data (GTK_OBJECT (gaborrg_maker_window), "gaborrg_maker_window", gaborrg_maker_window);
  gtk_window_set_title (GTK_WINDOW (gaborrg_maker_window), "gaborrg_maker");

  fixed1 = gtk_fixed_new ();
  gtk_widget_ref (fixed1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "fixed1", fixed1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed1);
  gtk_container_add (GTK_CONTAINER (gaborrg_maker_window), fixed1);

  viewport2 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport2);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "viewport2", viewport2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport2);
  gtk_fixed_put (GTK_FIXED (fixed1), viewport2, 0, 0);
  gtk_widget_set_uposition (viewport2, 0, 0);
  gtk_widget_set_usize (viewport2, 320, 260);

  drawingarea1 = gtk_drawing_area_new ();
  gtk_widget_ref (drawingarea1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "drawingarea1", drawingarea1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (drawingarea1);
  gtk_container_add (GTK_CONTAINER (viewport2), drawingarea1);

  pixmap1 = create_pixmap (gaborrg_maker_window, "indicate_dummy_10.xpm");
  gtk_widget_ref (pixmap1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "pixmap1", pixmap1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (pixmap1);
  gtk_fixed_put (GTK_FIXED (fixed1), pixmap1, 16, 328);
  gtk_widget_set_uposition (pixmap1, 16, 328);
  gtk_widget_set_usize (pixmap1, 21, 21);

  statusbar1 = gtk_statusbar_new ();
  gtk_widget_ref (statusbar1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "statusbar1", statusbar1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (statusbar1);
  gtk_fixed_put (GTK_FIXED (fixed1), statusbar1, 0, 544);
  gtk_widget_set_uposition (statusbar1, 0, 544);
  gtk_widget_set_usize (statusbar1, 528, 25);

  scrolledwindow1 = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (scrolledwindow1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "scrolledwindow1", scrolledwindow1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scrolledwindow1);
  gtk_fixed_put (GTK_FIXED (fixed1), scrolledwindow1, 320, 0);
  gtk_widget_set_uposition (scrolledwindow1, 320, 0);
  gtk_widget_set_usize (scrolledwindow1, 200, 300);

  viewport1 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "viewport1", viewport1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport1);
  gtk_container_add (GTK_CONTAINER (scrolledwindow1), viewport1);

  fixed2 = gtk_fixed_new ();
  gtk_widget_ref (fixed2);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "fixed2", fixed2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed2);
  gtk_container_add (GTK_CONTAINER (viewport1), fixed2);

  file_io_scrolledwindow = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (file_io_scrolledwindow);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "file_io_scrolledwindow", file_io_scrolledwindow,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (file_io_scrolledwindow);
  gtk_fixed_put (GTK_FIXED (fixed1), file_io_scrolledwindow, 320, 304);
  gtk_widget_set_uposition (file_io_scrolledwindow, 320, 304);
  gtk_widget_set_usize (file_io_scrolledwindow, 208, 240);

  viewport3 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport3);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "viewport3", viewport3,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport3);
  gtk_container_add (GTK_CONTAINER (file_io_scrolledwindow), viewport3);

  file_io_fixed = gtk_fixed_new ();
  gtk_widget_ref (file_io_fixed);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "file_io_fixed", file_io_fixed,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (file_io_fixed);
  gtk_container_add (GTK_CONTAINER (viewport3), file_io_fixed);

  output_file_entry = gtk_entry_new ();
  gtk_widget_ref (output_file_entry);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "output_file_entry", output_file_entry,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (output_file_entry);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), output_file_entry, 8, 160);
  gtk_widget_set_uposition (output_file_entry, 8, 160);
  gtk_widget_set_usize (output_file_entry, 150, 24);

  output_file_browse = gtk_button_new_with_label ("BROWSE...");
  gtk_widget_ref (output_file_browse);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "output_file_browse", output_file_browse,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (output_file_browse);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), output_file_browse, 8, 192);
  gtk_widget_set_uposition (output_file_browse, 8, 192);
  gtk_widget_set_usize (output_file_browse, 85, 24);

  data_output_button = gtk_button_new_with_label ("save");
  gtk_widget_ref (data_output_button);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "data_output_button", data_output_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (data_output_button);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), data_output_button, 8, 112);
  gtk_widget_set_uposition (data_output_button, 8, 112);
  gtk_widget_set_usize (data_output_button, 52, 24);

  data_type_enter_button = gtk_button_new_with_label ("enter");
  gtk_widget_ref (data_type_enter_button);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "data_type_enter_button", data_type_enter_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (data_type_enter_button);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), data_type_enter_button, 8, 56);
  gtk_widget_set_uposition (data_type_enter_button, 8, 56);
  gtk_widget_set_usize (data_type_enter_button, 48, 24);

  data_type_title = gtk_label_new ("");
  gtk_label_parse_uline (GTK_LABEL (data_type_title),
                         "data__type");
  gtk_widget_ref (data_type_title);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "data_type_title", data_type_title,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (data_type_title);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), data_type_title, 8, 16);
  gtk_widget_set_uposition (data_type_title, 8, 16);
  gtk_widget_set_usize (data_type_title, 73, 18);

  data_output = gtk_label_new ("buffering data save");
  gtk_widget_ref (data_output);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "data_output", data_output,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (data_output);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), data_output, 0, 88);
  gtk_widget_set_uposition (data_output, 0, 88);
  gtk_widget_set_usize (data_output, 147, 26);

  output_file_name_label1 = gtk_label_new ("data save xml file name");
  gtk_widget_ref (output_file_name_label1);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "output_file_name_label1", output_file_name_label1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (output_file_name_label1);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), output_file_name_label1, 0, 136);
  gtk_widget_set_uposition (output_file_name_label1, 0, 136);
  gtk_widget_set_usize (output_file_name_label1, 171, 20);
  gtk_label_set_justify (GTK_LABEL (output_file_name_label1), GTK_JUSTIFY_LEFT);

  data_type_rbu_jet = gtk_radio_button_new_with_label (data_type_radio_group, "jet");
  data_type_radio_group = gtk_radio_button_group (GTK_RADIO_BUTTON (data_type_rbu_jet));
  gtk_widget_ref (data_type_rbu_jet);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "data_type_rbu_jet", data_type_rbu_jet,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (data_type_rbu_jet);
  gtk_fixed_put (GTK_FIXED (file_io_fixed), data_type_rbu_jet, 8, 32);
  gtk_widget_set_uposition (data_type_rbu_jet, 8, 32);
  gtk_widget_set_usize (data_type_rbu_jet, 102, 26);
  gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (data_type_rbu_jet), TRUE);

  label22 = gtk_label_new ("left");
  gtk_widget_ref (label22);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "label22", label22,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label22);
  gtk_fixed_put (GTK_FIXED (fixed1), label22, 8, 264);
  gtk_widget_set_uposition (label22, 8, 264);
  gtk_widget_set_usize (label22, 45, 18);

  label23 = gtk_label_new ("right");
  gtk_widget_ref (label23);
  gtk_object_set_data_full (GTK_OBJECT (gaborrg_maker_window), "label23", label23,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label23);
  gtk_fixed_put (GTK_FIXED (fixed1), label23, 264, 264);
  gtk_widget_set_uposition (label23, 264, 264);
  gtk_widget_set_usize (label23, 45, 18);

  gtk_signal_connect (GTK_OBJECT (output_file_browse), "clicked",
                      GTK_SIGNAL_FUNC (on_output_file_browse_clicked_dummy),
                      NULL);
  gtk_signal_connect (GTK_OBJECT (data_output_button), "clicked",
                      GTK_SIGNAL_FUNC (on_data_output_button_clicked_dummy),
                      NULL);
  gtk_signal_connect (GTK_OBJECT (data_type_enter_button), "clicked",
                      GTK_SIGNAL_FUNC (on_data_type_enter_button_clicked_dummy),
                      NULL);
  gtk_signal_connect (GTK_OBJECT (data_type_rbu_jet), "clicked",
                      GTK_SIGNAL_FUNC (on_data_type_rbu_jet_clicked_dummy),
                      NULL);

  return gaborrg_maker_window;
}

GtkWidget*
create_output_fileselection (void)
{
  GtkWidget *output_fileselection;
  GtkWidget *ok_button1;
  GtkWidget *cancel_button1;

  output_fileselection = gtk_file_selection_new ("\245\325\245\241\245\244\245\353\301\252\302\362");
  gtk_object_set_data (GTK_OBJECT (output_fileselection), "output_fileselection", output_fileselection);
  gtk_container_set_border_width (GTK_CONTAINER (output_fileselection), 10);

  ok_button1 = GTK_FILE_SELECTION (output_fileselection)->ok_button;
  gtk_object_set_data (GTK_OBJECT (output_fileselection), "ok_button1", ok_button1);
  gtk_widget_show (ok_button1);
  GTK_WIDGET_SET_FLAGS (ok_button1, GTK_CAN_DEFAULT);

  cancel_button1 = GTK_FILE_SELECTION (output_fileselection)->cancel_button;
  gtk_object_set_data (GTK_OBJECT (output_fileselection), "cancel_button1", cancel_button1);
  gtk_widget_show (cancel_button1);
  GTK_WIDGET_SET_FLAGS (cancel_button1, GTK_CAN_DEFAULT);

  gtk_signal_connect (GTK_OBJECT (ok_button1), "clicked",
                      GTK_SIGNAL_FUNC (on_output_fileselection_ok_clicked_dummy),
                      NULL);
  gtk_signal_connect (GTK_OBJECT (cancel_button1), "clicked",
                      GTK_SIGNAL_FUNC (on_output_fileselection_cancel_clicked_dummy),
                      NULL);

  return output_fileselection;
}

GtkWidget*
create_anubisrecog_window (void)
{
  GtkWidget *anubisrecog_window;
  GtkWidget *anubisrecog_main_fixed;
  GtkWidget *anubisrecog_main_viewport;
  GtkWidget *pixmap2;
  GtkWidget *anubisrecog_statusbar;
  GtkWidget *anubisrecog_scrolledwindow;
  GtkWidget *viewport5;
  GtkWidget *scroll_window_fixed;
  GtkWidget *toggle_running_button;
  GtkWidget *hseparator3;
  GtkWidget *label18;
  GtkWidget *label7;
  GtkWidget *label4;
  GtkWidget *last_name_label;
  GtkWidget *viewport11;
  GtkWidget *fixed9;
  GtkWidget *label21;
  GtkWidget *label19;
  GtkWidget *hseparator5;
  GtkWidget *current_sim_jet_value_label;
  GtkWidget *current_sim_geo_value_label;
  GtkWidget *frame1;
  GtkWidget *fixed8;
  GtkWidget *hseparator2;
  GtkWidget *label16;
  GtkWidget *label14;
  GtkWidget *current_similar_value_label;
  GtkWidget *current_name_label;
  GtkWidget *label13;
  GtkWidget *hseparator4;
  GtkWidget *name_detect_indicator_pix;
  GtkWidget *face_detect_indicator_pix;
  GtkWidget *name_threshold_h_scale;

  anubisrecog_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_object_set_data (GTK_OBJECT (anubisrecog_window), "anubisrecog_window", anubisrecog_window);
  gtk_window_set_title (GTK_WINDOW (anubisrecog_window), "anubisrecog");

  anubisrecog_main_fixed = gtk_fixed_new ();
  gtk_widget_ref (anubisrecog_main_fixed);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "anubisrecog_main_fixed", anubisrecog_main_fixed,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubisrecog_main_fixed);
  gtk_container_add (GTK_CONTAINER (anubisrecog_window), anubisrecog_main_fixed);

  anubisrecog_main_viewport = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (anubisrecog_main_viewport);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "anubisrecog_main_viewport", anubisrecog_main_viewport,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubisrecog_main_viewport);
  gtk_fixed_put (GTK_FIXED (anubisrecog_main_fixed), anubisrecog_main_viewport, 0, 0);
  gtk_widget_set_uposition (anubisrecog_main_viewport, 0, 0);
  gtk_widget_set_usize (anubisrecog_main_viewport, 320, 240);

  pixmap2 = create_pixmap (anubisrecog_window, "indicate_dummy_10.xpm");
  gtk_widget_ref (pixmap2);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "pixmap2", pixmap2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (pixmap2);
  gtk_fixed_put (GTK_FIXED (anubisrecog_main_fixed), pixmap2, 56, 392);
  gtk_widget_set_uposition (pixmap2, 56, 392);
  gtk_widget_set_usize (pixmap2, 21, 21);

  anubisrecog_statusbar = gtk_statusbar_new ();
  gtk_widget_ref (anubisrecog_statusbar);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "anubisrecog_statusbar", anubisrecog_statusbar,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubisrecog_statusbar);
  gtk_fixed_put (GTK_FIXED (anubisrecog_main_fixed), anubisrecog_statusbar, 0, 440);
  gtk_widget_set_uposition (anubisrecog_statusbar, 0, 440);
  gtk_widget_set_usize (anubisrecog_statusbar, 520, 32);

  anubisrecog_scrolledwindow = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (anubisrecog_scrolledwindow);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "anubisrecog_scrolledwindow", anubisrecog_scrolledwindow,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubisrecog_scrolledwindow);
  gtk_fixed_put (GTK_FIXED (anubisrecog_main_fixed), anubisrecog_scrolledwindow, 320, 0);
  gtk_widget_set_uposition (anubisrecog_scrolledwindow, 320, 0);
  gtk_widget_set_usize (anubisrecog_scrolledwindow, 200, 440);

  viewport5 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport5);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "viewport5", viewport5,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport5);
  gtk_container_add (GTK_CONTAINER (anubisrecog_scrolledwindow), viewport5);

  scroll_window_fixed = gtk_fixed_new ();
  gtk_widget_ref (scroll_window_fixed);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "scroll_window_fixed", scroll_window_fixed,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scroll_window_fixed);
  gtk_container_add (GTK_CONTAINER (viewport5), scroll_window_fixed);

  toggle_running_button = gtk_button_new_with_label ("start and stop");
  gtk_widget_ref (toggle_running_button);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "toggle_running_button", toggle_running_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (toggle_running_button);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), toggle_running_button, 24, 24);
  gtk_widget_set_uposition (toggle_running_button, 24, 24);
  gtk_widget_set_usize (toggle_running_button, 120, 32);

  hseparator3 = gtk_hseparator_new ();
  gtk_widget_ref (hseparator3);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "hseparator3", hseparator3,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (hseparator3);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), hseparator3, 8, 144);
  gtk_widget_set_uposition (hseparator3, 8, 144);
  gtk_widget_set_usize (hseparator3, 160, 16);

  label18 = gtk_label_new ("last detected name");
  gtk_widget_ref (label18);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label18", label18,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label18);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), label18, 16, 160);
  gtk_widget_set_uposition (label18, 16, 160);
  gtk_widget_set_usize (label18, 141, 18);
  gtk_misc_set_alignment (GTK_MISC (label18), 7.45058e-09, 0.5);

  label7 = gtk_label_new ("name detect");
  gtk_widget_ref (label7);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label7", label7,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label7);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), label7, 16, 112);
  gtk_widget_set_uposition (label7, 16, 112);
  gtk_widget_set_usize (label7, 90, 25);
  gtk_label_set_justify (GTK_LABEL (label7), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label7), 7.45058e-09, 0.5);

  label4 = gtk_label_new ("face detect");
  gtk_widget_ref (label4);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label4", label4,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label4);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), label4, 16, 88);
  gtk_widget_set_uposition (label4, 16, 88);
  gtk_widget_set_usize (label4, 80, 25);
  gtk_label_set_justify (GTK_LABEL (label4), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label4), 7.45058e-09, 0.5);

  last_name_label = gtk_label_new ("none");
  gtk_widget_ref (last_name_label);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "last_name_label", last_name_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (last_name_label);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), last_name_label, 16, 184);
  gtk_widget_set_uposition (last_name_label, 16, 184);
  gtk_widget_set_usize (last_name_label, 160, 18);
  gtk_misc_set_alignment (GTK_MISC (last_name_label), 7.45058e-09, 0.5);

  viewport11 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport11);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "viewport11", viewport11,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport11);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), viewport11, 0, 442);
  gtk_widget_set_uposition (viewport11, 0, 442);
  gtk_widget_set_usize (viewport11, 194, 142);
  gtk_viewport_set_shadow_type (GTK_VIEWPORT (viewport11), GTK_SHADOW_NONE);

  fixed9 = gtk_fixed_new ();
  gtk_widget_ref (fixed9);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "fixed9", fixed9,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed9);
  gtk_container_add (GTK_CONTAINER (viewport11), fixed9);

  label21 = gtk_label_new ("geometory similarity value");
  gtk_widget_ref (label21);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label21", label21,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label21);
  gtk_fixed_put (GTK_FIXED (fixed9), label21, 16, 72);
  gtk_widget_set_uposition (label21, 16, 72);
  gtk_widget_set_usize (label21, 187, 18);
  gtk_misc_set_alignment (GTK_MISC (label21), 0, 0.5);

  label19 = gtk_label_new ("jet similarity value");
  gtk_widget_ref (label19);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label19", label19,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label19);
  gtk_fixed_put (GTK_FIXED (fixed9), label19, 16, 8);
  gtk_widget_set_uposition (label19, 16, 8);
  gtk_widget_set_usize (label19, 149, 18);
  gtk_misc_set_alignment (GTK_MISC (label19), 0, 0.5);

  hseparator5 = gtk_hseparator_new ();
  gtk_widget_ref (hseparator5);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "hseparator5", hseparator5,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (hseparator5);
  gtk_fixed_put (GTK_FIXED (fixed9), hseparator5, 0, 56);
  gtk_widget_set_uposition (hseparator5, 0, 56);
  gtk_widget_set_usize (hseparator5, 176, 16);

  current_sim_jet_value_label = gtk_label_new ("0.0");
  gtk_widget_ref (current_sim_jet_value_label);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "current_sim_jet_value_label", current_sim_jet_value_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_sim_jet_value_label);
  gtk_fixed_put (GTK_FIXED (fixed9), current_sim_jet_value_label, 16, 32);
  gtk_widget_set_uposition (current_sim_jet_value_label, 16, 32);
  gtk_widget_set_usize (current_sim_jet_value_label, 137, 18);
  gtk_misc_set_alignment (GTK_MISC (current_sim_jet_value_label), 0, 0.5);

  current_sim_geo_value_label = gtk_label_new ("0.0");
  gtk_widget_ref (current_sim_geo_value_label);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "current_sim_geo_value_label", current_sim_geo_value_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_sim_geo_value_label);
  gtk_fixed_put (GTK_FIXED (fixed9), current_sim_geo_value_label, 16, 96);
  gtk_widget_set_uposition (current_sim_geo_value_label, 16, 96);
  gtk_widget_set_usize (current_sim_geo_value_label, 155, 18);
  gtk_misc_set_alignment (GTK_MISC (current_sim_geo_value_label), 0, 0.5);

  frame1 = gtk_frame_new (NULL);
  gtk_widget_ref (frame1);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "frame1", frame1,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (frame1);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), frame1, 0, 312);
  gtk_widget_set_uposition (frame1, 0, 312);
  gtk_widget_set_usize (frame1, 184, 106);
  gtk_frame_set_shadow_type (GTK_FRAME (frame1), GTK_SHADOW_NONE);

  fixed8 = gtk_fixed_new ();
  gtk_widget_ref (fixed8);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "fixed8", fixed8,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed8);
  gtk_container_add (GTK_CONTAINER (frame1), fixed8);

  hseparator2 = gtk_hseparator_new ();
  gtk_widget_ref (hseparator2);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "hseparator2", hseparator2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (hseparator2);
  gtk_fixed_put (GTK_FIXED (fixed8), hseparator2, 0, 40);
  gtk_widget_set_uposition (hseparator2, 0, 40);
  gtk_widget_set_usize (hseparator2, 177, 16);

  label16 = gtk_label_new ("current similarity value");
  gtk_widget_ref (label16);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label16", label16,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label16);
  gtk_fixed_put (GTK_FIXED (fixed8), label16, 16, 56);
  gtk_widget_set_uposition (label16, 16, 56);
  gtk_widget_set_usize (label16, 155, 16);
  gtk_misc_set_alignment (GTK_MISC (label16), 7.45058e-09, 0.5);

  label14 = gtk_label_new ("current name");
  gtk_widget_ref (label14);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label14", label14,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label14);
  gtk_fixed_put (GTK_FIXED (fixed8), label14, 16, 0);
  gtk_widget_set_uposition (label14, 16, 0);
  gtk_widget_set_usize (label14, 100, 18);
  gtk_misc_set_alignment (GTK_MISC (label14), 7.45058e-09, 0.5);

  current_similar_value_label = gtk_label_new ("0.00");
  gtk_widget_ref (current_similar_value_label);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "current_similar_value_label", current_similar_value_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_similar_value_label);
  gtk_fixed_put (GTK_FIXED (fixed8), current_similar_value_label, 16, 72);
  gtk_widget_set_uposition (current_similar_value_label, 16, 72);
  gtk_widget_set_usize (current_similar_value_label, 90, 18);
  gtk_misc_set_alignment (GTK_MISC (current_similar_value_label), 7.45058e-09, 0.5);

  current_name_label = gtk_label_new ("none");
  gtk_widget_ref (current_name_label);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "current_name_label", current_name_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_name_label);
  gtk_fixed_put (GTK_FIXED (fixed8), current_name_label, 16, 16);
  gtk_widget_set_uposition (current_name_label, 16, 16);
  gtk_widget_set_usize (current_name_label, 160, 18);
  gtk_misc_set_alignment (GTK_MISC (current_name_label), 7.45058e-09, 0.5);

  label13 = gtk_label_new ("name detect threshold\nsimilarity value");
  gtk_widget_ref (label13);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "label13", label13,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label13);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), label13, 16, 216);
  gtk_widget_set_uposition (label13, 16, 216);
  gtk_widget_set_usize (label13, 161, 35);
  gtk_label_set_justify (GTK_LABEL (label13), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label13), 7.45058e-09, 7.45058e-09);

  hseparator4 = gtk_hseparator_new ();
  gtk_widget_ref (hseparator4);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "hseparator4", hseparator4,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (hseparator4);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), hseparator4, 0, 420);
  gtk_widget_set_uposition (hseparator4, 0, 420);
  gtk_widget_set_usize (hseparator4, 177, 16);

  name_detect_indicator_pix = create_pixmap (anubisrecog_window, "indicate_circle_blue_20.xpm");
  gtk_widget_ref (name_detect_indicator_pix);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "name_detect_indicator_pix", name_detect_indicator_pix,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (name_detect_indicator_pix);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), name_detect_indicator_pix, 112, 112);
  gtk_widget_set_uposition (name_detect_indicator_pix, 112, 112);
  gtk_widget_set_usize (name_detect_indicator_pix, 21, 21);

  face_detect_indicator_pix = create_pixmap (anubisrecog_window, "indicate_circle_red_20.xpm");
  gtk_widget_ref (face_detect_indicator_pix);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "face_detect_indicator_pix", face_detect_indicator_pix,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (face_detect_indicator_pix);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), face_detect_indicator_pix, 112, 88);
  gtk_widget_set_uposition (face_detect_indicator_pix, 112, 88);
  gtk_widget_set_usize (face_detect_indicator_pix, 21, 21);

  name_threshold_h_scale = gtk_hscale_new (GTK_ADJUSTMENT (gtk_adjustment_new (0.7, 0, 1, 0, 0, 0)));
  gtk_widget_ref (name_threshold_h_scale);
  gtk_object_set_data_full (GTK_OBJECT (anubisrecog_window), "name_threshold_h_scale", name_threshold_h_scale,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (name_threshold_h_scale);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), name_threshold_h_scale, 16, 256);
  gtk_widget_set_uposition (name_threshold_h_scale, 16, 256);
  gtk_widget_set_usize (name_threshold_h_scale, 128, 31);
  gtk_scale_set_digits (GTK_SCALE (name_threshold_h_scale), 2);

  gtk_signal_connect (GTK_OBJECT (toggle_running_button), "clicked",
                      GTK_SIGNAL_FUNC (dummy_on_toggle_running_clicked),
                      NULL);

  return anubisrecog_window;
}

GtkWidget*
create_anubissimple_window (void)
{
  GtkWidget *anubissimple_window;
  GtkWidget *fixed3;
  GtkWidget *viewport;
  GtkWidget *drawingarea2;
  GtkWidget *pixmap3;
  GtkWidget *scrolledwindow2;
  GtkWidget *viewport7;
  GtkWidget *fixed4;
  GtkWidget *toggle_running;
  GtkWidget *statusbar2;

  anubissimple_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_object_set_data (GTK_OBJECT (anubissimple_window), "anubissimple_window", anubissimple_window);
  gtk_window_set_title (GTK_WINDOW (anubissimple_window), "anubissimple_window");

  fixed3 = gtk_fixed_new ();
  gtk_widget_ref (fixed3);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "fixed3", fixed3,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed3);
  gtk_container_add (GTK_CONTAINER (anubissimple_window), fixed3);

  viewport = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "viewport", viewport,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport);
  gtk_fixed_put (GTK_FIXED (fixed3), viewport, 0, 0);
  gtk_widget_set_uposition (viewport, 0, 0);
  gtk_widget_set_usize (viewport, 320, 240);

  drawingarea2 = gtk_drawing_area_new ();
  gtk_widget_ref (drawingarea2);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "drawingarea2", drawingarea2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (drawingarea2);
  gtk_fixed_put (GTK_FIXED (fixed3), drawingarea2, 0, 368);
  gtk_widget_set_uposition (drawingarea2, 0, 368);
  gtk_widget_set_usize (drawingarea2, 50, 50);

  pixmap3 = create_pixmap (anubissimple_window, "indicate_dummy_10.xpm");
  gtk_widget_ref (pixmap3);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "pixmap3", pixmap3,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (pixmap3);
  gtk_fixed_put (GTK_FIXED (fixed3), pixmap3, 56, 392);
  gtk_widget_set_uposition (pixmap3, 56, 392);
  gtk_widget_set_usize (pixmap3, 21, 21);

  scrolledwindow2 = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (scrolledwindow2);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "scrolledwindow2", scrolledwindow2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scrolledwindow2);
  gtk_fixed_put (GTK_FIXED (fixed3), scrolledwindow2, 320, 0);
  gtk_widget_set_uposition (scrolledwindow2, 320, 0);
  gtk_widget_set_usize (scrolledwindow2, 174, 442);

  viewport7 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport7);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "viewport7", viewport7,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport7);
  gtk_container_add (GTK_CONTAINER (scrolledwindow2), viewport7);

  fixed4 = gtk_fixed_new ();
  gtk_widget_ref (fixed4);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "fixed4", fixed4,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed4);
  gtk_container_add (GTK_CONTAINER (viewport7), fixed4);

  toggle_running = gtk_button_new_with_label ("start and stop");
  gtk_widget_ref (toggle_running);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "toggle_running", toggle_running,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (toggle_running);
  gtk_fixed_put (GTK_FIXED (fixed4), toggle_running, 24, 24);
  gtk_widget_set_uposition (toggle_running, 24, 24);
  gtk_widget_set_usize (toggle_running, 120, 32);

  statusbar2 = gtk_statusbar_new ();
  gtk_widget_ref (statusbar2);
  gtk_object_set_data_full (GTK_OBJECT (anubissimple_window), "statusbar2", statusbar2,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (statusbar2);
  gtk_fixed_put (GTK_FIXED (fixed3), statusbar2, 0, 440);
  gtk_widget_set_uposition (statusbar2, 0, 440);
  gtk_widget_set_usize (statusbar2, 496, 32);

  gtk_signal_connect (GTK_OBJECT (toggle_running), "clicked",
                      GTK_SIGNAL_FUNC (dummy_on_toggle_running_clicked),
                      NULL);

  return anubissimple_window;
}

GtkWidget*
create_anubisfacesampling_window (void)
{
  GtkWidget *anubisfacesampling_window;
  GtkWidget *anubisfacesampling_main_fixed;
  GtkWidget *anubisfacesampling_main_viewport;
  GtkWidget *scrolledwindow3;
  GtkWidget *viewport9;
  GtkWidget *scroll_window_fixed;
  GtkWidget *toggle_running_button;
  GtkWidget *name_entry;
  GtkWidget *label10;
  GtkWidget *label9;
  GtkWidget *pixmap6;
  GtkWidget *enter_button;
  GtkWidget *statusbar3;
  GtkWidget *scrolledwindow4;
  GtkWidget *viewport10;
  GtkWidget *fixed7;
  GtkWidget *save_button;
  GtkWidget *output_file_entry;
  GtkWidget *label11;
  GtkWidget *label12;
  GtkWidget *pixmap4;

  anubisfacesampling_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_object_set_data (GTK_OBJECT (anubisfacesampling_window), "anubisfacesampling_window", anubisfacesampling_window);
  gtk_window_set_title (GTK_WINDOW (anubisfacesampling_window), "anubisfacesampling");

  anubisfacesampling_main_fixed = gtk_fixed_new ();
  gtk_widget_ref (anubisfacesampling_main_fixed);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "anubisfacesampling_main_fixed", anubisfacesampling_main_fixed,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubisfacesampling_main_fixed);
  gtk_container_add (GTK_CONTAINER (anubisfacesampling_window), anubisfacesampling_main_fixed);

  anubisfacesampling_main_viewport = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (anubisfacesampling_main_viewport);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "anubisfacesampling_main_viewport", anubisfacesampling_main_viewport,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubisfacesampling_main_viewport);
  gtk_fixed_put (GTK_FIXED (anubisfacesampling_main_fixed), anubisfacesampling_main_viewport, 0, 0);
  gtk_widget_set_uposition (anubisfacesampling_main_viewport, 0, 0);
  gtk_widget_set_usize (anubisfacesampling_main_viewport, 320, 240);

  scrolledwindow3 = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (scrolledwindow3);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "scrolledwindow3", scrolledwindow3,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scrolledwindow3);
  gtk_fixed_put (GTK_FIXED (anubisfacesampling_main_fixed), scrolledwindow3, 320, 0);
  gtk_widget_set_uposition (scrolledwindow3, 320, 0);
  gtk_widget_set_usize (scrolledwindow3, 200, 306);

  viewport9 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport9);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "viewport9", viewport9,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport9);
  gtk_container_add (GTK_CONTAINER (scrolledwindow3), viewport9);

  scroll_window_fixed = gtk_fixed_new ();
  gtk_widget_ref (scroll_window_fixed);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "scroll_window_fixed", scroll_window_fixed,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scroll_window_fixed);
  gtk_container_add (GTK_CONTAINER (viewport9), scroll_window_fixed);

  toggle_running_button = gtk_button_new_with_label ("start and stop");
  gtk_widget_ref (toggle_running_button);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "toggle_running_button", toggle_running_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (toggle_running_button);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), toggle_running_button, 24, 24);
  gtk_widget_set_uposition (toggle_running_button, 24, 24);
  gtk_widget_set_usize (toggle_running_button, 120, 32);

  name_entry = gtk_entry_new ();
  gtk_widget_ref (name_entry);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "name_entry", name_entry,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (name_entry);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), name_entry, 8, 104);
  gtk_widget_set_uposition (name_entry, 8, 104);
  gtk_widget_set_usize (name_entry, 158, 24);

  label10 = gtk_label_new ("name entry");
  gtk_widget_ref (label10);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "label10", label10,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label10);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), label10, 8, 80);
  gtk_widget_set_uposition (label10, 8, 80);
  gtk_widget_set_usize (label10, 117, 18);
  gtk_label_set_justify (GTK_LABEL (label10), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label10), 7.45058e-09, 0.5);

  label9 = gtk_label_new ("face detect");
  gtk_widget_ref (label9);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "label9", label9,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label9);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), label9, 16, 224);
  gtk_widget_set_uposition (label9, 16, 224);
  gtk_widget_set_usize (label9, 80, 25);
  gtk_label_set_justify (GTK_LABEL (label9), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label9), 7.45058e-09, 0.5);

  pixmap6 = create_pixmap (anubisfacesampling_window, "indicate_circle_red_20.xpm");
  gtk_widget_ref (pixmap6);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "pixmap6", pixmap6,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (pixmap6);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), pixmap6, 112, 224);
  gtk_widget_set_uposition (pixmap6, 112, 224);
  gtk_widget_set_usize (pixmap6, 21, 21);

  enter_button = gtk_button_new_with_label ("Enter");
  gtk_widget_ref (enter_button);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "enter_button", enter_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (enter_button);
  gtk_fixed_put (GTK_FIXED (scroll_window_fixed), enter_button, 8, 136);
  gtk_widget_set_uposition (enter_button, 8, 136);
  gtk_widget_set_usize (enter_button, 52, 24);

  statusbar3 = gtk_statusbar_new ();
  gtk_widget_ref (statusbar3);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "statusbar3", statusbar3,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (statusbar3);
  gtk_fixed_put (GTK_FIXED (anubisfacesampling_main_fixed), statusbar3, 320, 308);
  gtk_widget_set_uposition (statusbar3, 320, 308);
  gtk_widget_set_usize (statusbar3, 184, 148);

  scrolledwindow4 = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (scrolledwindow4);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "scrolledwindow4", scrolledwindow4,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scrolledwindow4);
  gtk_fixed_put (GTK_FIXED (anubisfacesampling_main_fixed), scrolledwindow4, 320, 304);
  gtk_widget_set_uposition (scrolledwindow4, 320, 304);
  gtk_widget_set_usize (scrolledwindow4, 200, 200);

  viewport10 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport10);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "viewport10", viewport10,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport10);
  gtk_container_add (GTK_CONTAINER (scrolledwindow4), viewport10);

  fixed7 = gtk_fixed_new ();
  gtk_widget_ref (fixed7);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "fixed7", fixed7,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed7);
  gtk_container_add (GTK_CONTAINER (viewport10), fixed7);

  save_button = gtk_button_new_with_label ("save");
  gtk_widget_ref (save_button);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "save_button", save_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (save_button);
  gtk_fixed_put (GTK_FIXED (fixed7), save_button, 16, 48);
  gtk_widget_set_uposition (save_button, 16, 48);
  gtk_widget_set_usize (save_button, 52, 24);

  output_file_entry = gtk_entry_new ();
  gtk_widget_ref (output_file_entry);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "output_file_entry", output_file_entry,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (output_file_entry);
  gtk_fixed_put (GTK_FIXED (fixed7), output_file_entry, 16, 96);
  gtk_widget_set_uposition (output_file_entry, 16, 96);
  gtk_widget_set_usize (output_file_entry, 158, 24);
  gtk_entry_set_text (GTK_ENTRY (output_file_entry), "face_jet.xml");

  label11 = gtk_label_new ("buffering data save");
  gtk_widget_ref (label11);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "label11", label11,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label11);
  gtk_fixed_put (GTK_FIXED (fixed7), label11, 0, 24);
  gtk_widget_set_uposition (label11, 0, 24);
  gtk_widget_set_usize (label11, 147, 26);

  label12 = gtk_label_new ("data save xml file name");
  gtk_widget_ref (label12);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "label12", label12,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label12);
  gtk_fixed_put (GTK_FIXED (fixed7), label12, 0, 76);
  gtk_widget_set_uposition (label12, 0, 76);
  gtk_widget_set_usize (label12, 171, 20);
  gtk_label_set_justify (GTK_LABEL (label12), GTK_JUSTIFY_LEFT);

  pixmap4 = create_pixmap (anubisfacesampling_window, "indicate_dummy_10.xpm");
  gtk_widget_ref (pixmap4);
  gtk_object_set_data_full (GTK_OBJECT (anubisfacesampling_window), "pixmap4", pixmap4,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (pixmap4);
  gtk_fixed_put (GTK_FIXED (anubisfacesampling_main_fixed), pixmap4, 56, 392);
  gtk_widget_set_uposition (pixmap4, 56, 392);
  gtk_widget_set_usize (pixmap4, 21, 21);

  gtk_signal_connect (GTK_OBJECT (toggle_running_button), "clicked",
                      GTK_SIGNAL_FUNC (dummy_on_toggle_running_clicked),
                      NULL);

  return anubisfacesampling_window;
}

GtkWidget*
create_anubishaarsampling_window (void)
{
  GtkWidget *anubishaarsampling_window;
  GtkWidget *fixed10;
  GtkWidget *anubishaarsampling_main_viewport;
  GtkWidget *pixmap7;
  GtkWidget *statusbar4;
  GtkWidget *scrolledwindow6;
  GtkWidget *viewport14;
  GtkWidget *fixed14;
  GtkWidget *toggle_running_button;
  GtkWidget *label26;
  GtkWidget *face_graph_ok_indicator_pix;
  GtkWidget *face_detect_indicator_pix;
  GtkWidget *save_button;
  GtkWidget *output_file_entry;
  GtkWidget *label37;
  GtkWidget *hseparator9;
  GtkWidget *current_sim_geo_value_label;
  GtkWidget *face_graph_threshold_h_scale;
  GtkWidget *label25;
  GtkWidget *current_track_sim_value_label;
  GtkWidget *tracking_threshold_similarity_value_label38;
  GtkWidget *tracking_threshold_hscale;
  GtkWidget *current_geo_similar_value_title_label;
  GtkWidget *label39;
  GtkWidget *hseparator6;
  GtkWidget *correct_frames_label;
  GtkWidget *label36;
  GtkWidget *correct_frames_enter_button;
  GtkWidget *correct_frames_title_label;
  GtkWidget *correct_frames_clear_button;
  GtkWidget *label40;
  GtkWidget *output_dir_entry;

  anubishaarsampling_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_object_set_data (GTK_OBJECT (anubishaarsampling_window), "anubishaarsampling_window", anubishaarsampling_window);
  gtk_window_set_title (GTK_WINDOW (anubishaarsampling_window), "anubishaarsampling");

  fixed10 = gtk_fixed_new ();
  gtk_widget_ref (fixed10);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "fixed10", fixed10,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed10);
  gtk_container_add (GTK_CONTAINER (anubishaarsampling_window), fixed10);

  anubishaarsampling_main_viewport = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (anubishaarsampling_main_viewport);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "anubishaarsampling_main_viewport", anubishaarsampling_main_viewport,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (anubishaarsampling_main_viewport);
  gtk_fixed_put (GTK_FIXED (fixed10), anubishaarsampling_main_viewport, 0, 0);
  gtk_widget_set_uposition (anubishaarsampling_main_viewport, 0, 0);
  gtk_widget_set_usize (anubishaarsampling_main_viewport, 320, 240);

  pixmap7 = create_pixmap (anubishaarsampling_window, "indicate_dummy_10.xpm");
  gtk_widget_ref (pixmap7);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "pixmap7", pixmap7,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (pixmap7);
  gtk_fixed_put (GTK_FIXED (fixed10), pixmap7, 56, 392);
  gtk_widget_set_uposition (pixmap7, 56, 392);
  gtk_widget_set_usize (pixmap7, 21, 21);

  statusbar4 = gtk_statusbar_new ();
  gtk_widget_ref (statusbar4);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "statusbar4", statusbar4,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (statusbar4);
  gtk_fixed_put (GTK_FIXED (fixed10), statusbar4, 0, 440);
  gtk_widget_set_uposition (statusbar4, 0, 440);
  gtk_widget_set_usize (statusbar4, 520, 32);

  scrolledwindow6 = gtk_scrolled_window_new (NULL, NULL);
  gtk_widget_ref (scrolledwindow6);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "scrolledwindow6", scrolledwindow6,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (scrolledwindow6);
  gtk_fixed_put (GTK_FIXED (fixed10), scrolledwindow6, 320, 0);
  gtk_widget_set_uposition (scrolledwindow6, 320, 0);
  gtk_widget_set_usize (scrolledwindow6, 192, 440);
  gtk_container_set_border_width (GTK_CONTAINER (scrolledwindow6), 2);

  viewport14 = gtk_viewport_new (NULL, NULL);
  gtk_widget_ref (viewport14);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "viewport14", viewport14,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (viewport14);
  gtk_container_add (GTK_CONTAINER (scrolledwindow6), viewport14);

  fixed14 = gtk_fixed_new ();
  gtk_widget_ref (fixed14);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "fixed14", fixed14,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (fixed14);
  gtk_container_add (GTK_CONTAINER (viewport14), fixed14);

  toggle_running_button = gtk_button_new_with_label ("start and stop");
  gtk_widget_ref (toggle_running_button);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "toggle_running_button", toggle_running_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (toggle_running_button);
  gtk_fixed_put (GTK_FIXED (fixed14), toggle_running_button, 24, 24);
  gtk_widget_set_uposition (toggle_running_button, 24, 24);
  gtk_widget_set_usize (toggle_running_button, 120, 32);

  label26 = gtk_label_new ("face detect");
  gtk_widget_ref (label26);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "label26", label26,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label26);
  gtk_fixed_put (GTK_FIXED (fixed14), label26, 8, 64);
  gtk_widget_set_uposition (label26, 8, 64);
  gtk_widget_set_usize (label26, 80, 25);
  gtk_label_set_justify (GTK_LABEL (label26), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label26), 7.45058e-09, 0.5);

  face_graph_ok_indicator_pix = create_pixmap (anubishaarsampling_window, "indicate_circle_blue_20.xpm");
  gtk_widget_ref (face_graph_ok_indicator_pix);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "face_graph_ok_indicator_pix", face_graph_ok_indicator_pix,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (face_graph_ok_indicator_pix);
  gtk_fixed_put (GTK_FIXED (fixed14), face_graph_ok_indicator_pix, 128, 96);
  gtk_widget_set_uposition (face_graph_ok_indicator_pix, 128, 96);
  gtk_widget_set_usize (face_graph_ok_indicator_pix, 21, 21);

  face_detect_indicator_pix = create_pixmap (anubishaarsampling_window, "indicate_circle_red_20.xpm");
  gtk_widget_ref (face_detect_indicator_pix);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "face_detect_indicator_pix", face_detect_indicator_pix,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (face_detect_indicator_pix);
  gtk_fixed_put (GTK_FIXED (fixed14), face_detect_indicator_pix, 128, 64);
  gtk_widget_set_uposition (face_detect_indicator_pix, 128, 64);
  gtk_widget_set_usize (face_detect_indicator_pix, 21, 21);

  save_button = gtk_button_new_with_label ("save");
  gtk_widget_ref (save_button);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "save_button", save_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (save_button);
  gtk_fixed_put (GTK_FIXED (fixed14), save_button, 8, 688);
  gtk_widget_set_uposition (save_button, 8, 688);
  gtk_widget_set_usize (save_button, 52, 24);

  output_file_entry = gtk_entry_new ();
  gtk_widget_ref (output_file_entry);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "output_file_entry", output_file_entry,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (output_file_entry);
  gtk_fixed_put (GTK_FIXED (fixed14), output_file_entry, 8, 655);
  gtk_widget_set_uposition (output_file_entry, 8, 655);
  gtk_widget_set_usize (output_file_entry, 158, 24);
  gtk_entry_set_text (GTK_ENTRY (output_file_entry), "vertdata.xml");

  label37 = gtk_label_new ("data save xml file name");
  gtk_widget_ref (label37);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "label37", label37,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label37);
  gtk_fixed_put (GTK_FIXED (fixed14), label37, 0, 628);
  gtk_widget_set_uposition (label37, 0, 628);
  gtk_widget_set_usize (label37, 171, 20);
  gtk_label_set_justify (GTK_LABEL (label37), GTK_JUSTIFY_LEFT);

  hseparator9 = gtk_hseparator_new ();
  gtk_widget_ref (hseparator9);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "hseparator9", hseparator9,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (hseparator9);
  gtk_fixed_put (GTK_FIXED (fixed14), hseparator9, 0, 566);
  gtk_widget_set_uposition (hseparator9, 0, 566);
  gtk_widget_set_usize (hseparator9, 177, 16);

  current_sim_geo_value_label = gtk_label_new ("0.00");
  gtk_widget_ref (current_sim_geo_value_label);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "current_sim_geo_value_label", current_sim_geo_value_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_sim_geo_value_label);
  gtk_fixed_put (GTK_FIXED (fixed14), current_sim_geo_value_label, 8, 392);
  gtk_widget_set_uposition (current_sim_geo_value_label, 8, 392);
  gtk_widget_set_usize (current_sim_geo_value_label, 90, 18);
  gtk_misc_set_alignment (GTK_MISC (current_sim_geo_value_label), 7.45058e-09, 0.5);

  face_graph_threshold_h_scale = gtk_hscale_new (GTK_ADJUSTMENT (gtk_adjustment_new (0.7, 0, 1, 0, 0, 0)));
  gtk_widget_ref (face_graph_threshold_h_scale);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "face_graph_threshold_h_scale", face_graph_threshold_h_scale,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (face_graph_threshold_h_scale);
  gtk_fixed_put (GTK_FIXED (fixed14), face_graph_threshold_h_scale, 7, 319);
  gtk_widget_set_uposition (face_graph_threshold_h_scale, 7, 319);
  gtk_widget_set_usize (face_graph_threshold_h_scale, 128, 31);
  gtk_scale_set_digits (GTK_SCALE (face_graph_threshold_h_scale), 2);

  label25 = gtk_label_new ("face graph OK");
  gtk_widget_ref (label25);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "label25", label25,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label25);
  gtk_fixed_put (GTK_FIXED (fixed14), label25, 8, 96);
  gtk_widget_set_uposition (label25, 8, 96);
  gtk_widget_set_usize (label25, 112, 24);
  gtk_label_set_justify (GTK_LABEL (label25), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label25), 7.45058e-09, 0.5);

  current_track_sim_value_label = gtk_label_new ("0.00");
  gtk_widget_ref (current_track_sim_value_label);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "current_track_sim_value_label", current_track_sim_value_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_track_sim_value_label);
  gtk_fixed_put (GTK_FIXED (fixed14), current_track_sim_value_label, 8, 548);
  gtk_widget_set_uposition (current_track_sim_value_label, 8, 548);
  gtk_widget_set_usize (current_track_sim_value_label, 61, 18);
  gtk_label_set_justify (GTK_LABEL (current_track_sim_value_label), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (current_track_sim_value_label), 0, 0.5);

  tracking_threshold_similarity_value_label38 = gtk_label_new ("tracking threshold\nsimilarity value");
  gtk_widget_ref (tracking_threshold_similarity_value_label38);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "tracking_threshold_similarity_value_label38", tracking_threshold_similarity_value_label38,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (tracking_threshold_similarity_value_label38);
  gtk_fixed_put (GTK_FIXED (fixed14), tracking_threshold_similarity_value_label38, 7, 421);
  gtk_widget_set_uposition (tracking_threshold_similarity_value_label38, 7, 421);
  gtk_widget_set_usize (tracking_threshold_similarity_value_label38, 143, 47);
  gtk_label_set_justify (GTK_LABEL (tracking_threshold_similarity_value_label38), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (tracking_threshold_similarity_value_label38), 0, 0.5);

  tracking_threshold_hscale = gtk_hscale_new (GTK_ADJUSTMENT (gtk_adjustment_new (0.7, 0, 1, 0, 0, 0)));
  gtk_widget_ref (tracking_threshold_hscale);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "tracking_threshold_hscale", tracking_threshold_hscale,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (tracking_threshold_hscale);
  gtk_fixed_put (GTK_FIXED (fixed14), tracking_threshold_hscale, 7, 468);
  gtk_widget_set_uposition (tracking_threshold_hscale, 7, 468);
  gtk_widget_set_usize (tracking_threshold_hscale, 128, 31);
  gtk_scale_set_digits (GTK_SCALE (tracking_threshold_hscale), 2);

  current_geo_similar_value_title_label = gtk_label_new ("current initialize similarity value");
  gtk_widget_ref (current_geo_similar_value_title_label);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "current_geo_similar_value_title_label", current_geo_similar_value_title_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (current_geo_similar_value_title_label);
  gtk_fixed_put (GTK_FIXED (fixed14), current_geo_similar_value_title_label, 8, 352);
  gtk_widget_set_uposition (current_geo_similar_value_title_label, 8, 352);
  gtk_widget_set_usize (current_geo_similar_value_title_label, 155, 32);
  gtk_label_set_line_wrap (GTK_LABEL (current_geo_similar_value_title_label), TRUE);
  gtk_misc_set_alignment (GTK_MISC (current_geo_similar_value_title_label), 7.45058e-09, 0.5);

  label39 = gtk_label_new ("current tracking\nsimilarity value");
  gtk_widget_ref (label39);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "label39", label39,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label39);
  gtk_fixed_put (GTK_FIXED (fixed14), label39, 5, 506);
  gtk_widget_set_uposition (label39, 5, 506);
  gtk_widget_set_usize (label39, 154, 42);
  gtk_label_set_justify (GTK_LABEL (label39), GTK_JUSTIFY_LEFT);
  gtk_label_set_line_wrap (GTK_LABEL (label39), TRUE);
  gtk_misc_set_alignment (GTK_MISC (label39), 0, 0.5);

  hseparator6 = gtk_hseparator_new ();
  gtk_widget_ref (hseparator6);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "hseparator6", hseparator6,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (hseparator6);
  gtk_fixed_put (GTK_FIXED (fixed14), hseparator6, 8, 248);
  gtk_widget_set_uposition (hseparator6, 8, 248);
  gtk_widget_set_usize (hseparator6, 160, 16);

  correct_frames_label = gtk_label_new ("0");
  gtk_widget_ref (correct_frames_label);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "correct_frames_label", correct_frames_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (correct_frames_label);
  gtk_fixed_put (GTK_FIXED (fixed14), correct_frames_label, 8, 152);
  gtk_widget_set_uposition (correct_frames_label, 8, 152);
  gtk_widget_set_usize (correct_frames_label, 45, 18);
  gtk_label_set_justify (GTK_LABEL (correct_frames_label), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (correct_frames_label), 0, 0);

  label36 = gtk_label_new ("initialize threshold\nsimilarity value");
  gtk_widget_ref (label36);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "label36", label36,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label36);
  gtk_fixed_put (GTK_FIXED (fixed14), label36, 8, 264);
  gtk_widget_set_uposition (label36, 8, 264);
  gtk_widget_set_usize (label36, 161, 35);
  gtk_label_set_justify (GTK_LABEL (label36), GTK_JUSTIFY_LEFT);
  gtk_misc_set_alignment (GTK_MISC (label36), 7.45058e-09, 7.45058e-09);

  correct_frames_enter_button = gtk_button_new_with_label ("Enter");
  gtk_widget_ref (correct_frames_enter_button);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "correct_frames_enter_button", correct_frames_enter_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (correct_frames_enter_button);
  gtk_fixed_put (GTK_FIXED (fixed14), correct_frames_enter_button, 8, 176);
  gtk_widget_set_uposition (correct_frames_enter_button, 8, 176);
  gtk_widget_set_usize (correct_frames_enter_button, 52, 24);

  correct_frames_title_label = gtk_label_new ("correct frames");
  gtk_widget_ref (correct_frames_title_label);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "correct_frames_title_label", correct_frames_title_label,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (correct_frames_title_label);
  gtk_fixed_put (GTK_FIXED (fixed14), correct_frames_title_label, 8, 128);
  gtk_widget_set_uposition (correct_frames_title_label, 8, 128);
  gtk_widget_set_usize (correct_frames_title_label, 152, 16);
  gtk_label_set_justify (GTK_LABEL (correct_frames_title_label), GTK_JUSTIFY_LEFT);
  gtk_label_set_line_wrap (GTK_LABEL (correct_frames_title_label), TRUE);
  gtk_misc_set_alignment (GTK_MISC (correct_frames_title_label), 0, 0);

  correct_frames_clear_button = gtk_button_new_with_label ("Clear");
  gtk_widget_ref (correct_frames_clear_button);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "correct_frames_clear_button", correct_frames_clear_button,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (correct_frames_clear_button);
  gtk_fixed_put (GTK_FIXED (fixed14), correct_frames_clear_button, 72, 176);
  gtk_widget_set_uposition (correct_frames_clear_button, 72, 176);
  gtk_widget_set_usize (correct_frames_clear_button, 52, 24);

  label40 = gtk_label_new ("data save dir");
  gtk_widget_ref (label40);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "label40", label40,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label40);
  gtk_fixed_put (GTK_FIXED (fixed14), label40, 7, 578);
  gtk_widget_set_uposition (label40, 7, 578);
  gtk_widget_set_usize (label40, 155, 18);
  gtk_misc_set_alignment (GTK_MISC (label40), 0, 0);

  output_dir_entry = gtk_entry_new ();
  gtk_widget_ref (output_dir_entry);
  gtk_object_set_data_full (GTK_OBJECT (anubishaarsampling_window), "output_dir_entry", output_dir_entry,
                            (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (output_dir_entry);
  gtk_fixed_put (GTK_FIXED (fixed14), output_dir_entry, 6, 600);
  gtk_widget_set_uposition (output_dir_entry, 6, 600);
  gtk_widget_set_usize (output_dir_entry, 158, 24);

  gtk_signal_connect (GTK_OBJECT (toggle_running_button), "clicked",
                      GTK_SIGNAL_FUNC (dummy_on_toggle_running_clicked),
                      NULL);

  return anubishaarsampling_window;
}

GtkWidget*
create_fileselection1 (void)
{
  GtkWidget *fileselection1;
  GtkWidget *ok_button2;
  GtkWidget *cancel_button2;

  fileselection1 = gtk_file_selection_new ("\245\325\245\241\245\244\245\353\301\252\302\362");
  gtk_object_set_data (GTK_OBJECT (fileselection1), "fileselection1", fileselection1);
  gtk_container_set_border_width (GTK_CONTAINER (fileselection1), 10);

  ok_button2 = GTK_FILE_SELECTION (fileselection1)->ok_button;
  gtk_object_set_data (GTK_OBJECT (fileselection1), "ok_button2", ok_button2);
  gtk_widget_show (ok_button2);
  GTK_WIDGET_SET_FLAGS (ok_button2, GTK_CAN_DEFAULT);

  cancel_button2 = GTK_FILE_SELECTION (fileselection1)->cancel_button;
  gtk_object_set_data (GTK_OBJECT (fileselection1), "cancel_button2", cancel_button2);
  gtk_widget_show (cancel_button2);
  GTK_WIDGET_SET_FLAGS (cancel_button2, GTK_CAN_DEFAULT);

  return fileselection1;
}

