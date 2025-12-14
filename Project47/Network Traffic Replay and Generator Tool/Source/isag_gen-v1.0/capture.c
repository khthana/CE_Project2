#include <stdio.h>
#include <pcap.h>

#define LINE_LEN 16
//  define the tcp flags....
#define   TCP_FIN   0x01
#define   TCP_SYN   0x02
#define   TCP_RST   0x04
#define   TCP_PSH   0x08
#define   TCP_ACK   0x10
#define   TCP_URG   0x20
#define   TCP_ACE   0x40
#define   TCP_CWR   0x80


//define header lengths
#define ETHER_LENGTH 14
#define IP_LENGTH    20
#define TCP_LENGTH   20
#define UDP_LENGTH   8
#define ICMP_LENGTH  8
#define IGMP_LENGTH  8
#define ARP_LENGTH   28
#define IGMP_MESG_LENGTH 13


/* prototype of the packet handler */
void packet_handler(u_char *param, const struct pcap_pkthdr *header, const u_char *pkt_data);
void packet_handler2(u_char *param, const struct pcap_pkthdr *header, const u_char *pkt_data);
void dispatcher_handler(u_char *temp1,const struct pcap_pkthdr *header, const u_char *pkt_data);



	// Ethernet Header
	typedef struct eth_header   // 14 bytes
	{
	u_char dmac[6]; //destination mac address
	u_char smac[6]; //source mac address
	u_short type;                 //IP ,ARP , RARP
	}eth_header;
	
	// IPV4 Address
	typedef struct ip_address
	{
	u_char byte1;
	u_char byte2;
	u_char byte3;
	u_char byte4;
	}ip_address;

	// ARP header
	typedef struct arp_header   //28 bytes
	{
	u_short hrd;       //hardware address space=0x0001
	u_short eth_type;  //Ethernet type ....=0x0800
	u_char maclen;     //Length of mac address=6
	u_char iplen;      //Length of ip addres=4
	u_short opcode;    //Request =1 Reply=2 (highbyte)
	u_char smac[6];    //source mac address
	ip_address saddr;  //Source ip address
	u_char dmac[6];    //Destination mac address
	ip_address daddr;  //Destination ip address
	}arp_header ;
	
	typedef arp_header rarp_header;

	
	/* IPv4 header */
    typedef struct ip_header
	{
	u_char  ver_ihl;        // Version (4 bits) + Internet header length (4 bits)
    u_char  tos;            // Type of service 
    u_short tlen;           // Total length 
    u_short identification; // Identification
    u_short flags_fo;       // Flags (3 bits) + Fragment offset (13 bits)
    u_char  ttl;            // Time to live
    u_char  proto;          // Protocol
    u_short crc;            // Header checksum
    ip_address  saddr;      // Source address
    ip_address  daddr;      // Destination address
   // u_int   op_pad;         // Option + Padding
	}ip_header;

	// UDP header
   typedef struct udp_header   //8 bytes
   {
    u_short sport;          // Source port
    u_short dport;          // Destination port
    u_short len;            // Datagram length
    u_short crc;            // Checksum
   }udp_header;

   // TCP header
	typedef struct tcp_header  //20 bytes : default
	{
	u_short sport;      //Source port
	u_short dport;      //Destination port
	u_long seqno;       //Sequence no
	u_long ackno;       //Ack no
	u_char offset;      //Higher level 4 bit indicates data offset
	u_char flag;        //Message flag
					//FIN - 0x01
					//SYN - 0x02
					//RST - 0x04 
					//PUSH- 0x08
					//ACK- 0x10
					//URG- 0x20
					//ACE- 0x40
					//CWR- 0x80

	u_short win;
	u_short checksum;
	u_short uptr;
  	}tcp_header;

	// ICMP Header
	typedef struct icmp_header
	{
	u_char type;
	u_char code;
	u_short checksum;
	u_short id;
	u_short seqno;
	}icmp_header;


	//IGMP version 2 
	typedef struct igmp_header
	{
	u_char type;         //type of igmp message
	u_char restime;      //Response time
	u_short checksum;    //checksum ...
	ip_address groupaddr; //Multicast Group Address
	}igmp_header;
	
	// Structure for storing IGMP messages.
	typedef struct igmp_mesg
	{
	u_char type;
	char mesg[200];
	}igmp_mesg;

	// Structure for storing ICMP messages.
	typedef struct icmp_mesg
	{
	u_char type;
	char mesg[200];
	}icmp_mesg;


	icmp_mesg mesg[]={  { 0, "Echo Reply"},
					{ 3, "Destination Unreachable"},
					{ 4, "Source Quench"},
					{ 5, "Redirect Message"},
					{ 6, "Alternate Host Address"},
					{ 8, "Echo Request"},
					{ 9, "Router Advertisement"},
					{ 10, "Router  Selection"},
					{ 11, "Time Exceeded"},
					{ 12, "Parameter Problem"},
					{ 13, "Timestamp Request"},
					{ 14, "Timestamp Reply"},
					{ 15, "Information Request"},
					{ 16, "Information Reply"},
					{ 17, "Address Mask Request"},
					{ 18, "Address Mask Reply"},
					
				};


