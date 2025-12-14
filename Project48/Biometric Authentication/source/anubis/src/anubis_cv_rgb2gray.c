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
#include "anubis_cv_rgb2gray.h"

void
anubis_cv_rgb2gray_write_frame_data (AnubisCVRgb2Gray* filter, MalibFrame* frame);

static AnubisCVRgb2GrayClass anubis_cv_rgb2gray_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_rgb2gray_write_frame_data
};

AnubisCVRgb2Gray*
anubis_cv_rgb2gray_new_with_buf(MalibBuffer* buf){
  AnubisCVRgb2Gray * filter;
  MalibFrame      * frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVRgb2Gray, &anubis_cv_rgb2gray_class,
			       MALIB_FRAME_COLORMODEL_RGB, &filter);

  frame= anubis_create_frame_from_buf ((MalibFilter*) filter,
				      buf, MALIB_FRAME_COLORMODEL_GRAY);


  malib_filter_set_buffer_with_frame (filter, buf, frame);
  
  return filter;
}


/* private functions **************************************************/
void
anubis_cv_rgb2gray_write_frame_data (AnubisCVRgb2Gray* filter, MalibFrame* frame){

  MalibFrame           * preview_frame;

  malib_filter_preprocess ((MalibFilter*) filter, frame);
  
  preview_frame= malib_buffer_get_current_frame(((MalibFilter*)filter)->buf);

  unsigned char* from= preview_frame->data;
  unsigned char* to= frame->data;

  int i,j,image_size, colors;
  colors= MALIB_FRAME_DEFAULT_NUM_COLORS(preview_frame->model);
  
  image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);

  for (i= 0, j= 0; i < image_size; i++, j+= 3){
    to[i]= from[j];
    to[i]= from[j+1];
    to[i]= from[j+2];
  }

  return;
}
