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
#ifndef __GABORRG_MAKER_EBGM_H__
#define __GABORRG_MAKER_EBGM_H__

#include <malib/malib.h>
#include <stdio.h>
BEGIN_C_DECLS
#include "anubis_common.h"
#include "gaborrg_maker_gui.h"
#include "gaborrg_maker_file_io.h"
#include "gaborrg_maker_file_io_gui.h"
#include "csuCommonUtil.h"
#include "csuEBGMUtil.h"
#include "csuCommonImage.h"


typedef struct _GrmEBGMData {
  int xy_is_set;
  int x;
  int y;
  GaborJet tmp_jet;    
  JetMasks masks;      
  Image    cur_image;  /* for csu process */

} GrmEBGMData;

void     grm_set_clicked_point_jet_data(GaborJet tmp_jet, GrmGui* gui);
GaborJet grm_jet_new_from_gui(GrmGui* gui);
void     grm_jet_new_and_copy(GaborJet* target_jet_adder, GaborJet org_jet);
void     grm_jet_face_node_data_stack_output_file(GrmGui* gui);
void     grm_jet_face_node_data_add_to_templates_node(GrmGui* gui,
						      GrmNodeData** face_node_data,
						      xmlNodePtr node_templates,
						      char* masks_fname);
void     grm_jet_face_node_data_add_to_template_node(GrmGui* gui,
						      GrmNodeData** face_node_data,
						      xmlNodePtr node_template);
void grm_set_xml_child_cells_from_jet(xmlNodePtr dist_xml_node, GaborJet jet);

void grm_facegraph_seq_save_to_xml_file(CvSeq* face_graph_seq, char* masks_fname, char* xml_fname);
xmlNodePtr grm_get_xml_child_templats_from_doc(xmlDocPtr* doc_p);

void     grm_ebgm_masks_params_output(JetMasks masks, char* fname);
void     grm_ebgm_params_setup(GrmGui* gui);
JetMasks grm_default_jet_masks_setup(); /* return JetMasks */
void     grm_ebgm_write_default_params(char* full_fname);
char*    full_path_maker(char* dirname, char* fname);
xmlNodePtr grm_jet_get_templates_node(xmlDocPtr doc);

/*
void grm_ebgm_write_params(FTYPE lambdas[], FTYPE angles[], FTYPE phases[], FTYPE gammas[], FTYPE sigmas[],int mask_sizes[], char* dirname, char* fname);
*/
END_C_DECLS
#endif /* __GABORRG_MAKER_EBGM_H__ */
