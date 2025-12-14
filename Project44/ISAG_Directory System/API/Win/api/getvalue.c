
#include "ldapinit.h"


int GetValue( Base, filter, att_name, result)
char *Base;
char *filter;
char *att_name;
char **result;
{
    int         version, ldapPort, i, rc, entryCount;
    char        *ldapHost, *loginDN, *password, *searchBase;   
    char        *attribute, *dn, **values;       
    struct      timeval timeOut;
    BerElement  *ber;
    LDAP        *ld;
    LDAPMessage *searchResult, *entry;

    char *buff, *mesg;
	int size=0;


	ldapHost          = LDAP_SERVER;
	ldapPort          = LDAP_PORT;
	loginDN           = LDAP_LOGIN;
	password          = LDAP_PSWD;
	searchBase     = Base;
    timeOut.tv_sec    = 10L;
    timeOut.tv_usec   = 0L;
    
	

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




    rc = ldap_search_ext_s(  
                    ld,                    /* LDAP session handle */
                    searchBase,            /* container to search */
                    LDAP_SCOPE_SUBTREE,   /* search scope : BASE,ONELEVEL,SUBTREE */
                    filter,     /*  "(objectclass=*)"  search filter */
                    NULL,                  /* return all attributes */
                    0,                     /* return attributes and values */
                    NULL,                  /* server controls */
                    NULL,                  /* client controls */
                    &timeOut,              /* time out */
                    LDAP_NO_LIMIT,         /* no size limit */
                    &searchResult );       /* returned results */


	if ( rc != LDAP_SUCCESS )
	{
	  ldap_unbind_s ( ld );
	  return(rc);

	}


    buff = (char*)malloc(MXMESG);
    mesg = (char*)malloc(MXMESG*2);  //MXMESG*2//
	mesg[0] = '\0';


    for (   entry   =   ldap_first_entry( ld, searchResult ); 
            entry   !=  NULL; 
            entry   =   ldap_next_entry( ld, entry ) ) 
    {
        if (( dn = ldap_get_dn( ld, entry )) != NULL )            
        {
            sprintf(buff,"\n   dn:  %s\n", dn );
			size += strlen(buff);
            ldap_memfree( dn );
        }
            
        for (   attribute = ldap_first_attribute( ld, entry, &ber );
                attribute != NULL; 
                attribute = ldap_next_attribute( ld, entry, ber ) ) 
        {   
		   
		   if( !strcmp(attribute, att_name))
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{

                    sprintf(buff,"%s\n",values[i] );
			        size += strlen(buff);
					strcat(mesg, buff);
             
				}
                ldap_value_free( values );
            }
			mesg[size] = 0;
            ldap_memfree( attribute );
        }
       
        ber_free(ber, 0);

    }


    *result = mesg;

    free(buff);

	ldap_unbind_s( ld );
	return(rc);

}

