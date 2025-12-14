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

#include "anubis_face_graph_measure.h"

void
anubis_face_graph_measure_write_frame_data(AnubisFaceGraphMeasure* filter, MalibFrame* frame);

void
anubis_face_graph_measure_delete(AnubisFaceGraphMeasure* filter);

void
anubis_face_graph_setup_params(AnubisFaceGraphMeasure* filter);

void
anubis_face_graph_read_jet_settings_from_file(AnubisFaceGraphMeasure* filter,
					     char* fg_jets_fname, char* masks_fname);
void
comapre_to_sample_face_graphs(AnubisFaceGraphMeasure* filter);

/*
 Fixme: AnubisFaceGraphMeasure can't delete (cause segfalut)
 it's needs to rewrite frame->data style
*/
static AnubisFaceGraphMeasureClass anubis_face_graph_measure_class=
{
  //(void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibObject*))              anubis_face_graph_measure_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_face_graph_measure_write_frame_data
};


/* public functions **************************************************/

AnubisFaceGraphMeasure*
anubis_face_graph_measure_new_with_buf_and_jets (MalibBuffer* buf, FaceGraph face_graph,
						char* fg_jets_fname, char* masks_fname,
						DetectMethod d_method, double fd_threshold){
  /*
    @d_method: detect method choose from {FGRAPH_AND_JETS, FGRAPH, JETS}
    @fd_threshold: face detect threshold 0.0 ~ 1.0 if face similaryty value larger than this value
                   set 1 to AnubisFaceGraphMeasure->detect
   */
  AnubisFaceGraphMeasure * filter;
  MalibFrame * prev_frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisFaceGraphMeasure, &anubis_face_graph_measure_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY |
			       MALIB_FRAME_COLORMODEL_BW,
			       &filter);

  prev_frame= malib_buffer_get_current_frame(buf);

  malib_filter_set_buffer(filter,buf);

  /*make_face_graph_from_cur_sim_jets*/
  FaceParts face_parts_len= FaceParts_LEN;
  
  //filter->rbj_filter= rbj_filter;
  filter->detect_method= d_method;
  filter->novel_face_graph= face_graph;
  filter->face_detect_threshold= fd_threshold;

  anubis_face_graph_setup_params(filter);
  
  anubis_face_graph_read_jet_settings_from_file(filter, fg_jets_fname, masks_fname);

  return filter;
}

/* private functions **************************************************/

void
anubis_face_graph_setup_params(AnubisFaceGraphMeasure* filter){
  //filter->face_detect_threshold   = FACE_DETECT_THRESHOLD;
  filter->last_detected_face_graph= NULL;
  filter->last_detected_simmax    = 0.0;
  
  filter->simgeo_scale= ANUBIS_SIMGEO_SCALE;
  filter->alpha       = ANUBIS_SIM_WEIGHT_ALPHA;

  filter->geoEst = ANUBIS_DEFAULT_GEO_EST;
  filter->fgEst  = ANUBIS_DEFAULT_FG_EST;

  filter->detect= 0;
}

void
anubis_face_graph_read_jet_settings_from_file(AnubisFaceGraphMeasure* filter,
					     char* fg_jets_fname, char* masks_fname){
  char * tmp_name;

  filter->skip_write_frame_data= 0;
  
  if(!fg_jets_fname){
    fg_jets_fname= malloc( sizeof(FACE_JET_DEFAULT_XML_FNAME) );
    fg_jets_fname= FACE_JET_DEFAULT_XML_FNAME;
    filter->skip_write_frame_data= 1;
  }

  if(!masks_fname){
    tmp_name= malloc (sizeof(GABORRG_JET_DEFAULT_XML_FNAME)
			 + sizeof(GABORRG_JET_MASKS_EXTENTION));
    sprintf(tmp_name, "%s%s", GABORRG_JET_DEFAULT_XML_FNAME, GABORRG_JET_MASKS_EXTENTION);
    masks_fname= get_anubis_data_file_full_path_name(tmp_name);
    free (tmp_name);
  }

  filter->masks_fname= masks_fname;
  filter->fg_jets_fname= fg_jets_fname;
  
  filter->xml_jets   = grj_xml_parse_file (fg_jets_fname);
  
  if(filter->xml_jets){
    filter->sample_face_graphs= grj_xml_jets_to_face_graphs (filter->xml_jets, filter->masks_fname);
  } else {
    filter->skip_write_frame_data= 1;
  }

  filter->storage= cvCreateMemStorage(0);
  
  return;
}

