#ifndef MANAGE
#define MANAGE
#include "node.h"
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
//#include "report.h"
#define DEFAULT_LOG_DIR "/var/log"
//#define DEFAULT_LOG_FILE "DoS.log"
#define CONFIG_FILE "/etc/IsagNids.conf"
#define OK 1
#define NOT_OK 0

typedef struct _config
{
        char *pcap_filter;
	int report_screen;
	int report_html;
        char  *www_directory;
	int report_syslog;
	int report_logfile;
	char *log_dir;
	char *log_file;
	char *signature_file;
	int scan_ttl;
	int scan_max_count;
	int flood_ttl;
	int flood_max_count;
	int quiet;
	int promisc;
	int rflag;
	int flood;
	int IPde;
	int sign;
	int scan;
	int land;
	int limit;
	int verbose;
	int background;
	char *device;
} config;


class manage
{
		private:
			config con;
		public:
		manage(){ 
					con.verbose=0;con.quiet=0;con.promisc=1;con.device=NULL;con.rflag=0;con.limit=-1;
					con.flood =0;con.scan =0;con.IPde=0;con.land=0;con.sign=0;
					check_config();
			            };
			
		  void check_config();
		  void usage(char *argv0);
		  char *copy_argv(register char **argv);
		  void  check_command(int argc,char **argv);
		 config *get_config() { return &con;}
	//	  char* return_device(){return device;};
	//	  char* return_filename(){return filename;}
	//	  char* return_filter(){return filter;}
	//	  int return_promisc(){return promisc;}
	//	  int return_oflag() {return oflag;}
	//	  int return_limit(){return limit;}
	//	  int return_fflag(){return fflag;}
	//	  int return_quiet(){return quiet;}
	//	  int return_uflag(){return uflag;}
	//	  int return_verbose(){return verbose;}
	//	  int return_rflag(){return rflag;}

		  
		  
};
#endif
