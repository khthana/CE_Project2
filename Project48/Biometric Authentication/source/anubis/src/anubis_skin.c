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
#include "anubis_skin.h"

/* private function prototypes **************************************/
static void anubis_skin_write_frame_data (AnubisSkin* filter,
					 MalibFrame* frame);

static void anubis_skin_create_params (AnubisSkin* filter);

static
void
face_region_calc_block_score (AnubisSkin* filter, int* input_image);

static
int
face_region_fill_label (AnubisSkin* filter, int i, int label);

static
int
face_region_labeling (AnubisSkin* filter, int* pix_num);

static 
void
face_region_dispose_small_blob (AnubisSkin* filter, int* pix_num);

static void face_region_calc_bounding_box (AnubisSkin* filter,
					   int label, AnubisSkinRectangle* closure);
static int face_region_sum_of_valid_pixel (AnubisSkin* filter,
					   int x0, int y0);
static void face_region_calc_mask (AnubisSkin* filter);
static void face_region_find_face_candidate (AnubisSkin* filter);
static void face_region_calc_a_b_center (AnubisSkin* filter,
					 int* input_image);
static void face_region_clear_mask (AnubisSkin* filter, 
				    AnubisSkinRectangle* closure);
static void face_region_draw_output (AnubisSkin* filter,
				     int* input_image, unsigned char* output);

/* virtual function table *******************************************/
static AnubisSkinClass anubis_skin_class=
{
  (void (*)(MalibObject*)) 	     	 malib_filter_delete,
  (void (*)(MalibSource*, MalibFrame*))  anubis_skin_write_frame_data
};

AnubisSkin*
anubis_skin_new()
{
  MALIB_FILTER_GENERIC_NEW (AnubisSkin, &anubis_skin_class,
			    MALIB_FRAME_COLORMODEL_RGB);
}

AnubisSkin*
anubis_skin_new_with_buf (MalibBuffer* buf)
{
  MALIB_FILTER_GENERIC_NEW_WITH_BUF (AnubisSkin, anubis_skin_new,
				     anubis_skin_set_buffer, buf);
}

void
anubis_skin_set_buffer (AnubisSkin* filter, MalibBuffer* buf)
{
  MalibFrame* prev_frame;
  int width, height, column, row;

  g_return_if_fail (filter && buf);

  /* allocate and clear memory region for the score array */
  prev_frame = malib_buffer_get_current_frame (buf);
  filter->width  = width  = prev_frame->width;
  filter->height = height = prev_frame->height;
  filter->column = column = width  / FACE_REGION_BLOCKSIZE;
  filter->row    = row    = height / FACE_REGION_BLOCKSIZE;

  if (filter->score)
    {
      free (filter->score);
    }

  if (filter->mask)
    {
      free (filter->mask);
    }

  filter->score = (int*)  malloc (column * row * sizeof (int));
  filter->mask  = (int*) malloc (column * row * sizeof (int));
  memset (filter->score, 0, column * row * sizeof (int));
  memset (filter->mask,  0, column * row * sizeof (int));
  
  /* initialization */
  filter->a_mean = FACE_REGION_DEFAULT_ALPHA_MEAN;
  filter->b_mean = FACE_REGION_DEFAULT_BETA_MEAN;
  filter->a_coef = FACE_REGION_ALPHA_COEF;
  filter->b_coef = FACE_REGION_BETA_COEF;

  /* set the frame_info and others... */
  malib_filter_set_buffer_with_colormodel ((AnubisSkin*)filter, buf,
					   MALIB_FRAME_COLORMODEL_BW);
}

static void
anubis_skin_create_params (AnubisSkin* filter){
  return;
}

void
face_region_set_color_params (AnubisSkin* filter,
			      double a_mean, double b_mean,
			      double a_coef, double b_coef)
{
  g_return_if_fail ( filter );
  g_return_if_fail (    (0.0 <= a_mean) && (a_mean <= 1.0)
		     && (0.0 <= b_mean) && (b_mean <= 1.0)
		     && (0.0 < a_coef)  && (a_coef < 1.0)
		     && (0.0 < b_coef)  && (b_coef < 1.0)  );

  filter->a_mean = a_mean;
  filter->b_mean = b_mean;
  filter->a_coef = a_coef;
  filter->b_coef = b_coef;
}

