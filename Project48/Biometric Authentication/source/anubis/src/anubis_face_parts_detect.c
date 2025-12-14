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

#include "anubis_face_parts_detect.h"

void anubis_face_parts_detect_write_frame_data(AnubisFacePartsDetect* filter,
					      MalibFrame* frame);
static void
draw_marker(IplImage* img, AnubisFacePartsDetect* filter);

static AnubisFacePartsDetectClass anubis_face_parts_detect_class=
{
  (void (*)(MalibObject*)) malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_face_parts_detect_write_frame_data,
  (AnubisDrawMarkerFunc)    draw_marker
};


/* public functions **************************************************/

AnubisFacePartsDetect*
anubis_face_parts_detect_new_with_buf (MalibBuffer* buf, CvHaarClassifierCascade* face_cascade,
				      CvHaarClassifierCascade* parts_cascade){
  AnubisFacePartsDetect * filter;
  MalibFrame           * preview_frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisFacePartsDetect, &anubis_face_parts_detect_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY,
			       &filter);

  anubis_cv_haar_detect_obj_setup_filter_and_frames(filter, buf);
  anubis_cv_haar_detect_obj_set_params_and_cascade(filter, buf, face_cascade);

  ((AnubisCVHaarDetectObj*)filter)->draw_face_rect= 0;
  ((AnubisMarkerFilter*) filter)->user_data= filter;

  filter->parts_cascade= parts_cascade;
  filter->parts_seq= NULL;

  return filter;
}

/* private functions **************************************************/

void anubis_face_parts_detect_write_frame_data(AnubisFacePartsDetect* filter, MalibFrame* frame){
  anubis_cv_haar_detect_obj_write_frame_data(filter, frame);
  filter->parts_seq= NULL;

  AnubisCVHaarDetectObj * super_filter= (AnubisCVHaarDetectObj*)filter;

  int big= get_biggest_width_face_num(super_filter->faces);

  if( big >= 0 ){
    CvRect face_rect= *(CvRect*)cvGetSeqElem(super_filter->faces, big);

    CvSize rect_size;
    rect_size.width = face_rect.width;
    rect_size.height= face_rect.height;


    IplImage* rectImage= cvCreateImage(rect_size, super_filter->cv_next_img->depth,
                                       super_filter->cv_next_img->nChannels);

    if(filter->parts_cascade){
      CvPoint2D32f center;

      center.x= (face_rect.x * 2 + face_rect.width) / 2;
      center.y= (face_rect.y * 2 + face_rect.height) / 2;

      cvGetRectSubPix(super_filter->cv_next_img, rectImage, center);

      if(filter->parts_seq)
         cvClearSeq(filter->parts_seq);
      
      //filter->parts_seq = cvHaarDetectObjects (rectImage, filter->parts_cascade, super_filter->storage,
      //1.2, 2, CV_HAAR_DO_CANNY_PRUNING, cvSize(ANUBIS_MIN_FACE_SIZE) );
      filter->parts_seq = cvHaarDetectObjects (rectImage, filter->parts_cascade, super_filter->storage,
					       1.2, 2, CV_HAAR_DO_CANNY_PRUNING, cvSize(15,15) );
      
      int i;
      for(i= 0; i < filter->parts_seq->total; i++){
         CvRect* rect= cvGetSeqElem(filter->parts_seq, i);
         rect->x= rect->x + face_rect.x;
         rect->y= rect->y + face_rect.y;
      }
    }
    cvReleaseImage(&rectImage);
  }
  return;
}

static void
draw_marker(IplImage* img, AnubisFacePartsDetect* filter){
  AnubisCVHaarDetectObj* super_filter= (AnubisCVHaarDetectObj*)filter;
  
  if(super_filter->skip)
    return;
  
  int i;
  for( i= 0; i < super_filter->faces->total; i++){
    CvRect face_rect = *(CvRect*)cvGetSeqElem( super_filter->faces, i);
    
    cvRectangle( img, cvPoint(face_rect.x * super_filter->faces_scale,
			      face_rect.y * super_filter->faces_scale),
		 cvPoint((face_rect.x+face_rect.width) *super_filter->faces_scale,
			 (face_rect.y+face_rect.height)*super_filter->faces_scale),
		 CV_RGB(255,0,0), 3, 8, 0 );
  }

  if(filter->parts_seq)
    for( i= 0; i < filter->parts_seq->total; i++){
      CvRect face_rect = *(CvRect*)cvGetSeqElem( filter->parts_seq, i);
      
      cvRectangle( img, cvPoint(face_rect.x * super_filter->faces_scale,
				face_rect.y * super_filter->faces_scale),
		   cvPoint((face_rect.x+face_rect.width) *super_filter->faces_scale,
			   (face_rect.y+face_rect.height)*super_filter->faces_scale),
		   CV_RGB(255,0,0), 3, 8, 0 );
    }
  return;
}
