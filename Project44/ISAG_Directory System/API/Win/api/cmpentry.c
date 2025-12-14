
#include "ldapinit.h"


int CompareEntry(agtype, rdn, attribute, value)	    
int agtype;
char *rdn;
char *attribute;
char *value;
{
    int         version, ldapPort, rc;
    char        *ldapHost, *loginDN, *password;    
    char        *compareDN, *compareAttribute, *compareValue;       
    struct      berval bvalue;
	char     *containerName;

    LDAP        *ld;


	ldapHost          = LDAP_SERVER;
	ldapPort          = LDAP_PORT;
	loginDN           = LDAP_LOGIN;
	password          = LDAP_PSWD;

	switch(agtype)
	{
	  case 1:
	  containerName     = LDAP_CTNAMEFW; break;
      case 2:
	  containerName     = LDAP_CTNAMESF; break;
      case 3:
	  containerName     = LDAP_CTNAMENIDS; break;
	  default :
	  return(103);
	}



	version = LDAP_VERSION3;
	ldap_set_option( NULL, LDAP_OPT_PROTOCOL_VERSION, &version);


	if (( ld = ldap_init( ldapHost, ldapPort )) == NULL)            
	  return(101);

	rc = ldap_simple_bind_s( ld, loginDN, password );
	if (rc != LDAP_SUCCESS )
	{
	  ldap_unbind_s ( ld );
	  return(rc);
	}



    compareAttribute = attribute;
    compareValue = value;
    bvalue.bv_val = compareValue;
    bvalue.bv_len = strlen( compareValue );

	compareDN=(char*)malloc(strlen(rdn) + 1  + strlen(containerName)+1);
	sprintf(compareDN,"%s,%s",rdn,containerName);


    rc = ldap_compare_ext_s( ld,                /* LDAP session handle */ 
                             compareDN,         /* the object being compared */
                             compareAttribute,  /* the attribute to compare */ 
                             &bvalue,           /* the value to compare */
                             NULL,              /* server controls */
                             NULL);             /* client controls */

   

        ldap_unbind_s( ld );
        return(rc);
      

}


