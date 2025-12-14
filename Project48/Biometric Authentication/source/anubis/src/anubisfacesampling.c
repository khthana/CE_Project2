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

#include "anubisfacesampling_gui.h"

#include "gaborrg_recog.h"
#include "recog_by_jets.h"
#include "anubis_marker.h"
#include "anubis_color_config.h"
#include "anubis_cv_capture.h"
#include "anubis_cv_rgb2gray.h"
#include "anubis_cv_haar_detect_obj.h"


#include "anubisrecog_gui_update.h"

static
int check_option(int argc, char** argv);

void show_usage_and_exit ();

static unsigned char * jets_fname = NULL;
static unsigned char * masks_fname= NULL;

int main(int argc, char* argv[])
{
  MalibGtkDisplay * disp[4];
  MalibSource     * s_cap, * s_haar, * s_jets, * s_mark;
  MalibBuffer     * b_cap, * b_haar, * b_jets, * b_mark;
  MalibGtkDisplay * d_cap, * d_haar, * d_jets, * d_mark;

  check_option(argc, argv);
  
  malib_init (&argc, &argv);

  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);
  /*d_cap= anubis_cv_gtkdisplay_new_for_embed (s_cap);*/

  s_haar= (MalibSource*) anubis_cv_haar_detect_obj_new_with_buf(b_cap, 0);
  b_haar= (MalibBuffer*) malib_plainbuf_new_with_source (s_haar);
  /*d_haar= anubis_cv_gtkdisplay_new_for_embed (s_haar);*/

  s_jets= (MalibSource*) recog_by_jets_new_with_buf (b_haar, s_haar, jets_fname, masks_fname);
  b_jets= (MalibBuffer*) malib_plainbuf_new_with_source(s_jets);
  /*d_jets= anubis_cv_gtkdisplay_new_for_embed(s_jets);*/


  AnubisMarkerFilter* marker_filters[]= {s_haar, s_jets, NULL};

  s_mark= (MalibSource*) anubis_marker_new_with_buf_and_filters(b_jets, marker_filters);
  //b_mark= (MalibBuffer*) malib_plainbuf_new_with_source(s_mark);
  d_mark= anubis_cv_gtkdisplay_new_for_embed(s_mark);

  disp[0]= d_mark;
  disp[1]= NULL;

  AnubisfacesamplingGui* gui;
  gui= anubisfacesampling_gui_new(disp, s_jets);
  

  anubis_cv_gtkdisplay_auto_play2(disp);
  anubis_cv_reset_capture_propaty (s_cap);  
  
}

static
int check_option(int argc, char** argv){
  int this_option_optind = optind ? optind : 1;
  int option_index = 0;
  int c;
  static struct option long_options[] =
  {
    {"jet", 0, 0, 'j'},
    {"mask", 0, 0, 'm'},
    {"help", 0, 0, 'h'},
    {0, 0, 0, 0}
  };
  while(1){
    c= getopt_long(argc, argv, "j:m:h", long_options, &option_index);
    if (c == -1) break;

    switch(c) {
    case 'j': jets_fname = optarg; break;
    case 'm': masks_fname= optarg; break;
    case 'h': 
    case '?': show_usage_and_exit(); break;
    }
  }

  char * tmp_name;
  if(!jets_fname){
    jets_fname= get_anubis_data_file_full_path_name(GABORRG_JET_DEFAULT_XML_FNAME);
  }
  
  if(!masks_fname){
    tmp_name= malloc (sizeof(GABORRG_JET_DEFAULT_XML_FNAME)
			 + sizeof(GABORRG_JET_MASKS_EXTENTION));
    sprintf(tmp_name, "%s%s", GABORRG_JET_DEFAULT_XML_FNAME, GABORRG_JET_MASKS_EXTENTION);
    masks_fname= get_anubis_data_file_full_path_name(tmp_name);
    free (tmp_name);
  }


  return 1;
}

void
show_usage_and_exit ()
{
  fprintf(stderr, "Usage - anubisrecog [options]\n");
  fprintf(stderr, "  -j filename, --jet  filename     set jet file (default %s)\n",
	  GABORRG_JET_DEFAULT_XML_FNAME);
  fprintf(stderr,
	  "  -m filename, --mask filename     set jet mask file (default %s%s)\n",
	  GABORRG_JET_DEFAULT_XML_FNAME, GABORRG_JET_MASKS_EXTENTION);
  fprintf(stderr, "  -h, -?, --help                   show this help\n");

  exit (-1);
}