igmp_mesg groupmesg[13]={      
		{0x11 ," Group Membership Query."},
		{0x12 ,"IGMPv1 Membership Report." },
		{0x13 ,"DVMRP. "},
		{0x14 ,"PIMv1. "},
		{0x15 ,"Cisco Trace Messages. "},
		{0x16 ,"IGMPv2 Membership Report. "},
		{0x17 ,"IGMPv2 Leave Group." },
		{0x1E ,"Multicast Traceroute Response. "},
		{0x1F ,"Multicast Traceroute. "},
		{0x22 ,"IGMPv3 Membership Report. "},
		{0x24 ,"Multicast Router Advertisement. "},
		{0x25 ,"Multicast Router Solicitation. "},
		{0x26 ,"Multicast Router Termination. "}
				};
int igmp_mesglen=13;	
int count=1;


int readfile(char *file){
	    
	 pcap_if_t *alldevs;
	 pcap_if_t *d;
	 int inum;
	 int i=0;
	 pcap_t *adhandle;
	 char errbuf[PCAP_ERRBUF_SIZE];
	 u_int netmask;
	 char packet_filter[] = "ip and udp";
	 struct bpf_program fcode;	 
	 pcap_t *fp;
	// char errbuf[PCAP_ERRBUF_SIZE];
	    
	    if( strcmp(file,"") == 0){
		    //printf("usage: %s filename", argv[0]);
		    errx("Please Name of file for read \n");
			return -1;
	    }
	    
	    /* Open a capture file */
	    if ( (fp = pcap_open_offline(file, errbuf) ) == NULL)
	    {
		    //fprintf(stderr,"\nError opening dump file\n");
			errx("Error opening dump file\n");
		    return -1;
	    }
	    
	    // read and dispatch packets until EOF is reached
	    
	    pcap_loop(fp, 0, dispatcher_handler, NULL);
	    //printf("count %d \n",count);
	    printf(" ");
	    
	    return 0;
}


