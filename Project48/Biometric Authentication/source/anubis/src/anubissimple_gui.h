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
#ifndef __ANUBISSIMPLE_GUI_H_
#define __ANUBISSIMPLE_GUI_H_

#include <malib/malib.h>
#include "../glade_gui_src/glade_interface.h"
#include "../glade_gui_src/glade_support.h"

BEGIN_C_DECLS

#define BTTV_DEFAULT_WIDTH  320
#define BTTV_DEFAULT_HEIGHT 240

#include "anubis_common.h"
#include "anubis_cv_gtkdisplay.h"

typedef struct _AnubisSimpleGui
{
  GtkWidget * window;
  //MalibGtkDisplay * display;
  AnubisCVGtkDisplay * display;
}AnubisSimpleGui;

//AnubisSimpleGui* anubis_simple_gui_new(AnubisCVGtkDisplay*, MalibBuffer*);
AnubisSimpleGui* anubissimple_gui_new (AnubisCVGtkDisplay* display);
void anubissimple_gui_set_title (AnubisSimpleGui* gui, char* title);
#endif /* __ANUBISSIMPLE_GUI_H_ */
