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

/*
 * anubis_cv_remove_inside_rect_with_attrs_idx()
 * took from
 * OpenCV cvhaar.cpp cvHaarDetectObjects()
 * and some modified
 */

#include "anubis_common.h"

static int is_equal( const void* _r1, const void* _r2, void * dummy);

void set_malib_frame_data_to_csu_image(Image image, MalibFilter* filter, int channel){
  int * data;
  int x,y,i,image_size, need_increment;
  MalibFrame  * from_frame;
  MalibBuffer * buffer;
  buffer= filter->buf;
  MALIB_OBJECT_COUNT_REFERENCES (filter, need_increment);
  if (need_increment){
    malib_holder_increment_frame ((MalibHolder*)buffer);
  }
  from_frame= malib_buffer_get_current_frame(((MalibFilter*)filter)->buf);
  image_size= malib_filter_calc_output_image_size(filter);
  data = from_frame->data;

  i= 0;
  for(y= 0; y < from_frame->height; y++){
    for(x= 0; x < from_frame->width; x++){
      image->data[x][y][channel - 1]= (PIX_TYPE) data[i];
      i++;
    }
  }
  return;
}

void anubis_draw_crossline(MalibFrame* frame,
			  int x, int y, int numcolors){
  /*
    drawing cross line on frame as x,y center.
  
   */
  ANUBIS_CV_IMAGE_PIXTYPE * to;
  int width = frame->width;
  int height= frame->height;
  int i,j;
  int begin_x, begin_y, end_x, end_y;

  to         = frame->data;

  begin_x= x - GABORRG_CROSSBORDER_LENGTH;
  end_x  = x + GABORRG_CROSSBORDER_LENGTH;
  begin_y= y - GABORRG_CROSSBORDER_LENGTH;
  end_y  = y + GABORRG_CROSSBORDER_LENGTH;

  if(begin_x < 0)
    begin_x= 0;
  if(begin_y < 0)
    begin_y= 0;
  if(end_x > width - 1)
    x= width - 1;
  if(end_y > height - 1)
    y= height - 1;
  
  /* draw holizon */
  for(i= (width * y + begin_x) * numcolors; i < (width * y + end_x) * numcolors; i+= numcolors){
    for(j= 0; j < numcolors; j++){
      to[i+j]= 0;
    }
  }
  /* draw vertical */
  for(i= (width * begin_y + x) * numcolors;
      i < (width * end_y + x) * numcolors;
      i+= width * numcolors){
    for(j= 0; j < numcolors; j++){
      to[i+j]= 0;
    }
  }
  return;
}

void anubis_draw_line(GtkWidget* drawingarea, MalibFrame* frame,
		       int sx, int sy, int ex, int ey, int val){
  int * to;
  int max, min, height, width, count, pos;
  double x, y;
  max= MAX(sx,ex);
  min= MIN(sx,ex);
  sx= min;
  ex= max;

  max= MAX(sy,ey);
  min= MIN(sy,ey);
  sy= min;
  ey= max;

  double dx,dy;
  if(ex - sx) 
    dy= (ey - sy) / ((float) (ex - sx));
  else
    dy= 1;
  if(ey - sy)
    dx= (ex - sx) / ((float) (ey - sy));
  else
    dx= 1;

  to   = frame->data;
  width= frame->width;
  count= 0;
  x= sx;
  y= sy;
  while(x < ex || y < ey){
    y= (sy + dy * count);
    x= (sx + dx * count);
    pos= (int)  (y * width + x);
    to[pos]= val;
    count++;
  }
  return;
}

void anubis_cv_draw_cross (IplImage* img, CvPoint center, CvScalar color, int d){
  /* draw cross line to OpenCV IplImage
     @img    : IplImage
     @center : cross center.
     @color  : It is easy to set used by CV_RGB()   e.g CV_RGB(255,255,255)
     @d      : draw cross line len from cross center
  */
  cvLine( img, cvPoint( center.x - d, center.y - d ), cvPoint( center.x + d, center.y + d ), color, 1, 8, 0);
  cvLine( img, cvPoint( center.x + d, center.y - d ), cvPoint( center.x - d, center.y + d ), color, 1, 8, 0);
}


