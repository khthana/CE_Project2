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

#include "gaborrg_maker_ebgm.h"

/*xmlNodePtr grm_jet_get_templates_node(xmlDocPtr doc);*/

void grm_set_clicked_point_jet_data(GaborJet tmp_jet, GrmGui* gui){
  MalibBuffer * buffer;
  MalibFrame  * from_frame;
  GaborJet jet;
  int x, y;
  x= gui->last_corrected_x;
  y= gui->last_corrected_y;
  int i= 0;
  /* ! tmp_jet is same as gui->tmp_node_data->values_item */
  if(tmp_jet)
    freeGaborJet(tmp_jet); /* Fixme!: not free but clear is more better */
  /* old (not resize) code */
  /*jet= extractJet((double)x, (double)y, gui->ebgm_data->cur_image, gui->ebgm_data->masks);*/
  /* resize code */
  jet= extractJet(x*gui->resize_rate, y*gui->resize_rate,
		  gui->ebgm_data->cur_image, gui->ebgm_data->masks);
  
  
  gui->tmp_node_data->values_item= jet;
#ifdef DEBUGMODE
  dump_gabor_jet(jet);
#endif DEBUGMODE
  return;
}

GaborJet grm_jet_new_from_gui(GrmGui* gui){
  JetMasks masks;
  GaborJet jet;
  char* dirname= TMP_MASK_PARAM_FILE_DIR;
  char* fname  = TMP_MASK_FILE_NAME;

  fname= full_path_maker(dirname, fname);
  jet= makeGaborJet(gui->ebgm_data->masks->params->length);
}

void grm_jet_new_and_copy(GaborJet* target_jet_adder, GaborJet org_jet){
  int length;
  GaborJet target_jet;
  /* 1st arg is ptr_ptr */
  *target_jet_adder = malloc(sizeof(gabor_jet));
  target_jet       = *target_jet_adder;
  memcpy(target_jet, org_jet, sizeof(gabor_jet));
  /* copy each array */
  length= target_jet->length;

  /* it must need */
  target_jet->realPart= malloc(sizeof(GFTYPE) * length);
  target_jet->imagPart= malloc(sizeof(GFTYPE) * length);
  target_jet->mag     = malloc(sizeof(GFTYPE) * length);
  target_jet->ang     = malloc(sizeof(GFTYPE) * length);

  memcpy(target_jet->realPart, org_jet->realPart, sizeof(GFTYPE) * length);
  memcpy(target_jet->imagPart, org_jet->imagPart, sizeof(GFTYPE) * length);
  memcpy(target_jet->mag,      org_jet->mag,      sizeof(GFTYPE) * length);
  memcpy(target_jet->ang,      org_jet->ang,      sizeof(GFTYPE) * length);

  if(org_jet->params){
    target_jet->params= makeJetParams(org_jet->params->length);
    /* make params does not free in this program so needless to copy */
    memcpy(target_jet->params, org_jet->params, sizeof(gabor_jet_params));
  }

}

void grm_jet_face_node_data_stack_output_file(GrmGui* gui){
  /*
    add data if file is exist. it's temporary way untill write 'save as' 
   */
  char * xml_fname;
  //char   masks_fname[GRM_MAX_FILE_NAME_SIZE]= "";
  char * masks_fname;
  char * masks_extention= GABORRG_JET_MASKS_EXTENTION;

  xml_fname= (char*)gtk_entry_get_text((GtkEntry*)gui->file_io_gui.output_file_entry);

  masks_fname= malloc( sizeof(char) * ( strlen(xml_fname) + strlen(masks_extention) + 1 ) );
  masks_fname[0]= '\0';
  /* mask data output to .masks file */
  strcat(masks_fname, xml_fname);
  strcat(masks_fname, masks_extention);
  grm_ebgm_masks_params_output(gui->ebgm_data->masks, masks_fname);

  xmlDocPtr      doc;
  /* make xml tree */
  {
    xmlNodePtr     tree, node_templates;
    GrmNodeData ** face_node_data;
    
    doc= xmlParseFile(xml_fname);

    node_templates= grm_get_xml_child_templats_from_doc(&doc);
    
    while(gui->face_node_data_stack){
      face_node_data= gaborrg_maker_face_node_data_stack_pop(&(gui->face_node_data_stack));
      if(face_node_data[0]){
	grm_jet_face_node_data_add_to_templates_node(gui, face_node_data,
						     node_templates, masks_fname);
      }
    }
  }
  xmlSaveFile(xml_fname, doc);
  g_print("Jets data save to file %s\n", xml_fname);

  return;
}

