/************************************/
/****       Project: ISAG        ****/
/**** Name: DDoS Defending Sytem ****/
/**** Member:                    ****/
/****   Mr.Narongsak Sangnualsri ****/
/****     ID:    42015300        ****/
/****   Mr.Tuangprat Saingsanun  ****/
/****     ID:    42015304        ****/
/**** Description:               ****/
/****    This Program could      ****/
/**** scan ddos tools, it have   ****/
/**** ability scan agent  ,      ****/
/**** some tools scan master are ****/
/****        Trinoo              ****/
/****        Winrinoo            ****/
/****        TFN (2K)            ****/
/****        Stacheldraht        ****/
/****        Carko               ****/
/************************************/

#define VERSION "IsagDD 1.0"

#include <stdlib.h>
#include <ctype.h>
#include <signal.h>
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/in_systm.h>
#include <netinet/ip.h>
#include <netinet/udp.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <netinet/ip_icmp.h>

#define BS 1024
#define __FAVOR_BSD

static unsigned long MaskBits[] = {
  0x00000000,			/* /0 */
  0x00000000,			/* /1 */
  0x00000000,			/* /2 */
  0x00000000,			/* /3 */
  0x00000000,			/* /4 */
  0x00000000,			/* /5 */
  0x00000000,			/* /6 */
  0x00000000,			/* /7 */
  0x00000000,			/* /8 */
  0x00000000,			/* /9 */
  0x00000000,			/* /10 */
  0x00000000,			/* /11 */
  0x00000000,			/* /12 */
  0x00000000,			/* /13 */
  0x00000000,			/* /14 */
  0x00000000,			/* /15 */
  0xffff0000,			/* /16, Class B */
  0xffff8000,			/* /17, 128 * Class C */
  0xffffc000,			/* /18, 64 * Class C */
  0xffffe000,			/* /19, 32 * Class C */
  0xfffff000,			/* /20, 16 * Class C */
  0xfffff800,			/* /21, 8 * Class C */
  0xfffffc00,			/* /22, 4 * Class C */
  0xfffffe00,			/* /23, 2* Class C */
  0xffffff00,			/* /24, Class C */
  0xffffff80,			/* /25, 128 hosts */
  0xffffffc0,			/* /26, 64 hosts */
  0xffffffe0,			/* /27, 32 hosts */
  0xfffffff0,			/* /28, 16 hosts */
  0xfffffff8,			/* /29, 8 hosts */
  0xfffffffc,			/* /30, 4 hosts (PPP link) */
  0xfffffffe,			/* /31, invalid */
  0xffffffff,			/* /32, host */
};

static int NumHosts[] = {
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,			
  65534,			
  32766,
  16382,
  8190,
  4094,
  2046,
  1022,
  510,
  254,
  126,
  62,
  30,
  14,
  6,
  2,
  0,
  1,
};

extern	char		*optarg;

struct icmppkt_t {
	struct ip	ipi;
	struct icmp	icmpi;
	char		buffer[BS];
} icmppkt;

struct udppkt_t {
	struct ip	ipi;
	struct udphdr	udpi;
	char		buffer[BS];
} udppkt;

static unsigned short	ip_sum(u_short *,int);
/* static void		listener(); */
static void		listener_trinoo();
static void		listener_wintrinoo();
static void		listener_mstream();
static void		listener_tfn();
static void		listener_stacheldraht();
static void		listener_carko();
static int		usage();

static int		vflg = 0;	/* VERBOSITY */
static int		dflg = 0;	/* DEBUGGING */

/********************************************************/
/**** start STACHELDRAHT VAR *****/
static int		stach_test = 6666; /*666,668,6666,1000*/	/* SEND TEST */
static int		stach_echo = 6667; /*667,669,6667,1001*/	/* RECEIVE REPLY */
char			stach_gagstr[] = "skillz";
char 			stach_echostr[] = "ficken";
/**** end STACHELDRAHT VAR *****/

/**** start CARKO VAR *****/
static int		carko_test = 1000; /*666,668,6666,1000*/	/* SEND TEST */
static int		carko_echo = 1001; /*667,669,6667,1001*/	/* RECEIVE REPLY */
char			carko_gagstr[] = "gesundheit!";
char 			carko_echostr[] = "sicken";
/**** end CARKO VAR *****/

/**** start TRINOO VAR ****/
static short	trinoo_dstport = 27444;	/* handler listen port */
static short	trinoo_rctport = 31335;	/* agent listen port */
char 			trinoo_scmd[] = "png";
char 			trinoo_spass[] = "l44adsl";
char 			trinoo_echostr[] = "PONG";
/**** end TRINOO VAR ****/

/**** start WINTRINOO VAR ****/
static short	wintrinoo_dstport = 34555;	/* handler listen port */
static short	wintrinoo_rctport = 35555;	/* agent listen port */
char 			wintrinoo_scmd[] = "png []..Ks 144";
char 			wintrinoo_spass[] = "l44adsl";
char 			wintrinoo_echostr[] = "PONG";
/**** end WINTRINOO VAR ****/

/**** start MSTREAM VAR ****/
static short	mstream_dstport = 7983;	/* handler listen port */
static short	mstream_rctport = 9325;	/* agent listen port */
char 			mstream_scmd[] = "ping";
char 			mstream_spass[] = "sex";
char 			mstream_echostr[] = "pong";
/**** end MSTREAM VAR ****/

/**** start TFN VAR ****/
u_short			tfn_test = 789;
u_short			tfn_reply = 123;
char			tfn_gagstr[] = "gesundheit!";
/**** end TFN VAR ****/
/********************************************************/
/********************************************************/
/**** start Time VAR ****/
static void	ShowStartTimes();
static void	ShowEndTimes();
static void	PrintShowTimes();

#define TBS 256
struct tm *tm_ptr, tm_struct;
time_t lowlevel_time;
char timebuf[TBS];
/*char *result;
*/
#define TBS2 256
struct tm *tm_ptr2, tm_struct2;
time_t lowlevel_time2;
char timebuf2[TBS2];
/*char *result2;
*/
/**** end Time VAR ****/
/********************************************************/

