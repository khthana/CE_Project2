// analysis file udp.cap
// compile to xau
// this program is analysis file udp.cap for find udp port service

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
	char tempc,temp[20],check_port[65536];
	int count = 0,i;
	long count_packets = 0;
	struct receive_packet *head,*keep;
	head = (struct receive_packet*)malloc(sizeof(struct receive_packet));
	head->next = NULL;
//-------------------------------start check receive packet--------------------------//
	receive = fopen("udp.cap","r");

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
		
		memset(&check_port,'F',65536);
		
		/* Show DATA*/
		
		keep = head;
		while (keep != NULL)
		{
		i = atol(keep->data2);
		check_port[i] = 'T';
		keep=keep->next;
		}
	
		receive = fopen("udp.rep","w");
		fprintf(receive,"");
		fclose(receive);
		receive = fopen("udp.rep","w");
		fprintf(receive,"OPEN PORT PROTOCOL UDP (exit = :q)\n");


		for (i = 0;i<65536;i++)
		{
			if (check_port[i] == 'T')
				fprintf(receive,"--%d\n",i);		
		}

		fclose(receive);
	

		
	return 0;
}
