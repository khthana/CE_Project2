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

/*
  this program makes gui of anubishaarsampling
  anubishaarsampling_gui_new() return gui
  anubishaarsampling_gui_update_new_with_buf()  return malib object
 */
   

#include "anubishaarsampling_gui_with_update.h"

/* gui new functions*/
void anubishaarsampling_gui_setup(AnubisHaarSamplingGui* gui);
void anubishaarsampling_toggle_running_clicked(GtkButton* button, AnubisHaarSamplingGui* gui);
void anubishaarsampling_save_button_clicked(GtkButton* button, AnubisHaarSamplingGui* gui);

/* gui update functions */
void anubishaarsampling_gui_update_write_frame_data (AnubisHaarSamplingGuiUpdate* filter, MalibFrame* frame);
void anubishaarsampling_gui_update(AnubisHaarSamplingGuiUpdate* filter);
void current_simvalue_label_update(AnubisFaceGraphMeasure* fg_measure_filter, GtkWidget* label);

static AnubisHaarSamplingGuiUpdate anubishaarsampling_gui_update_class=
{
  (void (*) (MalibObject*))              malib_filter_delete,
  (void (*) (MalibSource*, MalibFrame*)) anubishaarsampling_gui_update_write_frame_data
};

/* public functions ***************************************************/

AnubisHaarSamplingGui* anubishaarsampling_gui_new(MalibGtkDisplay* display,
						AnubisFaceGraphMeasure* fg_measure_filter,
						AnubisFaceGraphMeasure* track_fg_filter,
						AnubisHaarDataSampling* hsampling_filter){
  AnubisHaarSamplingGui* gui;

  gui= malloc (sizeof (AnubisHaarSamplingGui));
  assert(gui);

  /* add pixmap directory */
  add_pixmap_directory (PACKAGE_DATA_DIR "/pixmaps");
  add_pixmap_directory (PACKAGE_SOURCE_DIR "/pixmaps");

  gui->display= display;
  gui->window = create_anubishaarsampling_window();
  gui->fg_measure_filter= fg_measure_filter;
  gui->track_fg_filter= track_fg_filter;
  gui->hsampling_filter = hsampling_filter;
  
  anubishaarsampling_gui_setup(gui);
  gtk_widget_show(gui->window);

  return gui;
}

AnubisHaarSamplingGuiUpdate*
anubishaarsampling_gui_update_new_with_buf (MalibBuffer* buf,
					   AnubisCVHaarDetectObj* haar_filter,
					   RecogByJets* jets_filter,
					   AnubisFaceGraphMeasure* fgm_filter,
					   AnubisFaceGraphMeasure* track_fg_filter,
					   AnubisHaarDataSampling* hsampling_filter){
  AnubisHaarSamplingGuiUpdate * filter;
  MalibFrame * prev_frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisHaarSamplingGuiUpdate, &anubishaarsampling_gui_update_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY |
			       MALIB_FRAME_COLORMODEL_BW,
			       &filter);

  prev_frame= malib_buffer_get_current_frame(buf);

  malib_filter_set_buffer(filter,buf);

  filter->haar_filter      = haar_filter;
  filter->jets_filter      = jets_filter;
  filter->fg_measure_filter= fgm_filter;
  filter->track_fg_filter  = track_fg_filter;
  filter->hsampling_filter     = hsampling_filter;

  return filter;
}

/* private functions **************************************************/

