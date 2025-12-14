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
#include "gaborrg_recog.h"
#include "gaborrg_recog_gui.h"



int main(int argc, char* argv[])
{
  MalibSource * src;
  MalibSource * filters[4];
  MalibBuffer * buffer0, * buffer1;
  MalibGtkDisplay * displays[4];
  GrrGui * gui;
  
  gtk_set_locale();
  malib_init (&argc, &argv);

  src= (MalibSource*) malib_bttv_new_with_size(BTTV_DEFAULT_WIDTH,
					       BTTV_DEFAULT_HEIGHT);
  
  malib_bttv_start_capture ((MalibBttv*) src);

  buffer0=    (MalibBuffer*) malib_plainbuf_new_with_source(src);
  filters[0]= (MalibSource*) malib_rgb2gray_new_with_buf (buffer0);
  buffer1=    (MalibBuffer*) malib_plainbuf_new_with_source (filters[0]);
  filters[1]= (MalibSource*) malib_thumbnail_new_with_scale(buffer1,
							    MALIB_THUMBNAIL_HALF);
  filters[2]=
    (MalibSource*) malib_thumbnail_new_with_scale (buffer1, MALIB_THUMBNAIL_QUARTER);

  int default_dir_array[]= GABORRG_RECOG_DEFAULT_DIR_ARRAY;
  int dir_array_size= sizeof(default_dir_array) / sizeof(int);
  int default_rad_array[] = GABORRG_RECOG_DEFAULT_RAD_ARRAY;
  int rad_array_size= sizeof(default_rad_array) / sizeof(int);

  filters[3]=
    (MalibSource*)recog_by_gabor_new_with_buf_and_gabors(buffer1,
							 default_dir_array,
							 default_rad_array,
							 dir_array_size, rad_array_size,
							 GRR_GABOR_HALF,
							 GRR_DEFAULT_XML_FILE);

  displays[0]= malib_gtkdisplay_new_for_embed (src);
  displays[1]= malib_gtkdisplay_new_for_embed (filters[3]);
  displays[2]= NULL;

  gui= grr_gui_new(displays, buffer1);

  ((RecogByGabor*) filters[3])->display= displays[1];/* apply for recog point draw */
  ((RecogByGabor*) filters[3])->gui= gui;
  gui->main_display_num= 1;
  malib_gtkdisplay_auto_play2(displays);
  return 1;
}
