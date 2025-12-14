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
#include "anubisrecog_gui_update.h"
#include <stdio.h>

void
anubisrecog_gui_update_write_frame_data (AnubisrecogGuiUpdate* filter, MalibFrame* frame);

void anubisrecog_gui_update(AnubisrecogGuiUpdate* filter);

void face_detect_indicator_update(AnubisCVHaarDetectObj* filter, AnubisRecogGui* gui);

void name_detect_indicator_update(AnubisFaceGraphMeasure* fg_measure_filter, AnubisRecogGui* gui);

void current_name_labels_update(AnubisFaceGraphMeasure* fg_measure_filter, AnubisRecogGui* gui);


static AnubisrecogGuiUpdate anubisrecog_gui_update_class=
{
  (void (*) (MalibObject*))              malib_filter_delete,
  (void (*) (MalibSource*, MalibFrame*)) anubisrecog_gui_update_write_frame_data
};

/* public functions **************************************************/

AnubisrecogGuiUpdate*
anubisrecog_gui_update_new_with_buf (MalibBuffer* buf,
				    AnubisCVHaarDetectObj* haar_filter,
				    RecogByJets* jets_filter,
				    AnubisFaceGraphMeasure* fgm_filter){

  AnubisrecogGuiUpdate * filter;
  MalibFrame * prev_frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisrecogGuiUpdate, &anubisrecog_gui_update_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY |
			       MALIB_FRAME_COLORMODEL_BW,
			       &filter);

  prev_frame= malib_buffer_get_current_frame(buf);

  malib_filter_set_buffer(filter,buf);

  filter->haar_filter      = haar_filter;
  filter->jets_filter      = jets_filter;
  filter->fg_measure_filter= fgm_filter;
  
  return filter;
  
}

/* private functions **************************************************/

void anubisrecog_gui_update_write_frame_data (AnubisrecogGuiUpdate* filter, MalibFrame* frame){
  MalibFrame * prev_frame;
  
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_filter_preprocess ((MalibFilter*) filter, frame);
  
  prev_frame= malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);

  anubisrecog_gui_update(filter);
  
  frame->data= prev_frame->data;
    
  return;
}

void anubisrecog_gui_update(AnubisrecogGuiUpdate* filter){
  AnubisRecogGui * gui;
  AnubisCVHaarDetectObj * haar_filter;
  RecogByJets* jets_filter;
  AnubisFaceGraphMeasure * fg_measure_filter;
  int face_num;
  
  gui= filter->gui;
  
  haar_filter      = filter->haar_filter;
  jets_filter      = filter->jets_filter;
  fg_measure_filter= filter->fg_measure_filter;

  /* update face_detect indicator */
  anubis_pixmap_update(gui->face_detect_indicator_anubis_pixmap, gui->dummy_20_anubis_pixmap,
		      haar_filter->faces->total);

  /* update name detect indicator */
  if (haar_filter->faces->total) {
    anubis_pixmap_update(gui->name_detect_indicator_anubis_pixmap, gui->dummy_20_anubis_pixmap,
			fg_measure_filter->detect);
    current_name_labels_update(fg_measure_filter, gui);
  }
  
  return;
}

void current_name_labels_update(AnubisFaceGraphMeasure* fg_measure_filter, AnubisRecogGui* gui){
  /* update
     current_name_label, current_similar_value_label, last_name_label
  */
  char * name;
  char simmax_char[30], tmp_char[30];
  FTYPE  simmax, simjet_max, simgeo_max;
  name= "";

  /* current name and sim value update*/
  if(fg_measure_filter->simmax_face_graph){
    name      = fg_measure_filter->simmax_face_graph->faceLabel;
    simmax    = fg_measure_filter->simmax;
    simjet_max= fg_measure_filter->simjet_max;
    simgeo_max= fg_measure_filter->simgeo_max;
    
  } else {
    name      = "none";
    simmax    = 0.0;
    simjet_max= 0.0;
    simgeo_max= 0.0;
  }

  gtk_label_set_text( GTK_LABEL(gui->current_name_label), name );
  
  sprintf(tmp_char, "%f", simmax);
  gtk_label_set_text( GTK_LABEL(gui->current_similar_value_label), tmp_char );
  sprintf(tmp_char, "%f", simjet_max);
  gtk_label_set_text( GTK_LABEL(gui->current_sim_jet_value_label), tmp_char );
  sprintf(tmp_char, "%f", simgeo_max);
  gtk_label_set_text( GTK_LABEL(gui->current_sim_geo_value_label), tmp_char );
  
  /* last detected name update*/
  if((fg_measure_filter->simgeo_max > fg_measure_filter->face_detect_threshold) &&
     fg_measure_filter->last_detected_face_graph &&
     fg_measure_filter->simmax_face_graph){
    name= fg_measure_filter->simmax_face_graph->faceLabel;
    gtk_label_set_text( GTK_LABEL(gui->last_name_label), name );
  }

  if (name != "none")
  {
	  int temp = 100 * simmax;
	  if (temp >= 80)
	  {  
		  FILE *fp;
//		  char input = "0";
		  fp = fopen("/tmp/anubis.lock", "w");
		  fwrite("0" , 1, 1, fp);
		  fclose(fp);
	  }
	  else
	  {
		  FILE *fp;
		  fp = fopen("/tmp/anubis.lock", "w");
		  fwrite("1", 1, 1, fp);
		  fclose(fp);
	  }
  }
  return;
}

