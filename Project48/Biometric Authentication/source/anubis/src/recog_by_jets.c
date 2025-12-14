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
#include "recog_by_jets.h"

void setup_cv_image(RecogByJets* filter);

void read_jet_settings_from_file (RecogByJets* filter,
				  char* jets_fname, char* masks_fname);

void
recog_by_jets_create_param (RecogByJets* filter);

void
recog_by_jets_setup_cv_sequence(RecogByJets* filter);

void recog_by_jets_write_frame_data(RecogByJets*, MalibFrame*);

static void
draw_cv_marker(IplImage* img, RecogByJets * filter);

void
set_contour_points_from_filter(RecogByJets* filter);

void recog_by_jets_mark_at_recog_point(RecogByJets* filter, MalibFrame* frame);
void recog_by_jets_draw_crossline(RecogByJets* filter, MalibFrame* frame,
				   int x, int y);
void recog_by_jets_stdout_recog_point(RecogByJets* filter);
void recog_by_jets_set_allocation_xy(RecogByJets* filter, MalibFrame* frame);
void get_face_angle_from_eye_lineup(MalibFrame* in_frame, RecogByJets* filter);
void rbj_jet_sampling_from_frame(MalibFrame* in_frame, RecogByJets* filter);
void jet_sampling_preprocess (MalibFrame* in_frame, RecogByJets* filter);
GaborJet* rbj_make_gabor_jets(int num, JetMasks masks);

void rbj_set_sim_jets(RecogByJets* filter); 

void rbj_set_bestsim_of_vert(FaceParts vert, CvSeq** parts_jets_seq,
			     GaborJet* cur_jets, int cur_jets_num, int* cur_jets_area_idx,
			     FTYPE* bestsim, int* best_cur_jets_idx, int* best_seq_elem);

int
is_area(int k, FacePartsArea area, int* cur_jets_area_idx);

void
set_guess_face_parts_jets(RecogByJets* filter, CvRect face_rect, double parts_rect_coeff[],
			  FacePartsArea area, int *jet_num);

void set_nearest_jet_of_novel_and_org(GaborJet dst_jet, GaborJet novel_jet, GaborJet org_jet,
				      double resize_rate, Image img, JetMasks masks);

void
set_extract_jets_region_with_area(RecogByJets* filter, CvRect area_rect, int* jets_num, FacePartsArea area);

double
get_co_mean_error_from_mean_vector (CvPoint* points, int points_num);

double
get_co_mean_vector_angle (CvPoint* points, int points_num);

double check_both_eyes_distance_rate(RecogByJets* filter);

double
check_both_eyes_on_mean_vec_dist_rate(RecogByJets* filter, CvMat * vMEAN);

void
set_extract_jets_region (GaborJet* jets, JetMasks masks,CvRect region_rect,
			 Image csu_image, double x_s_rate, double y_s_rate,
			 double resize_rate, int* jets_num);

double
norm_of_vb_end_to_va(CvMat* vA, CvMat* vB);

void
proj_of_vb_end_to_va(CvMat* vA, CvMat* vB, CvMat* dst);

static RecogByJetsClass recog_by_jets_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) recog_by_jets_write_frame_data,
  (AnubisDrawMarkerFunc)                 draw_cv_marker
};

/* public functions ***************************************************/

RecogByJets*
recog_by_jets_new_with_buf (MalibBuffer* buf,
			     AnubisCVHaarDetectObj* haar_filter,
			     char* jets_fname, char* masks_fname){
  /* 
   * @buf: source image buffer
   * @haar_filter: haar face detected filter (for get data)
   */
  RecogByJets* filter;
  MalibFrame * frame;
  g_return_if_fail (buf);

  
  MALIB_FILTER_GENERIC_NEW_0 (RecogByJets, &recog_by_jets_class,
			      MALIB_FRAME_COLORMODEL_RGB |
			      MALIB_FRAME_COLORMODEL_GRAY,
			      &filter);
  
  frame= anubis_create_frame_from_buf ((MalibFilter*) filter,
				      buf, MALIB_FRAME_COLORMODEL_RGB);
  malib_filter_set_buffer_with_frame(filter, buf, frame);
  
  filter->haar_filter= haar_filter;

  recog_by_jets_setup_cv_sequence(filter);

  setup_cv_image(filter);
    
  read_jet_settings_from_file(filter, jets_fname, masks_fname);

  recog_by_jets_create_param (filter);

  
  ((AnubisMarkerFilter*) filter)->user_data= filter;
  
  return filter;
}

