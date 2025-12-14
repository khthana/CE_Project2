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
#include "gaborrg_maker_gui.h"

void set_clicked_point_jet_drawarea_clicked(GrmGui* gui, GdkEventButton* event);

void set_resized_csu_image_from_gui(Image image, GrmGui* gui);
  
GrmGui* gaborrg_maker_gui_new (MalibGtkDisplay** displays,
			       MalibBuffer* rgb2gray_buf,
			       MalibFilter* filter, AnubisCVHaarDetectObj* haar_filter)
{
  GrmGui* gui;
  
  gui= malloc (sizeof (GrmGui));
  if (!(gui))
    g_error("memory error! in gaborrg_maker_gui_new()");
  memset (gui, 0, sizeof (GrmGui));

  /* gabor params set to gui */
  {
    int tmp_dirs[]= GABORRG_MAKER_DEFAULT_DIR_ARRAY;
    int tmp_rads[]= GABORRG_MAKER_DEFAULT_RAD_ARRAY;

    gui->displays= displays;
    gui->gray_buffer= rgb2gray_buf;
    gui->filter= filter;
    gui->haar_filter  = haar_filter;

    /*
    gui->gabor_dirs= malloc(sizeof(tmp_dirs));
    gui->gabor_radius= malloc(sizeof(tmp_rads));
    memcpy(gui->gabor_dirs, tmp_dirs, sizeof(tmp_dirs));
    memcpy(gui->gabor_radius, tmp_rads, sizeof(tmp_rads));
    */
    
    /* set number of malib_to_frames (dir * radius + 1)*/
    /* Fixme: forrow use DEFALT VALUE so rewrite to set from xml file */
    gui->num_tmp_malib_to_frames= GABOR_DIR_NUM * GABOR_RAD_NUM + 1; /* +1 for NULL */
    /* set parts names and num */
    /* Fixme: forrow use DEFAULT VALUE so rewrite to set from xml file */
    gaborrg_maker_set_parts_names_and_num_to_gui_from_default(gui);

    
    /* filtered data tmp buffers (use during display halt)*/
    gui->tmp_node_data=   NULL;
    gui->face_node_data=  NULL;
    /* filtered data stack (use after Enter button) */
    gui->face_node_data_stack= gaborrg_maker_face_node_data_stack_init();
  }
  /* setup ebgm params (jets too) */
  grm_ebgm_params_setup(gui);
  
  /* widget set to gui*/
  {
    GtkWidget * fixed1;
    /* generate all DIR and RAD of MalibGabor */
    gui->window= create_gaborrg_maker_window();
    
    fixed1= lookup_widget(gui->window, "fixed1");
    gui->statusbar1= lookup_widget(fixed1, "statusbar1");
  }
  /* create indicator gdk_pixmap */
  {
    GtkPixmap* tmp_gtk_pixmap;
    add_pixmap_directory (PACKAGE_DATA_DIR "/pixmaps");
    add_pixmap_directory (PACKAGE_SOURCE_DIR "/pixmaps");

    tmp_gtk_pixmap= (GtkPixmap*)create_pixmap (gui->window, GABORRG_MAKER_INDICATOR_PIXMAP_NAME);
    gui->parts_button_indicator_pixmap= tmp_gtk_pixmap->pixmap;
    gui->parts_button_indicator_pixmap_mask= tmp_gtk_pixmap->mask;

    tmp_gtk_pixmap= (GtkPixmap*)create_pixmap (gui->window,
                                               GABORRG_MAKER_INDICATOR_DUMMY_PIXMAP_NAME);
    gui->parts_button_indicator_dummy_pixmap= tmp_gtk_pixmap->pixmap;
    gui->parts_button_indicator_dummy_pixmap_mask= tmp_gtk_pixmap->mask;
  }
  gaborrg_maker_gui_setup(gui, NULL);

  return gui;
}

