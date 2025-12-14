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
#include <malib/malib.h>

#include "anubis_cv_capture.h"
#include "anubis_cv_gtkdisplay.h"
#include "anubis_cv_rgb2gray.h"
#include "anubissimple_gui.h"
#include "anubis_cv_track.h"
#include "anubis_marker.h"

#define TTEST_RING_BUF_SIZE 3

int main(int argc, char* argv[]){
  MalibSource     * s_cap, * s_gray, * s_track, * s_mark;
  MalibBuffer     * b_cap, * b_gray, * b_track, * b_mark;
  MalibGtkDisplay * d_cap, * d_gray, * d_track, * d_mark;

  MalibBuffer * b_ring; /* ring buffer */

  AnubisSimpleGui * gui;

  malib_init (&argc, &argv);

  s_cap= (MalibSource*) anubis_cv_capture_new_with_size (320, 240);
  b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);

  s_gray= (MalibSource*) anubis_cv_rgb2gray_new_with_buf (b_cap);
  b_gray= (MalibBuffer*) malib_ringbuf_new_with_source (TTEST_RING_BUF_SIZE, s_gray);

  s_track= (MalibSource*) anubis_cv_track_new_with_buf(b_gray);
  d_track= anubis_cv_gtkdisplay_new_for_embed(s_track);
  ((AnubisCVTrack*)s_track)->auto_setup= 1;
  //((AnubisCVTrack*)s_track)->skip= 1;

  AnubisMarkerFilter marker_filters[]= {s_track, NULL};

  s_mark= (MalibSource*) anubis_marker_new_with_buf_and_filters(b_cap, marker_filters);
  d_mark= anubis_cv_gtkdisplay_new_for_embed(s_mark);

  gui= anubissimple_gui_new(d_mark);

  MalibGtkDisplay* displays[3];
  displays[0]= d_track;
  displays[1]= d_mark;
  displays[2]= NULL;
  anubis_cv_gtkdisplay_auto_play2(displays);
  //anubis_cv_gtkdisplay_auto_play(d_cap);
  anubis_cv_reset_capture_propaty (s_cap);

}
