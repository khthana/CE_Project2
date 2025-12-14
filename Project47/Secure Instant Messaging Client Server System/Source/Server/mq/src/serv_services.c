#ifndef HEADER_SERVICES_H
#define HEADER_SERVICES_H 

#include "common.h"
#include "dbmysql.h"
#include "serv_services.h"
#include "support_serv.h"


int check_db5(char tempq1[], char user_id[], char tempq2[],char user_id_contact[],char type_service[])
{
	MYSQL_RES *res_set;
 	MYSQL_ROW row;
	int check_query;
	int i;
	char query[MAX_MESSAGE];


	for(i=0;i < MAX_MESSAGE;i++)
      		query[i] = '\0';
   	strcpy(query, tempq1);
   	strncat(query, user_id, FIX_USER_ID);
	strcat(query, tempq2);
	strncat(query, user_id_contact, FIX_USER_ID);
		strcat(query,"'");
	fprintf(stdout,"%s\n",query);
	check_query = process_query(isagmq_db, query);

    if( check_query == 1)
   	{
		mysql_query(isagmq_db, query);
	  	res_set = mysql_store_result(isagmq_db);
		row = mysql_fetch_row(res_set);
		if( row == NULL) 
		{
			fprintf(stdout, "%s   Can %s \n", user_id, type_service);
		//	fprintf(stdout, "checking roorororoo \n");
			return 1;
		}
		else
		return 0;

		mysql_free_result(res_set);
	}	
   	else if(check_query == 0) 
	{
     	fprintf(stdout, "%s   Can't %s \n", user_id,  type_service);
      	return 0;
	}
    else 
	{
      		//*Send NACK  DB system error
		fprintf(stdout,"%s             DB system error\n", type_service);
		return -1;
    }			
}

int checklength(char contact_id[],char nickname[],char status[],char ip[],char temp[],int msg,int length)
{
	int len;
	int max;
	max = msg-2;
	//len = length;

	len = length + strlen(contact_id) + strlen(nickname) + strlen(status) + strlen(ip) + 4;
	if(len < max)
	{
		strncat(temp,contact_id,strlen(contact_id));
		strncat(temp,"#",1);
		strncat(temp,nickname,strlen(nickname));
		strncat(temp,"#",1);
		strncat(temp,status,strlen(status));
		strncat(temp,"#",1);
		strncat(temp,ip,strlen(ip));
		strncat(temp,"$",1);
		return len;
	}
	else
	{
		return 0;
	}

}

void getemailaddr(char contact_id[], char email[])
{
	MYSQL_RES *res_set;
 	MYSQL_ROW row;
	
	char query[MAX_MESSAGE];
  	unsigned int i;
  	int check_query;

	/*Find nick_name from DB*/
    for(i=0;i < MAX_MESSAGE;i++) query[i] = '\0';
    strcpy(query, "SELECT EMAIL FROM user WHERE USER_ID = ");
    strncat(query, contact_id, FIX_USER_ID);
	fprintf(stdout,"%s\n",query);
     			
    check_query = process_query(isagmq_db, query);
    if( check_query == 1)
    {					
		mysql_query(isagmq_db, query);
      	res_set = mysql_store_result(isagmq_db);
		if((row = mysql_fetch_row(res_set)) != NULL)
		{
			strcpy(email,row[0]);
		}
		else
		{
			fprintf(stdout,"Can't not find this USER ID %s\n",contact_id);
		}

		mysql_free_result(res_set);
	}
	else if ( check_query == 0)
    {
       	//strncat(nickname, "#N/A", 4);
        fprintf(stdout,"            Add Nick not this userID = %s\n", contact_id);
    }
     else 
	{
		//strncat(nickname, "#N/A$", 5);
		fprintf(stdout,"            Add Nick DB system error\n", contact_id);
	}


}

void get_nick_email(char contact_id[], char nickname[],char email[])
{
	MYSQL_RES *res_set;
 	MYSQL_ROW row;
	
	char query[MAX_MESSAGE];
  	unsigned int i;
  	int check_query;

	
	/*Find nick_name from DB*/
    for(i=0;i < MAX_MESSAGE;i++) query[i] = '\0';
    strcpy(query, "SELECT NICK_NAME ,EMAIL FROM user WHERE USER_ID = ");
    strncat(query, contact_id, FIX_USER_ID);
//	fprintf(stdout,"%s\n",query);
     			
    check_query = process_query(isagmq_db, query);
    if( check_query == 1)
    {					
		mysql_query(isagmq_db, query);
      	res_set = mysql_store_result(isagmq_db);
		if((row = mysql_fetch_row(res_set)) != NULL)
		{
			strcpy(nickname,row[0]);
			strcpy(email,row[1]);
		}
		else
		{
			fprintf(stdout,"Can't not find this USER ID %s\n",contact_id);
		}

		mysql_free_result(res_set);
	}
	else if ( check_query == 0)
    {
       	//strncat(nickname, "#N/A", 4);
        fprintf(stdout,"            Add Nick not this userID = %s\n", contact_id);
    }
     else 
	{
		//strncat(nickname, "#N/A$", 5);
		fprintf(stdout,"            Add Nick DB system error\n", contact_id);
	}


}

void getnickname(char contact_id[], char nickname[])
{
	MYSQL_RES *res_set;
 	MYSQL_ROW row;
	
	char query[MAX_MESSAGE];
  	unsigned int i;
	char name[10];
  	int check_query;

	for(i =0 ; i<10 ;i++ ) name[i] = '\0';
	
		/*Find nick_name from DB*/
     			for(i=0;i < MAX_MESSAGE;i++)
       				query[i] = '\0';
     			strcpy(query, "SELECT NICK_NAME FROM user WHERE USER_ID = ");
     			strncat(query, contact_id, FIX_USER_ID);
			//	strncat(query, "'", 1);
			fprintf(stdout,"%s\n",query);
     			
     			check_query = process_query(isagmq_db, query);
     			if( check_query ==1)
     			{					
					mysql_query(isagmq_db, query);
      				res_set = mysql_store_result(isagmq_db);
       				row = mysql_fetch_row(res_set);
         			if( row[0] != NULL) 
					{
             			/*get Nick$ contact*/
						strcpy(nickname,"#");
						strcpy(name,row[0]);
						strncpy(nickname,name,strlen(name));
						//strncat(nickname, "#", 1);
						//strcat(nickname, row[0]);					
					}
					else 
					{
						strncat(nickname, "#N/A", 4);
					}
					mysql_free_result(res_set);
				}
				else if ( check_query == 0)
     			{
       				strncat(nickname, "#N/A", 4);
         			fprintf(stdout,"            Add Nick not this userID = %s\n", contact_id);
     			}
     			else 
				{
					strncat(nickname, "#N/A$", 5);
					fprintf(stdout,"            Add Nick DB system error\n", contact_id);
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
	        else if( c < 0x21 || c > 0x7e || c == '\0' )  
			{
				fprintf(stdout, "             ");
				fprintf(stdout, "ERROR No. Data\n");
	            return 0;
	   		}
	        data[iptr] = c;
	        start++;
	        iptr++;
    	}
        return start;
}

void write_error(SSL *ssl,char message[])
{
	unsigned char buffer[MAX_MESSAGE];
	int i ;

	for (i =0 ; i < MAX_MESSAGE ;i++ )
	{
		buffer[i] = '\0';
	}

	buffer[0] = 0x06;
	buffer[1] = 0x00;
	buffer[2] = 0x01;
	buffer[3] = 0x00;
	buffer[4] = 0x01;
	buffer[5] = 0x62;
	buffer[6] = 0xff;

	for (i =0; i < MAX_MESSAGE ; i++ )
	{
		if(message[i] == NULL) break;
		buffer[i + 7] = message[i];
	}

	ssl_write(ssl,buffer,sizeof(buffer));
}


