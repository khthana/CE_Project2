
#include "ldapinit.h"


int ModifyEntry( modtype, rdn, modi)	  
int modtype;
char *rdn;
char *modi;
{

	Entry *head,*x,*y;

	char     *attbuf[MXATTRIB][MXVALUE];
	char     *ldapHost;
	char     *loginDN;
	char     *password;
	char     *containerName;
	char     *dn;
	int	 ldapPort;
	int	 version;
	int	 modNumber = 0;
	int 	 rc;

	int     i, ii, j;

	LDAP     *ld;
	LDAPMod **mods;

	ldapHost          = LDAP_SERVER;
	ldapPort          = LDAP_PORT;
	loginDN           = LDAP_LOGIN;
	password          = LDAP_PSWD;

    switch(modtype)
    {
	  case 11:
	  case 12:
	  case 13:
	  containerName     = LDAP_CTNAMEFW; break;
      case 21:
      case 22:
      case 23:
	  containerName     = LDAP_CTNAMESF; break;
      case 31:
      case 32:
      case 33:
	  containerName     = LDAP_CTNAMENIDS; break;
	  default :
	  return(103);
	}

	x=(Entry*)malloc(sizeof(Entry));
	x->link='\0';


	y=(Entry*)malloc(sizeof(Entry));
	y->link='\0';
	y->vcount = 0;
	x->link=y;
	x=y;
	head=x;

	i=0,j=0,ii=0;

	while(modi[i])
	{
		ii=0;
		while(modi[i]!='$')
		{
		x->attribute[ii]=modi[i];
		i++;
		ii++;
		}
		i++;
		x->attribute[ii]= '\x0';


		while((modi[i] !='|') && (modi[i] != '\x0'))
		{
			j=0;
			while((modi[i] !='$') && (modi[i] !='|') && (modi[i] != '\x0'))
			{
			x->value[x->vcount][j] =modi[i];
			i++;
			j++;
			}
			x->value[x->vcount][j] = '\x0';
			x->vcount++;

			if((modi[i] != '|') && (modi[i] != '\x0'))
			{
			  i++;
			}
		}

		if (modi[i] != '\x0')
		{
		y=(Entry*)malloc(sizeof(Entry));
		y->link='\0';
		y->vcount = 0;
		x->link=y;
		x=y;
		i++;

		}

	}

	x = head;
	while(x->link)
	{
	  modNumber++;

	  x=x->link;

	}
	  modNumber++;


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

	mods = ( LDAPMod ** ) malloc(( modNumber + 1 ) * sizeof( LDAPMod * ));

	if ( mods == NULL )
	{
	  ldap_unbind_s( ld );
	  return(102);
	}

	for ( i = 0; i < modNumber; i++ )
	{
	  if (( mods[ i ] = ( LDAPMod * ) malloc( sizeof( LDAPMod ))) == NULL )
	  {
	    ldap_unbind_s( ld );
	    return(102);
	  }
	}


	x = head;
	j=0;

	while(x->link)
	{

	    for (i=0; i<x->vcount; i++)
	      attbuf[j][i] = strdup(x->value[i]);

	    attbuf[j][i] = NULL;

        switch(modtype)
		{

	    case 11:
	    case 21:
	    case 31:
		mods[j]->mod_op       = LDAP_MOD_REPLACE; break;
	    case 12: 
	    case 22: 
	    case 32: 
		mods[j]->mod_op       = LDAP_MOD_ADD; break;
	    case 13: 
	    case 23: 
	    case 33: 
		mods[j]->mod_op       = LDAP_MOD_DELETE; break;
	    default :
	    return(103);

         }	    
		mods[j]->mod_type     = strdup(x->attribute);
	    mods[j]->mod_values   = attbuf[j];
	    x=x->link;
	    j++;
	}


	for (i=0; i<x->vcount; i++)
	   attbuf[j][i] = strdup(x->value[i]);


	attbuf[j][i] = NULL;

        switch(modtype)
		{

	    case 11:
	    case 21:
	    case 31:
		mods[j]->mod_op       = LDAP_MOD_REPLACE; break;
	    case 12: 
	    case 22: 
	    case 32: 
		mods[j]->mod_op       = LDAP_MOD_ADD; break;
	    case 13: 
	    case 23: 
	    case 33: 
		mods[j]->mod_op       = LDAP_MOD_DELETE; break;
	    default :
	    return(103);

         }	    
	mods[j]->mod_type     = strdup(x->attribute);
	mods[j]->mod_values   = attbuf[j];
	mods[++j] = NULL;




	dn=(char*)malloc(strlen(rdn) + strlen(containerName)+1);
	sprintf(dn,"%s,%s",rdn,containerName);


    rc= ldap_modify_ext_s( ld,        
                           dn,  
                           mods,    
                           NULL,      
                           NULL); 

	  ldap_unbind_s ( ld );
	  return(rc);

}

