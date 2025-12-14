#define _REENTRANT

#include <iostream.h>
#include <sys/socket.h>
#include <string.h>
#include <sys/ioctl.h>
#include <pthread.h>


#include <unistd.h>
#include <net/if.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <signal.h>
#include <netdb.h>
#include <semaphore.h>
//-------------user include --------
#include "node.h"
#include "land.h"
#include "IPdefragment.h"
#include "flood.h"
#include "scan.h"
#include "manage.h"
#include "report.h"
#include "signature.h"
//-----------------------------------

extern "C"  // expectually for using pcap that compatible only in C language
{
#include <pcap.h>
}
#define MIN(a,b) (((a)<(b)) ?(a):(b))
#define INET_ADDRSTRLEN 16

       //--------------declare member ----------------------------
	                        config *con;
                                node  *rootnode =NULL;
				node *firstnode=NULL;
				Land *land_check=NULL;
				IPdefragment *fragment_check=NULL;
				flood *flood_check=NULL;
                                scan *scan_check=NULL;
				signature *signature_check=NULL;
				manage *manager=NULL;
				report *report_thread=NULL;
				pcap_t *p;
				char *ifname;
		                int snaplen;
		                int promisc;
		                int to_ms;
		                int count;
		                int  optimize;
                                 int exit_sniff;
				bpf_u_int32 net ;
				bpf_u_int32 mask ;
	                        u_long datalen=2048;
				long count_num=0;
		                struct bpf_program prog;
				char  errbuf[PCAP_ERRBUF_SIZE];
				char netstr[INET_ADDRSTRLEN];
		   		char ipstr[INET_ADDRSTRLEN];
				char maskstr[INET_ADDRSTRLEN];
		   		char lhost[128];
		                struct hostent *hostinfo; 
				char prestr[80];
				u_char *pcap_userdata;
				struct filter {
		    				pcap_handler f;
		   				int type;
					};
				char *pcap_filter;
				struct ether_header *eth;
				sem_t sem_node_land;
				sem_t sem_node_IPdefragmented;
				sem_t sem_node_Bomb;
				sem_t sem_node_signature;
				sem_t sem_node_scan_port;
				sem_t sem_node_report;
				sem_t sem_Land;
				sem_t sem_IPdefragmented;
				sem_t sem_Bomb;
				sem_t sem_signature;
				sem_t sem_scan_port;
				sem_t sem_report;
				int verb=0;
				pthread_t p_thread1;
				pthread_t p_thread2;
				pthread_t p_thread3;
				pthread_t p_thread4;
				pthread_t p_thread5;
				pthread_t p_thread6;
				pthread_t p_thread7;
				int process_shutdown = 0;
				pthread_mutex_t a_mutex = PTHREAD_MUTEX_INITIALIZER;
				int exit_count =0;
				int flag_exit =0;
				 long num=0;
				 struct ID_thread {
					 long ID;	
					 pthread_t t_id;
					 };
 				long Process_ID=0;		
				ID_thread land_id;
				ID_thread delete_packet_id;
				ID_thread IPdefragmented_id;
				ID_thread scan_port_id;
				ID_thread Bomb_id;
				ID_thread report_id;
				ID_thread signature_id;
            // -------------declare function prototype----------
				int  lookup_lan_card();
				int  ispromisc_mode(int); // 0 :check mode , 1 :set promiss ,2 :restore old mode
			        static void  ether_filter(u_char *user,  const struct pcap_pkthdr *h, const  u_char *p);
				void ip_filter(const u_char *p,int length);
	 //-----------end declare function---------------------------
void exit_prog(int signo)
 {
	 long ID=(long) getpid();
	 if(ID==Process_ID) 
	 {
	if (!con->quiet) fprintf(stderr,"\ncall process Id is %ld \n",ID);
	if (!con->quiet)  fprintf(stderr,"main process Id is %ld \n",Process_ID);
	 struct pcap_stat ps;
	if (!con->quiet)  fprintf(stderr,"    \n");
     
	node *endnode = rootnode;	 
	num =0;	
	while(endnode != NULL )
	  {
		endnode =rootnode->next;
		rootnode =endnode;  
		 num++; 
	  }

     if (!con->quiet) fprintf(stderr,"Return memory : %d\n",num);
     if (!con->quiet)   fprintf(stderr,"Captured is %d \n",count_num);
 	ispromisc_mode(2);

	   if ( pcap_stats(p,&ps)!=0 ) {   if (!con->quiet) fprintf(stderr,"get stats error : %s \n",pcap_geterr(p)); }
		else
		{
			if (!con->quiet) fprintf(stderr,"number of packets received is %d\n",ps.ps_recv);
			if (!con->quiet)  fprintf(stderr,"number of packets drops is %d \n",ps.ps_drop);
	}
	pcap_close(p);
	if (!con->quiet)  fprintf(stderr,"Program terminated!!! \n");
	
	exit(0);
}
 }

