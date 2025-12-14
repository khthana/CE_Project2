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
#ifndef __RECOG_BY_EBGM_H__
#define __RECOG_BY_EBGM_H__

#include <malib/malib.h>
BEGIN_C_DECLS
typedef struct _RecogByEBGM RecogByEBGM;
typedef struct _RecogByEBGMClass RecogByEBGMClass;

#include "gaborrg_recog.h"
#include "gaborrg_recog_gui.h"
#include "csuCommonImage.h"
#include "csuCommonUtil.h"
#include "csuEBGMUtil.h"

struct _RecogByEBGM
{
  MalibFilter super;
};

struct _RecogByEBGMClass
{
  MalibFilter super;
};

RecogByEBGM* recog_by_ebgm_new ();
RecogByEBGM* recog_by_ebgm_write_frame_data (RecogByEBGM*, MalibFrame*);


RecogByEBGM* recog_by_ebgm_new_with_buf(MalibBuffer* buf);
void recog_by_ebgm_set_buffer (RecogByEBGM* filter, MalibBuffer* buf);

END_C_DECLS
#endif /* __RECOG_BY_EBGM_H__ */
