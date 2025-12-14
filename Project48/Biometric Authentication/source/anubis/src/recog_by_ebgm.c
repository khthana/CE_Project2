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
#include "recog_by_ebgm.h"

static RecogByEBGMClass reacog_by_ebgm_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) recog_by_ebgm_write_frame_data
};

RecogByEBGM* recog_by_ebgm_new(){
  return NULL;
}

RecogByEBGM* recog_by_ebgm_new_with_buf(MalibBuffer* buf){
  MALIB_FILTER_GENERIC_NEW_WITH_BUF ( RecogByEBGM, recog_by_ebgm_new,
				      recog_by_ebgm_set_buffer, buf);
}

void
recog_by_ebgm_set_buffer (RecogByEBGM* filter, MalibBuffer* buf){
  malib_filter_set_buffer_with_colormodel ((MalibFilter*)filter, buf,
					   MALIB_FRAME_COLORMODEL_GRAY);
}

RecogByEBGM* recog_by_ebgm_write_frame_data(RecogByEBGM* filter, MalibFrame* frame){
  int image_size;
  GaborJet jet;

  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_filter_preprocess ((MalibFilter*)filter, frame);
  
  frame->data= malib_buffer_get_current_frame(((MalibFilter*)filter)->buf)->data;

  image_size= malib_filter_calc_output_image_size((MalibFilter*) filter);

  jet= makeGaborJet(image_size);
  
  
  return filter;
}

