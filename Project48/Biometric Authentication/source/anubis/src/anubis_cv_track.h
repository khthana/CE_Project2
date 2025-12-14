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
#ifndef __ANUBIS_CV_TRACK_H__
#define __ANUBIS_CV_TRACK_H__

#include <malib/malib.h>
#include <opencv/cv.h>
#include "anubis_common.h"
#include "anubis_marker_filter.h"

BEGIN_C_DECLS

#define ANUBIS_CV_TRACK_WIN_SIZE 10
#define ANUBIS_CV_TRACK_POINTS_NUM_MAX 500

#define ANUBIS_CV_MIN_RING_BUF_SIZE 2

typedef struct _AnubisCVTrackClass{
  AnubisMarkerFilterClass super;
} AnubisCVTrackClass;

typedef struct _AnubisCVTrack{
  AnubisMarkerFilter super;

  int skip;
  int init_counter;

  IplImage * cv_img0; /* current */
  IplImage * cv_img1; /* current - 1 */
  IplImage * pyramid0; /* current */
  IplImage * pyramid1; /* current - 1 */

  CvPoint2D32f * points[2]; /* current : points[0], preview : points[1]*/
  char         **points_vertLabel;
  CvPoint2D32f * swap_points;

  FaceGraph face_graph;

  int win_size;
  int flags;
  int track_points_num;
  int lost_points_num; /* lost to track point number */
  int face_parts_len;
  int auto_setup;

  double resize_rate;
  
  char* status;
} AnubisCVTrack;

AnubisCVTrack*
anubis_cv_track_new_with_buf(MalibBuffer* buf);
void anubis_cv_track_params_setup(AnubisCVTrack* filter, MalibBuffer* buf);
void anubis_cv_track_add_point(AnubisCVTrack* filter, CvPoint pt, int find_corner);
void anubis_cv_track_add_point_with_vert_name(AnubisCVTrack* filter, CvPoint pt, char* vertLabel, int find_corner);
void anubis_cv_track_clear_all_points(AnubisCVTrack* filter);
void anubis_cv_track_feature_track(AnubisCVTrack* filter);
void track_points_to_face_graph(CvPoint2D32f* points, int track_points_num, char* status,
				FaceGraph face_graph, char** points_vertLabel);

END_C_DECLS

#endif /* __ANUBIS_CV_TRACK_H__ */
