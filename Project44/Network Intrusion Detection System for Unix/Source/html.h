#ifndef HTML_HEADER
#define HTML_HEADER
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include <limits.h>
#include <time.h>
#include <errno.h>
#include <arpa/inet.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>
#include <fcntl.h>
#include <dirent.h>
#include <netinet/if_ether.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include "manage.h"
//#define DEFAULT_HTML_DIR "/var/www/html/nids"
struct report_node {
			    u_int8_t  eth_dhost[ETH_ALEN],eth_shost[ETH_ALEN];	// keep MAC Address
			    struct in_addr srcip;      // src and dst ip address
			    struct in_addr dstip;
			    struct in_addr dstip2;
			    u_int srcport;  // src and dst port
			    u_int dstport;
			    u_int dstport2; 
			    char name[50];
			   char description[150];
			   char type[50];
			    char detail[200];
			    int Shour;
			    int Smin;
			    int Ssec;
			    int Ehour;
			    int Emin;
			    int Esec;
			    u_int8_t ip_p;	     
			    u_int16_t eth_type;	
			    int count;
			    report_node *next;
			    report_node *last;
			    int report_type;
			    int id;
			    u_long pps;
	                    float kbps;
} ;

class htmlreport {
	private:
		char htmldir[PATH_MAX] ; //= "/var/www/html/nids";
		char htmldoc[PATH_MAX];
		char htmldocdir[PATH_MAX];
	    char latest[PATH_MAX];
		FILE *fd;// = NULL;
		long pages;// = 0;
		int offset ;//= 0;
	        struct timeval tv;
		config *con;
		char bufff[PATH_MAX];
	public:
		htmlreport(config *conf){ pages =0; offset =0; con = conf;
			                                        snprintf(htmldir,sizeof(htmldir),"%s",con->www_directory);
                                                         	fd = setup_htmldoc();
	                                                        if (!con->quiet) fprintf(stderr,"Init html is completed..\n");
							      }
		int start_document(FILE *fd) ;
		int start_table(FILE *fd, const char *name, int col);
		int end_table(FILE *fd, int col);
		void create_link_if_needed(FILE *fd);
		int end_document(FILE *fd);
		void output_plugin_infos(FILE *fd,report_node *newreport);
		void output_report_infos(FILE *fd, report_node *newreport);
		void output_host_infos(FILE *fd,report_node *newreport); 
		void create_detailled_report(report_node *newreport); /* this function is called by report */
		void create_host_index(FILE *fd);
		int create_dir(const char *dirname);
		FILE *setup_htmldoc(void);
		int check_pages();
		int check_newpage();
		void write_host_infos(int fd,report_node *newreport);
		void update_host_index(const char *link,report_node *newreport);
	
};

#endif HTML_HEADER