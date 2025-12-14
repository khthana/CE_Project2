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
#include "gaborrg_recog_jet_file_io.h"

int
get_idx_from_jet_vertLabel(char* vertLabel);


GrjXmlJets* grj_xml_parse_file(char* fname){
  /* parse
     <Jets>
       <Teplates>
     --  
         <Template masks_file_name="fname">
         ...
  */
  xmlDocPtr        doc;
  xmlNodePtr       node,       children;
  GrjXmlCell     * cell,     * tmp_cell;
  GrjXmlTemplate * template, * tmp_template, * template_head, * template_tail;
  GrjXmlJets     * xml_jets;

  cell    = NULL;
  template= NULL;
  xml_jets= malloc(sizeof(GrjXmlJets));

  g_print("xmlfile name is %s\n", fname); /* debug wirte */
  
  doc     = xmlParseFile(fname);

  if(doc == NULL){
    printf("It seems that %s is not a expected xml data or %s is not existance.\n", fname, fname);
    return NULL;
  }

  node= doc->children;
  if(node == NULL){
    printf("empty document\n");
    xmlFreeDoc(doc);
    return NULL;
  }

  template= NULL;
  if(strcmp(node->name, GABORRG_XML_TAG_JETS) == 0){
    node= node->children;
    if(strcmp(node->name, GABORRG_XML_TAG_TEMPLATES) == 0){
      node         = node->children;
      template_head= template_tail= NULL;
      while(node){
	if(strcmp(node->name, GABORRG_XML_TAG_TEMPLATE) == 0){
	  tmp_template= grj_xml_parse_template(doc, node);
	  if(! template_head)
	    template_head= tmp_template; /* for first loop */
	  if(template_tail)
	    template_tail->next= tmp_template; /* for not first */
	  template_tail= tmp_template;
	  xml_jets->num_template++;
	}
	node= node->next;
      }
    }
  }
  
  xml_jets->template= template_head;
  return xml_jets;
}

GrjXmlTemplate* grj_xml_parse_template(xmlDocPtr doc, xmlNodePtr node){
  /*
    parse
    <Template masks_file_name="fname", face_name="face's name">
    --
      <Cells x="val", y="val", parts_name="parts_name">
        <Cell>
	  <RealPart> val </RealPart>
	  <ImagPart> val </ImagPart>
	  <Mag>      val </Mag>
	  <Ang>      val </Ang>
  */

  GrjXmlTemplate * template;   /* retptr */
  GrjXmlCells    * cells_head, * cells_tail, * tmp_cells;
  char           * cbuf;
  
  if ((xmlStrcmp (node->name, (const xmlChar*) GABORRG_XML_TAG_TEMPLATE)) == 0){
    template             = malloc(sizeof(GrjXmlTemplate));
    template->masks_fname= xmlGetProp(node, GABORRG_XML_ATTR_MASKS_FNAME);
    template->face_name  = xmlGetProp(node, GABORRG_XML_ATTR_FACE_NAME);
    /* init */
    template->num_cells  = 0;    
    template->next       = NULL;
  } else {
    g_error("xmlNodePtr node is not pointing \"Template\"");
    return NULL;
  }

  /* make Cells FIFO list */
  node      = node->children;
  cells_head= cells_tail= NULL;

  while(node){
    tmp_cells= grj_xml_parse_cells(doc, node);
    if(! cells_head)
      cells_head      = tmp_cells; /* for first loop */
    if(cells_tail)
      cells_tail->next= tmp_cells; /* for not first */
    cells_tail= tmp_cells;
    template->num_cells++;
    node= node->next;
  }
  template->cells= cells_head;
  return template;
}

