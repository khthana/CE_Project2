#include "libnet.h"


void change_mac(char *mac,int select);



int smurf(void *ptr);
int synflood(void *ptr);
int ip_raw(void *ptr);
int ip_link(void *ptr);
int icmp_unreach(void *ptr);
int icmp_timestamp(void *ptr);
int icmp_timeexceed(void *ptr);
int icmp_redirect(void *ptr);
int icmp_echo_cq(void *ptr);
int udp(void *ptr);
int tcp(void *ptr );
int arp( void *ptr ) ;
void configure_file(char *file);

typedef struct generate{
	char *device;        //all
	int type_link;		 //all
	char *type;			 //icmp arp
	char *src_ip;        //all
	char *src_mac;       //all
	int  src_prt;       //tcp udp
	char *dst_ip;        //all
	char *dst_mac;       //all
	int dst_prt;        //tcp udp
	char *gw_ip;         //icmp redirect 
	char *payload;       //
	u_short payload_s;   //
	int count;           //number
	char *protocol;        //ip link 
	char *amplifier;     //
	int burst;			 //synflood
	int interval;         //synflood	
} Gen;