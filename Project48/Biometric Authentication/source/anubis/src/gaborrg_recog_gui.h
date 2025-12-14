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
#ifndef __GABORRG_RECOG_GUI_H__
#define __GABORRG_RECOG_GUI_H__

#include <malib/malib.h>
#include "../glade_gui_src/glade_interface.h"
#include "../glade_gui_src/glade_support.h"

BEGIN_C_DECLS
typedef struct _GrrGui GrrGui;
#include "gaborrg_recog.h"
#include "gaborrg_recog_file_io.h"

struct _GrrGui
{
  GtkWidget * window;
  MalibGtkDisplay ** displays;
  MalibBuffer * gray_buffer;
  GrrXmlGaborRg * gaborrg;
  MalibGabor ** malib_gabors;

  int main_display_num;
};

GrrGui* grr_gui_new(MalibGtkDisplay**, MalibBuffer*);  
void grr_gui_setup (GrrGui*, MalibObject*);
void grr_on_toggle_running_clicked(GtkButton* button, GrrGui*    gui);
END_C_DECLS
#endif /*__GABORRG_RECOG_GUI_H__ */
