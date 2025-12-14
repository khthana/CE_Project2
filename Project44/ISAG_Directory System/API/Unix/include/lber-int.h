/* $OpenLDAP: pkg/ldap/libraries/liblber/lber-int.h,v 1.23.2.6 2000/09/15 16:13:51 kurt Exp $ */
/* $Novell: /ldap/src/cldap/libraries/liblber/lber-int.h,v 1.11 2001/02/13 22:22:06 dsteck Exp $ */
/*
 * Copyright 1998-2000 The OpenLDAP Foundation, All Rights Reserved.
 * COPYING RESTRICTIONS APPLY, see COPYRIGHT file
 */
/* Portions
 * Copyright (c) 1990 Regents of the University of Michigan.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms are permitted
 * provided that this notice is preserved and that due credit is given
 * to the University of Michigan at Ann Arbor. The name of the University
 * may not be used to endorse or promote products derived from this
 * software without specific prior written permission. This software
 * is provided ``as is'' without express or implied warranty.
 ******************************************************************************
 * Modification to OpenLDAP source by Novell, Inc.
 * Feb 2, 2001  dks
 * Many unexposed internal API's moved here from lber.h.
 * LBER_F declarations removed on internal routines.
 * LBER_V declarations used consistently on variables.
 */

#ifndef _LBER_INT_H
#define _LBER_INT_H

#include "lber.h"
#include "ldap_log.h"
#include "lber_pvt.h"

LDAP_BEGIN_DECL

LBER_V (BER_ERRNO_FN) ber_int_errno_fn;

struct lber_options {
	short lbo_valid;
	unsigned short		lbo_options;
	int			lbo_debug;
	long		lbo_meminuse;
};

#define LBER_UNINITIALIZED		0x0
#define LBER_INITIALIZED		0x1
#define LBER_VALID_BERELEMENT	0x2
#define LBER_VALID_SOCKBUF		0x3

LBER_V (struct lber_options) ber_int_options;
#define ber_int_debug ber_int_options.lbo_debug

struct berelement {
	struct		lber_options ber_opts;
#define ber_valid		ber_opts.lbo_valid
#define ber_options		ber_opts.lbo_options
#define ber_debug		ber_opts.lbo_debug

	ber_tag_t	ber_usertag;

	ber_tag_t	ber_tag;
	ber_len_t	ber_len;

	char		*ber_buf;
	char		*ber_ptr;
	char		*ber_end;

	struct seqorset	*ber_sos;
	char		*ber_rwptr;
};
#define BER_VALID(ber)	((ber)->ber_valid==LBER_VALID_BERELEMENT)

#define ber_pvt_ber_remaining(ber)	((ber)->ber_end - (ber)->ber_ptr)
#define ber_pvt_ber_total(ber)		((ber)->ber_end - (ber)->ber_buf)
#define ber_pvt_ber_write(ber)		((ber)->ber_ptr - (ber)->ber_buf)

struct sockbuf;

struct sockbuf_io {
	int	(LIBCALL *sbi_setup)( struct sockbuf * sb, void *arg );
	int	(LIBCALL *sbi_remove)( struct sockbuf *sb );
	
   ber_slen_t  (LIBCALL *sbi_read)( ber_socket_t s, void *buf, int len );
   ber_slen_t  (LIBCALL *sbi_write)( ber_socket_t s, void *buf, int len );
   int         (LIBCALL *sbi_close)( ber_socket_t s );
   int         (LIBCALL *sbi_ioctl)( ber_socket_t s, long cmd, void *arg );
};

struct sockbuf_sec {
	int	(*sbs_setup)( struct sockbuf * sb, void *arg );
	int	(*sbs_remove)( struct sockbuf *sb );
   
	long	(*sbs_protect)( struct sockbuf *sb, char *in, long *ilen,
			        char *out, long olen );
	long	(*sbs_release)( struct sockbuf *sb, char *in, long ilen,
			       char *out0, long olen0, char *out1, long olen1 );
};

struct sockbuf_buf {
	ber_len_t	buf_size;
	ber_len_t	buf_ptr;
	ber_len_t	buf_end;
	char	*buf_base;
};

typedef struct sockbuf_io Sockbuf_IO;
typedef struct sockbuf_sec Sockbuf_Sec;
typedef struct sockbuf_buf Sockbuf_Buf;

LBER_V( Sockbuf_IO ) ber_pvt_sb_io_tcp;
LBER_V( Sockbuf_IO ) ber_pvt_sb_io_udp;


struct sockbuf {
	struct lber_options sb_opts;
#define	sb_valid		sb_opts.lbo_valid
#define	sb_options		sb_opts.lbo_options
#define	sb_debug		sb_opts.lbo_debug

	int		sb_non_block:1;	
	int		sb_read_ahead:1;
   
	int		sb_buf_ready:1;
	int		sb_trans_ready:1;
   	int		sb_sec_ready:1;
      
   	/* these bits indicate if the transport layer 
	 * needs to read or write 
	 */
   	int		sb_trans_needs_read:1;
   	int		sb_trans_needs_write:1;