/* needless */
int
recog_by_jets_check_eyes_locations (RecogByJets* filter){
  /* huristic check
     calc least squares solution of eyes
     and total error begger than EYES_MEAN_ERROR * EYES_LOC_NUM return 0 */

  CvMat * mA;
  CvMat * vX, * vY, * vCO, * vMEAN;

  mA    = cvCreateMat(EYES_LOC_NUM,2, CV_32F);

  vX= cvCreateMat(2, 1, CV_32F);
  vY= cvCreateMat(EYES_LOC_NUM, 1, CV_32F);

  int i;
  for(i= 0; i < EYES_LOC_NUM; i++){
    cvmSet(mA, i, 0, 1);
  }
  for(i= 0; i < EYES_LOC_NUM; i++){
    cvmSet(mA, i, 1, filter->cur_sim_jets[i]->x);
  }
  for(i= 0; i < EYES_LOC_NUM; i++){
    cvmSet(vY, i, 0, filter->cur_sim_jets[i]->y);
  }

  /* solve
     mA * vX= vY
     and solved value set to vX

     vX = |coeff of x^0|
          |coeff of x^1|
  */
  cvSolve(mA, vY, vX, CV_SVD);

#if DEBUGMODE  
  g_print("vX[0] %f, vX[1] %f\n", cvmGet(vX, 0, 0), cvmGet(vX, 1, 0)); /* debug_write */
#endif /* DEBUGMODE */
  
  /* calc error norm */
  vCO  = cvCreateMat(2,1, CV_32F);
  vMEAN= cvCreateMat(2,1, CV_32F);
  double tmp, error= 0;
  double vec_x_len= 200; /* dummy */

  cvmSet(vMEAN, 0, 0, vec_x_len);
  cvmSet(vMEAN, 1, 0, cvmGet(vX,1 ,0) * vec_x_len);
  
  for(i= 0; i < EYES_LOC_NUM; i++){
    cvmSet(vCO, 0, 0, cvmGet(mA, i, 1)); /* x coordinate */
    cvmSet(vCO, 1, 0, cvmGet(vY, i, 0) - cvmGet(vX,0,0)); /* y coordinate */
    tmp= norm_of_vb_end_to_va(vMEAN, vCO);
    error+= tmp;
  }

#ifdef DEBUGMODE
  g_print("eye error value is %f\n", error); /* debug_write */
#endif /* DEBUGMODE */

  if(error > EYES_MEAN_ERROR * EYES_LOC_NUM){
    return 0;
  }

  /* check both eye distance */
  double eyes_size_rate;

  /*eyes_size_rate= check_both_eyes_distance_rate(filter);*/
  eyes_size_rate= check_both_eyes_on_mean_vec_dist_rate(filter, vMEAN);
  
#ifdef DEBUGMODE
  g_print("eyes size rate %f\n" , eyes_size_rate);
#endif /* DEBUGMODE */
	   
  if(eyes_size_rate < EYES_SIZE_RATE_ERROR){
    return 0;
  }
  return 1;
}

/* private functions ***************************************************/

void setup_cv_image(RecogByJets* filter){
  MalibFrame* frame;
  
  frame            = malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);
  filter->cur_image= makeImage (frame->width, frame->height, 1);
  filter->cur_cv_image= anubis_create_cv_image_headder_from_malib_frame (frame);
}

void read_jet_settings_from_file (RecogByJets* filter,
				  char* jets_fname, char* masks_fname){
  char * tmp_name;
  int x_samples_num, y_samples_num;

  filter->xml_jets   = grj_xml_parse_file (jets_fname);
  filter->masks_fname= masks_fname; 

  if(filter->xml_jets){
    filter->face_graphs= grj_xml_jets_to_face_graphs (filter->xml_jets, filter->masks_fname);
    filter->parts_jets_seq= grj_xml_jets_to_jets_sequence(filter->xml_jets, filter->masks_fname, filter->storage);
  }
  
  filter->masks   = readMasksFile (masks_fname);
  filter->x_s_rate= GRJ_X_SAMPLING_LATE;
  filter->y_s_rate= GRJ_Y_SAMPLING_LATE;
  
  x_samples_num= (int) (filter->cur_image->width  / filter->x_s_rate);
  y_samples_num= (int) (filter->cur_image->height / filter->y_s_rate);

  filter->cur_jets_num= x_samples_num * y_samples_num;
  filter->cur_jets    = rbj_make_gabor_jets(filter->cur_jets_num, filter->masks);
  FacePartsArea arealen= FacePartsArea_LEN;
  filter->cur_jets_area_idx= malloc( sizeof(int) * arealen );
  
  return;
}

