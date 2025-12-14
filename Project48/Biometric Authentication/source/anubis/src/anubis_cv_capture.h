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
#ifndef __ANUBIS_CV_CAPTURE_H__
#define __ANUBIS_CV_CAPTURE_H__

typedef struct _AnubisCVCapture AnubisCVCapture;
typedef struct _AnubisCVCaptureClass AnubisCVCaptureClass;

#include <math.h>
#include <malib/malib.h>

BEGIN_C_DECLS

#include <opencv/cv.h>
#include <opencv/highgui.h>
#include "anubis_cv_source.h"
#include "anubis_common.h"

struct _AnubisCVCapture{
  AnubisCVSource super;

  /** Mmaped area, where captured image stored. */
  unsigned char*	buf;

  /** File descripter of video capture device. */
  unsigned int		fd;
  /** Characters represent V4L device name such as '/dev/video0.' */
  unsigned char		device[MALIB_STD_V4L_VIDEODEVNAME_SIZE];

  /** Capturing hook function. If this menber is non NULL, this function is
      evaluated at an every capturing time. */
  void 			(* capture_hook) (void* arg);
  /** Argments for capturing hook function. */
  void*			capture_hook_arg;

  /** Store original capture width and height */
  unsigned int org_cap_width;
  unsigned int org_cap_height;
};

struct _AnubisCVCaptureClass{
  AnubisCVSourceClass super;
};

AnubisCVCapture*
anubis_cv_capture_new_with_size (unsigned int width, unsigned int height);

AnubisCVCapture*
anubis_cv_capture_new_with_config(const unsigned char* device,
				 unsigned int width, unsigned int height, 
				 unsigned int format,
				 unsigned int channel, unsigned int videomode);

void
anubis_cv_capture_delete (AnubisCVCapture* filter);

void
anubis_cv_reset_capture_propaty (AnubisCVCapture* filter);


END_C_DECLS

#endif /* __ANUBIS_CV_CAPTURE_H__ */
	  