   	int		sb_fd;
   
	void		*sb_iodata;	/* transport-layer data pointer */
   Sockbuf_IO  sb_io;      /* I/O functions */
   
#ifdef LDAP_SASL
   	void		*sb_sdata;	/* security-layer data pointer */
	Sockbuf_Sec	*sb_sec;
#endif	

	ber_socket_t	sb_sd;

#ifdef DEADWOOD
	long		sb_max_incoming;
#endif
	Sockbuf_Buf	sb_buf;
#ifdef LDAP_SASL   
	Sockbuf_Buf	sb_sec_buf_in;
	Sockbuf_Buf	sb_sec_buf_out;
	ber_len_t	sb_sec_prev_len;
#endif   
};

#define SOCKBUF_VALID( sb )	( (sb)->sb_valid == LBER_VALID_SOCKBUF )

/* these should be internal ie: ber_int_* */
#define	ber_pvt_sb_get_desc( sb ) ((sb)->sb_sd)
#define ber_pvt_sb_set_desc( sb, val ) ((sb)->sb_sd =(val))

#define ber_pvt_sb_in_use( sb ) ((sb)->sb_sd != AC_SOCKET_INVALID)

#ifdef USE_SASL
#define ber_pvt_sb_data_ready( sb ) \
(((sb)->sb_buf_ready) || ((sb)->sb_trans_ready) || ((sb)->sb_sec_ready))
#else
#define ber_pvt_sb_data_ready( sb ) \
(((sb)->sb_buf_ready) || ((sb)->sb_trans_ready))
#endif
#define ber_pvt_sb_needs_read( sb ) \
((sb)->sb_trans_needs_read)
#define ber_pvt_sb_needs_write( sb ) \
((sb)->sb_trans_needs_write)

#define READBUFSIZ	8192

struct seqorset {
	BerElement	*sos_ber;
	ber_len_t	sos_clen;
	ber_tag_t	sos_tag;
	char		*sos_first;
	char		*sos_ptr;
	struct seqorset	*sos_next;
};


/*
 * bprint.c
 */
#define ber_log_printf ber_pvt_log_printf

int
ber_log_bprint LDAP_P((
	int errlvl,
	int loglvl,
	const char *data,
	ber_len_t len ));

int
ber_log_dump LDAP_P((
	int errlvl,
	int loglvl,
	BerElement *ber,
	int inout ));

int
ber_log_sos_dump LDAP_P((
	int errlvl,
	int loglvl,
	Seqorset *sos ));


/* memory.c */
	/* simple macros to realloc for now */
LBER_V (BerMemoryFunctions *)	ber_int_memory_fns;

#ifdef CSRIMALLOC
#define LBER_INT_MALLOC		malloc
#define LBER_INT_CALLOC		calloc
#define LBER_INT_REALLOC	realloc
#define LBER_INT_FREE		free
#define LBER_INT_VFREE		ber_memvfree
#define LBER_INT_STRDUP		strdup

#define LBER_MALLOC			malloc
#define LBER_CALLOC			calloc
#define LBER_REALLOC		realloc
#define LBER_FREE			free
#define LBER_VFREE			ber_memvfree
#define LBER_STRDUP			strdup

#else
#define LBER_INT_MALLOC(s)		ber_memalloc((s))
#define LBER_INT_CALLOC(n,s)	ber_memcalloc((n),(s))
#define LBER_INT_REALLOC(p,s)	ber_memrealloc((p),(s))
#define LBER_INT_FREE(p)		ber_memfree((p))
#define LBER_INT_VFREE(v)		ber_memvfree((void**)(v))
#define LBER_INT_STRDUP(s)		ber_strdup((s))

#define LBER_MALLOC(s)		ber_memalloc((s))
#define LBER_CALLOC(n,s)	ber_memcalloc((n),(s))
#define LBER_REALLOC(p,s)	ber_memrealloc((p),(s))
#define LBER_FREE(p)		ber_memfree((p))	
#define LBER_VFREE(v)		ber_memvfree((void**)(v))
#define LBER_STRDUP(s)		ber_strdup((s))
#endif

/* sockbuf.c */

/* These should be ber_int*() functions */

int
ber_pvt_sb_init LDAP_P(( Sockbuf *sb ));

int
ber_pvt_sb_destroy LDAP_P(( Sockbuf *sb ));

#ifdef USE_SASL
int
ber_pvt_sb_set_sec LDAP_P(( Sockbuf *sb, Sockbuf_Sec *sec, void *arg ));

int
ber_pvt_sb_clear_sec LDAP_P(( Sockbuf *sb ));
#endif

int
ber_pvt_sb_set_io LDAP_P(( Sockbuf *sb, Sockbuf_IO *layer, void *arg ));

int
ber_pvt_sb_clear_io LDAP_P(( Sockbuf *sb ));

int
ber_pvt_sb_close LDAP_P((Sockbuf *sb ));

