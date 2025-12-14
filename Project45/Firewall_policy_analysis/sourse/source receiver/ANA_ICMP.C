// analysis file icmp.cap
// complie to xai
// this program is analysis file icmp.cap for find icmp --type-code packet


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct receive_packet
{
	//IP LAYER
	char *protocol;
	char *id;
	char *src;

	char *data1;//icmp_type udp_sport tcp_sport
	char *data2;//icmp_code udp_dport tcp_dport
	
	struct receive_packet *next;
};


int main(int argc,char **argv)
{
	FILE *receive;
	char tempc,temp[20],type_icmp[18][15];
	int count = 0,i,j;
	long count_packets = 0;
	struct receive_packet *head,*keep;
	head = (struct receive_packet*)malloc(sizeof(struct receive_packet));
	head->next = NULL;
//-------------------------------start check receive packet--------------------------//
	receive = fopen("icmp.cap","r");

	while (!feof(receive))
	{
		tempc = fgetc(receive);
	if (tempc == '$')
	{					
		keep = head;
		while (keep->next != NULL)
		 keep=keep->next;

		keep->next = (struct receive_packet*)malloc(sizeof(struct receive_packet));
		

		//keep protocol
		i = 0;
		while (tempc != ' ')
		{
			tempc = fgetc(receive);
			temp[i] = tempc;
			i++;
		}
		i--;
		temp[i] = '\0';
		keep->protocol = (char *)malloc(sizeof(temp));
		strcpy(keep->protocol,temp);
		
		//-----------------------------------------------//
		//keep id 
		i = 0;
		tempc = '\0';
		while (tempc != ' ')
		{
			tempc = fgetc(receive);
			temp[i] = tempc;
			i++;
		}
		i--;
		temp[i] = '\0';
		keep->id = (char *)malloc(sizeof(temp));
		strcpy(keep->id,temp);	

		
		//-----------------------------------------------//
		//keep src 
		i = 0;
		tempc = '\0';
		while (tempc != ' ')
		{
			tempc = fgetc(receive);
			temp[i] = tempc;
			i++;
		}
		i--;
		temp[i] = '\0';
		
		keep->src = (char *)malloc(sizeof(temp));
		strcpy(keep->src,temp);

		//-----------------------------------------------//
		//keep data1 
		i = 0;
		tempc = '\0';
		while (tempc != ' ')
		{
			tempc = fgetc(receive);
			temp[i] = tempc;
			i++;
		}
		i--;
		temp[i] = '\0';
		
		keep->data1 = (char *)malloc(sizeof(temp));
		strcpy(keep->data1,temp);

		//-----------------------------------------------//
		//keep data2 
		i = 0;
		tempc = '\0';
		while (tempc != ' ')
		{
			tempc = fgetc(receive);
			temp[i] = tempc;
			i++;
		}
		i--;
		temp[i] = '\0';
		
		keep->data2 = (char *)malloc(sizeof(temp));
		strcpy(keep->data2,temp);
		//-----------------------------------------------//

	}// end of if != $
		
	}// end file
		keep->next = NULL;	
	fclose(receive);
		
		printf("check1");
		/* Show DATA*/
		
		keep = head;
		while (keep != NULL)
		{
		i = atoi(keep->data1);
		j = atoi(keep->data2);
		type_icmp[i][j] = 'T';
		keep=keep->next;
		}
			
		receive = fopen("icmp.rep","w");
		fprintf(receive,"");
		fclose(receive);
		receive = fopen("icmp.rep","w");
		fprintf(receive,"ALLOW TYPE CODE PROTOCOL ICMP (exit = :q)\n -TYPE - CODE\n");

		for (i = 0;i<19;i++)
		{
			for (j = 0;j<16;j++)
			if (type_icmp[i][j] == 'T')
				fprintf(receive,"--%d-%d \n",i,j);		
		}

		fclose(receive);
	

		
	return 0;
}
