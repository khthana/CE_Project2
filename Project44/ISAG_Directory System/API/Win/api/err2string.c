
#include "ldapinit.h"

char    mesg[MXMESG];
char *err2string(errcode)
int errcode;
{


    if (errcode == 101)
	{
        sprintf(mesg, "LDAP session initialization failed");
        return(mesg);
    }
	else if ( errcode == 102)
	{
        sprintf(mesg, "Not enough memory");
        return(mesg);
    }
	else if ( errcode == 103)
	{
        sprintf(mesg, "Invalid agent type / modify type");
        return(mesg);
    }
	else 
	{
	    return(ldap_err2string(errcode));
	}
}

