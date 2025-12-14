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
#ifndef __RECOG_BY_JETS_H__
#define __RECOG_BY_JETS_H__


#include <math.h>
#include <string.h>
#include <malib/malib.h>
#include <gdk_imlib.h>
#include <opencv/cv.h>
BEGIN_C_DECLS

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */


#include "gaborrg_recog.h"
#include "gaborrg_recog_jet_file_io.h"
#include "gaborrg_recog_gui.h"
#include "anubis_common.h"
#include "csuCommonImage.h"
#include "csuEBGMSimilarity.h"
#include "anubis_cv_haar_detect_obj.h"
#include "anubis_cv_snake.h"
#include "kd_tree.h"
#include "anubis_marker_filter.h"

#define GRJ_DEFAULT_XML_FILE  "gaborrg_jet.xml"
#define GRJ_DEFAULT_MASK_FILE "gaborrg_jet.xml.masks"
#define GRJ_Y_SAMPLING_LATE 8 /* rate par pixel */
#define GRJ_X_SAMPLING_LATE 8 /* rate par pixel */

#define GRJ_VERTS_JETS_NUM 5  /* each vert of jet num */
                              /* needs to be smaller than cur_jets_num */
#define RBJ_FACE_CONT_POINTS_MAX 100

/*
  choose function from those functions
  estimateDisplacementRandom
  DEGridSample
  DEPredictiveStep
  DEPredictiveIter
  DEFixedLocalSearch
  DENarrowingLocalSearch
 */
/*#define GRJ_DISPLACE_EST   DEPredictiveStep*/
#define GRJ_DISPLACE_EST   DEPredictiveIter
/*#define GRJ_DISPLACE_EST   DENarrowingLocalSearch*/


#define GRJ_X_NARROWING_OFFSET 20
/*#define GRJ_Y_NARROWING_OFFSET 30*/
#define GRJ_Y_NARROWING_OFFSET 20

typedef struct _RecogByJetsClass{
  /*MalibMergerClass super;*/
  AnubisMarkerFilterClass super;
} RecogByJetsClass;

typedef struct _RecogByJets{
  /*MalibMerger super;*/
  AnubisMarkerFilter super;

  /* csu data types */
  Image       cur_image;
  double      cur_image_rate; /* allocated rate */
  GaborJet  * cur_jets;
  int       * cur_jets_area_idx; /* index of beggining each face area (like EYES, NOSE, etc...) */
  int         cur_jets_num;
  int         cur_target_face_num;

  GaborJet  * cur_sim_jets;
  int         cur_sim_jets_num;
  FaceGraph   cur_graph;
  
  FaceGraph * face_graphs; /* last 1 is NULL */
  char      * masks_fname;
  JetMasks    masks;

  FaceParts*  face_parts_area_of_vert[FacePartsArea_LEN];
  double ** face_parts_area_coeffs;

  double x_s_rate, y_s_rate;

  /* OpenCV data types */
  AnubisCVHaarDetectObj * haar_filter;
  IplImage * cur_cv_image; /* for tmp image for resize */
  double rotate_angle;
  CvPoint rotate_center;
  IplImage * cv_contour_image;
  double resize_rate;
  CvRect face_rect;
  CvPoint * cv_contour_points;
  int cv_contour_points_len;
  float * cv_snake_alpha;
  float * cv_snake_beta;
  float * cv_snake_gamma;

  CvMemStorage * storage;

  CvSeq ** parts_jets_seq;

  /* gaborrg data types */
  int skip;
  MalibGtkDisplay  * display;
  MalibFilter      * recog_point_mask;
  GrjXmlJets       * xml_jets;

} RecogByJets;


RecogByJets*
recog_by_jets_new_with_buf (MalibBuffer* buf,
			     AnubisCVHaarDetectObj* haar_filter,
			     char* jets_fname, char* masks_fname);

int
recog_by_jets_check_eyes_locations (RecogByJets* filter);


END_C_DECLS
#endif /* __RECOG_BY_JETS_H__ */
