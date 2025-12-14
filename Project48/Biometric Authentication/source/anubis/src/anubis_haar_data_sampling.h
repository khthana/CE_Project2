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
#ifndef __ANUBIS_HAAR_DATA_SAMPLING_H__
#define __ANUBIS_HAAR_DATA_SAMPLING_H__

#include <malib/malib.h>
#include "anubis_common.h"
#include <libxml2/libxml/parser.h>
#include <libxml2/libxml/tree.h>
#include "recog_by_jets.h"
#include "anubis_cv_track.h"
#include "anubis_face_graph_measure.h"

BEGIN_C_DECLS

typedef struct _AnubisHaarDataSamplingClass{
  MalibMergerClass super;
} AnubisHaarDataSamplingClass;

typedef struct _AnubisHaarDataSampling{
  MalibMerger super;

  AnubisVert* verts;
  int* verts_num;
  int* detect;

  int sampling_mode;
  int starting_frame_count; /* for starting time */

  int save_frames;  /* flag */
  int clear_frames; /* flag */

  char* xml_fname;
  int image_counter;
  int last_frame_start_position;
  IplImage * cur_cv_image;

  CvMemStorage * storage;
  CvSeq * face_graph_seq;
  CvSeq * face_im_seq;

  RecogByJets * rbj_filter;
  AnubisCVTrack* track_filter;
  AnubisFaceGraphMeasure* rbj_fg_filter;
  AnubisFaceGraphMeasure* track_fg_filter;
  AnubisCVHaarDetectObj * haar_filter;
  
} AnubisHaarDataSampling;

AnubisHaarDataSampling*
anubis_haar_data_sampling_new_with_bufs (MalibBuffer* rbj_buf, MalibBuffer* track_buf,
					AnubisFaceGraphMeasure* rbj_fg_filter,
					AnubisFaceGraphMeasure* track_fg_filter,
					AnubisCVHaarDetectObj * haar_filter,
					RecogByJets * rbj_filter,
					AnubisCVTrack* track_filter,
					char* xml_fname);
int
anubis_haar_data_sampling_save_xml_file_and_images(AnubisHaarDataSampling* filter, char* xml_fname, char* dir_name, char* im_fname);

void
anubis_haar_data_sampling_clear_correct_frames(GtkWidget* widget, AnubisHaarDataSampling* filter);

void
anubis_haar_data_sampling_enter_correct_frames(GtkWidget* widget, AnubisHaarDataSampling* filter);

/*
void
anubis_haar_data_sampling_fg_seq_with_im_save_to_xml_file(CvSeq* face_graph_seq,
							 char* masks_fname, char* xml_fname,
							 char* im_fname, int* im_count_start_num);
*/
int
anubis_haar_data_sampling_fg_seq_with_im_save_to_xml_file(CvSeq* face_graph_seq,
							 char* masks_fname, char* xml_fname,
							 char* im_fname, char* dir_name);

END_C_DECLS
#endif /* __ANUBIS_HAAR_DATA_SAMPLING_H__ */