void admit(SSL *ssl, unsigned char *buffer_read, char user_id[]){
	MYSQL_RES *res_set;
 	MYSQL_ROW row;
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
  	char query[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	char contact_id[10];
	char contact_id_status[2];
	char user_id_status[2];
  	unsigned int i;
  	int check_query;
	int check_get_data =0;
	int check_valid_data = 0;
	int len,count,ptr,j;
	for(i =0 ;i<MAX_MESSAGE ; i++)
	{
		buffer[i]= '\0';
		temp[i] = '\0';
		query[i] = '\0';
		mess[i] = '\0';
	}
	//***********************************************************************
	// Start Process of Admit
	//***********************************************************************											
	strcpy(user_id_status,"");
	if((buffer_read[0] == 0x55) && (buffer_read[5] == 0x5a))
    {

		check_get_data = get_data(buffer_read,temp,7);
		len = strlen(temp);
		count=0;
		ptr = 0;
		j=0;
		fprintf(stdout,"temp -> : %s\n",temp);
		strncpy(contact_id,temp,len-2);
		user_id_status[0] = temp[len-1];
		user_id_status[1] = '\0';
		if( check_userid(contact_id) == 1 && 
		    (user_id_status[0] == 0x41 || user_id_status[0] == 0x42 ||
		     user_id_status[0] == 0x4F )
		  )
		{
					check_valid_data = 1;
		}	
		if(check_get_data == 1 && check_valid_data == 1 )
		{
			//write error message
			fprintf(stdout,"Your Contact_id is invalid\n");
			strcpy(mess,"Invalid Contact ID..$");
			write_error(ssl,mess);
		}
		else
		{

		//-------------------------Set Admitted Contact ID----------------------------------------

			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
	        	    		DEF_PORT_NUM, DEF_SOCKET_NAME, 0);

    		if(isagmq_db == NULL)
       		{
				fprintf(stdout, "%s   ", user_id);
            	fprintf(stdout, "Change Connect to Database Error");
				strcpy(mess,"Can not connect to DB..$");
				write_error(ssl,mess);

       		}
			else
			{
				strcpy(query,"SELECT STATUS FROM contact_list WHERE CONTACT_ID = '");
				strcat(query,contact_id);
				strcat(query,"'");
				strcat(query," AND STATUS NOT IN ('D','X','W')");
				strcat(query," GROUP BY STATUS");
				check_query = process_query(isagmq_db, query);
				fprintf(stdout,"query :%s\n",query);
				if( check_query == 1 /*|| check_query == 0*/)
				{
					mysql_query(isagmq_db,query);
					res_set = mysql_store_result(isagmq_db);

					if((row = mysql_fetch_row(res_set)) != NULL)
					{
						//Get Current Status of Contact ID 
						strcpy(contact_id_status,row[0]);
				fprintf(stdout,"\n\n user_id : %s user_id_status : %s contact_id : %s contact_id_status : %s\n\n/",user_id,
						user_id_status,contact_id,contact_id_status);

						strcpy(query, "UPDATE contact_list SET STATUS = '");
						strcat(query, contact_id_status);
						strcat(query,"'");
						strcat(query, " WHERE USER_ID = '");
						strncat(query, user_id, FIX_USER_ID);	
						strcat(query, "'");
						strcat(query," AND CONTACT_ID ='");
						strcat(query,contact_id);
						strcat(query,"'");
						check_query = process_query(isagmq_db, query);

						if( check_query == 1 || check_query == 0)
						{
							//********************************
							// Block user in other list
							strcpy(query, "UPDATE contact_list SET STATUS = '");
							strcat(query, user_id_status);
							strcat(query,"'");
							strcat(query, " WHERE USER_ID = '");
							strncat(query, contact_id, FIX_USER_ID);	
							strcat(query, "'");
							strcat(query," AND CONTACT_ID ='");
							strcat(query,user_id);
							strcat(query,"'");
							check_query = process_query(isagmq_db, query);

							if( check_query == 1 || check_query == 0)
							{
								//fprintf(stdout,"Block user completed \n");
								fprintf(stdout, "%s   ", user_id);
								fprintf(stdout, "Deny user  OK...\n");

								buffer[0] = 0x55;
								buffer[1] = 0x00;
								buffer[2] = 0x01;
								buffer[3] = 0x00;
								buffer[4] = 0x07;
								buffer[5] = 0x5b;
								buffer[6] = 0xff;

								strcpy(temp, "Deny Completed OK...$");
													
								for(i=0;i < 255;i++) 
								{
									if(temp[i] == NULL) break;
									buffer[i+7] =  temp[i];
								}

								ssl_write(ssl, buffer, sizeof(buffer));

							}
							else
							{
								fprintf(stdout,"Error UPDATE INNER PROCESS\n");
								strcpy(mess,"Can not block this Contact ID..$");
								write_error(ssl,mess);

								//write_error;
							}
						}
						else
						{
							fprintf(stdout,"Error UPDATE OUTER PROCESS\n");
							strcpy(mess,"Can not block this Contact ID..$");
							write_error(ssl,mess);

							//write_error;
						}

					}
					else
					{
						fprintf(stdout,"No result set returned");
					}
				}
				else if(check_query == 0)
				{
					fprintf(stdout,"No result set returned");
					strcpy(mess,"Can not find your request CONTACT ID ..$");
					write_error(ssl,mess);

				}
				else
				{
					fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"DB system error %s\n", user_id);
					strcpy(mess,"Query Error..$");
					write_error(ssl,mess);

					//write_err_message(ssl, 0x42, "Can't change nick_name, DB error\n");
					/*Disconnect MySQL*/
				}
	 			
				do_disconnect(isagmq_db);
			}

		//--------------------------Finished Admit Contact ID--------------------------------
		}			
	}
	else
	{
		//fprintf(stdout, "%s   ", user_id);
	  	fprintf(stdout, "Incorrect Packet\n");
		strcpy(mess,"Invalid Packet..$");
		write_error(ssl,mess);

		//write_err_message(ssl, 0x42, "Command change nick_name incorrect\n");
	}
		
}

void logout(SSL *ssl , unsigned char *buffer_read , char user_id[])
{
	unsigned char buffer[MAX_MESSAGE];
	char temp[MAX_MESSAGE];
  	char query[MAX_MESSAGE];
	int i ;
	int check_query;

	for(i =0 ;i< MAX_MESSAGE ; i++)
	{
		query[i] = '\0';
		temp[i] = '\0';
		buffer[i] = '\0';
	}

		
		isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
      	       				DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
		
		if(isagmq_db == NULL)
      	{
			fprintf(stdout, "%s   ", user_id);
           	fprintf(stdout, "Status Connect to Database Error");
			strcpy(temp,"Can't connect to DB...$");
			write_error(ssl,temp);
            //check_db = 0;
       	}
		else
		{
			strcpy(query, "UPDATE contact_list SET STATUS = 'F'");
			strcat(query," WHERE CONTACT_ID ='");
			strcat(query,user_id);
			strcat(query,"'");
			strcat(query," AND STATUS NOT IN ('X','D','W')");
			check_query = process_query(isagmq_db, query);

			if( check_query == 1 || check_query == 0)
			{
				buffer[0] = 0x07;
				buffer[1] = 0x00;
				buffer[2] = 0x01;
				buffer[3] = 0x00;
				buffer[4] = 0x01;
				buffer[5] = 0x72;
				buffer[6] = 0xff;
					
				strcpy(temp,"Logout successfully..$");
				for(i=0 ; i< strlen(temp);i++)
				{
					buffer[i+7] = temp[i];
				}

				ssl_write(ssl,buffer,sizeof(buffer));
			}
			else
			{
				fprintf(stdout,"Can't update Logout status");
				strcpy(temp,"Can't update Logout status...$");
				write_error(ssl,temp);
			}


			do_disconnect(isagmq_db); 
		}
	

}


void request_info(SSL *ssl , unsigned char *buffer_read , char user_id[])
{
	MYSQL_RES *res_set;
 	MYSQL_ROW row;
	unsigned char buffer[MAX_MESSAGE];
	char temp[MAX_MESSAGE];
  	char query[MAX_MESSAGE];
	char contact_id[10];
	int i ;
	int check_query;
	char nickname[255];
	char email[128];

	for(i =0 ;i< MAX_MESSAGE ; i++)
	{
		query[i] = '\0';
		temp[i] = '\0';
		buffer[i] = '\0';
	}

	if ((buffer_read[0] == 0x05) && (buffer_read[5] == 0x21))
	{
		for(i=0;i < 10;i++) contact_id[i] = '\0';
		
		isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
      	       				DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
		
		if(isagmq_db == NULL)
      	{
			fprintf(stdout, "%s   ", user_id);
           	fprintf(stdout, "Status Connect to Database Error");
			strcpy(temp,"Can't connect to DB...$");
			write_error(ssl,temp);
            //check_db = 0;
       	}
		else
		{
			strcpy(query, "UPDATE contact_list SET STATUS = 'O'");
			strcat(query," WHERE CONTACT_ID ='");
			strcat(query,user_id);
			strcat(query,"'");
			strcat(query," AND STATUS NOT IN ('X','D','W')");
			check_query = process_query(isagmq_db, query);

			if( check_query == 1 || check_query == 0)
			{
				strcpy(query, "SELECT NICK_NAME , EMAIL  FROM user WHERE USER_ID = '");
				strncat(query, user_id, FIX_USER_ID);
				strcat(query,"'");
				fprintf(stdout,"query %s\n",query);

				check_query = process_query(isagmq_db, query);
				if( check_query == 1)
				{
					mysql_query(isagmq_db, query);
					res_set = mysql_store_result(isagmq_db);
					if((row = mysql_fetch_row(res_set)) != NULL)
					{
						strcpy(nickname,row[0]);
						strcpy(email,row[1]);
						strcpy(temp,user_id);
						strcat(temp,"#");
						strcat(temp,email);
						strcat(temp,"#");
						strcat(temp,nickname);
						strcat(temp,"$");

						buffer[0] = 0x05;
						buffer[1] = 0x00;
						buffer[2] = 0x01;
						buffer[3] = 0x00;
						buffer[4] = 0x01;
						buffer[5] = 0x22;
						buffer[6] = 0xff;
						
						for(i=0 ; i< strlen(temp)+1;i++)
						{
							buffer[i+7] = temp[i];
						}

						ssl_write(ssl,buffer,sizeof(buffer));

					}
				}
				else if ( check_query == 0)
				{
					//Send NACK  No. this userID
					fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"No. this userID = %s\n", user_id);
					strcpy(temp,"Don't have authorization requesting list..$");
					write_error(ssl,temp);
					/*Disconnect MySQL*/
				}
				else 
				{
					fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"DB system error %s\n", user_id);
					strcpy(temp,"DB system error..$");
					write_error(ssl,temp);
					/*Disconnect MySQL*/
				}

			}
			else
			{
				fprintf(stdout,"Can't update initial status");
				strcpy(temp,"Can't update initial status ,retry to login next time...$");
				write_error(ssl,temp);
			}
			do_disconnect(isagmq_db); 
		}
	}
	else
	{
		fprintf(stdout,"Packet Error\n");
		strcpy(temp,"Packet Error...$");
		write_error(ssl,temp);
	}

}


