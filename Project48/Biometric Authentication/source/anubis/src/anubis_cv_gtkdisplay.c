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

#include "anubis_cv_gtkdisplay.h"

/* private function prototypes **************************************/
static AnubisCVGtkDisplay* anubis_cv_gtkdisplay_init (MalibSource* src, int create_window);
//static void	  anubis_cv_gtkdisplay_delete (AnubisCVGtkDisplay* display);
static inline GtkWidget* 
		  anubis_cv_gtkdisplay_gui_config (AnubisCVGtkDisplay* display, 
					       MalibFrame* frame, int create_window);
static int 	  anubis_cv_gtkdisplay_configure_event (GtkWidget* widget, GdkEventConfigure* event, 
						    AnubisCVGtkDisplay* display);
static int        anubis_cv_gtkdisplay_expose_event (GtkWidget* widget, GdkEventExpose* event, 
						 AnubisCVGtkDisplay* display);
static int	  anubis_cv_gtkdisplay_increment_frame (AnubisCVGtkDisplay* display);
static void	  anubis_cv_gtkdisplay_convert_rgb24 (AnubisCVGtkDisplay* display, 
						  MalibFrame* frame);
/* for test */
static int	  anubis_cv_gtkdisplay_debug (AnubisCVGtkDisplay* display);

/* virtual function table *******************************************/
static AnubisCVGtkDisplayClass anubis_cv_gtkdisplay_class = 
{
  (void (*)(MalibObject*)) 		anubis_cv_gtkdisplay_delete,
  (void (*)(MalibHolder*))		anubis_cv_gtkdisplay_increment_frame
};


/* public functions *************************************************/

/* constructor */
AnubisCVGtkDisplay*
anubis_cv_gtkdisplay_new ()
{
  return anubis_cv_gtkdisplay_new_with_source ((MalibSource*)0);
}

/* constructor with source object which are previousely linked */
AnubisCVGtkDisplay*
anubis_cv_gtkdisplay_new_with_source (MalibSource* src)
{
  g_return_if_fail (src);
  return anubis_cv_gtkdisplay_init (src, TRUE);
}

/* constructor with source object which are previousely linked */
AnubisCVGtkDisplay*
anubis_cv_gtkdisplay_new_for_embed (MalibSource* src)
{
  g_return_if_fail (src);
  return anubis_cv_gtkdisplay_init (src, FALSE);
}

/**
 * increment frames automatically, 
 * using gtk's idle thread in the gtk+ main loop.
 * display: the object to display.
 */
void
anubis_cv_gtkdisplay_auto_play (AnubisCVGtkDisplay* display)
{
  g_return_if_fail (display);

  display->func_id
    = gtk_idle_add ((GtkFunction)anubis_cv_gtkdisplay_increment_frame, 
		    (gpointer)display);

  gtk_main ();
}

/**
 * increment frames automatically, 
 * using gtk's idle thread in the gtk+ main loop.
 * displays: the array contains the objects to display.
 */
void
anubis_cv_gtkdisplay_auto_play2 (AnubisCVGtkDisplay** displays)
{
  AnubisCVGtkDisplay* display;

  g_return_if_fail (displays);

  {
    MalibSinkGroup* sgroup = malib_sinkgroup_new ();
    
    while (*displays != NULL)
      {
	display = *displays++;
	display->func_id = gtk_idle_add ((GtkFunction)anubis_cv_gtkdisplay_increment_frame, 
					 (gpointer)display);

	malib_sinkgroup_add_sink (sgroup, (MalibSink*)display);
      }
  }

  gtk_main ();
}

/**
 * accesor of Displayed Window
 */
GtkWindow*
anubis_cv_gtkdisplay_get_window (AnubisCVGtkDisplay* display)
{
  g_return_if_fail (display);

  return GTK_WINDOW (display -> drawarea -> parent -> parent -> parent);
}

/**
 * accesor of Draw Area
 */
GtkDrawingArea*
anubis_cv_gtkdisplay_get_drawarea (AnubisCVGtkDisplay* display)
{
  g_return_if_fail (display);

  return GTK_DRAWING_AREA (display -> drawarea);
}


/* private functions ************************************************/
/* object initialization routine called from Constructor */
static
AnubisCVGtkDisplay*
anubis_cv_gtkdisplay_init (MalibSource* src, int create_window)
{
  AnubisCVGtkDisplay* retptr;
  MalibFrame* frame;

  /* data allcation and initialization */
  retptr = (AnubisCVGtkDisplay*) malloc (sizeof(AnubisCVGtkDisplay));
  memset (retptr, 0, sizeof(AnubisCVGtkDisplay));
  malib_holder_config ((MalibHolder*)retptr, 1, src);
  malib_sink_init ((MalibSink*)retptr);

  /* get a reference frame from previously linked object(s) */
  frame = malib_source_get_frame_info (src);
  retptr->drawarea = anubis_cv_gtkdisplay_gui_config (retptr, frame, create_window);

  /* allocate some memory to store the display data */
  retptr->rgb24 = (unsigned char*) malloc (frame->width * frame->height 
					   * 3 * sizeof(unsigned char));

  /* set the virtual function table */
  MALIB_OBJECT_SET_VFUNC_TBL (retptr, &anubis_cv_gtkdisplay_class);
  return retptr;
}

