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
#include "anubis_haar_data_sampling.h"

#define STARTING_PROCESS_TIME 1    /* for start up time doesn't change to tracking mode */

void anubis_haar_data_sampling_write_frame_data (AnubisHaarDataSampling* filter, MalibFrame* frame);

void
set_up_params (AnubisHaarDataSampling* filter, MalibFrame* frame);

void
face_graph_verts_add_to_track_points(AnubisCVTrack* filter, AnubisFaceGraphWithImgData face_graph);

void switch_to_tracking(AnubisHaarDataSampling* filter, AnubisFaceGraphWithImgData face_graph);

void
anubis_face_graph_seq_with_img_slice_deep_remove(CvSeq* face_graph_seq, CvSlice slice);
void
anubis_face_graph_seq_with_img_deep_remove(CvSeq* face_graph_seq);



static AnubisHaarDataSamplingClass anubis_haar_data_sampling_class=
{
  (void (*) (MalibObject*)) malib_filter_delete,
  (void (*) (MalibSource*, MalibFrame)) anubis_haar_data_sampling_write_frame_data
};

enum _SamplingMode { BY_RBJ, BY_TRACK };
typedef enum _SamplingMode SamplingMode;

/* public functions **************************************************/

AnubisHaarDataSampling*
anubis_haar_data_sampling_new_with_bufs (MalibBuffer* rbj_buf, MalibBuffer* track_buf,
					AnubisFaceGraphMeasure* rbj_fg_filter,
					AnubisFaceGraphMeasure* track_fg_filter,
					AnubisCVHaarDetectObj * haar_filter,
					RecogByJets * rbj_filter,
					AnubisCVTrack* track_filter,
					char* xml_fname){
  AnubisHaarDataSampling* filter;
  MalibBuffer* buffers[3];
  MalibFrame * prev_frame;

  MALIB_FILTER_GENERIC_NEW_0 ( AnubisHaarDataSampling, &anubis_haar_data_sampling_class,
			       MALIB_FRAME_COLORMODEL_RGB |
			       MALIB_FRAME_COLORMODEL_GRAY |
			       MALIB_FRAME_COLORMODEL_BW,
			       &filter);

  malib_merger_alloc_bufinfo_table((MalibMerger*)filter, 1);
  malib_merger_set_acceptable((MalibMerger*)filter, 0,
			      MALIB_FRAME_COLORMODEL_RGB |
			      MALIB_FRAME_COLORMODEL_GRAY);
			      
  buffers[0]= rbj_buf;
  buffers[1]= track_buf;
  buffers[2]= NULL;

  malib_merger_set_buffers(filter, buffers);

  filter->detect= &rbj_fg_filter->detect;
  filter->sampling_mode= BY_RBJ;

  filter->rbj_fg_filter  = rbj_fg_filter;
  filter->track_fg_filter= track_fg_filter;
  filter->rbj_filter     = rbj_filter;
  filter->track_filter   = track_filter;
  filter->haar_filter    = haar_filter;

  prev_frame= malib_buffer_get_current_frame(rbj_buf); //for save current image
  set_up_params(filter, prev_frame);

  return filter;
}

int
anubis_haar_data_sampling_save_xml_file_and_images(AnubisHaarDataSampling* filter, char* xml_fname,
						  char* dir_name, char* im_fname){

  if( ! anubis_haar_data_sampling_fg_seq_with_im_save_to_xml_file(filter->face_graph_seq, NULL,
								 xml_fname, im_fname, dir_name) )
    return 0;

  //anubis_face_graph_seq_with_img_slice_deep_remove(face_graph_seq, );
  anubis_face_graph_seq_with_img_deep_remove(filter->face_graph_seq);
  cvClearMemStorage(filter->storage);
  return 1;
}


void
anubis_haar_data_sampling_clear_correct_frames(GtkWidget* widget, AnubisHaarDataSampling* filter){
  CvSlice slice;
  slice.start_index= filter->last_frame_start_position;
  slice.end_index  = filter->last_frame_start_position + filter->image_counter;

  anubis_face_graph_seq_with_img_slice_deep_remove(filter->face_graph_seq, slice);
  
  filter->image_counter= 0;
}

void
anubis_face_graph_seq_with_img_slice_deep_remove(CvSeq* face_graph_seq, CvSlice slice){
  int i, j;

  /* If remove seqElem, it poped. So comming elem[j+1] as elem[j] in next time*/
  for(i= j= slice.start_index; i < slice.end_index; i++){
    anubis_face_graph_with_img_data* fg_with_im;
    fg_with_im= cvGetSeqElem(face_graph_seq, j);
    freeFaceGraphElemWithDeAlloc((FaceGraph) fg_with_im);
    if(fg_with_im->cv_image)
      cvReleaseImage(&fg_with_im->cv_image);
    cvSeqRemove(face_graph_seq, j);
  }
}


void
anubis_face_graph_seq_with_img_deep_remove(CvSeq* face_graph_seq){
  CvSlice slice;
  slice.start_index= 0;
  slice.end_index  = face_graph_seq->total;
  
  anubis_face_graph_seq_with_img_slice_deep_remove (face_graph_seq, slice);
  
}