void accept_authorize(SSL *ssl, unsigned char *buffer_read, char user_id[])
{
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
  	char query[MAX_MESSAGE];
	char contact_id[10];
	int i ;
	int len2;
	char ans[2];
	int check_query;

	for(i =0 ;i< MAX_MESSAGE ; i++)
	{
		query[i] = '\0';
		temp[i] = '\0';
		buffer[i] = '\0';
	}
	
	if ((buffer_read[0] == 0x5e) && (buffer_read[5] == 0x55))
	{
		for(i=0;i < 10;i++) contact_id[i] = '\0';
		
		isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
      	       				DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
		
		if(isagmq_db == NULL)
      	{
			fprintf(stdout, "%s   ", user_id);
           	fprintf(stdout, "Status Connect to Database Error");
            //check_db = 0;
       	}
		else
		{

			if(get_data(buffer_read,contact_id, 7) == 0 )
			{
				//write error message
				fprintf(stdout,"Your Contact_id is invalid\n");
			}
			else
			{	
				fprintf(stdout,"Accepted User : %s\n",contact_id);
				for(i = 0 ; i<10 ; i++)
				{
					if(contact_id[i] == '#')break;
								
				}
				contact_id[i] = '\0';
				len2 = strlen(contact_id);
	//			fprintf(stdout,"%c\n",buffer[7);
				//len2++;	
				if ((buffer_read[7+len2+1] == 0x63) || (buffer_read[7+len2+1] == 0x43) ||
					(buffer_read[7+len2+1] == 0x6e) || (buffer_read[7+len2+1] == 0x4e) ||
					(buffer_read[7+len2+1] == 0x79) || (buffer_read[7+len2+1] == 0x59) )
				{
					ans[0] = buffer_read[7+len2+1];ans[1] = '\0';
					//fprintf(stdout,"%s\n",ans);
					//Yes
					if((ans[0] == 0x79) || (ans[0] == 0x59))
					{
						fprintf(stdout,"YES\n");
						strcpy(query, "UPDATE contact_list SET STATUS = 'O'");
						strcat(query," WHERE USER_ID ='");
						strcat(query,contact_id);
						strcat(query,"'");
						strcat(query," AND CONTACT_ID ='");
						strcat(query,user_id);
						strcat(query,"'");

						check_query = process_query(isagmq_db, query);

						if( check_query == 1 || check_query == 0)
						{
							//********************************
							// Insert user in other list
							for(i =0 ;i< MAX_MESSAGE ; i++)	query[i] = '\0';
										
							strcpy(query, "INSERT INTO contact_list VALUES('");
							strcat(query, user_id);
							strcat(query, "', '");
							strcat(query, contact_id);
							strcat(query, "', '");
							strcat(query, "O");
							strcat(query, "')"); 
							check_query = process_query(isagmq_db, query);

							if( check_query == 1 || check_query == 0)
							{
								//fprintf(stdout,"Block user completed \n");
								fprintf(stdout, "%s   ", user_id);
								fprintf(stdout, "Authorization  OK...\n");

								buffer[0] = 0x55;
								buffer[1] = 0x00;
								buffer[2] = 0x01;
								buffer[3] = 0x00;
								buffer[4] = 0x07;
								buffer[5] = 0x56;
								buffer[6] = 0xff;

								strcpy(temp, "Authorization Completed OK...$");
																
								for(i=0;i < 255;i++) 
								{
									if(temp[i] == NULL) break;
									buffer[i+7] =  temp[i];
								}

								ssl_write(ssl, buffer, sizeof(buffer));

							}
							else
							{
								fprintf(stdout,"Can't block this user : %s \n",contact_id);
								strcpy(temp,"Blocking Incompleted...$");
								write_error(ssl,temp);
							}

							//********************************
																		
						}
						else
						{
							fprintf(stdout,"Can't Update Authorization\n");
							strcpy(temp,"Update Authorization Incompleted...$");
							write_error(ssl,temp);
						}

					}
					//No
					else if((ans[0] == 0x6e) || (ans[0] == 0x4e))
					{
						strcpy(query, "UPDATE contact_list SET STATUS = 'U'");
						strcat(query," WHERE USER_ID ='");
						strcat(query,contact_id);
						strcat(query,"'");
						strcat(query," AND CONTACT_ID ='");
						strcat(query,user_id);
						strcat(query,"'");

						check_query = process_query(isagmq_db, query);
						if( check_query == 1 || check_query == 0)
						{
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Deny Authorization  OK...\n");

							buffer[0] = 0x55;
							buffer[1] = 0x00;
							buffer[2] = 0x01;
							buffer[3] = 0x00;
							buffer[4] = 0x07;
							buffer[5] = 0x56;
							buffer[6] = 0xff;

							strcpy(temp, "Deny Authorization Completed OK...$");

							for(i=0;i < 255;i++) 
							{
								if(temp[i] == NULL) break;
								buffer[i+7] =  temp[i];
							}

							ssl_write(ssl, buffer, sizeof(buffer));
																

						}
						else
						{
							strcpy(temp, "Deny Authorization Incompleted...$");
							write_error(ssl,temp);
						}

					}
				}
				else
				{
					fprintf(stdout,"Invalid Answer \n");
					strcpy(temp,"Invalid Answer...$");
					write_error(ssl,temp);
				}
			}

			do_disconnect(isagmq_db); 
		}

	}


}

void authorize_list(SSL *ssl, unsigned char *buffer_read, char user_id[],NODE *list)
{	
	MYSQL_RES *res_set;
 	MYSQL_ROW row;

	//NODE *link;
	  
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
				
  	//char contact_list[MAX_MESSAGE];
  	char query[MAX_MESSAGE];

	char contact_id[10];
	char email[255];
	char nickname[255];
	char status[10];
	char ip[16];
	char ans[2];

	int temp_length;
	int i;
	int check_db;
	int len;
	int temp_len;
	int check_query;
	int len2 ;
	
	i= temp_length = temp_len = len2 = len = 0;
	for(i =0 ;i< MAX_MESSAGE ; i++)
	{
		query[i] = '\0';
		temp[i] = '\0';
		buffer[i] = '\0';
	}
	for(i=0;i < 10;i++)
	{
		contact_id[i] = '\0';
		status[i] = '\0';
	}

	for(i=0;i < 255;i++)
	{
		nickname[i] = '\0';
		email[i] = '\0';
	}

	for(i=0;i < 16;i++)
	{
		ip[i] = '\0';
	}
	
	for(i=0 ; i<2 ; i++) ans[i] = '\0';
		//fprintf(stdout,"hejeh");
	check_query =0;
	
	if ((buffer_read[0] == 0x5e) && (buffer_read[5] == 0x51))
	{
		//fprintf(stdout,"hejeh");
		isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
      	       				DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
					
		if(isagmq_db == NULL)
      	{
			fprintf(stdout, "%s   ", user_id);
           	fprintf(stdout, "Status Connect to Database Error");
            check_db = 0;
       	}
		else
		{
			//***********************************************************************************			
			strcpy(query, "SELECT USER_ID  FROM contact_list WHERE CONTACT_ID = '");
			strncat(query, user_id, FIX_USER_ID);
			strcat(query,"'");
			strcat(query," AND STATUS = 'W'");
			fprintf(stdout,"query %s\n",query);

			check_query = process_query(isagmq_db, query);
			if( check_query == 1)
			{
				fprintf(stdout,"check query == 1 \n");
				mysql_query(isagmq_db, query);
     			res_set = mysql_store_result(isagmq_db);
				strcpy(temp,"");
				//sequence = random_sequence(65535, 1234);
				//sequence = rand();

                while((row = mysql_fetch_row(res_set)) != NULL)
		        {
	               
						strcpy(contact_id,row[0]);
						get_nick_email(contact_id,nickname,email);	
						find_online(list,contact_id,status,ip);
						if(strcmp(row[1],"W") == 0)  strcpy(status,"W");
						fprintf(stdout,"con->%s\n",contact_id);
						fprintf(stdout,"nick->%s\n",nickname);
						len += strlen(contact_id)+ strlen(email)+ strlen(nickname) + strlen(status) + strlen(ip);
						len = len + 4;
						fprintf(stdout,"len - > %d\n",len);
						if(len < MAX_MESSAGE-9)
						{
							strcat(temp,contact_id);
							strcat(temp,"#");
							strcat(temp,email);
							strcat(temp,"#");
							strcat(temp,nickname);
							strcat(temp,"#");
							strcat(temp,status);
							strcat(temp,"#");
							strcat(temp,ip);
							strcat(temp,"$");
							temp_length = strlen(temp);
							len = temp_length;
						}
						else
						{
							
							fprintf(stdout,"INSIDE SEND MESSAGE\n");
							for(i=0;i<MAX_MESSAGE;i++) buffer[i] ='\0';
	
      						buffer[0] = 0x5e;
							buffer[1] = 0x00;
							buffer[2] = 0x01;
							buffer[3] = 0x00;
							buffer[4] = 0x01;
      						buffer[5] = 0x52;
      						buffer[6] = 0x01;				/*More of package*/

							for(i=0;i<MAX_MESSAGE;i++)
							{
								buffer[7+i] = temp[i];
								if(temp[i] == '\0') break;
								
							}
							
							ssl_write(ssl,buffer,sizeof(buffer));

							for(i=0;i<MAX_MESSAGE;i++)
							{
								temp[i] = '\0';
								buffer[i] = '\0';
							}
							strcpy(temp,contact_id);
							strcat(temp,"#");
							strcat(temp,email);
							strcat(temp,"#");
							strcat(temp,nickname);
							strcat(temp,"#");
							strcat(temp,status);
							strcat(temp,"#");
							strcat(temp,ip);
							strcat(temp,"$");
							temp_length = strlen(temp);
							len = temp_length;

						}

				}
				
				strcat(temp,"$");

				for(i=0;i<MAX_MESSAGE;i++) buffer[i] ='\0';

				buffer[0] = 0x5e;
				buffer[1] = 0x00;
				buffer[2] = 0x01;
				buffer[3] = 0x00;
				buffer[4] = 0x07;
				buffer[5] = 0x52;
				buffer[6] = 0x00;	

				fprintf(stdout,"ALL INFO \n%s\n",temp);
				for(i=0;i<MAX_MESSAGE;i++)
				{
					buffer[7+i] = temp[i];
					if(temp[i] == '\0')
					{
//						fprintf(stdout,"Number of Chars ->%d\n",i);       
						break;
					}	
				}
							
				ssl_write(ssl,buffer,sizeof(buffer));


			}
     		else if ( check_query == 0)
     		{
       			//Send NACK  No. this userID
         		fprintf(stdout, "%s   ", user_id);
				fprintf(stdout,"No. this userID = %s\n", user_id);
			strcpy(temp,"Don't have authorization requesting list..$");
			write_error(ssl,temp);
         		/*Disconnect MySQL*/
     		}
     		else 
			{
				fprintf(stdout, "%s   ", user_id);
				fprintf(stdout,"DB system error %s\n", user_id);
					/*Disconnect MySQL*/
			}

		//****************************** esle *****************************************************			
		}
		 
		 do_disconnect(isagmq_db); 

	}
	else
	{
		fprintf(stdout,"Packet Error \n");
	}
												
}