GrjXmlCells* grj_xml_parse_cells(xmlDocPtr doc, xmlNodePtr node){
  /*
    parse
      <Cells x="val", y="val", parts_name="parts_name">
      --
        ...
  */
  xmlNodePtr    tmp_node;
  GrjXmlCells * cells;
  GrjXmlCell  * cell_head,  * cell_tail,  * tmp_cell;

  /* set value and init */
  if (xmlStrcmp(node->name, (const xmlChar*) GABORRG_XML_TAG_CELLS) == 0){
    cells            = malloc(sizeof(GrjXmlCells));
    cells->x         = atoi  (xmlGetProp(node, GABORRG_XML_ATTR_X));
    cells->y         = atoi  (xmlGetProp(node, GABORRG_XML_ATTR_Y));
    cells->parts_name=        xmlGetProp(node, GABORRG_XML_ATTR_PARTS);
    cells->num_cell  = 0;   
    cells->next      = NULL;
  } else {
    g_error("xmlNodePtr node is not pointing \"%s\"", GABORRG_XML_TAG_CELLS);
    return NULL;
  }

  /* make Cell FIFO List */
  tmp_node = node     = node->children;
  cell_head= cell_tail= NULL;

  while(node){
    tmp_cell= grj_xml_parse_cell(doc, node);
    if(! cell_head)
      cell_head      = tmp_cell;
    if(cell_tail)
      cell_tail->next= tmp_cell;
    cell_tail= tmp_cell;
    cells->num_cell++;
    node= node->next;
  }

  cells->cell= cell_head;
  
  return cells;
}

GrjXmlCell* grj_xml_parse_cell(xmlDocPtr doc, xmlNodePtr node){
  /* parse
     <Cell>
       ...
     --
  */
  GrjXmlCell* cell;
  
  if (xmlStrcmp (node->name, (const xmlChar*) GABORRG_XML_TAG_CELL)){
    g_error("xmlNodePtr node is not pointing \"%s\"", GABORRG_XML_TAG_CELL);
    return NULL;
  }

  cell      = malloc(sizeof(GrjXmlCell));
  cell->next= NULL;

  /* set those values */
  /*
    <RealPart> val </RealPart>
    <ImagPart> val </ImagPart>
    <Mag>      val </Mag>
    <Ang>      val </Ang>
  */
  node= node->children;
  while(node){
    if (strcmp(node->name, GABORRG_XML_TAG_REAL) == 0){
      cell->real= atof (xmlNodeGetContent (node));
    } else if (strcmp(node->name, GABORRG_XML_TAG_IMAG) == 0){
      cell->imag= atof (xmlNodeGetContent (node));
    } else if (strcmp(node->name, GABORRG_XML_TAG_MAG)  == 0){
      cell->mag = atof (xmlNodeGetContent (node));
    } else if (strcmp(node->name, GABORRG_XML_TAG_ANG)  == 0){
      cell->ang = atof (xmlNodeGetContent (node));
    }
    node= node->next;
  }
  return cell;
}


/*--------------------------------------------------------------------------*/
/****************************************************************************/
/*                                                                          */
/* destroy func for GrjXmlXXX data types                                    */
/*                                                                          */
/****************************************************************************/

void grj_xml_jets_destroy(GrjXmlJets* xml_jets){
  grj_xml_template_destroy (xml_jets->template);
  free (xml_jets);
  return;
}

void grj_xml_template_destroy(GrjXmlTemplate * xml_template){
  GrjXmlTemplate * next;
  while(xml_template){
    next= xml_template->next;
    grj_xml_cells_destroy (xml_template->cells);
    free (xml_template);
    xml_template= next;
  }
}

void grj_xml_cells_destroy(GrjXmlCells* cells){
  GrjXmlCells * next;
  while(cells){
    next= cells->next;
    
    grj_xml_cell_destroy (cells->cell);
    free (cells);
    cells= next;
  }
}

void grj_xml_cell_destroy(GrjXmlCell* cell){
  GrjXmlCell * next;
  while(cell){
    next= cell->next;
    free(cell);
    cell= next;
  }
}

/*---------------------------------------------------------------------------*/
/**************************************************************************/
/* 									  */
/*  convert GrjXmlXXX to csu data type					  */
/*                                                              	  */
/**************************************************************************/

