/**********************************************************************
* Compile with: -lpcap
* xdcap (# of packets) "filter protocol"
* This program is capture Dos Packet to dos.cap
**********************************************************************/

#include <pcap.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netinet/if_ether.h> 
#include <net/ethernet.h>
#include <netinet/ether.h> 
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>
#include <unistd.h>
#include <netdb.h>

/*-----------------global variable zone-----------------*/
FILE *file_out;
int check=1;
char filter[30];
/*---------------------------end zone-------------------*/



u_int16_t handle_ethernet
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet);

u_int8_t handle_IP
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet);

void handle_icmp
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet);

void handle_tcp
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet);

void handle_udp
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet);

	/* make function in each packets */
void my_callback(u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet)
{
    u_int16_t type_ether = handle_ethernet(args,pkthdr,packet);
    
    if(ntohs(type_ether) == ETHERTYPE_IP)
    {	/* handle IP packet */
    
    u_int8_t type_ip = handle_IP(args,pkthdr,packet);
	if (type_ip == 1)//icmp
	{	
		handle_icmp(args,pkthdr,packet);
	}
	else if (type_ip == 6)//tcp
	{
		handle_tcp(args,pkthdr,packet);
	}
	else if (type_ip == 17)//udp
	{
		handle_udp(args,pkthdr,packet);
	}
	fflush(stdout);
    }
    
}

/*	looking at ethernet headers */
u_int16_t handle_ethernet(u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet)
{
    struct ether_header *eptr;  /* net/ethernet.h */
    eptr = (struct ether_header *) packet;
    return eptr->ether_type;
}

/*	looking at IP headers */
u_int8_t handle_IP(u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet)
{
	struct ip *ipptr;
	ipptr = (struct ip *)(packet + sizeof(struct ether_header));
	
	file_out = fopen("dos.cap","a");

	fprintf(file_out,"$%x ",ntohs(ipptr->ip_id));
	fprintf(file_out,"%s ",inet_ntoa(ipptr->ip_dst));
	fprintf(file_out,"%s ",inet_ntoa(ipptr->ip_src));
	
	fclose(file_out);
	
	return ipptr->ip_p;
}

/*	look at icmp headers*/
void handle_icmp
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet)
{
	struct icmp *icmpptr;
	icmpptr = (struct icmp *)(packet + sizeof(struct ether_header) + sizeof(struct ip));

	file_out = fopen("dos.cap","a");
	
	fprintf(file_out,"%d ",icmpptr->icmp_type);
	fprintf(file_out,"%d \n",icmpptr->icmp_code);

	fclose(file_out);
}

/*	look at tcp headers*/
void handle_tcp
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet)
{
	struct tcphdr *tcpptr;
	tcpptr = (struct tcphdr *)(packet + sizeof(struct ether_header) + sizeof(struct ip));

	file_out = fopen("dos.cap","a");
	
	fprintf(file_out,"%d ",ntohs(tcpptr->source));
	fprintf(file_out,"%d \n",ntohs(tcpptr->dest));

	fclose(file_out);
}


/*	look at udp headers*/
void handle_udp
        (u_char *args,const struct pcap_pkthdr* pkthdr,const u_char*
        packet)
{
	struct udphdr *udpptr;
	udpptr = (struct udphdr *)(packet + sizeof(struct ether_header) + sizeof(struct ip));

	file_out = fopen("dos.cap","a");
	
	fprintf(file_out,"%d ",ntohs(udpptr->source));
	fprintf(file_out,"%d \n",ntohs(udpptr->dest));
	fclose(file_out);
}


void host_to_ip()
{
	char hostname[32], **addrs, hostip[16];
	struct in_addr ip_bytes;
	struct hostent *res;
	
	
	gethostname(hostname, 32);

	res = gethostbyname(hostname);
	memcpy(&ip_bytes, res->h_addr, res->h_length);
	strcat(filter,inet_ntoa(ip_bytes));
}


int main(int argc,char **argv)
{
	
	strcat(filter,"dst ");
	host_to_ip();
	printf("HOST IP :%s\n",filter);	
	if (argc > 1)
	{	
		strcat(filter," && ");
		strcat(filter,argv[1]);
	}

	//start capture
	capturex(filter);

	//end capture and start analysis
	
	return 0;
}


int capturex(char *com)
{ 
    char *dev; 
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_t* descr;
    struct bpf_program fp;      /* hold compiled program     */
    bpf_u_int32 maskp;          /* subnet mask               */
    bpf_u_int32 netp;           /* ip                        */
    u_char* args = NULL;
    
    


    
    /* grab a device to peak into... */
    dev = pcap_lookupdev(errbuf);
    if(dev == NULL)
    { printf("%s\n",errbuf); exit(1); }

    /* ask pcap for the network address and mask of the device */
    pcap_lookupnet(dev,&netp,&maskp,errbuf);

    /* open device for reading. NOTE: defaulting to
     * promiscuous mode*/
    descr = pcap_open_live(dev,BUFSIZ,0,-1,errbuf);
    if(descr == NULL)
    { printf("pcap_open_live(): %s\n",errbuf); exit(1); }


        /* Lets try and compile the program.. non-optimized */
        if(pcap_compile(descr,&fp,com,0,netp) == -1)
        { fprintf(stderr,"Error calling pcap_compile\n"); exit(1); }

        /* set the compiled program as the filter */
        if(pcap_setfilter(descr,&fp) == -1)
        { fprintf(stderr,"Error setting filter\n"); exit(1); }

    	/* ... and loop */
    	pcap_loop(descr,-1,my_callback,args);
	
	
	fprintf(stdout,"\nfinished\n");
    	return 0;
}