void
anubis_haar_data_sampling_enter_correct_frames(GtkWidget* widget,AnubisHaarDataSampling* filter){

  filter->last_frame_start_position= filter->last_frame_start_position + filter->image_counter;
  filter->image_counter= 0;
}

int
anubis_haar_data_sampling_fg_seq_with_im_save_to_xml_file(CvSeq* face_graph_seq,
							 char* masks_fname, char* xml_fname,
							 char* im_fname, char* dir_name){
  char* num_char;
  char num_char2[GRM_MAX_XML_INT_CHAR_SIZE];
  int im_count_start_num;

  /* set up xmlname with dir */
  // +2 for '/' and last '\0'
  char xml_full_fname[strlen(dir_name) + strlen(xml_fname) + 2];
  xml_full_fname[0]= '\0';
  if(dir_name[0]){
    strcat(xml_full_fname, dir_name);
    strcat(xml_full_fname, "/");
  }
  strcat(xml_full_fname,    xml_fname);

  /* file can open or not */
  // now writing
  FILE * dummy_f;
  dummy_f= fopen(xml_full_fname, "a");
  if(dummy_f){
    fclose(dummy_f);
  } else {
    g_print("error! can't open file %s\n", xml_full_fname);
    return 0;
  }

  /* init or set xmlDocPtr */
  xmlDocPtr doc= NULL;
  xmlNodePtr node_templates, node_template;
  doc= xmlParseFile(xml_full_fname);

  node_templates= grm_get_xml_child_templats_from_doc(&doc);

  /* set start position */
  if(num_char= xmlGetProp(node_templates, GABORRG_XML_ATTR_IM_FILE_END_NUM)){
    /* last num + 1*/
    im_count_start_num= atoi(num_char) + 1;
  } else {
    /* for first time */
    im_count_start_num= 0;
    sprintf(num_char2, "%d", im_count_start_num);
    xmlSetProp(node_templates, GABORRG_XML_ATTR_IM_FILE_START_NUM, num_char2);
  }

  /* set end position */
  int tot;
  tot= face_graph_seq->total;

  sprintf(num_char2, GABORRG_XML_ATTR_IM_FILE_NUM_FORMAT, im_count_start_num + tot);
  xmlSetProp(node_templates, GABORRG_XML_ATTR_IM_FILE_END_NUM, num_char2);
  
  /* traverce xml and save images */
  int i,j,num;
  FaceGraph face_graph;
  AnubisFaceGraphWithImgData face_graph_with_img;
  char fname[strlen(im_fname) + GRM_MAX_XML_INT_CHAR_SIZE + 5];
  char fname_with_dir[strlen(dir_name) + strlen(im_fname) + GRM_MAX_XML_INT_CHAR_SIZE + 6];

  for(i= 0, num= im_count_start_num; i < tot; i++, num++){
    face_graph_with_img= cvGetSeqElem(face_graph_seq, i);
    face_graph= (FaceGraph) face_graph_with_img;
    node_template= xmlNewChild(node_templates, NULL, GABORRG_XML_TAG_TEMPLATE, NULL);
    
    xmlSetProp(node_template, GABORRG_XML_ATTR_MASKS_FNAME,    masks_fname);
    xmlSetProp(node_template, GABORRG_XML_ATTR_FACE_NAME,      face_graph->faceLabel);

    /* save face rect */
    if(face_graph_with_img->face_rect_exist){
      char face_rect_char[GRM_MAX_XML_INT_CHAR_SIZE + 5];/* +5 for 4 space and last '\0'*/
      sprintf(face_rect_char, "%d %d %d %d"
	      ,face_graph_with_img->face_rect.x, face_graph_with_img->face_rect.y
	      ,face_graph_with_img->face_rect.width, face_graph_with_img->face_rect.height);
      xmlSetProp(node_template, GABORRG_XML_ATTR_FACE_RECT, face_rect_char);
    }

    /* set prop image000XXX.jpg */ 
    sprintf(num_char2, GABORRG_XML_ATTR_IM_FILE_NUM_FORMAT, num);
    fname[0]= '\0';
    strcat(fname, im_fname);
    strcat(fname, num_char2);
    strcat(fname, ANUBIS_JPG_IMAGE_EXTENTION);
    xmlSetProp(node_template, GABORRG_XML_ATTR_FG_IMAGE_FNAME, fname);

    /* save image file /dirname/image000XXX.jpg */
    fname_with_dir[0]= '\0';
    if(dir_name[0]){
      strcat(fname_with_dir, dir_name);
      strcat(fname_with_dir, "/");
    }
    strcat(fname_with_dir, fname);
    g_print("output image file %s\n", fname_with_dir);
    cvSaveImage(fname_with_dir, face_graph_with_img->cv_image);

    /* set face_graph each parts data */
    for(j= 0; j < face_graph->totalsize; j++){
      if(face_graph->jets[j]){
	grm_set_xml_child_cells_from_jet(node_template, face_graph->jets[j]);
      }
    }
  }
  xmlSaveFile(xml_full_fname, doc);
  xmlFreeDoc(doc);

  return 1;
}


