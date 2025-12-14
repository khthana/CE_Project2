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
#include "recog_by_gabor.h"

RecogByGabor* recog_by_gabor_write_frame_data(RecogByGabor*, MalibFrame*);
void recog_by_gabor_mark_at_recog_point(RecogByGabor* filter, MalibFrame* frame);
void recog_by_gabor_draw_crossline(RecogByGabor* filter, MalibFrame* frame,
				   int x, int y);
void recog_by_gabor_stdout_recog_point(RecogByGabor* filter);
void recog_by_gabor_set_allocation_xy(RecogByGabor* filter, MalibFrame* frame);

static RecogByGaborClass recog_by_gabor_class=
{
  (void (*)(MalibObject*))              malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*)) recog_by_gabor_write_frame_data
};

RecogByGabor*
recog_by_gabor_new ()
{
  RecogByGabor* gabor; /* retptr */
  
  MALIB_FILTER_GENERIC_NEW_0 ( RecogByGabor, &recog_by_gabor_class,
			     MALIB_FRAME_COLORMODEL_GRAY , &gabor);
  gabor->gaborrg= grr_xml_parse_file(GRR_DEFAULT_XML_FILE);
  if(gabor->gaborrg){
  }
  
  return gabor;
}

RecogByGabor*
recog_by_gabor_new_with_buf (MalibBuffer* buf)
{
  MALIB_FILTER_GENERIC_NEW_WITH_BUF ( RecogByGabor, recog_by_gabor_new,
				      recog_by_gabor_set_buffer, buf);
}

RecogByGabor*
recog_by_gabor_new_with_buf_and_gabors (MalibBuffer* buf,
					int* dirs, int* radiuses,
					int gabor_dirs_num, int gabor_rads_num,
					int scale, char* fname)
{
  RecogByGabor * filter;
  filter= recog_by_gabor_new_with_buf(buf);

  filter->malib_gabors    = init_malib_gabors_from_gray_buf(buf, dirs, radiuses,
							    gabor_dirs_num, gabor_rads_num,
							    scale);
  filter->gabor_dirs_num  = gabor_dirs_num;
  filter->gabor_rads_num  = gabor_rads_num;
  filter->malib_gabors_num= gabor_dirs_num * gabor_rads_num + 1; /* +1 for last NULL */
  tmp_malib_frames_set_to_recog_by_gabor(filter);

  filter->disc_data              = load_grr_disc_data_from_xml_file(fname);
  filter->kd_tree                = make_kd_tree_from_grr_disc_data(filter->disc_data);
  filter->parts_and_co_array     = make_parts_and_co_array_from_grr_disc_data(filter->disc_data);
  filter->toggle_write_frame_only= 0;
  
  return filter;
}

void
recog_by_gabor_set_buffer (RecogByGabor* filter, MalibBuffer* buf){
  malib_filter_set_buffer_with_colormodel ((MalibFilter*)filter, buf,
					   MALIB_FRAME_COLORMODEL_GRAY);
}

RecogByGabor* recog_by_gabor_create_params (RecogByGabor* gabor){
  return;
}

MalibGabor ** init_malib_gabors_from_gray_buf(MalibBuffer* gray_buf,
					      int* dirs, int* radiuses, 
					      int gabor_dirs_num, int gabor_rads_num,
					      int scale)
{
  /*
    @gray_buf: gray buffer
    @dirs    : gabor dir array, like {0,30,60,90,120}
    @rad     : gabor radius array, like {8, 16, 24}
   */
  MalibGabor ** malib_gabors;
  int malib_gabors_num= gabor_dirs_num * gabor_rads_num + 1;/* +1 for last NULL */
  malib_gabors= (MalibGabor**)malloc((sizeof(MalibGabor*)) * malib_gabors_num);
  
  int i,j,k;
  k= 0;
  for(i= 0; i < gabor_rads_num; i++){
    for(j= 0; j < gabor_dirs_num; j++){
      malib_gabors[k]= malib_gabor_new_with_buf (gray_buf);
      malib_gabor_set_radius (malib_gabors[k], radiuses[i]);
      malib_gabor_set_dir    (malib_gabors[k], dirs[j]);
      g_print("malib_gabors[%d] radiuses %d dirs %d\n",k, radiuses[i], dirs[j]);
      k++;
    }
  }
  malib_gabors[k]= NULL; /* last node insert NULL */
  return malib_gabors;
}

/* private functions ************************************************************/

