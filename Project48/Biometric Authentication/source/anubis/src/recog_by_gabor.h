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

#ifndef __RECOG_BY_GABOR_H__
#define __RECOG_BY_GABOR_H__

#include <malib/malib.h>
BEGIN_C_DECLS
typedef struct _RecogByGabor RecogByGabor;
typedef struct _RecogByGaborClass RecogByGaborClass;
typedef struct _RecogByGaborPartsAndCo RecogByGaborPartsAndCo;

#define RECOG_BY_GABOR_CROSSBORDER_LENGTH 5;

#include "gaborrg_recog.h"
#include "gaborrg_recog_gui.h"
#include "gaborrg_recog_file_io.h"
#include "discriminator.h"
#include "kd_tree.h"

struct _RecogByGabor
{
  MalibFilter super;
  GrrXmlGaborRg * gaborrg;
  GrrGui * gui;
  MalibGabor ** malib_gabors;
  MalibFrame ** tmp_malib_frames;
  MalibGtkDisplay * display;
  KdTree * kd_tree;
  GrrXmlGaborRg * xml_gaborrg;
  GrrDiscData * disc_data;

  /* not include NULL */
  /* get length use by disc_data->data_classes_num */
  RecogByGaborPartsAndCo * parts_and_co_array;
  
  int gabor_dirs_num;
  int gabor_rads_num;
  int malib_gabors_num; /* include last null */
  int ** tmp_malib_frame_datas;
  int toggle_write_frame_only;
};
struct _RecogByGaborPartsAndCo
{
  GrrDiscDataClass * data_class;
  double nearest_dist;
  int x;
  int y;
  int allocation_x, allocation_y;
  int is_set;
};

struct _RecogByGaborClass
{
  MalibFilter super;
};

RecogByGabor* recog_by_gabor_new();
RecogByGabor* recog_by_gabor_new_with_buf (MalibBuffer* buf);
void          recog_by_gabor_set_buffer (RecogByGabor*, MalibBuffer* );
RecogByGabor* recog_by_gabor_create_params (RecogByGabor*);
RecogByGabor*
recog_by_gabor_new_with_buf_and_gabors (MalibBuffer* buf,
					int* dirs, int* radiuses,
					int gabor_dirs_num, int gabor_rads_num,
					int scale, char * fname);
MalibGabor ** init_malib_gabors_from_gray_buf(MalibBuffer* gray_buf,
					      int* dirs, int* radiuses, 
					      int gabor_dirs_num, int gabor_rads_num,
					      int scale);
void tmp_malib_frames_set_to_recog_by_gabor(RecogByGabor* filter);
int  set_nearest_node_to_same_name_parts_and_co(RecogByGabor* filter,
						KdNode* nearest_node,
						int im_position,
						MalibFrame* frame
						);
RecogByGaborPartsAndCo* make_parts_and_co_array_from_grr_disc_data(GrrDiscData * disc_data);
void parts_and_co_array_reflesh(GrrDiscData* disc_data, RecogByGaborPartsAndCo* parts_and_co_array);
END_C_DECLS
#endif /* __RECOG_BY_GABOR_H__ */

