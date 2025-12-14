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
#include "anubis_cv_snake.h"

void anubis_cv_snake_create_param (retptr);

void anubis_cv_snake_write_frame_data (AnubisCVSnake* filter, MalibFrame* frame);
  
static AnubisCVSnakeClass anubis_cv_snake_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_snake_write_frame_data
};

AnubisCVSnake*
anubis_cv_snake_new_with_buf (MalibBuffer* buf){
  AnubisCVSnake * filter;
  MalibFrame   * prev_frame, * frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVSnake, &anubis_cv_snake_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY,
			       &filter);

  prev_frame= malib_buffer_get_current_frame(buf);
  
  frame= anubis_create_frame_from_buf ((MalibFilter*) filter,
				      buf, prev_frame->model);

  malib_filter_set_buffer(filter, buf);
  
  /*malib_filter_set_buffer_with_frame (filter, buf, frame);*/
  
  /*anubis_cv_snake_create_param (filter);*/
  
  return filter;
  
}



/*********** private ***********************************************************/

void anubis_cv_snake_create_param (AnubisCVSnake * filter){
  
  return;
}


void anubis_cv_snake_write_frame_data (AnubisCVSnake* filter, MalibFrame* frame){
  int i, j, k;

  MalibBuffer * gray_buf;
  int * gray_data;
  int   image_size;

  CvSize size;
  IplImage * gray_img;
  

  gray_buf = ((MalibFilter*)filter)->buf;

  malib_merger_preprocess ((MalibMerger*) filter, frame);
  
  gray_data = malib_buffer_get_current_frame (gray_buf) -> data;
  image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);

  size.width = frame->width;
  size.height= frame->height;

  frame->data= gray_data;
  return;
}