/* private functions **************************************************/

void
set_up_params (AnubisHaarDataSampling* filter, MalibFrame* frame){
  filter->cur_cv_image= anubis_create_cv_image_headder_from_malib_frame (frame);

  filter->storage       = cvCreateMemStorage(0);
  filter->face_graph_seq= cvCreateSeq(0, sizeof(CvSeq), sizeof(anubis_face_graph_with_img_data), filter->storage);
  filter->face_im_seq   = cvCreateSeq(0, sizeof(CvSeq), sizeof(IplImage), filter->storage);
  filter->image_counter = 0; /* save image number */
  filter->track_filter->skip  = 1;
  filter->starting_frame_count= 0;
  filter->last_frame_start_position= filter->image_counter;
  filter->save_frames = 0;
  filter->clear_frames= 0;
  return;
}

void
anubis_haar_data_sampling_write_frame_data (AnubisHaarDataSampling* filter, MalibFrame* frame){
  MalibFrame * prev_frame, * prev_track_frame;
    
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_merger_preprocess(filter, frame);
  
  prev_frame      = malib_buffer_get_current_frame (((MalibFilter*)filter)->buf);
  prev_track_frame= malib_buffer_get_current_frame(((MalibMerger*)filter)->bufinfo_tbl->buf);

  filter->cur_cv_image->imageData= prev_frame->data;

  FaceParts face_parts_len= FaceParts_LEN;
  AnubisFaceGraphWithImgData face_graph= makeAnubisFaceGraphWithImgData(face_parts_len, face_parts_len);
  FaceGraph tmp_face_graph;
  ((FaceGraph)face_graph)->faceLabel= NULL;

  GaborJet * jets;
  int jets_num= 0;
  GaborJet cur_jet, tmp_jet;
  int i;

  if(*filter->detect && (!filter->track_filter->lost_points_num)){
    if(filter->sampling_mode == BY_RBJ){
      face_graph_deepcopy(face_graph, filter->rbj_fg_filter->novel_face_graph);
      if(filter->starting_frame_count > STARTING_PROCESS_TIME){
	/* add track point and change mode for tracking */
	switch_to_tracking(filter, face_graph);
      }
    } else if (filter->sampling_mode == BY_TRACK){
      face_graph_deepcopy(face_graph, filter->track_fg_filter->novel_face_graph);
      IplImage* tmp_image;
      tmp_image= cvCloneImage(filter->cur_cv_image);

      face_graph->cv_image= tmp_image;
      if(filter->haar_filter->faces->total){
	CvRect face_rect= *(CvRect*)cvGetSeqElem( filter->haar_filter->faces, 0);
	face_graph->face_rect_exist= 1;
	face_graph->face_rect= face_rect;
      }else{
	face_graph->face_rect_exist= 0;
      }
      
      cvSeqPush(filter->face_graph_seq, face_graph);
      filter->image_counter++;
    }
  } else {
    /* can't detect */
    anubis_cv_track_clear_all_points(filter->track_filter);
    filter->sampling_mode= BY_RBJ;
    filter->track_filter->skip= 1;
    filter->rbj_filter->skip  = 0;
    filter->haar_filter->skip = 0;
    
    filter->detect= &filter->rbj_fg_filter->detect;
  }
  filter->starting_frame_count++;
  frame->data= prev_frame->data;
}

void
switch_to_tracking(AnubisHaarDataSampling* filter, AnubisFaceGraphWithImgData face_graph){
  /* switch mode to traking vertex */
  face_graph->resize_rate= filter->rbj_filter->resize_rate;
  g_print("resize_rate %f", face_graph->resize_rate);
  face_graph_verts_add_to_track_points(filter->track_filter, face_graph);
  filter->sampling_mode= BY_TRACK;
  filter->track_filter->resize_rate= filter->rbj_filter->resize_rate;
  
  filter->track_filter->skip= 0;
  filter->rbj_filter->skip  = 1;
  filter->haar_filter->skip = 0;
  
  filter->detect= &filter->track_fg_filter->detect;
  return;
}

void
face_graph_verts_add_to_track_points(AnubisCVTrack* filter, AnubisFaceGraphWithImgData face_graph){
  int i;

  for(i= 0; i < ((FaceGraph)face_graph)->totalsize; i++){
    CvPoint pt;

    pt.x= ((FaceGraph)face_graph)->jets[i]->x / face_graph->resize_rate;
    pt.y= ((FaceGraph)face_graph)->jets[i]->y / face_graph->resize_rate;

    anubis_cv_track_add_point_with_vert_name(filter, pt, ((FaceGraph)face_graph)->jets[i]->vertLabel, 1);
  }
  CvPoint2D32f *swap_points;
  IplImage *swap_temp;
  CV_SWAP( filter->pyramid1,  filter->pyramid0,  swap_temp );
  CV_SWAP( filter->points[1], filter->points[0], swap_points );

  return;
}