void dispatcher_handler(u_char *temp1,const struct pcap_pkthdr *header, const u_char *pkt_data)
{
	u_int i=0;
	struct tm *ltime;
	char timestr[16];
	ip_header *ih;
	udp_header *uh;
	u_int ip_len;
	u_short sport,dport;
	char buffer[500];
	FILE *Display;
	int line;
	int retvalue;	
	tcp_header *th;
	eth_header *eh;
	arp_header *arph;
	igmp_header *igmph;
	icmp_header *icmph;
	char source[20],dest[20];
	int mesglen=16;	
	

	strcpy(buffer,"");
	strcpy(source,"");
	strcpy(dest,"");
//	for (i=1; (i < header->caplen + 1 ) ; i++)
//	{
	/*convert the timestamp to readable format */
	ltime=localtime(&header->ts.tv_sec);
	strftime( timestr, sizeof timestr, "%H:%M:%S", ltime);
	    
	
	/* print pkt timestamp and pkt len */
	printf("%s.%.6d len:%d",timestr, header->ts.tv_usec, header->len);
	//printf("\n\n");
	
	//Get Frame type
	eh=(eth_header*)pkt_data;
	
	if(ntohs(eh->type)==0x0800)  //IP
	{	
		//plist->SetItemText(index,3,"DOD/IP");
		//count_ip++;
		printf(" IP");
	}
	else 
	{	
		if(ntohs(eh->type)==0x0806) //ARP
		{	//plist->SetItemText(index,3,"ARP");
			//count_arp++;
			printf(" ARP");
		}
		else
		{	if(ntohs(eh->type)==0x0026) //STP spanning -tree
			{	
				
				printf(" STP");
			}
			else
			{	if(ntohs(eh->type)==0x012c) //CDP cisco discovery
				{	
					
					printf(" CDP");
				}
				else
				{	if((ntohs(eh->type)==0x002c)||(ntohs(eh->type)==0x0054)||(ntohs(eh->type)==0x00be)||(ntohs(eh->type)==0x00dc)||(ntohs(eh->type)==0x00ca)||(ntohs(eh->type)==0x00c2)||(ntohs(eh->type)==0x00a4)||(ntohs(eh->type)==0x00c0)) //IPX netware
					{	
						
						printf(" IPX");
						}
					else
					{	
							
					printf(" Unknow");
					//continue;
					count = count + 1;
					printf("\n");
					return ;
					}
				}
			}
		}
	}
	
		
	//Handle ARP/RARP frame.......
	if(ntohs(eh->type)==0x0806)
	{
		arph=(arp_header*)(pkt_data+ETHER_LENGTH);
	
		//Get src and destination ip address

		//printf(source,"%d.%d.%d.%d",
		printf(" %d.%d.%d.%d",
				arph->saddr.byte1,
				arph->saddr.byte2,
				arph->saddr.byte3,
				arph->saddr.byte4);

		//printf(dest,"%d.%d.%d.%d",
		printf(" %d.%d.%d.%d",
				arph->daddr.byte1,
				arph->daddr.byte2,
				arph->daddr.byte3,
				arph->daddr.byte4);
	
	
		//Information
		if(ntohs(arph->opcode)==0x0001) printf(" ARP Request frame");
			//sprintf(str,"ARP Request frame");
		if(ntohs(arph->opcode)==0x0002) printf(" ARP Request frame");
			//sprintf(str,"ARP Reply frame");
		if(ntohs(arph->opcode)==0x0003) printf(" ARP Request frame");
			//sprintf(str,"RARP Request frame");
		if(ntohs(arph->opcode)==0x0002) printf(" ARP Reply frame");
			//sprintf(str,"RARP Reply frame");

		
		//plist->SetItemText(index,9,str);
		count = count + 1;
		printf("\n");
		return;	
		//continue;	
	}
	
	/* retireve the position of the ip header */
	ih = (ip_header *) (pkt_data + 14); //length of ethernet header
	    /* retireve the position of the udp header */
	
	

	
	
	/* print ip addresses and udp ports */
	printf(" %d.%d.%d.%d->%d.%d.%d.%d",
			ih->saddr.byte1,
			ih->saddr.byte2,
			ih->saddr.byte3,			
			ih->saddr.byte4,			
			//sport,			
			ih->daddr.byte1,			
			ih->daddr.byte2,			
			ih->daddr.byte3,
			ih->daddr.byte4			
			//dport
			);

		ip_len = (ih->ver_ihl & 0xf) * 4;

	//ip_len=(ih->ver_ihl & 0xf)<<2;
	//printf("proto = %d \n",ih->proto);
	switch(ih->proto)
		{
			
			case 6:  //TCP
			
			printf(" TCP");
			
			th=(tcp_header*)((u_char*)ih+ip_len);

		
			sport=ntohs(th->sport);
			dport=ntohs(th->dport);
		
			printf(" port %d->%d  ",sport,dport);
			
			break;
		

			case 17:  //UDP	
			
			printf(" UDP");
			
			uh = (udp_header *) ((u_char*)ih + ip_len);
		
			//Get the port information
			sport=ntohs(uh->sport);
			dport=ntohs(uh->dport);

			printf(" port %d -> %d  ",sport,dport);
		
			break;		
		
			case 1: //ICMP
			
			icmph=(icmp_header*) ((u_char*)ih+ip_len);
			
			printf(" ICMP");
			
			for( i=0;i<mesglen;i++)
				{
					if(icmph->type==mesg[i].type)
					{
					
					printf(mesg[i].mesg);
					break;
					}
				}
				if(i==mesglen)  //not found 
					printf(" ICMP Unknown Messsge");
				
				
			break;
	
			case 2: //IGMP
			
			printf(" IGMP");
			igmph=(igmp_header*) ((u_char*)ih+ip_len);
			
			
			for(i=0;i<igmp_mesglen;i++)
			{
				if(groupmesg[i].type==igmph->type)
				{
				
				printf(groupmesg[i].mesg);
				break;
				}
			}
			
			//if it is not standard mesg...
			if(i==igmp_mesglen) printf(" Group Specific Message");
			//plist->SetItemText(index,9,"Group Specific Message");
			
			  break;
	

			default:
				//sprintf(str,"%d",ih->proto);
				//plist->SetItemText(index,4,str);
				printf(" %d",ih->proto);
		}

		//printf("kuyyyyyyyyy\n");
		
		if(ntohs(eh->type)==0x0026) //STP spanning -tree
		{	
			
			printf(" Cisco Spanning-tree");
		}
		if(ntohs(eh->type)==0x012c) //CDP cisco discovery
		{	
			
			printf(" Cisco Discovery");
		}
		if((ntohs(eh->type)==0x002c)||(ntohs(eh->type)==0x0054)||(ntohs(eh->type)==0x00be)||(ntohs(eh->type)==0x00dc)||(ntohs(eh->type)==0x00ca)||(ntohs(eh->type)==0x00c2)||(ntohs(eh->type)==0x00a4)||(ntohs(eh->type)==0x00c0)) //IPX netware
		{	
			
			printf(" Novel Netware");
		}	
		
	count = count + 1;
	printf(".\n");
}
		
	
	   
	     	
	

