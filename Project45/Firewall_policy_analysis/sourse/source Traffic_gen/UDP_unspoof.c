#include <signal.h>
#include <stdio.h>
#include <netdb.h>
#include <sys/types.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <linux/ip.h>
#include <linux/udp.h>

#define SEQ 0x28376839
#define getrandom(min, max) ((rand() % (int)(((max)+1) - (min))) + (min))

unsigned long send_seq, ack_seq, srcport;
char flood = 0;
int sock, ssock, curc, cnt;

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


void send_udp_segment(struct iphdr *ih, struct udphdr *th, char *data, int dlen) {
	char buf[65536];
	struct {  /* rfc 793 tcp pseudo-header */
		unsigned long saddr, daddr;
		char mbz;
		char ptcl;
		unsigned short udpl;
	} ph;
	
	struct sockaddr_in sin;	/* how necessary is this, given that the destination
				 address is already in the ip header? */
	
	ph.saddr=ih->saddr;
	ph.daddr=ih->daddr;
	ph.mbz=0;
	ph.ptcl=IPPROTO_UDP;
	ph.udpl=htons(sizeof(*th)+dlen);
	
	memcpy(buf, &ph, sizeof(ph));
	memcpy(buf+sizeof(ph), th, sizeof(*th));
	memcpy(buf+sizeof(ph)+sizeof(*th), data, dlen);
	memset(buf+sizeof(ph)+sizeof(*th)+dlen, 0, 4);
	th->check=ip_sum(buf, (sizeof(ph)+sizeof(*th)+dlen+1)&~1);
	
	memcpy(buf, ih, 4*ih->ihl);
	memcpy(buf+4*ih->ihl, th, sizeof(*th));
	memcpy(buf+4*ih->ihl+sizeof(*th), data, dlen);
	memset(buf+4*ih->ihl+sizeof(*th)+dlen, 0, 4);
	
	ih->check=ip_sum(buf, (4*ih->ihl + sizeof(*th)+ dlen + 1) & ~1);
	memcpy(buf, ih, 4*ih->ihl);
	
	sin.sin_family=AF_INET;
	sin.sin_port=th->dest;
	sin.sin_addr.s_addr=ih->daddr;
	
	if(sendto(ssock, buf, 4*ih->ihl + sizeof(*th)+ dlen, 0, &sin, sizeof(sin))<0) {
		printf("Error sending syn packet.\n"); perror("");
		exit(1);
	}
}

unsigned long spoof_open(unsigned long my_ip, unsigned long their_ip, unsigned short port) {
	int i, s;
	struct iphdr ih;
	struct udphdr th;
	struct sockaddr_in sin;
	int sinsize;
	unsigned short myport=6969;
	char buf[1024];
	struct timeval tv;
	
	ih.version=4;
	ih.ihl=5;
	ih.tos=0;			/* XXX is this normal? */
	ih.tot_len=sizeof(ih)+sizeof(th);
	ih.id=htons(random());
	ih.frag_off=0;
	ih.ttl=30;
	ih.protocol=IPPROTO_UDP;
	ih.check=0;
	ih.saddr=my_ip;
	ih.daddr=their_ip;
	
	th.source=htons(srcport);
	th.dest=htons(port);
	th.len = htons(sizeof(th));
	th.check = 0;
		
	gettimeofday(&tv, 0);
	
	send_udp_segment(&ih, &th, "", 0); 
	
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
   int i, x, max, urip, j;
   unsigned long them, me_fake;
   unsigned lowport, highport;
   char buf[1024], *junk;
   char hostname[32];
   
   init_signals();   
#ifdef HIDDEN
   for (i = argc-1; i >= 0; i--)
     /* Some people like bzero...i prefer memset :) */
     memset(argv[i], 0, strlen(argv[i]));
   strcpy(argv[0], HIDDEN);
#endif
   
   if(argc<4) {
      printf("Usage: %s dstaddr low high\n", argv[0]);
      printf("    If srcaddr is 0, random addresses will be used\n\n\n");
      
      exit(1);
   }
   
   urip = 1;
   
   gethostname(hostname,32);
   me_fake=getaddr(hostname);

   them=getaddr(argv[1]);
   lowport=atoi(argv[2]);
   highport=atoi(argv[3]);
   srandom(time(0));
   ssock=socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
   if(ssock<0) {
      perror("socket (raw)");
      exit(1);
   }
   sock=socket(AF_INET, SOCK_RAW, IPPROTO_UDP);
   if(sock<0) {
      perror("socket");
      exit(1);
   }
   junk = (char *)malloc(1024);
   max = 1500;
   i = 1;
   printf("[H[J\n\nSend UDP packet without spoofing.\n");
   srandom((time(0)+i));
   srcport = getrandom(1, max)+1000;
   for (x=lowport; x<=highport; x++)
   {
	  spoof_open(/*0xe1e26d0a*/ me_fake, them, x);
	  /* A fair delay. Good for a 28.8 connection */ 
	  
	  if(j == 3)
	  {
		  j = 0;
		  upsc();
		  fflush(stdout);
		  usleep(300);
	  }
	  else 
		  j++;
	  
   }
}
