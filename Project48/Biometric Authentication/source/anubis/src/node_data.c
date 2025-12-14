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
#include "node_data.h"

GrmNodeData*
gaborrg_maker_node_data_new_from_gui(GrmGui* gui){
  MalibFrame * from_frame;
  GrmNodeData* node_data= malloc(sizeof(GrmNodeData));

  /* setting all type of implement function
     (e.g, left clicked implement: node_data->values_item_set_clicked_point_data)*/
  if( gui->file_io_gui.recog_data_type == JET ) {
    gui->face_node_data_stack_output_file= grm_jet_face_node_data_stack_output_file;
    
    node_data->values_item_new_from_gui= grm_jet_new_from_gui;
    node_data->values_item_set_clicked_point_data= grm_set_clicked_point_jet_data;
    node_data->values_item_new_and_copy= grm_jet_new_and_copy;
    node_data->values_item_delete= freeGaborJet;
  }

  /* set template height */
  from_frame= malib_buffer_get_current_frame(gui->gray_buffer);
  node_data->template_height= from_frame->height;
  node_data->template_width=  from_frame->width;

  /* init flag (is_set_as_parts) */
  node_data->is_set_as_parts= 0;

  /* malloc for each_dir_rad_vals */
  /* values_item is now writing and after change each_dir_rad_vals to values_item*/
  node_data->values_item= node_data->values_item_new_from_gui(gui);
  
  return node_data;
}

void gaborrg_maker_set_clicked_point_data_to_node_data(GrmNodeData* node_data,
						       GrmGui* gui){
  MalibBuffer * buffer;
  MalibFrame  * from_frame;

  node_data->x= gui->last_corrected_x;
  node_data->y= gui->last_corrected_y;
  node_data->values_item_set_clicked_point_data(node_data->values_item, gui);
}

GrmNodeData** gaborrg_maker_face_node_data_new_from_gui(GrmGui* gui){
  /**
     malloc for face_node_data**. array length equal to gui->num_parts;
     gui use for set parts_name to face_node_data[i]->parts_name 
  **/
  /* set only parts name */
  GrmNodeData** face_node_data;
  face_node_data= malloc(sizeof(GrmNodeData*) * gui->num_parts);
  int i= 0;
  while(gui->parts_names[i]){
    face_node_data[i]= gaborrg_maker_node_data_new_from_gui(gui);
    face_node_data[i]->parts_name= gui->parts_names[i];
    face_node_data[i]->is_set_as_parts= 0;
    i++;
  }
  face_node_data[i]= NULL;
  return face_node_data;
}

void gaborrg_maker_face_node_data_clear(GrmNodeData** face_node_data){
  /* clear by memcpy from dummy*/
  int i= 0;
  while(face_node_data[i]){
    gaborrg_maker_node_data_clear(face_node_data[i]);
    
  }
  return;
}

void gaborrg_maker_node_data_clear(GrmNodeData* node_data){
  GrmNodeData dummy_node_data;
  char* parts_name;

  parts_name= node_data->parts_name;
  memcpy(node_data, &dummy_node_data, sizeof(GrmNodeData));
  node_data->parts_name= parts_name;
  node_data->is_set_as_parts= 0;
  
  return;
}

void gaborrg_maker_face_node_data_set_parts_name(GrmNodeData** face_node_data,
						 char** parts_names){
  /* set parts names to face_node_data.  like forrow */
  /* face_node_data[i]->parts_name= parts_names[i] */
  /* parts_names and face_node_data needs to be same number */
  int i= 0;
  while(face_node_data[i]){
    if(!(face_node_data[i]) || !(parts_names[i]))
      g_error("not same length face_node_data and parts_names");
    face_node_data[i]->parts_name= parts_names[i];
    i++;
  }
  return;
}

void gaborrg_maker_face_node_data_delete(GrmNodeData** face_node_data){
  int i= 0;
  while(face_node_data[i]){
    face_node_data[i]->values_item_delete(face_node_data[i]->values_item);
    free(face_node_data[i]);
    i++;
  }
  free(face_node_data);
  return;
}

GrmNodeData*
gaborrg_maker_node_data_rcopy(GrmNodeData* target_node_data,
			      GrmNodeData* org_node_data){
  /* copy recursive so it can copy org_node_data->each_dir_rad_vals data */
  int len;
  
  memcpy(target_node_data, org_node_data, sizeof(GrmNodeData));

  /* copy */
  org_node_data->values_item_new_and_copy(&target_node_data->values_item,
					  org_node_data->values_item);

  return target_node_data;
}

void gaborrg_maker_node_data_delete(GrmNodeData* node_data){
  if(node_data->each_dir_rad_vals){
    node_data->values_item_delete(node_data->values_item);
    node_data->each_dir_rad_vals= NULL;
  }
  if(node_data)
    free(node_data);
  return;
}

GrmFaceNodeDataStack*
gaborrg_maker_face_node_data_stack_init(){
  return NULL;
}

GrmFaceNodeDataStack*
gaborrg_maker_face_node_data_stack_new(){
  GrmFaceNodeDataStack* stack;
  stack= malloc(sizeof(GrmFaceNodeDataStack));
  stack->face_node_data= NULL;
  stack->next= NULL;
  return stack;
}

void
gaborrg_maker_face_node_data_stack_push(GrmFaceNodeDataStack ** stack,
					GrmNodeData ** face_node_data){
  GrmFaceNodeDataStack* new_node;
  new_node= gaborrg_maker_face_node_data_stack_new();
  new_node->face_node_data= face_node_data;
  new_node->next= *stack;
  *stack= new_node;
  return;
}

GrmNodeData **
gaborrg_maker_face_node_data_stack_pop(GrmFaceNodeDataStack ** stack){
  GrmNodeData ** face_node_data; /* retptr */
  if (!(*stack)){
    g_error("face_node_data_stack is empty,at gaborrg_maker_face_node_data_stack_pop()\n");
  }
  face_node_data= (*stack)->face_node_data;
  *stack= (*stack)->next;

  return face_node_data;
}

GrmNodeData *
gaborrg_maker_face_node_data_lookup_by_parts_name(GrmNodeData** face_node_data, 
						  char* parts_name){
  /* if find same parts name return one parts_node otherwize return NULL*/
  int i= 0;
  while(face_node_data[i]){
    if(!(strcmp(face_node_data[i]->parts_name, parts_name))){
      return face_node_data[i];
    }
    i++;
  }
  return NULL;
}


int
gaborrg_maker_face_node_data_lookup_array_adder_by_parts_name(GrmNodeData** face_node_data, char* parts_name){
  /* if find same parts name return one parts_node otherwize return NULL*/
  int i= 0;
  while(face_node_data[i]){
    if(!(strcmp(face_node_data[i]->parts_name, parts_name))){
      return i;
    }
    i++;
  }
  return -1;
}