void
recog_by_jets_create_param (RecogByJets* filter){
  MalibFrame  * frame;

  frame            = malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);

  filter->cv_contour_image= anubis_create_cv_image_from_malib_frame (frame, 1);

  filter->cv_contour_points= malloc( sizeof(CvPoint) * RBJ_FACE_CONT_POINTS_MAX );
  filter->cv_snake_alpha = malloc( sizeof(float) * RBJ_FACE_CONT_POINTS_MAX );
  filter->cv_snake_beta  = malloc( sizeof(float) * RBJ_FACE_CONT_POINTS_MAX );
  filter->cv_snake_gamma = malloc( sizeof(float) * RBJ_FACE_CONT_POINTS_MAX );

  FaceParts face_parts_len= FaceParts_LEN;
  filter->cur_sim_jets_num= face_parts_len;
  filter->cur_sim_jets= rbj_make_gabor_jets(filter->cur_sim_jets_num, filter->masks);
  filter->cur_graph= malloc( sizeof(face_graph) );

  filter->skip= 0;

  /* now writing */
  /* set up face_parts_area_of_vert */
  FaceParts* face_parts_area_of_vert[FacePartsArea_LEN]= FACE_PARTS_AREA_OF_VERT;

  int i,j;
  for(i= 0; i < FacePartsArea_LEN; i++){
    filter->face_parts_area_of_vert[i]= face_parts_area_of_vert[i];
  }

  double tmp_coeffs[][4]= FACE_PARTS_AREA_COEFF;
  filter->face_parts_area_coeffs= malloc( sizeof(double*) * FacePartsArea_LEN );
  for(i= 0; i < FacePartsArea_LEN; i++){
    filter->face_parts_area_coeffs[i]= malloc( sizeof(double) * 4 );
    for(j= 0; j < 4; j++){
      filter->face_parts_area_coeffs[i][j]= tmp_coeffs[i][j];
    }
  }

  return;
}

void
recog_by_jets_setup_cv_sequence(RecogByJets* filter){
  
  filter->storage= cvCreateMemStorage(0);
  return;
}

void recog_by_jets_write_frame_data(RecogByJets* filter, MalibFrame* frame){

  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

#ifdef DEBUGMODE
  printf("now debug mode\n");
#ifdef PIX_TYPE_INT
  printf("now pixtype int mode\n");
#endif /* PIX_TYPE_INT */
#ifndef PIX_TYPE_INT
  printf("now pixtype double mode\n");
#endif /* PIX_TYPE_INT */
#endif /* DEBUGMODE */
  
  {

    MalibFrame  * in_frame;
    int image_size, colors;

    malib_filter_preprocess ((MalibFilter*) filter, frame);

    in_frame  = malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);
    image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);
    colors    = MALIB_FRAME_DEFAULT_NUM_COLORS(in_frame->model);
    filter->cur_cv_image->imageData= in_frame->data;

    int i;
    ANUBIS_CV_IMAGE_PIXTYPE * in= in_frame->data;
    ANUBIS_CV_IMAGE_PIXTYPE * to= frame->data;

    jet_sampling_preprocess(in_frame, filter);
    set_resized_csu_image_from_cv_frame(filter->cur_image, in_frame, filter->resize_rate);
    
    if(!filter->skip){
      rbj_jet_sampling_from_frame(in_frame, filter);
      rbj_set_sim_jets(filter);
    }

    filter->cur_graph->params= filter->cur_sim_jets[0]->params;
    filter->cur_graph->jets  = filter->cur_sim_jets;
    filter->cur_graph->geosize  = filter->cur_sim_jets_num;
    filter->cur_graph->totalsize= filter->cur_sim_jets_num;

    /* debug (check reangled eye lineup effect)*/
    for(i= 0; i < image_size; i++){
      to[i]= in[i];
    }
    g_print("\n");
  }
  return;
}

static void
draw_cv_marker(IplImage* img, RecogByJets * filter){
  if(filter->skip)
    return;
  
  int i;
  for(i= 0; i < filter->cur_sim_jets_num; i++){
    if(filter->cur_sim_jets[i] && filter->cur_sim_jets[i]->vertLabel){
      CvPoint center;
      center.x= (int) filter->cur_sim_jets[i]->x / filter->resize_rate;
      center.y= (int) filter->cur_sim_jets[i]->y / filter->resize_rate;

      g_print("%s (%d %d), ",
	      filter->cur_sim_jets[i]->vertLabel,
	      center.x, center.y);
      anubis_cv_draw_cross( img, center, CV_RGB(255,255,255), 3);
    }
  }
  return;
}


/* not use now */
void
set_contour_points_from_filter(RecogByJets* filter){
  CvPoint tmp_points[4];
  int devide_tmp_points= 10;
  double height_coeff= 1.3; /* huristic */
  
  filter->cv_contour_points_len= 0;
  /* set first contour point clockwidth */
  
  tmp_points[0].x= filter->face_rect.x;
  tmp_points[0].y= filter->face_rect.y;

  tmp_points[1].x= filter->face_rect.x + filter->face_rect.width;
  tmp_points[1].y= filter->face_rect.y;

  tmp_points[2].x= filter->face_rect.x + filter->face_rect.width;
  tmp_points[2].y= filter->face_rect.y + filter->face_rect.height * height_coeff;

  tmp_points[3].x= filter->face_rect.x;
  tmp_points[3].y= filter->face_rect.y + filter->face_rect.height * height_coeff;

  int tmp_points_len= 4;

  /* init top left and top right cornor */
  /* set 0 and, 1 point, here is not move */
  filter->cv_contour_points[0].x= tmp_points[0].x;
  filter->cv_contour_points[0].y= tmp_points[0].y;

  filter->cv_snake_alpha[0]= 0;
  filter->cv_snake_beta[0]= 0;
  filter->cv_snake_gamma[0]= 0;
  
  filter->cv_contour_points[1].x= tmp_points[1].x;
  filter->cv_contour_points[1].y= tmp_points[1].y;

  filter->cv_snake_alpha[1]= 0;
  filter->cv_snake_beta[1]= 0;
  filter->cv_snake_gamma[1]= 0;

  filter->cv_contour_points_len+= 2;
  /* init top left and top right cornor end */
  
  /* divide 1~3 points (top right -> bottom right -> bottom left -> top left)
     devide_tmp_points times */

  int i,j,k,next;
  float step_x, step_y;

  k= filter->cv_contour_points_len - 1;
  
  for(i= 1; i < tmp_points_len; i++){
    next= (i + 1) % tmp_points_len; /* because if(i + 1 == 4) next= 0 */
    step_x= (tmp_points[i].x - tmp_points[next].x) / devide_tmp_points;
    step_y= (tmp_points[i].y - tmp_points[next].y) / devide_tmp_points;

    for(j= 0; j < devide_tmp_points; j++){
      filter->cv_contour_points[k].x= (int) step_x;
      filter->cv_contour_points[k].y= (int) step_y;
      filter->cv_contour_points_len+= 1;
      k++;
    }
  }
}

