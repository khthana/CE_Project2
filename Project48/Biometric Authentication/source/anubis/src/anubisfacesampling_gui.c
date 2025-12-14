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
 */#include "anubisfacesampling_gui.h"

void anubisfacesampling_gui_setup(AnubisfacesamplingGui* gui, MalibObject* handler);

void anubisfacesampling_toggle_running_clicked(GtkButton* button, AnubisfacesamplingGui* gui);

void anubisfacesampling_enter_button_clicked(GtkButton* button, AnubisfacesamplingGui* gui);

void anubisfacesampling_save_button_clicked(GtkButton* button, AnubisfacesamplingGui* gui);

AnubisfacesamplingGui* anubisfacesampling_gui_new (MalibGtkDisplay** displays, RecogByJets* rbj_filter){
  AnubisfacesamplingGui * gui;
  gui= malloc ( sizeof(AnubisfacesamplingGui) );
  assert(gui);

  gui->displays= displays;
  gui->window  = create_anubisfacesampling_window();

  gui->rbj_filter= rbj_filter;

  anubisfacesampling_gui_setup(gui, NULL);

  gtk_widget_show(gui->window);

  /* clear memstorage carefully because face_graph is contains pointer of jets
     so should do freeGaboreJets() before cvClearMemStorage()*/
  gui->storage= cvCreateMemStorage(0);

  gui->face_graph_seq= cvCreateSeq(0, sizeof(CvSeq), sizeof(face_graph), gui->storage);
  

  return gui;
}

/* private functions */

void anubisfacesampling_gui_setup(AnubisfacesamplingGui* gui, MalibObject* handler){
  GtkWidget * anubisfacesampling_main_viewport,
            * malib_drawingarea, * toggle_running;

  gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		     GTK_SIGNAL_FUNC (gtk_main_quit), NULL);

  /* main viewport (drawingarea) */

  anubisfacesampling_main_viewport= lookup_widget(gui->window, "anubisfacesampling_main_viewport");
  gtk_widget_set_usize(anubisfacesampling_main_viewport,
		       BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  malib_drawingarea=
    GTK_WIDGET (malib_gtkdisplay_get_drawarea
		(gui->displays[ANUBISFACESAMPLING_MAIN_DISPLAY_NUM]));
  gtk_container_add(GTK_CONTAINER (anubisfacesampling_main_viewport), malib_drawingarea);
  gtk_widget_ref(malib_drawingarea);

  /* set toggle running button */
  toggle_running= lookup_widget(gui->window, "toggle_running_button");
  gtk_signal_connect(GTK_OBJECT (toggle_running), "clicked",
		     GTK_SIGNAL_FUNC (anubisfacesampling_toggle_running_clicked),
		     gui);

  /* set enter button */
  gui->enter_button= lookup_widget(gui->window, "enter_button");
  gtk_signal_connect(GTK_OBJECT (gui->enter_button), "clicked",
		     GTK_SIGNAL_FUNC (anubisfacesampling_enter_button_clicked),
		     gui);

  /* set save button */
  gui->save_button= lookup_widget(gui->window, "save_button");
  gtk_signal_connect(GTK_OBJECT (gui->save_button), "clicked",
		     GTK_SIGNAL_FUNC (anubisfacesampling_save_button_clicked),
		     gui);

  /* set file brouse button */
  /*
  gui->output_file_brouse_button= lookup_widget(gui->window, "output_file_brouse_button");
  gtk_signal_connect ( GTK_OBJECT (gui->output_file_brouse_button), "clicked",
		       GTK_SIGNAL_FUNC (on_output_file_browse_clicked),
		       gui );
  */

  /* set other widgets to gui */
  gui->name_entry       = lookup_widget(gui->window, "name_entry");
  gui->output_file_entry= lookup_widget(gui->window, "output_file_entry");

}

void anubisfacesampling_toggle_running_clicked(GtkButton* button, AnubisfacesamplingGui* gui){
  MalibSink* sink;
  MalibSinkStatus status;
  g_print("toggle_running_clicked\n");
  sink=   (MalibSink*)gui->displays[ANUBISFACESAMPLING_MAIN_DISPLAY_NUM];
  status= malib_sink_get_status(sink);
  malib_sink_set_status (sink, ((status == MALIB_SINK_RUNNING) ?
				MALIB_SINK_HALT : MALIB_SINK_RUNNING));
  return;
}

void anubisfacesampling_enter_button_clicked(GtkButton* button, AnubisfacesamplingGui* gui){
  char * tmp_name, * name;
  
  gui->name_entry;
  tmp_name= (char*)gtk_entry_get_text((GtkEntry*)gui->name_entry);
  name= malloc( strlen(tmp_name) * sizeof(char) + 1);
  strcpy(name, tmp_name);

  
  FaceParts face_parts_len= FaceParts_LEN;
  FaceGraph face_graph= makeFaceGraph(face_parts_len, face_parts_len);

  face_graph->faceLabel= name;

  int i;
  for(i= 0; i < gui->rbj_filter->cur_sim_jets_num; i++){
    GaborJet cur_jet, tmp_jet;
    cur_jet= gui->rbj_filter->cur_sim_jets[i];

    /* cur_jet copy to tmp_jet, because cur_sim_jets[i] is
       over writed or free when next write_frame_data */
    grm_jet_new_and_copy(&tmp_jet, cur_jet);
    
    face_graph->jets[i]= tmp_jet;
  }
  
  cvSeqPush(gui->face_graph_seq, face_graph);

#ifdef DEBUGMODE
  g_print("face name %s, save to buffer\n", name);
#endif /* DEBUGMODE */
  
  return;
}

void
anubisfacesampling_save_button_clicked(GtkButton* button, AnubisfacesamplingGui* gui){
  char * xml_fname;
  //char   masks_fname[GRM_MAX_FILE_NAME_SIZE]= "";
  char * masks_fname;
  char * masks_extention= GABORRG_JET_MASKS_EXTENTION;
  xmlDocPtr doc;
  xmlNodePtr node_templates, node_template;
  
  xml_fname= (char*)gtk_entry_get_text((GtkEntry*)gui->output_file_entry);

  masks_fname= malloc( sizeof(char) * ( strlen(xml_fname) + strlen(masks_extention) + 1 ) );
  masks_fname[0]= '\0';

  /* mask data output to .masks file */
  strcat(masks_fname, xml_fname);
  strcat(masks_fname, masks_extention);
  grm_ebgm_masks_params_output(gui->rbj_filter->masks, masks_fname);

  grm_facegraph_seq_save_to_xml_file(gui->face_graph_seq, masks_fname, xml_fname);
  
  cvClearMemStorage(gui->storage);
  return;
}

