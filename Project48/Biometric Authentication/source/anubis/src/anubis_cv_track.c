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
#include "anubis_cv_track.h"

void
anubis_cv_track_write_frame_data(AnubisCVTrack* filter, MalibFrame* frame);

void track_points_auto_setup(AnubisCVTrack* filter);

static void
draw_cv_marker(IplImage* img, AnubisCVTrack* filter);

static AnubisCVTrackClass anubis_cv_track_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_track_write_frame_data,
  (AnubisDrawMarkerFunc)                 draw_cv_marker
};

/* public functions ***************************************************/

AnubisCVTrack*
anubis_cv_track_new_with_buf(MalibBuffer* buf){
  AnubisCVTrack * filter;
  MalibFrame * prev_frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisCVTrack, &anubis_cv_track_class,
			       MALIB_FRAME_COLORMODEL_GRAY,
			       &filter);

  malib_filter_set_buffer(filter,buf);

  ((AnubisMarkerFilter*) filter)->user_data= filter;

  anubis_cv_track_params_setup(filter, buf);

  return filter;
}

void anubis_cv_track_params_setup(AnubisCVTrack* filter, MalibBuffer* buf){
  MalibFrame* prev_frame;
  prev_frame= malib_buffer_get_current_frame(buf);

  /* setup params */
  filter->skip= 0;
  filter->init_counter= 0;

  /* 0 means current , 1 means previous */
  filter->cv_img0 = anubis_create_cv_image_headder_from_malib_frame(prev_frame);
  filter->cv_img1 = anubis_create_cv_image_headder_from_malib_frame(prev_frame);
  filter->pyramid0= anubis_create_cv_image_from_malib_frame(prev_frame, 1);
  filter->pyramid1= anubis_create_cv_image_from_malib_frame(prev_frame, 1);

  filter->points[0]= (CvPoint2D32f*)cvAlloc(ANUBIS_CV_TRACK_POINTS_NUM_MAX*sizeof(filter->points[0][0]));
  filter->points[1]= (CvPoint2D32f*)cvAlloc(ANUBIS_CV_TRACK_POINTS_NUM_MAX*sizeof(filter->points[0][0]));
  filter->points_vertLabel= malloc(ANUBIS_CV_TRACK_POINTS_NUM_MAX*sizeof(char*));

  filter->face_parts_len= FaceParts_LEN;
  filter->face_graph= makeFaceGraph(filter->face_parts_len, filter->face_parts_len);

  int i;
  for(i= 0; i < filter->face_graph->totalsize; i++){
    filter->face_graph->jets[i]= makeGaborJet(0);
    filter->face_graph->jets[i]->vertLabel= NULL;
  }

  filter->status          = (char*)cvAlloc(ANUBIS_CV_TRACK_POINTS_NUM_MAX);
  filter->win_size        = ANUBIS_CV_TRACK_WIN_SIZE;
  filter->flags           = 0;
  filter->track_points_num= 0;
  filter->lost_points_num = 0;
  filter->auto_setup      = 0;
  filter->resize_rate     = 1.0;

  return;
}

void anubis_cv_track_add_point(AnubisCVTrack* filter, CvPoint pt, int find_corner){
  /* @find_corner: recommend 1
   */
  
  filter->points[0][filter->track_points_num++]= cvPointTo32f(pt);

  if(find_corner){
    cvFindCornerSubPix( filter->cv_img0, filter->points[0] + filter->track_points_num - 1, 1,
			//cvSize(filter->win_size,filter->win_size), cvSize(-1,-1),
			cvSize(5,5), cvSize(-1,-1),
			cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,20,0.03));
  }
}

void anubis_cv_track_add_point_with_vert_name(AnubisCVTrack* filter, CvPoint pt, char* vertLabel, int find_corner){
  filter->points_vertLabel[filter->track_points_num]= vertLabel;
  anubis_cv_track_add_point(filter, pt, find_corner);
}