void set_status(SSL *ssl, unsigned char *buffer_read, char user_id[])
{

	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
  	char query[MAX_MESSAGE];
	char status[2];
  	unsigned int i;
  	int check_query;

	for(i =0 ;i<2 ; i++) status[i] = '\0';

	for(i =0 ;i<MAX_MESSAGE ; i++)
	{
		buffer[i]= '\0';
		temp[i] = '\0';
		query[i] = '\0';
		mess[i] = '\0';
	}

	//***********************************************************************
	// Start Process of Set Status
	//***********************************************************************											

	if((buffer_read[0] == 0x51) && (buffer_read[5] == 0x51))
    {
		if((buffer_read[7] == 0x61) || (buffer_read[7] == 0x41) ||
		   (buffer_read[7] == 0x62) || (buffer_read[7] == 0x42) ||
     	   (buffer_read[7] == 0x6f) || (buffer_read[7] == 0x4f) )
		{
			status[0] = buffer_read[7];
			//fprintf(stdout,"status request ->%s\n",status);
		//----------------------------Set Nick Name--------------------------------------------

			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
	        	    		DEF_PORT_NUM, DEF_SOCKET_NAME, 0);

    		if(isagmq_db == NULL)
       		{
				fprintf(stdout, "%s   ", user_id);
            	fprintf(stdout, "Can't Connect to Database Error");
				strcpy(mess,"Can not connnect to DB..$");
				write_error(ssl,mess);

       		}
			else
			{
				strcpy(query, "UPDATE contact_list SET STATUS = '");
				strcat(query,status);
				strcat(query,"'");
				strcat(query," WHERE CONTACT_ID ='");
				strcat(query,user_id);
				strcat(query,"'");
				strcat(query," AND STATUS  NOT IN ('W','X')");
				check_query = process_query(isagmq_db, query);
			//	fprintf(stdout,"query --> %s\n",query);
				if( check_query == 1 || check_query == 0)
				{
						//fprintf(stdout,"Block user completed \n");
						fprintf(stdout, "%s   ", user_id);
						fprintf(stdout, "Set Status  OK...\n");

						buffer[0] = 0x51;
						buffer[1] = 0x00;
						buffer[2] = 0x01;
						buffer[3] = 0x00;
						buffer[4] = 0x07;
						buffer[5] = 0x52;
						buffer[6] = 0xff;

						strcpy(temp, "Setting Status Completed OK...$");
											
						for(i=0;i < 255;i++) 
						{
							if(temp[i] == NULL) break;
							buffer[i+7] =  temp[i];
						}

						ssl_write(ssl, buffer, sizeof(buffer));

				}
				else
				{
					//Can't change nick_name ,Error Query
					//fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"DB system error %s\n", user_id);
					strcpy(mess,"Error query..$");
					write_error(ssl,mess);

					//write_err_message(ssl, 0x42, "Can't change nick_name, DB error\n");
					/*Disconnect MySQL*/
				}
	 
			}

			do_disconnect(isagmq_db);
		//----------------------------Finished Setting Nickname----------------------------------
		}	
		else
		{
			fprintf(stdout,"Invalid Status\n");
			strcpy(mess,"Invalid Status..$");
			write_error(ssl,mess);

		}
	}
	else
	{
		//fprintf(stdout, "%s   ", user_id);
	  	fprintf(stdout, "Incorrect Packet\n");
		strcpy(mess,"Invalid Packet..$");
		write_error(ssl,mess);

		//write_err_message(ssl, 0x42, "Command change nick_name incorrect\n");
	}
		
}


void deny(SSL *ssl, unsigned char *buffer_read, char user_id[]){
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
	unsigned char contact_id[255];	
	
  	char query[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
  	unsigned int i;
  	int check_query;

	for(i =0 ;i<MAX_MESSAGE ; i++)
	{
		buffer[i]= '\0';
		temp[i] = '\0';
		query[i] = '\0';
		mess[i] = '\0';
	}
	for(i =0 ;i<255 ; i++)
	{
		contact_id[i]= '\0';
	}

	//***********************************************************************
	// Start Process of deny
	//***********************************************************************											

	if((buffer_read[0] == 0x55) && (buffer_read[5] == 0x51))
    {

		if(get_data(buffer_read,contact_id, 7) == 0 )
		{
			//write error message
			fprintf(stdout,"Your Contact_id is invalid\n");
			strcpy(mess,"Invalid Contact ID..$");
			write_error(ssl,mess);
		}
		else
		{
		//----------------------------Set Nick Name--------------------------------------------

			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
	        	    		DEF_PORT_NUM, DEF_SOCKET_NAME, 0);

    		if(isagmq_db == NULL)
       		{
				fprintf(stdout, "%s   ", user_id);
            	fprintf(stdout, "Change Connect to Database Error");
				strcpy(mess,"Can not connect to DB..$");
				write_error(ssl,mess);

       		}
			else
			{
				strcpy(query, "UPDATE contact_list SET STATUS = 'D'");
				strcat(query, " WHERE USER_ID = '");
				strncat(query, user_id, FIX_USER_ID);	
				strcat(query, "'");
				strcat(query," AND CONTACT_ID ='");
				strcat(query,contact_id);
				strcat(query,"'");
				check_query = process_query(isagmq_db, query);

				if( check_query == 1 /*|| check_query == 0*/)
				{
					//********************************
					// Block user in other list
					strcpy(query, "UPDATE contact_list SET STATUS = 'X'");
					strcat(query, " WHERE USER_ID = '");
					strncat(query, contact_id, FIX_USER_ID);	
					strcat(query, "'");
					strcat(query," AND CONTACT_ID ='");
					strcat(query,user_id);
					strcat(query,"'");
					check_query = process_query(isagmq_db, query);
					if( check_query == 1 /* || check_query == 0*/)
					{
						//fprintf(stdout,"Block user completed \n");
						fprintf(stdout, "%s   ", user_id);
						fprintf(stdout, "Deny user  OK...\n");

						buffer[0] = 0x55;
						buffer[1] = 0x00;
						buffer[2] = 0x01;
						buffer[3] = 0x00;
						buffer[4] = 0x07;
						buffer[5] = 0x52;
						buffer[6] = 0xff;

						strcpy(temp, "Deny Completed OK...$");
											
						for(i=0;i < 255;i++) 
						{
							if(temp[i] == NULL) break;
							buffer[i+7] =  temp[i];
						}

						ssl_write(ssl, buffer, sizeof(buffer));

					}
					else
					{
						fprintf(stdout,"Can't block this user : %s \n",contact_id);
						strcpy(mess,"Can not block this Contact ID..$");
						write_error(ssl,mess);

						//write_error;
					}

					//********************************
					
					
				}
				else
				{
					fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"DB system error %s\n", user_id);
					strcpy(mess,"Query Error..$");
					write_error(ssl,mess);

					//write_err_message(ssl, 0x42, "Can't change nick_name, DB error\n");
					/*Disconnect MySQL*/
				}
	 
			}

			do_disconnect(isagmq_db);
		//----------------------------Finished Setting Nickname----------------------------------
		}									
	}
	else
	{
	  	fprintf(stdout, "Incorrect Packet\n");
		strcpy(mess,"Invalid Packet..$");
		write_error(ssl,mess);
	}
		
}


void new_user(SSL *ssl, unsigned char *buffer_read, char *ip_client, char user_id[]){
	int i;
        unsigned char buffer_user[MAX_MESSAGE];
        for( i=0;i<MAX_MESSAGE;i++) buffer_user[i] = '\0';
        strcpy(buffer_user,"Let's start add new user");
        ssl_write(ssl,buffer_user,sizeof(buffer_user));	
}
void add_nick_name(char user_id_contact[], char contact_list[]){

}
int add_ip(char user_id_contact[],char contact_list[]){

}
void login(SSL *ssl, unsigned char *buffer_read, char user_id[]){
	int i;
        unsigned char buffer_user[MAX_MESSAGE];
        for( i=0;i<MAX_MESSAGE;i++) buffer_user[i] = '\0';
        strcpy(buffer_user,"Let's start Login");
        ssl_write(ssl,buffer_user,sizeof(buffer_user));
}
void chat(SSL *ssl,unsigned char * buffer_read)
{
	int i ;
	unsigned char buffer[MAX_MESSAGE];
	
	for(i=0;i<MAX_MESSAGE; i++)
	{
		buffer[i]= '\0';
	}
	
	if(buffer_read[5] == 0x01)
	{
		
	}	
}

void contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[])
{	
	char query[MAX_MESSAGE];
	char temp[MAX_MESSAGE];
	unsigned char buffer[MAX_MESSAGE];

	char contact_id[10];
	char email[255];

	int i;
	int check_db;
	int len = 0;
	int temp_len = 0;
	int check_query;

	MYSQL_RES *res_set;
 	MYSQL_ROW row;

	for(i =0 ;i< MAX_MESSAGE ; i++)
	{
		query[i] = '\0';
		temp[i] = '\0';
		buffer[i] = '\0';
	}

	if ((buffer_read[0] == 0x55) && (buffer_read[5] == 0x51))
	{
		isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
      	       				DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
					
		if(isagmq_db == NULL)
      	{
			fprintf(stdout, "%s   ", user_id);
           	fprintf(stdout, "Status Connect to Database Error");
            check_db = 0;
       	}
		else
		{
			//***********************************************************************************			
			fprintf(stdout,"query");
			strcpy(query, "SELECT CONTACT_ID  FROM contact_list WHERE USER_ID = '");
			strncat(query, user_id, FIX_USER_ID);
			strcat(query,"'");

			check_query = process_query(isagmq_db, query);
			if( check_query == 1)
			{
				mysql_query(isagmq_db, query);
     			res_set = mysql_store_result(isagmq_db);
			//	strcpy(contact_list,"");
				strcpy(temp,"");
				//sequence = random_sequence(65535, 1234);
				//sequence = rand();

                while((row = mysql_fetch_row(res_set)) != NULL)
		        {
	               
						strcpy(contact_id,row[0]);
						getemailaddr(contact_id,email);
						len += strlen(contact_id);
						len++;
						len += strlen(email);
						len++;

						if(len < MAX_MESSAGE-9)
						{
							strcat(temp,contact_id);
							strcat(temp,"#");
							strcat(temp,email);
							strcat(temp,"$");
							temp_len = strlen(temp);
							len = temp_len;
						}
						else
						{
							strcat(temp,"$");
							for(i=0;i<MAX_MESSAGE;i++) buffer[i] ='\0';
	
      						buffer[0] = 0x55;
							buffer[1] = 0x01;
							buffer[2] = 0x00;
							buffer[3] = 0x00;
							buffer[4] = 0x01;
      						buffer[5] = 0x52;
      						buffer[6] = 0x01;				/*More of package*/

							for(i=0;i<MAX_MESSAGE;i++)
							{
								buffer[7+i] = temp[i];
								if(temp[i] == '\0') break;
								
							}
							
							ssl_write(ssl,buffer,sizeof(buffer));

							for(i=0;i<MAX_MESSAGE;i++)
							{
								temp[i] = '\0';
								buffer[i] = '\0';
							}

							strcpy(temp,contact_id);
							strcat(temp,"#");
							strcat(temp,email);
							strcat(temp,"$");
							temp_len = strlen(temp);
							len = temp_len;

						}

				}
				
				strcat(temp,"$");
				for(i=0;i<MAX_MESSAGE;i++) buffer[i] ='\0';

				buffer[0] = 0x55;
				buffer[1] = 0x00;
				buffer[2] = 0x01;
				buffer[3] = 0x00;
				buffer[4] = 0x07;
				buffer[5] = 0x52;
				buffer[6] = 0x00;	

				//fprintf(stdout,"ALL INFO \n%s\n",temp);
				for(i=0;i<MAX_MESSAGE;i++)
				{
					buffer[7+i] = temp[i];
					if(temp[i] == '\0')
					{
						fprintf(stdout,"Number of Chars ->%d\n",i);       
						break;
					}	
				}
							
				ssl_write(ssl,buffer,sizeof(buffer));


			}
     		else if ( check_query == 0)
     		{
       			//Send NACK  No. this userID
         		fprintf(stdout, "%s   ", user_id);
				fprintf(stdout,"No. this userID = %s\n", user_id);
         		/*Disconnect MySQL*/
     		}
     		else 
			{
				fprintf(stdout, "%s   ", user_id);
				fprintf(stdout,"DB system error %s\n", user_id);
					/*Disconnect MySQL*/
			}

		//****************************** esle *****************************************************			
		}
		 
		 do_disconnect(isagmq_db); 

	}
	else
	{
		fprintf(stdout,"Packet Error \n");
	}
												
}