void anubis_face_graph_measure_write_frame_data (AnubisFaceGraphMeasure* filter, MalibFrame* frame){
  MalibFrame * prev_frame;
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_filter_preprocess ((MalibFilter*) filter, frame);
  
  prev_frame= malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);
 
  if(!filter->skip_write_frame_data){
    comapre_to_sample_face_graphs (filter);
  }
  /*
  if (((filter->detect_method == FGRAPH_AND_JETS) && (filter->simmax > filter->face_detect_threshold)) ||
      ((filter->detect_method == FGRAPH)      && (filter->simgeo_max > filter->face_detect_threshold)) ||
      ((filter->detect_method == JETS)        && (filter->simjet_max > filter->face_detect_threshold)))
  */
  if(filter->simmax > filter->face_detect_threshold)
    {
      filter->detect= 1;
    } else {
      filter->detect= 0;
    }

  frame->data= prev_frame->data;
    
  return;
}

void
anubis_face_graph_measure_delete(AnubisFaceGraphMeasure* filter){
  return;
}

void
comapre_to_sample_face_graphs(AnubisFaceGraphMeasure* filter){
  FaceGraphSimilarity geoEst, fgEst;

  geoEst = filter->geoEst;
  fgEst  = filter->fgEst;
  g_print("Face graph similaryty\n");

  FTYPE simjet, simgeo, sim, alpha, simgeo_exp, simgeo_scale;
  int i;

  simgeo_scale= filter->simgeo_scale;
  alpha       = filter->alpha;
  
  filter->simmax    = 0.0;
  filter->simjet_max= 0.0;
  filter->simgeo_max= 0.0;
  filter->simmax_face_graph= NULL;
  
  for(i= 0; filter->sample_face_graphs[i]; i++){
    /* check jet existance */
    if(filter->novel_face_graph->jets[0]->vertLabel){
      
      if(filter->detect_method == FGRAPH_AND_JETS || filter->detect_method == JETS){
	simjet    = - fgEst (filter->novel_face_graph, filter->sample_face_graphs[i]);
	if(filter->detect_method == JETS)
	  sim= simjet;
      }
      if (filter->detect_method == FGRAPH_AND_JETS || filter->detect_method == FGRAPH){
	simgeo    = geoEst(filter->novel_face_graph, filter->sample_face_graphs[i]) / filter->novel_face_graph->geosize;
	simgeo_exp= exp   (- (simgeo * simgeo_scale));
	if(filter->detect_method == FGRAPH)
	  sim= simgeo_exp;
      }
      if (filter->detect_method == FGRAPH_AND_JETS){
	sim       =   simjet * alpha + simgeo_exp * (1 - alpha);
      }

      if(sim > filter->simmax){
	filter->simmax= sim;
	filter->simjet_max= simjet;
	filter->simgeo_max= simgeo_exp;
	filter->simmax_face_graph= filter->sample_face_graphs[i];
      }
      
      
    }
  }

  /*g_print("Face graph %s, Jet sim %f, Geo sim %f, Geo exp %f, convolve %f\n",
    filter->sample_face_graphs[i]->faceLabel, simjet, simgeo, simgeo_exp, sim);
  */

  g_print ("filter->simmax %f\n", filter->simmax);
  if(filter->simmax > filter->face_detect_threshold){
    filter->last_detected_face_graph= filter->simmax_face_graph;
    filter->last_detected_simmax    = filter->simmax;
  }
  return;
}
