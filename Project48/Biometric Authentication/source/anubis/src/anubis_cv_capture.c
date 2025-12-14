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

#include "anubis_cv_capture.h"

void anubis_cv_capture_write_frame_data(AnubisCVCapture* filter, MalibFrame* frame);

void anubis_cv_capture_init(AnubisCVCapture* filter,
			   unsigned int width, unsigned int height, unsigned int format,
			   unsigned int channel, unsigned int videomode);

void
anubis_cv_convert_colorinfo (IplImage* cv_image, unsigned int* colormodel, unsigned int* depth);



static AnubisCVCaptureClass anubis_cv_capture_class=
{
  //(void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibObject*))              anubis_cv_capture_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_cv_capture_write_frame_data
};

AnubisCVCapture*
anubis_cv_capture_new_with_size (unsigned int width, unsigned int height){
  return anubis_cv_capture_new_with_config(MALIB_STD_V4L_DEVICE, 
					  width, height,
					  MALIB_STD_V4L_PALETTE,
					  MALIB_STD_V4L_CHANNEL,
					  MALIB_STD_V4L_VIDEOMODE);
}

AnubisCVCapture*
anubis_cv_capture_new_with_config(const unsigned char* device,
				 unsigned int width, unsigned int height, 
				 unsigned int format,
				 unsigned int channel, unsigned int videomode){
  AnubisCVCapture* retpter;

  g_return_if_fail (device);

  retpter= (AnubisCVCapture*) malloc (sizeof(AnubisCVCapture));
  memset (retpter, 0, sizeof(AnubisCVCapture));
  anubis_cv_capture_init(retpter, width, height, format, channel, videomode);

  MALIB_OBJECT_SET_VFUNC_TBL (retpter, &anubis_cv_capture_class);
  
  return retpter;
}

void
anubis_cv_capture_delete (AnubisCVCapture* filter){
  AnubisCVSource* source= filter;
  //#ifdef DEBUGMODE
  g_print("delete capture\n");
  //#endif /* DEBUGMODE */

  anubis_cv_reset_capture_propaty(filter);
  
  cvReleaseCapture(&source->capture);
  malib_filter_delete(filter);

  return;
}

void
anubis_cv_reset_capture_propaty (AnubisCVCapture* filter){
  cvSetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_WIDTH, filter->org_cap_width);
  cvSetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_HEIGHT,filter->org_cap_height);
  
}

/* private functions **************************************************/

void anubis_cv_capture_init(AnubisCVCapture* filter,
			   unsigned int width, unsigned int height, unsigned int format,
			   unsigned int channel, unsigned int videomode)
{
  IplImage * cv_image;
  MalibFrame * frame;
  unsigned int colormodel, depth;

  ((AnubisCVSource*)filter)->capture= cvCaptureFromCAM(0);

  filter->org_cap_width = cvGetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_WIDTH);
  filter->org_cap_height= cvGetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_HEIGHT);

#ifdef DEBUGMODE
  g_print("dump propaty %f %f %f %f\n",
	  cvGetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_WIDTH),
	  cvGetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_HEIGHT),
	  cvGetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FPS),
	  cvGetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FOURCC));
#endif /* DEBUGMODE */

  cvSetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_WIDTH, width);
  cvSetCaptureProperty(((AnubisCVSource*)filter)->capture, CV_CAP_PROP_FRAME_HEIGHT, height);



  if( !cvGrabFrame( ((AnubisCVSource*)filter)->capture )){
    g_error("can't capture\n");
  }
  cv_image        = cvRetrieveFrame (((AnubisCVSource*)filter)->capture);

  ((AnubisCVSource*)filter)->cv_image= cv_image;

  /* frame information setting */
  
  anubis_cv_convert_colorinfo(((AnubisCVSource*)filter)->cv_image, &colormodel, &depth);
  
  frame= malib_frame_new (colormodel,
			  cv_image->width, cv_image->height,
			  depth,
			  NULL);
  
  malib_source_set_frame_info((MalibSource*)filter,frame);
  
  return;
}


void anubis_cv_capture_write_frame_data(AnubisCVCapture* filter, MalibFrame* frame){

  int capture_next = 0;
  struct timeval* tp = &(((MalibSource*) filter) -> tp);

  MALIB_OBJECT_COUNT_REFERENCES (filter, capture_next);

  if (capture_next){
    /* write frame data */
    {

      if( !cvGrabFrame( ((AnubisCVSource*)filter)->capture )){
	g_error("can't capture\n");
      }
      IplImage* cv_image;
      cv_image= ((AnubisCVSource*)filter)->cv_image;
      
      cv_image= cvRetrieveFrame(((AnubisCVSource*)filter)->capture);

      if(cv_image){
	//frame->data= ((AnubisCVSource*)filter)->cv_image->imageData;
	ANUBIS_CV_IMAGE_PIXTYPE* to= frame->data;
	int i;
	for(i= 0; i < cv_image->height * cv_image->width * cv_image->depth; i++){
	  to[i]= ((AnubisCVSource*)filter)->cv_image->imageData[i];
	}
      }
    }
    gettimeofday (tp, NULL);
  }
  frame->timestamp.tv_sec = tp->tv_sec;
  frame->timestamp.tv_usec= tp->tv_usec;

  return;
}

void
anubis_cv_convert_colorinfo (IplImage* cv_image, unsigned int* colormodel, unsigned int* depth){

  if(cv_image->nChannels == 3){
    *colormodel= MALIB_FRAME_COLORMODEL_RGB;
  }
  if(cv_image->nChannels == 1){
    *colormodel= MALIB_FRAME_COLORMODEL_GRAY;
  }
  *depth= cv_image->depth;
}

