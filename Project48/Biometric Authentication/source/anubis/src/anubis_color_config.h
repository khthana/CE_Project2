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
#ifndef __ANUBIS_COLOR_CONFIG_H__
#define __ANUBIS_COLOR_CONFIG_H__

#include <limits.h>
#include <config.h>
#include <malib/malib.h>
#include <malib/buffer.h>
#include <malib/filter.h>

BEGIN_C_DECLS

typedef struct _AnubisColorConfig      AnubisColorConfig;
typedef struct _AnubisColorConfigClass AnubisColorConfigClass;

struct _AnubisColorConfig
{
  MalibFilter super;

  int alpha;
  double red;
  double green;
  double blue;
};

struct _AnubisColorConfigClass
{
  MalibFilterClass super;
};

AnubisColorConfig* anubis_color_config_new ();
AnubisColorConfig*
anubis_color_config_new_with_buf_inner (MalibBuffer* buf);

AnubisColorConfig* anubis_color_config_new_with_buf (MalibBuffer* buf);

void anubis_color_config_set_buffer (AnubisColorConfig* filter, MalibBuffer* buf);

gboolean
on_alpha_hscale1_button_value_change (GtkAdjustment* adj,
				      gpointer       user_data);

gboolean
on_color_hscale_button_value_change (GtkAdjustment* adj,
				     gpointer       user_data);

END_C_DECLS

#endif /* __ANUBIS_COLOR_CONFIG_H__ */