void status(SSL *ssl, unsigned char *buffer_read, char user_id[],NODE *list)
{
	MYSQL_RES *res_set;
 	MYSQL_ROW row;

	NODE *link;
	  
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
				
  	char contact_list[MAX_MESSAGE];
  	char query[MAX_MESSAGE];

	char contact_id[10];
	char email[255];
	char nickname[255];
	char status[10];
	char ip[16];

  	unsigned char seq[2];
	unsigned char size[2];
	unsigned int sequence;	


  	unsigned int i;
  	int check_query;
	int check_db = 1;
	int temp_length = 0;
	int len =0;

	link = list;

	for(i=0;i < MAX_MESSAGE;i++)
	{
		buffer[i] = '\0';
		temp[i] = '\0';
		contact_list[i] = '\0';
		query[i] = '\0';
	}
	
	for(i=0;i < 10;i++)
	{
		contact_id[i] = '\0';
		status[i] = '\0';
	}

	for(i=0;i < 255;i++)
	{
		nickname[i] = '\0';
		email[i] = '\0';
	}

	for(i=0;i < 16;i++)
	{
		ip[i] = '\0';
	}


	/*Ack, if commamd = request_status = 0x51 (byte order = 5)
 	*            or not end function*/
    if ((buffer_read[0] == 0x5) && (buffer_read[5] == 0x51))
	{
		isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
      	       				DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
					
		if(isagmq_db == NULL)
      	{
			fprintf(stdout, "%s   ", user_id);
           	fprintf(stdout, "Status Connect to Database Error");
            check_db = 0;
       	}
		else
		{
			//***********************************************************************************			
			strcpy(query, "SELECT CONTACT_ID ,STATUS FROM contact_list WHERE USER_ID = '");
			strncat(query, user_id, FIX_USER_ID);
			strcat(query,"'");
//			strcat(query," AND STATUS != 'D'");

			check_query = process_query(isagmq_db, query);
			if( check_query == 1)
			{
				mysql_query(isagmq_db, query);
     			res_set = mysql_store_result(isagmq_db);
				strcpy(contact_list,"");
				strcpy(temp,"");
				//sequence = random_sequence(65535, 1234);
				sequence = rand();

                while((row = mysql_fetch_row(res_set)) != NULL)
		        {
						strcpy(contact_id,row[0]);
					//	getemailaddr(contact_id,email);
						//getnickname(contact_id,nickname);
						get_nick_email(contact_id,nickname,email);	
						find_online(link,contact_id,status,ip);

						if(strcmp(row[1],"W") == 0) 
						{
							strcpy(status,"W");
							//strcpy(ip,"-");
						}
						else if(strcmp(row[1],"D")== 0)
						{
							strcpy(status,"D");
						}
						else if(strcmp(row[1],"X")== 0)
						{
							strcpy(status,"F");
							strcpy(ip,"-");
						}
						else if(strcmp(row[1],"U")== 0)
						{
							strcpy(status,"W");
							strcpy(ip,"-");
						}
						else
						{
							strcpy(status,row[1]);
						}
						len += strlen(contact_id)+ strlen(email)+ strlen(nickname) + strlen(status) + strlen(ip);
						len = len + 4;
						//len = checklength(contact_id,nickname,status,ip,temp,MAX_MESSAGE-7,len);
						//fprintf(stdout,"temp--->%s\n",temp);
						//temp_length = strlen(temp);
//						fprintf(stdout,"---> len : %d\n",len);	
						if(len < MAX_MESSAGE - 9 )
						{
							strcat(temp,contact_id);
							strcat(temp,"#");
							strcat(temp,email);
							strcat(temp,"#");
							strcat(temp,nickname);
							strcat(temp,"#");
							strcat(temp,status);
							strcat(temp,"#");
							strcat(temp,ip);
							strcat(temp,"$");
							temp_length = strlen(temp);
							len = temp_length;
						//	fprintf(stdout,"temp : %s\n",temp);	
						}
						else
						{
							
							//morepacket = true;
							//packet++;
							sequence++;
							convert_sequence(sequence, seq);
							convert_sequence(temp_length + 7, size);
							
							
							fprintf(stdout,"INSIDE SEND MESSAGE\n");
							for(i=0;i<MAX_MESSAGE;i++) buffer[i] ='\0';
	
      						buffer[0] = 0x05;
							buffer[1] = seq[0];
							buffer[2] = seq[1];
							buffer[3] = size[0];
							buffer[4] = size[1];
      						buffer[5] = 0x52;
      						buffer[6] = 0x01;				/*More of package*/

							for(i=0;i<MAX_MESSAGE;i++)
							{
								buffer[7+i] = temp[i];
								if(temp[i] == '\0') break;
								
							}
							
							ssl_write(ssl,buffer,sizeof(buffer));

							for(i=0;i<MAX_MESSAGE;i++)
							{
								temp[i] = '\0';
								buffer[i] = '\0';
							}

							strcpy(temp,contact_id);
							strcat(temp,"#");
							strcat(temp,email);
							strcat(temp,"#");
							strcat(temp,nickname);
							strcat(temp,"#");
							strcat(temp,status);
							strcat(temp,"#");
							strcat(temp,ip);
							strcat(temp,"$");
							temp_length = strlen(temp);
							len = temp_length;
						}	
				}
				
				strcat(temp,"$");
/*
				convert_sequence(sequence, seq);
				convert_sequence(temp_length + 7, size);
				fprintf(stdout,"sequence%#d\n",sequence);
				fprintf(stdout,"buffer[1]%#x\n",seq[0]);
				fprintf(stdout,"buffer[2]%#x\n",seq[1]);
				fprintf(stdout,"buffer[3]%#x\n",size[0]);
				fprintf(stdout,"buffer[4]%#x\n",size[1]);
*/

				for(i=0;i<MAX_MESSAGE;i++) buffer[i] ='\0';
/*	
				buffer[0] = 0x05;
				buffer[1] = seq[0];
				buffer[2] = seq[1];
				buffer[3] = size[0];
				buffer[4] = size[1];
				buffer[5] = 0x52;
				buffer[6] = 0x00;	
*/				
				buffer[0] = 0x05;
				buffer[1] = 0x00;
				buffer[2] = 0x01;
				buffer[3] = 0x00;
				buffer[4] = 0x07;
				buffer[5] = 0x52;
				buffer[6] = 0x00;	

//				fprintf(stdout,"ALL INFO \n%s\n",temp);
				for(i=0;i<MAX_MESSAGE;i++)
				{
					buffer[7+i] = temp[i];
					if(temp[i] == '\0')
					{
//						fprintf(stdout,"Number of Chars ->%d\n",i);       
						break;
					}	
				}
							
				ssl_write(ssl,buffer,sizeof(buffer));


			}
     		else if ( check_query == 0)
     		{
       			//Send NACK  No. this userID
         		fprintf(stdout, "%s   ", user_id);
				fprintf(stdout,"No. this userID = %s\n", user_id);
         		/*Disconnect MySQL*/
     		}
     		else 
			{
				fprintf(stdout, "%s   ", user_id);
				fprintf(stdout,"DB system error %s\n", user_id);
					/*Disconnect MySQL*/
			}
		//***********************************************************************************

		}

 		do_disconnect(isagmq_db); 

	}
	    		
}


