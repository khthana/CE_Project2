/*
 * Anubis
 * Copyright (c) 2005 bioanubis
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */
#include "gaborrg_recog_gui.h"

GrrGui* grr_gui_new (MalibGtkDisplay** displays, MalibBuffer* rgb2gray_buf){
  GrrGui* gui;
  gui= malloc (sizeof (GrrGui));
  if (!(gui))
    g_error("memory error! in gaborrg_maker_gui_new()");
  memset (gui, 0, sizeof (GrrGui));

  /* params set to gui */
  {
    gui->displays   = displays;
    gui->gray_buffer= rgb2gray_buf;
    gui->gaborrg    = grr_xml_parse_file(GRR_DEFAULT_XML_FILE);
  }
  gui->window= create_gaborrg_recog_window();
  grr_gui_setup(gui, NULL);
  return gui;
}

void grr_gui_setup (GrrGui* gui, MalibObject* handler){
  /*gtk_widget_show(gui->window);*/

  GtkWidget * fixed1, * viewport1, * malib_drawingarea, * toggle_running;
  gtk_widget_show(gui->window);

  gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		     GTK_SIGNAL_FUNC (gtk_main_quit), NULL);
				 
  viewport1= lookup_widget(gui->window, "viewport1");
  gtk_widget_set_usize(viewport1, BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  malib_drawingarea= GTK_WIDGET (malib_gtkdisplay_get_drawarea (gui->displays[1]));
  gtk_container_add(GTK_CONTAINER (viewport1), malib_drawingarea);

  gtk_widget_ref(malib_drawingarea);

  toggle_running= lookup_widget(gui->window, "toggle_running");
  gtk_signal_connect(GTK_OBJECT (toggle_running), "clicked",
		     GTK_SIGNAL_FUNC (grr_on_toggle_running_clicked),
		     gui);
  return;
}

void grr_on_toggle_running_clicked(GtkButton* button,
				   GrrGui*    gui){
  int i= gui->main_display_num;
  MalibSink* sink;
  MalibSinkStatus status;
  g_print("toggle_running_clicked\n");
  sink=   (MalibSink*)gui->displays[i];
  status= malib_sink_get_status(sink);
  malib_sink_set_status (sink, ((status == MALIB_SINK_RUNNING) ?
				MALIB_SINK_HALT : MALIB_SINK_RUNNING));
  return;
}
