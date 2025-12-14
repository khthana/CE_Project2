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

#ifndef __ANUBIS_MARKER_H__
#define __ANUBIS_MARKER_H__

#define ANUBIS_DEFAULT_MARKER_COLOR 0XFF0000

#include <malib/malib.h>

BEGIN_C_DECLS

#include <opencv/cv.h>
#include "anubis_common.h"
#include "anubis_marker_filter.h"

typedef struct _AnubisMarkerClass
{
  MalibMergerClass super;
} AnubisMarkerClass;

typedef struct _AnubisMarker
{
  MalibMerger super;
  AnubisMarkerFilter ** marker_filters;
  IplImage * cur_cv_img;
} AnubisMarker;

AnubisMarker*
anubis_marker_new_with_buf_and_filters (MalibBuffer* src_buf,
				       AnubisMarkerFilter** marker_filters);

END_C_DECLS
#endif /* __ANUBIS_MARKER_H__ */
