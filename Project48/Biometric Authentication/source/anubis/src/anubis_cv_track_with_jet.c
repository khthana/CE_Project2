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
#include "anubis_cv_track_with_jet.h"

void anubis_cv_track_with_jet_params_setup(AnubisCVTrackWithJet* filter, MalibBuffer* buf, char* jets_fname, char* masks_fname);
void anubis_cv_track_with_jet_write_frame_data(AnubisCVTrack* filter, MalibFrame* frame);

void
correct_points_by_jets(AnubisCVTrackWithJet* filter, MalibFrame* frame);

static void
draw_cv_marker(IplImage* img, AnubisCVTrack* filter);

static AnubisCVTrackWithJetClass anubis_cv_track_with_jet_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_track_with_jet_write_frame_data,
  (AnubisDrawMarkerFunc)                 draw_cv_marker
};

/* public functions ***************************************************/

AnubisCVTrackWithJet*
anubis_cv_track_with_jet_new_with_buf(MalibBuffer* buf,
				     char* jets_fname, char* masks_fname){
  AnubisCVTrackWithJet * filter;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVTrackWithJet, &anubis_cv_track_with_jet_class,
			       MALIB_FRAME_COLORMODEL_GRAY,
			       &filter);

  malib_filter_set_buffer(filter,buf);

  ((AnubisMarkerFilter*) filter)->user_data= filter;

  anubis_cv_track_with_jet_params_setup(filter, buf, jets_fname, masks_fname);

  return filter;
}

/* private functions **************************************************/

void
anubis_cv_track_with_jet_params_setup(AnubisCVTrackWithJet* filter, MalibBuffer* buf,
				     char* jets_fname, char* masks_fname){

  MalibFrame* prev_frame= malib_buffer_get_current_frame(buf);

  anubis_cv_track_params_setup(filter, buf);

  filter->storage= cvCreateMemStorage(0);

  filter->xml_jets   = grj_xml_parse_file (jets_fname);
  filter->masks_fname= masks_fname; 
  filter->parts_jets_seq= grj_xml_jets_to_jets_sequence(filter->xml_jets, filter->masks_fname,
							filter->storage);
  filter->masks   = readMasksFile (masks_fname);

  filter->csu_image= makeImage (prev_frame->width, prev_frame->height, 1);

  return;
}

void
anubis_cv_track_with_jet_write_frame_data(AnubisCVTrack* filter, MalibFrame* frame){
  MalibFrame * frame0, * frame1;
  malib_filter_preprocess((MalibFilter*) filter, frame);

  /* This process should do when skipping, too.
     Because needs to ready for add_points etc...*/
  MalibRingBuf* r_buf= ((MalibFilter*)filter)->buf;
  frame0= malib_ringbuf_get_frame (r_buf, 0);
  frame1= malib_ringbuf_get_frame (r_buf, -1);
  
  ANUBIS_CV_IMAGE_PIXTYPE * from0= frame0->data;
  ANUBIS_CV_IMAGE_PIXTYPE * from1= frame1->data;
  
  filter->cv_img0->imageData= from0;
  filter->cv_img1->imageData= from1;

  frame->data= frame0->data;
  
  if(!filter->skip){
    double quality= 0.01;
    double min_distance= 10;
    CvPoint2D32f *swap_points;
    IplImage *swap_temp;
  
    anubis_cv_track_feature_track(filter);
    
    if(filter->track_points_num == filter->face_parts_len){
      anubis_cv_track_points_to_face_graph(filter->points[0], filter->track_points_num,
					  filter->status,
					  filter->face_graph, filter->points_vertLabel);


      //if(filter->init_counter <= 5){
      filter->init_counter++;
      correct_points_by_jets(filter, frame);
	//}
    }

    CV_SWAP( filter->pyramid1, filter->pyramid0, swap_temp );
    CV_SWAP( filter->points[1], filter->points[0], swap_points );
  } else {
    filter->init_counter= 0;
  }
  return;
}

void
correct_points_by_jets(AnubisCVTrackWithJet* filter, MalibFrame* frame){
  /*
    correct positions by jets similarity from sampled data

    caution!: this program expectated condition 'filter->track_points_num == filter->face_parts_len'
   */
  GaborJet* data_jet;
  GaborJet* tracking_jet= makeGaborJet(filter->masks->size/2);
  JetDisplacementEstimator dispEst= DEPredictiveIter;

  int i,j, best_seq_elem;
  GFTYPE x, y, dx, dy, best_dx, best_dy;
  FTYPE sim, bestsim;
  double resize_rate= ((AnubisCVTrack*)filter)->resize_rate;

  set_resized_csu_image_from_cv_frame(filter->csu_image, frame, resize_rate);
  
  
  for(i= 0; i < ((AnubisCVTrack*)filter)->track_points_num; i++){
    x= ((AnubisCVTrack*)filter)->points[0][i].x;
    y= ((AnubisCVTrack*)filter)->points[0][i].y;
    setExtractJet(tracking_jet, x * resize_rate, y * resize_rate, filter->csu_image, filter->masks);
    dx= dy= best_dx= best_dy= bestsim= 0.0;

    for(j= 0; j < filter->parts_jets_seq[i]->total; j++){
      data_jet= cvGetSeqElem(filter->parts_jets_seq[i], j);
      sim= dispEst(tracking_jet, data_jet, &dx, &dy);
      if(sim > bestsim){
	bestsim= sim;
	best_seq_elem= i;
	best_dx= dx;
	best_dy= dy;
      }
    }
    //huristic threshold
    if( bestsim > 0.7 ){
      ((AnubisCVTrack*)filter)->points[1][i].x= x + (best_dx / resize_rate);
      ((AnubisCVTrack*)filter)->points[1][i].y= y + (best_dy / resize_rate);
      
      cvFindCornerSubPix( ((AnubisCVTrack*)filter)->cv_img0, ((AnubisCVTrack*)filter)->points[0] + i, 1,
			  cvSize(10,10), cvSize(-1,-1),
			  cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,20,0.03));
      printf("done jet replace track point %f, dx %f, dy %f###############################\n",
	     bestsim, best_dx, best_dy);
    }

  }

  freeGaborJet(tracking_jet);
  return;
}

static void
draw_cv_marker(IplImage* img, AnubisCVTrack* filter){
  if(filter->skip)
    return;
  
  int i;
  for(i= 0; i < filter->track_points_num; i++){
    if(filter->status[i])
      cvCircle( img, cvPointFrom32f(filter->points[1][i]), 3, CV_RGB(255,255,255), -1, 8,0);
  }
  return;
}