void grm_jet_face_node_data_add_to_templates_node(GrmGui* gui,
						  GrmNodeData** face_node_data,
						  xmlNodePtr node_templates,
						  char* masks_fname){
  char * xml_fname;
  xml_fname= (char*)gtk_entry_get_text((GtkEntry*)gui->file_io_gui.output_file_entry);

  /* output convolved data to xml file */
  /* add forrow datas to <Templates>
   *
   * <Template masks_fname="masks_file_name">
   * -------------------------------------------------
   * forrow written by next fuction
   * --------------------------------------------------
   *   <Cells x='val' y='val' parts='parts_name'>
   * 	  <Cell>
   *          <RealPart> val </RealPart>
   *	      <ImagPart> val </ImagPart>
   *	      <Mag>       val </Mag>
   *	      <Ang>       val </Ang>
   */
  int i= 0;
  char char_width[GRM_MAX_XML_CHAR_SIZE], char_height[GRM_MAX_XML_CHAR_SIZE];
  xmlNodePtr node_template, node_cells, node_cell;

  /* <Template masks_fname="masks_file_name"> */
  node_template= xmlNewChild(node_templates, NULL, GABORRG_XML_TAG_TEMPLATE, NULL);
  xmlSetProp(node_template, GABORRG_XML_ATTR_MASKS_FNAME, masks_fname);
  /* output cells */
  grm_jet_face_node_data_add_to_template_node(gui, face_node_data, node_template);
  
  /*gui->ebgm_data->masks*/
  return;
}

void grm_jet_face_node_data_add_to_template_node(GrmGui* gui,
						 GrmNodeData** face_node_data,
						 xmlNodePtr node_template){
  /* add forrow datas to <Template>
   * -------------------------------------------------
   * forrow written by next fuction
   * --------------------------------------------------
   *   <Cells x='val' y='val' parts='parts_name'>
   * 	  <Cell>
   *          <RealPart> val </RealPart>
   *	      <ImagPart> val </ImagPart>
   *	      <Mag>       val </Mag>
   *	      <Ang>       val </Ang>
   */

  GaborJet jet;
  int i= 0;
  while(face_node_data[i]){
    if(face_node_data[i]->is_set_as_parts){
      jet= face_node_data[i]->values_item;
      jet->vertLabel= face_node_data[i]->parts_name;

      grm_set_xml_child_cells_from_jet(node_template, jet);
    }
    i++;
  }
  return;
}

void grm_facegraph_seq_save_to_xml_file(CvSeq* face_graph_seq, char* masks_fname, char* xml_fname){
  /*
    @face_graph_seq: sequence that contain face graph 
    @xml_fname     : xml file name to save
    */
  xmlDocPtr doc;
  xmlNodePtr node_templates, node_template;

  doc= NULL;
  doc= xmlParseFile(xml_fname);

  node_templates= grm_get_xml_child_templats_from_doc(&doc);

  int i,j,tot;
  tot= face_graph_seq->total;

  FaceGraph face_graph;
  for(i= 0; i < tot; i++){
    face_graph= cvGetSeqElem(face_graph_seq, i);
    node_template= xmlNewChild(node_templates, NULL, GABORRG_XML_TAG_TEMPLATE, NULL);
    xmlSetProp(node_template, GABORRG_XML_ATTR_MASKS_FNAME, masks_fname);
    xmlSetProp(node_template, GABORRG_XML_ATTR_FACE_NAME, face_graph->faceLabel);
    xmlSetProp(node_template, GABORRG_XML_ATTR_FG_IMAGE_FNAME, face_graph->fg_image_fname);
    for(j= 0; j < face_graph->totalsize; j++){
      if(face_graph->jets[j]){
	grm_set_xml_child_cells_from_jet(node_template, face_graph->jets[j]);
      }
    }
  }
  xmlSaveFile(xml_fname, doc);
  xmlFreeDoc(doc);
  return;
}

