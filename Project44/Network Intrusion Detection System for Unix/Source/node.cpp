#include "node.h"

void node::print_frame()
{		
		printf("%d:%d:%d ",hour ,min,sec );
	   	printf ("%.2x:%.2x:%.2x:%.2x:%.2x:%.2x -> ",
        	        eth_shost[0],eth_shost[1],
       			 eth_shost[2],eth_shost[3],
         		 eth_shost[4],eth_shost[5]);
		 printf ("%.2x:%.2x:%.2x:%.2x:%.2x:%.2x  \n",
        	        eth_dhost[0],eth_dhost[1],
       			 eth_dhost[2],eth_dhost[3],
         		 eth_dhost[4],eth_dhost[5]);		
		            printf ("PROTO:%.4x   ",ntohs(eth_type));
		 switch (ntohs(eth_type))
 			{
 				case ETH_P_LOOP :  
                			 printf ("Ethernet Loopback Packet");
                 			break;
 				case ETH_P_IP :  
                 			printf ("Internet Protocal Packet");
                 			break;
 				case ETH_P_ECHO :  
			                 printf ("Ethernet Echo Packet");
			                 break;
 				case ETH_P_PUP :  
                 			printf ("Xerox PUP Packet");
                 			break;
 				case ETH_P_X25 :  
                 			printf ("CCITT X.25");
                 			break;
 				case ETH_P_ARP :  
                 			printf ("Address Resolution Packet");
                 			break;
 				case ETH_P_BPQ :  
                 			printf ("G8BPQ AX.25 Ethernet Packet");
        			         break;
				 case ETH_P_DEC :  
			                 printf ("DEC Assigned proto");
			                 break;
 				case ETH_P_DNA_DL :  
                 			printf ("DEC DNA Dump/Load");
                 			break;
 				case ETH_P_DNA_RC :  
                 			printf ("DEC DNA Remote Console");
                 			break;
 				case ETH_P_DNA_RT :  
                 			printf ("DEC DNA Routing");
                 			break;
 				case ETH_P_LAT :  
                 			printf ("DEC LAT");
                 			break;
 				case ETH_P_DIAG :  
                 			printf ("DEC Diagnostics");
                 			break;
 				case ETH_P_CUST :  
                 			printf ("DEC Customer use");
                 			break;
 				case ETH_P_SCA :  
                 			printf ("DEC Systems Comms Arch");
                 			break;
 				case ETH_P_RARP :  
                 			printf ("Reverse Addr Res Packet");
                			 break;
 				case ETH_P_ATALK :  
                 			printf ("Appletalk DDP");
                 			break;
 				case ETH_P_AARP :  
                 			printf ("Appletalk AARP");
                 			break;
 				case ETH_P_IPX :  
                 			printf ("IPX over DIX");
                 			break;
 				case ETH_P_IPV6 :  
                 			printf ("IPv6 over bluebook");
                 			break;
 				case ETH_P_802_3 :  
                 			printf ("802.3 Frames");
                 			break;
 				case ETH_P_802_2 :  
                 			printf ("802.2 Frame");
                 			break;
  				default : 
                 			printf ("Unknown Frame");
     				        break;
 		}
		printf("\n");
		char s_ip[INET_ADDRSTRLEN];
	      	char d_ip[INET_ADDRSTRLEN];
	   	inet_ntop(AF_INET,&(srcip.s_addr),s_ip,sizeof(s_ip));
	        inet_ntop(AF_INET,&(dstip.s_addr),d_ip,sizeof(d_ip));		    
 		printf("%s -> %s ",s_ip,d_ip); 
		switch(ip_p)
	   	{
		   case IPPROTO_TCP:
		   		printf("Protocal TCP \n");
		   	    break;
		   case IPPROTO_UDP:
		 	        printf("Protocal UDP \n");
		   	    break;
		   case IPPROTO_ICMP:
	   		        printf("Protocal ICMP \n");
		            break;
		  default: 
				printf("\n");
		            break;
		   }
	 	 printf("ID:%d  Fragment Offset: 0x%.4X ",htons(ip_id),htons(ip_off) & 0x1fff );
		 printf("Length: 0x%.4X ",ntohs(ip_len));
		 if ((htons(ip_off) & 0x4000 ) != 0) {
 		     printf(" [DF]");
 			}
 		if ((htons(ip_off) & 0x2000 ) != 0) {
     			 printf(" [MF]");
 		}
	  /*** print printable contents of the payload ***/
  		u_char *ptr_i;
		printf("\n");
		for ( ptr_i = data; ptr_i < end_data; ptr_i++ )
      			{
				/* if the char is printable, '\n' or '\r' then print it. */
				if ( isprint(*ptr_i) )	printf("%c", *ptr_i);
				else
	  			printf(".");
      			} /* for */

  printf("\n");
  printf("\n\n");
}
