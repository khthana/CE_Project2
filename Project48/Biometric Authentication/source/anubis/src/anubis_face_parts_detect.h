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
#ifndef __ANUBIS_FACE_PARTS_DETECT_H__
#define __ANUBIS_FACE_PARTS_DETECT_H__

#include <malib/malib.h>
#include <opencv/cv.h>
#include "anubis_marker_filter.h"
#include "anubis_cv_haar_detect_obj.h"

BEGIN_C_DECLS

typedef struct _AnubisFacePartsDetectClass{
  AnubisCVHaarDetectObjClass super;
} AnubisFacePartsDetectClass;

typedef struct _AnubisFacePartsDetect{
  AnubisCVHaarDetectObj super;
  CvHaarClassifierCascade* parts_cascade;
  CvSeq* parts_seq;
} AnubisFacePartsDetect;


AnubisFacePartsDetect*
anubis_face_parts_detect_new_with_buf (MalibBuffer* buf, CvHaarClassifierCascade* face_cascade,
				      CvHaarClassifierCascade* parts_cascade);

END_C_DECLS

#endif /* __ANUBIS_FACE_PARTS_DETECT_H__ */
