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
#ifndef __ANUBIS_COMMON_H__
#define __ANUBIS_COMMON_H__

#include <math.h>
#include <malib/malib.h>

BEGIN_C_DECLS

#include <opencv/cv.h>
#include <gtk/gtk.h>
#include "csuCommonImage.h"
#include "csuCommon.h"
#include "csuEBGMUtil.h"

#define ARRAY_LEN(ar,type)   (sizeof(ar) / sizeof(type))

#define GABORRG_LAMBDAS {4.0, 4.0 * sqrt(2), 8.0, 8.0 * sqrt(2), 16.0}
#define GABORRG_ANGLES  {0.0, PI/8.0, 2*PI/8.0, 3*PI/8.0, 4*PI/8.0, 5*PI/8.0, 6*PI/8.0, 7*PI/8.0 }

/*
#define GABORRG_LAMBDAS {4.0, 4.0 * sqrt(2), 8.0}
#define GABORRG_ANGLES  {0.0, PI/8.0, 2*PI/8.0, 3*PI/8.0}
*/
#define GABORRG_PHASES  {0.0, PI/2.0}
#define GABORRG_GAMMAS  {1.0}

#define GRM_MAX_XML_CHAR_SIZE 100
#define GRM_MAX_XML_INT_CHAR_SIZE 30
#define GRM_MAX_XML_DOUBLE_CHAR_SIZE 50

#define GABORRG_XML_TAG_GABORRG		"GaborRg"
#define GABORRG_XML_TAG_JETS            "Jets"
#define GABORRG_XML_TAG_TEMPLATES	"Templates"
#define GABORRG_XML_TAG_TEMPLATE	"Template"
#define GABORRG_XML_TAG_CELLS		"Cells"
#define GABORRG_XML_TAG_CELL		"Cell"
#define GABORRG_XML_TAG_REAL            "RealPart"
#define GABORRG_XML_TAG_IMAG            "ImagPart"
#define GABORRG_XML_TAG_MAG             "Mag"
#define GABORRG_XML_TAG_ANG             "Ang"
#define GABORRG_XML_ATTR_IM_FILE_START_NUM  "image_file_start_num"
#define GABORRG_XML_ATTR_IM_FILE_END_NUM    "image_file_end_num"
#define GABORRG_XML_ATTR_IM_FILE_NUM_FORMAT "%.6d"
#define GABORRG_XML_ATTR_WIDTH          "width"
#define GABORRG_XML_ATTR_HEIGHT         "height"
#define GABORRG_XML_ATTR_MASKS_FNAME    "masks_file_name"
#define GABORRG_XML_ATTR_FACE_NAME      "face_name"
#define GABORRG_XML_ATTR_FG_IMAGE_FNAME "fg_image_fname"
#define GABORRG_XML_ATTR_FACE_RECT      "face_rect"
#define GABORRG_XML_ATTR_X              "x"
#define GABORRG_XML_ATTR_Y              "y"
#define GABORRG_XML_ATTR_PARTS          "parts"
#define GABORRG_XML_ATTR_REAL           "real_part"
#define GABORRG_XML_ATTR_IMAG           "imag_part"
#define GABORRG_XML_ATTR_MAG            "mag"
#define GABORRG_XML_ATTR_ANG            "ang"

#define ANUBIS_JPG_IMAGE_EXTENTION       ".jpg"

#define GABORRG_MAKER_DEFAULT_PARTS {\
"l_eyebrow_l_edge", "l_eyebrow_r_edge", "r_eyebrow_l_edge", "r_eyebrow_r_edge",\
"left_eye_l_edge",  "left_eye_r_edge",  "right_eye_l_edge", "right_eye_r_edge", \
"nose_l_edge", "nose_r_edge","mouse_left_edge","mouse_right_edge",NULL}


