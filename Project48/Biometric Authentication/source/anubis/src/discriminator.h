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

#ifndef __DISCRIMINATOR_H__
#define __DISCRIMINATOR_H__

#include <malib/malib.h>
BEGIN_C_DECLS
typedef struct _GrrDiscData GrrDiscData;
typedef struct _GrrDiscDataNode GrrDiscDataNode;
typedef struct _GrrDiscDataClass GrrDiscDataClass;
#include "gaborrg_recog.h"
#include "gaborrg_recog_file_io.h"

struct _GrrDiscData{
  GrrDiscDataClass * data_classes;
  int data_classes_num; /* types of data_class number (not include NULL)*/
  int all_node_num; /* all callasses of all node number */
};

struct _GrrDiscDataClass{
  char * name; /* like nose, eye, mouse ... etc */

  GrrDiscDataNode * node;/* it's not must */
  int node_num;

  GrrDiscDataClass * next;/* it's not must */
};

struct _GrrDiscDataNode{
  int dim; /* equal to values array length */
  double * values;
  GrrDiscDataClass * data_class; /* belong class */
  GrrDiscDataNode * next; /* it's not must */
};

GrrDiscDataClass* lookup_data_class_by_name                  (GrrDiscDataClass*, char*);
GrrDiscData*      grr_xml_gaborrg_to_grr_disc_data           (GrrXmlGaborRg*);
void              grr_disc_data_push_grr_disc_data_class     (GrrDiscData*, GrrDiscDataClass*);
void              grr_disc_data_class_push_grr_disc_data_node(GrrDiscDataClass*,
							      GrrDiscDataNode*);
int grr_disc_data_node_dump(GrrDiscDataNode* node);
int grr_disc_data_class_dump(GrrDiscDataClass* data_class);

END_C_DECLS

#endif /* __DISCRIMINATOR_H__ */