void jet_sampling_preprocess (MalibFrame* in_frame, RecogByJets* filter){
  int    face_num;

  CvRect face_rect;
  int scale= filter->haar_filter->faces_scale;
  double resize_rate;

  face_num= get_biggest_width_face_num(filter->haar_filter->faces);
  filter->cur_target_face_num= face_num;
  /* return if does not exist face area */
  if(face_num < 0){
    return;
  }
  face_rect= *(CvRect*)cvGetSeqElem( filter->haar_filter->faces, face_num );

  resize_rate= FACE_ALLOCATED_WIDTH / (double)(face_rect.width * scale);
  
  if(face_rect.width * scale < FACE_ALLOCATED_WIDTH){
    resize_rate= 1.0;
  }

  /* resize to max face width to be FACE_ALLOCATED_WIDTH */
  /*set_resized_csu_image_from_frame(filter->cur_image, in_frame, resize_rate);*/
  /* for frame->data is unsigned char * case */
  set_resized_csu_image_from_cv_frame(filter->cur_image, in_frame, resize_rate);

  histEqualRect(filter->cur_image, FACE_HIST_BIN,
		face_rect.y * resize_rate, face_rect.x * resize_rate,
		(face_rect.y + face_rect.height) * resize_rate , (face_rect.x + face_rect.width) * resize_rate);

  filter->x_s_rate= GRJ_X_SAMPLING_LATE / resize_rate;
  filter->y_s_rate= GRJ_X_SAMPLING_LATE / resize_rate;

  /* debug_write */
#ifdef DEBUGMODE
  g_print("resize_rate %f\n", resize_rate);
  g_print("x_s_rate %f\n", filter->x_s_rate);
  g_print("y_s_rate %f\n", filter->y_s_rate);
#endif /* DEBUGMODE */

  filter->resize_rate= resize_rate;
  filter->face_rect  = face_rect;
  return;
}

