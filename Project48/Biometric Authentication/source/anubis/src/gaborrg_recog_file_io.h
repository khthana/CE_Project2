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
#ifndef __GABORRG_RECOG_FILE_IO_H__
#define __GABORRG_RECOG_FILE_IO_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libxml2/libxml/parser.h>
#include <libxml2/libxml/tree.h>

#include <malib/malib.h>
BEGIN_C_DECLS
typedef struct _GrrXmlCell GrrXmlCell;
typedef struct _GrrXmlTemplate GrrXmlTemplate;
typedef struct _GrrXmlGaborRg GrrXmlGaborRg;
#include "gaborrg_recog.h"
/*#include "gaborrg_recog_gui.h"*/

struct _GrrXmlCell
{
  int                   x,y;
  int                   dir;
  int                   radius;
  char*                 parts_name;
  double                val;

  GrrXmlCell*  next;
};

struct _GrrXmlTemplate
{
  int width;
  int height;
  int num_cells;
  GrrXmlCell* cell;
  
  GrrXmlTemplate* next;
};

struct _GrrXmlGaborRg
{
  int num_templates;
  GrrXmlTemplate* template;
};

GrrXmlGaborRg* grr_xml_parse_file(char*);

GrrXmlCell* grr_xml_parse_and_new_cell (xmlDocPtr, xmlNodePtr);
GrrXmlTemplate* grr_xml_parse_template(xmlDocPtr, xmlNodePtr);
END_C_DECLS
#endif /*  __GABORRG_RECOG_FILE_IO_H__ */
