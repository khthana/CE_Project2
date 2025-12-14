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
#ifndef __ANUBISHAARSAMPLING_GUI_H__
#define __ANUBISHAARSAMPLING_GUI_H__

#include "anubis_common.h"
#include "anubis_face_graph_measure.h"
#include "anubis_haar_data_sampling.h"

BEGIN_C_DECLS

#define ANUBISHAARSAMPLING_FACE_DETECT_PIXMAP   "indicate_circle_red_20.xpm"
#define ANUBISHAARSAMPLING_FACE_GRAPH_OK_PIXMAP "indicate_circle_blue_20.xpm"
#define ANUBISHAARSAMPLING_DUMMY_20_PIXMAP      "indicate_dummy_20.xpm"

#define ANUBISHAARSAMPLING_IMAGE_FNAME          "image"


typedef struct _AnubisHaarSamplingGui
{
  GtkWidget * window;
  GtkWidget * current_sim_geo_value_label;
  GtkWidget * current_track_sim_value_label;
  GtkWidget * correct_frames_label;
  
  AnubisPixmap face_detect_indicator_anubis_pixmap;
  AnubisPixmap face_graph_ok_indicator_anubis_pixmap;
  AnubisPixmap dummy_20_anubis_pixmap;
  
  MalibGtkDisplay * display;
  AnubisFaceGraphMeasure * fg_measure_filter;
  AnubisFaceGraphMeasure * track_fg_filter;
  AnubisHaarDataSampling * hsampling_filter;
  
} AnubisHaarSamplingGui;

typedef struct _AnubisHaarSamplingGuiUpdateClass{
  MalibFilterClass super;
} AnubisHaarSamplingGuiUpdateClass;

typedef struct _AnubisHaarSamplingGuiUpdate{
  MalibFilter super;
  AnubisHaarSamplingGui* gui;

  RecogByJets * jets_filter;
  AnubisCVHaarDetectObj * haar_filter;
  AnubisFaceGraphMeasure * fg_measure_filter;
  AnubisFaceGraphMeasure * track_fg_filter;
  AnubisHaarDataSampling * hsampling_filter;
} AnubisHaarSamplingGuiUpdate;


AnubisHaarSamplingGui* anubishaarsampling_gui_new(MalibGtkDisplay* display,
						AnubisFaceGraphMeasure* fg_measure_filter,
						AnubisFaceGraphMeasure* track_fg_filter,
						AnubisHaarDataSampling* hsampling_filter);

AnubisHaarSamplingGuiUpdate*
anubishaarsampling_gui_update_new_with_buf (MalibBuffer* buf,
					   AnubisCVHaarDetectObj* haar_filter,
					   RecogByJets* jets_filter,
					   AnubisFaceGraphMeasure* fgm_filter,
					   AnubisFaceGraphMeasure* track_fg_filter,
					   AnubisHaarDataSampling* hsampling_filter);

void anubishaarsampling_enter_correct_frames_button_clicked(GtkButton* button, AnubisHaarSamplingGui* gui);
void anubishaarsampling_clear_correct_frames_button_clicked(GtkButton* button, AnubisHaarSamplingGui* gui);

/*
void
anubis_haar_data_sampling_save_xml_file(AnubisHaarDataSampling* filter, char* xml_fname);
*/

END_C_DECLS

#endif /* __ANUBISHAARSAMPLING_GUI_H__ */
