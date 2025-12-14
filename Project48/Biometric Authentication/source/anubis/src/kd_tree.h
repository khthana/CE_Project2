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
#ifndef __KD_TREE_H__
#define __KD_TREE_H__

#include <malib/malib.h>
BEGIN_C_DECLS
typedef struct _KdTree KdTree;
typedef struct _KdNode KdNode;
typedef struct _KdLeaf KdLeaf;
typedef double KdNodeVal;
#include "gaborrg_recog.h"
#include "gaborrg_recog_file_io.h"
#include "discriminator.h"

struct _KdTree{
  KdNode * root_node;
  int max_dim; /* maximam dimention */
};

struct _KdNode{
  int cur_dim; /* dimention */
  double center_value;/* maximam of the left node current dimention value */
  KdNode * left_node, * right_node;
  
  int is_leaf;
  KdNodeVal * values;
  void * item; /* insert GrrDiscDataNode */

  KdNodeVal nearest_dist;/* for seek nearest */
  int nearest_x;
  int nearest_y;
};

KdTree* make_kd_tree_from_grr_disc_data(GrrDiscData*);
KdNode* make_kd_tree_from_grr_disc_data_node_ptr_array(GrrDiscDataNode* node_ptr_array[],
						       int depth, int array_len, int dim);
void grr_disc_data_node_ptr_array_qsort_by_x_dim(GrrDiscDataNode*[], int, int, int);
int grr_disc_data_node_ptr_array_partition_by_x_dim(GrrDiscDataNode*[], int, int, int);

KdNode* search_kd_tree_nearest_with_center_co(KdTree* kd_tree,
					      KdNodeVal * center_co, KdNodeVal rad);
KdNode* search_kd_node_nearest_with_center_co(KdTree* kd_tree, KdNode* kd_node,
					      KdNode* nearest_node, 
					      KdNodeVal * center_co, KdNodeVal rad,
					      int depth);
GrrDiscData* load_grr_disc_data_from_xml_file(char* fname);
KdTree* load_kd_tree_from_xml_file(char* fname);

END_C_DECLS
#endif /* __KD_TREE_H__ */
