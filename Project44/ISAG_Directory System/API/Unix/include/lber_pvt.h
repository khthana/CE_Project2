/* $OpenLDAP: pkg/ldap/include/lber_pvt.h,v 1.8 2000/05/13 00:26:27 kurt Exp $ */
/* $Novell: /ldap/src/cldap/include/lber_pvt.h,v 1.6 2001/02/14 00:15:37 dsteck Exp $ */
/*
 * Copyright 1998-2000 The OpenLDAP Foundation, Redwood City, California, USA
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms are permitted only
 * as authorized by the OpenLDAP Public License.  A copy of this
 * license is available at http://www.OpenLDAP.org/license.html or
 * in file LICENSE in the top-level directory of the distribution.
 ******************************************************************************
 * This notice applies to changes, created by or for Novell, Inc.,
 * to preexisting works for which notices appear elsewhere in this file.
 *
 * Copyright (C) 1999, 2000 Novell, Inc. All Rights Reserved.
 *
 * THIS WORK IS SUBJECT TO U.S. AND INTERNATIONAL COPYRIGHT LAWS AND TREATIES.
 * USE, MODIFICATION, AND REDISTRIBUTION OF THIS WORK IS SUBJECT TO VERSION
 * 2.0.7 OF THE OPENLDAP PUBLIC LICENSE, A COPY OF WHICH IS AVAILABLE AT
 * HTTP://WWW.OPENLDAP.ORG/LICENSE.HTML OR IN THE FILE "LICENSE" IN THE
 * TOP-LEVEL DIRECTORY OF THE DISTRIBUTION. ANY USE OR EXPLOITATION OF THIS
 * WORK OTHER THAN AS AUTHORIZED IN VERSION 2.0.7 OF THE OPENLDAP PUBLIC
 * LICENSE, OR OTHER PRIOR WRITTEN CONSENT FROM NOVELL, COULD SUBJECT THE
 * PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY. 
 ******************************************************************************
 * Modification to OpenLDAP source by Novell, Inc.
 * Jan 13, 2000   sfs
 * Change variables to use variable extern def instead of function def
 */
/*
 * lber_pvt.h - Header for ber_pvt_ functions. These are meant to be used
 * 		by the OpenLDAP distribution only.
 */

#ifndef _LBER_PVT_H
#define _LBER_PVT_H 1

#include <lber.h>

LDAP_BEGIN_DECL

/*
 * bprint.c
 */
LBER_V( BER_LOG_PRINT_FN ) ber_pvt_log_print;

LBER_F( int )
ber_pvt_log_printf LDAP_P((
	int errlvl,
	int loglvl,
	const char *fmt,
	... )) LDAP_GCCATTR((format(printf, 3, 4)));

LDAP_END_DECL

#endif

