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

#ifndef __ANUBIS_CV_MULTI_HAAR_H__
#define __ANUBIS_CV_MULTI_HAAR_H__

#include <malib/malib.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>

BEGIN_C_DECLS

#include "anubis_common.h"
#include "anubis_cv_haar_detect_obj.h"

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */


typedef struct _AnubisCVMultiHaarClass{
  MalibFilterClass super;
  
} AnubisCVMultiHaarClass;

typedef struct _AnubisCVMultiHaarClassParam{
  int dummy;
}AnubisCVMultiHaarClassParam;

typedef struct _AnubisCVMultiHaar{
  MalibFilter super;
  IplImage * cv_prev_img;
  IplImage * cv_next_img;
  CvMemStorage * storage;
  CvMemStorage * ang_storage;

  CvHaarClassifierCascade** cascades;
  int cascades_num;

  CvSeq* faces;
  int faces_scale;
  int faces_num;

  CvSeq  * angle_seq;
  ANUBIS_CV_ANGTYPE * angles;
  int      angles_num;
  int    * each_angle_face_num; /* need less */
  
} AnubisCVMultiHaar;

AnubisCVMultiHaar*
anubis_cv_multi_haar_new_with_buf (MalibBuffer* buf,
				  CvHaarClassifierCascade ** cascades,
				  ANUBIS_CV_ANGTYPE* angles,
				  int cascades_num,
				  int angles_num);



END_C_DECLS
#endif /* __ANUBIS_CV_MULTI_HAAR_H__ */