int capture(char *file,char *device)
{
    pcap_if_t *alldevs;
    pcap_if_t *d;
    int inum;
    int i=0;
    pcap_t *adhandle;
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_dumper_t *dumpfile;


    
      
    /* Retrieve the device list */
    if (pcap_findalldevs(&alldevs, errbuf) == -1)
    {
        fprintf(stderr,"Error in pcap_findalldevs: %s\n", errbuf);
        exit(1);
    }
    
   
    /* Open the adapter */
    if ( (adhandle = pcap_open_live(device, // name of the device
                             65536,     // portion of the packet to capture. 
                                        // 65536 grants that the whole packet will be captured on all the MACs.
                             1,         // promiscuous mode
                             1000,      // read timeout
                             errbuf     // error buffer
                             ) ) == NULL)
    {
        fprintf(stderr,"\nUnable to open the adapter. %s is not supported by WinPcap\n");
        /* Free the device list */
        pcap_freealldevs(alldevs);
        return -1;
    }

    printf("Open \n");
	/* Open the dump file */
    dumpfile = pcap_dump_open(adhandle, file);
    if(dumpfile==NULL){
        fprintf(stderr,"\nError opening output file\n");
        return -1;
    }
    
    printf("\nlistening on %s...\n", device);
	printf("EXIT Press Ctrl+z \n"); 
    
    /* At this point, we don't need any more the device list. Free it */
    pcap_freealldevs(alldevs);
    
    /* start the capture */
    pcap_loop(adhandle, 0, packet_handler, (unsigned char *)dumpfile);

    return 0;
}

void CountPacket(int x)
{
	 pcap_if_t *alldevs;
	    pcap_if_t *d;
	    int inum;
	    int i=0;
	    pcap_t *adhandle;
	    char errbuf[PCAP_ERRBUF_SIZE];

	//printf("check1 \n");
	 /* Open the adapter */
    if ( (adhandle = pcap_open_live("eth0", // name of the device
                             65536,     // portion of the packet to capture. 
                                        // 65536 grants that the whole packet will be captured on all the MACs.
                             1,         // promiscuous mode
                             1000,      // read timeout
                             errbuf     // error buffer
                             ) ) == NULL)
			 {
        fprintf(stderr,"\nUnable to open the adapter. %s is not supported by WinPcap\n");
        /* Free the device list */
        pcap_freealldevs(alldevs);
        //return -1;
    }
	
    pcap_loop(adhandle, x, packet_handler2, NULL);

}

/* Callback function invoked by libpcap for every incoming packet */
void packet_handler(u_char *dumpfile, const struct pcap_pkthdr *header, const u_char *pkt_data)
{
    /* save the packet on the dump file */
    pcap_dump(dumpfile, header, pkt_data);
}
void packet_handler2(u_char *param, const struct pcap_pkthdr *header, const u_char *pkt_data)
{
	
}

