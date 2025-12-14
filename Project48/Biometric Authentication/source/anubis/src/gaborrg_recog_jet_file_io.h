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
#ifndef __GABORRG_RECOG_JET_FILE_IO_H__
#define __GABORRG_RECOG_JET_FILE_IO_H__

#include <malib/malib.h>
#include <opencv/cv.h>
BEGIN_C_DECLS
#include <libxml2/libxml/parser.h>
#include <libxml2/libxml/tree.h>

#include "anubis_common.h"

#include "csuEBGMUtil.h"

typedef struct _GrjXmlCell
{
  FTYPE real;
  FTYPE imag;
  FTYPE mag;
  FTYPE ang;
  
  struct _GrjXmlCell* next;
} GrjXmlCell;

typedef struct _GrjXmlCells
{
  int x,y;
  char * parts_name;

  int num_cell;

  GrjXmlCell* cell;
  
  struct _GrjXmlCells* next;
} GrjXmlCells;

typedef struct _GrjXmlTemplate
{
  int    width;
  int    height;
  int    num_cells;
  char * masks_fname;
  char * face_name;
  
  GrjXmlCells * cells; /* child */
  
  struct _GrjXmlTemplate * next;
} GrjXmlTemplate;

typedef struct _GrjXmlJets
{
  int num_template;
  GrjXmlTemplate * template; /* child */
} GrjXmlJets;

GrjXmlJets*     grj_xml_parse_file    (char* fname);
GrjXmlTemplate* grj_xml_parse_template(xmlDocPtr doc, xmlNodePtr node);
GrjXmlCells*    grj_xml_parse_cells   (xmlDocPtr doc, xmlNodePtr node);
GrjXmlCell*     grj_xml_parse_cell    (xmlDocPtr doc, xmlNodePtr node);

void grj_xml_jets_destroy(GrjXmlJets* xml_jets);
void grj_xml_template_destroy(GrjXmlTemplate * xml_template);
void grj_xml_cells_destroy(GrjXmlCells* cells);
void grj_xml_cell_destroy (GrjXmlCell* cell);

FaceGraph* grj_xml_jets_to_face_graphs    (GrjXmlJets* xml_jets, char* masks_fname);
FaceGraph  grj_xml_template_to_face_graph (GrjXmlTemplate* xml_template, char* masks_fname);
GaborJet   grj_xml_cells_to_jet           (GrjXmlCells* cells);

CvSeq**
grj_xml_jets_to_jets_sequence(GrjXmlJets * xml_jets, char * masks_fname, CvMemStorage * storage);

END_C_DECLS
#endif  /* __GABORRG_RECOG_JET_FILE_IO_H__ */
