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
 */#include <malib/malib.h>
#include "anubis_cv_capture.h"
#include "anubis_cv_rgb2gray.h"

#include <gtk/gtk.h>
#include <gdk_imlib.h>


int main(int argc, char* argv[]){
  MalibSource     * s_cap, * s_gray;
  MalibBuffer     * b_cap, * b_gray;
  MalibGtkDisplay * d_cap, * d_gray;

  malib_init (&argc, &argv);
  
  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (320, 240);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);

  /*
  d_cap= anubis_cv_gtkdisplay_new_with_source (s_cap);
  anubis_cv_gtkdisplay_auto_play(d_cap);
  */

  s_gray= (MalibSource*) anubis_cv_rgb2gray_new_with_buf (b_cap);
  b_gray= (MalibBuffer*) malib_plainbuf_new_with_source (s_gray);
  d_gray= anubis_cv_gtkdisplay_new_with_source (s_gray);

  anubis_cv_gtkdisplay_auto_play(d_gray);
  
  return 0;
}
