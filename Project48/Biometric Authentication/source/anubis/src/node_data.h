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
#ifndef __NODE_DATA_H__
#define __NODE_DATA_H__
#include <malib/malib.h>

#include "../glade_gui_src/glade_support.h"
#include "../glade_gui_src/glade_interface.h"

BEGIN_C_DECLS
typedef struct _GrmNodeData GrmNodeData;
typedef struct _GrmNodeDataValues GrmNodeDataValues;
typedef struct _GrmFaceNodeDataStack GrmFaceNodeDataStack;

/*typedef struct GrmNodeData* GrmFaceNodeData;*/
#include "gaborrg_maker_gui.h"
#include "gaborrg_maker_file_io.h"

struct _GrmNodeDataValues
{
  /* filterd result value at one coordinate from one dir and radian*/
  int dir;
  int radius;
  double value;
};

/* GrmFaceNodeData is each face pars data and
   GrmNodeData array calls face_node_data */
struct _GrmNodeData
{
  /* each parts node data */
  char * parts_name;/*like "mouse", "nose", etc...*/
  int x;
  int y;
  int template_height;
  int template_width;
  int is_set_as_parts; /* use when push parts button */

  void * (* values_item_new_from_gui)(GrmGui* gui);
  void   (* values_item_set_clicked_point_data)(void* target_item, GrmGui* gui);
  void   (* values_item_new_and_copy)(void* target_item_addr, void* orginal_item);
  void   (* values_item_delete)(void* values_item);
  void * values_item; /* like jet, each_dir_rad_vals */
  GrmNodeDataValues ** each_dir_rad_vals; /* each dir and rad value */
};

struct _GrmFaceNodeDataStack
{
  GrmNodeData ** face_node_data;
  GrmFaceNodeDataStack * next;
};

#if 0
GrmNodeData*
gaborrg_maker_node_data_new_from_gui(GrmGui*);
void
gaborrg_maker_set_clicked_point_data_to_node_data(GrmNodeData*,
						  GrmGui*);

void gaborrg_maker_node_data_delete(GrmNodeData*);

#endif /* 0 */

GrmNodeData** gaborrg_maker_face_node_data_new_from_gui(GrmGui*);
void gaborrg_maker_face_node_data_clear(GrmNodeData**);
void gaborrg_maker_node_data_clear(GrmNodeData*);
void gaborrg_maker_face_node_data_set_parts_name(GrmNodeData** face_node_data,
					 char** parts_names);
void gaborrg_maker_face_node_data_delete(GrmNodeData**);

GrmFaceNodeDataStack*
gaborrg_maker_face_node_data_stack_init();
GrmFaceNodeDataStack*
gaborrg_maker_face_node_data_stack_new();
void
gaborrg_maker_face_node_data_stack_push(GrmFaceNodeDataStack**,
					GrmNodeData**);
GrmNodeData **
gaborrg_maker_face_node_data_stack_pop(GrmFaceNodeDataStack **);

GrmNodeData *
gaborrg_maker_face_node_data_lookup_by_parts_name(GrmNodeData** , char*);

int
gaborrg_maker_face_node_data_lookup_array_adder_by_parts_name(GrmNodeData** , char*);

GrmNodeData* gaborrg_maker_node_data_rcopy (GrmNodeData*, GrmNodeData*);/* now writing */



END_C_DECLS
#endif /* __NODE_DATA_H__ */
