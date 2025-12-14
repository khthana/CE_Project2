/* $Novell: /ldap/src/cldap/nldapx/ldapssl/src/sdkinc/ldap_ssl.h,v 1.18 2001/08/06 18:33:10 dsward Exp $ 
 *****************************************************************************
 * Copyright (C) 1999, 2000 Novell, Inc. All Rights Reserved.
 * 
 * THIS WORK IS SUBJECT TO U.S. AND INTERNATIONAL COPYRIGHT LAWS AND
 * TREATIES. USE, MODIFICATION, AND REDISTRIBUTION OF THIS WORK IS SUBJECT
 * TO VERSION 2.0.7 OF THE OPENLDAP PUBLIC LICENSE, A COPY OF WHICH IS
 * AVAILABLE AT HTTP://WWW.OPENLDAP.ORG/LICENSE.HTML OR IN THE FILE "LICENSE"
 * IN THE TOP-LEVEL DIRECTORY OF THE DISTRIBUTION. ANY USE OR EXPLOITATION
 * OF THIS WORK OTHER THAN AS AUTHORIZED IN VERSION 2.0.7 OF THE OPENLDAP
 * PUBLIC LICENSE, OR OTHER PRIOR WRITTEN CONSENT FROM NOVELL, COULD SUBJECT
 * THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY. 
 *****************************************************************************/
#if !defined(LDAP_SSL_H)
#define LDAP_SSL_H

#include <ldap.h>


#ifdef __cplusplus
extern "C" {
#endif

#define LDAPSSL_SUCCESS  0
#define LDAPSSL_ERROR   -1

#define LDAPSSL_VERIFY_NONE   0x00
#define LDAPSSL_VERIFY_SERVER 0x01

#define LDAPSSL_CERT_FILETYPE_B64   1
#define LDAPSSL_CERT_FILETYPE_DER   2
#define LDAPSSL_CERT_BUFFTYPE_B64   3
#define LDAPSSL_CERT_BUFFTYPE_DER   4

#define LDAPSSL_CERT_ATTR_ISSUER          1
#define LDAPSSL_CERT_ATTR_SUBJECT         2
#define LDAPSSL_CERT_ATTR_VALIDITY_PERIOD 3

#define LDAPSSL_CERT_UTC_TIME 1
#define LDAPSSL_CERT_GEN_TIME 2

#define LDAPSSL_CERT_ACCEPT 0
#define LDAPSSL_CERT_REJECT -1


typedef struct _LDAPSSL_Cert
{
    unsigned long    length;
    void            *data;

} LDAPSSL_Cert, *pLDAPSSL_Cert;


typedef struct _LDAPSSL_Cert_Validity_Period
{
   char  notBeforeTime[40];
   int   notBeforeType;
   char  notAfterTime[40];
   int   notAfterType;

} LDAPSSL_Cert_Validity_Period, *pLDAPSSL_Cert_Validity_Period;


/* APIs */
LDAP_F(int) ldapssl_client_init
(
   const char *certFile,
   void *reserved
);

LDAP_F(LDAP *) ldapssl_init
(
   const char *defhost,
   int defport,
   int defsecure
);

LDAP_F(int) ldapssl_install_routines
(
   LDAP *ld
);

LDAP_F(int) ldapssl_client_deinit
(
   void
);

LDAP_F(int) ldapssl_add_trusted_cert
(
   void *cert,
   int   type
);

LDAP_F(int) ldapssl_set_verify_mode
(
   int   mode
);

LDAP_F(int) ldapssl_get_verify_mode
(
   int   *mode
);

LDAP_F(int) ldapssl_set_verify_callback
(
   int (LIBCALL *certVerifyFunc)(void *)
);

LDAP_F(int) ldapssl_get_cert_attribute
(
   void          *certHandle,
   unsigned long  attrID,
   void          *value,
   int           *length
);

LDAP_F(int) ldapssl_get_cert
(
   void          *certHandle,
   unsigned long  encoding,
   LDAPSSL_Cert  *cert
);


#ifdef __cplusplus
}
#endif

#endif /* !defined(LDAP_SSL_H) */
