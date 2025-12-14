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

#ifndef __MALIB_CV_GTKDISPLAY_H__
#define __MALIB_CV_GTKDISPLAY_H__

#include <gtk/gtk.h>
#include <gdk_imlib.h>
#include <malib/malib.h>
#include <malib/source.h>

#include "anubis_common.h"

BEGIN_C_DECLS
typedef struct _AnubisCVGtkDisplay AnubisCVGtkDisplay;
typedef struct _AnubisCVGtkDisplayClass AnubisCVGtkDisplayClass;

#include <malib/sink.h>

/**
 * @brief Sink (Destinaition) implementation to GTK+ window on screen.
 */
struct _AnubisCVGtkDisplay
{
  /** AnubisCVGtkDisplay contains MalibSink as its superclass */
  MalibSink 		super;

  /* drawing widget, image object, and pixmap to render the image */
  /** Drawarea widget for image data drawing. */
  GtkWidget*		drawarea;
  /** Image object to represnet image data. */
  GdkImlibImage*	im;
  /** Image pixmap to render the image. */
  GdkPixmap*		pixmap;

  unsigned char*	rgb24;

  /* screen updating function ID */
  guint			func_id;
};

/**
 * @brief Virtual function table for AnubisCVGtkDisplay.
 */
struct _AnubisCVGtkDisplayClass
{
  /** AnubisCVGtkDisplayClass contains MalibSinkClass as its superclass */
  MalibSinkClass	super;
};

/* constructor */
AnubisCVGtkDisplay*   anubis_cv_gtkdisplay_new ();
AnubisCVGtkDisplay*   anubis_cv_gtkdisplay_new_with_source (MalibSource* src);
AnubisCVGtkDisplay*   anubis_cv_gtkdisplay_new_for_embed (MalibSource* src);

/* accessors to internal gtk widget */
GtkWindow*	   anubis_cv_gtkdisplay_get_window (AnubisCVGtkDisplay* display);
GtkDrawingArea*	   anubis_cv_gtkdisplay_get_drawarea (AnubisCVGtkDisplay* display);

/* automatic frame updator using gtk_main() */
void 		   anubis_cv_gtkdisplay_auto_play (AnubisCVGtkDisplay* display);
void 		   anubis_cv_gtkdisplay_auto_play2 (AnubisCVGtkDisplay** displays);

/* for temporary */
void	  anubis_cv_gtkdisplay_delete (AnubisCVGtkDisplay* display);
void
gtk_wrap_anubis_cv_gtkdisplay_delete (GtkWidget* dummy, GdkEvent* dummy_event, AnubisCVGtkDisplay* disp);

END_C_DECLS
#endif /* __MALIB_CV_GTKDISPLAY_H__ */
