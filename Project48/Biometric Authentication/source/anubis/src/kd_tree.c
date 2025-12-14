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

KdTree* make_kd_tree_from_grr_disc_data(GrrDiscData* disc_data){
  GrrDiscDataClass * cur_class= NULL;
  GrrDiscDataNode * cur_node= NULL;

  /* pointing all of the node (+1 for last NULL node)*/
  GrrDiscDataNode *   tmp_node_ptr_array[disc_data->all_node_num + 1];
  int tmp_node_ptr_array_start, tmp_node_ptr_array_end;

  cur_class= disc_data->data_classes;
  int i= 0;
  /* make node ptr array */
  while(cur_class){
    cur_node= cur_class->node;
    while(cur_node){
      tmp_node_ptr_array[i]= cur_node;
      cur_node= cur_node->next;
      i++;
    }
    cur_class= cur_class->next;
  }
  tmp_node_ptr_array[i]= NULL; /* last is NULL */
  tmp_node_ptr_array_start= 0;
  tmp_node_ptr_array_end= i - 1; /* not include last NULL node for len */

  KdTree* tree= calloc(1, sizeof(KdTree));
  tree->max_dim= tmp_node_ptr_array[0]->dim;
  tree->root_node=
    make_kd_tree_from_grr_disc_data_node_ptr_array(tmp_node_ptr_array, 0,
						   i, tree->max_dim);
  return tree;
}

KdNode* make_kd_tree_from_grr_disc_data_node_ptr_array(GrrDiscDataNode* node_ptr_array[],
						       int depth,
						       int array_len,
						       int maxdim
						       )
{
  KdNode* kd_node= calloc(1,sizeof(KdNode));
  int cur_dim= 1;
  if( depth )
    cur_dim= (depth % (maxdim - 1)) + 1;
  kd_node->cur_dim= cur_dim;
  kd_node->left_node= kd_node->right_node= NULL;

  if( array_len == 1 ){
    kd_node->is_leaf= 1;
    kd_node->values= node_ptr_array[0]->values;
    kd_node->item= node_ptr_array[0]; /* insert GrrDiscDataNode */
  }else{
    int center_len= array_len / 2;
    GrrDiscDataNode * left_node_ptr_array[array_len], * right_node_ptr_array[array_len];
    kd_node->is_leaf= 0;
    /* quick sort */
    grr_disc_data_node_ptr_array_qsort_by_x_dim(node_ptr_array,cur_dim + 1, 0, center_len);
    int i,j;
    for(i= 0; i < center_len; i++){
      left_node_ptr_array[i]= node_ptr_array[i];
    }
    for(j= 0; i < array_len; i++,j++){
      right_node_ptr_array[j]= node_ptr_array[i];
    }
    /* next tree */
    kd_node->center_value= node_ptr_array[center_len - 1]->values[cur_dim - 1];
    kd_node->left_node=
      make_kd_tree_from_grr_disc_data_node_ptr_array(left_node_ptr_array, depth + 1,
						     center_len, maxdim);
    kd_node->right_node=
      make_kd_tree_from_grr_disc_data_node_ptr_array(right_node_ptr_array, depth + 1,
						     array_len - center_len, maxdim);
  }
  return kd_node;    
}

KdNode* search_kd_tree_nearest_with_center_co(KdTree* kd_tree,
					      KdNodeVal * center_co, KdNodeVal rad){
  KdNode * nearest_node= NULL;
  nearest_node= search_kd_node_nearest_with_center_co(kd_tree, kd_tree->root_node,
						      nearest_node, center_co, rad, 0);
  return nearest_node;
}