static void* delete_packet(void* arg)
{    
	delete_packet_id.ID=(long) getpid();
	delete_packet_id.t_id=p_thread6;
	if (!con->quiet)  fprintf(stderr,"delete_packet Process ID : %ld \n",delete_packet_id.ID);	
	if (!con->quiet) printf("delete_packet Thread created and working Now...\n");		
	node *packet=NULL;
	node *tmpnode=NULL;
	while(firstnode ==NULL) {};
	packet =firstnode;
	tmpnode=firstnode;
	while(1) 
	{
		sem_wait(&sem_Land);
		sem_wait(&sem_signature);
		sem_wait(&sem_IPdefragmented);
		sem_wait(&sem_Bomb);
		sem_wait(&sem_scan_port);
		if (packet->last !=NULL)
		{	
		struct sigaction action,old_action;
		sigemptyset(&action.sa_mask);
		sigaddset(&action.sa_mask,SIGINT);
		action.sa_handler = SIG_IGN;
		action.sa_flags =0;
		sigaction(SIGINT,&action,&old_action);	
		
		tmpnode=packet;
		packet = packet->last;
		packet->next =NULL;
		free(tmpnode->this_iphdr);
		if  (tmpnode->this_tcphdr != NULL){	
											free(tmpnode->this_tcphdr);
											}
		if  (tmpnode->this_udphdr != NULL){	
											free(tmpnode->this_udphdr);
											}
		if  (tmpnode->this_icmphdr != NULL){	
											free(tmpnode->this_icmphdr);
											}
		if (tmpnode->data !=NULL) free(tmpnode->data);															
							
		delete tmpnode;
		action.sa_handler = exit_prog;
		action.sa_flags =0;
		sigaction(SIGINT,&action,&old_action);
		}
	}
	return NULL;
}
static void* signature_thread(void* arg)
{
	signature_id.ID=(long) getpid();
	signature_id.t_id=p_thread1;
	if (!con->quiet) fprintf(stderr,"Signature Process ID : %ld \n",signature_id.ID);	
	if (!con->quiet) printf("Signature Thread created and working Now...\n");
	if(signature_check==NULL) {signature_check = new signature(con);}
	node *packet=NULL;
	while(firstnode ==NULL) {};
	packet=firstnode;
	
	while(1)
	{
		sem_wait(&sem_node_signature);
		if (packet->last !=NULL)
		{	
		if(con->sign)signature_check->signature_run(packet,report_thread);		
		packet = packet->last;
		sem_post(&sem_signature);	
		}
	}

return NULL;
}

static void* Land_thread(void* arg)
{
	land_id.ID=(long) getpid();
	land_id.t_id=p_thread1;
	if (!con->quiet) fprintf(stderr,"land Process ID : %ld \n",land_id.ID);	
	if (!con->quiet) printf("Land Thread created and working Now...\n");
	if(land_check==NULL) {land_check = new Land(con);}
	node *packet=NULL;
	int count =1;
	while(firstnode ==NULL) {};
	packet=firstnode;
	
	while(1)
	{
		sem_wait(&sem_node_land);
		if (packet->last !=NULL)
		{	
			if(con->land)	land_check->LAND(packet);
			if(con->land)	land_check->ShowLandResult(report_thread);	
		packet = packet->last;
		sem_post(&sem_Land);	
		}
	}
	return NULL;
}
static void* IPdefragmented_thread(void* arg)
{
	IPdefragmented_id.ID=(long) getpid();
	IPdefragmented_id.t_id=p_thread2;
	if (!con->quiet) fprintf(stderr,"IPdefragmented Process ID : %ld \n",IPdefragmented_id.ID);	
	if (!con->quiet) printf("IPdefragmented Thread created and working Now...\n");
	if(fragment_check==NULL) {fragment_check = new IPdefragment(con);}
	node *packet=NULL;
	while(firstnode ==NULL) {};
	packet=firstnode;
	
	while(1)
	{
		sem_wait(&sem_node_IPdefragmented);
		if (packet->last !=NULL)
		{	
	if(con->IPde) fragment_check->RealTimeFragChk(packet);
	if(con->IPde) fragment_check->ShowResult(report_thread);
		packet = packet->last;
		sem_post(&sem_IPdefragmented);	
		}
	}
	return NULL;
}

