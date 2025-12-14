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

GrrDiscData* grr_xml_gaborrg_to_grr_disc_data(GrrXmlGaborRg* gaborrg){
  char * parts_name;
  int j, cell_num;
  GrrXmlTemplate   * template;
  GrrXmlCell       * cell, tmp_cell;
  GrrDiscData      * disc_data;
  GrrDiscDataClass * data_class;
  GrrDiscDataNode  * node;
  
  template                   = gaborrg->template;
  disc_data                  = calloc(1, sizeof(GrrDiscData));
  disc_data->data_classes    = data_class= NULL;
  disc_data->data_classes_num= 0;
  disc_data->all_node_num    = 0;
  while(template){
    cell= template->cell;
    parts_name= NULL;
    while(cell){
      /* if (parts_name is changed)
       *   make new node
       *     if (the parts_name is appear first)
       *        make new data_class
       */
      if((! parts_name) || strcmp (parts_name, cell->parts_name)){
	j= 0;
	parts_name  = cell->parts_name;
	node        = calloc(1,sizeof(GrrDiscDataNode));
	node->values= calloc(template->num_cells, sizeof(double)); 
	node->dim   = 0;
	data_class  = lookup_data_class_by_name(disc_data->data_classes, parts_name);

	disc_data->all_node_num++;

	if(! data_class){
	  /* make new data_class */
	  data_class          = calloc(1, sizeof(GrrDiscDataClass));
	  data_class->name    = parts_name;
	  data_class->node_num= 0;
	  data_class->node    = NULL;
	  /* add data_class to disc_data->data_classes */
	  grr_disc_data_push_grr_disc_data_class(disc_data, data_class);
	}
	node->data_class= data_class;
	/* add node to data_class->node */
	grr_disc_data_class_push_grr_disc_data_node(data_class, node);
      }
      /* set cell->val to node->values[j]*/
      node->values[j]= cell->val;

      node->dim++;
      cell= cell->next;
      j++;
    }
    template= template->next;
  }
  return disc_data;
}

GrrDiscDataClass* lookup_data_class_by_name(GrrDiscDataClass* data_class, char* name){
  GrrDiscDataClass* cur_data_class;
  cur_data_class= data_class;
  while(cur_data_class){
    if( strcmp(cur_data_class->name, name) == 0){
      return cur_data_class;
    }
    cur_data_class= cur_data_class->next;
  }
  return NULL;
}

void grr_disc_data_push_grr_disc_data_class(GrrDiscData* disc_data,
					   GrrDiscDataClass* data_class){
  /* push data_class to disc_data->data_classes*/
  data_class->next       = disc_data->data_classes;
  disc_data->data_classes= data_class;
  
  disc_data->data_classes_num++;
}

void grr_disc_data_class_push_grr_disc_data_node(GrrDiscDataClass* data_class,
						GrrDiscDataNode*  node){
  node->next      = data_class->node;
  data_class->node= node;

  data_class->node_num++;
}

int grr_disc_data_node_dump(GrrDiscDataNode* node){
  printf("GrrDiscDataNode->dim  %d\n", node->dim);
  printf("GrrDiscDataNode->values[i]  ");

  int i;
  for(i= 0; i < node->dim; i++){
    printf("%f ",node->values[i]);
  }

  printf("GrrDiscDataNode->data_class %ld\n", (long int) node->data_class);
  printf("GrrDiscDataNode->next %ld\n",       (long int) node->next);
  return 0;
}

int grr_disc_data_class_dump(GrrDiscDataClass* data_class){
  printf("GrrDiscDataClass");
  printf("name %s\n node %ld, node_num %d, next %ld \n",
	 data_class->name,
	 data_class->node,
	 data_class->node_num,
	 data_class->next);
  
  return 0;
}
