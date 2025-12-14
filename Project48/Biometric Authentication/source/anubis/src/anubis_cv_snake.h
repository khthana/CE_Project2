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
#ifndef __ANUBIS_CV_SNAKE_H__
#define __ANUBIS_CV_SNAKE_H__

#include <malib/malib.h>
BEGIN_C_DECLS

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */

#include <opencv/cv.h>
#include "anubis_common.h"
#include "gaborrg_recog.h"

typedef struct _AnubisCVSnake{
  MalibFilter super;
} AnubisCVSnake;

typedef struct _AnubisCVSnakeClass{
  MalibFilterClass super;
} AnubisCVSnakeClass;

AnubisCVSnake*
anubis_cv_snake_new();
AnubisCVSnake*
anubis_cv_snake_new_with_buf (MalibBuffer* gray_buf);

END_C_DECLS
#endif /* __ANUBIS_CV_SNAKE_H__ */
