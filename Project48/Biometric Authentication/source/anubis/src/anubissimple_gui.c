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
#include "anubissimple_gui.h"

void gui_setup(AnubisSimpleGui* gui);
void on_toggle_running_clicked(GtkButton* button, AnubisSimpleGui* gui);

AnubisSimpleGui* anubissimple_gui_new (AnubisCVGtkDisplay* display){
  AnubisSimpleGui* gui;
  gui= malloc (sizeof (AnubisSimpleGui));
  gui->display= display;
  gui->window= create_anubissimple_window();
  gui_setup(gui);
  return gui;
}

void anubissimple_gui_set_title (AnubisSimpleGui* gui, char* title){
  gtk_window_set_title(gui->window, title);
}

/* private functions **************************************************/

void gui_setup(AnubisSimpleGui* gui){
  GtkWidget * fixed1, * viewport, * drawingarea, * toggle_running;
  gtk_widget_show(gui->window);


  gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		     GTK_SIGNAL_FUNC (gtk_main_quit), NULL);


  //Fixme: forrow is correct destructor but it causes sometime segfault if filter's frame->data
  //       referance anothor frame's data

  /*
  gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		     GTK_SIGNAL_FUNC (gtk_wrap_anubis_cv_gtkdisplay_delete), gui->display);
  */
  
  viewport= lookup_widget(gui->window, "viewport");
  gtk_widget_set_usize(viewport, BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  drawingarea= GTK_WIDGET (anubis_cv_gtkdisplay_get_drawarea (gui->display));
  gtk_container_add(GTK_CONTAINER (viewport), drawingarea);

  gtk_widget_ref(drawingarea);

  toggle_running= lookup_widget(gui->window, "toggle_running");
  gtk_signal_connect(GTK_OBJECT (toggle_running), "clicked",
		     GTK_SIGNAL_FUNC (on_toggle_running_clicked),
		     gui);


  return;
}

void on_toggle_running_clicked(GtkButton* button,AnubisSimpleGui* gui){
  MalibSink* sink;
  MalibSinkStatus status;
  g_print("toggle_running_clicked\n");
  sink=   (MalibSink*)gui->display;
  status= malib_sink_get_status(sink);
  malib_sink_set_status (sink, ((status == MALIB_SINK_RUNNING) ?
				MALIB_SINK_HALT : MALIB_SINK_RUNNING));
  return;
}