void anubis_set_allocation_d_xy(MalibFilter* filter, MalibFrame* frame,
				 GtkWidget* drawingarea, double* x, double* y){
  int i;
#ifdef DEBUGMODE
  g_print("original x %f y %f ",*x, *y);
#endif /* DEBUGMODE */
  *x= *x * (drawingarea->allocation.width  / frame->width);
  *y= *y * (drawingarea->allocation.height / frame->height);
#ifdef DEBUGMODE
  g_print("allocated x %f y %f \n", *x, *y);
#endif /* DEBUGMODE */
  return;
}

void anubis_set_allocation_xy(MalibFrame* frame, GtkWidget* drawingarea, int* x, int* y){
  *x= *x * (drawingarea->allocation.width  / frame->width);
  *y= *y * (drawingarea->allocation.height / frame->height);
  return;
}

MalibFrame*
anubis_create_frame_from_buf (MalibFilter* filter, MalibBuffer* buf,int colormodel){
  int depth;
  MalibFrame* old_frame;
  MalibFrame* new_frame;

  g_return_if_fail (filter && buf);

  depth = MALIB_FRAME_DEFAULT_DEPTH (colormodel);
  /* create new frame, which has almost all the same information
     except data format (colormodel), and timestamp */
  old_frame = malib_buffer_get_current_frame (buf);
  new_frame = malib_frame_new (colormodel, old_frame->width, old_frame->height,
			       depth, NULL);
  return new_frame;
}


void set_resized_csu_image_from_frame(Image next_image, MalibFrame* prev_frame, double rate){
  Image new_image;
  CvSize cv_prev_size, cv_next_size;
  IplImage * cv_prev_image, * cv_next_image;
  int * prev_data;
  int x, y, j,k;

  int colors= MALIB_FRAME_DEFAULT_NUM_COLORS(prev_frame->model);
  prev_data= prev_frame->data;

  if(rate < 1.0){
    /* resize */
    int next_width, next_height;
    int xi, yi;
    double xd, yd;
    next_width = prev_frame->width  * rate;
    next_height= prev_frame->height * rate;
    /* old code */

    k= 0;
    for(y= 0, yd= 0; y < next_height; y++){
      for(x= 0, xd= 0; x < next_width; x++){
	xi= x / rate;
	yi= y / rate;
	k= (int) (yi * prev_frame->width + xi);
	next_image->data[x][y][0]= (PIX_TYPE) prev_data[k];
      }
    }
    next_image->width = next_width;
    next_image->height= next_height;

  }else{
    /* don't resize */
    k= 0;
    for(y= 0; y < prev_frame->height; y++){
      for(x= 0; x < prev_frame->width; x++){
	next_image->data[x][y][0]= (PIX_TYPE) prev_data[k];
	k++;
      }
    }
    next_image->width = prev_frame->width;
    next_image->height= prev_frame->height;
  }
  return next_image;
}

void set_resized_csu_image_from_cv_frame(Image next_image, MalibFrame* prev_frame, double rate){
  /* for cv_frame , cv_frame means frame->data is ANUBIS_CV_IMAGE_PIXTYPE * */
  Image new_image;
  CvSize cv_prev_size, cv_next_size;
  IplImage * cv_prev_image, * cv_tmp_image;
  ANUBIS_CV_IMAGE_PIXTYPE * prev_data;
  int x, y, j,k;
  int colors;

  colors= MALIB_FRAME_DEFAULT_NUM_COLORS(prev_frame->model);
  
  prev_data= prev_frame->data;

  if(rate < 1.0){
    /* resize */
    int next_width, next_height;
    int xi, yi;
    double xd, yd;
    next_width = prev_frame->width  * rate;
    next_height= prev_frame->height * rate;
    /* old code */

    k= 0;
    for(y= 0, yd= 0; y < next_height; y++){
      for(x= 0, xd= 0; x < next_width; x++){
	xi= x / rate;
	yi= y / rate;
	k= (int) (yi * prev_frame->width + xi);
	k= k * colors;
	for(j= 0; j < colors; j++){
	  next_image->data[x][y][0]+= (PIX_TYPE) prev_data[k+j] / colors;
	}
      }
    }
    next_image->width = next_width;
    next_image->height= next_height;
  }else{
    /* don't resize */
    k= 0;
    for(y= 0; y < prev_frame->height; y++){
      for(x= 0; x < prev_frame->width; x++){
	for(j= 0; j < colors; j++){
	  next_image->data[x][y][0]+= (PIX_TYPE) prev_data[k+j] / colors;
	}
	k+= colors;
      }
    }
    next_image->width = prev_frame->width;
    next_image->height= prev_frame->height;
  }
  return next_image;
}