xmlNodePtr grm_get_xml_child_templats_from_doc(xmlDocPtr* doc_p){
  /* if doc is NULL make new doc */
  xmlNodePtr tree, node_templates;

  node_templates= NULL;

  if(*doc_p != NULL){
    node_templates= grm_jet_get_templates_node(*doc_p);
  }
  
  if(node_templates == NULL){
    *doc_p             = xmlNewDoc("1.0");
    (*doc_p)->children = xmlNewDocNode(*doc_p, NULL, GABORRG_XML_TAG_JETS, NULL);
    node_templates= xmlNewChild  ((*doc_p)->children, NULL, GABORRG_XML_TAG_TEMPLATES, NULL);
  }
  return node_templates;
}


void grm_set_xml_child_cells_from_jet(xmlNodePtr dist_xml_node, GaborJet jet){
  /* add forrow datas to dist_xml_node
   *   <Cells x='val' y='val' parts='parts_name'>
   * 	  <Cell>
   *          <RealPart> val </RealPart>
   *	      <ImagPart> val </ImagPart>
   *	      <Mag>       val </Mag>
   *	      <Ang>       val </Ang>
   */
  
  xmlNodePtr node_cells, node_cell, node_real, node_imag, node_mag, node_ang;
  char char_x    [GRM_MAX_XML_INT_CHAR_SIZE], char_y  [GRM_MAX_XML_INT_CHAR_SIZE],
       char_real [GRM_MAX_XML_INT_CHAR_SIZE], char_img[GRM_MAX_XML_INT_CHAR_SIZE],
       char_mag  [GRM_MAX_XML_INT_CHAR_SIZE], char_ang[GRM_MAX_XML_INT_CHAR_SIZE],
       char_parts[GRM_MAX_XML_CHAR_SIZE];

  node_cells= xmlNewChild(dist_xml_node, NULL, GABORRG_XML_TAG_CELLS, NULL);

  sprintf(char_x,     "%f", jet->x);
  sprintf(char_y,     "%f", jet->y);
  sprintf(char_parts, "%s", jet->vertLabel);
  xmlSetProp(node_cells, GABORRG_XML_ATTR_X,     char_x);
  xmlSetProp(node_cells, GABORRG_XML_ATTR_Y,     char_y);
  xmlSetProp(node_cells, GABORRG_XML_ATTR_PARTS, char_parts);

  int i;
  for(i= 0; i < jet->length; i++){
    
    node_cell= xmlNewChild(node_cells, NULL, "Cell", NULL);
    
    sprintf(char_real, "%f", jet->realPart[i]);
    sprintf(char_img,  "%f", jet->imagPart[i]);
    sprintf(char_mag,  "%f", jet->mag[i]);
    sprintf(char_ang,  "%f", jet->ang[i]);
    
    node_real= xmlNewChild(node_cell, NULL, GABORRG_XML_TAG_REAL, char_real);
    node_imag= xmlNewChild(node_cell, NULL, GABORRG_XML_TAG_IMAG, char_img);
    node_mag = xmlNewChild(node_cell, NULL, GABORRG_XML_TAG_MAG,  char_mag);
    node_ang = xmlNewChild(node_cell, NULL, GABORRG_XML_TAG_ANG,  char_ang);
  }
}



void grm_ebgm_masks_params_output(JetMasks masks, char* fname){
  FILE * fileptr;
  int i;
  GaborJetParams params;
  params= masks->params;
  fileptr= fopen(fname, "w");
  assert(fileptr);
  fprintf(fileptr, "%d\n", masks->size);
  
  for(i= 0; i < masks->size; i++){
    fprintf(fileptr, "%lf %lf %lf %lf %lf %d\n",
	    params->wavelength[i], params->angle[i] , params->phase[i],
	    params->aspect[i]    , params->radius[i], params->size[i]);
  }
  g_print("masks params save to file %s\n", fname);
  fclose (fileptr);
  return;
}