/* destructor */
void
anubis_cv_gtkdisplay_delete (AnubisCVGtkDisplay* display)
{
  MalibFrame* frame;
  g_return_if_fail (display);

  /* free gtk objects  relating to this object, 
     and exit from gtk event loop */
  if (display->func_id > 0) gtk_idle_remove (display->func_id);
  if (display->pixmap) gdk_imlib_free_pixmap (display->pixmap);
  if (display->im) gdk_imlib_kill_image (display->im);
  gtk_object_destroy (GTK_OBJECT (display->drawarea));

  gtk_main_quit ();

  frame = ((MalibHolder*)display)->frames[0];
  free (display->rgb24);

  /* delete malib objects recursively to its ancestors */
  malib_sink_delete ((MalibSink*)display);
}

void
gtk_wrap_anubis_cv_gtkdisplay_delete (GtkWidget* dummy, GdkEvent* dummy_event,
				     AnubisCVGtkDisplay* disp){
  anubis_cv_gtkdisplay_delete(disp);
  return;
}

/**
 * GUI configuration.
 * frame: the reference of displaying frame.
 */
/* static inline GtkWidget* */
static inline GtkWidget*
anubis_cv_gtkdisplay_gui_config (AnubisCVGtkDisplay* display, MalibFrame* frame, int create_window)
{
  GtkWidget* window;
  GtkWidget* vbox;
  GtkWidget* aframe;
  GtkWidget* drawing_area;

  /* create drawing_area */
  drawing_area = gtk_drawing_area_new ();
  gtk_drawing_area_size (GTK_DRAWING_AREA (drawing_area), 
			 frame->width, frame->height);

  /* event configuration */
  gtk_signal_connect (GTK_OBJECT (drawing_area), "expose_event",
		      GTK_SIGNAL_FUNC (anubis_cv_gtkdisplay_expose_event), 
		      display);
  gtk_signal_connect (GTK_OBJECT (drawing_area),"configure_event",
		      GTK_SIGNAL_FUNC (anubis_cv_gtkdisplay_configure_event), 
		      display);

  gtk_widget_set_events (drawing_area, GDK_EXPOSURE_MASK);

  /* window configuration */
  if (create_window == TRUE)
    {
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      gtk_signal_connect (GTK_OBJECT (window), "destroy",
			  GTK_SIGNAL_FUNC (gtk_main_quit), NULL);
      /* VBox configuration */
      vbox = gtk_vbox_new (FALSE, 0);
      gtk_container_add (GTK_CONTAINER (window), vbox);

      /* draw area (aspect frame) configuration */
      aframe = gtk_aspect_frame_new (NULL, 0.5, 0.5, 1.0, TRUE);
      gtk_frame_set_shadow_type (GTK_FRAME (aframe), GTK_SHADOW_NONE);
      gtk_container_add (GTK_CONTAINER (aframe), drawing_area);
      gtk_box_pack_start (GTK_BOX (vbox), aframe, TRUE, TRUE, 0);

      gtk_widget_show_all (window);
    }
  else
    {
      gtk_widget_show (drawing_area);
    }

  return drawing_area;
}


/**
 * create backing stored image, when widget configure is changed
 */
static int
anubis_cv_gtkdisplay_configure_event (GtkWidget* widget, GdkEventConfigure* event, 
				  AnubisCVGtkDisplay* display)
{
  int w, h;

  g_return_if_fail (display);  

  if (! MALIB_OBJECT_CHECK_CLASS (display, anubis_cv_gtkdisplay)) return FALSE;

  /* create different size display image */
  w = display->drawarea->allocation.width;
  h = display->drawarea->allocation.height;
  gdk_imlib_render (display->im, w, h);

  /* create pixmap from the new image */
  if (display->pixmap) gdk_imlib_free_pixmap (display->pixmap);
  display->pixmap = gdk_imlib_move_image (display->im);

  return TRUE;
}

/**
 * update screen using backing stored pixmap.
 * called from screen updator regularly and from gtk event loop,
 * if expose event occured.
 */
