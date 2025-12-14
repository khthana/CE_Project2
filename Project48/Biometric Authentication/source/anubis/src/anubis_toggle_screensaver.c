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
 */#include "anubis_toggle_screensaver.h"


void
anubis_toggle_screensaver_write_frame_data (AnubisToggleScreensaver* filter, MalibFrame* frame);

static AnubisToggleScreensaverClass anubis_toggle_screensaver_class=
{
  (void (*)(MalibObject*)) malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) anubis_toggle_screensaver_write_frame_data
};

/* public functions **************************************************/

AnubisToggleScreensaver*
anubis_toggle_screensaver_new_with_buf_and_val(MalibBuffer* buf, int* toggle_screen){
  MalibFrame * frame;
  AnubisToggleScreensaver * filter;

  MALIB_FILTER_GENERIC_NEW_0 (AnubisToggleScreensaver, &anubis_toggle_screensaver_class,
			      MALIB_FRAME_COLORMODEL_RGB, &filter);

  frame= anubis_create_frame_from_buf((MalibFilter*) filter, buf ,MALIB_FRAME_COLORMODEL_RGB);

  malib_filter_set_buffer(filter,buf);
  
  filter->toggle_screen= toggle_screen;
  filter->prev_screen_status= 1;

  filter->face_on_time = 0;
  filter->face_off_time= 0;
  
  return filter;
}

/* private functions **************************************************/

void
anubis_toggle_screensaver_write_frame_data (AnubisToggleScreensaver* filter, MalibFrame* frame){
  MalibBuffer * buf;

  malib_filter_preprocess((MalibFilter*)filter, frame);
  frame->data= malib_buffer_get_current_frame(((MalibFilter*)filter)->buf)->data;


  if(*filter->toggle_screen){
    if(!filter->prev_screen_status){
      system(ANUBIS_QUIT_SAVER);
      /*
      if(filter->face_on_time > ANUBIS_QUIT_SAVER_FACE_ON_TIME){
	system(ANUBIS_QUIT_SAVER);
	filter->face_on_time= 0;
      } else {
	filter->face_on_time++;
      }
      */
    }
    filter->face_off_time= 0;
  }else{
    if(filter->prev_screen_status){
      /*system(ANUBIS_START_SAVER);*/
      if(filter->face_off_time > ANUBIS_START_SAVER_FACE_OFF_TIME){
	system(ANUBIS_START_SAVER);
	filter->prev_screen_status= 0;
	return;
      } else {
	filter->face_off_time++;
	filter->prev_screen_status= 1;
	return;
      }
    }
  }

  filter->prev_screen_status= *filter->toggle_screen;
  
  return;
}