enum _FaceParts{L_EYEBROW_L_EDGE, L_EYEBROW_R_EDGE, R_EYEBROW_L_EDGE, R_EYEBROW_R_EDGE,
		LEFT_EYE_L_EDGE, LEFT_EYE_R_EDGE, RIGHT_EYE_L_EDGE, RIGHT_EYE_R_EDGE,
		NOSE_L_EDGE, NOSE_R_EDGE, MOUSE_L_EDGE, MOUSE_R_EDGE, FaceParts_LEN};

typedef enum _FaceParts FaceParts;

#define FACE_PARTS_2_NAMES {"l_eye_brow", "r_eye_brow", "l_eye", "r_eye", "nose", "mouse", NULL}

enum _FaceParts2{L_EYEBROW, R_EYEBROW, L_EYE, R_EYE, NOSE, MOUSE};
typedef enum _FaceParts2 FaceParts2;

enum _FacePartsArea {LEFT_EYE_AREA, RIGHT_EYE_AREA, NOSE_AREA, MOUSE_AREA, FacePartsArea_LEN};

#define FACE_PARTS_AREA_OF_VERT {{L_EYEBROW_L_EDGE, L_EYEBROW_R_EDGE,\
                                  LEFT_EYE_L_EDGE,  LEFT_EYE_R_EDGE, FaceParts_LEN},\
				 {R_EYEBROW_L_EDGE, R_EYEBROW_R_EDGE,\
                                  RIGHT_EYE_L_EDGE, RIGHT_EYE_R_EDGE, FaceParts_LEN},\
				 {NOSE_L_EDGE, NOSE_R_EDGE, FaceParts_LEN},\
				 {MOUSE_L_EDGE, MOUSE_R_EDGE, FaceParts_LEN}}

#define FACE_PARTS_AREA_COEFF {{0.15, 0.3, 0.3, 0.2},{0.55, 0.3, 0.3, 0.2},\
                                {0.3, 0.6, 0.4, 0.2}, {0.2, 0.8, 0.6, 0.2}}

typedef enum _FacePartsArea FacePartsArea;

#define ANUBIS_FACE_CASCADE_NAME "haarcascade_frontalface_alt2.xml"

/* eyes location num */
#define EYES_LOC_NUM 4
#define EYES_MEAN_ERROR 3
#define EYES_SIZE_RATE_ERROR 0.6


#define GABORRG_MAG_DEFAULT_XML_FNAME   "gaborrg.xml"
#define GABORRG_JET_DEFAULT_XML_FNAME   "gaborrg_jet.xml"
/*#define FACE_JET_DEFAULT_XML_FNAME      "face_jet.xml"*/
#define FACE_JET_DEFAULT_XML_FNAME      ""

#define GABORRG_JET_MASKS_EXTENTION     ".masks"

#define TMP_MASK_PARAM_FILE_DIR "/tmp"
#define TMP_MASK_FILE_NAME "maskfile.tmp"

#define ANUBIS_DEFAULT_DISP_WIDTH  320
#define ANUBIS_DEFAULT_DISP_HEIGHT 240

#define ANUBIS_DATA_DIR "data"

#define ANUBIS_CV_IMAGE_PIXTYPE unsigned char
#define ANUBIS_CV_ANGTYPE int

/* ANUBIS_START_SAVER : command you start screensaver */

#define ANUBIS_START_SAVER "xscreensaver-command -activate"
#define ANUBIS_QUIT_SAVER  "xscreensaver-command -deactivate"
#define ANUBIS_START_SAVER_FACE_OFF_TIME 25
/*#define ANUBIS_QUIT_SAVER_FACE_ON_TIME 1*/ /* I Think It's needless */

#define GABORRG_CROSSBORDER_LENGTH 5;

#define SIM_WORST -1.0e300

#if SIZEOF_INT == 4
#define INT_AS_IPL_TYPE IPL_DEPTH_32S
#elif SIZEOF_INT == 2
#define INT_AS_IPL_TYPE IPL_DEPTH_16S
#endif /* SIZEOF_INT == N */
   