void
face_region_get_color_params (AnubisSkin* filter,
			      double* a_mean_p, double* b_mean_p,
			      double* a_coef_p, double* b_coef_p)
{
  g_return_if_fail ( filter == NULL );

  *a_mean_p = filter->a_mean;
  *b_mean_p = filter->b_mean;
  *a_coef_p = filter->a_coef;
  *b_coef_p = filter->b_coef;
}

/* private functions ************************************************/
static void
face_region_delete (AnubisSkin* filter)
{
  if (filter->score)
    {
      free (filter->score);
    }

  if (filter->mask)
    {
      free (filter->mask);
    }

  malib_filter_delete ((MalibFilter*) filter);
}

static void
anubis_skin_write_frame_data (AnubisSkin* filter, MalibFrame* frame)
{
  g_return_if_fail (filter && frame);
  g_return_if_fail (((MalibFilter*)filter)->buf && frame->data);

  malib_filter_preprocess ((MalibFilter*)filter, frame);
  
  {
    int* from;
    unsigned char* to;

    from = malib_buffer_get_current_frame(((MalibFilter*)filter)->buf) ->data;
    to   = frame->data;

    /* phase 1: calculate block region score */
    face_region_calc_block_score (filter, from);

    /* phase 2: score pixels & make mask pattern */
    face_region_calc_mask (filter);

    /* phase 3: blushup mask pattern & find face region */
    face_region_find_face_candidate (filter);

    /* phase 4: draw output region */
    face_region_draw_output (filter, from, to); 
    /*to= from;*/
    g_print("filter a_mean %f, b_mean %f, a_coef %f, b_coef %f\n",
	    filter->a_mean, filter->b_mean, filter->a_coef, filter->b_coef);
  }
}

#define FACE_REGION_OUT_OF_OVAL(a, b) \
( ( (a - a_mean) * (a - a_mean) / (a_coef * a_coef) ) \
 + ( (b - b_mean) * (b - b_mean) / (b_coef * b_coef) ) > 1.0 )

static
void
face_region_calc_block_score (AnubisSkin* filter, int* input_image)
{
  int x, y, dx, dy;
  int i = 0;
  int width  = filter->width;
  int height = filter->height;
  double a_mean = filter->a_mean;
  double b_mean = filter->b_mean;
  double a_coef = filter->a_coef;
  double b_coef = filter->b_coef;

  for (y = 0; y < height; y += FACE_REGION_BLOCKSIZE)
    for (x = 0; x < width; x += FACE_REGION_BLOCKSIZE)
      {
	int n = 0;
	
	for (dy = 0; dy < FACE_REGION_BLOCKSIZE; dy++)
	  for (dx = 0; dx < FACE_REGION_BLOCKSIZE; dx++)
	    {
	      float r, g, b;
	      int pixel;
	      float r1, g1, b1, alpha, beta;
	      
	      /* current pixel */
	      pixel = ( (x+dx + (y+dy) * width)
			* MALIB_FRAME_DEFAULT_NUM_COLORS_RGB );
	  
	      /* input image pixel value */
	      r = (float) input_image [pixel + 0];
	      g = (float) input_image [pixel + 1];
	      b = (float) input_image [pixel + 2];
	      
	      r1 = r / (r + g + b + 1);
	      g1 = g / (r + g + b + 1);
	      b1 = b / (r + g + b + 1);
	      alpha = r1 + g1 / 2.0;
	      beta  = 2.3620679 * g1 / 2.0;
	      /* skip if the value of (alpha, beta) is out of range */
	      if ( FACE_REGION_OUT_OF_OVAL (alpha, beta) ) continue;

	      n++;
	    }
	filter->score [ i++ ] = n;
      }
}

#define FACE_REGION_FILL_LABEL(i) \
(filter->mask [i] == 1) ? face_region_fill_label (filter, i, label) : 0;

static
int
face_region_fill_label (AnubisSkin* filter, int i, int label)
{
  int column = filter->column;
  int pixels = 1;

  filter->mask [i] = label;

  pixels += FACE_REGION_FILL_LABEL (i-1);
  pixels += FACE_REGION_FILL_LABEL (i+1);
  pixels += FACE_REGION_FILL_LABEL (i-column-1);
  pixels += FACE_REGION_FILL_LABEL (i-column);
  pixels += FACE_REGION_FILL_LABEL (i-column+1);
  pixels += FACE_REGION_FILL_LABEL (i+column-1);
  pixels += FACE_REGION_FILL_LABEL (i+column);
  pixels += FACE_REGION_FILL_LABEL (i+column+1);

  return pixels;
}