RecogByGabor* recog_by_gabor_write_frame_data(RecogByGabor* filter, MalibFrame* frame){
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  MalibFilter* malib_filter;
  
  malib_filter_preprocess ((MalibFilter*)filter, frame);
  {
    unsigned int image_size;
    MalibBuffer * buffer;
    KdNode      * nearest_node, * tmp_nearest_node;
    int         * malib_gabors_data[filter->malib_gabors_num], * to;
    double        vals[filter->malib_gabors_num];
    int           need_increment;
    
    buffer= ((MalibFilter*)filter)->buf;
    MALIB_OBJECT_COUNT_REFERENCES (filter, need_increment);
    if (need_increment){
	malib_holder_increment_frame ((MalibHolder*)buffer);
    }
    frame->data= malib_buffer_get_current_frame(((MalibFilter*)filter)->buf)->data;
    image_size =  malib_filter_calc_output_image_size((MalibFilter*) filter);

    parts_and_co_array_reflesh(filter->disc_data, filter->parts_and_co_array);
    
    g_print("generate tmp_malib_frames[i] increment %d\n", need_increment);
    int i,j;
    i= 0;
    while(filter->malib_gabors[i]){
      malib_source_write_frame_data((MalibSource*)filter->malib_gabors[i],
				    filter->tmp_malib_frames[i]);
      malib_gabors_data[i]= filter->tmp_malib_frames[i]->data;
      i++;
    }
    malib_gabors_data[i]= NULL; /* last is NULL */
    for (i= 0; i < image_size; i++){
      j= 0;
      while(malib_gabors_data[j]){
	vals[j]= malib_gabors_data[j][i];
	j++;
      }
      nearest_node= search_kd_tree_nearest_with_center_co(filter->kd_tree, vals,
							  GABORRG_RECOG_DEFAULT_SEARCH_RADIUS);
      if(nearest_node){
	set_nearest_node_to_same_name_parts_and_co(filter, nearest_node, i, frame);
      }
    }
    recog_by_gabor_set_allocation_xy   (filter, frame);
    recog_by_gabor_stdout_recog_point  (filter);/* debug_write */
    recog_by_gabor_mark_at_recog_point (filter, frame);
  }
  
  return filter;
}

void tmp_malib_frames_set_to_recog_by_gabor(RecogByGabor* filter){
  MalibBuffer* buffer;
  MalibFrame* from_frame;
  int i, image_size;
  filter->tmp_malib_frames     = calloc(filter->malib_gabors_num, sizeof(MalibFrame*));
  filter->tmp_malib_frame_datas= calloc(filter->malib_gabors_num, sizeof(int*));
  i= 0;
  while(filter->malib_gabors[i]){
    buffer    = ((MalibFilter*) filter->malib_gabors[i])->buf;
    from_frame= malib_buffer_get_current_frame(buffer);
    image_size= malib_filter_calc_output_image_size((MalibFilter*) filter->malib_gabors[i]);

    filter->tmp_malib_frame_datas[i]= (int*) malloc (image_size * sizeof(int));
    filter->tmp_malib_frames[i]     = malib_frame_new(from_frame->model,
						      from_frame->width,
						      from_frame->height,
						      from_frame->depth,
						      filter->tmp_malib_frame_datas[i]);
    if(! filter->tmp_malib_frames[i])
      g_error("memory can't allocated, in recog_by_gabor.c tmp_malib_frames_set_to_recog_by_gabor()");
    i++;
  }
  filter->tmp_malib_frames[i]= NULL; /* last node is NULL */
}

int set_nearest_node_to_same_name_parts_and_co(RecogByGabor* filter,
					       KdNode* nearest_node,
					       int im_position,
					       MalibFrame* frame){
  /* im_position is 1D data seqence of image */
  int i, x, y;

  for(i= 0; i < filter->disc_data->data_classes_num; i++){
    if( nearest_node &&
	((GrrDiscDataNode*) nearest_node->item)->data_class
	== filter->parts_and_co_array[i].data_class){
      if( nearest_node->nearest_dist < filter->parts_and_co_array[i].nearest_dist){
	printf("%s ",((GrrDiscDataNode*)nearest_node->item)->data_class->name);
	printf("%ld %ld %f %f\n",
	       ((GrrDiscDataNode*) nearest_node->item)->data_class,
	       filter->parts_and_co_array[i].data_class,
	       filter->parts_and_co_array[i].nearest_dist,
	       nearest_node->nearest_dist);
	filter->parts_and_co_array[i].nearest_dist= nearest_node->nearest_dist;
	filter->parts_and_co_array[i].x           = im_position % frame->width;
	filter->parts_and_co_array[i].y           = im_position / frame->height;
	filter->parts_and_co_array[i].is_set      = 1;
      }
    }
  }
  return 1;
}