void
anubishaarsampling_gui_setup (AnubisHaarSamplingGui* gui){
  GtkWidget * anubishaarsampling_window;
  GtkWidget * anubishaarsampling_main_viewport;
  GtkWidget * malib_drawingarea;

  gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		     GTK_SIGNAL_FUNC (gtk_main_quit), NULL);

  /* main viewport (drawingarea) */
  anubishaarsampling_main_viewport= lookup_widget(gui->window, "anubishaarsampling_main_viewport");
  gtk_widget_set_usize(anubishaarsampling_main_viewport,
		       BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  malib_drawingarea=
    GTK_WIDGET ( malib_gtkdisplay_get_drawarea(gui->display) );
  gtk_container_add(GTK_CONTAINER (anubishaarsampling_main_viewport), malib_drawingarea);
  gtk_widget_ref(malib_drawingarea);

  /* buttons setup */
  {
    /* toggle running button */
    GtkWidget * button;
    button= lookup_widget(gui->window, "toggle_running_button");
    
    gtk_signal_connect(GTK_OBJECT (button), "clicked",
		       GTK_SIGNAL_FUNC (anubis_toggle_running_clicked),
		       gui->display);
    
    /* correct frames enter button */
    button= lookup_widget(gui->window, "correct_frames_enter_button");
    gtk_signal_connect(GTK_OBJECT (button), "clicked",
		       GTK_SIGNAL_FUNC (anubishaarsampling_enter_correct_frames_button_clicked),
		       gui);

    /* correct_frames_clear_button */
    button= lookup_widget(gui->window, "correct_frames_clear_button");
    gtk_signal_connect(GTK_OBJECT (button), "clicked",
		       GTK_SIGNAL_FUNC (anubishaarsampling_clear_correct_frames_button_clicked),
		       gui);
    
    
    /* save_button */
    button= lookup_widget(gui->window, "save_button");
    gtk_signal_connect(GTK_OBJECT (button), "clicked",
		       GTK_SIGNAL_FUNC (anubishaarsampling_save_button_clicked),
		       gui);
    
  }
  
  /* create indicator's gdk_pixmap */
  {
    GtkPixmap* tmp_gtk_pixmap;
    
    tmp_gtk_pixmap= (GtkPixmap*) create_pixmap
                                 (gui->window, ANUBISHAARSAMPLING_FACE_DETECT_PIXMAP);
    gui->face_detect_indicator_anubis_pixmap.gdk_pixmap = tmp_gtk_pixmap->pixmap;
    gui->face_detect_indicator_anubis_pixmap.pixmap_mask= tmp_gtk_pixmap->mask;

    tmp_gtk_pixmap= (GtkPixmap*) create_pixmap
                                 (gui->window, ANUBISHAARSAMPLING_FACE_GRAPH_OK_PIXMAP);
    gui->face_graph_ok_indicator_anubis_pixmap.gdk_pixmap = tmp_gtk_pixmap->pixmap;
    gui->face_graph_ok_indicator_anubis_pixmap.pixmap_mask= tmp_gtk_pixmap->mask;

    tmp_gtk_pixmap= (GtkPixmap*) create_pixmap
                                 (gui->window, ANUBISHAARSAMPLING_DUMMY_20_PIXMAP);
    gui->dummy_20_anubis_pixmap.gdk_pixmap = tmp_gtk_pixmap->pixmap;
    gui->dummy_20_anubis_pixmap.pixmap_mask= tmp_gtk_pixmap->mask;
  }
  /* face detect and face graph ok indicator setup */
  {
    gui->face_detect_indicator_anubis_pixmap.pixmap=
      lookup_widget(gui->window, "face_detect_indicator_pix");
    gtk_pixmap_set((GtkPixmap*)gui->face_detect_indicator_anubis_pixmap.pixmap,
		   gui->dummy_20_anubis_pixmap.gdk_pixmap,
		   gui->dummy_20_anubis_pixmap.pixmap_mask);

    gui->face_graph_ok_indicator_anubis_pixmap.pixmap=
      lookup_widget(gui->window, "face_graph_ok_indicator_pix");
    gtk_pixmap_set((GtkPixmap*)gui->face_graph_ok_indicator_anubis_pixmap.pixmap,
		   gui->dummy_20_anubis_pixmap.gdk_pixmap,
		   gui->dummy_20_anubis_pixmap.pixmap_mask);
  }
  /* face detect and face graph ok indicator setup end */

  /* labels setup */
  {
    gui->current_sim_geo_value_label= lookup_widget(gui->window, "current_sim_geo_value_label");
    gui->current_track_sim_value_label= lookup_widget(gui->window, "current_track_sim_value_label");
    gui->correct_frames_label   = lookup_widget(gui->window, "correct_frames_label");
  }
  
  /* face graph threshold slider setup */
  {
    GtkAdjustment * adj;
    GtkWidget * h_scale;
    AnubisFaceGraphMeasure * filter;

    filter= gui->fg_measure_filter;
    if(filter){
      h_scale= lookup_widget(gui->window, "face_graph_threshold_h_scale");
      gtk_range_set_adjustment( GTK_RANGE(h_scale),
				GTK_ADJUSTMENT (gtk_adjustment_new (filter->face_detect_threshold, 0, 1, 0, 0, 0)));
      adj= gtk_range_get_adjustment ( GTK_RANGE(h_scale) );
      gtk_signal_connect( GTK_OBJECT(adj), "value_changed",
			  on_anubis_ftype_h_scale_value_change,
			  &filter->face_detect_threshold );

    }
    filter= gui->track_fg_filter;
    if(filter){
      h_scale= lookup_widget(gui->window, "tracking_threshold_hscale");
      gtk_range_set_adjustment( GTK_RANGE(h_scale),
				GTK_ADJUSTMENT (gtk_adjustment_new (filter->face_detect_threshold, 0, 1, 0, 0, 0)));
      adj= gtk_range_get_adjustment ( GTK_RANGE(h_scale) );
      gtk_signal_connect( GTK_OBJECT(adj), "value_changed",
			  on_anubis_ftype_h_scale_value_change,
			  &filter->face_detect_threshold );

    }

  }
  /* face graph threshold slider setup end */

  
  return;
}