static void* Bomb_thread(void* arg)
{
	Bomb_id.ID=(long) getpid();
	Bomb_id.t_id=p_thread3;
	if (!con->quiet) 	fprintf(stderr,"Bomb Process ID : %ld \n",Bomb_id.ID);	
	if (!con->quiet) printf("Bomb Thread created and working Now...\n");
	if(flood_check==NULL) {flood_check = new flood(con);}
	node *packet=NULL;
	while(firstnode ==NULL) {};
	packet=firstnode;
	
	while(1)
	{
		sem_wait(&sem_node_Bomb);
		if (packet->last !=NULL)
		{	
		if (con->flood) flood_check->flood_run(packet,report_thread);
		packet = packet->last;
		sem_post(&sem_Bomb);	
		}
	}
	return NULL;
}

static void* scan_port_thread(void* arg)
{
	scan_port_id.ID=(long) getpid();
	scan_port_id.t_id=p_thread4;
	if (!con->quiet) fprintf(stderr,"TCP Scan Port Process ID : %ld \n",scan_port_id.ID);	
	if (!con->quiet) printf("TCP Scan Port Thread created and working Now...\n");
	if(scan_check==NULL) {scan_check = new scan(con);}
	node *packet=NULL;
	while(firstnode ==NULL) {};
	packet=firstnode;
	while(1)
	{
		sem_wait(&sem_node_scan_port);
		if (packet->last !=NULL)
		{	
		if(con->scan)	scan_check->scandetect_run(packet,report_thread);
		packet = packet->last;
		sem_post(&sem_scan_port);	
		}
	}
	return NULL;
}

static void* Report_thread(void* arg)
{
	report_id.ID=(long) getpid();
	report_id.t_id=p_thread3;
	if (!con->quiet) fprintf(stderr,"Report Thread ID : %ld \n",report_id.ID);	
	if(report_thread==NULL) {report_thread = new report(con);}
	if (report_thread==NULL) {perror("error was found...\n");}
	if (!con->quiet) printf("Report Thread created and working Now...\n");
	while(1)
	{
	   report_thread->gen_report_in_queue();
	}
	return NULL;
}

