/*
 * Anubis
 * Copyright (c) 2005 Atsushi Suga
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
#include <gtk/gtk.h>


void
dummy_on_toggle_running_clicked        (GtkButton       *button,
                                        gpointer         user_data);

void
on_output_file_browse_clicked_dummy    (GtkButton       *button,
                                        gpointer         user_data);

void
on_data_output_button_clicked_dummy    (GtkButton       *button,
                                        gpointer         user_data);

void
on_data_type_enter_button_clicked_dummy
                                        (GtkButton       *button,
                                        gpointer         user_data);

void
on_data_type_rbu_gmag_clicked_dummy    (GtkButton       *button,
                                        gpointer         user_data);

void
on_data_type_rbu_jet_clicked_dummy     (GtkButton       *button,
                                        gpointer         user_data);

void
on_output_fileselection_ok_clicked_dummy
                                        (GtkButton       *button,
                                        gpointer         user_data);

void
on_output_fileselection_cancel_clicked_dummy
                                        (GtkButton       *button,
                                        gpointer         user_data);

gboolean
on_alpha_progressbar_button_press_event_dummy
                                        (GtkWidget       *widget,
                                        GdkEventButton  *event,
                                        gpointer         user_data);

gboolean
on_alpha_hscale1_button_press_event_dummy
                                        (GtkWidget       *widget,
                                        GdkEventButton  *event,
                                        gpointer         user_data);
