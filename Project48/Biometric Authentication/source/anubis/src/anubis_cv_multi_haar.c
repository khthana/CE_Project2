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

#include "anubis_cv_multi_haar.h"

void
anubis_cv_multi_haar_set_params (AnubisCVMultiHaar* filter, MalibBuffer* buf);

void anubis_cv_multi_haar_write_frame_data (AnubisCVMultiHaar* filter,
					    MalibFrame* frame);
void
recog_by_multi_angles_and_cascades (AnubisCVMultiHaar* filter);

void
recog_by_multi_angles(AnubisCVMultiHaar* filter, CvHaarClassifierCascade* cascade);

static void
draw_cv_marker(IplImage* img, AnubisCVMultiHaar* filter);

static AnubisCVMultiHaarClass anubis_cv_multi_haar_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_multi_haar_write_frame_data
};

/* public functions **************************************************/

AnubisCVMultiHaar*
anubis_cv_multi_haar_new_with_buf (MalibBuffer* buf,
				  CvHaarClassifierCascade ** cascades,
				  ANUBIS_CV_ANGTYPE* angles,
				  int cascades_num,
				  int angles_num){
  AnubisCVMultiHaar * filter;
  MalibFrame       * preview_frame, * frame;
  CvSeq* faces;

  preview_frame= malib_buffer_get_current_frame(buf);
  
  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVMultiHaar, &anubis_cv_multi_haar_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY
			       ,&filter);

  /*preview_frame= malib_buffer_get_current_frame(buf);*/
  
  frame= anubis_create_frame_from_buf ((MalibFilter*) filter,
				      buf, preview_frame->model);
  malib_filter_set_buffer_with_frame (filter, buf, frame);

  
  anubis_cv_multi_haar_set_params (filter, buf);

  filter->faces= NULL;

  filter->cascades    = cascades;
  filter->cascades_num= cascades_num;
  filter->angles      = angles;
  filter->angles_num  = angles_num;
  filter->each_angle_face_num= malloc(sizeof(int) * angles_num);
  filter->faces_scale = 1.0;
  filter->faces_num= 0;
  
  return filter;
}

/* private functions **************************************************/

void
anubis_cv_multi_haar_set_params (AnubisCVMultiHaar* filter, MalibBuffer* buf){
  MalibFrame * frame;

  frame= malib_buffer_get_current_frame (buf);
  
  filter->cv_prev_img= anubis_create_cv_image_headder_from_malib_frame(frame);
  filter->cv_next_img= anubis_create_cv_image_headder_from_malib_frame(frame);

  filter->storage = cvCreateMemStorage(0);
  filter->ang_storage= cvCreateChildMemStorage(filter->storage);

  filter->angle_seq= NULL;
  return;
}

void anubis_cv_multi_haar_write_frame_data (AnubisCVMultiHaar* filter,
					   MalibFrame* frame){

  
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);
  
  malib_filter_preprocess ((MalibFilter*) filter, frame);
  {
    MalibFrame * preview_frame;
    int image_size ,colors;

    preview_frame= malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);
    
    image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);
    colors    = malib_filter_calc_output_image_size ((MalibFilter*) filter);

    ANUBIS_CV_IMAGE_PIXTYPE* from= preview_frame->data;
    ANUBIS_CV_IMAGE_PIXTYPE* to  = frame->data;

    filter->cv_prev_img->imageData= from;
    filter->cv_next_img->imageData= to;

    recog_by_multi_angles_and_cascades (filter);
    
  }
  return ;
}

void
recog_by_multi_angles_and_cascades (AnubisCVMultiHaar* filter){

  cvCopy(filter->cv_prev_img, filter->cv_next_img,0);
  
  cvClearMemStorage(filter->ang_storage);
  cvClearMemStorage (filter->storage);
  
  filter->faces_scale= 1;

  /* implement cascades */
  int i;
  for(i= 0; i < filter->cascades_num; i++){
    if(filter->cascades[i])
      recog_by_multi_angles(filter, filter->cascades[i]);
  }
  return;
}

void
recog_by_multi_angles(AnubisCVMultiHaar* filter, CvHaarClassifierCascade* cascade){
  int i,j,k,m;
  CvSeq* tmp_faces;
  CvPoint win_center;
  int min_neighbors= 2;
  ANUBIS_CV_ANGTYPE angle;

  filter->angle_seq= cvCreateSeq(CV_32SC1, sizeof(CvSeq), sizeof(ANUBIS_CV_ANGTYPE), filter->ang_storage);

  win_center.x= filter->cv_next_img->width / 2;
  win_center.y= filter->cv_next_img->height / 2;
    
  for(i= 0; i < filter->angles_num; i++)
  {
    anubis_cv_set_rotate_image(filter->cv_next_img, filter->cv_prev_img,
			       ANG2RAD(filter->angles[i]));
    
    tmp_faces= cvHaarDetectObjects (filter->cv_next_img, cascade, filter->storage,
				    1.1, min_neighbors, CV_HAAR_DO_CANNY_PRUNING,
				    cvSize(ANUBIS_MIN_FACE_SIZE) );

    /* push angles */
    if(tmp_faces->total)
      cvSeqPushMulti(filter->angle_seq, &filter->angles[i], tmp_faces->total, 0);

    anubis_cv_allocate_rects(tmp_faces, win_center, filter->angles[i]);
    
    if(i == 0)
      filter->faces= tmp_faces;
    else
      cvSeqInsertSlice(filter->faces, filter->faces->total, tmp_faces);
  }

  anubis_cv_remove_inside_rect_with_angle_seq(filter->faces, filter->angle_seq);

  anubis_cv_set_rotate_image(filter->cv_next_img, filter->cv_prev_img, 0);

  draw_cv_marker(filter->cv_next_img, filter);
  
  filter->faces_num= filter->faces->total;
  return;
}

static void
draw_cv_marker(IplImage* img, AnubisCVMultiHaar* filter){
  int i,m;
  
  for( i= 0; i < filter->faces->total; i++){
    CvRect face_rect = *(CvRect*)cvGetSeqElem( filter->faces, i);
    CvBox2D box;
    CvPoint2D32f pt_float[4];
    CvPoint pt[4];

    box.center.x= face_rect.x + (face_rect.width / 2);
    box.center.y= face_rect.y + (face_rect.height / 2);
    box.size.width= face_rect.width;
    box.size.height= face_rect.height;
    box.angle= - ANG2RAD( *(ANUBIS_CV_ANGTYPE*) cvGetSeqElem( filter->angle_seq, i ));

    cvBoxPoints(box, pt_float);

    for(m= 0; m < 4; m++){
      pt[m].x= pt_float[m].x;
      pt[m].y= pt_float[m].y;
    }
    
    cvLine( img, pt[0], pt[1], CV_RGB(255,0,0), 3, 8, 0);
    cvLine( img, pt[1], pt[2], CV_RGB(255,0,0), 3, 8, 0);
    cvLine( img, pt[2], pt[3], CV_RGB(255,0,0), 3, 8, 0);
    cvLine( img, pt[3], pt[0], CV_RGB(255,0,0), 3, 8, 0);
  }
  
  return;
}
