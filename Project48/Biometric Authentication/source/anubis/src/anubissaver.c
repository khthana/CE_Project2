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

#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <malib/malib.h>
#include "anubis_common.h"
#include "anubis_cv_capture.h"
#include "anubis_cv_rgb2gray.h"
#include "anubis_cv_gtkdisplay.h"
#include "anubissimple_gui.h"
#include "anubis_cv_multi_haar.h"
#include "anubis_toggle_screensaver.h"

#define HAAR_CASCADE_NAME "haarcascade_frontalface_alt2.xml"

#define ANUBISSAVER_TITLE "anubissaver"

const char* cascade_name;

CvHaarClassifierCascade ** get_cascades();

int main(int argc, char** argv){
  MalibSource     * s_cap, * s_multi, * s_saver, * s_gray;
  MalibBuffer     * b_cap, * b_multi, * b_saver, * b_gray;
  AnubisCVGtkDisplay * d_cap, * d_multi, * d_saver, * d_gray;
  AnubisCVGtkDisplay * displays[2];
  AnubisSimpleGui * gui;
  CvHaarClassifierCascade ** cascades;
  ANUBIS_CV_ANGTYPE angles[]= {0,30,-30};

  
  malib_init (&argc, &argv);
  
  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (320, 240);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);


  cascades= get_cascades();

  
  
  s_multi= (MalibSource*) anubis_cv_multi_haar_new_with_buf (b_cap, cascades, angles,
							    1, sizeof(angles) / sizeof(ANUBIS_CV_ANGTYPE));
  b_multi= (MalibBuffer*) malib_plainbuf_new_with_source (s_multi);

  AnubisCVMultiHaar * f_multi= s_multi;
  s_saver= (MalibSource*) anubis_toggle_screensaver_new_with_buf_and_val(b_multi, &f_multi->faces_num);
  d_saver= anubis_cv_gtkdisplay_new_for_embed (s_saver);
  
  gui= anubissimple_gui_new(d_saver);
  anubissimple_gui_set_title(gui,ANUBISSAVER_TITLE);
  anubis_cv_gtkdisplay_auto_play(d_saver);
  
  anubis_cv_reset_capture_propaty (s_cap);
  return 0;
}

CvHaarClassifierCascade ** get_cascades(){
  /* still return only one cascade*/
  
  CvHaarClassifierCascade ** cascades;
  char * cascade_name;
  int cascades_num= 1;

  cascades= malloc(sizeof(CvHaarClassifierCascade*) * (cascades_num + 1));
  
  cascade_name= get_anubis_data_file_full_path_name(HAAR_CASCADE_NAME);

  cascades[0]= (CvHaarClassifierCascade*) cvLoad (cascade_name, 0, 0, 0);
  cascades[1]= NULL;
  
  return cascades;
}
