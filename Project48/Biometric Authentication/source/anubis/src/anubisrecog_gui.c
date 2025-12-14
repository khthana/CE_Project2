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
#include "anubisrecog_gui.h"

void anubisrecog_gui_setup(AnubisRecogGui* gui, MalibObject* handler);
void anubisrecog_toggle_running_clicked(GtkButton* button,AnubisRecogGui* gui);
void on_name_threshold_h_scale_value_change (GtkAdjustment* adj,
					     gpointer user_data);


AnubisRecogGui* anubisrecog_gui_new (MalibGtkDisplay* display,
				   MalibSource* c_conf_filter,
				   AnubisFaceGraphMeasure* fg_measure_filter){
  AnubisRecogGui* gui;
  gui= malloc (sizeof (AnubisRecogGui));
  assert(gui);

  /* add pixmap directory */
  add_pixmap_directory (PACKAGE_DATA_DIR "/pixmaps");
  add_pixmap_directory (PACKAGE_SOURCE_DIR "/pixmaps");

  /* parms set to gui */
  gui->display         = display;
  gui->c_conf_filter    = c_conf_filter;
  gui->fg_measure_filter= fg_measure_filter;
  gui->window           = create_anubisrecog_window();

  anubisrecog_gui_setup(gui, NULL);
  gtk_widget_show(gui->window);

  return gui;
}
  
