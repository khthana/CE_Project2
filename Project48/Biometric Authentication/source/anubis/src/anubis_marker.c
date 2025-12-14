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

#include "anubis_marker.h"

/*
  marking used by gdk darw_line
  now writing
 */

void anubis_marker_write_frame_data (AnubisMarker* filter, MalibFrame* frame);
void draw_cross_line (GtkWidget* drawingarea, int x, int y);

/* virtual function table *******************************************/
static AnubisMarkerClass anubis_marker_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_marker_write_frame_data
};

/* public functions **************************************************/

AnubisMarker*
anubis_marker_new_with_buf_and_filters (MalibBuffer* buf,
				       AnubisMarkerFilter** marker_filters){
  

  AnubisMarker * filter;
  MalibFrame * prev_frame, * frame;

  
  prev_frame    = malib_buffer_get_current_frame (buf);

  MALIB_FILTER_GENERIC_NEW_0 (AnubisMarker, &anubis_marker_class,
			      MALIB_FRAME_COLORMODEL_RGB |
			      MALIB_FRAME_COLORMODEL_GRAY,
			      &filter);

  frame= anubis_create_frame_from_buf ((MalibFilter*) filter,
				      buf, prev_frame->model);

  malib_filter_set_buffer_with_frame (filter, buf, frame);
  
  filter->cur_cv_img= anubis_create_cv_image_headder_from_malib_frame (prev_frame);

  filter->marker_filters= marker_filters;

  return filter;
}
					 

/* private functions ************************************************/

void anubis_marker_write_frame_data (AnubisMarker* filter, MalibFrame* frame){
  
  unsigned char * src_data;
  int i,x,y, allocation_x, allocation_y, need_increment;
  MalibFrame  * prev_frame;
  MalibBuffer * buf;

  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_filter_preprocess ((MalibFilter*) filter, frame);
  
  buf = ((MalibFilter*) filter)->buf;

  prev_frame = malib_buffer_get_current_frame (buf);

  /* copy frame data */
  ANUBIS_CV_IMAGE_PIXTYPE * from= prev_frame->data;
  ANUBIS_CV_IMAGE_PIXTYPE * to  = frame->data;
  
  int image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);
  for(i= 0; i < image_size; i++){
    to[i]= from[i];
  }


  /* draw marks */
  filter->cur_cv_img->imageData= frame->data;

  for(i= 0; filter->marker_filters[i]; i++){
    anubis_marker_filter_draw_marker(filter->marker_filters[i], filter->cur_cv_img,
				    filter->marker_filters[i]->user_data);
  }
}