/* not use now */
void get_face_angle_from_eye_lineup(MalibFrame* in_frame, RecogByJets* filter){
  int i,j;

  j= 0;
  if (filter->cur_target_face_num < 0){
    filter->cur_jets_num= 0;
    return;
  }

  FacePartsArea eye_areas[]= {LEFT_EYE_AREA, RIGHT_EYE_AREA, FacePartsArea_LEN};
  
  for(i= 0; eye_areas[i] != FacePartsArea_LEN; i++){
    set_guess_face_parts_jets(filter, filter->face_rect, filter->face_parts_area_coeffs[eye_areas[i]],
			      (FacePartsArea) eye_areas[i], &j);
  }

  filter->cur_jets_num= j;

  FaceParts eye_verts[]= {LEFT_EYE_L_EDGE, LEFT_EYE_R_EDGE, RIGHT_EYE_L_EDGE, RIGHT_EYE_R_EDGE, FaceParts_LEN};
  int eye_verts_num, best_cur_jets_idx, best_seq_elem;
  GaborJet * eye_jets;
  FTYPE bestsim;

  for(eye_verts_num= 0; eye_verts[eye_verts_num] != FaceParts_LEN; eye_verts_num++)
    ;

  for(i= 0; eye_verts[i] != FaceParts_LEN; i++){
    FaceParts vert= eye_verts[i];
    best_cur_jets_idx= 0; best_seq_elem= 0; bestsim= 0.01;
    rbj_set_bestsim_of_vert(vert, filter->parts_jets_seq,
			    filter->cur_jets, filter->cur_jets_num, filter->cur_jets_area_idx,
			    &bestsim, &best_cur_jets_idx, &best_seq_elem);

    GFTYPE dx, dy;
    dx= dy= 0.0;
    if(filter->parts_jets_seq[vert]->total && filter->cur_jets_num){
      GaborJet best_jet;
      /* recalculate best_jet dx,dy (first calculate in rbj_set_bestsim_of_vert() ) */
      best_jet= cvGetSeqElem(filter->parts_jets_seq[vert], best_seq_elem);
      set_nearest_jet_of_novel_and_org(filter->cur_sim_jets[vert], filter->cur_jets[best_cur_jets_idx], best_jet,
				       filter->resize_rate, filter->cur_image, filter->masks);
    }
  }

  /* get angle */
  double angle= 0;


  CvPoint* cv_points;
  cv_points= malloc(sizeof(CvPoint) * eye_verts_num);

  for(i= 0; i < eye_verts_num; i++){
    cv_points[i].x= filter->cur_sim_jets[eye_verts[i]]->x;
    cv_points[i].y= filter->cur_sim_jets[eye_verts[i]]->y;
  }
  angle= get_co_mean_vector_angle(cv_points, eye_verts_num);
#if 0
  CvPoint* cv_points;
  int angle_check_points_num= eye_verts_num - 1;

  cv_points= malloc(sizeof(CvPoint) * angle_check_points_num);

  double tmp_error;
  double error= 0.0;
  int first= 1;
  for(i= 0; i < eye_verts_num; i++){
    int k;
    for(j= 0, k= 0; j < angle_check_points_num; j++){
      if(k != i){
	cv_points[j].x= filter->cur_sim_jets[eye_verts[k]]->x;
	cv_points[j].y= filter->cur_sim_jets[eye_verts[k]]->y;
      }
      k++;
    }
    tmp_error= get_co_mean_error_from_mean_vector(cv_points, angle_check_points_num);
    if( error > tmp_error || first ){
      error= tmp_error;
      angle= get_co_mean_vector_angle(cv_points, angle_check_points_num);
      first= 0;
    }
  }
#endif /* 0 */


  /* use both eyes center */
  /*
  double x_left, y_left, x_right, y_right;
  x_left= (cv_points[0].x + cv_points[1].x) / 2.;
  y_left= (cv_points[0].y + cv_points[1].y) / 2.;
  x_right= (cv_points[2].x + cv_points[3].x) / 2.;
  y_right= (cv_points[2].y + cv_points[3].y) / 2.;
  
  angle= (y_right - y_left) / (x_right - x_left);
  */

  IplImage * org_cv_image= cvCloneImage(filter->cur_cv_image);
  
  CvPoint face_center;
  face_center.x= (filter->face_rect.x + (filter->face_rect.width / 2)) ;
  face_center.y= (filter->face_rect.y + (filter->face_rect.height / 2));
    
  anubis_cv_set_rotate_image_with_center(filter->cur_cv_image, org_cv_image,
					atan(angle), face_center);

  filter->rotate_angle= angle;
  filter->rotate_center.x= face_center.x;
  filter->rotate_center.y= face_center.y;

  cvReleaseImage(&org_cv_image);
  free(cv_points);
  
  return;
}

void rbj_jet_sampling_from_frame(MalibFrame* in_frame, RecogByJets* filter){
				      
  /*
    jets sampling from image
   */
  int    i,j;
  
  j= 0; /* jets num */
  if(filter->cur_target_face_num < 0) {
    filter->cur_jets_num= 0;
    return;
  }

  /* huristic */
  /***************************************************
    face_parts_coeff uses as forrow
    
    parts_rect.x= face_rect.x + (face_rect.width  * coeff[0]);
    parts_rect.y= face_rect.y + (face_rect.height * coeff[1]);
    parts_rect.width = face_rect.width  * coeff[2];
    parts_rect.height= face_rect.height * coeff[3];
  ***************************************************/

  for(i= 0; i < FacePartsArea_LEN; i++){
    set_guess_face_parts_jets(filter, filter->face_rect, filter->face_parts_area_coeffs[i], (FacePartsArea) i, &j);
  }

  filter->cur_jets_num= j;
  return;
}

GaborJet* rbj_make_gabor_jets(int num, JetMasks masks){
  /*
    make gabor jets
    @num: number of making jet num
    @masks: masks of jet
   */
  GaborJet * jets;
  jets= malloc(sizeof(GaborJet*) * num);
  int i;
  for(i= 0; i < num; i++){
    if( masks->size ){
      jets[i]= makeGaborJet(masks->size/2);
    }
    else{
      jets[i]= makeGaborJet(0);
    }
    jets[i]->params= masks->params;
  }
  return jets;
}


