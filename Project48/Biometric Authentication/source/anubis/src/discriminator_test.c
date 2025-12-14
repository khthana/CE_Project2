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

#include "discriminator.h"
#define TEST_XML_FILE_NAME "gaborrg.test.xml"

int looktest_grr_xml_gaborrg_to_grr_disc_data(){
  GrrXmlGaborRg * gaborrg;
  GrrDiscData * disc_data= NULL;
  GrrDiscDataClass * cur_class= NULL;
  GrrDiscDataNode * cur_node= NULL;
  
  gaborrg= grr_xml_parse_file(TEST_XML_FILE_NAME);
  disc_data= grr_xml_gaborrg_to_grr_disc_data(gaborrg);
  printf("disc_data->data_classes_num %d\n disc_data->all_node_num %d\n",
	 disc_data->data_classes_num, disc_data->all_node_num);
  if (disc_data){
    cur_class= disc_data->data_classes;
    while(cur_class){
      grr_disc_data_class_dump(cur_class);
      cur_node= cur_class->node;
      while(cur_node){
	grr_disc_data_node_dump(cur_node);
	cur_node= cur_node->next;
      }
      cur_class= cur_class->next;
    }
  }
}

int main(void){
  looktest_grr_xml_gaborrg_to_grr_disc_data();
  return 0;
}