static
int
face_region_labeling (AnubisSkin* filter, int* pix_num)
{
  int x, y, i;
  int column = filter->column;
  int row    = filter->row;

  /* filter->mask[i] == 0     : unmasked pixel               */
  /* filter->mask[i] == 1     : masked pixel (not processed) */
  /* filter->mask[i] == label : masked pixel (processed)     */
  int label = 2;
  int pixels;

  int max_pixel = 0;
  int max_pixel_index;

  i = FACE_REGION_MASK_OFFSET * column + FACE_REGION_MASK_OFFSET;

  for (y = FACE_REGION_MASK_OFFSET;
       y < row - FACE_REGION_MASK_OFFSET; y++, 
	 /* skip right end and left end of the next line */
	 i += 2 * FACE_REGION_MASK_OFFSET )

    for (x = FACE_REGION_MASK_OFFSET;
	 x < column - FACE_REGION_MASK_OFFSET; x++, i++)
      {
	/* If the point is not valid or already labeled, do nothing. */
	if ((filter->mask [i] == 0) || (filter->mask [i] > 1)) continue;

	/* fill region with label */
	pixels = face_region_fill_label (filter, i, label);
	pix_num [label]
	  = (pixels > FACE_REGION_BLOB_THRESHOLD) ? pixels : 0;

	if (pixels > max_pixel) 
	  {
	    max_pixel = pixels;
	    max_pixel_index = label;
	  }

	label++;
      }

  /* mark the last */
  pix_num [label] = -1;

  return max_pixel_index;
}

static
void
face_region_dispose_small_blob (AnubisSkin* filter, int* pix_num)
{
  int x, y, i;
  int column = filter->column;
  int row    = filter->row;

  /* clear small blobs */
  i = FACE_REGION_MASK_OFFSET * column + FACE_REGION_MASK_OFFSET;

  for (y = FACE_REGION_MASK_OFFSET;
       y < row - FACE_REGION_MASK_OFFSET; y++, 
	 /* skip right end and left end of the next line */
	 i += 2 * FACE_REGION_MASK_OFFSET )

    for (x = FACE_REGION_MASK_OFFSET;
	 x < column - FACE_REGION_MASK_OFFSET; x++, i++)
      {
	if (filter->mask [i] == 0) continue;
	if (pix_num [ filter->mask [i] ] == 0)
	  {
	    filter->mask [i] = 0;
	  }
      }
}

static void
face_region_calc_bounding_box (AnubisSkin* filter, int label,
			       AnubisSkinRectangle* closure)
{
  int x, y, i;
  int column = filter->column;
  int row    = filter->row;
  int min_x, max_x, min_y, max_y;
  
  min_x = column;
  min_y = row;
  max_x = 0;
  max_y = 0;

  i = FACE_REGION_MASK_OFFSET * column + FACE_REGION_MASK_OFFSET;

  for (y = FACE_REGION_MASK_OFFSET;
       y < row - FACE_REGION_MASK_OFFSET; y++, 
	 /* skip right end and left end of the next line */
	 i += 2 * FACE_REGION_MASK_OFFSET )

    for (x = FACE_REGION_MASK_OFFSET;
	 x < column - FACE_REGION_MASK_OFFSET; x++, i++)
      {
	if (filter->mask [i] != label) continue;
	if (x < min_x) min_x = x;
	if (x > max_x) max_x = x;
	if (y < min_y) min_y = y;
	if (y > max_y) max_y = y;
      }	

  closure->min_x = min_x;
  closure->max_x = max_x;
  closure->min_y = min_y;
  closure->max_y = max_y;
}

static 
int
face_region_sum_of_valid_pixel (AnubisSkin* filter, int x0, int y0)
{
  int x, y, sum = 0;
  int column = filter->column;

  for (y = y0 - FACE_REGION_MASK_OFFSET;
       y <= y0 + FACE_REGION_MASK_OFFSET; y++)
    for (x = x0 - FACE_REGION_MASK_OFFSET;
	 x <= x0 + FACE_REGION_MASK_OFFSET; x++)
      {
	sum += filter->score [(y * column) + x];
      }

  return sum;
}

