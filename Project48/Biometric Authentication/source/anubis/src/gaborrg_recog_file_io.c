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
#include "gaborrg_recog_file_io.h"

GrrXmlGaborRg* grr_xml_parse_file(char* fname){
  xmlDocPtr  doc;
  xmlNodePtr cur, children;
  GrrXmlCell * cell, * tmp_cell;
  GrrXmlTemplate * template, * tmp_template;
  GrrXmlGaborRg * xml_gaborrg;

  cell= NULL;
  template= NULL;
  xml_gaborrg= malloc(sizeof(GrrXmlGaborRg));
  
  doc= xmlParseFile(fname);
  if(doc == NULL){
    printf("It seems that %s is not a xml data.\n", fname);
    return NULL;
  }

  cur= doc->children;
  if(cur == NULL){
    printf("empty document\n");
    xmlFreeDoc(doc);
    return NULL;
  }

  if(strcmp(cur->name, "GaborRg") == 0){
    cur= cur->children;
    if (strcmp(cur->name, "Templates") == 0){
      cur= cur->children;
      while(cur){
	if(strcmp(cur->name, "Template") == 0){
	  tmp_template      = grr_xml_parse_template(doc, cur);
	  tmp_template->next= template;
	  template          = tmp_template;
	  xml_gaborrg->num_templates++;
	}
	cur= cur->next;
      }
    }
  }
  xml_gaborrg->template= template;
  return xml_gaborrg;
}


GrrXmlCell*
grr_xml_parse_and_new_cell (xmlDocPtr doc, xmlNodePtr node){
  GrrXmlCell* cell= NULL; /* retptr */
  cell= malloc (sizeof (GrrXmlCell));
  memset (cell, 0, sizeof(GrrXmlCell));

  if ((strcmp(node->name, "Cell") == 0)){
    unsigned char* dirstr;
    if (! (xmlGetProp (node, "x") || xmlGetProp (node, "y")))
      g_error("cell tag does not have coordinate propaty (x= %s or y= %s)\n",
	      xmlGetProp (node, "x"), xmlGetProp (node, "y"));
    cell->x= atoi (xmlGetProp (node, "x"));
    cell->y= atoi (xmlGetProp (node, "y"));

    if (! (xmlGetProp(node, "dir")))
      g_error("cell tag does not have 'dir' propaty");
    cell->dir= atoi (xmlGetProp(node, "dir"));

    if (! (xmlGetProp(node, "radius")))
      g_error("cell tag does not have 'radius' propaty");
    cell->radius= atoi (xmlGetProp(node, "radius"));

    /* forrows are extra data */
    if (xmlGetProp(node, "parts"))
      cell->parts_name= (xmlGetProp(node, "parts"));
    if (xmlNodeGetContent(node))
      cell->val=   atof (xmlNodeGetContent(node));
  }
  cell->next= NULL;
  return cell;
}

GrrXmlTemplate* grr_xml_parse_template(xmlDocPtr doc, xmlNodePtr node){
  /*
   parse
   <Template>
     <Cells>  
       <Cell>
  */
  
  GrrXmlCell * cells_head, * cells_tail, * tmp_cell;
  GrrXmlTemplate * template; /* retptr */
  xmlNodePtr tmp_node;
  char * cbuf;

  if ((xmlStrcmp(node->name, (const xmlChar *) "Template")) == 0){
    template           = malloc(sizeof(GrrXmlTemplate));
    template->width    = atoi  (xmlGetProp(node, "width"));
    template->height   = atoi  (xmlGetProp(node, "height"));
    template->num_cells= 0;    /* init */
  } else {
    g_error("xmlNodePtr node is not pointing \"Template\"");
    return NULL;
  }
	
  node= node->children;
  
  if (xmlStrcmp(node->name, (const xmlChar *) "Cells"))
    {
      sprintf (cbuf, "document of the wrong type, was '%s', %s expected",
	       node->name, "Cells");
      g_error (cbuf);
      return NULL;
    }

  tmp_node= node= node->children;
  cells_tail= cells_head= NULL; /* for read as oroginal order */
  while(node){
    if(strcmp(node->name, "Cell") == 0){
      tmp_cell= grr_xml_parse_and_new_cell(doc, node);
      if(! cells_head)
	cells_head= tmp_cell; /* for first loop */
      if(cells_tail)
	cells_tail->next= tmp_cell; /* for after 2nd loop */
      cells_tail= tmp_cell;
      template->num_cells++;
    }
    node= node->next;
  }
  template->cell= cells_head;
  return template;
}