void ip_filter(const u_char *p, const struct pcap_pkthdr *h,int length)
    {
          struct node *tmpnode;
	  struct tcphdr *this_tcphdr;
	  struct udphdr *udp;
	  struct icmphdr *icmp;
	  time_t time11; 
	   struct ip * this_iphdr = (struct ip *) p;	   
	   //-------signal-------------------------------
	        struct sigaction action,old_action;
		sigemptyset(&action.sa_mask);
		sigaddset(&action.sa_mask,SIGINT);
		action.sa_handler = SIG_IGN;
		action.sa_flags =0;
		sigaction(SIGINT,&action,&old_action);
	//---------------------------------------

	   tmpnode =new node();
	   if (rootnode == NULL) firstnode =tmpnode;
	   time(&(time11) );
	  tmpnode->this_iphdr = (struct ip *) malloc(sizeof(ip));
	   bzero(tmpnode->this_iphdr,sizeof(ip));
	   memcpy((tmpnode->this_iphdr),this_iphdr ,sizeof(ip));
   	   length = ntohs(this_iphdr->ip_len) - (this_iphdr->ip_hl *4);
	  p += this_iphdr->ip_hl *4;
	   struct tm *sniff_time=localtime(&(time11));
	   tmpnode->hour = sniff_time->tm_hour;
	   tmpnode->min = sniff_time->tm_min;
	   tmpnode->sec = sniff_time->tm_sec;
	   tmpnode->this_tcphdr =NULL;
	    switch(this_iphdr->ip_p)
	   {
		   case IPPROTO_TCP:
				this_tcphdr = (struct tcphdr *) p;
				p+=this_tcphdr->doff *4;
				length -= this_tcphdr->doff *4;
				tmpnode->len= length;
				tmpnode->addr.source = tmpnode->srcport = ntohs(this_tcphdr->source);
          			tmpnode->addr.dest = tmpnode->dstport = ntohs(this_tcphdr->dest);
				tmpnode->ofs=MIN(length,2048);
				tmpnode ->data = (u_char *) malloc(length);
				bcopy(p,tmpnode->data,tmpnode->ofs);
				tmpnode->end_data = tmpnode->data + length;
				tmpnode->this_tcphdr = (struct tcphdr *) malloc(sizeof(tcphdr));
				bzero(tmpnode->this_tcphdr,sizeof(tcphdr));
				memcpy((tmpnode->this_tcphdr),(this_tcphdr),sizeof(tcphdr));
		   	    break;
		   case IPPROTO_UDP:
				udp = (struct udphdr *)p;
				length -=sizeof(struct udphdr);
				p+=sizeof(struct udphdr);
				tmpnode ->len = length;
				tmpnode->addr.source = tmpnode->srcport = ntohs(udp->source);
          			tmpnode->addr.dest = tmpnode->dstport = ntohs(udp->dest);
				tmpnode->ofs=MIN(length,2048);
				tmpnode ->data = (u_char *) malloc(length);
				bcopy(p,tmpnode->data,length);
				tmpnode->end_data = tmpnode->data + length;
				tmpnode->this_udphdr = (struct udphdr *) malloc(sizeof(udphdr));
				bzero(tmpnode->this_udphdr,sizeof(udphdr));
				memcpy((tmpnode->this_udphdr),(udp),sizeof(udphdr));
		   	    break;
		      case IPPROTO_ICMP:
			      icmp =(struct icmphdr *) p;
				length -=sizeof(struct icmphdr);
				p+=sizeof(struct icmphdr);
				tmpnode->len =length;
				tmpnode->ofs=MIN(length,2048);
				tmpnode ->data = (u_char *) malloc(length);
				bcopy(p,tmpnode->data,length);
				tmpnode->end_data = tmpnode->data + length;
			      	tmpnode->this_icmphdr = (struct  icmphdr *) malloc(sizeof(icmphdr));
				bzero(tmpnode->this_icmphdr,sizeof(icmphdr));
				memcpy((tmpnode->this_icmphdr),( icmp),sizeof(icmphdr));
			      break;
		  default: 
		            break;
	   }
	 tmpnode->addr.saddr = this_iphdr->ip_src.s_addr;
	 tmpnode->addr.daddr = this_iphdr->ip_dst.s_addr;	
	   for (int i=0; i <=5; i++)
	   {
		   tmpnode->eth_shost[i] = eth->ether_shost[i];
		   tmpnode->eth_dhost[i] = eth->ether_dhost[i];
	   }
	   tmpnode->eth_type=eth->ether_type;	
	   tmpnode ->srcip.s_addr = this_iphdr->ip_src.s_addr;
	   tmpnode ->dstip.s_addr = this_iphdr->ip_dst.s_addr;
	   tmpnode->ip_p = this_iphdr->ip_p;
	   tmpnode->ip_id=this_iphdr->ip_id;
	   tmpnode->ip_len=this_iphdr->ip_len;
	   tmpnode->ip_off=this_iphdr->ip_off;
	   tmpnode->all_len=h -> len;
	    tmpnode->next=rootnode;
	   if(rootnode != NULL) rootnode->last =tmpnode;
           tmpnode->last= NULL;
	   rootnode=tmpnode;
	   if (con->verbose) tmpnode->print_frame();
	   count_num++;
   	action.sa_handler = exit_prog;
		action.sa_flags =0;
		sigaction(SIGINT,&action,&old_action);
	   sem_post(&sem_node_land);	
	   sem_post(&sem_node_signature);	
	   sem_post(&sem_node_IPdefragmented);
	   sem_post(&sem_node_Bomb);
	   sem_post(&sem_node_scan_port);
	 // -------------------end keep packet------------------ 

	
};