static 
void
face_region_calc_mask (AnubisSkin* filter)
{
  int i, th, x, y;
  int column = filter->column;
  int row = filter->row;

  th = ( FACE_REGION_BLOCKSIZE * (2 * FACE_REGION_MASK_OFFSET + 1)
	 * FACE_REGION_BLOCKSIZE * (2 * FACE_REGION_MASK_OFFSET + 1)
	 * FACE_REGION_THRESHOLD );

  /* clear mask */
  memset (filter->mask,  0, column * row * sizeof (int));

  i = FACE_REGION_MASK_OFFSET * column + FACE_REGION_MASK_OFFSET;

  for (y = FACE_REGION_MASK_OFFSET;
       y < row - FACE_REGION_MASK_OFFSET; y++, 
	 /* skip right end and left end of the next line */
	 i += 2 * FACE_REGION_MASK_OFFSET )

    for (x = FACE_REGION_MASK_OFFSET;
	 x < column - FACE_REGION_MASK_OFFSET; x++, i++)
      {
	if ( face_region_sum_of_valid_pixel (filter, x, y) > th )
	  {
	    filter->mask [i] = 1;
	  }
      }
}

static 
void
face_region_find_face_candidate (AnubisSkin* filter)
{
  int i;
  int column = filter->column;
  int row = filter->row;
  int pix_num [row * column];
  AnubisSkinRectangle closure;
  int face_candidate_label;
  
  face_candidate_label = face_region_labeling (filter, pix_num);
  face_region_dispose_small_blob (filter, pix_num);
  
  /* flush noise elements within each blobs */
  filter->closure.min_x = 0;
  filter->closure.max_x = 0;
  filter->closure.min_y = 0;
  filter->closure.max_y = 0;
  
  for (i = 2; pix_num [i] != -1; i++)
    {
      if (pix_num [i] == 0) continue;
      
      face_region_calc_bounding_box (filter, i, &closure);
      face_region_clear_mask (filter, &closure);
      
      if (i == face_candidate_label)
	{
	  filter->closure.min_x = closure.min_x * FACE_REGION_BLOCKSIZE;
	  filter->closure.max_x = closure.max_x * FACE_REGION_BLOCKSIZE;
	  filter->closure.min_y = closure.min_y * FACE_REGION_BLOCKSIZE;
	  filter->closure.max_y = closure.max_y * FACE_REGION_BLOCKSIZE;
	}
    }
}

static 
void
face_region_calc_a_b_center (AnubisSkin* filter, int* input_image)
{
  int x, y, dx, dy;
  int x0 = filter->closure.min_x;
  int x1 = filter->closure.max_x;
  int y0 = filter->closure.min_y;
  int y1 = filter->closure.max_y;
  int width  = filter->width;
  int column = filter->column;
  double sum_alpha  = 0.0;
  double sum_beta   = 0.0;
  int n = 0;

  for (y = y0; y < y1; y += FACE_REGION_BLOCKSIZE)
    for (x = x0; x < x1; x += FACE_REGION_BLOCKSIZE)
      {
	if ( filter->mask [ ( ( x + y * column ) 
			     / FACE_REGION_BLOCKSIZE ) ] <= 0 ) 
	  {
	    continue;
	  }

	for (dy = 0; dy < FACE_REGION_BLOCKSIZE; dy++)
	  for (dx = 0; dx < FACE_REGION_BLOCKSIZE; dx++)
	    {
	      float r, g, b;
	      int pixel;
	      float r1, g1, b1;

	      /* current pixel */
	      pixel = ( (x+dx + (y+dy) * width)
			* MALIB_FRAME_DEFAULT_NUM_COLORS_RGB );
	      
	      /* input image pixel value */
	      r = (float) input_image [pixel + 0];
	      g = (float) input_image [pixel + 1];
	      b = (float) input_image [pixel + 2];
	      
	      r1 = r / (r + g + b + 1);
	      g1 = g / (r + g + b + 1);
	      b1 = b / (r + g + b + 1);
	      sum_alpha += r1 + g1 / 2.0;
	      sum_beta  += 2.3620679 * g1 / 2.0;

	      n++;
	    }
      }

  if (n > 0)
    {
      double a_mean  = sum_alpha / n;
      double b_mean  = sum_beta  / n;
      
      filter->a_mean = a_mean;
      filter->b_mean = b_mean;
    }
}

