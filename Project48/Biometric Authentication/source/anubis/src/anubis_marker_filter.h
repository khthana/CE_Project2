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

#ifndef __ANUBIS_MARKER_FILTER_H__
#define __ANUBIS_MARKER_FILTER_H__

#include <malib/malib.h>

BEGIN_C_DECLS

typedef void (*AnubisDrawMarkerFunc) (IplImage* img, void* user_data);

typedef struct _AnubisMarkerFilterClass
{
  MalibMergerClass super;
  AnubisDrawMarkerFunc draw_marker;
} AnubisMarkerFilterClass;

typedef struct _AnubisMarkerFilter
{
  MalibMerger super;
  void * user_data;
} AnubisMarkerFilter;

#define ANUBIS_MARKER_FILTER_VFUNC_TBL(obj) \
        ((AnubisMarkerFilterClass*)MALIB_OBJECT_VFUNC_TBL(obj))

#define anubis_marker_filter_draw_marker(src, img, user_data) \
        (* (ANUBIS_MARKER_FILTER_VFUNC_TBL(src))->draw_marker) (img, user_data)



END_C_DECLS

#endif /* __ANUBIS_MARKER_FILTER_H__ */
