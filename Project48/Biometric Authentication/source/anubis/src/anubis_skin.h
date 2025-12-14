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
#ifndef __ANUBIS_SKIN_H__
#define __ANUBIS_SKIN_H__

#include <config.h>
#include <malib/malib.h>
#include <malib/buffer.h>
#include <malib/filter.h>

BEGIN_C_DECLS

typedef struct _AnubisSkinRectangle AnubisSkinRectangle;
typedef struct _AnubisSkin          AnubisSkin;
typedef struct _AnubisSkinClass     AnubisSkinClass;

#define FACE_REGION_BLOCKSIZE 		2
#define FACE_REGION_BLOB_THRESHOLD 	1000

/* mask size is (2 * MASK_OFFSET + 1)^2 */
#define FACE_REGION_MASK_OFFSET 	1
#define FACE_REGION_THRESHOLD		0.3

/* face pixel definition by oval */
#define FACE_REGION_DEFAULT_ALPHA_MEAN	0.58
#define FACE_REGION_DEFAULT_BETA_MEAN	0.34
#define FACE_REGION_ALPHA_COEF		0.06
#define FACE_REGION_BETA_COEF		0.08

/* display method control */
//#define FACE_REGION_DISPLAY_BOUNDINGBOX
//#define FACE_REGION_SHADE_INPUTIMAGE
#define FACE_REGION_HIDE_INPUTIMAGE

struct _AnubisSkinRectangle
{
  int			min_x, min_y, max_x, max_y;
};

struct _AnubisSkin
{
  MalibFilter super;
    /* candidate grid and region masks */
  int*			score;
  int*			mask;

  /* for calculating face region... */
  int 			width, height;
  int 			column, row;
  AnubisSkinRectangle	closure;

  /* for discriminating face pixels... */
  double		a_mean, b_mean;
  double		a_coef, b_coef;

};

struct _AnubisSkinClass
{
  MalibFilterClass super;
};

AnubisSkin* anubis_skin_new();
AnubisSkin* anubis_skin_new_with_buf(MalibBuffer* buf);
void anubis_skin_set_buffer (AnubisSkin* filter, MalibBuffer* buf);

void
face_region_set_color_params (AnubisSkin* filter,
			      double a_mean, double b_mean,
			      double a_coef, double b_coef);
void
face_region_get_color_params (AnubisSkin* filter,
			      double* a_mean_p, double* b_mean_p,
			      double* a_coef_p, double* b_coef_p);


END_C_DECLS
#endif /* __ANUBIS_SKIN_H__ */