void
rbj_set_sim_jets(RecogByJets* filter){
  /*
    set most similality of each parts jet to set in filter->cur_sim_jets[vert]
   */
  int i, vert, best_cur_jets_idx, best_seq_elem;

  GFTYPE dx, dy;
  GaborJet best_jet;
  FTYPE bestsim;
  JetDisplacementEstimator dispEst;
  dispEst= GRJ_DISPLACE_EST; /* sim func */

  for(i= 0; i < filter->cur_sim_jets_num; i++){
    filter->cur_sim_jets[i]->vertLabel= NULL;
  }

  FaceParts face_parts_len= FaceParts_LEN;

  /* each vert of best similarity jets set to filter->cur_sim_jets */
  for(vert= 0; vert < face_parts_len; vert++){

    /* 1st calclate and get best similarity value and
       those index of novel sampled jets and orginal sampled data jets*/
    best_cur_jets_idx= 0; best_seq_elem= 0; bestsim= 0.01;
    rbj_set_bestsim_of_vert(vert, filter->parts_jets_seq,
			    filter->cur_jets, filter->cur_jets_num, filter->cur_jets_area_idx,
			    &bestsim, &best_cur_jets_idx, &best_seq_elem);

    dx= dy= 0.0;
    if(filter->parts_jets_seq[vert]->total && filter->cur_jets_num){
      /* 2nd recalculate best_jet dx,dy and set to cur_sim_jets */
      best_jet= cvGetSeqElem(filter->parts_jets_seq[vert], best_seq_elem);
      set_nearest_jet_of_novel_and_org(filter->cur_sim_jets[vert], filter->cur_jets[best_cur_jets_idx], best_jet,
				       filter->resize_rate, filter->cur_image, filter->masks);
    }

  }
  return;
}

void rbj_set_bestsim_of_vert(FaceParts vert, CvSeq** parts_jets_seq,
			     GaborJet* cur_jets, int cur_jets_num, int* cur_jets_area_idx,
			     FTYPE* bestsim, int* best_cur_jets_idx, int* best_seq_elem){
  /*
    set best sim value of vert to : bestsim, best_cur_jets_idx, best_seq_elem

    @vert: target vert
    
  */
  
  int i,j;
  GFTYPE dx, dy;
  FTYPE sim= 0.0;
  GaborJet sample_jet;
  JetDisplacementEstimator dispEst;
  dispEst= GRJ_DISPLACE_EST; /* sim func */

  
  for(i= 0; i < parts_jets_seq[vert]->total; i++){
    sample_jet= cvGetSeqElem(parts_jets_seq[vert], i);
    for(j= 0; j < cur_jets_num; j++){
      sim= 0.0;
      // if vert is not much for cur_jets[j] skip 
      if((((vert == LEFT_EYE_L_EDGE)  || (vert == LEFT_EYE_R_EDGE) ||
	   (vert == L_EYEBROW_L_EDGE) || (vert == L_EYEBROW_R_EDGE))
	  && is_area(j, LEFT_EYE_AREA, cur_jets_area_idx))  ||
	 (((vert == RIGHT_EYE_L_EDGE) || (vert == RIGHT_EYE_R_EDGE) ||
	   (vert == R_EYEBROW_L_EDGE) || (vert == R_EYEBROW_R_EDGE))
	  && is_area(j, RIGHT_EYE_AREA, cur_jets_area_idx)) ||
	 (((vert == NOSE_L_EDGE)      || (vert == NOSE_R_EDGE))
	  && is_area(j, NOSE_AREA, cur_jets_area_idx))      ||
	 (((vert == MOUSE_L_EDGE)     || (vert == MOUSE_R_EDGE))
	  && is_area(j, MOUSE_AREA, cur_jets_area_idx))){
	dx= dy= 0.0;
	sim= dispEst(sample_jet, cur_jets[j], &dx, &dy);
      }
      
      if(sim > *bestsim){
	*bestsim          = sim;
	*best_cur_jets_idx= j;
	*best_seq_elem    = i;
      }
    }
  }
  return;
}

			 
int
is_area(int k, FacePartsArea area, int* cur_jets_area_idx){
  /*
    if k is same FacePartsArea as area return 1, otherwise 0
   */
  if(area == 0){
    return(k < cur_jets_area_idx[area]);
  } else {
    return (k < cur_jets_area_idx[area] && k >= cur_jets_area_idx[area - 1]);
  }
}


void set_nearest_jet_of_novel_and_org(GaborJet dst_jet, GaborJet novel_jet, GaborJet org_jet,
				     double resize_rate, Image img, JetMasks masks){
  /*
    @dst_jet  : destination jet
    @novel_jet: novel current sampled jet
    @org_jet  : sampled data jet
    
   */
  double dx, dy;
  dx= 0.0; dy= 0.0;

  JetDisplacementEstimator dispEst;
  dispEst= GRJ_DISPLACE_EST; /* sim func */

  dispEst(org_jet, novel_jet, &dx, &dy);
  
  GFTYPE x, y;
  x= novel_jet->x * resize_rate + dx;
  y= novel_jet->y * resize_rate + dy;

  /* not recorrect */
  /*memcpy(filter->cur_sim_jets[vert], filter->cur_jets[best_cur_jets_idx],sizeof(gabor_jet));*/

  /* recorrect */
  setExtractJet(dst_jet, x, y, img, masks);
  
  dst_jet->length   = novel_jet->length;
  dst_jet->vertLabel= org_jet->vertLabel;

  return;
}
 
int
face_parts_area_start_idx(FacePartsArea area, int* cur_jets_area_idx){
  if(area == 0){
    return 0;
  } else {
    return cur_jets_area_idx[area - 1];
  }
}

