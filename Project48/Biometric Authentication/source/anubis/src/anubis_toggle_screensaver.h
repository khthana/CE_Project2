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
#ifndef __ANUBIS_TOGGLE_SCREENSAVER_H__
#define __ANUBIS_TOGGLE_SCREENSAVER_H__

#include <malib/malib.h>
#include <anubis_common.h>
BEGIN_C_DECLS

#include <opencv/cv.h>

typedef struct _AnubisToggleScreensaver AnubisToggleScreensaver;
typedef struct _AnubisToggleScreensaverClass AnubisToggleScreensaverClass;

struct _AnubisToggleScreensaver{
  MalibFilter super;

  int * toggle_screen;
  int prev_screen_status;

  int face_off_time;
  int face_on_time;
  
};

struct _AnubisToggleScreensaverClass{
  MalibFilterClass super;
};

AnubisToggleScreensaver*
anubis_toggle_screensaver_new_with_buf_and_val(MalibBuffer* buf, int* toggle_screen);

END_C_DECLS

#endif /* __ANUBIS_TOGGLE_SCREENSAVER_H__ */