FaceGraph* grj_xml_jets_to_face_graphs(GrjXmlJets* xml_jets, char* masks_fname){
  /* return FaceGraph array (last 1 node is NULL) */
  FaceGraph* face_graphs;
  GrjXmlTemplate* xml_template;
  int i;

  face_graphs= malloc( sizeof(FaceGraph*) * (xml_jets->num_template + 1) ); /* +1 for NULL */

  i= 0;
  xml_template= xml_jets->template;
  while(xml_template){
    face_graphs[i]= grj_xml_template_to_face_graph( xml_template , masks_fname);

    xml_template= xml_template->next;
    i++;
  }

  face_graphs[i]= NULL; /* last 1 is NULL */

  return face_graphs;
}

FaceGraph grj_xml_template_to_face_graph(GrjXmlTemplate* xml_template, char* masks_fname){
  /* convert GrjXmlTemplate to csu data type (FaceGraph) */
  JetMasks      masks;
  FaceGraph     face_graph;
  GrjXmlCells * cells;
  int i;

  masks     = readMasksFile( masks_fname );
  face_graph= makeFaceGraph( xml_template->num_cells, xml_template->num_cells );

  face_graph->faceLabel= xml_template->face_name;
  face_graph->params   = masks->params;

  cells= xml_template->cells;
  i= 0;
  while(cells){
    face_graph->jets[i]= grj_xml_cells_to_jet(cells);
    face_graph->jets[i]->params= masks->params;
    cells= cells->next;
    i++;
  }
  return face_graph;
}

GaborJet grj_xml_cells_to_jet(GrjXmlCells* cells){
  int i;
  GrjXmlCell * cell;
  GaborJet     jet;

  jet           = makeGaborJet(cells->num_cell);
  jet->vertLabel= cells->parts_name;
  jet->x        = cells->x;
  jet->y        = cells->y;
  cell          = cells->cell;
  i= 0;
  while(cell){
    jet->realPart[i]= cell->real;
    jet->imagPart[i]= cell->imag;
    jet->mag[i]     = cell->mag;
    jet->ang[i]     = cell->ang;
      
    cell= cell->next;
    i++;
  }
  return jet;
}

/*---------------------------------------------------------------------------*/
/**************************************************************************/
/* 									  */
/*  convert GrjXmlXXX to csu jet cv sequence        			  */
/*                                                              	  */
/**************************************************************************/

CvSeq**
grj_xml_jets_to_jets_sequence(GrjXmlJets * xml_jets, char* masks_fname, CvMemStorage * storage){
  CvSeq ** seqs;
  GaborJet jet;
  GrjXmlTemplate* xml_template;
  JetMasks masks;
  int i;

  FaceParts face_parts_len= FaceParts_LEN;
  
  masks     = readMasksFile( masks_fname );
  assert(masks);
  
  seqs= malloc( sizeof(CvSeq*) * face_parts_len );
  for(i= 0; i < face_parts_len; i++){
    seqs[i]= cvCreateSeq(0, sizeof(CvSeq), sizeof(gabor_jet), storage);
  }

  xml_template= xml_jets->template;
  while(xml_template){
    GrjXmlCells * cells;
    cells= xml_template->cells;

    while(cells){
      GaborJet jet;
      /*gabor_jet * jet;*/
      int idx;
      
      jet= grj_xml_cells_to_jet(cells);
      jet->params= masks->params;
      /*jet->params= */
      idx= get_idx_from_jet_vertLabel(jet->vertLabel);
      if(idx >= 0){
	/*cvSeqPush(seqs[idx],jet);*/
	cvSeqPush(seqs[idx],jet);
      }
      cells= cells->next;
    }
    xml_template= xml_template->next;
  }
  return seqs;
}

int
get_idx_from_jet_vertLabel(char* vertLabel){
  FaceParts face_parts_len= FaceParts_LEN;
  char * parts_names[]= GABORRG_MAKER_DEFAULT_PARTS;

  int i= 0;
  while(parts_names[i]){
    if(! strcmp(parts_names[i], vertLabel))
      return i;
    i++;
  }
  return -1;
}
