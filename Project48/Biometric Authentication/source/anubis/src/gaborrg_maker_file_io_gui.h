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
#ifndef __GABORRG_MAKER_FILE_IO_GUI_H__
#define __GABORRG_MAKER_FILE_IO_GUI_H__

#include <malib/malib.h>

#include "../glade_gui_src/glade_support.h"
#include "../glade_gui_src/glade_interface.h"

#include "gaborrg_maker_gui.h"
#include "config.h"
void gaborrg_maker_file_io_gui_setup(GrmGui*);
void on_data_output_button_clicked(GtkButton*, gpointer);
void on_output_file_browse_clicked(GtkButton*, gpointer);
void on_output_fileselection_ok_clicked(GtkButton*, gpointer);
void on_output_fileselection_cancel_clicked(GtkButton*, gpointer);
void my_gtk_widget_destroy(GtkWidget*, GtkWidget*);

#endif /* __GABORRG_MAKER_FILE_IO_GUI_H__ */