static int
anubis_cv_gtkdisplay_expose_event (GtkWidget* widget, GdkEventExpose* event, 
			       AnubisCVGtkDisplay* display)
{
  g_return_if_fail (display);

  if (! MALIB_OBJECT_CHECK_CLASS (display, anubis_cv_gtkdisplay)) return FALSE;

  if (display->pixmap) 
    {
      gdk_draw_pixmap (display->drawarea->window,
		       display->drawarea->style
		       ->fg_gc[GTK_WIDGET_STATE (display->drawarea)],
		       display->pixmap,
		       event->area.x, event->area.y,
		       event->area.x, event->area.y,
		       event->area.width, event->area.height);
    }

  return TRUE;
}

/**
 * increment a frame
 */
static int
anubis_cv_gtkdisplay_increment_frame (AnubisCVGtkDisplay* display)
{
  GdkEventExpose e;
  MalibFrame* frame;

  g_return_if_fail (display && ((MalibHolder*)display)->source
		    && display->drawarea);

  /* if not running, do nothing */
  if ( !malib_sink_is_running ((MalibSink*)display) )
    {
      usleep (MALIB_SINK_USLEEP_INTERVAL);
      return TRUE;
    }

  /* create dummy event object */
  e.type = GDK_EXPOSE;
  e.window = display->drawarea->window;
  e.area.x = 0;  e.area.y = 0;
  e.area.width = display->drawarea->allocation.width;
  e.area.height = display->drawarea->allocation.height;
  e.send_event = 0;  e.count = 0;

  /* writing the data by previously linked object(s) */
  frame = ((MalibHolder*)display)->frames[0];
  malib_source_write_frame_data (((MalibHolder*)display)->source, frame);

  if (e.window != NULL)
    {
      /* anubis_cv_gtkdisplay_convert_rgb24() must be called to convert 
	 the data format before rendering image, because 
	 gdk_imlib_create_image_from_data() is supposing that 
	 the data format is RGB 24bit per pixels */
      anubis_cv_gtkdisplay_convert_rgb24 (display, frame);

      /* redrawing image */
      if (display->im) gdk_imlib_kill_image (display->im);
      display->im = gdk_imlib_create_image_from_data (display->rgb24, NULL, 
						      frame->width, 
						      frame->height);

      /* ... and expose on screen */
      anubis_cv_gtkdisplay_configure_event (NULL, NULL, display);
      anubis_cv_gtkdisplay_expose_event (NULL, &e, display);
    }

  return TRUE;
}

/**
 * convert the data format.
 * This function is prepared for covering the gap between the data 
 * format of MalibFrame object and that of gdk_imlib_create_image_from_data()
 * requested.
 */
static void
anubis_cv_gtkdisplay_convert_rgb24 (AnubisCVGtkDisplay* display, MalibFrame* frame)
{
  ANUBIS_CV_IMAGE_PIXTYPE* src;
  unsigned char* dest;
  unsigned char  pixel_data;
  unsigned int	 pixel_size;
  int    	 i,j;

  g_return_if_fail (display && frame);

  /* we need some translation at down casting */
  src  = frame->data;
  dest = display->rgb24;

  pixel_size = frame->width * frame->height;

  /* convert 'int' type data into 'unsinged char' type data */

  /* this should be replaced the code which can correctly handle 
     color depth of the image */
  switch (frame->model)
    {
    case MALIB_FRAME_COLORMODEL_RGB:
      for (i = 0, j= 0; i < pixel_size; i++, j+= 3)
	{
	  /* if opencv uses, color order is GBR not RGB */
	  int x;
	  /* x = *src++; */
	  x= src[j+2];
	  *dest++ = (unsigned char) ANUBIS_RANGE256(x) ;
	  /* x = *src++; */
	  x= src[j+1];
	  *dest++ = (unsigned char) ANUBIS_RANGE256(x) ;
	  /* x = *src++; */
	  x= src[j];
	  *dest++ = (unsigned char) ANUBIS_RANGE256(x) ;
	}
      break;

    case MALIB_FRAME_COLORMODEL_GRAY:
      for (i = 0; i < pixel_size; i++)
	{
	  int x = *src++;
	  pixel_data = (unsigned char) ANUBIS_RANGE256(x) ;
	  *dest++ = pixel_data;
	  *dest++ = pixel_data;
	  *dest++ = pixel_data;
	}
      break;

    case MALIB_FRAME_COLORMODEL_BW:
      {
	unsigned char* src = frame->data;
	
	for (i = 0; i < pixel_size; i++)
	  {
	    pixel_data = (*src++ > 0) ? UCHAR_MAX : 0;
	    *dest++ = pixel_data;
	    *dest++ = pixel_data;
	    *dest++ = pixel_data;
	  }
	break;
      }
    }
}

/* for test to mesure the frame rate. */
static int
anubis_cv_gtkdisplay_debug (AnubisCVGtkDisplay* display)
{
  malib_print_fps();

  return anubis_cv_gtkdisplay_increment_frame (display);
}

