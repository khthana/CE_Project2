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
#include <malib/malib.h>

#include "gaborrg_maker_gui.h"

int main(int argc, char* argv[])
{
  MalibSource * s_cap, * s_haar, * s_gray;
  MalibBuffer * b_cap, * b_haar, * b_gray;
  MalibGtkDisplay * displays[4];
  GrmGui * gui;

  /* initialization */
  malib_init (&argc, &argv);

  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);


  s_gray= (MalibSource*) anubis_cv_rgb2gray_new_with_buf (b_cap);
  b_gray= (MalibBuffer*) malib_plainbuf_new_with_source (s_gray);
  
  s_haar= (MalibSource*) anubis_cv_haar_detect_obj_new_with_buf(b_gray, 1);
  //b_haar= (MalibBuffer*) (MalibBuffer*) malib_plainbuf_new_with_source (s_haar);

  displays[0]= anubis_cv_gtkdisplay_new_for_embed (s_haar);
  displays[1]= NULL;

  gui = gaborrg_maker_gui_new (displays, b_gray, s_gray, s_haar);

  gtk_window_set_title(GTK_WINDOW (gui->window), "anubissampling");

  anubis_cv_gtkdisplay_auto_play2 (displays);
  anubis_cv_reset_capture_propaty (s_cap);

  return 0;
}
