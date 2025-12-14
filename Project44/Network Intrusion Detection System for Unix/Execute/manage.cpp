#include "manage.h"

void manage::check_config()
{
        FILE *fd;
        char line[1024];
	char *temp;
	char *tmp;
       con.pcap_filter=strdup("");
	con.report_screen=0;
	con.report_html=0;
        con.www_directory=strdup("/var/www/html/nids");
	con.report_syslog=0;
	con.report_logfile=0;
	con.log_dir=strdup("/var/log");
	con.log_file=strdup("isagnids.log");
	con.signature_file=strdup("/usr/local/bin/signature.txt");
	con.scan_ttl=6;
	con.scan_max_count=30;
	con.flood_ttl=6;
	con.flood_max_count=5000;
//	fprintf(stderr,"Comming to check config file \n");
        fd = fopen(CONFIG_FILE, "r");
       if (! fd && errno == ENOENT ) 
               fprintf(stderr,"read conf file error \n");
        
        while ( fgets(line, sizeof(line), fd) ) {
         //       fprintf(stderr,"%s",line);
               if ( (line[0] !='#')  && (line[0] !='\n') && ( line[0] !='[') )
	       {
		       
		       temp= index(line,' ');
		       *temp='\0';
  
		       if ( strcmp(line,"pcap_filter") == 0 ) 
			       {  
				       temp+=4;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,'"');
				       *tmp='\0';
				  //     fprintf(stderr,"%s\n" ,temp); 
				      free(con.pcap_filter);
				      con.pcap_filter =strdup(temp);
				//       fprintf(stderr,"con.pcap_filter is %s\n",con.pcap_filter);				       
				}
			else    if ( strcmp(line,"report_screen") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.report_screen=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				   //    fprintf(stderr,"con.report_screen is %d\n",con.report_screen);				       
				}
		else    if ( strcmp(line,"report_html") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.report_html=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				      // fprintf(stderr,"con.report_html is %d\n",con.report_html);				       
				}
			else    if ( strcmp(line,"www_directory") == 0 ) 
			       {  
				       temp+=4;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,'"');
				       *tmp='\0';
				  //     fprintf(stderr,"%s\n" ,temp); 
				      free(con.www_directory);
				      con.www_directory =strdup(temp);
				      // fprintf(stderr,"con.www_directory is %s\n",con.www_directory);				       
				}
		else    if ( strcmp(line,"report_syslog") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.report_syslog=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				//       fprintf(stderr,"con.report_syslog is %d\n",con.report_syslog);				       
				}
		else    if ( strcmp(line,"report_logfile") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.report_logfile=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				//       fprintf(stderr,"con.report_logfile is %d\n",con.report_syslog);				       
				}
		else    if ( strcmp(line,"log_dir") == 0 ) 
			       {  
				       temp+=4;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,'"');
				       *tmp='\0';
				  //     fprintf(stderr,"%s\n" ,temp); 
				      free(con.log_dir);
				      con.log_dir=strdup(temp);
				   //    fprintf(stderr,"con.log_dir is %s\n",con.log_dir);				       
			}
		else    if ( strcmp(line,"signature_file") == 0 ) 
			       {  
				       temp+=4;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,'"');
				       *tmp='\0';
				  //     fprintf(stderr,"%s\n" ,temp); 
				      free(con.signature_file);
				      con.signature_file=strdup(temp);
				    //   fprintf(stderr,"con.signature_file is %s\n",con.signature_file);				       
				}			
		else    if ( strcmp(line,"scan_ttl") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.scan_ttl=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
			//	    fprintf(stderr,"con.scan_ttl is %d\n",con.scan_ttl);				       
				}
		else    if ( strcmp(line,"scan_max_count") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.scan_max_count=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				     //  fprintf(stderr,"con.scan_max_count is %d\n",con.scan_max_count);				       
				}
		else    if ( strcmp(line,"flood_ttl") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.flood_ttl=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				     //  fprintf(stderr,"con.flood_ttl is %d\n",con.flood_ttl);				       
				}		
		else    if ( strcmp(line,"flood_max_count") == 0 ) 
			       {  
				       temp+=3;
				       tmp = temp;
				       tmp+=1;
				       tmp= index(tmp,';');
				       *tmp='\0';
				       	con.flood_max_count=atoi(temp);
				//   free(con.pcap_filter);
				  //    con.pcap_filter =strdup(temp);
				     //  fprintf(stderr,"con.flood_max_count is %d\n",con.flood_max_count);				       
				}	
	       } // big if
                
        } // while

        fclose(fd);
}

void manage::usage(char *argv0)
{
//#ifndef DONT_USE_USAGE
    printf ("usage: %s [options]\n",argv0); 
    printf ("options:\n");
    printf ("  -h        display usage             -i <interface> listen on interface\n");
    printf ("  -b        background mode(deamond)  -q quiet mode    \n");
    printf ("  -v        verbose mode              -r Real time analyze\n"); 
    printf ("  -l <num> number of limited packet received\n"); 	
    printf ("example: %s -vr i eth0 \n",argv0);
	printf ("\n");
    printf ("NOTE:  before using this program,please check config file (isagnids.conf) \n");
    printf ("       there's many configuration that you should define for your system\n");
    printf ("NOTE: Default limited packet is infinite\n");
    printf ("NOTE: Default i is the first interface on your computer that detected by program\n");
//#endif
    exit(0);
}
char* manage::copy_argv(register char **argv)
{
   register char **p;
   register int len = 0;
   char *buf;
   char *src, *dst;

   p = argv;
   if (*p == 0)
      return 0;

   while (*p)
      len += strlen(*p++) + 1;

   buf = (char *)malloc(len);

   p = argv;
   dst = buf;
   while ((src = *p++) != NULL) {
      while ((*dst++ = *src++) != '\0')
         ;
      dst[-1] = ' ';
   }
   dst[-1] = '\0';

   return buf;

}

 void  manage::check_command(int argc,char **argv)
{
	 int op;
	extern char *optarg;
        if ((op = getopt(argc, argv, "bhi:l:pqrv")) ==-1) usage(argv[0]);
	while ( op  != -1 ) {
	//      printf("optarg is %s\n",optarg);
//	      printf("op is %c\n",op);
      switch (op) {
         case 'h':    usage(argv[0]);
                   break;                                     /* usage flag */
         case 'i': con.device=optarg;
		 // if (!quiet) printf("device is %s\n",device);
                   break;                                    /* device flag */
      case 'b': con.background=1;
                      fprintf(stderr, "[%s]: background mode (deamond) .\n", argv[0]);
                   break;  
      /* foreground sniffing flag */
                       case 'q': con.quiet=1; break;                             /* quiet mode */
     			case 'r': 
				           con.rflag=1;
			                   con.flood =1;con.scan =1;con.IPde=1;con.land=1;con.sign=1;
			 		break;               
  		        case 'l': con.limit=atoi(optarg);break;       	
			case 'p': con.promisc=1;break;       		
  			case 'v': con.verbose=1;break;                         /* verbose mode */
	default :           break;
		  }
       op = getopt(argc, argv, "bhi:lpqrv");
   }
	      
}
/*
int main(int argc, char **argv)
{
	manage mana;
	config *con;
	mana.check_command(argc,argv);
	con = mana.get_config();
	fprintf(stderr,"signature is %s\n",con->signature_file);
	fprintf(stderr,"rflag is %d\n",con->rflag);
	fprintf(stderr,"verbose is %d\n",con->verbose);
	fprintf(stderr,"quiet is %d\n",con->quiet);
	return 0;
}
*/