#define FACE_ALLOCATED_WIDTH 100

#define FACE_HIST_BIN 256

#define PI 0.314159265358979232e+01

#define ANUBIS_LONG_INT_CHAR_SIZE 100

#define ANG2RAD(ang) (PI * ang / 180)

#define ANUBIS_RANGE256(x)  (((x)<0)?(0):(((x)>0xff)?(0xff):(x)))



/*
#define COMMON_FILTER_GENERIC_NEW_WITH_BUF(klass, creator, setbuffer, acceptable, buf)
*/

typedef struct _AnubisCvAngRect {
  CvRect rect;
  int ang;
}AnubisCvAngRect;

typedef struct _AnubisVert {
  CvPoint co;
  char* vertLabel;
}AnubisVert;

typedef struct _AnubisPixmap {
  GtkPixmap * pixmap;
  GdkPixmap * gdk_pixmap;
  GdkBitmap * pixmap_mask;
} AnubisPixmap;

typedef struct _anubis_face_graph_with_img_data {
  face_graph face_graph;
  IplImage* cv_image;
  char * image_filename;
  double resize_rate;
  int face_rect_exist;
  CvRect face_rect;
} anubis_face_graph_with_img_data;

typedef anubis_face_graph_with_img_data* AnubisFaceGraphWithImgData; /* forrow csu code style*/


void set_malib_frame_data_to_csu_image(Image image, MalibFilter* filter, int channel);
void anubis_draw_crossline(MalibFrame* frame, int x, int y, int numcolors);
void anubis_draw_line(GtkWidget* drawingarea, MalibFrame* frame,
		       int sx, int sy, int ex, int ey, int val);
void anubis_set_allocation_d_xy(MalibFilter* filter, MalibFrame* frame,
				 GtkWidget* drawingarea, double* x, double* y);
void anubis_set_allocation_xy(MalibFrame* frame, GtkWidget* drawingarea, int* x, int* y);
MalibFrame*
anubis_create_frame_from_buf (MalibFilter* filter, MalibBuffer* buf, int colormodel);

void set_resized_csu_image_from_frame(Image out_image, MalibFrame* in_frame, double rate);

void set_resized_csu_image_from_cv_frame(Image next_image, MalibFrame* prev_frame, double rate);

int get_biggest_width_face_num(CvSeq* faces);

char*
get_anubis_data_file_full_path_name(char* fname);

IplImage* anubis_create_cv_image_from_malib_frame(MalibFrame* frame, int colors);

IplImage* anubis_create_cv_image_headder_from_malib_frame(MalibFrame* frame);

void anubis_cv_set_rotate_image(IplImage* dstImage, IplImage* srcImage, double rad);

void anubis_cv_set_rotate_image_with_center(IplImage* dstImage, IplImage* srcImage,
					   double rad, CvPoint center);

void anubis_set_rotate_co(int* des_x, int* des_y, int from_x, int from_y, int center_x, int center_y, int angle );

void anubis_cv_set_rotate_co(CvPoint* dest, CvPoint from, CvPoint cnter, int angle);

void anubis_cv_allocate_rects(CvSeq* rects, CvPoint center, int angle);

void
anubis_cv_remove_inside_rect_with_attrs_idx(CvSeq* rects, int* attrs_idx_of_seqence);

void anubis_toggle_running_clicked(GtkButton* button, MalibGtkDisplay* display);

void on_anubis_ftype_h_scale_value_change (GtkAdjustment* adj, gpointer user_data);

AnubisFaceGraphWithImgData makeAnubisFaceGraphWithImgData( int geosize, int totalsize );

void face_graph_deepcopy(FaceGraph dst_graph, FaceGraph org_graph);

void
anubis_int_value_label_update(GtkWidget* label, long int val);

END_C_DECLS

#endif /* __ANUBIS_COMMON_H__ */
