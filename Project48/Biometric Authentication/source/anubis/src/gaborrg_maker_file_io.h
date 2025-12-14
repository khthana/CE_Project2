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
#ifndef __GABORRG_MAKER_FILE_IO_H__
#define __GABORRG_MAKER_FILE_IO_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libxml2/libxml/parser.h>
#include <libxml2/libxml/tree.h>

#include "gaborrg_maker_gui.h"
#include "anubis_common.h"


void      gabor_mag_face_node_data_stack_output_file(GrmGui* gui);
xmlDocPtr gabor_mag_stack_data_convert_to_xml(GrmGui* gui, GrmFaceNodeDataStack** stack);
void      gabor_mag_face_node_data_add_to_templates_node(GrmGui* gui,
							 GrmNodeData** face_node_data,
							 xmlNodePtr node_templates);
#endif /* __GABORRG_MAKER_FILE_IO_H__ */
