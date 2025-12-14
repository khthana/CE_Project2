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
#ifndef __ANUBISRECOG_GUI_H__
#define __ANUBISRECOG_GUI_H__

#include <malib/malib.h>
#include <stdio.h>
#include <assert.h>

BEGIN_C_DECLS
#define BTTV_DEFAULT_WIDTH  320
#define BTTV_DEFAULT_HEIGHT 240

#include "../glade_gui_src/glade_interface.h"
#include "../glade_gui_src/glade_support.h"
#include "anubis_color_config.h"
#include "anubis_face_graph_measure.h"
#include "anubis_cv_gtkdisplay.h"

#define ANUBISRECOG_DISPLAY_CONF 0
#define ANUBISRECOG_DISPLAY_JETS 2
/*#define ANUBISRECOG_DISPLAY_MARK */

#define ANUBISRECOG_FACE_DETECT_PIXMAP "indicate_circle_red_20.xpm"
#define ANUBISRECOG_NAME_DETECT_PIXMAP "indicate_circle_blue_20.xpm"
#define ANUBISRECOG_DUMMY_20_PIXMAP    "indicate_dummy_20.xpm"

#define ANUBISRECOG_MAIN_DISPLAY_NUM 0

typedef struct _AnubisRecogGui AnubisRecogGui;
typedef enum   _AnubisRecogDisplayType AnubisRecogDisplayType;

struct _AnubisRecogGui
{
  GtkWidget * window;
  GtkWidget * face_detect_indicator;
  GtkWidget * name_detect_indicator;
  GtkWidget * last_name_label;
  GtkWidget * current_name_label;
  GtkWidget * current_similar_value_label;
  GtkWidget * current_sim_jet_value_label;
  GtkWidget * current_sim_geo_value_label;
  
  GtkWidget * name_threshold_h_scale;

  AnubisPixmap face_detect_indicator_anubis_pixmap;
  AnubisPixmap name_detect_indicator_anubis_pixmap;
  AnubisPixmap dummy_20_anubis_pixmap;
  
  MalibGtkDisplay ** displays;
  MalibGtkDisplay * display;
  MalibSource     ** filters;
  MalibSource      * c_conf_filter;
  AnubisFaceGraphMeasure * fg_measure_filter;
  
};

AnubisRecogGui* anubisrecog_gui_new (MalibGtkDisplay* display,
				   MalibSource* c_conf_filter,
				   AnubisFaceGraphMeasure* fg_measure_filter);

#endif /* __ANUBISRECOG_GUI_H__ */

