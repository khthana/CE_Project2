// analysis file dos.cap
// compile to xad
// this program is analysis file dos.cap for check dos packets

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct receive_packet
{
	//IP LAYER
	char *id;
	char *dst;
	char *src;

	char *data1;//icmp_type udp_sport tcp_sport
	char *data2;//icmp_code udp_dport tcp_dport
	
	struct receive_packet *next;
};


int main(int argc,char **argv)
{
	FILE *receive;
	char tempc,temp[20],check[4];
	int count = 0,i;
	long count_packets = 0;
	struct receive_packet *head,*keep;
	head = (struct receive_packet*)malloc(sizeof(struct receive_packet));
	head->next = NULL;
//-------------------------------start check receive packet--------------------------//
	receive = fopen("dos.cap","r");

	while (!feof(receive))
	{
		tempc = fgetc(receive);
	if (tempc == '$')
	{					
		keep = head;
		while (keep->next != NULL)
		 keep=keep->next;

		keep->next = (struct receive_packet*)malloc(sizeof(struct receive_packet));
		

		//keep id
		i = 0;
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
		//keep dst 
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
		keep->dst = (char *)malloc(sizeof(temp));
		strcpy(keep->dst,temp);	

		
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
		
		/* Show DATA*/
		keep = head;
		while (keep != NULL)
		{
			if (strcmp(keep->dst,keep->src) == 0)
				check[1] = 'T';
			if (strcmp(keep->id,"333") == 0)
				check[2] = 'T';
			if (strcmp(keep->id,"444") == 0)
				check[3] = 'T';
			if (strcmp(keep->id,"555") == 0)
				check[4] = 'T';

		keep=keep->next;
		}
		
		receive = fopen("dos.rep","w");
		fprintf(receive,"\nCheck Performance Detect DoS (exit = :q)\n");


		if (check[1] == 'T')
			fprintf(receive,"Firewall Can't Block Land attack\n");		
		if (check[2] == 'T')
			fprintf(receive,"Firewall Can't Block Teardrop attack\n");		
		if (check[3] == 'T')
			fprintf(receive,"Firewall Can't Block Jolt2 attack\n");		
		if (check[4] == 'T')
			fprintf(receive,"Firewall Can't Block Winfreeze attack\n");

		fclose(receive);
	

		
	return 0;
}