int
ber_pvt_sb_set_nonblock LDAP_P(( Sockbuf *sb, int nb ));

int
ber_pvt_sb_set_readahead LDAP_P(( Sockbuf *sb, int rh ));

ber_slen_t
ber_pvt_sb_read LDAP_P(( Sockbuf *sb, void *buf, ber_len_t len ));

ber_slen_t
ber_pvt_sb_write LDAP_P(( Sockbuf *sb, void *buf, ber_len_t len ));


/*  
 * Non-standard unexposed API's. Moved here from lber.h  
 */
void 
ber_bprint LDAP_P((
	LDAP_CONST char *data, ber_len_t len ));

void 
ber_dump LDAP_P((
	BerElement *ber, int inout ));

void 
ber_sos_dump LDAP_P((
	Seqorset *sos ));

BerElement *
ber_dup LDAP_P((
	BerElement *ber ));

ber_tag_t
ber_get_next LDAP_P((
	Sockbuf *sb,
	ber_len_t *len,
	BerElement *ber ));

void
ber_init_w_nullc LDAP_P((
	BerElement *ber,
	int options ));

void
ber_reset LDAP_P((
	BerElement *ber,
	int was_writing ));

ber_tag_t
ber_get_tag LDAP_P((
	BerElement *ber ));

ber_tag_t
ber_get_int LDAP_P((
	BerElement *ber,
	ber_int_t *num ));

ber_tag_t
ber_get_stringb LDAP_P((
	BerElement *ber,
	char *buf,
	ber_len_t *len ));

ber_tag_t
ber_get_stringa LDAP_P((
	BerElement *ber,
	char **buf ));

ber_tag_t
ber_get_stringal LDAP_P((
	BerElement *ber,
	struct berval **bv ));

ber_tag_t
ber_get_bitstringa LDAP_P((
	BerElement *ber,
	char **buf,
	ber_len_t *len ));

ber_tag_t
ber_get_null LDAP_P((
	BerElement *ber ));

ber_tag_t
ber_get_boolean LDAP_P((
	BerElement *ber,
	ber_int_t *boolval ));

int
ber_put_enum LDAP_P((
	BerElement *ber,
	ber_int_t num,
	ber_tag_t tag ));

int
ber_put_int LDAP_P((
	BerElement *ber,
	ber_int_t num,
	ber_tag_t tag ));

int
ber_put_ostring LDAP_P((
	BerElement *ber,
	LDAP_CONST char *str,
	ber_len_t len,
	ber_tag_t tag ));

int
ber_put_berval LDAP_P((
	BerElement *ber,
	LDAP_CONST struct berval *bv,
	ber_tag_t tag ));

int
ber_put_string LDAP_P((
	BerElement *ber,
	LDAP_CONST char *str,
	ber_tag_t tag ));

int
ber_put_bitstring LDAP_P((
	BerElement *ber,
	LDAP_CONST char *str,
	ber_len_t bitlen,
	ber_tag_t tag ));

int
ber_put_null LDAP_P((
	BerElement *ber,
	ber_tag_t tag ));

int
ber_put_boolean LDAP_P((
	BerElement *ber,
	ber_int_t boolval,
	ber_tag_t tag ));

int
ber_start_seq LDAP_P((
	BerElement *ber,
	ber_tag_t tag ));

int
ber_start_set LDAP_P((
	BerElement *ber,
	ber_tag_t tag ));

int
ber_put_seq LDAP_P((
	BerElement *ber ));

int
ber_put_set LDAP_P((
	BerElement *ber ));

ber_slen_t
ber_read LDAP_P((
	BerElement *ber,
	char *buf,
	ber_len_t len ));

ber_slen_t
ber_write LDAP_P((
	BerElement *ber,
	LDAP_CONST char *buf,
	ber_len_t len,
	int nosos ));

int
ber_flush LDAP_P((
	Sockbuf *sb,
	BerElement *ber,
	int freeit ));

/*
 * LBER sockbuf.c
 */

Sockbuf *
ber_sockbuf_alloc( void );

void
ber_sockbuf_free(
	Sockbuf *sb );

struct berval *
ber_bvstr LDAP_P((
	LDAP_CONST char * ));

struct berval *
ber_bvstrdup LDAP_P((
	LDAP_CONST char * ));

/*
 * LBER error.c
 */
int *ber_errno_addr LDAP_P((void));
#define ber_errno (*(ber_errno_addr)())

/* LBER memory.c */

void *
ber_memalloc LDAP_P((
	ber_len_t s ));

void *
ber_memrealloc LDAP_P((
	void* p,
	ber_len_t s ));

void *
ber_memcalloc LDAP_P((
	ber_len_t n,
	ber_len_t s ));

void
ber_memfree LDAP_P((
	void* p ));

void
ber_memvfree LDAP_P((
	void** vector ));

char *
ber_strdup LDAP_P((
	LDAP_CONST char * ));

int
ber_realloc LDAP_P((
	BerElement *ber,
	ber_len_t len ));



LDAP_END_DECL

#endif /* _LBER_INT_H */
