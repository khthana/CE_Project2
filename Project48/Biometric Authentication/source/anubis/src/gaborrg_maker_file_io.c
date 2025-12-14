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
#include "gaborrg_maker_file_io.h"

void gabor_mag_face_node_data_stack_output_file(GrmGui* gui){
  xmlDocPtr doc;
  char* fname;
  doc= gabor_mag_stack_data_convert_to_xml(gui, &gui->face_node_data_stack);
  
  xmlDocDump(stdout, doc);/* debug_write */
  fname= (char*)gtk_entry_get_text((GtkEntry*)gui->file_io_gui.output_file_entry);

  xmlSaveFile(fname, doc);
  printf("save xml data to %s\n", fname);
}

xmlDocPtr gabor_mag_stack_data_convert_to_xml(GrmGui* gui, GrmFaceNodeDataStack** stack){
  GrmNodeData ** face_node_data;
  xmlDocPtr doc;
  xmlNodePtr tree;
  /*
   *<GaborRg>
   *  <Templates>
   */
  
  doc= xmlNewDoc("1.0");
  doc->children= xmlNewDocNode(doc, NULL, "GaborRg",NULL);
  tree= xmlNewChild(doc->children, NULL, "Templates", NULL);
  while(*stack){
    face_node_data= gaborrg_maker_face_node_data_stack_pop(stack);
    if(face_node_data[0]){
      gabor_mag_face_node_data_add_to_templates_node(gui, face_node_data, tree);
    }
  }
  
  return doc;
}

void gabor_mag_face_node_data_add_to_templates_node(GrmGui* gui,
						    GrmNodeData** face_node_data,
						    xmlNodePtr node_templates)
{
  /*
   * <Template width='val' height='val'> 
   *   <Cells>
   * 	  <Cell x='val' y='val' dir='val' parts='parts_name'> 
   */
  int i= 0;
  xmlNodePtr node_template, node_cells, node_cell;
  char char_width[100],  char_height[100];
  /* <Template width='val' height='val'> */
  node_template= xmlNewChild(node_templates, NULL, "Template", NULL);
  sprintf(char_width,  "%d", face_node_data[i]->template_width);
  sprintf(char_height, "%d", face_node_data[i]->template_height);
  xmlSetProp(node_template, "width",  char_width);
  xmlSetProp(node_template, "height", char_height);
  printf("%s %s\n",char_width, char_height);
  /* <Cells> */
  /* I think fllow is more better but dosen't
     <Cells x='val' y='val' face_parts='parts_name(nose,mouse,...)'>
       <Cell dir='val' radius='val'>
       value
  */
  char char_x[30], char_y[30], char_dir[30],char_rad[30], char_value[30]; /* silly */

  node_cells= xmlNewChild(node_template, NULL, "Cells", NULL);
  GrmNodeDataValues** each_dir_rad_vals;
  while(face_node_data[i]){
    int j= 0;
    if(face_node_data[i]->is_set_as_parts){
      /*while(face_node_data[i]->each_dir_rad_vals[j]){*/
      each_dir_rad_vals= face_node_data[i]->values_item;
      while(each_dir_rad_vals[j]){
	/* <Cell x='val' y='val' dir='val' parts='parts_name'> */
	sprintf(char_x,    "%d", face_node_data[i]->x);
	sprintf(char_y,    "%d", face_node_data[i]->y);
	sprintf(char_dir,  "%d", each_dir_rad_vals[j]->dir);
	sprintf(char_rad,  "%d", each_dir_rad_vals[j]->radius);
	sprintf(char_value,"%f", each_dir_rad_vals[j]->value);
	node_cell= xmlNewChild(node_cells, NULL, "Cell", char_value);
	xmlSetProp(node_cell, "x", char_x);
	xmlSetProp(node_cell, "y", char_y);
	xmlSetProp(node_cell, "dir", char_dir);
	xmlSetProp(node_cell, "radius", char_rad);
	xmlSetProp(node_cell, "parts", face_node_data[i]->parts_name);
	j++;
      }
    }/*else data does not set (only parts_name) */
    i++;
  }
  return;
}

