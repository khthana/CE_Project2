#include "service.h"
unsigned char contact_list[512];
//char nick_name[512];
//char user_id[10];
//char email[128];

char lnick_name[255];
//
void new_user(SSL *ssl, unsigned char *buffer_read, char *ip_client, char user_id[]){}

void logout(SSL* ssl)
{
	unsigned char buffer[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	int i;
	for(i= 0 ; i < MAX_MESSAGE ; i++)
	{
		buffer[i] = '\0';
		mess[i] = '\0';
	}
	
	buffer[0] = 0x07;
	buffer[1] = 0x00;
	buffer[2] = 0x01;
	buffer[3] = 0x00;
	buffer[4] = 0x01;
	buffer[5] = 0x71;
	buffer[6] = 0xff;

	ssl_write(ssl,buffer,sizeof(buffer));
	for(i= 0 ; i < MAX_MESSAGE ; i++)
	{
		buffer[i] = '\0';
	}

	ssl_read(ssl,buffer,sizeof(buffer));

	for(i = 0 ; i< MAX_MESSAGE ; i++)
	{
		if(buffer[i+7] == '$' && buffer[i+7+1] == NULL) break;
		mess[i] = buffer[i+7];
	}

	if(buffer[0] == 0x07 && buffer[5] == 0x72)
	{
		fprintf(stdout,"%s\n",mess);
	}
	else
	{
		fprintf(stdout,"Error : %s\n",mess);
	}
}

void add_nick_name(char user_id_contact[], char contact_list[]){}
void login(SSL *ssl, unsigned char *buffer_read, char user_id[]){}
void delete_admin(SSL *ssl){}


void admit(SSL *ssl,char * current_status){
	int i;
  	unsigned char buffer_user[MAX_MESSAGE];
  	unsigned char buffer[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	char contact_id[20];
	char con_status[2];
	int len;
	short correct = 0;
	status(ssl);

	for(i = 0 ; i < MAX_MESSAGE ; i++) 
	{
		contact_id[i] = '\0';
		buffer_user[i] = '\0';
		buffer[i] = '\0';
		mess[i] = '\0';
	}

	fprintf(stdout,"Enter Contact ID to admit ( x = cancle ) :");
	scanf("%s",contact_id);
	len = strlen(contact_id);
	
	if( len > 10)
	{
		fprintf(stdout,"Contact ID is not more than 10 characters\n");
	}
	else
	{
		for(i =0 ; i< len ; i++)
		{
			if(!isdigit(contact_id[i]))
			{
				correct = 0;
				fprintf(stdout,"Invalid Contact ID Input\n");
				break;
			}
			else correct = 1;
		}
		// Testting --------->
		//correct = 1;
		if( correct == 1 )
		{
			if(strcmp(current_status , "Away")==0) con_status[0] = 'A'; 
			if(strcmp(current_status , "Online")==0) con_status[0] = 'O'; 
			if(strcmp(current_status , "Busy")==0) con_status[0] = 'B'; 
			//*****
			for(i=0;i<=MAX_MESSAGE;i++) buffer_user[i] = '\0';

			buffer_user[0] = 0x55;
			buffer_user[1] = 0x00;
			buffer_user[2] = 0x01;
			buffer_user[3] = 0x00;
			buffer_user[4] = 0x07;
			buffer_user[5] = 0x5a;
			buffer_user[6] = 0xff;

			for(i=0 ; i< 20 ; i++)
			{
				if(contact_id[i] == NULL) break;
				buffer_user[i+7] = contact_id[i];
			}
			buffer_user[i+7] = '#';
			buffer_user[i+7+1] = con_status[0];
			buffer_user[i+7+2] = '$';
			ssl_write(ssl, buffer_user, sizeof(buffer_user));
	
			for(i = 0;i < MAX_MESSAGE;i++)
			{
				buffer_user[i] = '\0';
				buffer[i] = '\0';
			}

			ssl_read(ssl,buffer,sizeof(buffer));
			
			if((buffer[0] == 0x55) && (buffer[5] == 0x5b))
			{
				get_data(buffer, mess, 7);
				fprintf(stdout,"%s\n",mess);
			}
			else
			{
				for(i=0 ; i < MAX_MESSAGE ; i++) mess[i] = '\0';
				get_data(buffer, mess, 7);
				fprintf(stdout, "%s\n", mess);
			}
		}
		else
		{
			fprintf(stdout,"Retry next time \n");
		}
	}

}

void get_portion(char src[] ,char des[],int start ,int stop)
{
	int i = 0;
//	fprintf(stdout,"start : %d\t stop : %d\n",start,stop);
	for(i = start ; i < stop ; i++)
	{
		des[i-start] = src[i];
	}
//	fprintf(stdout,"start : %d\tget : %s\n",src);
}

void request_info(SSL *ssl,char user_id[],char email[],char nick_name[])
{
	unsigned char buffer_user[MAX_MESSAGE];
	unsigned char buffer_read[MAX_MESSAGE];
	char message[MAX_MESSAGE]; 
	char temp[MAX_MESSAGE];
	int i , j,len,count;
	short flag = 1;

	for(i = 0 ; i < MAX_MESSAGE ; i++) 
	{
		buffer_user[i] = '\0';
		buffer_read[i] = '\0';
		message[i] = '\0';
		temp[i] = '\0';
	}

		buffer_user[0] = 0x05;
		buffer_user[1] = 0x00;
		buffer_user[2] = 0x01;
		buffer_user[3] = 0x00;
		buffer_user[4] = 0x07;
		buffer_user[5] = 0x21;
		buffer_user[6] = 0xff;

	ssl_write(ssl,buffer_user,sizeof(buffer_user));
	ssl_read(ssl,buffer_read,sizeof(buffer_read));

	if((buffer_read[0] == 0x05) && (buffer_read[5] == 0x22)/* should check flag */)
	{
		for(i=0 ; i< MAX_MESSAGE ; i++)
		{
			if(buffer_read[i+7] == NULL) break;
			temp[i] = buffer_read[i+7];
		}
		
		len = strlen(temp);
//		fprintf(stdout,"This is temp : %s\n" ,temp);
		i=0;
		count = 0;

		for(j=0 ; j< len ; j++)
		{
			if(temp[j] == '#')
			{
				//fprintf(stdout,"i : %d\tj : %d\tcount : %d\n",i,j,count);
				switch (count)
				{
				case  0 :  get_portion(temp,user_id,i,j);
							i = j+1;
							break;
				case  1 :  get_portion(temp,email,i,j);
							i = j+1;
							break;
				case  2 :  get_portion(temp,nick_name,i,j);
							i = j+1;
							break;
				/*
				case : 3 :  get_portion(status,i,j);
							i = j+1;
						    break;
				*/
				default: break;
				}
				count++;
			}
			else if(temp[j] == '$') 
			{
				if(j ==0 ) flag = 0;
				else get_portion(temp,nick_name,i,j);
				break;
			}
		}

		if(flag == 1)
		{
//			fprintf(stdout,"flag = 1 \n");
		}
		else
		{
			fprintf(stdout,"No data\n");
		}	

	}
	else
	{
		for(i = 0 ; i < MAX_MESSAGE ; i++)
		{
			if((buffer_read[i+7] == '$') && (buffer_read[i+7+1] == NULL)) break;
			message[i] = buffer_read[i+7];
		}
		fprintf(stdout,"Error : %s\n",message);
	}

}

void Login(char cert_name[])
{
	char cert_read[255];
	fprintf(stdout,"*****************************************\n");
    fprintf(stdout,"*                Login                   \n");
    fprintf(stdout,"*****************************************\n");
	fprintf(stdout,"Enter Certificate Name : ");
	scanf("%s",cert_read);
	strcpy(cert_name,cert_read);				
}

int check_contact_id(char contact_id[])
{
	int len = strlen(contact_id);
	int i ;
	if(len >10) return 0;
	else
	{
		for(i =0 ; i< len ; i++)
		{
			if(!isdigit(contact_id[i]))
			{
				//correct = 0;
				fprintf(stdout,"Invalid Contact ID Input\n");
				//break;
				return 0;
			}
		}
		return 1;
	}
}

void authorize(SSL *ssl)
{
	unsigned char buffer_user[MAX_MESSAGE];
	unsigned char buffer_read[MAX_MESSAGE];
	unsigned char buffer[MAX_MESSAGE];
	char message[MAX_MESSAGE];
	char authorize_list[MAX_MESSAGE];
	unsigned char more_packet;
	char ans[20];
	char contact_id[20];
	int reply_ok =1;
	int contact_ok =0;
	int ans_ok = 0;
	int i;
	int empty=1;

	for(i = 0 ; i < MAX_MESSAGE ; i++) 
	{
		buffer[i] = '\0';
		buffer_user[i] = '\0';
		buffer_read[i] = '\0';
		message[i] = '\0';
		authorize_list[i] = '\0';
	}

	for(i = 0 ; i < 20 ; i++) 
	{
		ans[i] = '\0';
		contact_id[i] = '\0';
	}


		buffer_user[0] = 0x5e;
		buffer_user[1] = 0x00;
		buffer_user[2] = 0x01;
		buffer_user[3] = 0x00;
		buffer_user[4] = 0x07;
		buffer_user[5] = 0x51;
		buffer_user[6] = 0xff;

		ssl_write(ssl,buffer_user,sizeof(buffer_user));

		do
		{
			ssl_read(ssl,buffer_read,sizeof(buffer_read));

			more_packet = buffer_read[6];
			for(i= 0 ; i< MAX_MESSAGE ; i++) buffer[i] = '\0';

			if((buffer_read[0] == 0x5e) && (buffer_read[5] == 0x52))
			{
				printf("ONE\n");
				for(i = 0 ; i < MAX_MESSAGE ; i++)
				{
					if(buffer_read[i+7] == NULL) break;
					buffer[i] = buffer_read[i+7];
				}

				empty = show_contact_list(buffer);
				for(i = 0;i < MAX_MESSAGE;i++) buffer_read[i] = '\0';

			}
			else 
			{
				printf("TWO \n");
				for(i = 0 ; i < MAX_MESSAGE ; i++)
				{
					if(buffer_read[i+7] == '$') break;
					message[i] = buffer_read[i+7];
				}
				
				reply_ok = 0;
				fprintf(stdout,"%s\n",message);
				break;
			}

		}
		while(more_packet == 0x01);
		
		if((reply_ok == 1) && (empty == 1))
		{
			printf("\nDo u want to accept ?(Y- yes, N- No) :");
			scanf("%s",ans);
			if((ans[0] == 0x79) || (ans[0] == 0x59))
			{
				printf("\n\nEnter User ID :");
				scanf("%s",contact_id);
				printf("\nAccept Authorize ?(Y- yes, N- No ,C- Cancle) :");
				scanf("%s",ans);

				contact_ok = check_contact_id(contact_id);

				if(	(ans[0] == 0x6e) || (ans[0] == 0x4e) ||
					(ans[0] == 0x79) || (ans[0] == 0x59) )
					ans_ok = 1;
				else if((ans[0] == 0x63) || (ans[0] == 0x43))
				{
					ans_ok =0;
				}
				else 
				{	
					ans_ok = 0;
					fprintf(stdout,"Incorrect Predefined Character \n");
				}
			
				if((contact_ok == 1) && (ans_ok == 1))
				{
				//fprintf(stdout,"Author User : %s\n",contact_id);
				//fprintf(stdout,"Ans User : %s\n",ans);
					for(i = 0 ; i< MAX_MESSAGE ; i++) buffer_user[i] = '\0';
					for(i = 0 ; i< 20 ; i++)
					{
						if(contact_id[i] == NULL) break;
						buffer_user[i+7] = contact_id[i];
					}
					buffer_user[i+7] = '#';
					buffer_user[i+8] = ans[0];
					buffer_user[i+9] = '$';

					buffer_user[0] = 0x5e;
					buffer_user[1] = 0x00;
					buffer_user[2] = 0x01;
					buffer_user[3] = 0x00;
					buffer_user[4] = 0x07;
					buffer_user[5] = 0x55;
					buffer_user[6] = 0xff;
	
					ssl_write(ssl,buffer_user,sizeof(buffer_user));

					ssl_read(ssl,buffer_read,sizeof(buffer_read));

					if((buffer_read[0] == 0x5e) && (buffer_read[5] == 0x56))
					{
						for(i = 0 ; i < MAX_MESSAGE ; i++)
						{
							if((buffer_read[i+7] == '$') && (buffer_read[i+7+1] == NULL)) break;
							message[i] = buffer_read[i+7];
						}
					}
					else
					{
						for(i = 0 ; i < MAX_MESSAGE ; i++)
						{
							if((buffer_read[i+7] == '$') && (buffer_read[i+7+1] == NULL)) break;
							message[i] = buffer_read[i+7];
						}

					}

					fprintf(stdout,"%s\n",message);
	
				}
				else
				{
					fprintf(stdout,"Retry Next Time\n");
				}
			
			}
		}
}


char *set_status(SSL *ssl,char *current_status)
{
	char status[10];
	unsigned char buffer_user[MAX_MESSAGE];
	unsigned char buffer_read[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	int i;
	int valid_status = 0;

	for(i = 0 ; i < MAX_MESSAGE ; i++) 
	{
		buffer_user[i] = '\0';
		buffer_read[i] = '\0';
		mess[i] = '\0';
	}

	printf("|----------------------------------|\n");
	printf("|      Select Your Status          |\n");
	printf("|----------------------------------|\n");
	printf("|       1   : Online               |\n");
	printf("|       2   : Away                 |\n");
	printf("|       3   : Busy                 |\n");
	printf("|----------------------------------|\n");
	printf("\nEnter your status :");
	scanf("%s",status);

	switch(status[0])
	{
		case '1' : status[0] = 'O'; valid_status =1; break;
		case '2' : status[0] = 'A'; valid_status =1 ; break;
		case '3' : status[0] = 'B'; valid_status =1 ; break;
		default : valid_status = 0; 
				  fprintf(stdout,"Invalid Input\n"); 
				  break;
	}

	//valid_status = 1;
	
	if(valid_status)
	{
		buffer_user[0] = 0x51;
		buffer_user[1] = 0x00;
		buffer_user[2] = 0x01;
		buffer_user[3] = 0x00;
		buffer_user[4] = 0x07;
		buffer_user[5] = 0x51;
		buffer_user[6] = 0xff;

		buffer_user[7] = status[0];
		buffer_user[8] = '$';

		ssl_write(ssl,buffer_user,sizeof(buffer_user));

		ssl_read(ssl,buffer_read,sizeof(buffer_read));

		if((buffer_read[0] == 0x51) && (buffer_read[5] == 0x52))
		{
			get_data(buffer_read, mess, 7);
			fprintf(stdout,"%s\n",mess);

			switch(status[0])
			{
				case 'O' : return ONLINE; break;
				case 'A' : return AWAY ; break;
				case 'B' : return BUSY ; break;
				default :  return current_status ; break; 
			}

		}
		else
		{
			for(i=0 ; i < MAX_MESSAGE ; i++) mess[i] = '\0';
			get_data(buffer_read, mess, 7);
			fprintf(stdout, "%s\n", mess);
		}

	}
	//fprintf(stdout,"\nSelected Status%c\n",status);
	return current_status;

}


void deny(SSL *ssl){
	int i;
  	unsigned char buffer_user[MAX_MESSAGE];
  	unsigned char buffer[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	char contact_id[20];
	int len;
	short correct = 0;
	status(ssl);

	for(i = 0 ; i < MAX_MESSAGE ; i++) 
	{
		contact_id[i] = '\0';
		buffer_user[i] = '\0';
		buffer[i] = '\0';
		mess[i] = '\0';
	}

	fprintf(stdout,"Enter Contact ID to block ( x = cancle ) :");
	scanf("%s",contact_id);
	len = strlen(contact_id);
	
	if( len > 10)
	{
		fprintf(stdout,"Contact ID is not more than 10 characters\n");
	}
	else
	{
		for(i =0 ; i< len ; i++)
		{
			if(!isdigit(contact_id[i]))
			{
				correct = 0;
				fprintf(stdout,"Invalid Contact ID Input\n");
				break;
			}
			else correct = 1;
		}
		// Testting --------->
		//correct = 1;
		if( correct == 1 )
		{
			//*****
			for(i=0;i<=MAX_MESSAGE;i++) buffer_user[i] = '\0';

			buffer_user[0] = 0x55;
			buffer_user[1] = 0x00;
			buffer_user[2] = 0x01;
			buffer_user[3] = 0x00;
			buffer_user[4] = 0x07;
			buffer_user[5] = 0x51;
			buffer_user[6] = 0xff;

			for(i=0 ; i< 20 ; i++)
			{
				if(contact_id[i] == NULL) break;
				buffer_user[i+7] = contact_id[i];
			}
			buffer_user[i+7] = '$';
			ssl_write(ssl, buffer_user, sizeof(buffer_user));
	
			for(i = 0;i < MAX_MESSAGE;i++)
			{
				buffer_user[i] = '\0';
				buffer[i] = '\0';
			}

			ssl_read(ssl,buffer,sizeof(buffer));
			
			if((buffer[0] == 0x55) && (buffer[5] == 0x52))
			{
				get_data(buffer, mess, 7);
				fprintf(stdout,"%s\n",mess);
			}
			else
			{
				for(i=0 ; i < MAX_MESSAGE ; i++) mess[i] = '\0';
				get_data(buffer, mess, 7);
				fprintf(stdout, "%s\n", mess);
			}
		}
		else
		{
			fprintf(stdout,"Retry next time \n");
		}
	}

}


int show_contact_list(unsigned char *buffer)
{
	char temp[512] ;
	int run =0;
	int start = 0;
	int last =0;
	for(start=0 ;start<512 ; start++) temp[start] ='\0';
			while(1) 
			{
				if((buffer[run] == '$') && (buffer[run+1] == '$'))
				{	
					for(start=0 ; start<run-last ; start++)
					temp[start] = buffer[start+last];
					fprintf(stdout,"%s\n",temp);
					break;
				}
				else if((buffer[run] == '$') && (buffer[run+1] != NULL)) 
				{
					//fprintf(stdout,"-->i %d\n",run);
					//fprintf(stdout,"-->k %d\n",last);

					for(start=0 ; start<run-last ; start++)
					temp[start] = buffer[start+last];
					fprintf(stdout,"%s\n",temp);
					for(start=0 ;start<512 ; start++) temp[start] ='\0';
					run++;
					last=run;
				}
				else if((buffer[run] == '$') && (buffer[run +1] == NULL)) 
				{
					strcpy(temp,"No Data Returned !");
					fprintf(stdout,"%s\n",temp);
					if(run == 0) return 0;
					break;
				}
				else run++;
			}
			return 1;
}


void status(SSL *ssl){
	int i;
  	unsigned char buffer_user[MAX_MESSAGE];
  	unsigned char buffer[MAX_MESSAGE];
	unsigned char more_pack;
	int n = 0;

	for(i=0;i<=MAX_MESSAGE;i++)
    		buffer_user[i] = '\0';
	/*request_status = 0x51*/
 	/*channel 0x05, sequence 0x0001, length 0x0007, command 0x51, flag 0xff, data null*/
 	/*Set header*/
  	buffer_user[0] = 0x05;
 	buffer_user[1] = 0x00;
 	buffer_user[2] = 0x01;
 	buffer_user[3] = 0x00;
 	buffer_user[4] = 0x07;
 	buffer_user[5] = 0x51;
 	buffer_user[6] = 0xff;

	ssl_write(ssl, buffer_user, sizeof(buffer_user));
	
	for(i = 0;i < MAX_MESSAGE;i++)
	{
		buffer_user[i] = '\0';
		buffer[i] = '\0';
	}
	
	do 
	{			
		/*Receive response status*/
		ssl_read(ssl, buffer_user, sizeof(buffer_user));
	
		more_pack = buffer_user[6];	
			
		for(i = 0;i < MAX_MESSAGE;i++)
					buffer[i] = '\0';
		
		if( (buffer_user[0] == 0x05) && (buffer_user[5] == 0x52) )
    	{
				
			i = 0;			
			while(buffer_user[FIX_HEADER +1 +i] != '\0')
			{
				buffer[i] = buffer_user[FIX_HEADER +1 +i];
				++i;
					//fprintf(stdout, "Contact list = %s\n", buffer);
			}	
				
			for(i = 0;i < MAX_MESSAGE;i++)
				buffer_user[i] = '\0';
			show_contact_list(buffer);
				
//			fprintf(stdout, "Contact_list = %s\n", buffer);
		
			if( n == 0)			
				strcpy(contact_list, buffer);
			else 
				strcat(contact_list, buffer);

			n = 1;
		}
		else 
		{
			fprintf(stdout, "Command Server Error\n");
			goto end_status;
		}
	}while(more_pack == 0x01);	

end_status:
}

void change_nick_name(SSL *ssl,char nick_name[]){
	int i;
  	unsigned char buffer_user[MAX_MESSAGE];
	unsigned char mess[MAX_MESSAGE];
	unsigned char temp[255];
	char new_nick_name[255];
 	for(i=0;i<=MAX_MESSAGE;i++) {
    		temp[i] = '\0';
		mess[i] = '\0';
		buffer_user[i] = '\0';
	}

	/*Get data*/
	fprintf(stdout, "Current Nick name:%s\n", nick_name);
	fprintf(stdout, "Enter Information\n");
	fprintf(stdout, "New Nick_Name (least than 255 char):");			
    scanf("%s", temp);
    	strcpy(new_nick_name,temp);
	strncpy(mess, temp, 255);
	//strncpy(nick_name, temp, 255);
	strncat(mess, "$", 1);	
	/*request_change_nick_name = 0x41*/
	/*channel 0x05, sequence 0x0001, length 0x0007, command 0x51, flag 0xff, data null*/
	/*Set header*/
 	buffer_user[0] = 0x04;
	buffer_user[1] = 0x00;
	buffer_user[2] = 0x01;
	buffer_user[3] = 0x00;
	buffer_user[4] = 0x07;
	buffer_user[5] = 0x41;
	buffer_user[6] = 0xff;
					
	for(i=0;i < 255;i++) {
	        buffer_user[i+7] =  mess[i];
		if(mess[i] == '\0')
		break;
       }
	
	ssl_write(ssl, buffer_user, sizeof(buffer_user));

	/*Receive response status*/
	for(i=0;i<=MAX_MESSAGE;i++) {
    		temp[i] = '\0';
		buffer_user[i] = '\0';
	}
			
    	ssl_read(ssl, buffer_user, sizeof(buffer_user));	
					
	if( (buffer_user[0] == 0x04) && (buffer_user[5] == 0x42) )
    {			
		get_data(buffer_user, temp, 7);
		fprintf(stdout, "%s\n", temp);
		//change_nick_atfile();
		strcpy(nick_name,new_nick_name);
    	}
	else 
	{
		for(i=0 ; i < MAX_MESSAGE ; i++) mess[i] = '\0';
		get_data(buffer_user, mess, 7);
		fprintf(stdout, "%s\n", mess);
	}			
}

void de_con(SSL *ssl, char temp[])
{
	int i;
  	unsigned char buffer_user[MAX_MESSAGE];
	unsigned char mess[MAX_MESSAGE];
  	
 	for(i=0;i<=MAX_MESSAGE;i++) 
	{
		mess[i] = '\0';
		buffer_user[i] = '\0';
	}

	/*request_delete_contactlist = 0xb1*/
 	/*channel 0x0b, sequence 0x0001, length 0x0007, command 0xb1, flag 0xff, data null*/
 	/*Set header*/
 	buffer_user[0] = 0x0b;
 	buffer_user[1] = 0x00;
	buffer_user[2] = 0x01;
 	buffer_user[3] = 0x00;
 	buffer_user[4] = 0x07;
	buffer_user[5] = 0xb1;
 	buffer_user[6] = 0xff;
														
	for(i=0;i < 100;i++)
       	{
            buffer_user[i+7] =  temp[i];
        }
										
	ssl_write(ssl, buffer_user, sizeof(buffer_user));
	fprintf(stdout,"write ok\n");
	/*Receive response delete contactlist*/
	for(i=0;i<=MAX_MESSAGE;i++)
       	{
 		buffer_user[i] = '\0';
	}
																						
    	ssl_read(ssl, buffer_user, sizeof(buffer_user));	
	
	fprintf(stdout,"in de_con\n\n");
	if( (buffer_user[0] == 0x0b) && (buffer_user[5] == 0xb2) )
    	{			
		get_data(buffer_user, mess, 7);
		fprintf(stdout, "hererwerrer\n");
	//	status(ssl);
	}
	else {
		//fprintf(stdout, "Can't Delete contactlist\n");	
		get_data(buffer_user, mess, 7);
		fprintf(stdout, "Error -> %s\n",mess);
	}	
}

int get_data(char buf[], char data[], int start)
{
   	int iptr = 0;
        unsigned char c;

	while(1)
        {
	        c = buf[start];
	        if(c == '$')
	        {
	            start++;
                    data[iptr] = '\0';
		    break;
	        }
	        else if(c > 0x9b || c == '\0' )
	        {   fprintf(stdout, "ERROR No. Data\n");
	            break; }

	        data[iptr] = c;
	        start++;
	        iptr++;
	 }
	        return start;
}

void delete_contactlist(SSL *ssl){
	int i, j;
	int menu_invalid =0;
	char menu[80];
	char temp[64];
	
	fprintf(stdout, "Enter Information\n");
 	//fprintf(stdout, "Current Contact_list= %s\n", contact_list);
 	fprintf(stdout, "Current Contact_list= \n");
	status(ssl);
  	fprintf(stdout, "Type the User_id that you would like to delete from Contact_list\n");			
        fprintf(stdout, "   :");
	scanf("%s", temp);
	strncat(temp, "$", 1);

	while(1)
	{
		printf("    Do you really want to Delete %s from Contact_list\n", temp);
		printf("************** Verify Delete ************************\n");
	  	printf("          y = Delete\n");
		printf("          n = Cancel\n");
		if(menu_invalid)
       			printf("Menu Invalid!!!!!\n\n");

		printf("Enter menu  :");
      		scanf("%s", menu);
	    	printf("\n");
	     	printf("\n");

  		system("clear");
		
		switch(menu[0])
	     	{
	      		case 'y': printf("Delete \n");
	             		de_con(ssl, temp);
		           	menu_invalid = 0;
			       	goto end_delete_contractlist;
			case 'n': printf("Cancel \n");
		         	menu_invalid = 0;
			        goto end_delete_contractlist;
			default	   :menu_invalid = 1;
														                      					break;	
		}			    
	}
end_delete_contractlist:
}


void find_contactlist(SSL *ssl){
	int i, j;
  	unsigned char buffer_user[MAX_MESSAGE];
  	unsigned char buffer_read[MAX_MESSAGE];
	unsigned char buffer[MAX_MESSAGE];
	unsigned char mess[MAX_MESSAGE];
	int menu_invalid =0;
	char menu[80];
	char temp[64];
	unsigned char fuser_id[9];
	unsigned char femail[64];
	unsigned char ffrist_name[64];
	unsigned char flast_name[64];
	unsigned char ftype[2];
	unsigned char fage[3];
	unsigned char more_pack;
	
		for(i=0;i<=MAX_MESSAGE;i++) 
		{
			mess[i] = '\0';
			buffer_user[i] = '\0';
			buffer[i] = '\0';
		}
		
		/*request_find = 0x81*/
  		/*channel 0x08, sequence 0xXXXX, length 0xXXXX, command 0x81, flag 0xff, data null*/
  		/*Set header*/
  		buffer_user[0] = 0x08;
  		buffer_user[1] = 0x00;
  		buffer_user[2] = 0x01;
  		buffer_user[3] = 0x00;
  		buffer_user[4] = 0x07;
  		buffer_user[5] = 0x81;
  		buffer_user[6] = 0xff;
			
		ssl_write(ssl, buffer_user, sizeof(buffer_user));
	
		/*Receive response find contactlist*/
		for(i=0;i<=MAX_MESSAGE;i++)
		{
    		buffer_user[i] = '\0';
		}
			
    	ssl_read(ssl, buffer_user, sizeof(buffer_user));	
	
		if( (buffer_user[0] == 0x08) && (buffer_user[5] == 0x82) )
    	{	
			fprintf(stdout, "Enter Information(Null infor put '_'\n");
	    	fprintf(stdout, "Type Find (O = Search OR, A = Search AND):");
				scanf("%s", ftype);
				strncat(mess, ftype, 1);
				strncat(mess, "$", 1);	
			fprintf(stdout, "    User ID (least than 9 char):");			
        		scanf("%s", fuser_id);
				strcat(mess, fuser_id);				
				strncat(mess, "$", 1);	
		    fprintf(stdout, "     Email (least than 64 char):");
				scanf("%s", femail);
				strcat(mess, femail);
				strncat(mess, "$", 1);	
			fprintf(stdout, "Frist Name (least than 64 char):");
				scanf("%s", ffrist_name);
				strcat(mess, ffrist_name);
				strncat(mess, "$", 1);	
			fprintf(stdout, "Last Name  (least than 64 char):");
				scanf("%s", flast_name);
				strcat(mess, flast_name);
				strncat(mess, "$", 1);	
			    				
			//fprintf(stdout, "Find Information Send to server:%s\n", mess);					
			
			/*send_find_infor = 0x83*/
  			/*channel 0x08, sequence 0xXXXX, length 0xXXXX, command 0x83, flag 0xff, data null*/
  			/*Set header*/
  			buffer_user[0] = 0x08;
  			buffer_user[1] = 0x00;
  			buffer_user[2] = 0x01;
  			buffer_user[3] = 0x00;
  			buffer_user[4] = 0x07;
  			buffer_user[5] = 0x83;
  			buffer_user[6] = 0xff;			
			
			for(j = 0;j < MAX_MESSAGE;j++) 
			{
            	buffer_user[j+7] =  mess[j];
				if(mess[j] == '\0')
				break;
        	}
			
        	ssl_write(ssl, buffer_user, sizeof(buffer_user));       
			
			/*Receive find infor*/
			for(i = 0;i < MAX_MESSAGE;i++) 
			{
				buffer_user[i] = '\0';
				buffer_read[i] = '\0';
				mess[i] = '\0';
			}
    	
			do 
			{			
				/*Receive response status*/
				ssl_read(ssl, buffer_read, sizeof(buffer_read));
	
				more_pack = buffer_read[6];	
			
				for(i = 0;i < MAX_MESSAGE;i++)
					buffer[i] = '\0';
		
				if( (buffer_read[0] == 0x08) && (buffer_read[5] == 0x84) )
    			{
				for(i= 0 ; i< MAX_MESSAGE ; i++)
				{
					if(buffer_read[7+i] == NULL) break;
					buffer[i] = buffer_read[7+i];
				}
			/*	
					i = 0;			
					while(buffer_read[FIX_HEADER +1 +i] != '\0')
					{
						buffer[i] = buffer_read[FIX_HEADER +1 +i];
						i++;
					}	
				
			*/	
					fprintf(stdout, "Find Result = %s\n", buffer);
					for(i = 0;i < MAX_MESSAGE;i++) 
					{
						buffer_read[i] = '\0';
						buffer[i] = '\0';
					}
				}
				else 
				{
					fprintf(stdout, "Command find Error\n");
					//goto end_find_contactlist;
					break;
				}
			}while(more_pack == 0x01);
		}
		else 
		{
			fprintf(stdout, "Can't Find contactlist, Command Error\n");	
		}

end_find_contactlist:		
}

void add_contactlist(SSL* ssl, char type){
	int i;
  	char mess[MAX_MESSAGE];
  	unsigned char buffer_user[MAX_MESSAGE];
  	unsigned char test[MAX_MESSAGE];
  	
  		for(i=0;i<=MAX_MESSAGE;i++)
		{
    		buffer_user[i] = '\0';
			mess[i] = '\0';
		}
  	
		if(type == 'a')
		{
			/*request_Add_Email = 0x32*/
  			/*channel 0x03, sequence 0x0001, length 0x0007, command 0x32, flag 0xff, data null*/
  			/*Set header*/
  				buffer_user[0] = 0x03;
  				buffer_user[1] = 0x00;
  				buffer_user[2] = 0x01;
  				buffer_user[3] = 0x00;
  				buffer_user[4] = 0x07;
  				buffer_user[5] = 0x32;
  				buffer_user[6] = 0xff;
  	
				ssl_write(ssl, buffer_user, sizeof(buffer_user));
	
				/*Receive ACK_response_add_email*/
  				for(i=0;i<=MAX_MESSAGE;i++)
    				buffer_user[i] = '\0';
			
    			ssl_read(ssl, buffer_user, sizeof(buffer_user));
				fprintf(stdout,"readding \n");

				if((buffer_user[0] == 0x03 ) && (buffer_user[5] == 0x34)) 		
			   	{
					fprintf(stdout,"Let's add contactlist\n");
					
					for(i=0 ; i<MAX_MESSAGE;i++) 
					{
						buffer_user[i] = '\0';
						mess[i] = '\0';
						test[i] = '\0';
					}
					fprintf(stdout,"----------------------------------------------------------------\n\n");
					fprintf(stdout,"Enter Email  :");
					scanf("%s",mess);
					strcat(mess,"$");

	                buffer_user[0] = 0x03;
	                buffer_user[1] = 0x00;					
	                buffer_user[2] = 0x01;
	                buffer_user[3] = 0x00;
	                buffer_user[4] = 0x07;
	                buffer_user[5] = 0x36;
	                buffer_user[6] = 0xff;

					for(i=0;i<64;i++) 
					{
						if(mess[i] == '\0') break;
						buffer_user[i+7] = mess[i];
					}

					ssl_write(ssl,buffer_user,sizeof(buffer_user));

					for(i = 0 ; i< MAX_MESSAGE ; i++) buffer_user[i] = '\0';
					
					ssl_read(ssl,buffer_user,sizeof(buffer_user));

					if((buffer_user[0] == 0x03) && (buffer_user[5] == 0x38)) 
					{
						fprintf(stdout,"\nInsert Completed\n");
					}
					else
					{
						get_data(buffer_user, mess, 7);
						fprintf(stdout, "%s\n", mess);
					}
				}
		}
		else if(type == 'u')
		{	/*request_Add_userID = 0x31*/
			/*channel 0x03, sequence 0x0001, length 0x0007, command 0x31, flag 0xff, data null*/
			/*Set header*/
			buffer_user[0] = 0x03;
			buffer_user[1] = 0x00;
			buffer_user[2] = 0x01;
			buffer_user[3] = 0x00;
			buffer_user[4] = 0x07;
			buffer_user[5] = 0x31;
			buffer_user[6] = 0xff;

			ssl_write(ssl, buffer_user, sizeof(buffer_user));

			/*Receive ACK_response_add_User_id*/
    		ssl_read(ssl, buffer_user, sizeof(buffer_user));
				
			if((buffer_user[0] == 0x03) && (buffer_user[5] == 0x33))
			{
				for(i=0 ; i< MAX_MESSAGE;i++) 
				{
					buffer_user[i]= '\0';
					mess[i] = '\0';
				}
		
				fprintf(stdout, "Enter Contact User_id:");
				scanf("%s" , mess);
				strcat(mess,"$");

				buffer_user[0] = 0x03;
			 	buffer_user[1] = 0x00;
			    buffer_user[2] = 0x01;
			    buffer_user[3] = 0x00;
			    buffer_user[4] = 0x01;
			    buffer_user[5] = 0x35;
			    buffer_user[6] = 0xff;

				for(i=0;i<64 ;i++)
				{
					buffer_user[i+7] = mess[i];
					if(mess[i] == '\0') 
					break;
				}

				ssl_write(ssl,buffer_user,sizeof(buffer_user));
			
				ssl_read(ssl,buffer_user,sizeof(buffer_user));
				if((buffer_user[0] == 0x03) && (buffer_user[5] == 0x37))
				{
					fprintf(stdout,"Adding is OK\n\n");
				}		
				else
				{
					for(i = 0 ; i< MAX_MESSAGE ; i++) mess[i] = '\0';
					get_data(buffer_user, mess, 7);
					fprintf(stdout, "%s\n", mess);
				}
			
			}
		}
		
}