void change_nick_name(SSL *ssl, unsigned char *buffer_read, char user_id[]){
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
	unsigned char nick_name[255];	
	unsigned char onick_name[255];

  	char mess[MAX_MESSAGE];
  	char query[MAX_MESSAGE];
  	unsigned int i;
  	int check_query;

	for(i =0 ;i<MAX_MESSAGE ; i++)
	{
		buffer[i]= '\0';
		temp[i] = '\0';
		query[i] = '\0';
		mess[i] = '\0';
	}
	for(i =0 ;i<255 ; i++)
	{
		nick_name[i]= '\0';
		onick_name[i] = '\0';
	}

	//***********************************************************************
	// Start Process of Change Nick Name
	//***********************************************************************											

	if((buffer_read[0] == 0x4) && (buffer_read[5] == 0x41))
    {

		if(get_data(buffer_read, nick_name, 7) == 0 )
		{
			//write error message
			fprintf(stdout,"Your Nickname is invalid\n");
			strcpy(mess,"Invalid nick name...$");
			write_error(ssl,mess);
		}
		else
		{
		//----------------------------Set Nick Name--------------------------------------------

			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
	        	    		DEF_PORT_NUM, DEF_SOCKET_NAME, 0);

    		if(isagmq_db == NULL)
       		{
				fprintf(stdout, "%s   ", user_id);
            	fprintf(stdout, "Change Connect to Database Error");
				strcpy(mess,"Can not connect to DB...$");
				write_error(ssl,mess);

       		}
			else
			{
				strcpy(query, "UPDATE user SET NICK_NAME = ");
				strncat(query, "'", 1);
				strcat(query, nick_name);
				strncat(query, "'", 1);
				strcat(query, " WHERE USER_ID = '");
				strncat(query, user_id, FIX_USER_ID);	
				strcat(query, "'");
				fprintf(stdout,"-->%s\n",query);
				check_query = process_query(isagmq_db, query);

				if( check_query == 1 || check_query == 0)
				{
					fprintf(stdout, "%s   ", user_id);
					fprintf(stdout, "Change Nick Name OK...\n");

					buffer[0] = 0x04;
					buffer[1] = 0x00;
					buffer[2] = 0x01;
					buffer[3] = 0x00;
					buffer[4] = 0x07;
					buffer[5] = 0x42;
					buffer[6] = 0xff;

					strcpy(temp, "Change Nick Name OK...$");
										
					for(i=0;i < 255;i++) 
					{
						buffer[i+7] =  temp[i];
					}

					ssl_write(ssl, buffer, sizeof(buffer));
				}
				else
				{
					//Can't change nick_name ,Error Query
					//fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"DB system error \n");
					strcpy(mess,"Can't change nick name...$");
					write_error(ssl,mess);
					/*Disconnect MySQL*/
				}
	 
			}

			do_disconnect(isagmq_db);
		//----------------------------Finished Setting Nickname----------------------------------
		}									
	}
	else
	{
		fprintf(stdout, "%s   ", user_id);
	  	fprintf(stdout, "Incorrect Packet\n");
		strcpy(mess,"Invalid packet...$");
		write_error(ssl,mess);

	}
		
}

