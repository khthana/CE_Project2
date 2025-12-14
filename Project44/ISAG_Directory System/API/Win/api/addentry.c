
#include "ldapinit.h"


int AddEntry(agtype,str)
int agtype;
char *str;
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

	x=(Entry*)malloc(sizeof(Entry));
	x->link='\0';

	y=(Entry*)malloc(sizeof(Entry));
	y->link='\0';
	y->vcount = 0;
	x->link=y;
	x=y;
	head=x;

	i=0,j=0,ii=0;

	while(str[i])
	{
		ii=0;
		while(str[i]!='$')
		{
		x->attribute[ii]=str[i];
		i++;
		ii++;
		}
		i++;
		x->attribute[ii]= '\x0';


		while((str[i] !='|') && (str[i] != '\x0'))
		{
			j=0;
			while((str[i] !='$') && (str[i] !='|') && (str[i] != '\x0'))
			{
			x->value[x->vcount][j] =str[i];
			i++;
			j++;
			}
			x->value[x->vcount][j] = '\x0';
			x->vcount++;

			if((str[i] != '|') && (str[i] != '\x0'))
			{
			  i++;
			}
		}

		if (str[i] != '\x0')
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
	    mods[j]->mod_op       = LDAP_MOD_ADD;
	    mods[j]->mod_type     = strdup(x->attribute);
	    mods[j]->mod_values   = attbuf[j];
	    x=x->link;
	    j++;
	}


	for (i=0; i<x->vcount; i++)
	   attbuf[j][i] = strdup(x->value[i]);


	attbuf[j][i] = NULL;

	mods[j]->mod_op       = LDAP_MOD_ADD;
	mods[j]->mod_type     = strdup(x->attribute);
	mods[j]->mod_values   = attbuf[j];
	mods[++j] = NULL;


    x = head;
	i = 0;
	dn=(char*)malloc(strlen(x->attribute) + 1 + strlen(x->value[i]) + 1  + strlen(containerName)+1);
	sprintf(dn,"%s=%s,%s",x->attribute,x->value[i],containerName);


	rc = ldap_add_ext_s( ld,
			 dn,
			 mods,
			 NULL,
			 NULL );

	  ldap_unbind_s ( ld );
	  return(rc);

}