int get_biggest_width_face_num(CvSeq* faces){
  int i, j, face_width, max, tmp_width;
  CvRect face_rect;
  
  if(!faces->total){
    return -1;
  }

  max       = 0;
  face_width= 0;
  int begin_x, end_x;  
  for (i= 0; i < faces->total; i++){
    face_rect= *(CvRect*)cvGetSeqElem (faces, i);
    begin_x= face_rect.x;
    end_x  = face_rect.x + face_rect.width;

    tmp_width= end_x - begin_x;
    if (tmp_width > face_width){
      face_width= tmp_width;
      max= i;
    }
  }
  return max;
}


char*
get_anubis_data_file_full_path_name(char* fname){
  /* get anubis data file full path in which exist
   * (like /usr/local/share/anubis/data/... or /SRCPATH/anubis/data/)
   */
  char * fullname;
  FILE *dummyfptr;
  /* source len is use for pkg source dir path (like /SRCPATH/anubis/data/...)
   * data len is use for install dir path (like /usr/local/share/anubis/...)
   */
  size_t source_len, data_len;
  
  source_len= strlen(PACKAGE_SOURCE_DIR) + 1 + strlen(ANUBIS_DATA_DIR) + 1 + strlen(fname) + 1;
  data_len  = strlen(PACKAGE_DATA_DIR)   + 1 + strlen(ANUBIS_DATA_DIR) + 1 + strlen(fname) + 1;

  /* seek PACKAGE_SOURCE_DIR */
  fullname= malloc(source_len);
  sprintf(fullname, "%s/%s/%s", PACKAGE_SOURCE_DIR, ANUBIS_DATA_DIR, fname);
  dummyfptr= fopen(fullname, "r");
  if(dummyfptr){
    /* if file is found */
    fclose(dummyfptr);
    return fullname;
  }else{
    free(fullname);
  }

  /* seek PACKAGE_DATA_DIR */
  fullname= malloc(data_len);
  sprintf(fullname, "%s/%s/%s", PACKAGE_DATA_DIR, ANUBIS_DATA_DIR, fname);
  dummyfptr= fopen(fullname, "r");
  if(dummyfptr){
    /* if file is found */
    fclose(dummyfptr);
    return fullname;
  }else{
    free(fullname);
  }
  return NULL;
}

IplImage* anubis_create_cv_image_from_malib_frame(MalibFrame* frame, int colors){
  /* create IplImage same size of frame,
     if colors == 0  create image same colors of frame */
  CvSize size;
  IplImage* cv_image;

  size.width = frame->width;
  size.height= frame->height;
  if(!colors){
    colors= MALIB_FRAME_DEFAULT_NUM_COLORS(frame->model);
  }
  cv_image= cvCreateImage(size, IPL_DEPTH_8U, colors);
}

IplImage* anubis_create_cv_image_headder_from_malib_frame(MalibFrame* frame){
  CvSize size;
  IplImage* cv_image;
  int colors;

  size.width = frame->width;
  size.height= frame->height;
  colors= MALIB_FRAME_DEFAULT_NUM_COLORS(frame->model);

  cv_image= cvCreateImageHeader (size, frame->depth, colors);

  return cv_image;
}

