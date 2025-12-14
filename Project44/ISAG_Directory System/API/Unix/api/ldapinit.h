#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ldap.h>
#include <sys/time.h>

#define MXREFRESH 20

#define MXATTRIB  15
#define MXVALUE   5
#define MXLNTHSTR 30
#define MXMESG  200



#define AGENTID "AgentID"
#define IP "IP"
#define STARTTIME "StartTime"
#define REFRESH "Refresh"
#define SSTARTTIME "SStartTime"
#define SREFRESH "SRefresh"
#define STATUS "Status"
#define SOURCE "Source"
#define DESTINATION "Destination"
#define SERVICE "Service"
#define ACTION "Action"
#define IPCAP "IPCap"
#define PORTCAP "PortCap"
#define ATTACKTYPE "AttackType"
#define ATIME "Atime"



/*initial value.
* Admin must be config the following values for use connected to LDAP server.
*
* LDAP_SERVER  "LDAP server 's ip "
* LDAP_LOGIN "cn=admin,o=kmitl"
* LDAP_PSWD "kadmin"
* LDAP_CTNAME "Type of agent"
*
* Type of agent
* 1. Firewal : "AgentType=Firewall,o=KMITL"
* 2. Stateful Package : "AgentType=Stateful,o=KMITL"
* 3. NIDS : "AgentType=NIDS,o=KMITL"
*/

#define LDAP_SERVER  "161.246.5.11"
#define LDAP_LOGIN "cn=admin,o=kmitl"
#define LDAP_PSWD "kadmin"

#define LDAP_CTNAMEFW "AgentType=Firewall,o=KMITL"
#define LDAP_CTNAMESF "AgentType=Stateful,o=KMITL"
#define LDAP_CTNAMENIDS "AgentType=NIDS,o=KMITL"



// Security Agent Structure

// Public Definitions
#define MXDN 50
#define MXAGENTID 10
#define MXIP 16
#define MXSTTIME 30
#define MXRFTIME 30
#define MXSSTTIME 11
#define MXSRFTIME 11
#define MXSTATUS 10
#define MXOBJCLS 20

//Private : Firewall Agent & NIDS Agent
#define MXSRC 16
#define MXDSC 16

//Private : Firewall Agent
#define MXSERVICE 10
#define MXACTION 10

//Private : Stateful Agent
#define MXIPCAP 35
#define MXPORTCAP 20

//Private : NIDS Agent
#define MXATTYPE 15
#define MXATIME 30


//Structure Definitions

//Security Agent


typedef struct SecureAgent
{
   
   char dn[MXDN];

   char agentid[MXAGENTID];
   char ip[MXIP];
   char starttime[MXSTTIME];
   char refresh[MXRFTIME];
   char sstarttime[MXSTTIME];
   char srefresh[MXRFTIME];
   char status[MXSTATUS];

   char source[MXSRC];
   char destination[MXDSC];

   char service[MXSERVICE];
   char action[MXACTION];
 
   char ipcap[MXIPCAP];
   char portcap[MXPORTCAP];

   char attacktype[MXATTYPE];
   char atime[MXATIME];

   struct SecureAgent *left,*right;

 } SecureAgent;



typedef struct Entry
{
	char attribute[MXLNTHSTR];
	char value[MXVALUE][MXLNTHSTR];
	int vcount;
	struct Entry *link;
} Entry;


int AddEntry(int,char *);
int CompareEntry(int, char *,char *,char *);
int DelEntry(int, char *);
int ModifyEntry(int,char *,char *);
int ModifyRDN(int, char *, char *);	  
int SearchEntry(char*,char*,char*,SecureAgent**);
char *err2string(int);
int GetValue( char *, char *, char *, char **);

