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
#include "anubis_color_config.h"

/* private function prototypes **************************************/
static void anubis_color_config_write_frame_data (AnubisColorConfig* filter,
						 MalibFrame* frame);

static void anubis_color_config_create_params (AnubisColorConfig* filter);

/* virtual function table *******************************************/
static AnubisColorConfigClass anubis_color_config_class=
{
  (void (*)(MalibObject*)) 	     	 malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*))  anubis_color_config_write_frame_data
};

AnubisColorConfig*
anubis_color_config_new()
{
  MALIB_FILTER_GENERIC_NEW (AnubisColorConfig, &anubis_color_config_class,
			    MALIB_FRAME_COLORMODEL_RGB);
}

AnubisColorConfig*
anubis_color_config_new_with_buf_inner (MalibBuffer* buf)
{
  MALIB_FILTER_GENERIC_NEW_WITH_BUF (AnubisColorConfig, anubis_color_config_new,
				     anubis_color_config_set_buffer, buf);
}

AnubisColorConfig*
anubis_color_config_new_with_buf (MalibBuffer* buf)
{
  AnubisColorConfig* filter;
  filter= anubis_color_config_new_with_buf_inner(buf);
  anubis_color_config_create_params(filter);
  return filter;
}

void
anubis_color_config_set_buffer (AnubisColorConfig* filter, MalibBuffer* buf)
{
  malib_filter_set_buffer_with_colormodel ((MalibFilter*)filter, buf,
					   MALIB_FRAME_COLORMODEL_RGB);
}

void anubis_color_config_create_params (AnubisColorConfig* filter){
  filter->alpha= 0;
  filter->red  = 1.0;
  filter->green= 1.0;
  filter->blue = 1.0;
  
}

/* private functions ************************************************/

static void
anubis_color_config_write_frame_data (AnubisColorConfig* filter, MalibFrame* frame)
{
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_filter_preprocess ((MalibFilter*)filter, frame);
  {
    int* from  = malib_buffer_get_current_frame(((MalibFilter*)filter)->buf) ->data;
    int* to    = frame->data;
    unsigned int image_size;
    unsigned int i,j;

    image_size= malib_filter_calc_output_image_size ((MalibFilter*) filter);
    g_print("red %f\n", filter->red);
    for (i= 0; i < image_size; i+= 3){
      to[i]  = from[i]   * filter->red;
      to[i+1]= from[i+1] * filter->green;
      to[i+2]= from[i+2] * filter->blue;
    }
  }
  return;
}

gboolean
on_alpha_hscale1_button_value_change (GtkAdjustment* adj,
				      gpointer       user_data){
  AnubisColorConfig     * filter;
  filter= (AnubisColorConfig*) user_data;
#ifdef DEBUGMODE
  g_print("alpha %d\n", (int) adj->value);
#endif DEBUGMODE

  filter->alpha= (int) (adj->value);
  return 1;
}

gboolean
on_color_hscale_button_value_change (GtkAdjustment* adj,
				     gpointer       user_data){
  AnubisColorConfig* filter;
  /*filter= (AnubisColorConfig*) user_data;*/
  double * value;
  value= (double*) user_data;
  *value= (double) (adj->value);
  
  /*filter->red= (double) (adj->value);*/
#ifdef DEBUGMODE
  /*g_print("value %f\n", (double) *value);*/
#endif DEBUGMODE

  return 1;
}
