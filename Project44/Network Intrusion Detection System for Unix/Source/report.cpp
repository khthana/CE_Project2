#include "report.h"
report:: report(config *conf)
{
	pthread_mutex_init(&lockx,NULL);
	sem_init(&sem_report,1,0);
	sem_init(&sem_lockx,1,0);
	con =conf;
	flag_report =4; 
	count =0;
	first_report_queue =NULL;
	current_report_queue =NULL;
	sprintf(full_log_file,"%s",con->log_dir);
	report_screen=con->report_screen;
	report_syslog=con->report_syslog;
	report_logfile=con->report_logfile;
	report_html=con->report_html; 
//	fprintf(stderr," %d %d %d %d \n ",report_screen,report_syslog,report_logfile,report_html);
//	fprintf(stderr,"full_log_file is %s\n",full_log_file);
	gen_html= new htmlreport(con);
	sem_post(&sem_lockx);	/*semaphore unlocklock CS*/
	if (!con->quiet) fprintf(stderr,"init report complete...\n");	
}

void report::copy_report(report_node *dest,report_node *sou)
{
			 dest->srcip.s_addr =sou->srcip.s_addr;
			 dest->dstip.s_addr =sou->dstip.s_addr;	
			 dest->dstip2.s_addr=sou->dstip2.s_addr;
			 dest->pps=sou->pps;
		         dest->kbps=sou->kbps;
			 dest->srcport =sou->srcport;
			 dest->dstport =sou->dstport;		
			 dest->dstport2 =sou->dstport2;	
			strcpy(dest->name,sou->name);
			strcpy(dest->description,sou-> description);
			strcpy(dest->type,sou->type);
			strcpy(dest->detail,sou->detail);
			dest->Shour=sou->Shour;
			dest->Smin=sou->Smin;
			dest->Ssec=sou->Ssec;		    
			dest->Ehour=sou->Ehour;		    		
			dest->Emin=sou->Emin;	
			dest->Esec=sou->Esec;	
			dest->id=sou->id;			
			dest->ip_p=sou->ip_p;			 		    
			dest->eth_type=sou-> eth_type;				    
			dest->count=sou->count;					    
			dest->report_type=sou->report_type;		
}
 int report::add_report(report_node *new_report)
{
	sem_wait(&sem_lockx); /*semaphore lock CS*/	
//	fprintf(stderr,"coming to semaphore\n");
	report_node *temp = new report_node;
	if (temp==NULL) return -1;
	copy_report(temp,new_report); /*copy detail in source report to destination report*/
//	fprintf(stderr,"passing to semaphore\n");
	temp->next = NULL;
	temp->last =NULL;
	if (current_report_queue != NULL)
		{
			current_report_queue->next = temp;
		        current_report_queue->last =current_report_queue;
		}
	current_report_queue = temp;
	if (first_report_queue ==NULL) {first_report_queue =current_report_queue; }
	count= count +1;
	sem_post(&sem_lockx);	/*semaphore unlocklock CS*/
	sem_post(&sem_report);	
	return 0;
}

int  report::gen_report_in_queue()
{
	sem_wait(&sem_report);
	pthread_mutex_lock(&lockx);
	report_node *temp2= NULL;
	if (first_report_queue == NULL ){ perror("you should never see this message\n");return -1;}
	time_t current_time;
	time(&current_time);
	char *date=ctime(&current_time);
	struct tm *curr_time=localtime(&current_time);
	size_date=strlen(date);
	strncpy(date_2,date,size_date-1);
	date_2[size_date-1]='\0';  /* date_2 is used to show date in string style */

	
	sem_wait(&sem_lockx); /*semaphore lock CS*/	
	if (report_screen ==1) {  if (!con->quiet) gen_report_to_screen();}
	if (report_syslog ==1) {gen_report_to_syslog();
//	fprintf(stderr,"gen_report_to_syslog is completed...\n");
	}
	if (report_logfile ==1){ gen_report_to_file();
//	fprintf(stderr,"gen_report_to_file is completed...\n");
	}
	if (report_html ==1) gen_report_to_html(first_report_queue);
//	fprintf(stderr,"gen_report_to_html is completed...\n");
//	if (flag_report>4) gen_report_to_email(); /* optionnal */
	
	temp2  = first_report_queue->next;
	if (temp2 != NULL ) {
							temp2->last =NULL;
	}
	else { current_report_queue = NULL; }
	delete first_report_queue;
	first_report_queue =temp2;

	sem_post(&sem_lockx);	/*semaphore unlocklock CS*/		
	pthread_mutex_unlock(&lockx);
	return 0;
}
void report::gen_report_to_html(report_node *new_report)
{
	gen_html->create_detailled_report(new_report);
}
void report::gen_report_on_screen(char *aaa)
{
}
	
