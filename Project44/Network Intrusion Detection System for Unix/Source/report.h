#ifndef REPORT
#define REPORT
#include "node.h"
#include "manage.h"
#include "slog.h"
#include "html.h"
#include <semaphore.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>
//#define DEFAULT_LOG_DIR "/var/log"
//#define DEFAULT_LOG_FILE "isagnids.log"


class report
{
	private:
		report_node *current_report_queue;
		report_node *first_report_queue;
		sem_t sem_report;		
		sem_t sem_lockx;
		pthread_mutex_t lockx; 
		time_t current_time;
	        int size_date;
	        char date_2[50];
		int count;
		int flag_report;
	        char dat[50];
		char full_log_file[200];
		int fd,logfd;
	        char log_file[50];
		int on_file;
		int qu;
		slog gen_syslog;
		htmlreport *gen_html;
		config *con;
		int report_screen;
		int report_syslog;
		int report_logfile;
		int report_html; 
	public:
	//   report(char *filename,int quiet){qu=quiet; strcpy(file1,filename); sem_init(&sem_report_on_screen,1,0); sem_init(&sem_report_on_file,1,0);on_file =1;}
	//   report(int quiet){qu=quiet; pthread_mutex_init(&lockx,NULL);flag_report =1; sem_init(&sem_report,1,0);  sem_init(&sem_report_on_screen,1,0); sem_init(&sem_report_on_file,1,0);on_file =0;count =0;}
	        report(config *conf);
		~report() {	sem_destroy(&sem_report); sem_destroy(&sem_lockx); pthread_mutex_destroy(&lockx);};
	        void gen_report_to_screen();
	        void gen_report_on_screen(char *aaa);
	  	void gen_report_to_file();
		void gen_report_to_syslog();	
		void gen_report_to_html(report_node *new_report);
		void gen_report_to_email(){}; 	/* optional: maybe want someone develop it... */
		int add_report(report_node *new_report);
		int check_report_in_queue(){ return count;};
		int gen_report_in_queue();
		void copy_report(report_node *dest,report_node *sou);
		
		
};
	//static report *report_thread=NULL;
//static report_node *current_report_queue;
//static report_node *first_report_queue;
#endif



