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

#ifndef __ANUBISRECOG_GUI_UPDATE_H__
#define __ANUBISRECOG_GUI_UPDATE_H__

#include <malib/malib.h>

BEGIN_C_DECLS

#include "anubisrecog_gui.h"
#include "recog_by_jets.h"
#include "anubis_cv_haar_detect_obj.h"
#include "anubis_face_graph_measure.h"

typedef struct _AnubisrecogGuiUpdateClass{
  MalibFilterClass super;
} AnubisrecogGuiUpdateClass;

typedef struct _AnubisrecogGuiUpdate{
  MalibFilter super;

  RecogByJets * jets_filter;

  AnubisCVHaarDetectObj * haar_filter;

  AnubisFaceGraphMeasure * fg_measure_filter;

  AnubisRecogGui * gui;

} AnubisrecogGuiUpdate;

AnubisrecogGuiUpdate*
anubisrecog_gui_update_new_with_buf (MalibBuffer* buf,
				    AnubisCVHaarDetectObj* haar_filter,
				    RecogByJets* jets_filter,
				    AnubisFaceGraphMeasure* fgm_filter);


END_C_DECLS
#endif /* __ANUBISRECOG_GUI_UPDATE_H__ */
