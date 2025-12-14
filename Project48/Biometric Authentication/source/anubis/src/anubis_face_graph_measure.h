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

#ifndef __ANUBIS_FACE_GRAPH_MEASURE_H__
#define __ANUBIS_FACE_GRAPH_MEASURE_H__

#include <malib/malib.h>
#include "anubis_common.h"

BEGIN_C_DECLS

#include "csuEBGMUtil.h"
#include "csuEBGMSimilarity.h"
#include "recog_by_jets.h"

/*
  choose geoEst from forrow functions.
  FTYPE GeometrySimL2(FaceGraph, FaceGraph);
  FTYPE GeometrySimCorrelation(FaceGraph, FaceGraph);
  FTYPE GeometrySimLeastSquares(FaceGraph, FaceGraph);
  FTYPE GeometrySimLeastSquaresPS(FaceGraph f1, FaceGraph f2);
  FTYPE GeometrySimLeastSquaresPI(FaceGraph f1, FaceGraph f2);
  FTYPE GeometrySimLeastSquaresFLS(FaceGraph f1, FaceGraph f2);
  FTYPE GeometrySimLeastSquaresNLS(FaceGraph f1, FaceGraph f2);
  FTYPE GeometrySimWLeastSquaresPI(FaceGraph f1, FaceGraph f2);
  
  choose fgEst from forrwow functions 
  FTYPE fgSimMagnitude(FaceGraph, FaceGraph);
  FTYPE fgSimPhase(FaceGraph, FaceGraph);
  FTYPE fgSimPhaseGridSample(FaceGraph, FaceGraph);
  FTYPE fgSimPhasePredictiveStep(FaceGraph, FaceGraph);
  FTYPE fgSimPhasePredictiveIter(FaceGraph, FaceGraph);
  FTYPE fgSimPhaseFixedLocalSearch(FaceGraph, FaceGraph);
  FTYPE fgSimPhaseNarrowingLocalSearch(FaceGraph, FaceGraph);
*/

#define ANUBIS_DEFAULT_GEO_EST GeometrySimLeastSquaresNLS;
//#define ANUBIS_DEFAULT_GEO_EST GeometrySimLeastSquares;
#define ANUBIS_DEFAULT_FG_EST  fgSimPhasePredictiveStep;

#define FACE_DETECT_THRESHOLD 0.8

#define SIM_JET_THRESHOLD 0.8
/* simgeo pass if smaller than this value */
#define SIM_GEO_THRESHOLD 10

#define ANUBIS_SIMGEO_SCALE 0.3
#define ANUBIS_SIM_WEIGHT_ALPHA 0.5

typedef struct _AnubisFaceGraphMeasureClass{
  MalibFilterClass super;
} AnubisFaceGraphMeasureClass;

enum _DetectMethod {FGRAPH_AND_JETS, FGRAPH, JETS};
typedef enum _DetectMethod DetectMethod;

typedef struct _AnubisFaceGraphMeasure{
  MalibFilter super;

  FaceGraphSimilarity geoEst;
  FaceGraphSimilarity fgEst;

  RecogByJets* rbj_filter;
  
  int skip_write_frame_data;
  
  FaceGraph * sample_face_graphs;
  FaceGraph novel_face_graph;
  FaceGraph simmax_face_graph;
  FTYPE     simmax;
  FTYPE     simjet_max;
  FTYPE     simgeo_max;

  FTYPE     simgeo_scale; /* similarity of geometory intensity of change */
  FTYPE     alpha; /* rate of weight jits and geometory ,
		      sim=   simjet * alpha + simgeo_exp * (1 - alpha);*/
  
  FaceGraph last_detected_face_graph;
  FTYPE     last_detected_simmax;
  FTYPE     face_detect_threshold;
  int detect; /* flag */
  DetectMethod detect_method;

  GrjXmlJets       * xml_jets;
  char * masks_fname;
  char * fg_jets_fname; /* sample face graph jets file name */

  
  CvMemStorage * storage;
  CvSeq * face_graph_seq;
  
} AnubisFaceGraphMeasure;

AnubisFaceGraphMeasure*
anubis_face_graph_measure_new_with_buf_and_jets (MalibBuffer* buf, FaceGraph face_graph,
						char* jets_fname, char* masks_fname,
						DetectMethod d_method, double fd_threshold);

END_C_DECLS
#endif /* __ANUBIS_FACE_GRAPH_MEASURE_H__ */