void delete_admin(SSL *ssl, unsigned char *buffer_read, char user_id[]){
	int i;
        unsigned char buffer_user[MAX_MESSAGE];
        for( i=0;i<MAX_MESSAGE;i++) buffer_user[i] = '\0';
        strcpy(buffer_user,"Let's start delete admin");
        ssl_write(ssl,buffer_user,sizeof(buffer_user));
}
void delete_contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[]){
	unsigned char buffer[MAX_MESSAGE];
	unsigned char temp[MAX_MESSAGE];
	
  	unsigned char query[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	unsigned int i;
	unsigned char contact_id[10];
  	int check_query;	

	for(i=0;i <= 10;i++)
	{
		contact_id[i] = '\0';	
	}
	for(i=0;i < MAX_MESSAGE ;i++)
	{
		buffer[i] = '\0';	
		temp[i] = '\0';	
		query[i] = '\0';	
		mess[i] = '\0';
	}

	//***********************************************************************
	// Start Process of Delete Contactlist with User ID
	//***********************************************************************											
	
    if ((buffer_read[0] == 0x0b) && (buffer_read[5] == 0xb1))
    {
		//Starting

		if(!get_data(buffer_read, contact_id, 7) == 0)
		{
	      	//The return value from get_data is valid
			//Start connecting DB
			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
	                		DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
			fprintf(stdout, "Connecting Database\n\n");

       		if(isagmq_db == NULL)
       		{
				//Can't connect DB
				fprintf(stdout, "%s   ", user_id);
            	fprintf(stdout, "Delete Contactlist Connect to Database Error");
				strcpy(temp,"Can't connect Database...$");
				write_error(ssl,temp);
           		//goto end_delete_contactlist;
       		}
			else
			{
  				//Can connect DB
				for(i = 0;i < MAX_MESSAGE;i++) 
				{
	     			query[i] = '\0';
				}

				if(!check_db5("SELECT CONTACT_ID FROM contact_list WHERE USER_ID = '", user_id, "' AND CONTACT_ID = '", contact_id, "Delete contact"))
				{
					//The User ID to be deleted exists !
					//Not to be aware about the same of the User ID and your ID becuase
					//program retrict the same value eetween USER ID and CONTACT ID 
					strcpy(query, "DELETE FROM contact_list WHERE CONTACT_ID = ");
					strncat(query, contact_id, FIX_USER_ID);
					strcat(query," AND USER_ID = '");
					strncat(query, user_id, FIX_USER_ID);
					strcat(query,"'" );
					//fprintf(stdout, "Query: %s\n", query);
					check_query = process_query(isagmq_db, query);
					if(check_query < 0) 
					{
						//Error Query .
						fprintf(stdout, "Delete Contactlist Error\n");
						//do_disconnect(isagmq_db);
						strcpy(mess,"Not Found..$"); 
						write_error(ssl,mess); 
					}
					else
					{
						//Success Query .
						fprintf(stdout, "%s   ", user_id);
						fprintf(stdout, "Deleted Contactlist Complete...\n");
						
						for(i=0;i < MAX_MESSAGE;i++) 
						{
							temp[i] = '\0';
							buffer[i] = '\0';
						}

							buffer[0] = 0x0b;
							buffer[1] = 0x00;
							buffer[2] = 0x01;
							buffer[3] = 0x00;
							buffer[4] = 0x07;
							buffer[5] = 0xb2;
							buffer[6] = 0xff;

						strcpy(temp, "Delete contactlist OK...$");


						for(i=0;i < 255;i++) 
						{
							buffer[i+7] =  temp[i];
						}

						ssl_write(ssl, buffer, sizeof(buffer));
					}

					do_disconnect(isagmq_db); 
				}
				else 
				{
					//The User ID to be deleted doesn't exist !
					fprintf(stdout, "%s   ", user_id);
					fprintf(stdout,"DB system error %s\n", user_id);
					strcpy(mess,"Your requested User ID doesn't exist...$");
					write_error(ssl,mess);
					/*Disconnect MySQL*/

				}

				do_disconnect(isagmq_db); 				 
			 }
		}
		else
	    {
			//get_data Error.
			//write_err_message(ssl, 0xb3, "User_id that you would like to delete incorrect\n");
			fprintf(stdout,"User_id that you would like to delete is incorrect\n");
			strcpy(mess,"Invalid User ID..$");
			write_error(ssl,mess);
		}		
	}
	else
	{
		//buffer_read Error (Incorrect Packet)
		fprintf(stdout,"Invalid Packet! \n");
		strcpy(mess,"Invalid Packet..$");
		write_error(ssl,mess);

	}
	
}





void find_contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[],NODE *link){
	MYSQL_RES *res_set;
 	MYSQL_ROW row;	
	int i;
	int point = 0;
	int check_infor = 0;
	int check_query;
	int cuser = 0;
	int cemail = 0;
	int cfrist = 0;
	int clast = 0;
	int length = 0;
	int found = 1;
	int max = 0;

	unsigned char fuser_id[9];
	unsigned char femail[64];
	unsigned char ffirst_name[64];
	unsigned char flast_name[64];
	unsigned char ftype[1];

	unsigned char query[MAX_MESSAGE];	
	unsigned char temp[MAX_MESSAGE];
	unsigned char buffer[MAX_MESSAGE];
	unsigned char find_infor[MAX_MESSAGE];


	for( i=0;i<MAX_MESSAGE;i++)
	{
	 buffer[i] = '\0';
	 temp[i]='\0';
	 query[i] = '\0';
	 find_infor[i] = '\0';
	}

	//***********************************************************************
	// Start Process of Finding Contactlist
	//***********************************************************************											

	// Request_to_find buffer[5] = 0x81

	if ((buffer_read[0] == 0x8) && (buffer_read[5] == 0x81))
    {
          buffer[0] = 0x08;
          buffer[1] = 0x00;
          buffer[2] = 0x01;
          buffer[3] = 0x00;
          buffer[4] = 0x07;
          buffer[5] = 0x82;
          buffer[6] = 0xff;

		  ssl_write(ssl,buffer,sizeof(buffer));
		for(i=0 ; i< MAX_MESSAGE ; i++) buffer[i] = '\0';
		  ssl_read(ssl,buffer,sizeof(buffer));

    	  if ((buffer[0] == 0x08) && (buffer[5] == 0x83))
    	  //if  (buffer_read[5] == 0x83)
		  {
				fprintf(stdout,"\nIN LOOP CHECKING\n");			
				strcpy(query, "SELECT USER_ID,EMAIL FROM user WHERE  ");		
				point = FIX_HEADER + 1;
            	point = get_data(buffer, ftype, point);
				//Get Type
				if(!point) 
				{
					ftype[0] = 'A';
                	fprintf(stdout, "             Type find Invalid,put default = 'A' \n");
				}
				if(ftype[0] == 'a' || ftype[0] == 'A' || ftype[0] == 'o' || ftype[0] == 'O') 
							/*Type OK*/;
				else 
				{
					ftype[0] = 'A';
                	fprintf(stdout, "             Type find Invalid,put default = 'A' \n");
				}
	check_infor = 0;
				//Get User ID
				point = get_data(buffer, fuser_id, point);
            	if(!point) 
				{
                	fprintf(stdout, "User_id Invalid \n");
					cuser = 1;
				}
				else
				{
					/*Check User_id*/
					if(check_userid(fuser_id))
					{
//							if(ftype[0] == 'a' || ftype[0] == 'A')	strcat(query, " AND ");
//							else	strcat(query, " OR ");

						strcat(query, "USER_ID = '");
						strcat(query, fuser_id);
						strcat(query, "'");	
						cuser = 0;								

					check_infor = 1;
					}
					else cuser = 1;

//					check_infor = 1;
				}

				fprintf(stdout,"user_id %d\n",check_infor);
				//Get Email
            	point = get_data(buffer, femail, point);
            	if(!point) 
				{
					fprintf(stdout, "Email Invalid \n");
					cemail = 1;
                }
				else
				{
					/*Check email*/
					if( spc_email_isvalid(femail) )
					{
/*							if(ftype[0] == 'a' || ftype[0] == 'A')	strcat(query, " AND ");
							else	strcat(query, " OR ");

							strcat(query, "EMAIL = '");
							strcat(query, femail);
							strcat(query, "'");	

*/							cemail = 0;	
						
						
						if(cuser == 0)
						{
							if(ftype[0] == 'a' || ftype[0] == 'A')	strcat(query, " AND ");
							else	strcat(query, " OR ");

							strcat(query, "EMAIL = '");
							strcat(query, femail);
							strcat(query, "'");	
							cemail = 0;	
						}
						else 
						{
							strcat(query, "EMAIL = '");
							strcat(query, femail);
							strcat(query, "'");	
							cemail = 0;
						}
					check_infor = 1;
					
					}
					else	cemail = 1;
							
//					check_infor = 1;
				}							
				fprintf(stdout,"email %d\n",check_infor);

				//Get First Name

            	point = get_data(buffer, ffirst_name, point);
            	if(!point)
				{
                	fprintf(stdout, "Frist Name Invalid \n");
					cfrist = 1;
				}
				else 
				{
					/*Check first name*/
					if( check_name(ffirst_name) )
					{
				/*			if(ftype[0] == 'a' || ftype[0] == 'A')
									strcat(query, " AND ");
							else
									strcat(query, " OR ");
							strcat(query, "FIRST_NAME = '");
							strcat(query, ffirst_name);
							strcat(query, "'");	
							cfrist = 0;	
				*/		
						
						if(cuser == 0 || cemail == 0 ) 
						{
							if(ftype[0] == 'a' || ftype[0] == 'A')
									strcat(query, " AND ");
							else
									strcat(query, " OR ");
							strcat(query, "FIRST_NAME = '");
							strcat(query, ffirst_name);
							strcat(query, "'");	
							cfrist = 0;	
						}
						else 
						{
							strcat(query, "FIRST_NAME = '");
							strcat(query, ffirst_name);
							strcat(query, "'");	
							cfrist = 0;
						}
					
					check_infor = 1;
					}
					else	cfrist = 1;
							
					//check_infor = 1;
				}	
				fprintf(stdout,"First  %d\n",check_infor);

				//Get Last Name
            	point = get_data(buffer, flast_name, point);
            	if(!point) 
				{
                	fprintf(stdout, "Last Name Invalid \n");
					clast = 1;
				}
				else 
				{
					/*Check last name*/
					if( check_name(flast_name) )
					{
				/*			if(ftype[0] == 'a' || ftype[0] == 'A')
									strcat(query, " AND ");
							else
									strcat(query, " OR ");
							strcat(query, "LAST_NAME = '");
							strcat(query, flast_name);
							strcat(query, "'");	
							clast = 0;	
						
				*/		
					
						if(cuser == 0 || cemail == 0 || cfrist == 0) {
							if(ftype[0] == 'a' || ftype[0] == 'A')
									strcat(query, " AND ");
							else
									strcat(query, " OR ");
							strcat(query, "LAST_NAME = '");
							strcat(query, flast_name);
							strcat(query, "'");	
							clast = 0;	
						}
						else 
						{
							strcat(query, " LAST_NAME = '");
							strcat(query, flast_name);
							strcat(query, "'");	
							clast = 0;
						}
					check_infor = 1;
						
					}
					else	clast = 1;
						
					//check_infor = 1;
				}
				fprintf(stdout,"Last  %d\n",check_infor);


				fprintf(stdout,"FINISH CHAR PROCESS\n");
				if(check_infor == 0) 
				{
							
					for(i=0;i < MAX_MESSAGE;i++) buffer[i] = '\0';
					 		
					strcpy(find_infor, "Find Information Invalid");
							
						buffer[0] = 0x08;
      					buffer[1] = 0x00;
      					buffer[2] = 0x01;
      					buffer[3] = 0x00;
						buffer[4] = 0x07;
      					buffer[5] = 0x84;
      					buffer[6] = 0x00;				/*End of package*/
				
					i = 0;
					while(i < MAX_MESSAGE  )
					{
						if(find_infor[i] == '\0')
							break;
						buffer[FIX_HEADER + i + 1] = find_infor[i];
						i++;
					}					
							
					ssl_write(ssl, buffer, sizeof(buffer));							
							
					//goto end_find_contactlist;
				}
				else
				{
        			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
                	    		            			DEF_PORT_NUM, DEF_SOCKET_NAME, 0);

        			if(isagmq_db == NULL)
        			{
						fprintf(stdout, "%s   ", user_id);
            			fprintf(stdout, "Find Contactlist Connect to Database Error");
            			strcpy(temp,"Can't connect database ...$");
        			}
					else
					{
						for(i=0;i < MAX_MESSAGE;i++) 
						{
       						temp[i] = '\0';
       						buffer[i] = '\0';
							find_infor[i] = '\0';
						}
						max = strlen(find_infor);
					fprintf(stdout,"-->%s\n",query);
     					check_query = process_query(isagmq_db, query);
     					mysql_query(isagmq_db, query);
      					res_set = mysql_store_result(isagmq_db);
						while( (row = mysql_fetch_row(res_set)) != NULL )
       					{
       						if( row != NULL) 
							{
																
								found = 0;
								//fprintf(stdout, "Find user_id OK %s \n", row[0]);
								strcpy(temp, row[0]);
								strncat(temp, "#", 1);
								strcat(temp, row[1]);	
								strncat(temp, "#", 1);


								//if(find(link,fuser_id))
								if(find(link,row[0]))
										strncat(temp, "O", 1);
								else
										strncat(temp, "F", 1);
/*
								if(find(fuser_id, temp_ip))
										strncat(temp, "O", 1);
								else
										strncat(temp, "F", 1);
							
*/
								length = strlen(temp);
								fprintf(stdout,"\nLength : %d\n",length);
								//temp_length = length;
								//if(length < MAX_MESSAGE - 8)
								if(length + max < 150)
								{
									strcat(find_infor, temp);		
									max = strlen(find_infor);
								}
								else
								{
									fprintf(stdout, "             More Package\n");
									//num_package += 1;
									//sequence += 1;									
									
									//convert_sequence(sequence, seq);
									//convert_sequence(temp_length + 7, len);
									
									/*More package*/
									/*send result*/										/*Set header*/
      								buffer[0] = 0x08;
      								//buffer[1] = seq[0];
      								buffer[1] = 0x00;
      								buffer[2] = 0x01;
      								//buffer[2] = seq[1];
      								buffer[3] = 0x00;
      								buffer[4] = 0x07;
      								//buffer[3] = len[0];
									//buffer[4] = len[1];
      								buffer[5] = 0x84;
      								buffer[6] = 0x01;				/*More of package*/
									
									strncat(find_infor, "$", 1);	
								
									i = 0;
									while(i < MAX_MESSAGE  )
									{
										if(find_infor[i] == '\0')	break;
										buffer[FIX_HEADER + i + 1] = find_infor[i];
										i++;
									}			
									ssl_write(ssl, buffer, sizeof(buffer));
									
									
									for(i = 0;i < MAX_MESSAGE;i++) 
									{
										buffer[i] = '\0';
         								find_infor[i] = '\0';
									}
									
							    	strcpy(find_infor, temp);	
									max = strlen(find_infor);
									
									length = 0;

									for(i = 0 ;i < MAX_MESSAGE ; i++) temp[i] = '\0';
								}									
							 }									
							 strncat(find_infor, "$", 1);								
						}

						if(row == NULL && found == 1)
							strcpy(find_infor, "Find not found");	
							
						strncat(find_infor, "$", 1);

						/*Free result*/	
						mysql_free_result(res_set);						
							
						/*Disconnect MySQL*/
     					do_disconnect(isagmq_db); 	
					
						for(i = 0;i < MAX_MESSAGE;i++)
						{	
								buffer[i] = '\0';
						}	
						buffer[0] = 0x08;
						buffer[1] = 0x00;
						buffer[2] = 0x01;
						buffer[3] = 0x00;
						buffer[4] = 0x07;
						//buffer[1] = seq[0];
						//buffer[2] = seq[1];
						//buffer[3] = len[0];
						//buffer[4] = len[1];
						buffer[5] = 0x84;
						buffer[6] = 0x00;				/*End of package*/
				
						i = 0;
						//fprintf(stdout, "find_infor %s \n", find_infor);
						while(i < MAX_MESSAGE  )
						{
							if(find_infor[i] == '\0')
								break;
							buffer[FIX_HEADER + i + 1] = find_infor[i];
							i++;
						}					
						ssl_write(ssl, buffer, sizeof(buffer));
						
					}

				}
			}
			else
			{
				fprintf(stdout, "%s   ", user_id);
				fprintf(stdout, "Second Read Buffer Error\n");
				strcpy(temp,"Second Read Buffer Error ...$");
				write_error(ssl,temp);
			}

	}
	else
	{
		fprintf(stdout, "%s   ", user_id);
		fprintf(stdout, "First Read Buffer Error\n");
		strcpy(temp,"First Read Buffer Error ...$");
		write_error(ssl,temp);
		
	}


}

