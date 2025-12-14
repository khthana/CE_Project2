#ifndef NODE
#define NODE

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <time.h>
#include <iostream.h>
#include <netinet/if_ether.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <ctype.h>
#define STD_BUF 256
#define ETH_P_LOOP	0x0060		/* Ethernet Loopback packet	*/
#define ETH_P_ECHO	0x0200		/* Ethernet Echo packet		*/
#define ETH_P_PUP	0x0400		/* Xerox PUP packet		*/
#define ETH_P_IP	0x0800		/* Internet Protocol packet	*/
#define ETH_P_X25	0x0805		/* CCITT X.25			*/
#define ETH_P_ARP	0x0806		/* Address Resolution packet	*/
#define	ETH_P_BPQ	0x08FF		/* G8BPQ AX.25 Ethernet Packet	[ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_DEC       0x6000          /* DEC Assigned proto           */
#define ETH_P_DNA_DL    0x6001          /* DEC DNA Dump/Load            */
#define ETH_P_DNA_RC    0x6002          /* DEC DNA Remote Console       */
#define ETH_P_DNA_RT    0x6003          /* DEC DNA Routing              */
#define ETH_P_LAT       0x6004          /* DEC LAT                      */
#define ETH_P_DIAG      0x6005          /* DEC Diagnostics              */
#define ETH_P_CUST      0x6006          /* DEC Customer use             */
#define ETH_P_SCA       0x6007          /* DEC Systems Comms Arch       */
#define ETH_P_RARP      0x8035		/* Reverse Addr Res packet	*/
#define ETH_P_ATALK	0x809B		/* Appletalk DDP		*/
#define ETH_P_AARP	0x80F3		/* Appletalk AARP		*/
#define ETH_P_IPX	0x8137		/* IPX over DIX			*/
#define ETH_P_IPV6	0x86DD		/* IPv6 over bluebook		*/
#define ETH_P_802_3	0x0001		/* Dummy type for 802.3 frames  */
#define ETH_P_802_2	0x0004		/* 802.2 frames 		*/

struct tuple4
{
	u_int16_t source,dest;
	unsigned long saddr,daddr;
};
class node {
          
			   
            public:
	                    node *next,*last;  //pointer to next node
			    u_int8_t  eth_dhost[ETH_ALEN],eth_shost[ETH_ALEN];	
			    struct in_addr srcip,dstip;      // src and dst ip address
			    struct tuple4 addr;
			    u_short ip_len;			/* total length */
   			    u_short ip_id;			/* identification */
    			    u_short ip_off;	     
			    u_int8_t ip_p;	     
			    u_int16_t eth_type;	
			    int hour;
			    int min;
			    int sec;
			    struct ip *this_iphdr;
			    struct tcphdr *this_tcphdr;
			    struct udphdr *this_udphdr;
	                    struct icmphdr *this_icmphdr;
			    u_int srcport,dstport;  // src and dst port
			    u_char *data;  // captured data
		            u_int ofs;        // current data of ofs
			    u_char *end_data;
			    int len;
			    int all_len;
			    void print_frame();
			     node(){  this_iphdr =NULL;this_tcphdr =NULL;this_udphdr=NULL;this_icmphdr=NULL;data =NULL;};
			   ~node(){    };
				   
	};
	
#endif

