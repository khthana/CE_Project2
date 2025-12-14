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

#include <getopt.h>
#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <gtk/gtk.h>

#include "anubis_common.h"
#include "anubissimple_gui.h"
#include "anubis_face_parts_detect.h"

static int check_option(int argc, char** argv);
static void show_usage_and_exit();

static char * face_cascade_name= NULL;
static char * parts_cascade_name= NULL;

int main( int argc, char** argv ) {
  MalibSource     * s_cap, * s_haar, * s_parts, * s_mark;
  MalibBuffer     * b_cap, * b_haar, * b_parts, * b_mark;
  AnubisCVGtkDisplay * disp;
  CvHaarClassifierCascade * face_cascade, * parts_cascade;

  check_option(argc, argv);

  face_cascade= parts_cascade= NULL;
  face_cascade= cvLoad(face_cascade_name, 0, 0, 0);
  if(parts_cascade_name)
    parts_cascade= cvLoad(parts_cascade_name, 0, 0, 0);
  
  malib_init (&argc, &argv);

  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (ANUBIS_DEFAULT_DISP_WIDTH, ANUBIS_DEFAULT_DISP_HEIGHT);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);
  //disp= anubis_cv_gtkdisplay_new_for_embed(s_cap);
  
  s_parts= (MalibSource*) anubis_face_parts_detect_new_with_buf(b_cap, face_cascade, parts_cascade);
  b_parts= (MalibBuffer*) malib_plainbuf_new_with_source(s_parts);
  //disp= anubis_cv_gtkdisplay_new_for_embed(s_parts);


  AnubisMarkerFilter* marker_filters[]= {s_parts, NULL};

  s_mark= (MalibSource*) anubis_marker_new_with_buf_and_filters(b_parts, marker_filters);
  disp  = anubis_cv_gtkdisplay_new_for_embed(s_mark);
  
  AnubisSimpleGui * gui;
  gui= anubissimple_gui_new(disp);

  anubissimple_gui_set_title ( gui, "anubispartsdetect" );


  anubis_cv_gtkdisplay_auto_play(disp);
  anubis_cv_reset_capture_propaty (s_cap);
  return 0;
}

static int check_option(int argc, char** argv){
  int this_option_optind= optind ? optind : 1;
  int option_index= 0;
  int c;

  static struct option long_options[]=
  {
    {"help", 0, 0, 'h'},
    {"facecascade", 1, 0, 'f'},
    {"parts", 1, 0, 'p'},
    {0, 0, 0, 0}
  };
  while(1){
    c= getopt_long(argc, argv, "hf:p:", long_options, &option_index);
    if (c == -1) break;

    switch(c){
    case 'f': face_cascade_name= optarg; break;
    case 'p': parts_cascade_name= optarg; break;
    case 'h':
    case '?': show_usage_and_exit(); break;
    }
  }
  if (!face_cascade_name){
    show_usage_and_exit();
  }
}

static void show_usage_and_exit(){
  printf("-f face_cascade_name\n-p parts_cascade_name\n-h,-? this help\n");
  exit(1);
}
