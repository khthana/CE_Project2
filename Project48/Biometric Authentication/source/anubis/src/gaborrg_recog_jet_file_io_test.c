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

#define TEST_FILE_NAME "gaborrg.xml"
#define TEST_MASKS_FNAME "gaborrg.xml.masks"

int test_grj_xml_template_to_face_graph(){
  GrjXmlJets * xml_jets;
  FaceGraph  * face_graphs;

  xml_jets= grj_xml_parse_file(TEST_FILE_NAME);
  
  face_graphs= grj_xml_jets_to_face_graphs(xml_jets, TEST_MASKS_FNAME);
  
  return 0;
}

int test_grj_xml_parse_file(){
  GrjXmlJets* xml_jets;
  xmlDocPtr doc;

  doc     = xmlParseFile(TEST_FILE_NAME);
  xml_jets= grj_xml_parse_file(TEST_FILE_NAME);
  /*printf("GrjXmlTemplate->width        %d\n",  xml_jets->template->width);*/
  
  printf("GrjXmlJets->num_templates %d\n" , xml_jets->num_template);
  printf("GrjXmlJets->template      %ld\n", xml_jets->template);

  /* if you want to dump */
  /*test_grj_xml_dump_template(xml_jets->template);*/

  return 0;
}

int test_grj_xml_dump_template(GrjXmlTemplate* template){
  GrjXmlCells* cells;
  while(template){
    printf("GrjXmlTemplate\n");
    printf("GrjXmlTemplate->width        %d\n",  template->width);
    printf("GrjXmlTemplate->height       %d\n",  template->height);
    printf("GrjXmlTemplate->masks_fname  %s\n",  template->masks_fname);
    printf("GrjXmlTemplate->num_cells    %d\n",  template->num_cells);
    printf("GrjXmlTemplate->cells        %ld\n", template->cells);
    printf("GrjXmlTemplate->next         %ld\n", template->next);
    cells= template->cells;
    test_grj_xml_dump_cells(cells);
    template= template->next;
  }
  return 0;
}

int test_grj_xml_dump_cells(GrjXmlCells* cells){
  while(cells){
    printf("GrjXmlCells\n");
    printf("GrjXmlCells->x %d\n",        cells->x);
    printf("GrjXmlCells->y %d\n",        cells->y);
    printf("GrjXmlCells->parts_name %s\n", cells->parts_name);
    printf("GrjXmlCells->num_cell %d\n", cells->num_cell);
    printf("GrjXmlCells->next %ld\n",    cells->next);
    test_grj_xml_dump_cell(cells->cell);
    cells= cells->next;
  }
  return 0;
}

int test_grj_xml_dump_cell(GrjXmlCell* cell){
  while(cell){
    printf("GrjXmlCell->real %f\n",  cell->real);
    printf("GrjXmlCell->imag %f\n",  cell->imag);
    printf("GrjXmlCell->mag  %f\n",  cell->mag);
    printf("GrjXmlCell->ang  %f\n",  cell->ang);
    printf("GrjXmlCell->next %ld\n", cell->next);
    cell= cell->next;
  }
  return 0;
}

int main(void){
  grj_xml_parse_file(TEST_FILE_NAME);
  test_grj_xml_parse_file();
  return 0;
}
