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

#include "anubis_cv_haar_detect_obj.h"

void anubis_cv_haar_detect_obj_set_params (AnubisCVHaarDetectObj* filter,
					  MalibBuffer* buf);

//void anubis_cv_haar_detect_obj_write_frame_data(AnubisCVHaarDetectObj* filter,
//					       MalibFrame* frame);

static void
anubis_cv_haar_detect_obj_draw_marker(IplImage* img, AnubisCVHaarDetectObj* filter);
  
static AnubisCVHaarDetectObjClass anubis_cv_haar_detect_obj_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_haar_detect_obj_write_frame_data,
  (AnubisDrawMarkerFunc)                 anubis_cv_haar_detect_obj_draw_marker
};

/* public functions **************************************************/

AnubisCVHaarDetectObj*
anubis_cv_haar_detect_obj_new_with_buf (MalibBuffer* buf, int draw_face_rect)
{
  AnubisCVHaarDetectObj * filter;
  MalibFrame           * preview_frame, * frame;


  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVHaarDetectObj, &anubis_cv_haar_detect_obj_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY
			       ,&filter);

  anubis_cv_haar_detect_obj_setup_filter_and_frames(filter, buf);

  anubis_cv_haar_detect_obj_set_params (filter, buf);
  filter->draw_face_rect= draw_face_rect;
  ((AnubisMarkerFilter*) filter)->user_data= filter;
  
  return filter;
}

AnubisCVHaarDetectObj*
anubis_cv_haar_detect_obj_new_with_buf_and_cascade (MalibBuffer* buf, int draw_face_rect,
						   CvHaarClassifierCascade* cascade){
  AnubisCVHaarDetectObj * filter;
  MalibFrame           * preview_frame, * frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVHaarDetectObj, &anubis_cv_haar_detect_obj_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY
			       ,&filter);
  anubis_cv_haar_detect_obj_setup_filter_and_frames(filter, buf);

  anubis_cv_haar_detect_obj_set_params_and_cascade(filter, buf, cascade);
  
  filter->draw_face_rect= draw_face_rect;
  ((AnubisMarkerFilter*) filter)->user_data= filter;

  return filter;
}

void anubis_cv_haar_detect_obj_setup_filter_and_frames(AnubisCVHaarDetectObj* filter, MalibBuffer* buf){
  MalibFrame * preview_frame, * frame;
  
  filter->draw_marker= anubis_cv_haar_detect_obj_draw_marker;
  preview_frame= malib_buffer_get_current_frame(buf);

  
  frame= anubis_create_frame_from_buf ((MalibFilter*) filter,
				      buf, preview_frame->model);
  malib_filter_set_buffer_with_frame (filter, buf, frame);
}

void anubis_cv_haar_detect_obj_set_params_and_cascade (AnubisCVHaarDetectObj* filter,
						      MalibBuffer* buf, CvHaarClassifierCascade* cascade){
  CvSize size;
  MalibFrame* frame;

  frame= malib_buffer_get_current_frame (buf);

  filter->cv_prev_img= anubis_create_cv_image_headder_from_malib_frame(frame);
  filter->cv_next_img= anubis_create_cv_image_headder_from_malib_frame(frame);
  filter->skip= 0;
  
  filter->storage = cvCreateMemStorage(0);
  filter->cascade= cascade;
  filter->faces= NULL;
  return;
}

/* private functions **************************************************/


void anubis_cv_haar_detect_obj_set_params (AnubisCVHaarDetectObj* filter,
					  MalibBuffer* buf){
  CvSize size;
  MalibFrame* frame;
  int colors;

  const char* cascade_name= get_anubis_data_file_full_path_name(HAAR_CASCADE_NAME);

  CvHaarClassifierCascade* cascade= (CvHaarClassifierCascade*) cvLoad( cascade_name, 0, 0, 0);

  if( !cascade )
  {
    fprintf( stderr, "ERROR: Could not load classifier cascade\n" );
    return -1;
  }
  anubis_cv_haar_detect_obj_set_params_and_cascade(filter, buf, cascade);
  return;
}


void 
anubis_cv_haar_detect_obj_write_frame_data (AnubisCVHaarDetectObj* filter,
					   MalibFrame* frame){
  
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);
  
  malib_filter_preprocess ((MalibFilter*) filter, frame);
  {
    int i,j,image_size, colors;
    MalibFrame * preview_frame;
    preview_frame= malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);
    ANUBIS_CV_IMAGE_PIXTYPE* from= preview_frame->data;
    ANUBIS_CV_IMAGE_PIXTYPE* to  = frame->data;
    
    colors    = MALIB_FRAME_DEFAULT_NUM_COLORS(preview_frame->model);
    image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);

    filter->cv_prev_img->imageData= from;
    filter->cv_next_img->imageData= to;
    cvCopy(filter->cv_prev_img, filter->cv_next_img,0);

    if(filter->faces)
      cvClearSeq(filter->faces);
    cvClearMemStorage (filter->storage);
    if(!filter->skip){
      
      filter->faces_scale= 1;
      if (filter->cascade){
	filter->faces= cvHaarDetectObjects (filter->cv_prev_img, filter->cascade, filter->storage,
					    1.1, 2, CV_HAAR_DO_CANNY_PRUNING,
					    cvSize(ANUBIS_MIN_FACE_SIZE) );
      }

      if(filter->draw_face_rect)
	anubis_marker_filter_draw_marker(filter, filter->cv_next_img, filter);
    }
  }
  return;
}

static void
anubis_cv_haar_detect_obj_draw_marker(IplImage* img, AnubisCVHaarDetectObj* filter){

  if(filter->skip)
    return;
  
  int i;
  for( i= 0; i < filter->faces->total; i++){
    CvRect face_rect = *(CvRect*)cvGetSeqElem( filter->faces, i);
    
    cvRectangle( img, cvPoint(face_rect.x * filter->faces_scale,
			      face_rect.y * filter->faces_scale),
		 cvPoint((face_rect.x+face_rect.width) *filter->faces_scale,
			 (face_rect.y+face_rect.height)*filter->faces_scale),
		 CV_RGB(255,0,0), 3, 8, 0 );
  }
  return;
}