void gaborrg_maker_gui_setup (GrmGui* gui, MalibObject* handler)
{
  MalibGtkDisplay** displays= gui->displays;

  /* window 1 */
  {
    GtkWidget * fixed1, * viewport2, * drawingarea1, * malib_drawingarea;
    gtk_widget_show(gui->window);

    gtk_signal_connect(GTK_OBJECT (gui->window), "delete_event",
		       GTK_SIGNAL_FUNC (gtk_main_quit), NULL);

    fixed1=       lookup_widget(gui->window, "fixed1");
    viewport2=    lookup_widget(fixed1, "viewport2");
    drawingarea1= lookup_widget(viewport2, "drawingarea1");
    malib_drawingarea= GTK_WIDGET (malib_gtkdisplay_get_drawarea (displays[GRM_DEFAULT_DISPLAY_NUM]));
      
    gtk_container_remove(GTK_CONTAINER (viewport2), drawingarea1);
    
    gtk_container_add (GTK_CONTAINER (viewport2), malib_drawingarea);
    gtk_signal_connect (GTK_OBJECT (viewport2), "button_press_event",
			GTK_SIGNAL_FUNC (drawingarea1_clicked), gui);
    
    gtk_widget_ref(malib_drawingarea);
    gtk_object_set_data_full (GTK_OBJECT(gui->window), "drawingarea1", malib_drawingarea,
			      (GtkDestroyNotify) gtk_widget_unref);
    
    gtk_widget_set_usize(viewport2, BTTV_DEFAULT_WIDTH,BTTV_DEFAULT_HEIGHT);
    
    /* setup right scrollwindow*/
    right_scroll_window_setup(gui);
    gaborrg_maker_file_io_gui_setup(gui);
    /*gtk_button_new();*/
  }
  
  return ;
}