RecogByGaborPartsAndCo* make_parts_and_co_array_from_grr_disc_data(GrrDiscData * disc_data){
  /* return RecogByGaborPartsAndCo array last node is NULL */
  int i, init_dist;
  RecogByGaborPartsAndCo * parts_and_co_array;
  GrrDiscDataClass       * tmp_data_class;
  
  parts_and_co_array= calloc(disc_data->data_classes_num, sizeof(RecogByGaborPartsAndCo));
  init_dist         = GABORRG_RECOG_DEFAULT_SEARCH_RADIUS *
                      GABORRG_RECOG_DEFAULT_SEARCH_RADIUS * disc_data->data_classes_num;
  tmp_data_class    = disc_data->data_classes;
  
  for(i= 0; i < disc_data->data_classes_num; i++){
    parts_and_co_array[i].data_class  = tmp_data_class;
    parts_and_co_array[i].nearest_dist= init_dist;
    tmp_data_class                    = tmp_data_class->next;
  }
  return parts_and_co_array;
}

void parts_and_co_array_reflesh(GrrDiscData* disc_data,
				RecogByGaborPartsAndCo* parts_and_co_array){
  int i, init_dist;
  init_dist= GABORRG_RECOG_DEFAULT_SEARCH_RADIUS * GABORRG_RECOG_DEFAULT_SEARCH_RADIUS * disc_data->data_classes_num;
  
  for(i= 0; i < disc_data->data_classes_num; i++){
    parts_and_co_array[i].nearest_dist= init_dist;
    parts_and_co_array[i].x           = 0; /* needless */
    parts_and_co_array[i].y           = 0; /* needless */ 
    parts_and_co_array[i].is_set      = 0;
  }
  return parts_and_co_array;
}

void recog_by_gabor_mark_at_recog_point(RecogByGabor* filter, MalibFrame* frame){
  int i;
  int x,y;

  for(i= 0; i < filter->disc_data->data_classes_num; i++){
    x= filter->parts_and_co_array[i].allocation_x;
    y= filter->parts_and_co_array[i].allocation_y;
    recog_by_gabor_draw_crossline(filter, frame, x, y);
  }
  return;
}

void recog_by_gabor_draw_crossline(RecogByGabor* filter, MalibFrame* frame,
				   int x, int y){
  GtkWidget * drawingarea;
  int * to;
  int width = frame->width;
  int height= frame->height;
  int i;
  int begin_x, begin_y, end_x, end_y;

  drawingarea= GTK_WIDGET (malib_gtkdisplay_get_drawarea
			   (filter->gui->displays[filter->gui->main_display_num]));
  to         = frame->data;

  begin_x= x - RECOG_BY_GABOR_CROSSBORDER_LENGTH;
  end_x  = x + RECOG_BY_GABOR_CROSSBORDER_LENGTH;
  begin_y= y - RECOG_BY_GABOR_CROSSBORDER_LENGTH;
  end_y  = y + RECOG_BY_GABOR_CROSSBORDER_LENGTH;

  if(begin_x < 0)
    begin_x= 0;
  if(begin_y < 0)
    begin_y= 0;
  if(end_x > width - 1)
    x= width - 1;
  if(end_y > height - 1)
    y= height - 1;
  
  /* draw holizon */
  for(i= width * y + begin_x; i < width * y + end_x; i++){
    to[i]= 0;
  }
  /* draw vertical */
  for(i= width * begin_y + x; i < width * end_y + x; i+= width){
    to[i]= 0;
  }
  return;
}

void recog_by_gabor_stdout_recog_point(RecogByGabor* filter){
  int i;
  g_print("disc_data->data_classes_num %d\n", filter->disc_data->data_classes_num); 
  printf("\n");
  for(i= 0; i < filter->disc_data->data_classes_num; i++){
    printf("%s (%d %d) (%d %d)  ",
	   filter->parts_and_co_array[i].data_class->name,
	   filter->parts_and_co_array[i].x,
	   filter->parts_and_co_array[i].y,
	   filter->parts_and_co_array[i].allocation_x,
	   filter->parts_and_co_array[i].allocation_y
	   );
  }
  printf("\n");
  return;
}

void recog_by_gabor_set_allocation_xy(RecogByGabor* filter, MalibFrame* frame){
  /*
    set allocation x and y to
    filter->parts_and_co_array[i].allocation_x
    and
    filter->parts_and_co_array[i].allocation_y
   */
  int i;
  GrrGui * gui;
  GtkWidget * drawingarea;

  gui= filter->gui;
  drawingarea= GTK_WIDGET ( malib_gtkdisplay_get_drawarea (filter->gui->displays[filter->gui->main_display_num]));
  for(i= 0; i < filter->disc_data->data_classes_num; i++){
    filter->parts_and_co_array[i].allocation_x=
      (int) (filter->parts_and_co_array[i].x *
	     ( (float)drawingarea->allocation.width) / frame->width);
    filter->parts_and_co_array[i].allocation_y=
      (int) (filter->parts_and_co_array[i].y *
	     ( (float)drawingarea->allocation.height / frame->width));
  }
  return;
}
