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
#include "gaborrg_recog.h"
#include "gaborrg_recog_gui.h"
#include "recog_by_jets.h"
#include "anubis_marker.h"
#include "anubis_color_config.h"
#include "anubisrecog_gui.h"
#include "anubis_cv_capture.h"
#include "anubis_cv_rgb2gray.h"
#include "anubisrecog_gui_update.h"


#define DEFAULT_A_MEAN 	"/anubis/color_params/a_mean=0.5"
#define DEFAULT_B_MEAN 	"/anubis/color_params/b_mean=0.5"
#define DEFAULT_A_COEF 	"/anubis/color_params/a_coef=0.05"
#define DEFAULT_B_COEF 	"/anubis/color_params/b_coef=0.05"

#define ANUBISRECOG_FACE_DETECT_THRESHOLD 0.8

static
int check_option(int argc, char** argv);

void show_usage_and_exit ();

static unsigned char * jets_fname   = NULL;
static unsigned char * masks_fname  = NULL;
static unsigned char * fg_jets_fname= NULL;

int main(int argc, char* argv[])
{
  MalibGtkDisplay * disps[4];
  
  MalibSource     * s_cap, * s_conf, * s_gray, * s_snake, * s_haar, * s_jets, * s_face, * s_mark, * s_updt;
  MalibBuffer     * b_cap, * b_conf, * b_gray, * b_snake, * b_haar, * b_jets, * b_face, * b_mark, * b_updt;
  MalibGtkDisplay * d_cap, * d_conf, * d_gray, * d_snake, * d_haar, * d_jets, * d_face, * d_mark, * d_updt;
  MalibGtkDisplay * disp;
  int disp_cap, disp_conf, disp_jets, disp_mark, disp_last, disp_main;
  GrrGui * gui;

  check_option(argc, argv);
  
  malib_init (&argc, &argv);

  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (BTTV_DEFAULT_WIDTH, BTTV_DEFAULT_HEIGHT);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);
  //disp= anubis_cv_gtkdisplay_new_for_embed (s_cap);

  s_haar= (MalibSource*) anubis_cv_haar_detect_obj_new_with_buf(b_cap, 0);
  b_haar= (MalibBuffer*) malib_plainbuf_new_with_source (s_haar);
  //disp= anubis_cv_gtkdisplay_new_for_embed (s_haar);

  s_jets= (MalibSource*) recog_by_jets_new_with_buf (b_haar, s_haar, jets_fname, masks_fname);
  b_jets= (MalibBuffer*) malib_plainbuf_new_with_source(s_jets);
  //disp= anubis_cv_gtkdisplay_new_for_embed (s_jets);

  s_face= (MalibSource*) anubis_face_graph_measure_new_with_buf_and_jets (b_jets, ((RecogByJets*)s_jets)->cur_graph,
									 fg_jets_fname, masks_fname,
									 FGRAPH_AND_JETS,
									 ANUBISRECOG_FACE_DETECT_THRESHOLD);
  b_face= (MalibBuffer*) malib_plainbuf_new_with_source(s_face);
  //disp= anubis_cv_gtkdisplay_new_for_embed (s_face);

  s_updt= (MalibSource*) anubisrecog_gui_update_new_with_buf(b_face, s_haar, s_jets, s_face);
  b_updt= (MalibBuffer*) malib_plainbuf_new_with_source(s_updt);
  //disp= anubis_cv_gtkdisplay_new_for_embed (s_updt);

  AnubisMarkerFilter marker_filters[]= {s_jets, s_haar, NULL};

  s_mark= (MalibSource*) anubis_marker_new_with_buf_and_filters(b_updt, marker_filters);
  b_mark= (MalibBuffer*) malib_plainbuf_new_with_source(s_face);
  disp= anubis_cv_gtkdisplay_new_for_embed (s_mark);

  gui= anubisrecog_gui_new(disp, NULL, s_face);
  ((AnubisrecogGuiUpdate*)s_updt)->gui= gui;
  
  anubis_cv_gtkdisplay_auto_play(disp);

  // now dosen't delte object correctly so still alive s_cap
  anubis_cv_reset_capture_propaty (s_cap);
  return 1;
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
    {"face", 0, 0, 'f'},
    {"help", 0, 0, 'h'},
    {0, 0, 0, 0}
  };
  while(1){
    c= getopt_long(argc, argv, "j:m:f:h", long_options, &option_index);
    if (c == -1) break;

    switch(c) {
    case 'j': jets_fname   = optarg; break;
    case 'm': masks_fname  = optarg; break;
    case 'f': fg_jets_fname= optarg; break;
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
  fprintf(stderr,
	  "  -f filename --face filename (whitch genereated by anubisfacesampling)\n     set face graph jet file (default %s)\n", FACE_JET_DEFAULT_XML_FNAME);
  fprintf(stderr, "  -h, -?, --help                   show this help\n");

  exit (-1);
}