int
is_face_parts_area_of_vert(FaceParts vert, FacePartsArea area, FaceParts** face_parts_area_of_vert){
  int i;
  for(i= 0; FaceParts_LEN != face_parts_area_of_vert[area][i]; i++){
    if(vert == face_parts_area_of_vert[area][i])
      return 1;
  }
  return 0;
}


void
set_guess_face_parts_jets(RecogByJets* filter, CvRect face_rect, double parts_rect_coeff[],
			  FacePartsArea area, int *jet_num){
  /**
  parts_rect_coeff uses as forrow
  and parts_rect is jets sampling area
  
  parts_rect.x= face_rect.x + (face_rect.width  * coeff[0]);
  parts_rect.y= face_rect.y + (face_rect.height * coeff[1]);
  parts_rect.width = face_rect.width  * coeff[2];
  parts_rect.height= face_rect.height * coeff[3];
  */

  CvRect parts_rect;

  parts_rect.x= face_rect.x + (face_rect.width  * parts_rect_coeff[0]);
  parts_rect.y= face_rect.y + (face_rect.height * parts_rect_coeff[1]);
  parts_rect.width = face_rect.width  * parts_rect_coeff[2];
  parts_rect.height= face_rect.height * parts_rect_coeff[3];

  set_extract_jets_region_with_area (filter, parts_rect, jet_num, area);
  return;
}


void
set_extract_jets_region_with_area(RecogByJets* filter, CvRect area_rect, int* jets_num, FacePartsArea area){
  /*
  set_extract_jets_region (filter->cur_jets, filter->masks, area_rect, filter->cur_image,
			   filter->x_s_rate / filter->resize_rate, filter->y_s_rate / filter->resize_rate, filter->resize_rate, jets_num);
  */
  set_extract_jets_region (filter->cur_jets, filter->masks, area_rect, filter->cur_image,
			   filter->x_s_rate, filter->y_s_rate, filter->resize_rate, jets_num);

  filter->cur_jets_area_idx[area]= *jets_num;
  
}

void
set_extract_jets_region (GaborJet* jets, JetMasks masks,CvRect region_rect,
			 Image csu_image, double x_s_rate, double y_s_rate,
			 double resize_rate, int* jets_num){
  /* extract jets in region_rect */
  int x,y;

  /* region rect is based on a original image size so it's comlex way to do, but it is silly */
  
  for (x= region_rect.x; x < region_rect.x + region_rect.width; x+= x_s_rate){
    for (y= region_rect.y; y < region_rect.y + region_rect.height; y+= y_s_rate){
      setExtractJet(jets[*jets_num], x * resize_rate, y * resize_rate
		    , csu_image, masks);
      jets[*jets_num]->x= x;
      jets[*jets_num]->y= y;
      (*jets_num)+= 1;
    }
  }
  return;
}

double
get_co_mean_error_from_mean_vector (CvPoint* points, int points_num){
  /**
    calc least squares solution of coordinates and return mean error

    @points:     coordinates
    @points_num: coordinates numbers
  */
  
  CvMat * mA;
  CvMat * vX, * vY, * vCO, * vMEAN;
  
  mA= cvCreateMat(EYES_LOC_NUM,2, CV_32F);
  vX= cvCreateMat(2, 1, CV_32F);
  vY= cvCreateMat(EYES_LOC_NUM, 1, CV_32F);

  int i;

  for(i= 0; i < points_num; i++){
    cvmSet(mA, i, 0, 1);
    cvmSet(mA, i, 1, points[i].x);
    cvmSet(vY, i, 0, points[i].y);
  }
  /* solve
     mA * vX= vY
     and solved value set to vX

     vX = |coeff of x^0|
          |coeff of x^1|
  */

  cvSolve(mA, vY, vX, CV_SVD);

  /* calc error norm */
  vCO  = cvCreateMat(2,1, CV_32F);
  vMEAN= cvCreateMat(2,1, CV_32F);
  double tmp, error= 0;
  double vec_x_len= 200; /* dummy */

  cvmSet(vMEAN, 0, 0, vec_x_len);
  cvmSet(vMEAN, 1, 0, cvmGet(vX,1 ,0) * vec_x_len);
  
  for(i= 0; i < points_num; i++){
    cvmSet(vCO, 0, 0, cvmGet(mA, i, 1)); /* x coordinate */
    cvmSet(vCO, 1, 0, cvmGet(vY, i, 0) - cvmGet(vX,0,0)); /* y coordinate */
    tmp= norm_of_vb_end_to_va(vMEAN, vCO);
    error+= tmp;
  }

  cvReleaseMat(&mA);
  cvReleaseMat(&vX);
  cvReleaseMat(&vY);
  cvReleaseMat(&vCO);
  cvReleaseMat(&vMEAN);

  return error;
}