Image grm_ebgm_new_cur_image(MalibBuffer* buf){
  Image im;
  MalibFrame* frame= malib_buffer_get_current_frame((MalibFilter*)buf);
  int width        =  frame->width;
  int height       =  frame->height;
  
  im= makeImage(width, height, 1);
  return im;
}

void grm_ebgm_params_setup(GrmGui* gui){
  struct _GrmEBGMData* ebgm_data;
  gui->ebgm_data      = malloc(sizeof(GrmEBGMData));
  ebgm_data           = gui->ebgm_data;
  ebgm_data->masks    = grm_default_jet_masks_setup();
  ebgm_data->xy_is_set= 0;
  ebgm_data->cur_image= grm_ebgm_new_cur_image(gui->gray_buffer);

  return;
}

JetMasks grm_default_jet_masks_setup(){
  char* fname;
  JetMasks masks;
  fname= full_path_maker(TMP_MASK_PARAM_FILE_DIR, TMP_MASK_FILE_NAME);
  grm_ebgm_write_default_params(fname);
  masks= readMasksFile(fname);
  return masks;
}

void grm_ebgm_write_default_params(char* full_fname){
  int i,j,k,l,m,n, count;

  double lambdas[]= GABORRG_LAMBDAS;
  double angles[]= GABORRG_ANGLES;
  double phases[]= GABORRG_PHASES;
  double gammas[]= GABORRG_GAMMAS;

  FILE * fileptr;
  fileptr= fopen(full_fname,"w");
  assert(fileptr);
  fprintf(fileptr, "%d\n", ARRAY_LEN(lambdas,FTYPE) * ARRAY_LEN(angles,FTYPE) *
	                 ARRAY_LEN(phases,FTYPE)  * ARRAY_LEN(gammas,FTYPE));
  count= 0;
  for(i= 0; i < ARRAY_LEN(lambdas,FTYPE); i++){
    for(j= 0; j < ARRAY_LEN(angles,FTYPE); j++){
      for(k= 0; k < ARRAY_LEN(phases,FTYPE); k++){
	for(l= 0; l < ARRAY_LEN(gammas,FTYPE); l++){
	  /* output */
	  /* lambda, angle, phase, gama, sigma, maskSize */
	  fprintf(fileptr, "%lf %lf %lf %lf %lf %d\n",
		  lambdas[i], angles[j], phases[k],
		  gammas[l], lambdas[i], (int) lambdas[i] * 2);
	  count++;
	}
      }
    }
  }
  fclose(fileptr);
  return ;
}

char* full_path_maker(char* dirname,char* fname){
  int len= strlen(dirname) + strlen(fname);
  char* full_fname= calloc(len, sizeof(char));
  sprintf(full_fname, "%s/%s", dirname,fname);
  return full_fname;
}

xmlNodePtr grm_jet_get_templates_node(xmlDocPtr doc){
  /* read node date from @xml_fname
     and return 
     if file not exist or not xml data return NULL
  */
  xmlNodePtr       node;
  
  node= doc->children;
  if(node == NULL){
    printf("empty document\n");
    xmlFreeDoc(doc);
    return NULL;
  }

  /* try to like this
  if(strcmp(node->name, GABORRG_XML_TAG_JETS) == 0){
    node= node->children;
    if(strcmp(node->name, GABORRG_XML_TAG_TEMPLATES) == 0){
      return node;
    }
  }
  */

  while(node) {
    if(strcmp(node->name, GABORRG_XML_TAG_JETS) == 0){
      node= node->children;
      while(node){
	if(strcmp(node->name, GABORRG_XML_TAG_TEMPLATES) == 0){
	  return node;
	}
	node= node->next;
      }
      break;
    }
    node= node->next;
  }

  return NULL;
}
