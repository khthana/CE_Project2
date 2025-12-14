#include <stdio.h>
#include "func_gen.h"
#include "tcpreplay.h"
#include "libnet.h"
#include "capture.h"
#include <unistd.h>
#include <time.h>
#include "cidr.h"
#include "list.h"
#include "err.h"
#include "edit_packet.h"
#include "xX.h"

void help(void);
void init_main(void);
void start(void);


extern int include_exclude_mode;
extern CIDR *xX_cidr;
extern LIST *xX_list;
extern CIDRMAP *cidrmap_data1, *cidrmap_data2;
int jo=0;
Replay rep;
Gen gen;

int main(int argc, char *argv[])
{
	
	//int x ;
	char Continue;
	int input;
	int count=0;
	//int delay = 1000000;
	int mode=0;
	char *Format;

	char opt;
	char *type;
	void *xX = NULL;
	int no_martians=0;
	int cmp;
	int show=0;
	
	init_main();
	//start();	
	
	while (( opt = getopt(argc,argv,"123F:i:Tt:s:p:d:P:m:M:g:l:L:c:a:SB:vf:bx:X:e:N:hG:H")) != -1)
	{
		switch(opt)
		{
			
			case '1':
				if (mode != 0) errx(1, "Select Only One Mode");
				mode = 1;

				break;
			
			case '2':
				if (mode != 0) errx(1, "Select Only One Mode");
				mode = 2;

				break;


			case '3':
				if (mode != 0) errx(1, "Select Only One Mode");
				mode = 3;

				break;

			case 'F':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				Format = optarg;
				//printf("%s\n",Format);
				break;


			case 'i':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.device = optarg;
				rep.device = optarg;
				//printf("%s\n",gen.device);
				break;
				
			case 'T':
				gen.type_link = LIBNET_LINK;
				//printf("LIBNET_LINK\n");
				break;

			case 't':				// set time for generate
				//printf("option: mode 2\n");			//needs a value \n");
				gen.type = optarg;
				//printf("%s\n",gen.type);
				break;	
			
			case 's':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.src_ip = optarg;
				//printf("%s\n",gen.src_ip);
				break;	

			case 'p':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.src_prt = atoi(optarg);
				//printf("%d\n",gen.src_prt);
				break;	

			case 'd':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.dst_ip = optarg;
				//printf("%s\n",gen.dst_ip);
				break;	

			case 'P':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.dst_prt = atoi(optarg);
				//printf("%d\n",gen.dst_prt);
				break;	
			
			case 'm':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.src_mac = optarg;
				//printf("%s\n",gen.src_mac);
				break;	
			
			case 'M':				// number of packet
				//printf("option: mode 2\n");			//needs a value \n");
				gen.dst_mac = optarg;
				//printf("%s\n",gen.dst_mac);
				break;	

			case 'G':
				type = optarg;
				//printf("%s\n",type);
				break;
			case 'g':				//generate packet
				//printf("option: mode 1\n");			//%c\n",opt);
				gen.gw_ip = optarg;
				//printf("%s\n",gen.gw_ip);
				break;

			case 'l':				//generate packet
				//printf("option: mode 1\n");			//%c\n",opt);
				gen.payload =  optarg;
				//printf("%s\n",gen.payload);
				break;
			
			case 'L':				//generate packet
				//printf("option: mode 1\n");			//%c\n",opt);
				gen.payload_s = atoi(optarg);
				//printf("%d\n",gen.payload_s);
				break;
			case 'B':
				gen.burst = atoi(optarg);
				break;

			case 'c':				//generate packet
				//printf("option: mode 1\n");			//%c\n",opt);
				gen.count = atoi(optarg);
				//printf("%d\n",gen.count);
				break;

			case 'a':				//generate packet
				//printf("option: mode 1\n");			//%c\n",opt);
				gen.amplifier = optarg;
				//printf("%s\n",gen.amplifier);
				break;

			case 'f':
				//printf("option: file\n");			//%c\n",opt);
				//gen.file = optarg;
				rep.file = optarg;
				//printf("%s\n",rep.file);
				break;
			
			case 'S':
				//printf("option: mode 1\n");			//%c\n",opt);
				rep.speed = 1;
				//printf("replay speed = %d\n",rep.speed);
				break;

			case 'v':
				//printf("option: mode 1\n");			//%c\n",opt);
				//rep.print = atoi(optarg);
				//printf("%s\n",rep.print);
				rep.print = 1;
				break;

			case 'b':              //disable sending martians //
				no_martians = 1;
            break;

			 case 'x':              /* include mode */
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
            break;
        case 'X':              /* exclude mode */
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
            break;

			case 'e':              // rewrite IP's to two end points //
				rep.rewriteip ++;
				//printf("optarg %s \n",optarg);
            if (!parse_endpoints(&cidrmap_data1, &cidrmap_data2, optarg))
                errx(1, "Unable to parse -e");
				//printf("complete e\n");
				//printf("%d \n",rep.rewriteip);*/
            break;

			case 'N':              // rewrite IP addresses using our pseudo-nat //
				//printf("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn\n");
				rep.rewriteip ++;
				rep.nat_interface ++;
				jo = jo + 1;

				//printf("%d \n",rep.nat_interface);
				// first -N is primary nic //
				if (rep.nat_interface == 1) {
					if (! parse_cidr_map(&cidrmap_data1, optarg))
						errx(1, "Invalid primary NAT string");
				} else { // after that, secondary nic //
					if (! parse_cidr_map(&cidrmap_data2, optarg))
						errx(1, "Invalid secondary NAT string");
				}

            break;			

			case 'h':
				help();
				break;

			case 'H':
				show = 1;
				break;
		}
	}

	

		if (mode == 0)
			errx(1, "Must select mode");

		if (show == 1)
		{
			if (mode == 2)
			{			
			if (strcmp(rep.file,"") == 0)
	
				errx(1, "Must specify one or more pcap files to process");
			readfile(rep.file);
			return 0;
			}
		}
	
		if (strcmp(gen.device,"") == 0)
	
				errx(1, "Must specify a primary interface");
	
		


		if (mode ==1)
	
		{
			//printf("Mode 1 ***************\n");
			//printf("%d \n",strcmp(type,"tcp"));
			if ( gen.payload_s <= -1 ) 
			{
				errx(1,"Size of Payload Error: must 0 < payload_s <= 1210");
			}
			
			if ( gen.payload_s >= 1211 )
			{
				errx(1,"Size of Payload Error: must 0 < payload_s <= 1210");
			}

			if ( (cmp=strcmp(type,"")) == 0)
			{
				errx(1, "Select Packet for Generate");
			}
			else if ((cmp=strcmp(type,"arp"))==0)
			{
				//arp=eth0,reply,161.246.5.24,0x010x060x1b0xd50xdd0x7c,161.246.5.5,0xff0xff0xff0xff0xff0xff,5,p5
				
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
					//printf("use -s source ip for gen \n");
				if ((cmp =strcmp(gen.src_mac,"")) == 0)
			
					errx(1, "Must specify source mac");
					//printf("use -s source mac for gen \n");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
					//printf("use -s destination ip for gen \n");
				if ((cmp =strcmp(gen.dst_mac,"")) == 0)
			
					errx(1, "Must specify destination mac");
				if ((cmp =strcmp(gen.type,"")) == 0)
			
					errx(1, "Must specify type of arp");

					//printf("use -s destination mac for gen \n");	
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				arp(&gen);
				return 0;
				
			}

			else if ((cmp = strcmp(type,"tcp"))==0)
			{
				//tcp=eth0,161.246.5.24,40,161.246.5.5,50,kuy,64,4,p400 
			
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
					//printf("use -s source ip for gen \n");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
				if (gen.src_prt== 0)
			
					errx(1, "Must specify source port");
				if (gen.dst_prt == 0)
			
					errx(1, "Must specify destination port");
				if ( !((gen.src_prt > 0) && (gen.src_prt <= 65535)) )
					errx(1, "source port error");
				if ( !((gen.dst_prt > 0) && (gen.dst_prt <= 65535)) )
					errx(1, "destination port error");

					//printf("use -s destination ip for gen \n");
				//if (strcmp(gen.,"") == 0)
			
				//	errx(1, "Must specify destination mac");
					//printf("use -s destination mac for gen \n");	
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				tcp(&gen);
				return 0;

			}
			else if ((cmp = strcmp(type,"udp"))==0)
			{
				//udp=eth0,161.246.5.24,40,161.246.5.5,50,kuy,64,4,p400 
			
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
					//printf("use -s source ip for gen \n");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
				if (gen.src_prt== 0)
			
					errx(1, "Must specify source port");
				if (gen.dst_prt == 0)
			
					errx(1, "Must specify destination port");
				if ( !((gen.src_prt > 0) && (gen.src_prt <= 65535)) )
					errx(1, "source port error");
				if ( !((gen.dst_prt > 0) && (gen.dst_prt <= 65535)) )
					errx(1, "destination port error");
			
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				udp(&gen);
				return 0;

			}
			else if ((cmp = strcmp(type,"icmp_redirect"))==0)
			{
				//icmp_redirect=eth0,161.246.5.24,161.246.5.5,161.246.5.254,5,p100  *******************
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");					
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
				if ((cmp =strcmp(gen.gw_ip,"")) == 0)
			
					errx(1, "Must specify gateway ip");
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				icmp_redirect(&gen);
				return 0;
			}


			else if ((cmp =strcmp(type,"icmp_timeexceed"))==0)
			{
				//icmp_timeexceed=eth0,161.246.5.24,161.246.5.5,5,p100 ***********
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				icmp_timeexceed(&gen);
				return 0;
			}

			else if ((cmp = strcmp(type,"icmp_timestamp"))==0)
			{
				//icmp_timestamp=eth0,161.246.5.24,161.246.5.5,5,p100 *************
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				icmp_timeexceed(&gen);
				return 0;
			}


			else if ((cmp = strcmp(type,"icmp_echo_cq"))==0)
			{
				//icmp_echo_cq=eth0,161.246.5.24,161.246.5.5,project,64,5,p100 ************
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				icmp_echo_cq(&gen);
				return 0;
			}

			else if ((cmp = strcmp(type,"icmp_unreach"))==0)
			{
				//icmp_unreach=eth0,161.246.5.24,161.246.5.5,LIBNET_RAW4,NULL,NULL,50,p100  **********
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
			
				//if (gen.type_link==0 )
				//	errx(1, "Must specify type");

				if ( gen.type_link==LIBNET_LINK )
				{
					if ((cmp =strcmp(gen.src_mac,"")) == 0)
			
						errx(1, "Must specify source mac");
					if ((cmp =strcmp(gen.dst_mac,"")) == 0)
			
						errx(1, "Must specify destination mac");
				}

				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				icmp_unreach(&gen);
				return 0;
			}

			else if ((cmp = strcmp(type,"synflood"))==0)
			{
				//synflood=eth0,192.168.145.8,99,3,2,1,p700
				if ((cmp = strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify target ip");
				if ( !((gen.dst_prt > 0) && (gen.dst_prt < 65535) ) )
					errx(1, "target port error");
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");
				if (gen.burst <= 0)
					errx(1, "Must specify number of burst");
				//if (gen.interval <= 0)
				//	errx(1, "Must specify number of interval");
				synflood(&gen);
				return 0;
			}
		
			else if ((cmp = strcmp(type,"smurf"))==0)
			{
				//smurf=eth0,192.168.0.8,192.168.0.0,5,p400
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify target ip");
				if ((cmp =strcmp(gen.amplifier,""))==0)
					errx(1, "Must specify amplifier ip");
				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				smurf(&gen);
				return 0;

			}
			else if ((cmp = strcmp(type,"ip"))==0)
			{
				//ip=eth0,161.246.5.24,0x010x060x1b0xd50xdd0x7c,161.246.5.5,0xff0xff0xff0xff0xff0xff,LIBNET_LINK,tcp,XXXX,50
				
				//if (gen.type_link==0)
				//	errx(1, "Must specify type");
				if ((cmp =strcmp(gen.src_ip,"")) == 0)
			
					errx(1, "Must specify source ip");
					
				if ((cmp =strcmp(gen.dst_ip,"")) == 0)
			
					errx(1, "Must specify destination ip");
					
				if (gen.type_link==LIBNET_LINK)
				{
					if ((cmp =strcmp(gen.src_mac,"")) == 0)
			
						errx(1, "Must specify source mac");
					
					if ((cmp =strcmp(gen.dst_mac,"")) == 0)
			
						errx(1, "Must specify destination mac");
				}

				if ((cmp =strcmp(gen.protocol,""))==0)
					errx(1, "Must specify protocol");

				if (gen.count <= 0)
					errx(1, "Must specify number of packet");

				if (gen.type_link==LIBNET_LINK )
				{
					ip_link(&gen);
					return 0;
				}
				else if (gen.type_link==LIBNET_RAW4)
				{
					ip_raw(&gen);
					return 0;
				}
			}
			else if ( strcmp(rep.file,"") != 0)

			{
				configure_file(rep.file);
				return 0;

			}else
			{
				errx(1, "Type of packet not match");				
			}
				
		}
	
		else if (mode ==2)
	{
		
			//printf("Mode 2 ***************\n");
			if (strcmp(rep.file,"") == 0)
	
				errx(1, "Must specify one or more pcap files to process");
			if (show == 0)
			{
				capture(rep.file,rep.device);
	
				return 0;
			}
		}
	
		else if (mode ==3)
	{
	
			//printf("Mode 3 ***************\n");
			if (strcmp(rep.file,"") == 0)
	
				errx(1, "Must specify one or more pcap files to process");
		

			//if (rep.speed == 1)
			printf(" \n");
	
			//if (rep.print == 0)
			printf(" \n");
		
			

			tcp_replay(&rep);
			//for (delay ; delay > 0; delay--)
			//{
			//}
	
			return 0;
		

}		
}

void start()
{
	printf("******** ******       ***     ******* ******* ********   *****          ******  ******* ***   **          \n");
	printf("   **    **   **     ** **    **      **         **     **             **       **      ** *  **          \n");
	printf("   **    ******     *******   *****   ****       **     **             **   *** ******* **  * **          \n");
	printf("   **    **   **   **     **  **      **         **     **             **    *  **      **   ***          \n");
	printf("   **    **    ** **       ** **      **      ********   *****          *****   ******* **    **          \n");
}



void init_main()
{	
	//Gen gen;
	
	FILE *Warnx;
	FILE *ERR;
	FILE *Replay;
	FILE *Display;


	Display = fopen("Display.txt","w");
	fwrite("",1,1,Display);	
	fclose( Display );

		
	Warnx = fopen("Warn.txt","w");
	fwrite("",1,1,Warnx);	
	fclose( Warnx );
	
	ERR = fopen("error.txt","w");
	fwrite("",1,1,ERR);
	fclose( ERR );


	Replay = fopen("replay.txt","w");
	fwrite("\n",1,1,Replay);
	fwrite("\n",1,1,Replay);
	fclose( Replay );

	gen.device = "";        //all
	gen.type_link = LIBNET_RAW4;		 //all
	gen.type  = "";			 //icmp arp
	gen.src_ip = NULL;        //all
	gen.src_mac = NULL;       //all
	gen.src_prt = 0;       //tcp udp
	gen.dst_ip = NULL;        //all
	gen.dst_mac = NULL;       //all
	gen.dst_prt= 0 ;        //tcp udp
	gen.gw_ip = NULL;         //icmp redirect 
	gen.payload = NULL;       //
	gen.payload_s = 0 ;   //
	gen.count = 0;           //number
	gen.protocol = NULL ;        //ip link 
	gen.amplifier = NULL;     //
	gen.burst = 0;			 //synflood
	gen.interval = 0;         //synflood	
	
	rep.device="";        //all
	rep.file="";			 //icmp arp
	rep.speed=2;
	rep.print = 0;        //tcp udp
	rep.rewriteip = 0;
	rep.nat_interface = 0;
	rep.packet = -1;
	rep.bpf_filter="";
}



void help()
{
	printf(//"Usage: tcpreplay [args] <file(s)>\n"
           //"-A \"<args>\"\t\tPass arguments to tcpdump decoder (use w/ -v)\n"
           //"-b\t\t\tBridge two broadcast domains in sniffer mode\n"
           "-c <number>\t\targument is number of packet 'ex. -c 99' \n"
           //"-C <CIDR1,CIDR2,...>\tSplit traffic by matching src IP\n"
		   );
//#ifdef DEBUG
    printf("-d <dst ip>\t\targument is Destination ip 'ex. -d 161.246.5.5' \n");
//#endif
    printf(//"-D argument is Destination mac 'ex. 0x010x060x1b0xd50xdd0x7c' \n"
           "-e <ip1:ip2>\t\tSpecify IP endpoint rewriting\n"
           "-f <file>\t\ttargument is name of file for replay and capture 'ex. -f test.pcap' \n"
           //"-F\t\t\tFix IP, TCP, UDP and ICMP checksums\n"
		   "-g <name>\t\tIP for gateway 'ex. -g 1.1.1.254\n"
		   "-G <name>\t\tName of packet for generate arp'ex. -G arp\n"
           "-h\t\t\tHelp\n"
           "-i <interface>\t\targument is interface to send traffic out of\n"
           //"-I \t\t\tSelect link is LIBNET_LILNK ***default link is LIBNET_RAW4*** \n"
           //"-j <nic>\t\tSecondary interface to send traffic out of\n"
           //"-J <mac>\t\tRewrite dest MAC on secondary interface\n"
           //"-k <mac>\t\tRewrite source MAC on primary interface\n"
           //"-K <mac>\t\tRewrite source MAC on secondary interface\n"
		   );
    printf("-l <payload>\t\ttargumnet is payload 'ex. -l PacketGen\n"
           "-L <size>\t\ttargumnet is size payload 'ex. -L 50\n"
           "-m <mac>\t\ttargument is Source mac 'ex. 0x010x060x1b0xd50xdd0x7c' default = 0x010x010x010x010x010x01\n"
           "-M <mac>\t\ttargument is Destination mac 'ex. 0x010x060x1b0xd50xdd0x7c' default = 0x010x010x010x010x010x01\n"
           //"-n\t\t\tNot nosy mode (not promisc in sniff/bridge mode)\n"
           "-N <CIDR1:CIDR2,...>\tRewrite IP's via pseudo-NAT\n"
//#ifdef HAVE_PCAPNAV
           //"-o <offset>\t\tStarting byte offset\n"
//#endif
           //"-O\t\t\tOne output mode\n"
           "-p <src port>\t\ttargument is Source port 'ex. -p 20' \n");
    printf("-P <dst port>\t\ttargument is Destination port 'ex. -P 21' \n"
           //"-r <rate>\t\tSet replay speed to given rate (Mbps)\n"
           //"-R\t\t\tSet replay speed to as fast as possible\n"
           "-s <src ip>\t\targument is source ip 'ex. -d 161.246.5.5'\n"
           "-S <speed>\t\tspeed of replay input 1 or 0 ***default 0\n"
           "-t <type>\t\ttype of packet for generate arp'ex. -t reply or request\n"
           "-T \t\t\tSelect link is LIBNET_LILNK ***default link is LIBNET_RAW4*** \n"
           //"-u pad|trunc\t\tPad/Truncate packets which are larger than the snaplen\n"
           "-v\t\t\tVerbose: print packet decodes for each packet sent\n"
           //"-V\t\t\tVersion\n"
		   );
    printf(//"-w <file>\t\tWrite (primary) packets or data to file\n"
           //"-W <file>\t\tWrite secondary packets or data to file\n"
           "-x <match>\t\tOnly send the packets specified\n"
           "-X <match>\t\tSend all the packets except those specified\n"
           "-1 \t\t\tMode generate\n"
           "-2 \t\t\tMode capture\n"
		   "-3 \t\t\tMode replay\n"
           //"<file1> <file2> ...\tFile list to replay\n"
		   );
    exit(1);


}



