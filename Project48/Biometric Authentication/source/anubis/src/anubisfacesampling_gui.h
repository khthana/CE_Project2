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
#ifndef __ANUBISFACESAMPLING_GUI_H__
#define __ANUBISFACESAMPLING_GUI_H__

#include <malib/malib.h>

BEGIN_C_DECLS

#include <assert.h>
#include <libxml2/libxml/parser.h>
#include <libxml2/libxml/tree.h>

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include "../glade_gui_src/glade_interface.h"
#include "../glade_gui_src/glade_support.h"

#include "recog_by_jets.h"
#include "anubis_common.h"
#include "gaborrg_maker_ebgm.h"


#define BTTV_DEFAULT_WIDTH  320
#define BTTV_DEFAULT_HEIGHT 240

#define ANUBISFACESAMPLING_MAIN_DISPLAY_NUM 0

typedef struct _AnubisfacesamplingGui
{
  GtkWidget * window;
  GtkWidget * enter_button;
  GtkWidget * name_entry;
  GtkWidget * save_button;
  GtkWidget * output_file_entry;
  /*GtkWidget * output_file_brouse_button;*/
  
  MalibGtkDisplay** displays;

  RecogByJets * rbj_filter;

  CvMemStorage * storage;
  CvSeq * face_graph_seq;
} AnubisfacesamplingGui;


AnubisfacesamplingGui* anubisfacesampling_gui_new(MalibGtkDisplay** displays, RecogByJets* rbj_filter);

END_C_DECLS

#endif /* __ANUBISFACESAMPLING_GUI_H__ */