void
right_scroll_window_setup(GrmGui* gui){

  GtkWidget * scrolledwindow1, * fixed2, * table1, * label_parts, * label_set; 

  /*Fixme:needs to rewrite to get button height from button widgets*/
  int button_height= 24;
  int table_height= button_height * (gui->num_parts + 1);
  int start_offset_x= 5;
  int start_offset_y= 5;
  int other_group_widget_space_y= 5;/*e.g table1 to Enter button sapce*/
  scrolledwindow1= lookup_widget(gui->window, "scrolledwindow1");
  fixed2=          lookup_widget(scrolledwindow1, "fixed2");

  table1= gtk_table_new(gui->num_parts,2,FALSE);
  gtk_widget_ref (table1);
  gtk_object_set_data_full (GTK_OBJECT (gui->window), "table1", table1,
			    (GtkDestroyNotify) gtk_widget_unref);
    
  gtk_widget_show (table1);
  gtk_fixed_put (GTK_FIXED (fixed2), table1, start_offset_x, start_offset_y);
  gtk_widget_set_uposition (table1, start_offset_x, start_offset_y);

  gtk_widget_set_usize (table1,
			gui->max_parts_name_len *
			GABORRG_MAKER_DEFAULT_FONT_PIXEL_WIDTH +
			GABORRG_MAKER_DEFAULT_INDICATOR_PIXEL_WIDTH,
			table_height);

  label_parts= gtk_label_new("parts");
  gtk_widget_ref (label_parts);
  gtk_object_set_data_full (GTK_OBJECT (gui->window), "label_parts", label_parts,
			    (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label_parts);
  gtk_table_attach (GTK_TABLE (table1), label_parts, 0, 1, 0, 1,
		    (GtkAttachOptions) (GTK_FILL),
		    (GtkAttachOptions) (0), 0, 0);
  gtk_misc_set_alignment (GTK_MISC (label_parts), 0, 0.5);

  label_set = gtk_label_new ("set");
  gtk_widget_ref (label_set);
  gtk_object_set_data_full (GTK_OBJECT (gui->window), "label_set", label_set,
			    (GtkDestroyNotify) gtk_widget_unref);
  gtk_widget_show (label_set);
  gtk_table_attach (GTK_TABLE (table1), label_set, 1, 2, 0, 1,
		    (GtkAttachOptions) (GTK_FILL),
		    (GtkAttachOptions) (0), 0, 0);
  gtk_widget_set_usize (label_set, 37, 18);

  /* +1 for last NULL node*/
  gui->parts_buttons= malloc((sizeof (GtkWidget *)) * (gui->num_parts + 1));
  gui->parts_button_indicators= malloc((sizeof (GtkWidget *)) * (gui->num_parts + 1));
  gui->parts_button_indicators_status= malloc(sizeof(int) * (gui->num_parts + 1));
  char pixmap_n_name[50]; /* silly way */
  int i= 0;
  scrolledwindow1= lookup_widget(gui->window, "scrolledwindow1");
  fixed2=          lookup_widget(scrolledwindow1, "fixed2");
  /* generate and put parts_buttons and dummy indicator */
  while(gui->parts_names[i]){
    /* parts buttons */
    {
      gui->parts_buttons[i]= gtk_button_new_with_label (gui->parts_names[i]);
      gtk_widget_ref (gui->parts_buttons[i]);
      gtk_object_set_data_full (GTK_OBJECT (gui->window), gui->parts_names[i], gui->parts_buttons[i],
				(GtkDestroyNotify) gtk_widget_unref);
      gtk_widget_show (gui->parts_buttons[i]);
      gtk_table_attach (GTK_TABLE (table1), gui->parts_buttons[i], 0, 1, i+1, i+2,
			(GtkAttachOptions) (GTK_FILL),
			(GtkAttachOptions) (0), 0, 0);

      gtk_signal_connect (GTK_OBJECT (gui->parts_buttons[i]), "clicked",
			  GTK_SIGNAL_FUNC (parts_button_clicked),
			  gui);
      gtk_widget_set_sensitive (gui->parts_buttons[i], FALSE);
    }
    /* indicator */
    {
      gui->parts_button_indicators_status[i]= 0;
      gui->parts_button_indicators[i] =
	gtk_pixmap_new(gui->parts_button_indicator_dummy_pixmap,
		       gui->parts_button_indicator_dummy_pixmap_mask);

      gtk_widget_ref (gui->parts_button_indicators[i]);
      sprintf(pixmap_n_name, "pixmap%d", i);
      gtk_object_set_data_full (GTK_OBJECT (gui->window), pixmap_n_name,
				gui->parts_button_indicators[i],
				(GtkDestroyNotify) gtk_widget_unref);
      gtk_table_attach (GTK_TABLE (table1), gui->parts_button_indicators[i], 1, 2, i+1, i+2,
			(GtkAttachOptions) (GTK_FILL),
			(GtkAttachOptions) (0), 0, 0);
      gtk_widget_show (gui->parts_button_indicators[i]);
    }
    i++;
  }
  /* last node inseart NULL*/
  gui->parts_buttons[i]= NULL;   
  gui->parts_button_indicators[i]= NULL;
  
  GtkWidget * parts_enter_button;/*parts_enter_button*/
  int parts_enter_button_position_y=
    start_offset_y
    + table_height
    + other_group_widget_space_y;
  parts_enter_button= gtk_button_new_with_label ("Enter");
  gtk_widget_ref (parts_enter_button);
  gtk_object_set_data_full (GTK_OBJECT (gui->window), "parts_enter_button",
			    parts_enter_button,
			    (GtkDestroyNotify) gtk_widget_unref);
  gtk_fixed_put (GTK_FIXED (fixed2), parts_enter_button,
		 start_offset_x, parts_enter_button_position_y);
  gtk_widget_show (parts_enter_button);
  gtk_widget_set_sensitive (parts_enter_button, FALSE);

  gtk_signal_connect (GTK_OBJECT (parts_enter_button), "clicked",
		      parts_enter_button_clicked,
		      gui);
  gui->parts_enter_button= parts_enter_button;
}

void
drawingarea1_clicked (GtkWidget* widget, GdkEventButton* event, GrmGui* gui)
{
  int corrected_x,corrected_y;

  /* get and set coordinate and correction */
  corrected_x= get_corrected_clicked_coordinate_x(widget, event, gui);
  corrected_y= get_corrected_clicked_coordinate_y(widget, event, gui);
  gui->last_corrected_x= corrected_x;
  gui->last_corrected_y= corrected_y;

  /* event status skelton */
  /* forrow skelton code written in forrow func (somename_drawarea_clicked) 	   */
  /*********************************************************************************/
  /* if (event->button == 1){							   */
  /*   if (gui->halt_first_left_button)						   */
  /*     proc								           */
  /*   proc									   */
  /* else  if (event->button == 3)						   */
  /*   proc									   */
  /* else									   */
  /*   proc									   */
  /*********************************************************************************/
  /* main process */
  set_halt_status_drawarea_clicked(gui, event); 
  toggle_start_and_stop_drawarea_clicked (gui, event);
  set_widget_status_drawarea_clicked(gui, event); /* wake up parts buttons */
  set_clicked_point_data_drawarea_clicked(gui, event);
  message_to_statusbar_drawarea_clicked(gui, event);

  /* remain process witten in forrow */
  /* and event skelton */
  if (event->button == 1){
    /* clicked button1 (left button) */
    if (gui->halt_first_left_button){
    }
    /* output coordinate */
    g_print("x=%f,y=%f corrected x=%d y=%d\n",
	      event->x, event->y,corrected_x,corrected_y);
    return;
  }else  if (event->button == 3){
    /* clicked button3 (right button) */
    return;
  }else{
    return;
  }
}

int
toggle_start_and_stop_drawarea_clicked (GrmGui * gui, GdkEventButton* event)
{
  MalibSink* sink= (MalibSink*)gui->displays[GRM_DEFAULT_DISPLAY_NUM];
  
  if(event->button==1){
    if(malib_sink_get_status (sink) == MALIB_SINK_RUNNING){
      malib_sink_set_status (sink,MALIB_SINK_HALT);
    }
    g_print("left button clicked, get image status\n");/* debug_write */
  }else if(event->button == 3) {
    /* toggle RUNNING */
    MalibSinkStatus status= malib_sink_get_status (sink);
    malib_sink_set_status (sink,((status == MALIB_SINK_RUNNING) ?
				 MALIB_SINK_HALT : MALIB_SINK_RUNNING));
    g_print("right button clicked, toggle start and stop\n");/* debug_write */
    
    if(status == MALIB_SINK_HALT){
      /* for rerun, free tmp frames */
      int i;
      for(i= 0; i < GABOR_DIR_NUM * GABOR_RAD_NUM; i++){
	if(gui->tmp_malib_to_frames[i]){
	  malib_frame_delete(gui->tmp_malib_to_frames[i]);
	  gui->tmp_malib_to_frames[i]= NULL;
	}
      }
      return(1);
    }
  }
  return(0);
}

void set_halt_status_drawarea_clicked(GrmGui * gui, GdkEventButton * event){
  /* button 1 (left button) RUNNING->HALT or HALT->HALT
     button 2 (right button) toggle */
  MalibSink* sink= (MalibSink*)gui->displays[GRM_DEFAULT_DISPLAY_NUM];
  
  /* setting halt status (it's looks like silly so I want to rewrite)*/
  /* case
     1,RUNNING -> halt by right clicked -> left clicked : halt_first_left_button= TRUE
     2,RUNNING -> halt by left  clicked                 : halt_first_left_button= TRUE
     3,ohterwise                                        : halt_first_left_button= FALSE
  */
  if(malib_sink_get_status (sink) == MALIB_SINK_RUNNING){
    /* RUNNING */
    if(event->button == 1){
      /* case 2 */
      gui->halt_first_left_button= TRUE;

    }else if(event->button == 3){
      gui->halt_first_right_button= TRUE;
    }
  }else{
    /* HALT */
    if(gui->halt_first_right_button){
      /* case 1 */
      gui->halt_first_left_button= TRUE;
      gui->halt_first_right_button= FALSE;
    }else{
      gui->halt_first_left_button= gui->halt_first_right_button= FALSE;
    }
  }
  /* end setting halt status */
  return;
}

void set_widget_status_drawarea_clicked(GrmGui * gui, GdkEventButton * event){

  /* only dependent running status */
  MalibSink* sink= (MalibSink*)gui->displays[GRM_DEFAULT_DISPLAY_NUM];
  if(malib_sink_get_status (sink) == MALIB_SINK_RUNNING){
    gtk_widget_set_sensitive(gui->file_io_gui.data_type_enter_button, TRUE);
  }else{
    gtk_widget_set_sensitive(gui->file_io_gui.data_type_enter_button, FALSE);
  }

  if (event->button == 1){
    if (gui->halt_first_left_button){
      /* wakeup parts_buttons and Enter button */
      parts_buttons_all_set_sensitive(gui, TRUE);
      gtk_widget_set_sensitive(gui->parts_enter_button, TRUE);
    }
  }else if(event->button == 3){
    parts_buttons_all_set_sensitive(gui, FALSE);
    gtk_widget_set_sensitive(gui->parts_enter_button, FALSE);
    /* all parts button indicator hidden */
    {
      gaborrg_maker_all_parts_buttons_indicator_appear_or_not(gui,0);
    }
  }
  return;
}

int get_corrected_clicked_coordinate_x(GtkWidget * widget,
				       GdkEventButton * event,
				       GrmGui * gui){
  MalibFrame  * from_frame;
  int corrected_x;
  from_frame= malib_buffer_get_current_frame(gui->gray_buffer);
  corrected_x= (int)(event->x * (from_frame->width /
				 (float)widget->allocation.width));
  return corrected_x;
}

int get_corrected_clicked_coordinate_y(GtkWidget * widget,
				       GdkEventButton * event,
				       GrmGui * gui){
  MalibFrame  * from_frame;
  int corrected_y;
  from_frame= malib_buffer_get_current_frame(gui->gray_buffer);
  corrected_y= (int)(event->y * (from_frame->height  /
				 (float)widget->allocation.height));
  return corrected_y;
}

void set_clicked_point_data_drawarea_clicked(GrmGui* gui,
					     GdkEventButton* event){
  /* set clicked point to */
  if (event->button == 1){
    if (gui->halt_first_left_button){
      if( gui->file_io_gui.recog_data_type == JET ){
	set_resized_csu_image_from_gui (gui->ebgm_data->cur_image, gui);
      }
    }
    /* set memory for tmp face nodes */
    if(!(gui->tmp_node_data))
      gui->tmp_node_data=  gaborrg_maker_node_data_new_from_gui(gui);
    if(!(gui->face_node_data))
      gui->face_node_data= gaborrg_maker_face_node_data_new_from_gui(gui);
    gaborrg_maker_set_clicked_point_data_to_node_data(gui->tmp_node_data, gui);
  }else if(event->button == 3){
    /* for restart, if it is first stop case but it can ignore forrow effort
     * destory gui->tmp_node_data and gui->face_node_data and after set NULL */
    /* Fixme: forrow code not _delete but _clear_and_initialize is more better*/
    if(gui->tmp_node_data){
      gaborrg_maker_node_data_delete(gui->tmp_node_data);
      gui->tmp_node_data= NULL;
    }
    if(gui->face_node_data){
      gaborrg_maker_face_node_data_delete(gui->face_node_data);
      gui->face_node_data= NULL;
    }
  }
  return;
}

/* needless */
void set_clicked_point_jet_drawarea_clicked(GrmGui* gui, GdkEventButton* event){
  if (event->button == 1){
    /* clicked button1 (left button) */
    if (gui->halt_first_left_button){
    }
    grm_set_clicked_point_jet_data(NULL, gui);
    return;
  }else  if (event->button == 3){
    /* clicked button3 (right button) */
    return;
  }else{
    return;
  }
  return;
}

void message_to_statusbar_drawarea_clicked(GrmGui *gui,
					    GdkEventButton *event){
  guint context_id;
  int mes_num= 100;
  gchar* message[mes_num]; /* denger? */

  MalibSink* sink= (MalibSink*)gui->displays[GRM_DEFAULT_DISPLAY_NUM];
  MalibSinkStatus status= malib_sink_get_status (sink);
  
  context_id= gtk_statusbar_get_context_id( GTK_STATUSBAR(gui->statusbar1),
					    "get gabor filtered frame message");
  if (event->button == 1){
      g_snprintf(message, mes_num,
		 "get gabor filtered values at x = %d, y = %d",
		 gui->last_corrected_x,gui->last_corrected_y);
  }else if (event->button == 3){
    if(status == MALIB_SINK_RUNNING){
      g_snprintf(message, mes_num, "display restart");
    }else{
      g_snprintf(message, mes_num, "display halt");
    }
  }
  gtk_statusbar_push( GTK_STATUSBAR(gui->statusbar1), context_id,message);
  return;
}
  
void
parts_buttons_all_set_sensitive(GrmGui* gui, gboolean sensitive){
  int i= 0;
  while(gui->parts_buttons[i]){
    gtk_widget_set_sensitive(gui->parts_buttons[i], sensitive);
    i++;
  }
  return;
}


void
parts_enter_button_clicked(GtkWidget *widget, GrmGui *gui)
{
  /* face node data push to stack flow *
   * 
   1 drawingarea1 clicked by leftbutton
   *
   2 get coordinate and set to gui (drawingarea1_clicked())
   *
   3 if gui->tmp_node_data and gui->face_node_data is NULL
   * get memory and initialize them (set_clicked_point_data_drawarea_clicked())
   *
   4 when parts_button clicked, gui->tmp_node_data memcpy to
   * same button's parts_name gui->face_node_data[n] (parts_button_clicked())
   *
   5 when enter button clicked, gui->face_node_data addressing data move to stack
   * and new memory give for gui->face_node_data; (parts_enter_button_clicked(), here!)
   *
   6 goto 1 or 4(sometime)
  */

  gaborrg_maker_face_node_data_stack_push(&gui->face_node_data_stack,
					  gui->face_node_data);
  gui->face_node_data= gaborrg_maker_face_node_data_new_from_gui(gui);
 
  /* indicator and messages */
  {
    gaborrg_maker_all_parts_buttons_indicator_appear_or_not(gui,0);
  
    gchar* message= "all parts data save to buffer. restart click on drawarea by right button";
    guint context_id= gtk_statusbar_get_context_id( GTK_STATUSBAR(gui->statusbar1),
						   "parts_enter_button message");
    gtk_statusbar_push( GTK_STATUSBAR(gui->statusbar1),context_id,message);

    g_print("parts_enter_button_clicked!\n");
  }
  return;
}

void
parts_button_clicked(GtkWidget *widget, GrmGui * gui){
  int i= 0;
  int context_id;
  int mes_num= 100;
  gchar * message[mes_num];
  char *  button_string;
  GrmNodeData * parts_node_data;

  /* look up parts_buttons and get array number */
  while(gui->parts_buttons[i]){
    if(gui->parts_buttons[i] == widget){
      break;
    }
    i++;
  }

  /* get same parts_name face_node_data[n] */
  button_string= (char*) get_button_label_string((GtkButton*)gui->parts_buttons[i]);
  parts_node_data=
    gaborrg_maker_face_node_data_lookup_by_parts_name(gui->face_node_data,
						      button_string);/* lookup */
  if(! (parts_node_data))
    g_error("can't lookup such a parts name in gui->face_node_data %s", button_string);
  /* toggle indicators and data set to parts_node_data (now writing)*/
  if(gui->parts_button_indicators_status[i]){
    /* indicator disapeer */
    gaborrg_maker_parts_buttons_indicator_appear_or_not
      (gui,gui->parts_button_indicators[i],
       &gui->parts_button_indicators_status[i], 0);
    if(parts_node_data){
      /* data clear from gui->face_node_data[n] */
      gaborrg_maker_node_data_clear(parts_node_data);
    }

    /* output message (info about delete data) create */
    g_snprintf(message, mes_num, "delete gabor filtered values from %s",
	       ((GtkLabel*)((GtkButton*)widget)->child)->label);
    g_print("%s\n",message);
  }else{
    /* indicator appear */
    gaborrg_maker_parts_buttons_indicator_appear_or_not
      (gui, gui->parts_button_indicators[i],
       &gui->parts_button_indicators_status[i], 1);
    /* memcpy to gui->face_node_data[n] from gui->tmp_node_data */
    if(parts_node_data){
      if(gui->tmp_node_data){
	g_print("debug: gui->tmp_node_data is not NULL. before gui->tmp_node_data memcopy to parts_node_data\n");/* debug_write */
      }

      /* replace to rcopy */
      /* memcpy(parts_node_data, gui->tmp_node_data, sizeof(GrmNodeData)); */
      gaborrg_maker_node_data_rcopy(parts_node_data, gui->tmp_node_data);
      parts_node_data->parts_name= (char*)button_string;
      parts_node_data->is_set_as_parts= 1;

    }else{
      /* error case */
    }
    /* output message (info about set data) create */
    g_snprintf(message, mes_num,
	       "set gabor filtered values to %s, parts_node_data_x= %d parts_node_data_y= %d",
	       ((GtkLabel*)((GtkButton*)widget)->child)->label,
	       parts_node_data->x, gui->face_node_data[i]->x);
    g_print("%s\n",message);

  }
  /* message output to status bar*/
  context_id= gtk_statusbar_get_context_id( GTK_STATUSBAR(gui->statusbar1),
					    "parts_button message");
  gtk_statusbar_push( GTK_STATUSBAR(gui->statusbar1),context_id,message);
  /* show indicator */
  gtk_widget_show (gui->parts_button_indicators[i]);
  gtk_widget_queue_draw(gui->parts_button_indicators[i]);
  return;
}

void gaborrg_maker_set_parts_names_and_num_to_gui_from_default(GrmGui* gui){
  /* set parts names */
  char* tmp_parts_names[]= GABORRG_MAKER_DEFAULT_PARTS;
  int tmp_parts_names_num;
  int max_parts_name_len= 0;
  gui->parts_names= calloc(1, sizeof(tmp_parts_names));
  int i= 0;
  while(tmp_parts_names[i]){
    if(max_parts_name_len < strlen(tmp_parts_names[i]))
      max_parts_name_len= strlen(tmp_parts_names[i]);
    gui->parts_names[i]= calloc(strlen(tmp_parts_names[i]),sizeof(char));
    strcpy(gui->parts_names[i], tmp_parts_names[i]);
    i++;
  }
  gui->parts_names[i]= NULL; /* last 1 is NULL */
  gui->num_parts= i+1; /* +1 because insert parts_names length */
  gui->max_parts_name_len= max_parts_name_len;
}


void gaborrg_maker_parts_buttons_indicator_appear_or_not(GrmGui* gui,
							GtkWidget* indicator, int* parts_button_status,
							int bool){
  /* show indicator if bool is true , false hidden*/
  /* use like this,
     (attention 3rd arg!, int address (not array header) sending to parts_button_status)
    gaborrg_maker_parts_buttons_indicator_appear_or_not
    (gui, gui->parts_button_indicators[i],
     &gui->parts_button_indicators_status[i], 0); */
  GdkPixmap * pixmap;
  GdkBitmap * mask;
  if(bool){
    pixmap= gui->parts_button_indicator_pixmap;
    mask=   gui->parts_button_indicator_pixmap_mask;
    *parts_button_status= 1;
  }else{
    pixmap= gui->parts_button_indicator_dummy_pixmap;
    mask=   gui->parts_button_indicator_dummy_pixmap_mask;
    *parts_button_status= 0;
  }    
  gtk_pixmap_set((GtkPixmap*)indicator, pixmap, mask);
  gtk_widget_ref (indicator);
  return;
}

void gaborrg_maker_all_parts_buttons_indicator_appear_or_not(GrmGui* gui,
							    int bool){
  int i= 0;
  while(gui->parts_buttons[i]){
    gaborrg_maker_parts_buttons_indicator_appear_or_not(gui,
						       gui->parts_button_indicators[i],
						       &gui->parts_button_indicators_status[i],
						       bool);
    i++;
  }
  return;
}

gchar* get_button_label_string(GtkButton* button){
  return ((GtkLabel*)button->child)->label;
}

void set_resized_csu_image_from_gui(Image image, GrmGui* gui){
  /*
    resized and hist equald by biggest face rect
   */
  
  MalibFrame* frame;
  CvRect face_rect;
  int face_num, need_increment; /*begin_x, end_x, */
  int scale= gui->haar_filter->faces_scale;
  double resize_rate;
  face_num= get_biggest_width_face_num(gui->haar_filter->faces);
  if(face_num < 0){
    resize_rate= 1.0;
  } else {
    face_rect= *(CvRect*)cvGetSeqElem( gui->haar_filter->faces, face_num );
    /*
    begin_x= face_rect.x * scale;
    end_x  = (face_rect.x + face_rect.width) * scale;
    */
    resize_rate= FACE_ALLOCATED_WIDTH / (double)(face_rect.width * scale) ; 
    if(resize_rate > 1.0){
      resize_rate= 1.0;
    }
  }
  /* debug for resize rate only allocate 1.0 */
  /*resize_rate= 1.0;*/


  frame= malib_buffer_get_current_frame ((MalibFilter*)gui->gray_buffer);
  
  set_resized_csu_image_from_cv_frame(gui->ebgm_data->cur_image, frame, resize_rate);

  if(gui->haar_filter->faces->total)
    histEqualRect(gui->ebgm_data->cur_image, FACE_HIST_BIN,
		  face_rect.y * resize_rate, face_rect.x * resize_rate,
		  (face_rect.y + face_rect.height) * resize_rate , (face_rect.x + face_rect.width) * resize_rate);
		

  
  
  gui->resize_rate= resize_rate;
#ifdef DEBUGMODE
  g_print ("resize_rate %f\n", resize_rate);
#endif /* DEBUGMODE */
  return;
}