int 
main(int argc, char **argv)
{
	int             pid, host;
	char            target[128];
	unsigned long	target_host;
	struct in_addr  target_ip;
	int		mask, temp_mask;
	char *		mask_ptr;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	char *		temp_mask_ptr;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	int		result;
	int		isock, usock, winusock;
	char            buf[BS];
	struct icmp    *icmpi = (struct icmp *)buf;
	struct sockaddr_in
			isa,usa,winusa;
	int             i;
	int     count_optind;
	char		*jnk1;
	char		*jnk2;
	int		sleepytime = 500;
	int		bigsleep = 30;
	int		num_hosts;
	char		scmd[BS], spass[BS], sbuf[BS];

/**** start GET OPTION ****/
	while((i = getopt(argc,argv,"ds:T:v")) != -1) {
		switch(i) {
		case 'd':
			dflg++;
			break;
		case 's':
			sleepytime = atoi(optarg);
			if(sleepytime <= 0) {
				fprintf(stderr,"WARNING :>> SLEEP TIME WILL OVERFLOW\n");
				sleepytime = 1;
			}
			break;
		case 'T':
			bigsleep = atoi(optarg);
			if(bigsleep <= 0) {
				fprintf(stderr,"WARNING :>> NEGATIVE VALUE USED DEFAULT :>> %d\n",
bigsleep);
			}
			break;
		case 'v':
			vflg++;
			break;
		default:
			exit(usage());
		}
	}
/****  end GET OPTION  ****/
/**** start CHECK COUNT ARGUMENT ****/
	if(optind >= argc || argc - optind > 1)
		exit(usage());
/****  end CHECK COUNT ARGUMENT ****/

/**** start ShowStartTime ****/
	ShowStartTimes();
/****  end ShowStartTime ****/

/**** start change ****/
	count_optind = optind;	
	mask_ptr = strchr(argv[optind], '/');

	/* if a CIDR block is passed in */
	if (mask_ptr) {
	  *mask_ptr = '\0';
	  mask_ptr ++;
	  
	  sscanf(mask_ptr, "%d", &mask);
	  
	} else {
      printf("<------------------------------>\n");
	  printf("<    NO MASK SCAN HOST(/32)    >\n");
      printf("<------------------------------>\n");
	  mask = 32;
	}

	if (mask != 32){
      printf("<------------------------------>\n");
	  printf("<      MASK SCAN HOST(/%d)   >\n",mask);
      printf("<------------------------------>\n");
		
	}
	temp_mask = mask;
/**** end change ****/

/**********************************/
/****  start trinoo scan here  ****/
/**********************************/
    printf("\n");
    printf("<------------------------------>\n");
    printf("<    START TRINOO SCAN HERE    >\n");
    printf("<------------------------------>\n");
			 
	result = inet_aton(argv[optind], &target_ip);

	if (result == 0) {
	  fprintf(stderr, "%s: NO IP ADDRESS : %s\n", argv[0],
		  argv[optind]);
	  exit(-1);
	}

	if (mask < 16) {
	  fprintf(stderr, "SCAN ERROR\n");
	  exit(-1);
	}

	num_hosts = NumHosts[mask];

	if (num_hosts == 0) {
	  fprintf(stderr, "CAN NOT SCAN :>> /%d.  EXIT PROGRAM\n", mask);
	  exit(-1);
	}
	
	if(vflg) {
	  printf("MASK : %d\n", mask);	
	  printf("TARGET IP: %s\n", inet_ntoa(target_ip));
	  printf("IsagDD SCAN  %s >> JUST SCANNING WORKING \n\n", VERSION);
	}

	sprintf(sbuf,"%s %s",trinoo_scmd,trinoo_spass);

	target_host = ntohl(target_ip.s_addr);
	target_host &= MaskBits[mask];

	target_ip.s_addr = htonl(target_host);

	if((pid = fork()) < 0) {
		perror("CAN NOT FORK");
		exit(1);
	}

	/* CHILD SIDE WAIT FOR REPLY FROM RETURN PACKET */
	if (pid == 0)
		listener_trinoo();

	sleep(1);

	/* PING LOOP HERE */
	
	while (num_hosts) {
	  if (mask != 32) {
	    target_host ++;
	  }
	  target_ip.s_addr = htonl(target_host);

	  num_hosts--;

	  if(vflg)
	    printf("PROBING IP ADDRESS %s\n", inet_ntoa(target_ip));
	  
/******************************************************/
			/* TRINOO SCAN CHECK HERE */
			bzero((char *) &usa, sizeof(usa));
			usa.sin_family = AF_INET;
			usa.sin_addr.s_addr = target_ip.s_addr;
/*trinoo_dstport*/
			usa.sin_port = htons(trinoo_dstport);

			if (dflg)
				fprintf(stderr,"SENDING UDP TO :>> %s\tPORT :>> %d\n",
/*trinoo_dstport*/
					inet_ntoa(usa.sin_addr), trinoo_dstport);
			if ((usock = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
				perror("CAN NOT OPEN UDP SOCKET");
				exit(1);
			}

			i = sendto(usock,sbuf,strlen(sbuf), 0,
				(struct sockaddr *)&usa,
				sizeof(usa));

			if (i < 0) {
				char ebuf[BS];
				sprintf(ebuf,"SEND TO :>> UDP  %s\tPORT :>> %d\n",
/*trinoo_dstport*/
					inet_ntoa(usa.sin_addr),trinoo_dstport);
				perror(ebuf);
				continue;/*
				break;*/
			}
			close(usock);
/******************************************************/

			usleep(sleepytime);
		}

	/* WAIT LATE RESPONSE */
	if (dflg)
		fprintf(stderr,"WAITING  %d SECONDS FOR (Trinoo) LATE RESPONSES.\n",
			bigsleep);
	sleep(bigsleep);

	/* SHUTDOWN WAIT LISTEN IF FAIL AND EXIT */
	(void)kill(pid, SIGHUP);

    printf("<------------------------------>\n");
	printf("<     END TRINOO SCAN HERE     >\n");
    printf("<------------------------------>\n");

/**********************************/
/****   end trinoo scan here   ****/
/**********************************/
/*************************************/
/****  start wintrinoo scan here  ****/
/*************************************/
    printf("<------------------------------>\n");
    printf("<   START WINTRINOO SCAN HERE  >\n");
    printf("<------------------------------>\n");

/**** start change ****/
	optind = count_optind;
	mask = temp_mask;
/**** end change ****/

	result = inet_aton(argv[optind], &target_ip);

	if (result == 0) {
	  fprintf(stderr, "%s: NO IP ADDRESS : %s\n", argv[0],
		  argv[optind]);
	  exit(-1);
	}

	if (mask < 16) {
	  fprintf(stderr, "SCAN ERROR\n");
	  exit(-1);
	}

	num_hosts = NumHosts[mask];

	if (num_hosts == 0) {
	  fprintf(stderr, "CAN NOT SCAN :>> /%d.  EXIT PROGRAM\n", mask);
	  exit(-1);
	}
	
	if(vflg) {
	  printf("MASK : %d\n", mask);	
	  printf("TARGET IP: %s\n", inet_ntoa(target_ip));
	  printf("IsagDD SCAN  %s >> JUST SCANNING WORKING \n\n", VERSION);
	}

	sprintf(sbuf,"%s %s",wintrinoo_scmd,wintrinoo_spass);

	target_host = ntohl(target_ip.s_addr);
	target_host &= MaskBits[mask];

	target_ip.s_addr = htonl(target_host);

	if((pid = fork()) < 0) {
		perror("CAN NOT FORK");
		exit(1);
	}

	/* CHILD SIDE WAIT FOR REPLY FROM RETURN PACKET */
	if (pid == 0)
		listener_wintrinoo();

	sleep(1);

	/* PING LOOP HERE */
	
	while (num_hosts) {
	  if (mask != 32) {
	    target_host ++;
	  }
	  target_ip.s_addr = htonl(target_host);

	  num_hosts--;

	  if(vflg)
	    printf("PROBING IP ADDRESS %s\n", inet_ntoa(target_ip));
	  
/******************************************************/
			/* WINTRINOO SCAN CHECK HERE */
			bzero((char *) &usa, sizeof(usa));
			usa.sin_family = AF_INET;
			usa.sin_addr.s_addr = target_ip.s_addr;
/*wintrinoo_dstport*/
			usa.sin_port = htons(wintrinoo_dstport);

			if (dflg)
				fprintf(stderr,"SENDING UDP TO :>> %s\tPORT :>> %d\n",
/*wintrinoo_dstport*/
					inet_ntoa(usa.sin_addr), wintrinoo_dstport);
			if ((usock = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
				perror("CAN NOT OPEN UDP SOCKET");
				exit(1);
			}

			i = sendto(usock,sbuf,strlen(sbuf), 0,
				(struct sockaddr *)&usa,
				sizeof(usa));

			if (i < 0) {
				char ebuf[BS];
				sprintf(ebuf,"SEND TO :>> UDP  %s\tPORT :>> %d\n",
/*wintrinoo_dstport*/
					inet_ntoa(usa.sin_addr),wintrinoo_dstport);
				perror(ebuf);
				continue;/*
				break;*/
			}
			close(usock);
/******************************************************/

			usleep(sleepytime);
		}

	/* WAIT LATE RESPONSE */
	if (dflg)
		fprintf(stderr,"WAITING  %d SECONDS FOR (Wintrinoo) LATE RESPONSES.\n",
			bigsleep);
	sleep(bigsleep);

	/* SHUTDOWN WAIT LISTEN IF FAIL AND EXIT */
	(void)kill(pid, SIGHUP);

    printf("<------------------------------>\n");
	printf("<    END WINTRINOO SCAN HERE   >\n");
    printf("<------------------------------>\n");

/*************************************/
/****   end wintrinoo scan here   ****/
/*************************************/
/*************************************/
/****  start mstream scan here  ****/
/*************************************/
    printf("<------------------------------>\n");
    printf("<    START MSTREAM SCAN HERE   >\n");
    printf("<------------------------------>\n");

/**** start change ****/
	optind = count_optind;
	mask = temp_mask;
/**** end change ****/

		 
	result = inet_aton(argv[optind], &target_ip);

	if (result == 0) {
	  fprintf(stderr, "%s: NO IP ADDRESS : %s\n", argv[0],
		  argv[optind]);
	  exit(-1);
	}

	if (mask < 16) {
	  fprintf(stderr, "SCAN ERROR\n");
	  exit(-1);
	}

	num_hosts = NumHosts[mask];

	if (num_hosts == 0) {
	  fprintf(stderr, "CAN NOT SCAN :>> /%d.  EXIT PROGRAM\n", mask);
	  exit(-1);
	}
	
	if(vflg) {
	  printf("MASK : %d\n", mask);	
	  printf("TARGET IP: %s\n", inet_ntoa(target_ip));
	  printf("IsagDD SCAN  %s >> JUST SCANNING WORKING \n\n", VERSION);
	}

	sprintf(sbuf,"%s %s",mstream_scmd,mstream_spass);

	target_host = ntohl(target_ip.s_addr);
	target_host &= MaskBits[mask];

	target_ip.s_addr = htonl(target_host);

	if((pid = fork()) < 0) {
		perror("CAN NOT FORK");
		exit(1);
	}

	/* CHILD SIDE WAIT FOR REPLY FROM RETURN PACKET */
	if (pid == 0)
		listener_mstream();

	sleep(1);

	/* PING LOOP HERE */
	
	while (num_hosts) {
	  if (mask != 32) {
	    target_host ++;
	  }
	  target_ip.s_addr = htonl(target_host);

	  num_hosts--;

	  if(vflg)
	    printf("PROBING IP ADDRESS %s\n", inet_ntoa(target_ip));
	  
/******************************************************/
			/* MSTREAM SCAN CHECK HERE */
			bzero((char *) &usa, sizeof(usa));
			usa.sin_family = AF_INET;
			usa.sin_addr.s_addr = target_ip.s_addr;
/*mstream_dstport*/
			usa.sin_port = htons(mstream_dstport);

			if (dflg)
				fprintf(stderr,"SENDING UDP TO :>> %s\tPORT :>> %d\n",
/*mstream_dstport*/
					inet_ntoa(usa.sin_addr), mstream_dstport);
			if ((usock = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
				perror("CAN NOT OPEN UDP SOCKET");
				exit(1);
			}

			i = sendto(usock,sbuf,strlen(sbuf), 0,
				(struct sockaddr *)&usa,
				sizeof(usa));

			if (i < 0) {
				char ebuf[BS];
				sprintf(ebuf,"SEND TO :>> UDP  %s\tPORT :>> %d\n",
/*mstream_dstport*/
					inet_ntoa(usa.sin_addr),mstream_dstport);
				perror(ebuf);
				continue;/*
				break;*/
			}
			close(usock);
/******************************************************/

			usleep(sleepytime);
		}

	/* WAIT LATE RESPONSE */
	if (dflg)
		fprintf(stderr,"WAITING  %d SECONDS FOR (Mstream) LATE RESPONSES.\n",
			bigsleep);
	sleep(bigsleep);

	/* SHUTDOWN WAIT LISTEN IF FAIL AND EXIT */
	(void)kill(pid, SIGHUP);

    printf("<------------------------------>\n");
	printf("<     END MSTREAM SCAN HERE    >\n");
    printf("<------------------------------>\n");

/*************************************/
/****    end mstream scan here    ****/
/*************************************/
/*************************************/
/****   start tfn (2k) scan here  ****/
/*************************************/
    printf("<------------------------------>\n");
	printf("<   START TFN (2K) SCAN HERE   >\n");
    printf("<------------------------------>\n");

/**** start change ****/
	optind = count_optind;
	mask = temp_mask;
/**** end change ****/
		 
	result = inet_aton(argv[optind], &target_ip);

	if (result == 0) {
	  fprintf(stderr, "%s: NO IP ADDRESS : %s\n", argv[0],
		  argv[optind]);
	  exit(-1);
	}

	if (mask < 16) {
	  fprintf(stderr, "SCAN ERROR\n");
	  exit(-1);
	}

	num_hosts = NumHosts[mask];

	if (num_hosts == 0) {
	  fprintf(stderr, "CAN NOT SCAN :>> /%d.  EXIT PROGRAM\n", mask);
	  exit(-1);
	}
	
	if(vflg) {
	  printf("MASK : %d\n", mask);	
	  printf("TARGET IP: %s\n", inet_ntoa(target_ip));
	  printf("IsagDD SCAN  %s >> JUST SCANNING WORKING \n\n", VERSION);
	}
/*
	sprintf(sbuf,"%s %s",trinoo_scmd,trinoo_spass);
*/
	target_host = ntohl(target_ip.s_addr);
	target_host &= MaskBits[mask];

	target_ip.s_addr = htonl(target_host);

	if((pid = fork()) < 0) {
		perror("CAN NOT FORK");
		exit(1);
	}

	/* CHILD SIDE WAIT FOR REPLY FROM RETURN PACKET */
	if (pid == 0)
		listener_tfn();

	sleep(1);
	/* ICMP SOCKET */
	if((isock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) {
		perror("CAN NOT OPEN RAW ICMP PACKET");
		exit(1);
	}

	/* PING LOOP HERE */
	
	while (num_hosts) {
	  if (mask != 32) {
	    target_host ++;
	  }
	  target_ip.s_addr = htonl(target_host);

	  num_hosts--;

	  if(vflg)
	    printf("PROBING IP ADDRESS %s\n", inet_ntoa(target_ip));
	  
			bzero(buf, sizeof(struct icmp) +
				sizeof(stach_gagstr));
			memcpy(buf + sizeof(struct icmp), stach_gagstr,
				sizeof(stach_gagstr));

			/* SCAN STACHELDRAHT CHECK HERE */

			icmpi->icmp_type = 0;
			icmpi->icmp_hun.ih_idseq.icd_id =
				htons(stach_test);
			icmpi->icmp_cksum = ip_sum((u_short *)icmpi,
				sizeof(struct icmp) + sizeof(stach_gagstr));

			bzero((char *) &isa, sizeof(isa));
			isa.sin_family = AF_INET;
			isa.sin_addr.s_addr = target_ip.s_addr;

			if(dflg)
/*				fprintf(stderr,"SENDING ICMP TO :>>  %s\n",
					inet_ntoa(isa.sin_addr));
*/
			i = sendto(isock,buf,
				sizeof(struct icmp)+sizeof(stach_gagstr),0,
				(struct sockaddr *)&isa, sizeof(isa));

			if (i < 0) {
				char ebuf[BS];
/*				sprintf(ebuf,"SEND TO :>> ICMP %s",
					inet_ntoa(isa.sin_addr));
*/				perror(ebuf);
				continue;/*
				break;*/
			}

/******************************************************/
/* tfn */
			/* TFN SCAN CHECK HERE */
/*			bzero(buf, sizeof(struct icmp) + sizeof(stach_gagstr));
*/			bzero(buf, sizeof(struct icmp) + sizeof(tfn_gagstr));
			
			if(dflg)
				fprintf(stderr,"SENDING TFN ICMP TO :>> %s\n",
					inet_ntoa(isa.sin_addr));
			icmpi->icmp_type = ICMP_ECHOREPLY;
			icmpi->icmp_code= icmpi->icmp_seq = 0;
			icmpi->icmp_id = htons(tfn_test);
			icmpi->icmp_cksum = ip_sum((u_short *)icmpi, 
						sizeof(struct icmp));
			i = sendto(isock, buf, sizeof(struct icmp), 0, 
				   (struct sockaddr *)&isa, sizeof(isa));
			if(i != sizeof(struct icmp)){
				perror("Error sending full tfn packet\n");
				break;
			}
/******************************************************/

			usleep(sleepytime);
		}
	(void)close(isock);


	/* WAIT LATE RESPONSE */
	if (dflg)
		fprintf(stderr,"WAITING  %d SECONDS FOR LATE RESPONSES.\n",
			bigsleep);
	sleep(bigsleep);

	/* SHUTDOWN WAIT LISTEN IF FAIL AND EXIT */
	(void)kill(pid, SIGHUP);

    printf("<------------------------------>\n");
	printf("<    END TFN (2K) SCAN HERE    >\n");
    printf("<------------------------------>\n");

/*************************************/
/****   end tfn (2k) scan here    ****/
/*************************************/
/*****************************************/
/****   start stacheldraht scan here  ****/
/*****************************************/
    printf("<------------------------------>\n");
	printf("< START STACHELDRAHT SCAN HERE >\n");
    printf("<------------------------------>\n");

/**** start change ****/
	optind = count_optind;
	mask = temp_mask;
/**** end change ****/
		 
	result = inet_aton(argv[optind], &target_ip);

	if (result == 0) {
	  fprintf(stderr, "%s: NO IP ADDRESS : %s\n", argv[0],
		  argv[optind]);
	  exit(-1);
	}

	if (mask < 16) {
	  fprintf(stderr, "SCAN ERROR\n");
	  exit(-1);
	}

	num_hosts = NumHosts[mask];

	if (num_hosts == 0) {
	  fprintf(stderr, "CAN NOT SCAN :>> /%d.  EXIT PROGRAM\n", mask);
	  exit(-1);
	}
	
	if(vflg) {
	  printf("MASK : %d\n", mask);	
	  printf("TARGET IP: %s\n", inet_ntoa(target_ip));
	  printf("IsagDD SCAN  %s >> JUST SCANNING WORKING \n\n", VERSION);
	}
/*
	sprintf(sbuf,"%s %s",trinoo_scmd,trinoo_spass);
*/
	target_host = ntohl(target_ip.s_addr);
	target_host &= MaskBits[mask];

	target_ip.s_addr = htonl(target_host);

	if((pid = fork()) < 0) {
		perror("CAN NOT FORK");
		exit(1);
	}

	/* CHILD SIDE WAIT FOR REPLY FROM RETURN PACKET */
	if (pid == 0)
		listener_stacheldraht();

	sleep(1);
	/* ICMP SOCKET */
	if((isock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) {
		perror("CAN NOT OPEN RAW ICMP PACKET");
		exit(1);
	}

	/* PING LOOP HERE */
	
	while (num_hosts) {
	  if (mask != 32) {
	    target_host ++;
	  }
	  target_ip.s_addr = htonl(target_host);

	  num_hosts--;

	  if(vflg)
	    printf("PROBING IP ADDRESS %s\n", inet_ntoa(target_ip));
	  
			bzero(buf, sizeof(struct icmp) +
				sizeof(stach_gagstr));
			memcpy(buf + sizeof(struct icmp), stach_gagstr,
				sizeof(stach_gagstr));

			/* SCAN STACHELDRAHT CHECK HERE */

			icmpi->icmp_type = 0;
			icmpi->icmp_hun.ih_idseq.icd_id =
				htons(stach_test);
			icmpi->icmp_cksum = ip_sum((u_short *)icmpi,
				sizeof(struct icmp) + sizeof(stach_gagstr));

			bzero((char *) &isa, sizeof(isa));
			isa.sin_family = AF_INET;
			isa.sin_addr.s_addr = target_ip.s_addr;

			if(dflg)
				fprintf(stderr,"SENDING ICMP TO :>>  %s\n",
					inet_ntoa(isa.sin_addr));

			i = sendto(isock,buf,
				sizeof(struct icmp)+sizeof(stach_gagstr),0,
				(struct sockaddr *)&isa, sizeof(isa));

			if (i < 0) {
				char ebuf[BS];
				sprintf(ebuf,"SEND TO :>> ICMP %s",
					inet_ntoa(isa.sin_addr));
				perror(ebuf);
				continue;/*
				break;*/
			}

/******************************************************/
/* tfn */
			/* TFN SCAN CHECK HERE */
/*			bzero(buf, sizeof(struct icmp) + sizeof(stach_gagstr));
*/			bzero(buf, sizeof(struct icmp) + sizeof(tfn_gagstr));
			
			if(dflg)
/*
				fprintf(stderr,"SENDING TFN ICMP TO :>> %s\n",
					inet_ntoa(isa.sin_addr));
*/			icmpi->icmp_type = ICMP_ECHOREPLY;
			icmpi->icmp_code= icmpi->icmp_seq = 0;
			icmpi->icmp_id = htons(tfn_test);
			icmpi->icmp_cksum = ip_sum((u_short *)icmpi, 
						sizeof(struct icmp));
			i = sendto(isock, buf, sizeof(struct icmp), 0, 
				   (struct sockaddr *)&isa, sizeof(isa));
			if(i != sizeof(struct icmp)){
/*
				perror("Error sending full tfn packet\n");
*/
				break;
			}
/******************************************************/

			usleep(sleepytime);
		}
	(void)close(isock);


	/* WAIT LATE RESPONSE */
	if (dflg)
		fprintf(stderr,"WAITING  %d SECONDS FOR LATE RESPONSES.\n",
			bigsleep);
	sleep(bigsleep);

	/* SHUTDOWN WAIT LISTEN IF FAIL AND EXIT */
	(void)kill(pid, SIGHUP);

    printf("<------------------------------>\n");
	printf("<  END STACHELDRAHT SCAN HERE  >\n");
    printf("<------------------------------>\n");

/*****************************************/
/****   end stacheldraht scan here    ****/
/*****************************************/
/*****************************************/
/****       start carko scan here     ****/
/*****************************************/
    printf("<------------------------------>\n");
	printf("<    START CARKO SCAN HERE     >\n");
    printf("<------------------------------>\n");

/**** start change ****/
	optind = count_optind;
	mask = temp_mask;
/**** end change ****/
		 
	result = inet_aton(argv[optind], &target_ip);

	if (result == 0) {
	  fprintf(stderr, "%s: NO IP ADDRESS : %s\n", argv[0],
		  argv[optind]);
	  exit(-1);
	}

	if (mask < 16) {
	  fprintf(stderr, "SCAN ERROR\n");
	  exit(-1);
	}

	num_hosts = NumHosts[mask];

	if (num_hosts == 0) {
	  fprintf(stderr, "CAN NOT SCAN :>> /%d.  EXIT PROGRAM\n", mask);
	  exit(-1);
	}
	
	if(vflg) {
	  printf("MASK : %d\n", mask);	
	  printf("TARGET IP: %s\n", inet_ntoa(target_ip));
	  printf("IsagDD SCAN  %s >> JUST SCANNING WORKING \n\n", VERSION);
	}
/*
	sprintf(sbuf,"%s %s",trinoo_scmd,trinoo_spass);
*/
	target_host = ntohl(target_ip.s_addr);
	target_host &= MaskBits[mask];

	target_ip.s_addr = htonl(target_host);

	if((pid = fork()) < 0) {
		perror("CAN NOT FORK");
		exit(1);
	}

	/* CHILD SIDE WAIT FOR REPLY FROM RETURN PACKET */
	if (pid == 0)
		listener_carko();

	sleep(1);
	/* ICMP SOCKET */
	if((isock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) {
		perror("CAN NOT OPEN RAW ICMP PACKET");
		exit(1);
	}

	/* PING LOOP HERE */
	
	while (num_hosts) {
	  if (mask != 32) {
	    target_host ++;
	  }
	  target_ip.s_addr = htonl(target_host);

	  num_hosts--;

	  if(vflg)
	    printf("PROBING IP ADDRESS %s\n", inet_ntoa(target_ip));
	  
			bzero(buf, sizeof(struct icmp) +
				sizeof(carko_gagstr));
			memcpy(buf + sizeof(struct icmp), stach_gagstr,
				sizeof(carko_gagstr));

			/* SCAN CARKO CHECK HERE */

			icmpi->icmp_type = 0;
			icmpi->icmp_hun.ih_idseq.icd_id =
				htons(carko_test);
			icmpi->icmp_cksum = ip_sum((u_short *)icmpi,
				sizeof(struct icmp) + sizeof(carko_gagstr));

			bzero((char *) &isa, sizeof(isa));
			isa.sin_family = AF_INET;
			isa.sin_addr.s_addr = target_ip.s_addr;

			if(dflg)
				fprintf(stderr,"SENDING ICMP TO :>>  %s\n",
					inet_ntoa(isa.sin_addr));

			i = sendto(isock,buf,
				sizeof(struct icmp)+sizeof(carko_gagstr),0,
				(struct sockaddr *)&isa, sizeof(isa));

			if (i < 0) {
				char ebuf[BS];
				sprintf(ebuf,"SEND TO :>> ICMP %s",
					inet_ntoa(isa.sin_addr));
				perror(ebuf);
				continue;/*
				break;*/
			}

/******************************************************/
/* tfn */
			/* TFN SCAN CHECK HERE */
/*			bzero(buf, sizeof(struct icmp) + sizeof(stach_gagstr));
*/			bzero(buf, sizeof(struct icmp) + sizeof(tfn_gagstr));
			
			if(dflg)
/*
				fprintf(stderr,"SENDING TFN ICMP TO :>> %s\n",
					inet_ntoa(isa.sin_addr));
*/			icmpi->icmp_type = ICMP_ECHOREPLY;
			icmpi->icmp_code= icmpi->icmp_seq = 0;
			icmpi->icmp_id = htons(tfn_test);
			icmpi->icmp_cksum = ip_sum((u_short *)icmpi, 
						sizeof(struct icmp));
			i = sendto(isock, buf, sizeof(struct icmp), 0, 
				   (struct sockaddr *)&isa, sizeof(isa));
			if(i != sizeof(struct icmp)){
/*
				perror("Error sending full tfn packet\n");
*/
				break;
			}
/******************************************************/

			usleep(sleepytime);
		}
	(void)close(isock);


	/* WAIT LATE RESPONSE */
	if (dflg)
		fprintf(stderr,"WAITING  %d SECONDS FOR LATE RESPONSES.\n",
			bigsleep);
	sleep(bigsleep);

	/* SHUTDOWN WAIT LISTEN IF FAIL AND EXIT */
	(void)kill(pid, SIGHUP);

    printf("<------------------------------>\n");
	printf("<      END CARKO SCAN HERE     >\n");
    printf("<------------------------------>\n");

/*****************************************/
/****        end carko scan here      ****/
/*****************************************/
/**** start ShowEndTimes ****/
	ShowEndTimes();

/****  end ShowEndTimes ****/
/**** start PrintShowTimes ****/
/*	PrintShowTimes();
*/
/****  end PrintShowTimes ****/

	exit(0);
}
/***************************************************/
/****             end main here                 ****/
/***************************************************/

/***************************************************/
/****        start  listener_trinoo             ****/
/***************************************************/

static	void	listener_trinoo()
{
	int             isock, usock, winusock;
	int             i, len, winlen;
	fd_set          fdset;
	char		buf[BS];
	char		rcmd[BS], filler[BS], rpass[BS];
	struct timeval  timi;
	struct icmppkt_t
			ipacket;
	struct udppkt_t
			upacket, winupacket;
	struct sockaddr_in
			sa, winsa, from, winfrom;

	/* CHILD LISTENER PROCESS COME IN */

/********************************************************/
/* trinoo */
	if ((usock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &sa, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
/*trinoo_rctport*/
	sa.sin_port = htons(trinoo_rctport);

	if (bind(usock, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
  
	while (1) {
		/* IF EXIT BY PARENT OR DEATH */

		if(getppid() == 1)
			exit(0);

		FD_ZERO(&fdset);
//		FD_SET(isock, &fdset);
		FD_SET(usock, &fdset);
//		FD_SET(winusock, &fdset);
		timi.tv_sec = 1;
		timi.tv_usec = 0;
		select(FD_SETSIZE, &fdset, NULL, NULL, &timi);
		usleep(100);


/********************************************************/
/* trinoo */
		if (FD_ISSET (usock, &fdset)) {

			/* READ UDP LISTEN SOCKET */

			memset((void *) &upacket, 0, sizeof(struct udppkt_t));
			len = sizeof(from);
#if 1
			if ((i = recvfrom(usock, buf, BS, 0,
				(struct sockaddr *) &from, &len)) < 0) {
				perror("recvfrom");
				continue;
			}
#else
			i = read (usock, (char *) buf, BS) -
				(sizeof (struct ip) + sizeof (struct udphdr));
#endif
			sa.sin_addr.s_addr = upacket.ipi.ip_src.s_addr;
			if(dflg)
				fprintf(stderr,
					"LISTEN UDP PACKET ON PORT :>> %s\n",
					trinoo_rctport);

			/* TRINOO SCAN CHECK HERE */

			if (strstr(buf,trinoo_echostr)) { 
				printf("RECEIVE :>> '%s' FROM :>> %s",
					trinoo_echostr,
					inet_ntoa(from.sin_addr));
				printf(" >>>> SCAN FOUND TRINOO AGENT\n");
			}
			else {
				printf("UNEXPECT UDP PACKET ON PORT :>> %d FROM :>> %s\n",
					trinoo_rctport, inet_ntoa(from.sin_addr));
			}
		}
/********************************************************/

	} /* end while*/
}
/***************************************************/
/****          end  listener_trinoo             ****/
/***************************************************/

/***************************************************/
/****        start  listener_wintrinoo          ****/
/***************************************************/

static	void	listener_wintrinoo()
{
	int             isock, usock, winusock;
	int             i, len, winlen;
	fd_set          fdset;
	char		buf[BS];
	char		rcmd[BS], filler[BS], rpass[BS];
	struct timeval  timi;
	struct icmppkt_t
			ipacket;
	struct udppkt_t
			upacket, winupacket;
	struct sockaddr_in
			sa, winsa, from, winfrom;

	/* CHILD LISTENER PROCESS COME IN */

/********************************************************/
/* wintrinoo */
	if ((usock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &sa, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
/*wintrinoo_rctport*/
	sa.sin_port = htons(wintrinoo_rctport);

	if (bind(usock, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
  
	while (1) {
		/* IF EXIT BY PARENT OR DEATH */

		if(getppid() == 1)
			exit(0);

		FD_ZERO(&fdset);
//		FD_SET(isock, &fdset);
		FD_SET(usock, &fdset);
//		FD_SET(winusock, &fdset);
		timi.tv_sec = 1;
		timi.tv_usec = 0;
		select(FD_SETSIZE, &fdset, NULL, NULL, &timi);
		usleep(100);


/********************************************************/
/* wintrinoo */
		if (FD_ISSET (usock, &fdset)) {

			/* READ UDP LISTEN SOCKET */

			memset((void *) &upacket, 0, sizeof(struct udppkt_t));
			len = sizeof(from);
#if 1
			if ((i = recvfrom(usock, buf, BS, 0,
				(struct sockaddr *) &from, &len)) < 0) {
				perror("recvfrom");
				continue;
			}
#else
			i = read (usock, (char *) buf, BS) -
				(sizeof (struct ip) + sizeof (struct udphdr));
#endif
			sa.sin_addr.s_addr = upacket.ipi.ip_src.s_addr;
			if(dflg)
				fprintf(stderr,
					"LISTEN UDP PACKET ON PORT :>> %s\n",
					wintrinoo_rctport);

			/* WINTRINOO SCAN CHECK HERE */

			if (strstr(buf,wintrinoo_echostr)) { 
				printf("RECEIVE :>> '%s' FROM :>> %s",
					wintrinoo_echostr,
					inet_ntoa(from.sin_addr));
				printf(" >>>> SCAN FOUND WINTRINOO AGENT\n");
			}
			else {
				printf("UNEXPECT UDP PACKET ON PORT :>> %d FROM :>> %s\n",
					wintrinoo_rctport, inet_ntoa(from.sin_addr));
			}
		}
/********************************************************/

	} /* end while*/
}
/***************************************************/
/****          end  listener_wintrinoo          ****/
/***************************************************/
/***************************************************/
/****        start  listener_mstream            ****/
/***************************************************/

static	void	listener_mstream()
{
	int             isock, usock, winusock;
	int             i, len, winlen;
	fd_set          fdset;
	char		buf[BS];
	char		rcmd[BS], filler[BS], rpass[BS];
	struct timeval  timi;
	struct icmppkt_t
			ipacket;
	struct udppkt_t
			upacket, winupacket;
	struct sockaddr_in
			sa, winsa, from, winfrom;

	/* CHILD LISTENER PROCESS COME IN */

/********************************************************/
/* mstream */
	if ((usock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &sa, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
/*mstream_rctport*/
	sa.sin_port = htons(mstream_rctport);

	if (bind(usock, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
  
	while (1) {
		/* IF EXIT BY PARENT OR DEATH */

		if(getppid() == 1)
			exit(0);

		FD_ZERO(&fdset);
//		FD_SET(isock, &fdset);
		FD_SET(usock, &fdset);
//		FD_SET(winusock, &fdset);
		timi.tv_sec = 1;
		timi.tv_usec = 0;
		select(FD_SETSIZE, &fdset, NULL, NULL, &timi);
		usleep(100);


/********************************************************/
/* mstream */
		if (FD_ISSET (usock, &fdset)) {

			/* READ UDP LISTEN SOCKET */

			memset((void *) &upacket, 0, sizeof(struct udppkt_t));
			len = sizeof(from);
#if 1
			if ((i = recvfrom(usock, buf, BS, 0,
				(struct sockaddr *) &from, &len)) < 0) {
				perror("recvfrom");
				continue;
			}
#else
			i = read (usock, (char *) buf, BS) -
				(sizeof (struct ip) + sizeof (struct udphdr));
#endif
			sa.sin_addr.s_addr = upacket.ipi.ip_src.s_addr;
			if(dflg)
				fprintf(stderr,
					"LISTEN UDP PACKET ON PORT :>> %s\n",
					mstream_rctport);

			/* MSTREAM SCAN CHECK HERE */

			if (strstr(buf,mstream_echostr)) { 
				printf("RECEIVE :>> '%s' FROM :>> %s",
					mstream_echostr,
					inet_ntoa(from.sin_addr));
				printf(" >>>> SCAN FOUND MSTREAM AGENT(SERVER)\n");
			}
			else {
				printf("UNEXPECT UDP PACKET ON PORT :>> %d FROM :>> %s\n",
					mstream_rctport, inet_ntoa(from.sin_addr));
			}
		}
/********************************************************/

	} /* end while*/
}
/***************************************************/
/****          end  listener_mstream            ****/
/***************************************************/
/***************************************************/
/****          start  listener_tfn              ****/
/***************************************************/
static	void	listener_tfn()
{
	int             isock, usock, winusock;
	int             i, len, winlen;
	fd_set          fdset;
	char		buf[BS];
	char		rcmd[BS], filler[BS], rpass[BS];
	struct timeval  timi;
	struct icmppkt_t
			ipacket;
	struct udppkt_t
			upacket, winupacket;
	struct sockaddr_in
			sa, winsa, from, winfrom;

	/* CHILD LISTENER PROCESS COME IN */

	if ((isock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) {
		perror("CAN NOT OPEN RAW ICMP SOCKET");
		exit(1);
	}
/********************************************************/
/* trinoo */
	if ((usock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &sa, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
/*trinoo_rctport*/
	sa.sin_port = htons(trinoo_rctport);

	if (bind(usock, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
/********************************************************/
/* wintrinoo */
	if ((winusock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &winsa, sizeof(winsa));
	winsa.sin_family = AF_INET;
	winsa.sin_addr.s_addr = INADDR_ANY;
/*wintrinoo_rctport*/
	winsa.sin_port = htons(wintrinoo_rctport);

	if (bind(winusock, (struct sockaddr *)&winsa, sizeof(winsa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
  
	while (1) {
		/* IF EXIT BY PARENT OR DEATH */

		if(getppid() == 1)
			exit(0);

		FD_ZERO(&fdset);
		FD_SET(isock, &fdset);
		FD_SET(usock, &fdset);
		FD_SET(winusock, &fdset);
		timi.tv_sec = 1;
		timi.tv_usec = 0;
		select(FD_SETSIZE, &fdset, NULL, NULL, &timi);
		usleep(100);

		/*CHECK ICMP COME IN HERE (TFN,STACHELDRAHT)*/
		if (FD_ISSET(isock, &fdset)) {

			/* READ ICMP LISTEN SOCKET */

			memset((void *) &ipacket, 0, sizeof(struct icmppkt_t));
			i = read (isock, (char *) &ipacket, BS) -
				(sizeof (struct ip) + sizeof (struct icmp));
			sa.sin_addr.s_addr = ipacket.ipi.ip_src.s_addr;
			if(dflg)
				fprintf(stderr,"LISTENER ICMP PACKET\n");

			/* STACHELDRAHT SCAN CHECK HERE */

			if ((ipacket.icmpi.icmp_type == ICMP_ECHOREPLY) &&
		 	   (ntohs(ipacket.icmpi.icmp_hun.ih_idseq.icd_id)
				== stach_echo)) {
				if (strstr(ipacket.buffer, stach_echostr)) {
/*
					printf("RECEIVE :>> '%s' FROM :>> %s",
						stach_echostr,
						inet_ntoa(sa.sin_addr));
					printf(" >>>>  SCAN FOUND STACHELDRAHT AGENT\n");
*/				}
				else {
/*					printf("UNEXPECT ICMP PACKET FROM :>>  %s\n",
						inet_ntoa(sa.sin_addr));
*/				}
			}

/********************************************************/
/* tfn */
			/* TFN SCAN CHECK HERE */
			if ((ipacket.icmpi.icmp_type == ICMP_ECHOREPLY) &&
			   (ntohs(ipacket.icmpi.icmp_hun.ih_idseq.icd_id) == 
				tfn_reply)) {

				printf("RECEIVE TFN(TFN2K) REPLY FROM :>>  %s",
 					inet_ntoa(sa.sin_addr));
				printf(" >>>> SCAN FOUND TFN AGENT\n");
			}
/********************************************************/
			
		}/*END CHECK ICMP COME IN HERE*/


	} /* end while*/
}

/***************************************************/
/****           end  listener_tfn               ****/
/***************************************************/
/***************************************************/
/****       start  listener_stacheldraht        ****/
/***************************************************/
static	void	listener_stacheldraht()
{
	int             isock, usock, winusock;
	int             i, len, winlen;
	fd_set          fdset;
	char		buf[BS];
	char		rcmd[BS], filler[BS], rpass[BS];
	struct timeval  timi;
	struct icmppkt_t
			ipacket;
	struct udppkt_t
			upacket, winupacket;
	struct sockaddr_in
			sa, winsa, from, winfrom;

	/* CHILD LISTENER PROCESS COME IN */

	if ((isock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) {
		perror("CAN NOT OPEN RAW ICMP SOCKET");
		exit(1);
	}
/********************************************************/
/* trinoo */
	if ((usock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &sa, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
/*trinoo_rctport*/
	sa.sin_port = htons(trinoo_rctport);

	if (bind(usock, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
/********************************************************/
/* wintrinoo */
	if ((winusock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &winsa, sizeof(winsa));
	winsa.sin_family = AF_INET;
	winsa.sin_addr.s_addr = INADDR_ANY;
/*wintrinoo_rctport*/
	winsa.sin_port = htons(wintrinoo_rctport);

	if (bind(winusock, (struct sockaddr *)&winsa, sizeof(winsa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
  
	while (1) {
		/* IF EXIT BY PARENT OR DEATH */

		if(getppid() == 1)
			exit(0);

		FD_ZERO(&fdset);
		FD_SET(isock, &fdset);
		FD_SET(usock, &fdset);
		FD_SET(winusock, &fdset);
		timi.tv_sec = 1;
		timi.tv_usec = 0;
		select(FD_SETSIZE, &fdset, NULL, NULL, &timi);
		usleep(100);

		/*CHECK ICMP COME IN HERE (TFN,STACHELDRAHT)*/
		if (FD_ISSET(isock, &fdset)) {

			/* READ ICMP LISTEN SOCKET */

			memset((void *) &ipacket, 0, sizeof(struct icmppkt_t));
			i = read (isock, (char *) &ipacket, BS) -
				(sizeof (struct ip) + sizeof (struct icmp));
			sa.sin_addr.s_addr = ipacket.ipi.ip_src.s_addr;
			if(dflg)
				fprintf(stderr,"LISTENER ICMP PACKET\n");

			/* STACHELDRAHT SCAN CHECK HERE */

			if ((ipacket.icmpi.icmp_type == ICMP_ECHOREPLY) &&
		 	   (ntohs(ipacket.icmpi.icmp_hun.ih_idseq.icd_id)
				== stach_echo)) {
				if (strstr(ipacket.buffer, stach_echostr)) {

					printf("RECEIVE :>> '%s' FROM :>> %s",
						stach_echostr,
						inet_ntoa(sa.sin_addr));
					printf(" >>>>  SCAN FOUND STACHELDRAHT AGENT\n");
				}
				else {
					printf("UNEXPECT ICMP PACKET FROM :>>  %s\n",
						inet_ntoa(sa.sin_addr));
				}
			}

/********************************************************/
/* tfn */
			/* TFN SCAN CHECK HERE */
			if ((ipacket.icmpi.icmp_type == ICMP_ECHOREPLY) &&
			   (ntohs(ipacket.icmpi.icmp_hun.ih_idseq.icd_id) == 
				tfn_reply)) {
/*
				printf("RECEIVE TFN(TFN2K) REPLY FROM :>>  %s",
 					inet_ntoa(sa.sin_addr));
				printf(" >>>> SCAN FOUND TFN AGENT\n");
*/			}
/********************************************************/
			
		}/*END CHECK ICMP COME IN HERE*/


	} /* end while*/
}

/***************************************************/
/****        end  listener_stacheldraht         ****/
/***************************************************/
/***************************************************/
/****          start listener_carko             ****/
/***************************************************/
static	void	listener_carko()
{
	int             isock, usock, winusock;
	int             i, len, winlen;
	fd_set          fdset;
	char		buf[BS];
	char		rcmd[BS], filler[BS], rpass[BS];
	struct timeval  timi;
	struct icmppkt_t
			ipacket;
	struct udppkt_t
			upacket, winupacket;
	struct sockaddr_in
			sa, winsa, from, winfrom;

	/* CHILD LISTENER PROCESS COME IN */

	if ((isock = socket(AF_INET, SOCK_RAW, IPPROTO_ICMP)) < 0) {
		perror("CAN NOT OPEN RAW ICMP SOCKET");
		exit(1);
	}
/********************************************************/
/* trinoo */
	if ((usock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &sa, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
/*trinoo_rctport*/
	sa.sin_port = htons(trinoo_rctport);

	if (bind(usock, (struct sockaddr *)&sa, sizeof(sa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
/********************************************************/
/* wintrinoo */
	if ((winusock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		perror("CAN NOT OPEN RAW UDP LISTEN SOCKET");
		exit(1);
	}

	bzero((char *) &winsa, sizeof(winsa));
	winsa.sin_family = AF_INET;
	winsa.sin_addr.s_addr = INADDR_ANY;
/*wintrinoo_rctport*/
	winsa.sin_port = htons(wintrinoo_rctport);

	if (bind(winusock, (struct sockaddr *)&winsa, sizeof(winsa)) < 0) {
		perror("CANNOT BIND TO SOCKET");
		exit(-1);
	}
/********************************************************/
  
	while (1) {
		/* IF EXIT BY PARENT OR DEATH */

		if(getppid() == 1)
			exit(0);

		FD_ZERO(&fdset);
		FD_SET(isock, &fdset);
		FD_SET(usock, &fdset);
		FD_SET(winusock, &fdset);
		timi.tv_sec = 1;
		timi.tv_usec = 0;
		select(FD_SETSIZE, &fdset, NULL, NULL, &timi);
		usleep(100);

		/*CHECK ICMP COME IN HERE (TFN,STACHELDRAHT,CARKO)*/
		if (FD_ISSET(isock, &fdset)) {

			/* READ ICMP LISTEN SOCKET */

			memset((void *) &ipacket, 0, sizeof(struct icmppkt_t));
			i = read (isock, (char *) &ipacket, BS) -
				(sizeof (struct ip) + sizeof (struct icmp));
			sa.sin_addr.s_addr = ipacket.ipi.ip_src.s_addr;
			if(dflg)
				fprintf(stderr,"LISTENER ICMP PACKET\n");

			/* CARKO SCAN CHECK HERE */

			if ((ipacket.icmpi.icmp_type == ICMP_ECHOREPLY) &&
		 	   (ntohs(ipacket.icmpi.icmp_hun.ih_idseq.icd_id)
				== carko_echo)) {
				if (strstr(ipacket.buffer, carko_echostr)) {

					printf("RECEIVE :>> '%s' FROM :>> %s",
						carko_echostr,
						inet_ntoa(sa.sin_addr));
					printf(" >>>>  SCAN FOUND CARKO AGENT\n");
				}
				else {
					printf("UNEXPECT ICMP PACKET FROM :>>  %s\n",
						inet_ntoa(sa.sin_addr));
				}
			}

/********************************************************/
/* tfn */
			/* TFN SCAN CHECK HERE */
			if ((ipacket.icmpi.icmp_type == ICMP_ECHOREPLY) &&
			   (ntohs(ipacket.icmpi.icmp_hun.ih_idseq.icd_id) == 
				tfn_reply)) {
/*
				printf("RECEIVE TFN(TFN2K) REPLY FROM :>>  %s",
 					inet_ntoa(sa.sin_addr));
				printf(" >>>> SCAN FOUND TFN AGENT\n");
*/			}
/********************************************************/
			
		}/*END CHECK ICMP COME IN HERE*/


	} /* end while*/
}

/***************************************************/
/****           end listener_carko              ****/
/***************************************************/


/***************************************************/
/****         start ip_sum (checksum)           ****/
/***************************************************/

static unsigned short
ip_sum(u_short *addr, int len)
{
	register int    nleft = len;
	register u_short *w = addr;
	register int    sum = 0;
	u_short         answer = 0;

	while (nleft > 1) {
		sum += *w++;
		nleft -= 2;
	}
	if (nleft == 1) {
		*(u_char *) (&answer) = *(u_char *) w;
		sum += answer;
	}
	sum = (sum >> 16) + (sum & 0xffff);
	sum += (sum >> 16);
	answer = ~sum;
	return (answer);
}
/***************************************************/
/****           end ip_sum (checksum)           ****/
/***************************************************/


/***************************************************/
/****                start usage                ****/
/***************************************************/

static int
usage()
{
	fprintf(stderr,"USAGE :>> IsagDD [OPTIONS] <TARGET>\n");
	fprintf(stderr,"\tA.B.C.D/mask\n");
	fprintf(stderr,"mask <==> Amount of Host(s) for scan\n");
	fprintf(stderr,"\t16 : 65534 hosts\n");
	fprintf(stderr,"\t17 : 32766 hosts\n");
	fprintf(stderr,"\t18 : 16382 hosts\n");
	fprintf(stderr,"\t19 : 8190  hosts\n");
	fprintf(stderr,"\t20 : 4094  hosts\n");
	fprintf(stderr,"\t21 : 2046  hosts\n");
	fprintf(stderr,"\t22 : 1022  hosts\n");
	fprintf(stderr,"\t23 : 510   hosts\n");
	fprintf(stderr,"\t24 : 254   hosts\n");
	fprintf(stderr,"\t25 : 126   hosts\n");
	fprintf(stderr,"\t26 : 62    hosts\n");
	fprintf(stderr,"\t27 : 30    hosts\n");
	fprintf(stderr,"\t28 : 14    hosts\n");
	fprintf(stderr,"\t29 : 6     hosts\n");
	fprintf(stderr,"\t30 : 2     hosts\n");
	fprintf(stderr,"\t31 : Invalid\n");
	fprintf(stderr,"\t32 : 1     host\n");
	fprintf(stderr,"Options:\n");
	fprintf(stderr,"\t[-T] TIME IN SECOND(S) FOR LATE PACKET\n");
	fprintf(stderr,"\t[-v] VERBOSITY\n");
	fprintf(stderr,"\t[-d] DEBUGGING\n");
	return(1);
}
/***************************************************/
/****                end usage                  ****/
/***************************************************/
/***************************************************/
/****             start ShowStartTimes          ****/
/***************************************************/
static void	ShowStartTimes(){
	(void) time(&lowlevel_time);
	tm_ptr = localtime(&lowlevel_time);
	strftime(timebuf, TBS,"START DATE FOR SCAN AT :>> %A : %B, %d, %Y\n      TIME IS :>> %X %p", tm_ptr);
	printf("\nSTART ISAGDD FOR SCAN DDOS TOOLS \n%s\n", timebuf);	
}
/***************************************************/
/****              end ShowStartTimes           ****/
/***************************************************/
/***************************************************/
/****             start ShowEndTimes            ****/
/***************************************************/
static void	ShowEndTimes(){
	(void) time(&lowlevel_time2);
	tm_ptr2 = localtime(&lowlevel_time2);
	strftime(timebuf2, TBS2,"END DATE FOR SCAN AT :>> %A : %B, %d, %Y\n    TIME IS :>> %X %p", tm_ptr2);
	printf("END ISAGDD FOR SCAN DDOS TOOLS \n%s\n", timebuf2);	
}
/***************************************************/
/****              end ShowEndTimes             ****/
/***************************************************/
/***************************************************/
/****          start PrintShowEndTimes          ****/
/***************************************************/
static void	PrintShowTimes(){
}
/***************************************************/
/****           end PrintShowEndTimes           ****/
/***************************************************/
