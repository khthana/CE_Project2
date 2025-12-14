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
#ifndef __GABORRG_RECOG_H__
#define __GABORRG_RECOG_H__

#include <stdio.h>
#include <assert.h>
#include <malib/malib.h>
BEGIN_C_DECLS
typedef enum _GrrGaborScale GrrGaborScale;
#include "anubis_common.h"
#include "recog_by_gabor.h"
#include "node_data.h"


#define BTTV_DEFAULT_WIDTH  320
#define BTTV_DEFAULT_HEIGHT 240
#define GRR_DEFAULT_XML_FILE "gaborrg.xml"

#define GABORRG_RECOG_DEFAULT_DIR_ARRAY {0,30,60,90,120}
#define GABORRG_RECOG_DEFAULT_RAD_ARRAY {4, 8,16}
/* #define GABORRG_RECOG_DEFAULT_RAD_ARRAY {4,8} */

#define GABORRG_RECOG_DEFAULT_SEARCH_RADIUS 30

enum _GrrGaborScale{
  GRR_GABOR_FULL= 0,
  GRR_GABOR_HALF,
  GRR_GABOR_QUARTER
};

END_C_DECLS
#endif /* __GABORRG_RECOG_H__ */
