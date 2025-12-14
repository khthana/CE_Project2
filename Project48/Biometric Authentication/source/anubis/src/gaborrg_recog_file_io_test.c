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
#include "../src/gaborrg_recog_file_io.h"

#define TEST_XML_FILE_NAME "gaborrg.test.xml"

int looktest_grr_xml_parse_cell(){
  xmlDocPtr   doc;
  xmlNodePtr  cur;
  GrrXmlCell* cell;

  doc= xmlParseFile(TEST_XML_FILE_NAME);
  if(doc == NULL){
    printf("It seems that %s is not a xml data.\n", TEST_XML_FILE_NAME);
    return 0;
  }

  cur= doc->children;
  if(cur == NULL){
    printf("empty document\n");
    xmlFreeDoc(doc);
    return 0;
  }

  while(cur){
    if( strcmp(cur->name, "Cell") == 0){
      cell= grr_xml_parse_and_new_cell(doc, cur);
      printf("cell->(x == %d y == %d, dir == %d radius == %d parts_name == %s val == %f \n",
	     cell->x, cell->y, cell->dir, cell->radius,
	     cell->parts_name,
	     cell->val);
    }
    if(cur->next)
      cur= cur->next;
    else
      cur= cur->children;
  }

  return 1;
}

int looktest_grr_xml_parse_template(){
  xmlDocPtr   doc;
  xmlNodePtr  cur;
  GrrXmlCell* cell;
  GrrXmlTemplate * template, * tmp_template;
  template= NULL;
  doc= xmlParseFile(TEST_XML_FILE_NAME);
  cur= doc->children;
  if( strcmp( cur->name, "GaborRg" ) == 0 ){
    cur= cur->children;
    if (strcmp(cur->name, "Templates") == 0){
      cur= cur->children;
      while(cur){
	tmp_template= grr_xml_parse_template(doc, cur);
	tmp_template->next= template;
	template= tmp_template;
	cur= cur->next;
      }
    }
  }
  rdump_grr_xml_template(template);
}

int looktest_grr_xml_parse_file(){
  GrrXmlGaborRg* gaborrg;
  gaborrg= grr_xml_parse_file(TEST_XML_FILE_NAME);
  alldump_grr_xml_gaborrg(gaborrg);
}

int rdump_grr_xml_template(GrrXmlTemplate* template){
  /* dump recursive */
  printf("GrrXmlTemplate\n");
  while(template){
    printf("width %d, height %d, num_cells %d, cell(ptr) %ld, next(ptr) %ld\n",
	   template->width,
	   template->height,
	   template->num_cells,
	   (long int) template->cell,
	   (long int) template->next
	   );
    template= template->next;
  }
  return 1;
}

int rdump_grr_xml_cell(GrrXmlCell* cell){
  int first= 0;
  while(cell){
    if (!first){
      printf("GrrXmlCell\n");
      first= 1;
    }
    printf("cell->(x == %d y == %d, dir == %d radius == %d parts_name == %s val == %f \n",
	   cell->x, cell->y, cell->dir, cell->radius,
	   cell->parts_name,
	   cell->val);
    cell= cell->next;
  }
}

int alldump_grr_xml_gaborrg(GrrXmlGaborRg* gaborrg){
  printf("GrrXmlGaborRg\n");
  printf("GrrXmlGaborRg->num_templates %d\n", gaborrg->num_templates);
  alldump_grr_xml_template(gaborrg->template);
  return 0;
}

int alldump_grr_xml_template(GrrXmlTemplate* template){
  int first= 0;
  while(template){
    printf("GrrXmlTemplate\n");
    printf("width %d, height %d, num_cells %d, cell(ptr) %ld, next(ptr) %ld\n",
	   template->width,
	   template->height,
	   template->num_cells,
	   (long int) template->cell,
	   (long int) template->next
	   );
    rdump_grr_xml_cell(template->cell);
    template= template->next;
  }
  return 1;
}

int main(void){
  /*grr_xml_parse_file("gaborrg.xml");*/
  printf("looktest:   looktest_grr_xml_parse_cell()\n");
  /*looktest_grr_xml_parse_cell();
    looktest_grr_xml_parse_template();*/
  looktest_grr_xml_parse_file();
  /*grr_gui_setup(NULL, NULL);*/

  return 1;
}