KdNode* search_kd_node_nearest_with_center_co(KdTree* kd_tree, KdNode* kd_node,
					      KdNode* nearest_node, 
					      KdNodeVal * center_co, KdNodeVal rad,
					      int depth){
  /* search by center coordinate and those radius */
  int array_dim= 0;
  KdNodeVal cur_dist= 0.0;
  double tmpval;

  if( depth )
    array_dim= (depth % (kd_tree->max_dim - 1));
  if(kd_node->is_leaf){
    /* calc distance */
    int i;
    /* calc before current array_dim */
    for(i= 0; i < array_dim; i++){
      /* forrow dosen't make good result. I don't know what is wrong */
      /*cur_dist+= pow(kd_node->values[i] - center_co[i], 2);*/
      tmpval   = kd_node->values[i] - center_co[i];
      cur_dist+= tmpval * tmpval;
    }
    /* calc current array_dim to max_dim */
    for( ; i < kd_tree->max_dim; i++){
      if( kd_node->values[i] < center_co[i] - rad ||
	  kd_node->values[i] > center_co[i] + rad)
	return nearest_node;/* not change */
      /* cur_dist+= pow(kd_node->values[i] - center_co[i], 2); */
      tmpval   = kd_node->values[i] - center_co[i];
      cur_dist+= tmpval * tmpval;
    }
    /* new nearest node */
    if( ! nearest_node || cur_dist < nearest_node->nearest_dist ){
      if( ! nearest_node )
	nearest_node= calloc(1, sizeof(KdNode));
      memcpy(nearest_node, kd_node, sizeof(KdNode));
      nearest_node->nearest_dist= cur_dist;
    }
    return nearest_node;
  }else{
    if( ( center_co[array_dim] - rad ) < kd_node->center_value ){
      /* if overlapping left region with values[dim] - rad */
      nearest_node= search_kd_node_nearest_with_center_co(kd_tree, kd_node->left_node,
							  nearest_node, center_co,
							  rad, depth + 1);
    }
    if( ( center_co[array_dim] + rad ) > kd_node->center_value ){
      nearest_node= search_kd_node_nearest_with_center_co(kd_tree, kd_node->right_node,
							  nearest_node, center_co,
							  rad, depth + 1);
    }
  }
  return nearest_node;
}

void grr_disc_data_node_ptr_array_qsort_by_x_dim(GrrDiscDataNode* tmp_node_ptr_array[],
						 int dim,
						 int tmp_node_ptr_array_start,
						 int tmp_node_ptr_array_end)
{
  int center;
  GrrDiscDataNode * tmp_node_ptr;
  
  if( tmp_node_ptr_array_start < tmp_node_ptr_array_end ){
    center= grr_disc_data_node_ptr_array_partition_by_x_dim(tmp_node_ptr_array, dim,
							    tmp_node_ptr_array_start,
							    tmp_node_ptr_array_end);
    grr_disc_data_node_ptr_array_qsort_by_x_dim(tmp_node_ptr_array,
						dim,
						tmp_node_ptr_array_start,
						center);
    grr_disc_data_node_ptr_array_qsort_by_x_dim(tmp_node_ptr_array,
						dim,
						center + 1,
						tmp_node_ptr_array_end);
  }
  return;
}

  
int grr_disc_data_node_ptr_array_partition_by_x_dim(GrrDiscDataNode* tmp_node_ptr_array[],
						    int dim,
						    int tmp_node_ptr_array_start,
						    int tmp_node_ptr_array_end)
{
  int i= tmp_node_ptr_array_start - 1;
  int j= tmp_node_ptr_array_end + 1;
  GrrDiscDataNode * tmp_node_ptr;

  double key_val = tmp_node_ptr_array[tmp_node_ptr_array_start]->values[ dim - 1 ];
  while(1){
    while(1){
      j--;
      if( tmp_node_ptr_array[j]->values[dim - 1] <= key_val)
	break;
    }
    while(1){
      i++;
      if(tmp_node_ptr_array[i]->values[dim - 1] >= key_val)
	break;
    }
    if ( i < j ){
      tmp_node_ptr= tmp_node_ptr_array[i];
      tmp_node_ptr_array[i]= tmp_node_ptr_array[j];
      tmp_node_ptr_array[j]= tmp_node_ptr;
    }else{
      return j;
    }
  }
}

GrrDiscData* load_grr_disc_data_from_xml_file(char* fname){
  GrrXmlGaborRg * gaborrg;
  GrrDiscData * disc_data;
  gaborrg= grr_xml_parse_file(fname);
  disc_data= grr_xml_gaborrg_to_grr_disc_data(gaborrg);
  return disc_data;
}

KdTree* load_kd_tree_from_xml_file(char* fname){
  /* replace to make_kd_tree_from_grr_disc_data */
  GrrXmlGaborRg * gaborrg;
  GrrDiscData * disc_data;
  KdTree * kd_tree;

  gaborrg= grr_xml_parse_file(fname);

  disc_data= grr_xml_gaborrg_to_grr_disc_data(gaborrg);
  kd_tree= make_kd_tree_from_grr_disc_data(disc_data);
  
  return kd_tree;
}
  
  
  
