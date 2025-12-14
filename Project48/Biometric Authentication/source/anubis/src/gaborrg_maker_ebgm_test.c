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

#include <stdio.h>
#include "gaborrg_maker_ebgm.h"

int test_ebgm_write_params(){
  int i= 0;
  char* dirname= TMP_MASK_PARAM_FILE_DIR;
  char* fname=   TMP_MASK_FILE_NAME;

  fname= full_path_maker(dirname,fname);
  printf("grm_ebgm_write_default_params() write to %s", fname);
  grm_ebgm_write_default_params(fname);
}

int test_grm_default_jet_masks_setup(){
  JetMasks masks;
  masks= grm_default_jet_masks_setup();
  printf("JetMasks values\n");
  printf("masks->params->length = %d \n",masks->params->length);
  return 1;
}

int main(void){
  
  test_ebgm_write_params();
  test_grm_default_jet_masks_setup();
}


