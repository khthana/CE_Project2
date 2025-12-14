#include "ldapinit.h"


int main(void)
{
 
    char *str = "AgentID$FW11|IP$161.246.7.114|StartTime$Thu Mar 14 02:43:10 2002|Refresh$Thu Mar 14 02:43:10 2002|SStartTime$0001112223|SRefresh$0000111133|Source$Any|Destination$161.246.9.20|Service$http|Action$Accept|Status$Start|objectClass$firewall";

	char *compareDN= "AgentID=FW11", *attribute = "IP", *value= "161.246.7.114";
	
	char  *schBase = "o=kmitl", *filter = "(IP=161.246.7.114)", *sort = "AgentID";

	char  *Base = "o=kmitl", *GFilter = "(AgentID=FW15)", *att_name = "IP";
    
	char *deleteDN= "AgentID=FW11";
    
	char *rdn = "AgentID=FW11", *modi = "IP$161.246.7.115";
	
	char *newrdn = "AgentID=FW15", *oldrdn= "AgentID=FW11";
    

    char *result;


	SecureAgent *result_e;

    printf("\n\n\n\n\n\n\n\n");
    printf("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
    printf("\n     Test all functions.\n     Start...\n");
    printf("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n\n");


	printf("\n\nStart test...  'AddEntry(1, str)' function\nSend parameter:\nstr:  %s\n",str);
	printf("\nReturn Value:\n%s\n\n",err2string(AddEntry(1, str)));
    printf("------------------------------------------------");

	printf("\n\nStart test...  'CompareEntry(1, compareDN, attribute)' function\nSend parameter:\ncompareDN:  %s\nattribute:  %s\n",compareDN,attribute);
    printf("\nReturn Value:\n%s\n\n",err2string(CompareEntry( 1, compareDN, attribute, value)));
    printf("------------------------------------------------");


    printf("\n\nStart test...  'SearchEntry(schBase, filter, sort)' function\nSend parameter:\nschBase:  %s\nfilter:  %s\nsort:  %s\n",schBase,filter,sort);
    printf("\nReturn Value:\n%s\n\n",err2string(SearchEntry( schBase, filter, sort, &result_e)));
	while(result_e->right)
	{
	
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->dn,result_e->agentid,result_e->ip,result_e->starttime,result_e->refresh,result_e->sstarttime);
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->srefresh,result_e->source,result_e->destination,result_e->service,result_e->action,result_e->status);
	
	result_e = result_e->right;
	}

	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->dn,result_e->agentid,result_e->ip,result_e->starttime,result_e->refresh,result_e->sstarttime);
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->srefresh,result_e->source,result_e->destination,result_e->service,result_e->action,result_e->status);

	printf("------------------------------------------------");


    printf("\n\nStart test...  'ModifyEntry( 12, rdn, modi)' function\nSend parameter:\nrdn:  %s\nmodi:  %s\n",rdn,modi);
    printf("\nReturn Value:\n%s\n\n",err2string(ModifyEntry(11, rdn,  modi)));
    printf("------------------------------------------------");

	schBase = "o=kmitl";
	filter = "(AgentID=FW11)";

    printf("\n\nStart test...  'SearchEntry(schBase, filter, sort)' function\nSend parameter:\nschBase:  %s\nfilter:  %s\nsort:  %s\n",schBase,filter,sort);
    printf("\nReturn Value:\n%s\n\n",err2string(SearchEntry(schBase, filter, sort, &result_e)));
	while(result_e->right)
	{
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->dn,result_e->agentid,result_e->ip,result_e->starttime,result_e->refresh,result_e->sstarttime);
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->srefresh,result_e->source,result_e->destination,result_e->service,result_e->action,result_e->status);
	result_e = result_e->right;
	}
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->dn,result_e->agentid,result_e->ip,result_e->starttime,result_e->refresh,result_e->sstarttime);
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->srefresh,result_e->source,result_e->destination,result_e->service,result_e->action,result_e->status);

    printf("------------------------------------------------");


    printf("\n\nStart test...  'ModifyRDN(1, newrdn, oldrdn)' function\nSend parameter:\nmodrdn:  %s\nmoddn:  %s\n",newrdn,oldrdn);
    printf("\nReturn Value:\n%s\n\n",err2string(ModifyRDN(1, newrdn, oldrdn)));
    printf("------------------------------------------------");

	schBase = "o=kmitl";
	filter = "(AgentID=FW15)";

    printf("\n\nStart test...  'SearchEntry(schBase, filter, sort, &result)' function\nSend parameter:\nschBase:  %s\nfilter:  %s\nsort:  %s\n",schBase,filter,sort);
    printf("\nReturn Value:\n%s\n\n",err2string(SearchEntry(schBase, filter, sort, &result_e)));

	while(result_e->right)
	{
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->dn,result_e->agentid,result_e->ip,result_e->starttime,result_e->refresh,result_e->sstarttime);
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->srefresh,result_e->source,result_e->destination,result_e->service,result_e->action,result_e->status);
	result_e = result_e->right;
	}
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->dn,result_e->agentid,result_e->ip,result_e->starttime,result_e->refresh,result_e->sstarttime);
	printf("%s\n%s\n%s\n%s\n%s\n%s\n",
	result_e->srefresh,result_e->source,result_e->destination,result_e->service,result_e->action,result_e->status);

	printf("------------------------------------------------");

    printf("\n\nStart test...  'GetValue(Base, GFilter, att_name)' function\nSend parameter:\nBase:  %s\nGFlter:  %s\natt_name:  %s\n",Base,GFilter,att_name);
    printf("\nReturn Value:\n%s\n\n",err2string(GetValue(Base, GFilter, att_name, &result)));
	printf("%s",result);
    printf("------------------------------------------------");

    printf("\n\nStart test...  'DelEntry(1, deleteDN)' function\nSend parameter:\ndeleteDN:  %s\n",deleteDN);
    printf("\nReturn Value:\n%s\n\n",err2string(DelEntry(1, deleteDN)));
    printf("------------------------------------------------\n\n");

deleteDN= "AgentID=FW15";
    printf("\n\nStart test...  'DelEntry(1, deleteDN)' function\nSend parameter:\ndeleteDN:  %s\n",deleteDN);
    printf("\nReturn Value:\n%s\n\n",err2string(DelEntry(1, deleteDN)));
    printf("------------------------------------------------\n\n");

    return 0;

}


