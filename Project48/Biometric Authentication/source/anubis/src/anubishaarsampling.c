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

#include <getopt.h>
#include "anubis_common.h"
#include "anubis_cv_capture.h"
#include "anubis_cv_gtkdisplay.h"
#include "anubis_cv_haar_detect_obj.h"
#include "anubissimple_gui.h"
#include "recog_by_jets.h"
#include "anubis_marker.h"
#include "anubis_color_config.h"
#include "anubisrecog_gui.h"
#include "anubis_cv_capture.h"
#include "anubis_cv_rgb2gray.h"
#include "anubis_haar_data_sampling.h"
#include "anubishaarsampling_gui_with_update.h"
#include "anubis_cv_track.h"
#include "anubis_cv_track_with_jet.h"


#define ANUBISHAARSAMPLING_TITLE "anubishaarsampling"

#define DEFAULT_A_MEAN 	"/anubis/color_params/a_mean=0.5"
#define DEFAULT_B_MEAN 	"/anubis/color_params/b_mean=0.5"
#define DEFAULT_A_COEF 	"/anubis/color_params/a_coef=0.05"
#define DEFAULT_B_COEF 	"/anubis/color_params/b_coef=0.05"

#define ANUBISHAARSAMPLING_DEFAULT_VERT_XML_FNAME "face_vert.xml"

static
int check_option(int argc, char** argv);

void show_usage_and_exit ();

static unsigned char * jets_fname   = NULL;
static unsigned char * masks_fname  = NULL;
static unsigned char * fg_jets_fname= NULL;
static unsigned char * vert_xml_fname= NULL; /* output file */
static int             with_jet=0;

int main(int argc, char* argv[])
{
  MalibSource     * s_cap, * s_conf, * s_gray, * s_haar, * s_jets, * s_j_fg, * s_t_fg,
                  * s_mark, * s_samp, * s_updt, * s_track;

  MalibBuffer     * b_cap, * b_conf, * b_gray, * b_haar, * b_jets, * b_j_fg, * b_t_fg,
                  * b_mark, * b_samp, * b_updt, * b_track;

  MalibGtkDisplay * d_cap, * d_conf, * d_gray, * d_haar, * d_jets, * d_j_fg, * d_t_fg,
                  * d_mark, * d_samp, * d_updt, * d_track;

  AnubisSimpleGui * gui;

  check_option(argc, argv);
  malib_init (&argc, &argv);

  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (320, 240);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);

  s_gray= (MalibSource*) anubis_cv_rgb2gray_new_with_buf (b_cap);
  b_gray= (MalibBuffer*) malib_ringbuf_new_with_source (ANUBIS_CV_MIN_RING_BUF_SIZE, s_gray);

  s_haar= (MalibSource*) anubis_cv_haar_detect_obj_new_with_buf(b_cap, 0);
  b_haar= (MalibBuffer*) malib_plainbuf_new_with_source (s_haar);

  s_jets= (MalibSource*) recog_by_jets_new_with_buf (b_haar, s_haar, jets_fname, masks_fname);
  b_jets= (MalibBuffer*) malib_plainbuf_new_with_source(s_jets);


  s_j_fg= (MalibSource*) anubis_face_graph_measure_new_with_buf_and_jets (b_jets, ((RecogByJets*)s_jets)->cur_graph,
									 fg_jets_fname, masks_fname,
									 FGRAPH, 0.8);
  ((AnubisFaceGraphMeasure*)s_j_fg)->geoEst= GeometrySimLeastSquaresNLS;
  b_j_fg= (MalibBuffer*) malib_plainbuf_new_with_source(s_j_fg);


  if(with_jet)
    s_track= (MalibSource*) anubis_cv_track_with_jet_new_with_buf(b_gray, jets_fname, masks_fname);
  else
    s_track= (MalibSource*) anubis_cv_track_new_with_buf(b_gray);
  b_track= (MalibBuffer*) malib_plainbuf_new_with_source(s_track);

  s_t_fg= (MalibSource*) anubis_face_graph_measure_new_with_buf_and_jets (b_track, ((AnubisCVTrack*)s_track)->face_graph,
									 fg_jets_fname, masks_fname, FGRAPH, 0.65);
  ((AnubisFaceGraphMeasure*)s_t_fg)->geoEst= GeometrySimLeastSquares;
  b_t_fg= (MalibBuffer*) malib_plainbuf_new_with_source(s_t_fg);

  s_samp= (MalibSource*) anubis_haar_data_sampling_new_with_bufs (b_j_fg, b_t_fg, s_j_fg, s_t_fg,
								 (AnubisCVHaarDetectObj*)s_haar, 
								 (RecogByJets*)s_jets,
								 (AnubisCVTrack*)s_track,
								 ANUBISHAARSAMPLING_DEFAULT_VERT_XML_FNAME);
  b_samp= (MalibBuffer*) malib_plainbuf_new_with_source(s_samp);

  s_updt= (MalibSource*) anubishaarsampling_gui_update_new_with_buf(b_samp, s_haar, s_jets, s_j_fg, s_t_fg, s_samp);
  b_updt= (MalibBuffer*) malib_plainbuf_new_with_source(s_updt);
  
  AnubisMarkerFilter marker_filters[]= {s_jets, s_haar, s_track, NULL};

  s_mark= (MalibSource*) anubis_marker_new_with_buf_and_filters(b_updt, marker_filters);
  d_mark= anubis_cv_gtkdisplay_new_for_embed (s_mark);

  gui= anubishaarsampling_gui_new(d_mark, s_j_fg, s_t_fg, s_samp);
  ((AnubisHaarSamplingGuiUpdate*)s_updt)->gui= gui;
  
  anubis_cv_gtkdisplay_auto_play(d_mark);
  anubis_cv_reset_capture_propaty (s_cap);
  return 0;
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
    {"vert", 0, 0, 'v'},
    {"help", 0, 0, 'h'},
    {0, 0, 0, 0}
  };
  while(1){
    c= getopt_long(argc, argv, "j:m:f:v:hw", long_options, &option_index);
    if (c == -1) break;

    switch(c) {
    case 'j': jets_fname    = optarg; break;
    case 'm': masks_fname   = optarg; break;
    case 'f': fg_jets_fname = optarg; break;
    case 'v': vert_xml_fname= optarg; break;
    case 'w': with_jet= 1; break;
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
	  "  -f filename --face filename (whitch genereated by anubisfacesampling)"
	  " set face graph jet file (default %s)\n", FACE_JET_DEFAULT_XML_FNAME);
  fprintf(stderr,
	  "  -v output_filename --vert output_filname (it's generate sampled face verts data)\n"
	  );
  fprintf(stderr,
	  "  -w tracking with jet (it's test version)\n"
	  );
  
  fprintf(stderr, "  -h, -?, --help                   show this help\n");

  exit (-1);
}