static 
void
face_region_clear_mask (AnubisSkin* filter, AnubisSkinRectangle* closure)
{
  int x, y, i;
  int column = filter->column;
  int x0 = closure->min_x;
  int x1 = closure->max_x;
  int y0 = closure->min_y;
  int y1 = closure->max_y;

  /* 1st, clean from left end and right end. */
  for (y = y0; y < y1; y++)
    {
      i = y * column + x0;
      for (x = x0; x < x1; x++, i++)
	{
	  if (filter->mask [i] > 0) break;
	  (filter->mask [i])--;
	}
      i = y * column + x1;
      for (x = x1; x > x0; x--, i--)
	{
	  if (filter->mask [i] > 0) break;
	  (filter->mask [i])--;
	}
    }
	 
  /* 2nd, clean from top end and bottom end. */
  for (x = x0; x < x1; x++)
    {
      i = y0 * column + x;
      for (y = y0; y < y1; y++, i += column)
	{
	  if (filter->mask [i] > 0) break;
	  (filter->mask [i])--;
	}
      i = y1 * column + x;
      for (y = y1; y > y0; y--, i -= column)
	{
	  if (filter->mask [i] > 0) break;
	  (filter->mask [i])--;
	}
    }	  

  /* last, clean up cells of unleached from more than two sides. */
  for (y = y0; y < y1; y++)
    for (x = x0; x < x1; x++)
      {
        i = y * column + x;
        filter->mask [i] = (filter->mask [i] > -2) ? 1 : 0;
      }
}

#define MASK_VALUE 	( 1 << MALIB_FRAME_DEFAULT_DEPTH_RGB ) -1
#define NEIGBORS_MASK(u, v) \
(filter->mask [ ((x+dx+u)/FACE_REGION_BLOCKSIZE) \
  + ((y+dy+v)/FACE_REGION_BLOCKSIZE) * (width / FACE_REGION_BLOCKSIZE) ] > 0)
		  


static 
void
face_region_draw_output (AnubisSkin* filter,
			 int* input_image, unsigned char* output_image)
{
  int x, y, dx, dy;
  int i = 0;
  int width  = filter->width;
  int height = filter->height;
    
  /* clear output image */
  memset (output_image, 0, (width * height * sizeof (unsigned char) ) );

  /* draw image */
  for (y = 0; y < height; y += FACE_REGION_BLOCKSIZE)
    for (x = 0; x < width; x += FACE_REGION_BLOCKSIZE, i++)
      {
	if ( filter->mask [i] <= 0 ){
	  continue;
	}
	
	for (dy = 0; dy < FACE_REGION_BLOCKSIZE; dy++)
	  for (dx = 0; dx < FACE_REGION_BLOCKSIZE; dx++)
	    {
	      /* current pixel */

	      int pixel_in = ( (x+dx + (y+dy) * width) *
			       MALIB_FRAME_DEFAULT_NUM_COLORS_RGB );
	      /*
		int pixel_out = ( (x+dx + (y+dy) * width)
		* MALIB_FRAME_DEFAULT_NUM_COLORS_RGB_A );
	      */

	      int pixel_out= (x+dx + (y+dy) * width);
			       

	      int alpha = 0;
	      int u, v;
	      for (u = -FACE_REGION_BLOCKSIZE; u <= FACE_REGION_BLOCKSIZE; u++)
		for (v = -FACE_REGION_BLOCKSIZE; v <= FACE_REGION_BLOCKSIZE; v++)
		  {
		    alpha += NEIGBORS_MASK( u, v) ? MASK_VALUE : 0;
		  }
	      alpha /= ( (2*FACE_REGION_BLOCKSIZE + 1)
			 * (2*FACE_REGION_BLOCKSIZE + 1) );

	      /* copy input image pixel value */
	      /*
	      output_image [pixel_out + 0] = input_image [pixel_in + 0];
	      output_image [pixel_out + 1] = input_image [pixel_in + 1];
	      output_image [pixel_out + 2] = input_image [pixel_in + 2];
	      output_image [pixel_out + 3] = alpha;
	      */
	      /* my changed for mask */
	      output_image[pixel_out]= 1;
	    }
      }
}
