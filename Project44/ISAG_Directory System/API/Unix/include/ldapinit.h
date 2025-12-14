#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ldap.h>
#include <sys/time.h>


#define MXATTRIB  10
#define MXVALUE   5
#define MXLNTHSTR 30
#define MXMESG  200


/*initial value.
* Admin must be config the following values for use connected to LDAP server.
*
* LDAP_SERVER  "LDAP server 's ip "
* LDAP_LOGIN "cn=admin,o=kmitl"
* LDAP_PSWD "toon"
* LDAP_CTNAME "Type of agent"
*
* Type of agent
* 1. Firewal : "AgentType=Firewall,o=KMITL"
* 2. Stateful Package : "AgentType=Stateful,o=KMITL"
* 3. NIDS : "AgentType=NIDS,o=KMITL"
*/

#define LDAP_SERVER  "161.246.5.11"
#define LDAP_LOGIN "cn=admin,o=kmitl"
#define LDAP_PSWD "toon"

#define LDAP_CTNAMEFW "AgentType=Firewall,o=KMITL"
#define LDAP_CTNAMESF "AgentType=Stateful,o=KMITL"
#define LDAP_CTNAMENIDS "AgentType=NIDS,o=KMITL"



typedef struct Entry
{
	char attribute[MXLNTHSTR];
	char value[MXVALUE][MXLNTHSTR];
	int vcount;
	struct Entry *link;
} Entry;


int AddEntry(int,char *);
int CompareEntry(int,char *,char *,char *, char **);
int DelEntry(int , char *);
int ModifyEntry(int,char *,char *);
int ModifyRDN(int , char *, char *);	  
int SearchEntry(char*,int,char*,char*,char**);
char *err2string(int);