void anubis_cv_set_rotate_image(IplImage* dstImage, IplImage* srcImage, double rad){
  /*
    set rotate image srcImage to dstImage.
   */

  float m[6];
  CvMat M = cvMat( 2, 3, CV_32F, m );
  int w = srcImage->width;
  int h = srcImage->height;

  m[0] = (float) cos(rad);
  m[1] = - (float) sin(rad);
  m[2] = w*0.5f;
  m[3] = -m[1];
  m[4] = m[0];
  m[5] = h*0.5f;

  cvGetQuadrangleSubPix( srcImage, dstImage, &M);

  return;
}

void anubis_cv_set_rotate_image_with_center(IplImage* dstImage, IplImage* srcImage,
					   double rad, CvPoint center){
  /*
    set rotate image srcImage to dstImage.
    @dstImage, destination image
    @srcImage, source image
    @angle,    rotate angle whitch made from 360 degree
    
  */
  float m[6];
  CvMat M = cvMat( 2, 3, CV_32F, m );

  /* create twice size tmp image
     because cvGetQuadrangleSubPix() casues rotate and shift so shuld do reshift
     then twice size buffer to aboid disapper image data.
  */
  CvSize tmp_size;
  tmp_size.width = srcImage->width * 2;
  tmp_size.height= srcImage->height * 2;
  IplImage * tmpImage= cvCreateImage(tmp_size, srcImage->depth, srcImage->nChannels);
  

  m[0]= (float) cos(rad);
  m[1]= -(float) sin(rad);
  m[2]= center.x;
  m[3]= -m[1];
  m[4]= m[0];
  m[5]= center.y;
  
  cvGetQuadrangleSubPix( srcImage, tmpImage, &M);

  CvPoint2D32f tmp_center;
  tmp_center.x= srcImage->width - (center.x - srcImage->width / 2);
  tmp_center.y= srcImage->height - (center.y - srcImage->height / 2);
  cvGetRectSubPix(tmpImage, dstImage, tmp_center);

  cvReleaseImage(&tmpImage);

  return;
}

void anubis_set_rotate_co(int* des_x, int* des_y, int from_x, int from_y, int center_x, int center_y, int angle ){
  int x= from_x;
  int y= from_y;
  *des_x= (x - center_x) * cos(ANG2RAD(angle)) - (y - center_y) * sin(ANG2RAD(angle)) + center_x;
  *des_y= (x - center_x) * sin(ANG2RAD(angle)) + (y - center_y) * cos(ANG2RAD(angle)) + center_y;
  return;
}

void anubis_cv_set_rotate_co(CvPoint* dest, CvPoint from, CvPoint center, int angle){
  anubis_set_rotate_co(&(*dest).x, &(*dest).y, from.x, from.y, center.x, center.y, angle);
  return;
}

void anubis_cv_allocate_rects(CvSeq* rects, CvPoint center, int angle){
  int i;
  CvRect* rect;
  CvPoint rect_center;
  
  for(i= 0; i < rects->total; i++){
    rect= (CvRect*)cvGetSeqElem(rects, i);
    rect_center.x= rect->x + (rect->width / 2);
    rect_center.y= rect->y + (rect->height / 2);
    /*anubis_set_rotate_co(&rect->x, &rect->y, rect->x, rect->y, center.x, center.y, angle);*/
    anubis_set_rotate_co(&rect_center.x, &rect_center.y, rect_center.x, rect_center.y, center.x, center.y, angle);

    rect->x= rect_center.x - (rect->width / 2);
    rect->y= rect_center.y - (rect->height / 2);
    
  }
  return;
}


static int
is_equal( const void* _r1, const void* _r2, void * dummy)
{
    const CvRect* r1 = (const CvRect*)_r1;
    const CvRect* r2 = (const CvRect*)_r2;
    int distance = cvRound(r1->width*0.2);

    return r2->x <= r1->x + distance &&
           r2->x >= r1->x - distance &&
           r2->y <= r1->y + distance &&
           r2->y >= r1->y - distance &&
           r2->width <= cvRound( r1->width * 1.2 ) &&
           cvRound( r2->width * 1.2 ) >= r1->width;
}


