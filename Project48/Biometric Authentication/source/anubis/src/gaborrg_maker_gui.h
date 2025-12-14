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
#ifndef __GABORRG_MAKER_GUI_H__
#define __GABORRG_MAKER_GUI_H__
/* the main hedder file
 *
 * note:
 * GRM means GaborRgMaker
 */


#include <malib/malib.h>

/*
#include "../glade_gui_src/glade_support.h"
#include "../glade_gui_src/glade_interface.h"
*/

BEGIN_C_DECLS
typedef struct _GrmGui GrmGui;
typedef struct _GrmFileIOGui GrmFileIOGui;
#include "anubis_common.h"
#include "node_data.h"
#include "gaborrg_maker_file_io_gui.h"
#include "csuCommonImage.h"
#include "csuCommonUtil.h"
#include "gaborrg_maker_ebgm.h"
#include "anubis_cv_haar_detect_obj.h"

#define BTTV_DEFAULT_WIDTH  320
#define BTTV_DEFAULT_HEIGHT 240


#define GABORRG_MAKER_INDICATOR_PIXMAP_NAME "indicate_red_10.xpm"
#define GABORRG_MAKER_INDICATOR_DUMMY_PIXMAP_NAME "indicate_dummy_10.xpm"
#define GABOR_DIR_NUM 5
#define GABOR_RAD_NUM 3
#define GABORRG_MAKER_DEFAULT_DIR_ARRAY {0,30,60,90,120}
#define GABORRG_MAKER_DEFAULT_RAD_ARRAY {4,8,16}
/*#define GABORRG_MAKER_DEFAULT_OUTPUT_FILE "gaborrg.xml"*/
#define GABORRG_MAKER_DEFAULT_FONT_PIXEL_WIDTH 10
#define GABORRG_MAKER_DEFAULT_INDICATOR_PIXEL_WIDTH 30

#define GRM_DEFAULT_RECOG_DATA_TYPE JET

#define GRM_DEFAULT_DISPLAY_NUM 0

enum recog_data_type { GABOR_MAG, JET };

struct _GrmFileIOGui
{
  GtkWidget* data_type_enter_button;
  GtkWidget* data_output_button;
  GtkWidget* output_file_entry;
  GtkWidget* output_file_browse_button;
  
  GtkWidget* output_fileselection;
  enum recog_data_type tmp_recog_data_type;
  enum recog_data_type recog_data_type;
};

struct _GrmGui
{
  GtkWidget*	window;
  MalibGtkDisplay** displays;
  MalibFilter*  filter;
  AnubisCVHaarDetectObj* haar_filter;
  MalibBuffer*  gray_buffer;/* for generating gabor_filter */

  MalibGabor**  malib_gabors;
  int*          gabor_dirs; /* gabor direction (360 degree) */
  int*          gabor_radius; /* gabor size */

  GrmFileIOGui file_io_gui;

  /* keeping gabor filtered data during window is halting */
  GrmNodeData *  tmp_node_data;
  GrmNodeData ** face_node_data;
  GrmFaceNodeDataStack * face_node_data_stack;
  void (* face_node_data_stack_output_file)(GrmGui* gui);
  
  struct _GrmEBGMData* ebgm_data;
  double resize_rate;
  
  int num_parts;
  char** parts_names;
  int max_parts_name_len; /* size of most longest name in char** parts_names */
   
  MalibFrame*   tmp_malib_to_frames[GABOR_DIR_NUM * GABOR_RAD_NUM + 1]; /* +1 for NULL */
  int           num_tmp_malib_to_frames;

  int last_corrected_x; /* last clicked corrected coordinate x from drawingarea1 */
  int last_corrected_y; /* last clicked corrected coordinate y from drawingarea1 */

  GdkPixmap*    parts_button_indicator_pixmap;
  GdkPixmap*    parts_button_indicator_dummy_pixmap;
  GdkBitmap*    parts_button_indicator_pixmap_mask;
  GdkBitmap*    parts_button_indicator_dummy_pixmap_mask;
  
  /* Fixme: now not written destroy func (parts_buttons,parts_button_indicators)
     , not necessary but not a good habbit
  */
  GtkWidget **  parts_buttons; 
  GtkWidget **  parts_button_indicators;/* indicator pixmap for each parts_buttons[i] */
  int*          parts_button_indicators_status;
  GtkWidget *   parts_enter_button;
  
  int halt_first_left_button; /* halting status
				 if before running or halted by right button set TRUE,
				 otherwise FALSE*/
  int halt_first_right_button;/* halting status if before running set TRUE otherwise set FALSE */

  GtkWidget * statusbar1;

};


GrmGui* gaborrg_maker_gui_new (MalibGtkDisplay**, MalibBuffer*,
			       MalibFilter*, AnubisCVHaarDetectObj* haar_filter);
void gaborrg_maker_gui_setup (GrmGui*, MalibObject*);
void drawingarea1_clicked (GtkWidget*, GdkEventButton*, GrmGui*);
int toggle_start_and_stop_drawarea_clicked (GrmGui*, GdkEventButton*);

void set_halt_status_drawarea_clicked(GrmGui *, GdkEventButton *);
void set_widget_status_drawarea_clicked(GrmGui*, GdkEventButton*);

int  get_corrected_clicked_coordinate_x(GtkWidget*, GdkEventButton*, GrmGui*);
int  get_corrected_clicked_coordinate_y(GtkWidget*, GdkEventButton*, GrmGui*);
void set_clicked_point_data_drawarea_clicked(GrmGui*, GdkEventButton*);
void message_to_statusbar_drawarea_clicked(GrmGui*, GdkEventButton*);

void right_scroll_window_setup(GrmGui*);
void parts_buttons_all_set_sensitive(GrmGui*,gboolean);
void parts_enter_button_clicked(GtkWidget*, GrmGui*);
void parts_button_clicked(GtkWidget*, GrmGui*);
void gaborrg_maker_set_parts_names_and_num_to_gui_from_default(GrmGui*);
void gaborrg_maker_parts_buttons_indicator_appear_or_not(GrmGui*,
							GtkWidget*,
							int*,int);
void gaborrg_maker_all_parts_buttons_indicator_appear_or_not(GrmGui*,
							    int);
gchar* get_button_label_string(GtkButton*);
END_C_DECLS
#endif /* __GABORRG_MAKER_GUI_H__ */