static void ether_filter(u_char *user,  const struct pcap_pkthdr *h, const  u_char *p)
	{
			
		int length = h -> len;
		eth = (struct ether_header *) p;
		if(ntohs(eth->ether_type) < 1500) 
			{
				p +=8;
				length -=8;
				eth = (struct ether_header *) p;
			}

		p+=sizeof(struct ether_header);
	       length -=sizeof(struct ether_header);
   
		switch (ntohs(eth->ether_type)) 
		{
			case ETHERTYPE_IP:
				ip_filter(p,h,length);
	  		break;
		}
	    };

int  lookup_lan_card()
{
	       try  {  if (ifname==NULL)
	       			{
		         		if    (!(ifname  =  pcap_lookupdev(errbuf)))   throw errbuf;
				}
		       }
		 catch (const char*msg)
       			{  
		         if (!con->quiet)   printf("Error getting device on system : %s\n",msg); 
			    return -1;
	         	}


	 if (!con->quiet)   printf("Lan Card name is %s\n",ifname);
			
                try {		 
		           if (pcap_lookupnet(ifname, &net, &mask, errbuf) < 0 ) throw  errbuf;  
		       }
	  	catch (const char* msg) 
			{
			if (!con->quiet)    printf("Can't get network :  %s\n",msg); 
			     return -2;	
	 		}
	     inet_ntop(AF_INET,&net,netstr,sizeof(netstr));
	     inet_ntop(AF_INET,&mask,maskstr,sizeof(maskstr));		 
	    if (!con->quiet) printf("Network Address is %s\n",netstr);
	    if (!con->quiet)   printf("Subnet Mask is %s\n",maskstr);
			
	     if (gethostname(lhost,sizeof(lhost)) !=0 )
	       { 
		if (!con->quiet) printf("Error getting hostname\n");
		       return -3;
	       }
		hostinfo = gethostbyname(lhost);
		if (!hostinfo) {   if (!con->quiet)    perror("gethostname");
		             	                 return -4;
		                          }
             if (!con->quiet)  printf("Host name is %s\n",lhost); 
	     inet_ntop(AF_INET,(char*) (hostinfo -> h_addr),ipstr,sizeof(ipstr));
	      if (!con->quiet)printf("IP Address is %s\n",ipstr);			

	return 0;
}

int  ispromisc_mode(int flag)
{ 
         struct ifreq ifr;
		
	 strcpy(ifr.ifr_name,ifname);
	 if(ioctl(pcap_fileno(p),SIOCGIFFLAGS,&ifr) < 0)
	 {
		if (!con->quiet) perror("can't get flags");
		 return -2;
	 }
	switch (flag)
	{
	case 1 : 
	 		 ifr.ifr_flags |= (IFF_PROMISC);  // -------------------bit 9th = 1;from all 16 bits . count from left
 		 	if(ioctl(pcap_fileno(p),SIOCSIFFLAGS,&ifr) < 0)
			 {
		 		if (!con->quiet)perror("can't set flags");
		 		return -3;
	 		} 
			if (!con->quiet) fprintf(stderr,"Land card is on promiscious mode \n");
	 		break;
	 case 2 : 
			 ifr.ifr_flags &= ~(IFF_PROMISC);  // -------------------bit 9th = 1;from all 16 bits . count from left
 		 	if(ioctl(pcap_fileno(p),SIOCSIFFLAGS,&ifr) < 0)
				 {
		 			if (!con->quiet)perror("can't set flags");
		 			return -3;
	 			} 
			if (!con->quiet) fprintf(stderr,"Land card left Promiscious mode \n"); 
	 		break;
	 case 0 :
	 	 	if ((ifr.ifr_flags & IFF_PROMISC ) == IFF_PROMISC)
			{
				if (!con->quiet)printf("Land card is on promiscious mode \n");
			}
			else if (!con->quiet) printf("Land card is not on promiscious mode \n");
			break;
	}
	return 0;	
	 }


 