int add_contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[])
{
	int i;
	int dbcheck;
	int point;
	unsigned char email_contact[MAX_MESSAGE];
	unsigned char id[MAX_MESSAGE];
	unsigned char buffer[MAX_MESSAGE];
	MYSQL_RES *res_set;
 	MYSQL_ROW row;	
	char query[MAX_MESSAGE];
	char mess[MAX_MESSAGE];
	char user_id_contact[FIX_USER_ID];
	int check_query;


	//***********************************************************************
	// Start Process of Adding Contactlist with Email
	//***********************************************************************											

	// Request_add_email buffer[5] = 0x32
		
	if ((buffer_read[0] == 0x3) && (buffer_read[5] == 0x32))
	{

		for(i=0;i<MAX_MESSAGE;i++)
		{
			buffer_read[i] = '\0';
			email_contact[i] = '\0';
			buffer[i]='\0';
			query[i]='\0';
			id[i] ='\0';
			mess[i] = '\0';
		}	

	// Send response to Client

		buffer[0] = 0x03;  // Command Add Email
		buffer[1] = 0x00;
		buffer[2] = 0x01;
		buffer[3] = 0x00;
		buffer[4] = 0x07;
		buffer[5] = 0x34;  // Response_add_email
		buffer[6] = 0xff;

		ssl_write(ssl,buffer,sizeof(buffer));

		for(i=0;i<MAX_MESSAGE;i++)
		{
			buffer[i] = '\0';
		}	
	
	// Wait and read incomming message from Client
		ssl_read(ssl,buffer,sizeof(buffer));

	// Send_email buffer[5] = 0x36
		
		if ((buffer[0] == 0x3) && (buffer[5] == 0x36))
		{
			for(i=0 ; i<MAX_MESSAGE; i++)
			{
				email_contact[i] = buffer[i+7];
				if(buffer[i+7] == '\0') break;
			}
	
			// Extract Email Address From buffer
			//******************************************************
			// We assume that email is validated from client side
			//******************************************************
			point = get_data(buffer,email_contact,7);
			fprintf(stdout,"\nThis email :%s\n",email_contact);


		//*******************************************************************
		// Checking email Process
		//*******************************************************************

			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
									 DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
			if(isagmq_db == NULL)
			{
				fprintf(stdout, "Error connecting to Database\n");
				strcpy(mess,"Can not connect to DB..$");
				write_error(ssl,mess);
			
			}
			else
			{
				fprintf(stdout, "Connecting to Database OK\n");
				strcpy(query, "SELECT USER_ID FROM user WHERE EMAIL = '");
				strncat(query, email_contact, strlen(email_contact));
				strncat(query, "'", 1);

				mysql_query(isagmq_db,query);
				if(!(res_set = mysql_store_result(isagmq_db)))
						fprintf(stdout,"Error query");
				else fprintf(stdout,"Quering Database\n");

				row = mysql_fetch_row(res_set);
				
				if(row == NULL)
				{
					fprintf(stdout,"Email Address Doesn't Exist\n");
					strcpy(mess,"Email Address Doesn't Exist..$");
					write_error(ssl,mess);
					//write error message
				}
				else
				{
					//Row return must be 1 : one user_id per one email address

					for(i = 0;i < 10;i++)  user_id_contact[i] = '\0';
					strncpy(user_id_contact, row[0], FIX_USER_ID);
					mysql_free_result(res_set);
					//do_disconnect(isagmq_db);


					// Have to check the return user_id_contact isn' the same value as yours
					if(strcmp(user_id_contact,user_id) != 0)
					{
						dbcheck = check_db5("SELECT CONTACT_ID FROM contact_list WHERE USER_ID = ", 
									  user_id,
									  " AND CONTACT_ID = '", 
									  user_id_contact,
									  "Add_contactlist");
						
						if(dbcheck == 1)
						{
							//The email corresponding to its contact_id can be added to this user_id
							for(i=0;i < MAX_MESSAGE;i++)	query[i] = '\0';

							strcpy(query, "INSERT INTO contact_list VALUES('");
							strcat(query, user_id);
							strcat(query, "', '");
							strcat(query, user_id_contact);
							strcat(query, "', '");
							strcat(query, "W");
							strcat(query, "')"); 

							check_query = process_query(isagmq_db, query);
							if( (check_query != 0) || (check_query == -1) )
							{
								fprintf(stdout, "Insertion Failed\n");
								strcpy(mess,"Insertion Failed..$");
								write_error(ssl,mess);

								//write error message
							}
							else 
							{
								fprintf(stdout, "%s   ", user_id);
								fprintf(stdout, "Insertion Completed\n");
								for(i=0;i<MAX_MESSAGE;i++)
								{
									buffer[i] = '\0';
								}	

									buffer[0] = 0x03;
									buffer[1] = 0x00;
									buffer[2] = 0x01;
									buffer[3] = 0x00;
									buffer[4] = 0x07;
									buffer[5] = 0x38;
									buffer[6] = 0xff;

									ssl_write(ssl,buffer,sizeof(buffer));
							}
					
							/*Disconnect MySQL*/
							do_disconnect(isagmq_db); 
						}
						else if (dbcheck == 0)
						{
							//The email corresponding to its contact_id has already added up
							fprintf(stdout,"This email has already added\n");
							strcpy(mess,"This Email Address had already added..$");
							write_error(ssl,mess);

							//write error message
						}
						else
						{
							//Internal Error
							fprintf(stdout,"DB Error\n");
							strcpy(mess,"DB Error..$");
							write_error(ssl,mess);

							//write error message
						}
					}
					else
					{
						fprintf(stdout,"You are adding your email\n");
						strcpy(mess,"Can not add your own email..$");
						write_error(ssl,mess);

						//write error message
					}

				}	
				
			}
		//*******************************************************************
		// Finished Checking email Process
		//*******************************************************************											
		}
		else
		{
			fprintf(stdout,"Invalid Packet \n");
			strcpy(mess,"Invalid Packet..$");
			write_error(ssl,mess);
		}
		return 1;	
	}
	//***********************************************************************
	// Finished Process of Adding Contactlist with Email
	//***********************************************************************											

//--------------------------------------------------------------------------------

	//***********************************************************************
	// Start Process of Adding Contactlist with User ID
	//***********************************************************************											

	//Client Request to Add Contactlist with User ID == 0x31
	if ((buffer_read[0] == 0x3) && (buffer_read[5] == 0x31))
	{
		buffer[0] = 0x03;
        buffer[1] = 0x00;
	    buffer[2] = 0x01;
	    buffer[3] = 0x00;
	    buffer[4] = 0x07;
	    buffer[5] = 0x33;
        buffer[6] = 0xff;

		ssl_write(ssl,buffer,sizeof(buffer));

		for(i=0 ; i<MAX_MESSAGE; i++)
		{
			buffer[i] = '\0';
			id[i] = '\0';
		}
		
		ssl_read(ssl,buffer,sizeof(buffer));

		//Client Sends User ID to Be Added == 0x35

		if ((buffer[0] == 0x3) &&(buffer[5] == 0x35))
		{
			for(i=0 ; i<MAX_MESSAGE; i++)
			{
				id[i] = buffer[i+7];
				if(buffer[i+7] == '\0') break;
			}

			// Extract User ID From buffer
			//******************************************************
			// We assume that user id is validated from client side
			//******************************************************
			point = get_data(buffer,id,7);
			fprintf(stdout,"\nThis User ID :%s\n",id);

			//fprintf(stdout,mess);
			//fprintf(stdout,"\n");

		//*******************************************************************
		// Checking User ID Process
		//*******************************************************************

			isagmq_db = do_connect (DEF_HOST_NAME, DEF_USER_NAME, DEF_PASSWORD, DEF_DB_NAME,
									 DEF_PORT_NUM, DEF_SOCKET_NAME, 0);
			if(isagmq_db == NULL)
			{
				fprintf(stdout, "Error connecting to Database\n");
				strcpy(mess,"Can not connect to DB..$");
				write_error(ssl,mess);

			}
			else
			{
				fprintf(stdout, "Connecting to Database OK\n");
				strcpy(query, "SELECT USER_ID FROM user WHERE USER_ID = '");
				strncat(query, id , strlen(id));
				strncat(query, "'", 1);

				mysql_query(isagmq_db,query);
				if(!(res_set = mysql_store_result(isagmq_db)))
						fprintf(stdout,"Error query");
				else fprintf(stdout,"Quering Database\n");

				row = mysql_fetch_row(res_set);
				
				if(row == NULL)
				{
					fprintf(stdout,"User ID Doesn't Exist\n");
					strcpy(mess,"User ID Doesn't Exist..$");
					write_error(ssl,mess);

				}
				else
				{
					//Row return must be 1 : There is only unique User ID

					for(i = 0;i < 10;i++)  user_id_contact[i] = '\0';
					strncpy(user_id_contact, row[0], FIX_USER_ID);
					mysql_free_result(res_set);
					//do_disconnect(isagmq_db);


					// Have to check the return user_id_contact isn' the same value as yours
					if(strcmp(user_id_contact,user_id) != 0)
					{
						dbcheck = check_db5("SELECT CONTACT_ID FROM contact_list WHERE USER_ID = ", 
									  user_id,
									  " AND CONTACT_ID = '", 
									  user_id_contact,
									  "Add_contactlist");
						
						if(dbcheck == 1)
						{
							//The email corresponding to its contact_id can be added to this user_id
							for(i=0;i < MAX_MESSAGE;i++)	query[i] = '\0';

							strcpy(query, "INSERT INTO contact_list VALUES('");
							strcat(query, user_id);
							strcat(query, "', '");
							strcat(query, user_id_contact);
							strcat(query, "','W')"); 

							check_query = process_query(isagmq_db, query);
							if( (check_query != 0) || (check_query == -1) )
							{
								fprintf(stdout, "Insertion Failed\n");
								//write error message
							}
							else 
							{
								fprintf(stdout, "%s   ", user_id);
								fprintf(stdout, "Insertion Completed\n");
								for(i=0 ; i<MAX_MESSAGE; i++)
								{
									buffer[i] = '\0';
								}
			
									buffer[0] = 0x03;
									buffer[1] = 0x00;
									buffer[2] = 0x01;
									buffer[3] = 0x00;
									buffer[4] = 0x07;
									buffer[5] = 0x37;
									buffer[6] = 0xff;

									ssl_write(ssl,buffer,sizeof(buffer));

							}
					
							/*Disconnect MySQL*/
							do_disconnect(isagmq_db); 
						}
						else if (dbcheck == 0)
						{
							//The prefered User ID  has already added in contact id
							fprintf(stdout,"This User ID has already added\n");
							strcpy(mess,"This User ID had already added..$");
							write_error(ssl,mess);
							//write error message
						}
						else
						{
							//Internal Error
							fprintf(stdout,"DB Error\n");
							strcpy(mess,"DB Error..$");
							write_error(ssl,mess);
						}
					}
					else
					{
						fprintf(stdout,"You are adding your User ID\n");
						strcpy(mess,"Can not add your own User ID..$");
						write_error(ssl,mess);

					}

				}	
				
			}
		//*******************************************************************
		// Finished Checking User ID Process
		//*******************************************************************											

		}
		else
		{
			fprintf(stdout,"Invalid Packet \n");
			strcpy(mess,"Invalid Packet..$");
			write_error(ssl,mess);
		}

	}
	else 
	{
		fprintf(stdout,"Invalid Packet \n");
		strcpy(mess,"Invalid Packet..$");
		write_error(ssl,mess);
		return 1;
	}

	//***********************************************************************
	// Start Process of Adding Contactlist with User ID
	//***********************************************************************											

} 
#endif