double
get_co_mean_vector_angle (CvPoint* points, int points_num){
  /**
    calc least squares solution of coordinates and return mean vector angle.

    @points:     coordinates
    @points_num: coordinates numbers
  */
  
  CvMat * mA;
  CvMat * vX, * vY;
  
  mA= cvCreateMat(EYES_LOC_NUM,2, CV_32F);
  vX= cvCreateMat(2, 1, CV_32F);
  vY= cvCreateMat(EYES_LOC_NUM, 1, CV_32F);

  int i;

  for(i= 0; i < points_num; i++){
    cvmSet(mA, i, 0, 1);
    cvmSet(mA, i, 1, points[i].x);
    cvmSet(vY, i, 0, points[i].y);
  }
  /* solve
     mA * vX= vY
     and solved value set to vX

     vX = |coeff of x^0|
          |coeff of x^1|
  */

  cvSolve(mA, vY, vX, CV_SVD);

  double angle= cvmGet(vX, 1, 0);
  
  cvReleaseMat(&mA);
  cvReleaseMat(&vX);
  cvReleaseMat(&vY);

  return angle;
}


				   

double
check_both_eyes_distance_rate(RecogByJets* filter){
  double norm[2], max, min;
  CvMat * vCO1, * vCO2;
  int i;
  FaceParts  eyes_idx[4]= {LEFT_EYE_L_EDGE, LEFT_EYE_R_EDGE, RIGHT_EYE_L_EDGE, RIGHT_EYE_R_EDGE};

  
  vCO1= cvCreateMat(2, 1, CV_32F);
  vCO2= cvCreateMat(2, 1, CV_32F);
  for(i= 0; i < 2; i++){
    cvmSet(vCO1, 0, 0, filter->cur_sim_jets[eyes_idx[i*2]]->x);
    cvmSet(vCO1, 1, 0, filter->cur_sim_jets[eyes_idx[i*2]]->y);

    cvmSet(vCO2, 0, 0, filter->cur_sim_jets[eyes_idx[i*2+1]]->x);
    cvmSet(vCO2, 1, 0, filter->cur_sim_jets[eyes_idx[i*2+1]]->y);

    norm[i]= cvNorm(vCO1, vCO2, CV_L2, NULL);
  }
  max= MAX(norm[0], norm[1]);
  min= MIN(norm[0], norm[1]);

  return (min / max);
}

double
check_both_eyes_on_mean_vec_dist_rate(RecogByJets* filter, CvMat * vMEAN){
  double norm[2], max, min, rate;
  CvMat * vCO1, * vCO2, * vpCO1, * vpCO2;
  FaceParts  eyes_idx[4]= {LEFT_EYE_L_EDGE, LEFT_EYE_R_EDGE, RIGHT_EYE_L_EDGE, RIGHT_EYE_R_EDGE};
  int i;
  
  vCO1= cvCreateMat(2, 1, CV_32F);
  vCO2= cvCreateMat(2, 1, CV_32F);
  vpCO1= cvCreateMat(2, 1, CV_32F);
  vpCO2= cvCreateMat(2, 1, CV_32F);

  for(i= 0; i < 2; i++){
    cvmSet(vCO1, 0, 0, filter->cur_sim_jets[eyes_idx[i*2]]->x);
    cvmSet(vCO1, 1, 0, filter->cur_sim_jets[eyes_idx[i*2]]->y - cvmGet(vMEAN,0,0));

    proj_of_vb_end_to_va(vMEAN, vCO1, vpCO1);
    
    cvmSet(vCO2, 0, 0, filter->cur_sim_jets[eyes_idx[i*2+1]]->x);
    cvmSet(vCO2, 1, 0, filter->cur_sim_jets[eyes_idx[i*2+1]]->y - cvmGet(vMEAN,0,0));

    proj_of_vb_end_to_va(vMEAN, vCO2, vpCO2);

    norm[i]= cvNorm(vpCO1, vpCO2, CV_L2, NULL);
  }

  cvReleaseMat(&vCO1);
  cvReleaseMat(&vCO2);
  cvReleaseMat(&vpCO1);
  cvReleaseMat(&vpCO2);

  max= MAX(norm[0], norm[1]);
  min= MIN(norm[0], norm[1]);

  rate= min / max ;
  return rate;
}

double
norm_of_vb_end_to_va(CvMat* vA, CvMat* vB){
  /*
    calc norm of vector vB end to vector vA projected point
   */
  long double AA, AB, BB;
  double norm;

  int round= BTTV_DEFAULT_WIDTH / 2; /* Fixme: huristic way to avoid overflow */

  AA= cvDotProduct(vA, vA) / round;
  AB= cvDotProduct(vA, vB) / round;
  BB= cvDotProduct(vB, vB) / round;
  
  norm= (BB*AA - pow(AB, 2)) * round / AA ;
  
  norm= sqrt(abs(norm));
  
  return norm;
}

void
proj_of_vb_end_to_va(CvMat* vA, CvMat* vB, CvMat* dst){
  /*
    set projection point of vA that projected from vector vB end to vA
   */

  
  long int AA,AB;
  int round= BTTV_DEFAULT_WIDTH / 2; /* Fixme: huristic way to avoid overflow */

  AA= cvDotProduct(vA, vA) / round;
  AB= cvDotProduct(vA, vB) / round;

  cvConvertScale(vA, dst, AB/(double)AA, 0);
  return;
}