int  sniffer()
{
	  if (lookup_lan_card() != 0) {
		  						if (!con->quiet)printf("Exception : ");
		  						return -1;}
	  
	  if (!(p =pcap_open_live(ifname,snaplen, promisc, to_ms, errbuf))) // open to capture packet and set promiscious mode of card
			{
				if (!con->quiet)printf("Error opening interface %s : %s \n",ifname,errbuf); 
				return -1;

			}
			
			if (pcap_compile(p,&prog,pcap_filter,optimize,mask) < 0)
			{ 
				if (!con->quiet)printf("Error compiling bpf filter on %s : %s \n",ifname,pcap_geterr(p));
				return -2;
			}
	
	if(pcap_setfilter(p, &prog) < 0)
	{
		 sprintf(prestr, "Error installing bpf filter on interface %s",ifname);
		pcap_perror(p,prestr);
		return -3;
	}

 	try  { 
		  if (pcap_loop(p,count,ether_filter,pcap_userdata))
			{ 
				throw "Error reading packet from interface";
			}
	       	}
 	catch (const char* msg) 
			{
			if (!con->quiet)	printf("Exception : %s \n",msg);	
	 		}
         ispromisc_mode(2);
	 pcap_close(p);
	return 0;
}
 
 int main(int argc,char *argv[])
{
	int thr_id1;
	int thr_id2;
	int thr_id3;
	int thr_id4; 
	int thr_id5;
	int thr_id6;
	int thr_id7;
	pcap_userdata = NULL;
	net =0;mask =0; 
	snaplen = 65535; 
	to_ms = 1000; 
	optimize=1;
	exit_sniff =1;
	pid_t childpid;
	manager = new manage();
	if (manager ==NULL) {fprintf(stderr,"malloc manager fail \n"); exit(-1);}
	manager->check_command(argc,argv);
	con = manager->get_config();
	if (con->device !=NULL) ifname=strdup(con->device);
	pcap_filter=strdup(con->pcap_filter);
	count=con->limit;
	promisc=con->promisc;
	verb =con->verbose;
	
	if (!con->quiet)printf("complete passing command...........\n");
	if(con->background ==1)
	{
		if ( (childpid =fork()) < 0  ) {
			         perror("fork");
			}
		else if (childpid >0) {fprintf(stderr,"Now, parent exit and child working \n"); exit(0);}
	}
	
	if (!con->quiet)	fprintf(stderr,"Isagnid v1.1 (c) 1999-01 ISAG Senior Project\n");

	// --------------------create thread of each ip that is detected---------------------

   

		// initialize semaphore
	        sem_init(&sem_Land,1,0);
	        sem_init(&sem_signature,1,0);
	        sem_init(&sem_report,1,0);
		sem_init(&sem_IPdefragmented,1,0);
	        sem_init(&sem_Bomb,1,0);
	        sem_init(&sem_scan_port,1,0);	
		sem_init(&sem_node_land,1,0);
		sem_init(&sem_node_signature,1,0);
		sem_init(&sem_node_IPdefragmented,1,0);	
		sem_init(&sem_node_Bomb,1,0);
		sem_init(&sem_node_scan_port,1,0);	
		sem_init(&sem_node_report,1,0);
		sem_init(&sem_report,1,0);

		struct sigaction action,old_action;
		sigemptyset(&action.sa_mask);
		sigaddset(&action.sa_mask,SIGINT);
		action.sa_handler = exit_prog;
		action.sa_flags =0;
		sigaction(SIGINT,&action,&old_action);

		thr_id1= pthread_create(&p_thread1,NULL,Land_thread,(void*)&firstnode);
		thr_id2 = pthread_create(&p_thread2,NULL,Report_thread,(void*)&firstnode);
		thr_id3= pthread_create(&p_thread3,NULL,IPdefragmented_thread,(void*)&firstnode);
		thr_id4 = pthread_create(&p_thread4,NULL,Bomb_thread,(void*)&firstnode);	
		thr_id5 = pthread_create(&p_thread5,NULL,scan_port_thread,(void*)&firstnode);
		thr_id6 = pthread_create(&p_thread6,NULL,delete_packet,(void*)&firstnode);
		thr_id7 = pthread_create(&p_thread7,NULL,signature_thread,(void*)&firstnode);			
      		 // -----------------------------end create thread-----------------------------------
		Process_ID=(long) getpid();
		if (!con->quiet)fprintf(stderr,"Process ID : %ld \n",Process_ID);
	if (!con->quiet)	fprintf(stderr,"Parent Process ID : %ld \n",(long) getppid());
		

	sniffer();
	return 0;
}
               
 
 
 // end  program................
