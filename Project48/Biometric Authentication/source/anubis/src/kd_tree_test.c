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
#include "kd_tree.h"
#define TEST_XML_FILE_NAME "gaborrg.test.xml"
int main(void){
  GrrXmlGaborRg * gaborrg;
  GrrDiscData * disc_data;
  KdTree * kd_tree;
  gaborrg=   grr_xml_parse_file(TEST_XML_FILE_NAME);
  disc_data= grr_xml_gaborrg_to_grr_disc_data(gaborrg);

  test_grr_disc_data_node_ptr_array_qsort_by_x_dim();

  kd_tree= make_kd_tree_from_grr_disc_data(disc_data);
  dump_kd_tree(kd_tree);

  looktest_search_kd_tree_nearest_with_center_co();
  
  printf("kd_tree_test end\n");
}

int dump_kd_tree(KdTree* kd_tree){
  dump_kd_node(kd_tree->root_node, kd_tree->max_dim);
}

int dump_kd_node(KdNode* kd_node, int max_dim){
  printf("cur_dim %d\n", kd_node->cur_dim);
  if(! kd_node->is_leaf){
    printf("center_value %f \n", kd_node->center_value);
    printf("down to left from cur_dim %d\n", kd_node->cur_dim);
    dump_kd_node(kd_node->left_node, max_dim);
    printf("down to right from cur_dim %d\n", kd_node->cur_dim);
    dump_kd_node(kd_node->right_node, max_dim);
  }else{
    printf("is_leaf\n");
    printf("kd_node->values[i] ");
    int i;
    for(i= 0; i < max_dim; i++){
      printf("%f ", kd_node->values[i]);
    }
    printf("\n");
  }
}

test_grr_disc_data_node_ptr_array_qsort_by_x_dim(){
  int i,j;
  GrrXmlGaborRg * gaborrg= grr_xml_parse_file(TEST_XML_FILE_NAME);
  GrrDiscData * disc_data= grr_xml_gaborrg_to_grr_disc_data(gaborrg);
  GrrDiscDataNode * tmp_node_ptr_array[disc_data->all_node_num + 1];
  int tmp_node_ptr_array_start, tmp_node_ptr_array_end;

  int test_dim= 2;
  GrrDiscDataClass * cur_class= disc_data->data_classes;
  GrrDiscDataNode * cur_node;

  /* make node ptr array */
  /*printf("tmp_node_ptr_array[i]->values[test_dim] ");*/
  i= 0;
  while(cur_class){
    cur_node= cur_class->node;
    while(cur_node){
      tmp_node_ptr_array[i]= cur_node;
      cur_node= cur_node->next;
      i++;
    }
    cur_class= cur_class->next;
  }
  tmp_node_ptr_array[i]= NULL;
  
  tmp_node_ptr_array_start= 0;
  tmp_node_ptr_array_end= i - 1; /* not include last NULL node for len */

  printf("before sort\n");
  for(i= 0; i < tmp_node_ptr_array_end + 1; i++){
    printf("%f ", tmp_node_ptr_array[ i ]->values[ test_dim - 1 ]);
  }
  printf("\n");
  grr_disc_data_node_ptr_array_qsort_by_x_dim(tmp_node_ptr_array, test_dim,
					      tmp_node_ptr_array_start,
					      tmp_node_ptr_array_end);
  printf("after sort\n");
  for(i= 0; i < tmp_node_ptr_array_end + 1; i++){
    printf("%f ", tmp_node_ptr_array[ i ]->values[ test_dim - 1 ]);
  }
  printf("\n");
  return;
}

int looktest_search_kd_tree_nearest_with_center_co(){
  GrrXmlGaborRg * gaborrg;
  GrrDiscData * disc_data;
  KdTree * kd_tree;
  KdNode * nearest_node;
  GrrDiscDataNode * dummy_node;
  
  gaborrg=   grr_xml_parse_file(TEST_XML_FILE_NAME);
  disc_data= grr_xml_gaborrg_to_grr_disc_data(gaborrg);
  kd_tree= make_kd_tree_from_grr_disc_data(disc_data);
  dummy_node= disc_data->data_classes->node;

  printf("dummy_node->values[0] %f\n", dummy_node->values[0]);
  dummy_node->values[2]= 20;
  printf("dummy_node->values[i] ");
  int i= 0;
  for(i= 0; i < kd_tree->max_dim; i++){
    printf("%f ",dummy_node->values[i]);
  }
  printf("\n");
  printf("nearest_node->values[0] %f", dummy_node->values[0]);
  nearest_node=
    search_kd_tree_nearest_with_center_co(kd_tree, dummy_node->values, 10);

  if(nearest_node){
    printf("nearest_node %ld\n", nearest_node);
    printf("nearest_node->\ncur_dim %d\nnearest_dist %f\n",
	   nearest_node->cur_dim, nearest_node->nearest_dist);
    printf("nearest_node->item  %ld\n", nearest_node->item);
    printf("dump\n");
    grr_disc_data_node_dump((GrrDiscDataNode*) nearest_node->item);
    printf("class_name %s\n", ((GrrDiscDataNode*) nearest_node->item)->data_class->name);
    printf("nearest_node->values[i] ");
    for(i= 0; i < kd_tree->max_dim; i++){
      printf("%f ",nearest_node->values[i]);
    }
    printf("\n");
  }else{
    printf("return NULL\n");
  }
}
