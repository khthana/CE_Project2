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
#ifndef __ANUBIS_CV_TRACK_WITH_JET_H__
#define __ANUBIS_CV_TRACK_WITH_JET_H__

#include <malib/malib.h>
#include <opencv/cv.h>
#include "anubis_common.h"
#include "anubis_marker_filter.h"
#include "anubis_cv_track.h"
#include "gaborrg_recog_jet_file_io.h"
#include "csu/csuEBGMSimilarity.h"


BEGIN_C_DECLS

#define ANUBIS_CV_TRACK_WITH_JET_WIN_SIZE 10
#define ANUBIS_CV_TRACK_WITH_JET_POINTS_NUM_MAX 500

#define ANUBIS_CV_MIN_RING_BUF_SIZE 2

typedef struct _AnubisCVTrackWithJetClass{
  //AnubisMarkerFilterClass super;
  AnubisCVTrackClass super;
} AnubisCVTrackWithJetClass;

typedef struct _AnubisCVTrackWithJet{
  //AnubisMarkerFilter super;
  AnubisCVTrack super;

  CvMemStorage * storage;
  CvSeq        ** parts_jets_seq;
  GrjXmlJets   * xml_jets;

  char     * masks_fname;
  JetMasks   masks;

  Image csu_image;
} AnubisCVTrackWithJet;

AnubisCVTrackWithJet*
anubis_cv_track_with_jet_new_with_buf(MalibBuffer* buf,
				     char* jets_fname, char* masks_fname);

END_C_DECLS

#endif /* __ANUBIS_CV_TRACK_WITH_JET_H__ */
