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
#include "gaborrg_maker_file_io_gui.h"
#include "gaborrg_maker_file_io.h"

void on_data_type_enter_button_clicked(GtkButton* button, gpointer user_data);
void on_data_type_rbu_gmag_clicked(GtkButton* button, gpointer user_data);
void on_data_type_rbu_jet_clicked(GtkButton* button, gpointer user_data);

void gaborrg_maker_file_io_gui_setup(GrmGui* gui){
  GtkWidget * file_io_fixed, * output_file_browse, * data_output_button,
            * output_file_entry, * data_type_rbu_jet, * data_type_rbu_gmag,
            * data_type_enter_button;
  
  file_io_fixed         = lookup_widget(gui->window, "file_io_fixed");
  output_file_browse    = lookup_widget(gui->window, "output_file_browse");
  data_output_button    = lookup_widget(gui->window, "data_output_button");
  output_file_entry     = lookup_widget(gui->window, "output_file_entry");
  data_type_rbu_jet     = lookup_widget(gui->window, "data_type_rbu_jet");
  //data_type_rbu_gmag    = lookup_widget(gui->window, "data_type_rbu_gmag"); // gabor magnitude 
  data_type_enter_button= lookup_widget(gui->window, "data_type_enter_button");

  
  
  /* widget set to gui */
  {
    gui->file_io_gui.data_output_button       = data_output_button;
    gui->file_io_gui.output_file_entry        = output_file_entry;
    gui->file_io_gui.output_file_browse_button= output_file_browse;
    gui->file_io_gui.data_type_enter_button   = data_type_enter_button;
  }
  /* set dafult value */
  {
    char* fname;
    gui->file_io_gui.recog_data_type= GRM_DEFAULT_RECOG_DATA_TYPE;

    if(gui->file_io_gui.recog_data_type == GABOR_MAG)
      fname= GABORRG_MAG_DEFAULT_XML_FNAME;
    else if(gui->file_io_gui.recog_data_type == JET)
      fname= GABORRG_JET_DEFAULT_XML_FNAME;
    gtk_entry_set_text((GtkEntry*)output_file_entry,
		       fname);

  }
  
  gtk_signal_connect (GTK_OBJECT (output_file_browse), "clicked",
                      GTK_SIGNAL_FUNC (on_output_file_browse_clicked),
                      gui);

  gtk_signal_connect (GTK_OBJECT (data_output_button), "clicked",
                      GTK_SIGNAL_FUNC (on_data_output_button_clicked),
                      gui);

  gtk_signal_connect (GTK_OBJECT (data_type_rbu_jet) , "clicked",
		      GTK_SIGNAL_FUNC (on_data_type_rbu_jet_clicked),
		      gui);

  /*
  gtk_signal_connect (GTK_OBJECT (data_type_rbu_gmag), "clicked",
		      GTK_SIGNAL_FUNC (on_data_type_rbu_gmag_clicked),
		      gui);
  */

  gtk_signal_connect (GTK_OBJECT (data_type_enter_button), "clicked",
		      GTK_SIGNAL_FUNC (on_data_type_enter_button_clicked),
		      gui);

  return;
}

void
on_data_output_button_clicked    (GtkButton       *button,
				  gpointer         user_data)
{
  GrmGui* gui= (GrmGui*) user_data;
  gui->face_node_data_stack_output_file(gui);
  return;
}

void
on_output_file_browse_clicked    (GtkButton       *button,
				  gpointer         user_data)
{
  GtkWidget *output_fileselection;
  GrmGui    *gui= (GrmGui*) user_data;

  output_fileselection= create_output_fileselection();

  gui->file_io_gui.output_fileselection= output_fileselection;

  GtkWidget *ok_button1;
  GtkWidget *cancel_button1;

  ok_button1 = GTK_FILE_SELECTION (output_fileselection)->ok_button;
  cancel_button1 = GTK_FILE_SELECTION (output_fileselection)->cancel_button;

  gtk_signal_connect (GTK_OBJECT (ok_button1), "clicked",
                      GTK_SIGNAL_FUNC (on_output_fileselection_ok_clicked),
                      gui);
  gtk_signal_connect (GTK_OBJECT (ok_button1), "clicked",
                      GTK_SIGNAL_FUNC (my_gtk_widget_destroy),
                      (gpointer) output_fileselection);
  
  gtk_signal_connect (GTK_OBJECT (cancel_button1), "clicked",
                      GTK_SIGNAL_FUNC (my_gtk_widget_destroy),
                      (gpointer) output_fileselection);

  gtk_widget_show(output_fileselection);
  
  return;
}

void
on_data_type_enter_button_clicked(GtkButton* button, gpointer user_data){
  GrmGui * gui= (GrmGui*) user_data;
#ifdef DEBUGMODE
  g_print("on_data_type_enter_button_clicked\n");
#endif /* DEBUGMODE */
  gui->file_io_gui.recog_data_type= gui->file_io_gui.tmp_recog_data_type;
  if(gui->file_io_gui.recog_data_type == GABOR_MAG)
    gtk_entry_set_text((GtkEntry*)gui->file_io_gui.output_file_entry, GABORRG_MAG_DEFAULT_XML_FNAME);
  else if(gui->file_io_gui.recog_data_type == JET)
    gtk_entry_set_text((GtkEntry*)gui->file_io_gui.output_file_entry, GABORRG_JET_DEFAULT_XML_FNAME);
  
  /* clear remainder datas */
  GrmNodeData** face_node_data;
  while(gui->face_node_data_stack){
    face_node_data= gaborrg_maker_face_node_data_stack_pop(&gui->face_node_data_stack);
    gaborrg_maker_face_node_data_delete(face_node_data);
  }
  return;
}

void
on_data_type_rbu_gmag_clicked(GtkButton* button, gpointer user_data){
  GrmGui * gui= (GrmGui*) user_data;
#ifdef DEBUGMODE
  g_print("on_data_type_rbu_gmag_clicked\n");
#endif /* DEBUGMODE */
  gui->file_io_gui.tmp_recog_data_type= GABOR_MAG;
  return;
}

void
on_data_type_rbu_jet_clicked(GtkButton* button, gpointer user_data){
  GrmGui * gui= (GrmGui*) user_data;
#ifdef DEBUGMODE
  g_print("on_data_type_rbu_jet_clicked\n");
#endif /* DEBUGMODE */
  gui->file_io_gui.tmp_recog_data_type= JET;
  return;
}

void
on_output_fileselection_ok_clicked(GtkButton* button,
				   gpointer   user_data){
  GrmGui* gui= (GrmGui*)user_data;
  gchar*  fname;
  
  fname=
    gtk_file_selection_get_filename
    (GTK_FILE_SELECTION (gui->file_io_gui.output_fileselection));

  gtk_entry_set_text((GtkEntry*)gui->file_io_gui.output_file_entry , fname);
  return;
}

void
on_output_fileselection_cancel_clicked(GtkButton* button,
				       gpointer   user_data){
  
  return;
}

void my_gtk_widget_destroy(GtkWidget* widget, GtkWidget* desroy_target){
  gtk_widget_destroy(desroy_target);
  return;
}

void my_gtk_widget_destroy_and_NULL(GtkWidget* widget, GtkWidget** desroy_target){
  gtk_widget_destroy(*desroy_target);
  *desroy_target= NULL;
  return;
}
  