void anubis_cv_track_clear_all_points(AnubisCVTrack* filter){
  filter->track_points_num= 0;
  filter->lost_points_num= 0;
  filter->flags= 0;
  return;
}

void anubis_cv_track_points_to_face_graph(CvPoint2D32f* points, int track_points_num, char* status,
				FaceGraph face_graph, char** points_vertLabel){
  
  /* Fixme: track_points_num equal to face_graph->totalsize */
  int i;
 
  for(i= 0; i < track_points_num; i++){
    if(status[i]){
      face_graph->jets[i]->x= points[i].x;
      face_graph->jets[i]->y= points[i].y;
      face_graph->jets[i]->vertLabel= points_vertLabel[i];
    }
  }
  return;
}

/* private functions **************************************************/

void
anubis_cv_track_write_frame_data(AnubisCVTrack* filter, MalibFrame* frame){
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

  if(!filter->skip){
    double quality= 0.01;
    double min_distance= 10;
    CvPoint2D32f *swap_points;
    IplImage *swap_temp;
  
    if(filter->init_counter > ((MalibHolder*)r_buf)->size) {
      if(filter->auto_setup){
	track_points_auto_setup(filter);
	CV_SWAP( filter->pyramid1, filter->pyramid0, swap_temp );
	CV_SWAP( filter->points[1], filter->points[0], swap_points );
	filter->auto_setup= 0;
      }
      anubis_cv_track_feature_track(filter);

      if(filter->track_points_num == filter->face_parts_len)
	anubis_cv_track_points_to_face_graph(filter->points[0], filter->track_points_num, filter->status,
					    filter->face_graph, filter->points_vertLabel);
      
      CV_SWAP( filter->pyramid1, filter->pyramid0, swap_temp );
      CV_SWAP( filter->points[1], filter->points[0], swap_points );
    }
  }

  if(filter->init_counter <= ((MalibHolder*)r_buf)->size)
    filter->init_counter++;
  
  frame->data= frame0->data;

  return;
}

void anubis_cv_track_feature_track(AnubisCVTrack* filter){

  if(filter->track_points_num){
    cvCalcOpticalFlowPyrLK( filter->cv_img1, filter->cv_img0,
			    filter->pyramid1, filter->pyramid0,
			    filter->points[1],filter->points[0], 
			    filter->track_points_num, cvSize(filter->win_size,filter->win_size),
			    3, filter->status, 0,
			    cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,20,0.03), filter->flags );
    
    filter->flags |= CV_LKFLOW_PYR_A_READY;
  }

  /* update points */
  int i,k;
  for(i= k= 0; i < filter->track_points_num; i++){
    if( !filter->status[i] ){
      filter->lost_points_num++;
      continue;
    } else {
      filter->points_vertLabel[k]= filter->points_vertLabel[i];
      filter->points[0][k++]= filter->points[0][i];
    }
  }
  filter->track_points_num= k;

  return;
}


void track_points_auto_setup(AnubisCVTrack* filter){
  IplImage* eig = cvCreateImage( cvGetSize(filter->cv_img0), 32, 1 );
  IplImage* temp= cvCreateImage( cvGetSize(filter->cv_img0), 32, 1 );

  double quality     = 0.01;
  double min_distance= 10;
  
  filter->track_points_num = ANUBIS_CV_TRACK_POINTS_NUM_MAX;

  cvGoodFeaturesToTrack( filter->cv_img0, eig, temp, filter->points[0], &filter->track_points_num,
			 quality, min_distance, 0, 3, 0, 0.04 );
  cvFindCornerSubPix( filter->cv_img0, filter->points[0], filter->track_points_num,
		      cvSize(filter->win_size,filter->win_size), cvSize(-1,-1),
		      cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,20,0.03));
  cvReleaseImage( &eig );
  cvReleaseImage( &temp );
  
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
