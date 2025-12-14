/*
 * Gladeの作成した初期main.cファイルです. 編集が必要です.
 * Gladeはこのファイルを上書きしません.
 */

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#include <gtk/gtk.h>

#include "glade_interface.h"
#include "glade_support.h"

int
main (int argc, char *argv[])
{
  GtkWidget *gaborrg_recog_window;
  GtkWidget *gaborrg_maker_window;
  GtkWidget *output_fileselection;

  gtk_set_locale ();
  gtk_init (&argc, &argv);

  add_pixmap_directory (PACKAGE_DATA_DIR "/pixmaps");
  add_pixmap_directory (PACKAGE_SOURCE_DIR "/pixmaps");

  /*
   * The following code was added by Glade to create one of each component
   * (except popup menus), just so that you see something after building
   * the project. Delete any components that you don't want shown initially.
   */
  gaborrg_recog_window = create_gaborrg_recog_window ();
  gtk_widget_show (gaborrg_recog_window);
  gaborrg_maker_window = create_gaborrg_maker_window ();
  gtk_widget_show (gaborrg_maker_window);
  output_fileselection = create_output_fileselection ();
  gtk_widget_show (output_fileselection);

  gtk_main ();
  return 0;
}