void report::gen_report_to_screen()
{
	char ipstr2[INET_ADDRSTRLEN];   
	char ipstr3[INET_ADDRSTRLEN];   
	switch (first_report_queue->report_type) 
	{
	case 5:
	case 6:
	case 1 :

	 			fprintf(stderr,"%s : %s \n",date_2,first_report_queue->type);
				fprintf(stderr,"%s : %d:%d:%d - %d:%d:%d = %d\n"
        						 ,inet_ntoa(first_report_queue->dstip)
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
				fprintf(stderr,"\n");
	 			break;
	 case 2 :
				
	 			fprintf(stderr,"%s : %s \n",date_2,first_report_queue->type);
				fprintf(stderr,"%s : [%d] %d:%d:%d - %d:%d:%d = %d\n"
        						 ,inet_ntoa(first_report_queue->dstip),first_report_queue->id
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
				fprintf(stderr,"\n");
	 			break;
	case 3 :
				strcpy(ipstr2,inet_ntoa(first_report_queue->dstip));
	 			fprintf(stderr,"%s : %s \n",date_2,first_report_queue->type);
				fprintf(stderr,"%s > %s : %d - %d : %d:%d:%d - %d:%d:%d = %d\n"
        						 ,inet_ntoa(first_report_queue->srcip) ,ipstr2,first_report_queue->dstport,first_report_queue->dstport2
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
				fprintf(stderr,"\n");
	 			break;
	case 4 :
				strcpy(ipstr2,inet_ntoa(first_report_queue->dstip));
				strcpy(ipstr3,inet_ntoa(first_report_queue->dstip2));	
	 			fprintf(stderr,"%s : %s \n",date_2,first_report_queue->type);
				fprintf(stderr,"%s : %s - %s : %d:%d:%d - %d:%d:%d = %d\n"
        						 ,inet_ntoa(first_report_queue->srcip) ,ipstr2,ipstr3
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
				fprintf(stderr,"\n");
	 			break;
 	default :
	 		break;
	 }
}

void report::gen_report_to_syslog()
{
	char str_t[256];
	char ipstr2[INET_ADDRSTRLEN];   
	char ipstr3[INET_ADDRSTRLEN];   					
	switch (first_report_queue->report_type) 
		{
		     case 5:
		     case 6:
		     case 1:
		 		sprintf(str_t,"%s %s : %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,first_report_queue->type,inet_ntoa(first_report_queue->dstip)
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 			break;
		 case 2 :
		 		sprintf(str_t,"%s %s : [%d] %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,first_report_queue->type,inet_ntoa(first_report_queue->dstip),first_report_queue->id
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 			break;
		 case 3 :
		 		strcpy(ipstr2,inet_ntoa(first_report_queue->dstip));
		 		sprintf(str_t,"%s %s > %s : %d - %d : %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,first_report_queue->type,inet_ntoa(first_report_queue->srcip),ipstr2,first_report_queue->dstport
        			 			,first_report_queue->dstport2,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 			break;
		 case 4 :
		 		strcpy(ipstr2,inet_ntoa(first_report_queue->dstip));
		 		strcpy(ipstr3,inet_ntoa(first_report_queue->dstip2));
		 		sprintf(str_t,"%s %s : %s - %s : %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,first_report_queue->type,inet_ntoa(first_report_queue->srcip),ipstr2,ipstr3
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 			break;
 		default :
	 		break;
	 	}
	gen_syslog.slog_init();
	gen_syslog.slog_dump(str_t);
	gen_syslog.slog_close();
}
void report::gen_report_to_file()
{
	char std_t[256];
	char ipstr2[INET_ADDRSTRLEN];   
	char ipstr3[INET_ADDRSTRLEN];   
//	sprintf(full_log_file,"%s",log_file);
//	fprintf(stderr,"full_log_file is %s\n",full_log_file);
	if ((logfd = open(full_log_file,O_CREAT|O_WRONLY|O_APPEND,644)) < 0)
	{
		perror("Can't create log file!!!\n");
		exit(1);
	}
	switch (first_report_queue->report_type) 
	{
	case 5:
	case 6:
	case 1:
				sprintf(std_t,"%s : %s \n",date_2,first_report_queue->type);
	 			write(logfd,std_t,strlen(std_t));
				sprintf(std_t,"%s : %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,inet_ntoa(first_report_queue->dstip)
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 	 		write(logfd,std_t,strlen(std_t));
	 			break;
	 case 2 :
				sprintf(std_t,"%s : %s \n",date_2,first_report_queue->type);
	 			write(logfd,std_t,strlen(std_t));
				sprintf(std_t,"%s : [%d] %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,inet_ntoa(first_report_queue->dstip),first_report_queue->id
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 	 		write(logfd,std_t,strlen(std_t));
	 			break;
	 case 3 :
	 			strcpy(ipstr2,inet_ntoa(first_report_queue->dstip));
				sprintf(std_t,"%s : %s \n",date_2,first_report_queue->type);
	 			write(logfd,std_t,strlen(std_t));
				sprintf(std_t,"%s -> %s : %d -> %d : %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,inet_ntoa(first_report_queue->srcip) ,ipstr2,first_report_queue->dstport,first_report_queue->dstport2
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 	 		write(logfd,std_t,strlen(std_t));
				break;
	  case 4 :
	 			strcpy(ipstr2,inet_ntoa(first_report_queue->dstip));
	  	 		strcpy(ipstr3,inet_ntoa(first_report_queue->dstip2));
				sprintf(std_t,"%s : %s \n",date_2,first_report_queue->type);
	 			write(logfd,std_t,strlen(std_t));
				sprintf(std_t,"%s : %s - %s : %d:%d:%d - %d:%d:%d = %d\n\n"
        						 ,inet_ntoa(first_report_queue->srcip) ,ipstr2,ipstr3
        			 			,first_report_queue->Shour,first_report_queue->Smin,first_report_queue->Ssec
        						 ,first_report_queue->Ehour,first_report_queue->Emin,first_report_queue->Esec
         			 			,first_report_queue->count);
	 	 		write(logfd,std_t,strlen(std_t));
				break;
 	default :
	 		break;
	 }
	close(logfd);
}
