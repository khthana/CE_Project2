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

#ifndef __ANUBIS_CV_RGB2GRAY_H__
#define __ANUBIS_CV_RGB2GRAY_H__

#include <malib/malib.h>
BEGIN_C_DECLS

#include <opencv/cv.h>

typedef struct _AnubisCVRgb2Gray AnubisCVRgb2Gray;
typedef struct _AnubisCVRgb2GrayClass AnubisCVRgb2GrayClass;

struct _AnubisCVRgb2Gray{
  MalibFilter super;
};

struct _AnubisCVRgb2GrayClass{
  MalibFilterClass super;
};

AnubisCVRgb2Gray*
anubis_cv_rgb2gray_new_with_buf(MalibBuffer* buf);

END_C_DECLS
#endif /* __ANUBIS_CV_RGB2GRAY_H__ */
