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

#ifndef __ANUBIS_CV_HAAR_DETECT_OBJECT_H__
#define __ANUBIS_CV_HAAR_DETECT_OBJECT_H__

#include <malib/malib.h>
#include <gdk_imlib.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include "anubis_common.h"
#include "anubis_marker_filter.h"

BEGIN_C_DECLS


#ifdef HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */

#define HAAR_CASCADE_NAME "haarcascade_frontalface_alt2.xml"
//#define HAAR_CASCADE_NAME "myeye.xml" //test 

/* uses at cvHaarDetectObjects arg of min_size */
#define ANUBIS_MIN_FACE_SIZE 25,25

typedef struct _AnubisCVHaarDetectObjClass{
  AnubisMarkerFilterClass super;
} AnubisCVHaarDetectObjClass;

typedef struct _AnubisCVHaarDetectObj{
  AnubisMarkerFilter super;
  
  IplImage* cv_prev_img;
  IplImage* cv_next_img;
  CvMemStorage* storage;
  CvHaarClassifierCascade* cascade;
  CvSeq* faces;
  int faces_scale;
  int draw_face_rect;
  int skip;

  void (*draw_marker)(IplImage*, void*); /* dummy for test */
  
} AnubisCVHaarDetectObj;

AnubisCVHaarDetectObj*
anubis_cv_haar_detect_obj_new_with_buf (MalibBuffer* buf, int draw_face_rect);

AnubisCVHaarDetectObj*
anubis_cv_haar_detect_obj_new_with_buf_and_cascade (MalibBuffer* buf, int draw_face_rect,
						   CvHaarClassifierCascade* cascade);
void anubis_cv_haar_detect_obj_set_params_and_cascade (AnubisCVHaarDetectObj* filter,
						      MalibBuffer* buf, CvHaarClassifierCascade* cascade);
void anubis_cv_haar_detect_obj_setup_filter_and_frames(AnubisCVHaarDetectObj* filter, MalibBuffer* buf);

void 
anubis_cv_haar_detect_obj_write_frame_data (AnubisCVHaarDetectObj* filter,
					   MalibFrame* frame);

END_C_DECLS

#endif /* __ANUBIS_CV_HAAR_DETECT_OBJECT_H__ */