void
anubis_cv_remove_inside_rect_with_angle_seq(CvSeq* rects, CvSeq* angle_seq){
  int i, j ,k;
  int flags[rects->total];
  
  for(i= 0; i < rects->total; i++){
    CvRect* r1= (CvRect*)cvGetSeqElem( rects, i );
    int flag= 1;
    for(j= 0; j < rects->total; j++){
      CvRect* r2= (CvRect*)cvGetSeqElem( rects, j );
      int distance = cvRound( r2->width * 0.2 );
      if( i != j &&
	  r1->x >= r2->x - distance &&
	  r1->y >= r2->y - distance &&
	  r1->x + r1->width <= r2->x + r2->width + distance &&
	  r1->y + r1->height <= r2->y + r2->height + distance)
	{
	  
	  flag = 0;
	  break;
	}
    }
    flags[i]= flag;
  }

  for(i= 0; i < rects->total; i++){
    if(!flags[i]){
      CvSlice slice;
      slice.start_index= i;
      slice.end_index  = i + 1;
      cvSeqRemoveSlice(rects, slice);
      cvSeqRemoveSlice(angle_seq, slice);
    }
  }
}


void anubis_toggle_running_clicked(GtkButton* button, MalibGtkDisplay* display){
  MalibSink* sink;
  MalibSinkStatus status;
  g_print("toggle_running_clicked\n");
  sink=   (MalibSink*)display;
  status= malib_sink_get_status(sink);
  malib_sink_set_status (sink, ((status == MALIB_SINK_RUNNING) ?
				MALIB_SINK_HALT : MALIB_SINK_RUNNING));
  return;
}

void anubis_pixmap_update (AnubisPixmap org_pixmap, AnubisPixmap dummy_pixmap, int flag){
  /*
    if flag is 0 org_pixmap set dummy_pixmap
    otherwise set org_pixmap's original pixmap
  */
  
  GdkPixmap* pixmap;
  GdkBitmap* mask;
  if(flag){
    pixmap= org_pixmap.gdk_pixmap;
    mask  = org_pixmap.pixmap_mask;
  } else {
    pixmap= dummy_pixmap.gdk_pixmap;
    mask  = dummy_pixmap.pixmap_mask;
  }
  gtk_pixmap_set((GtkPixmap*) org_pixmap.pixmap, pixmap, mask);
  gtk_widget_ref(org_pixmap.pixmap);
  return;
}

void on_anubis_ftype_h_scale_value_change (GtkAdjustment* adj, gpointer user_data){
  /* for gui slider application */
     
  FTYPE * value;
  value= (FTYPE*) user_data;
  *value= (FTYPE) (adj->value);
  return;
}

AnubisFaceGraphWithImgData makeAnubisFaceGraphWithImgData( int geosize, int totalsize ){
  
  AnubisFaceGraphWithImgData fg_with_idata= malloc( sizeof(anubis_face_graph_with_img_data) );
  assert(fg_with_idata);
  setFaceGraphMembers((FaceGraph)fg_with_idata, geosize, totalsize);

  fg_with_idata->image_filename= NULL;
  
  return fg_with_idata;
}

void face_graph_deepcopy(FaceGraph dst_graph, FaceGraph org_graph){
  GaborJet cur_jet, tmp_jet;
  int i;

  for(i= 0; i < org_graph->totalsize; i++){
    cur_jet= org_graph->jets[i];
    // cur_jet copy to tmp_jet, because cur_sim_jets[i] is
    //   over writed or free when next write_frame_data()
    grm_jet_new_and_copy(&tmp_jet, cur_jet);
    ((FaceGraph)dst_graph)->jets[i]= tmp_jet;
  }
  return;
}


void
anubis_int_value_label_update(GtkWidget* label, long int val){
  char tmp_char[ANUBIS_LONG_INT_CHAR_SIZE];
  sprintf(tmp_char, "%d", val);
  gtk_label_set_text( GTK_LABEL(label), tmp_char);
}