void anubishaarsampling_toggle_running_clicked(GtkButton* button, AnubisHaarSamplingGui* gui){
  MalibSink* sink;
  MalibSinkStatus status;
  g_print("toggle_running_clicked\n");
  sink=   (MalibSink*)gui->display;
  status= malib_sink_get_status(sink);
  malib_sink_set_status (sink, ((status == MALIB_SINK_RUNNING) ?
				MALIB_SINK_HALT : MALIB_SINK_RUNNING));
  return;
}

void anubishaarsampling_enter_correct_frames_button_clicked(GtkButton* button, AnubisHaarSamplingGui* gui){
  anubis_haar_data_sampling_enter_correct_frames(button, gui->hsampling_filter);
  anubis_int_value_label_update(gui->correct_frames_label, gui->hsampling_filter->image_counter);
}

void anubishaarsampling_clear_correct_frames_button_clicked(GtkButton* button, AnubisHaarSamplingGui* gui){
  anubis_haar_data_sampling_clear_correct_frames(button, gui->hsampling_filter);
  anubis_int_value_label_update(gui->correct_frames_label, gui->hsampling_filter->image_counter);
}

void anubishaarsampling_save_button_clicked(GtkButton* button, AnubisHaarSamplingGui* gui){
  char * xml_fname, * dir_name;
  xmlDocPtr doc;
  xmlNodePtr node_templates, node_template;
  GtkWidget * output_file_entry, * output_dir_entry;

  output_file_entry= lookup_widget(gui->window, "output_file_entry");
  output_dir_entry = lookup_widget(gui->window, "output_dir_entry");
  
  xml_fname= (char*)gtk_entry_get_text(output_file_entry);
  dir_name = (char*)gtk_entry_get_text(output_dir_entry);

  if( anubis_haar_data_sampling_save_xml_file_and_images(gui->hsampling_filter, xml_fname,
							dir_name, ANUBISHAARSAMPLING_IMAGE_FNAME) )
    ;
  
  return;
}


void anubishaarsampling_gui_update_write_frame_data (AnubisHaarSamplingGuiUpdate* filter, MalibFrame* frame){
  MalibFrame * prev_frame;

  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);
  malib_filter_preprocess ((MalibFilter*) filter, frame);

  prev_frame= malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);

  anubishaarsampling_gui_update(filter);

  frame->data= prev_frame->data;
}


void anubishaarsampling_gui_update(AnubisHaarSamplingGuiUpdate* filter){
  AnubisHaarSamplingGui * gui;
  AnubisCVHaarDetectObj * haar_filter;
  RecogByJets* jets_filter;
  AnubisFaceGraphMeasure * fg_measure_filter, track_fg_filter;

  gui= filter->gui;

  haar_filter      = filter->haar_filter;
  jets_filter      = filter->jets_filter;
  fg_measure_filter= filter->fg_measure_filter;

  /* update face_detect indicator */
  anubis_pixmap_update(gui->face_detect_indicator_anubis_pixmap, gui->dummy_20_anubis_pixmap,
		      haar_filter->faces->total);

  if (haar_filter->faces->total) {
    anubis_pixmap_update(gui->face_graph_ok_indicator_anubis_pixmap, gui->dummy_20_anubis_pixmap,
			fg_measure_filter->detect);
    current_simvalue_label_update(fg_measure_filter, gui->current_sim_geo_value_label);
    current_simvalue_label_update(filter->track_fg_filter, gui->current_track_sim_value_label);
  }
  anubis_int_value_label_update(gui->correct_frames_label, filter->hsampling_filter->image_counter);
}

void current_simvalue_label_update(AnubisFaceGraphMeasure* fg_measure_filter, GtkWidget* label){
  FTYPE simgeo_max;
  char tmp_char[30];

  if(fg_measure_filter->simmax_face_graph){
    simgeo_max= fg_measure_filter->simgeo_max;
  } else {
    simgeo_max= 0.0;
  }
  sprintf(tmp_char, "%f", simgeo_max);
  gtk_label_set_text( GTK_LABEL(label), tmp_char );
}
