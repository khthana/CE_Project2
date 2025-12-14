
#include  "ldapinit.h"


int  DelEntry(agtype, rdn)
int agtype;
char *rdn;
{ 

	char     *ldapHost;
	char     *loginDN;
	char     *password;
	char     *deleteDN;
	char     *containerName;

	int	 ldapPort;
	int	 version;
	int 	 rc;

 
	LDAP     *ld;

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

	deleteDN=(char*)malloc(strlen(rdn) + 1  + strlen(containerName)+1);
	sprintf(deleteDN,"%s,%s",rdn,containerName);

    rc = ldap_delete_ext_s( ld,         /* LDAP session handle */
                            deleteDN, /*   dn of the object to delete */
                            NULL,       /* server controls */
                            NULL );     /* client controls */


	  ldap_unbind_s ( ld );
	  return(rc);

}