void anubisrecog_gui_setup(AnubisRecogGui* gui, MalibObject* handler){
  GtkWidget * anubisrecog_main_fixed, * anubisrecog_main_viewport,
            * anubisrecog_statusbar,  * anubisrecog_scrolledwindow,
            * alpha_progressbar,     * toggle_running,
            * malib_drawingarea;
  
  gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		     GTK_SIGNAL_FUNC (gtk_main_quit), NULL);
		     //GTK_SIGNAL_FUNC (gtk_wrap_anubis_cv_gtkdisplay_delete), gui->display);

  /* main viewport (drawingarea) */
  anubisrecog_main_viewport= lookup_widget(gui->window, "anubisrecog_main_viewport");
  gtk_widget_set_usize(anubisrecog_main_viewport,
		       BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  malib_drawingarea=
    GTK_WIDGET (malib_gtkdisplay_get_drawarea(gui->display));
  gtk_container_add(GTK_CONTAINER (anubisrecog_main_viewport), malib_drawingarea);
  gtk_widget_ref(malib_drawingarea);

  /* toggle running button */
  toggle_running= lookup_widget(gui->window, "toggle_running_button");
  gtk_signal_connect(GTK_OBJECT (toggle_running), "clicked",
		     GTK_SIGNAL_FUNC (anubisrecog_toggle_running_clicked),
		     gui);

  /* create indicator's gdk_pixmap */
  {
    GtkPixmap* tmp_gtk_pixmap;

    tmp_gtk_pixmap= (GtkPixmap*) create_pixmap
                                 (gui->window, ANUBISRECOG_FACE_DETECT_PIXMAP);
    gui->face_detect_indicator_anubis_pixmap.gdk_pixmap = tmp_gtk_pixmap->pixmap;
    gui->face_detect_indicator_anubis_pixmap.pixmap_mask= tmp_gtk_pixmap->mask;

    tmp_gtk_pixmap= (GtkPixmap*) create_pixmap
                                 (gui->window, ANUBISRECOG_NAME_DETECT_PIXMAP);
    gui->name_detect_indicator_anubis_pixmap.gdk_pixmap = tmp_gtk_pixmap->pixmap;
    gui->name_detect_indicator_anubis_pixmap.pixmap_mask= tmp_gtk_pixmap->mask;

    tmp_gtk_pixmap= (GtkPixmap*) create_pixmap
                                 (gui->window, ANUBISRECOG_DUMMY_20_PIXMAP);
    gui->dummy_20_anubis_pixmap.gdk_pixmap = tmp_gtk_pixmap->pixmap;
    gui->dummy_20_anubis_pixmap.pixmap_mask= tmp_gtk_pixmap->mask;
  }

  /* face detect and name detect indicator setup */
  {
    gui->face_detect_indicator_anubis_pixmap.pixmap=
      lookup_widget(gui->window, "face_detect_indicator_pix");
    gtk_pixmap_set((GtkPixmap*)gui->face_detect_indicator_anubis_pixmap.pixmap,
		   gui->dummy_20_anubis_pixmap.gdk_pixmap,
		   gui->dummy_20_anubis_pixmap.pixmap_mask);

    gui->name_detect_indicator_anubis_pixmap.pixmap=
      lookup_widget(gui->window, "name_detect_indicator_pix");
    gtk_pixmap_set((GtkPixmap*)gui->name_detect_indicator_anubis_pixmap.pixmap,
		   gui->dummy_20_anubis_pixmap.gdk_pixmap,
		   gui->dummy_20_anubis_pixmap.pixmap_mask);
  }
  /* face detect and name detect indicator setup end */

  /* labels setup */
  {
    gui->last_name_label            = lookup_widget(gui->window, "last_name_label");
    gui->current_name_label         = lookup_widget(gui->window, "current_name_label");
    gui->current_similar_value_label= lookup_widget(gui->window, "current_similar_value_label");
    gui->current_sim_jet_value_label= lookup_widget(gui->window, "current_sim_jet_value_label");
    gui->current_sim_geo_value_label= lookup_widget(gui->window, "current_sim_geo_value_label");
  }
  /* labels setup end */

  /* name detect threshold slider setup */
  {
    GtkAdjustment * adj;
    GtkWidget * h_scale;
    AnubisFaceGraphMeasure * filter;

    filter= gui->fg_measure_filter;
    
    if(filter){
      h_scale= lookup_widget(gui->window, "name_threshold_h_scale");
      gtk_range_set_adjustment( GTK_RANGE(h_scale),
				GTK_ADJUSTMENT (gtk_adjustment_new (filter->face_detect_threshold, 0, 1, 0, 0, 0)));
      adj= gtk_range_get_adjustment ( GTK_RANGE(h_scale) );

      gtk_signal_connect( GTK_OBJECT(adj), "value_changed",
			  on_anubis_ftype_h_scale_value_change,
			  &filter->face_detect_threshold );
    }
  }
  /* name detect threshold slider setup end */
  
  /* color slider setup */
  {
    GtkAdjustment* adj;
    GtkWidget * color_hscale;
    AnubisColorConfig * filter;
    filter= (AnubisColorConfig*)gui->c_conf_filter;
    if(filter){
      color_hscale= lookup_widget (gui->window, "hscale_red");
      adj= gtk_range_get_adjustment (GTK_RANGE(color_hscale));
      gtk_signal_connect(GTK_OBJECT(adj), "value_changed",
			 on_color_hscale_button_value_change,
			 &filter->red);
      color_hscale= lookup_widget (gui->window, "hscale_green");
      adj= gtk_range_get_adjustment (GTK_RANGE(color_hscale));
      gtk_signal_connect(GTK_OBJECT(adj), "value_changed",
			 on_color_hscale_button_value_change,
			 &filter->green);
      color_hscale= lookup_widget (gui->window, "hscale_blue");
      adj= gtk_range_get_adjustment (GTK_RANGE(color_hscale));
      gtk_signal_connect(GTK_OBJECT(adj), "value_changed",
			 on_color_hscale_button_value_change,
			 &filter->blue);
    }
  }
  return;
}
  
void anubisrecog_toggle_running_clicked(GtkButton* button, AnubisRecogGui* gui){
  MalibSink* sink;
  MalibSinkStatus status;
  g_print("toggle_running_clicked\n");
  sink=   (MalibSink*)gui->display;
  status= malib_sink_get_status(sink);
  malib_sink_set_status (sink, ((status == MALIB_SINK_RUNNING) ?
				MALIB_SINK_HALT : MALIB_SINK_RUNNING));
  return;
}

/* replace and needless */
void on_name_threshold_h_scale_value_change (GtkAdjustment* adj,
					     gpointer user_data){

  FTYPE * value;
  value= (FTYPE*) user_data;
  *value= (FTYPE) (adj->value);
  return;
}
