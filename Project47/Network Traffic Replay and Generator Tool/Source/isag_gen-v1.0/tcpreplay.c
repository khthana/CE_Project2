 

#include "config.h"

#include <ctype.h>
#include <fcntl.h>
#include <libnet.h>
#ifdef HAVE_PCAPNAV
#include <pcapnav.h>
#else
#include "fakepcapnav.h"
#endif
#include <pcap.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

#include "tcpreplay.h"
#include "tcpdump.h"
#include "cache.h"
#include "cidr.h"
#include "list.h"
#include "err.h"
#include "do_packets.h"
#include "xX.h"
#include "signal_handler.h"
#include "replay_live.h"
#include "utils.h"
#include "edit_packet.h"


struct options options;
char *cachedata = NULL;
CIDR *cidrdata = NULL;
CIDRMAP *cidrmap_data1 = NULL, *cidrmap_data2 = NULL;
struct timeval begin, end;
u_int64_t bytes_sent, failed, pkts_sent;
char *cache_file = NULL,intf[10], *intf2 = NULL;
int cache_bit, cache_byte;
u_int64_t cache_packets;
volatile int didsig;
struct bpf_program bpf;
int include_exclude_mode = 0;
CIDR *xX_cidr = NULL;
LIST *xX_list = NULL;
char l2data[L2DATALEN] = "";
int l2len = LIBNET_ETH_H;
int maxpacket = 0;
int nat_interface = 0;


/* we get this from libpcap */
extern char pcap_version[];

#ifdef HAVE_TCPDUMP
/* tcpdump handle */
tcpdump_t tcpdump;
#endif

#ifdef DEBUG
int debug = 0;
#endif

void replay_file(char *path, int l2enabled, char *l2data, int l2len);
void replay_live(char *iface, int l2enabled, char *l2data, int l2len);
void validate_l2(char *name, int l2enabled, char *l2data, int l2len, int linktype);
void usage(void);
void version(void);
void configfile(char *file);
void init(void);
void apply_filter(pcap_t *pcap);
//int tcp_replay(void);

int tcp_replay(void *ptr)
{
//    int delay=0;
	char test[50];
	char ebuf[256];
    int ch, i;
    int l2enabled = 0;
    //void *xX = NULL;
    char errbuf[PCAP_ERRBUF_SIZE];
	Replay *rep;            
    rep = (Replay *) ptr;  /* type cast to a pointer to thdata */
	

	
	rep->bpf_filter = options.bpf_filter;
    init();                    // init our globals //
	options.bpf_filter = rep->bpf_filter;
	
	options.rewriteip = rep->rewriteip;
	

    nat_interface = rep->nat_interface;
	
	
	 if (rep->speed == 1)  //as fast as posible
	{
		options.topspeed = 1;
		options.mult = 0.0;
		options.rate = 0.0;
		options.one_at_a_time = 0;
		options.packetrate = 0.0;
	}else if (rep->speed == 2) //as fast as capture
	{
		//options.mult = atof(optarg);
		options.mult  = 7.3;
        //if (options.mult <= 0)
        //    errx(1, "Invalid multiplier: %s", optarg);
        options.rate = 0.0;
        options.packetrate = 0.0;
        options.one_at_a_time = 0;
        options.topspeed = 0;
	} else 
	{
		errx(1,"Must specific speed for replay 1 or 2");
	}
    
	
	if (rep->packet != -1)
	{	
	options.limit_send = rep->packet;
	if (options.limit_send <= 0)
		{
           errx(1, "<limit> must be positive");
    	}
	}

#ifdef HAVE_TCPDUMP
	if (rep->print == 1)
	{
		options.verbose = 1;		
	} else if (rep->print != 0)
	{
		errx(1,"-v specific 0 or 1");
	}
#endif	
	
	strcpy(intf,rep->device);

    if (intf == NULL)
        errx(1, "Must specify a primary interface");

    if ((intf2 == NULL) && (cache_file != NULL))
        errx(1, "Needs secondary interface with cache");

    if ((intf2 != NULL) && (!options.sniff_bridge) && 
        (!options.cidr && (cache_file == NULL)))
        errx(1, "Needs cache or cidr match with secondary interface");

    if (options.sniff_bridge && (options.savepcap ||
                                 options.savedumper ||
                                 options.savepcap2 || options.savedumper2)) {
        errx(1, "Bridge mode excludes saving packets or data to file");
    }

    if ((intf2 != NULL) && options.datadump_mode && (!options.one_output) &&
        ((options.datadumpfile == 0) || (options.datadumpfile2 == 0)))
        errx(1,
             "You must specify two output files when splitting traffic in data dump mode");

    if ((options.offset) && (options.sniff_snaplen != -1)) {
        errx(1, "You can't specify an offset when sniffing a live network");
    }

    if ((!options.promisc) && (options.sniff_snaplen == -1)) {
        errx(1,
             "Not nosy can't be specified except when sniffing a live network");
    }

    if ((options.sniff_bridge) && (options.sniff_snaplen == -1)) {
        errx(1, "Bridging requires sniff mode (-S <snaplen>)");
    }

    if ((options.sniff_bridge) && (intf2 == NULL)) {
        errx(1, "Bridging requires a secondary interface");
    }

    if ((options.sniff_snaplen != -1) && options.one_at_a_time) {
        errx(1, "Sniffing live traffic excludes one at a time mode");
    }

    if (options.one_output && options.sniff_bridge) {
        errx(1, "One output mode and bridge mode are incompatible");
    }

    if ((options.rewriteip > 1) && (options.rewriteip != nat_interface)) {
        errx(1, "Using both -N and -e are not supported");
    }

    if (options.seed != 0) {
        srand(options.seed);
        options.seed = random();
        dbg(1, "random() picked: %d", options.seed);
    }

    //
    // If we have one and only one -N, then use the same map data
   // for both interfaces/files
    //
    if ((cidrmap_data1 != NULL) && (cidrmap_data2 == NULL))
        cidrmap_data2 = cidrmap_data1;

    //
     // some options are limited if we change the type of header
     // we're making a half-assed assumption that any header 
     // length = LIBNET_ETH_H is actually 802.3.  This will 
     // prolly bite some poor slob later using some wierd
    // header type in their pcaps, but I don't really care right now
    //
    if (l2len != LIBNET_ETH_H) {
        // 
        // we can't untruncate packets with a different lenght
        // ethernet header because we don't take the lenghts
         // into account when doing the pointer math
         //
        if (options.trunc)
            errx(1, "You can't use -u with non-802.3 frames");

        //
         // we also can't rewrite macs for non-802.3
         //
        if ((memcmp(options.intf1_mac, NULL_MAC, 6) == 0) ||
            (memcmp(options.intf2_mac, NULL_MAC, 6) == 0))
            errx(1,
                 "You can't rewrite destination MAC's with non-802.3 frames");

    }

    //open interfaces for writing //
    if ((options.intf1 = libnet_init(LIBNET_LINK_ADV, intf, ebuf)) == NULL)
        errx(1, "Libnet can't open %s: %s", intf, ebuf);

    if (intf2 != NULL) {
        if ((options.intf2 = libnet_init(LIBNET_LINK_ADV, intf2, ebuf)) == NULL)
            errx(1, "Libnet can't open %s: %s", intf2, ebuf);
    }

    //open bridge interfaces for reading //
    if (options.sniff_bridge) {
        if ((options.listen1 =
             pcap_open_live(intf, options.sniff_snaplen,
                            options.promisc, PCAP_TIMEOUT, errbuf)) == NULL) {
            errx(1, "Libpcap can't open %s: %s", intf, errbuf);
        }

        apply_filter(options.listen1);

        if ((options.listen2 =
             pcap_open_live(intf2, options.sniff_snaplen,
                            options.promisc, PCAP_TIMEOUT, errbuf)) == NULL) {
            errx(1, "Libpcap can't open %s: %s", intf2, errbuf);
        }

        apply_filter(options.listen2);

        // sanity checks for the linktype //
        if (pcap_datalink(options.listen1) != pcap_datalink(options.listen2)) {
            errx(1, "Unable to bridge different datalink types");
        }

        // abort on non-supported link types //
        if (pcap_datalink(options.listen1) == DLT_LINUX_SLL) {
            errx(1, "Unable to bridge Linux Cooked Capture format");
        }
        else if (pcap_datalink(options.listen1) == DLT_NULL) {
            errx(1, "Unable to bridge BSD loopback format");
        }
        else if (pcap_datalink(options.listen1) == DLT_LOOP) {
            errx(1, "Unable to bridge loopback interface");
        }

        //
         // only need to validate once since we're guaranteed both interfaces
        // use the same link type
         //
        validate_l2(intf, l2enabled, l2data, l2len,
                    pcap_datalink(options.listen1));

        warnx("listening on: %s %s", intf, intf2);

    }

    if (options.savepcap == NULL)
        warnx("sending on: %s %s", intf, intf2 == NULL ? "" : intf2);

    // init the signal handlers //
    init_signal_handlers();

    if (gettimeofday(&begin, NULL) < 0)
        err(1, "gettimeofday() failed");

    // don't use the standard main loop in bridge mode //
    if (options.sniff_bridge) {
        cache_byte = 0;
        cache_bit = 0;

        do_bridge(options.listen1, options.listen2, l2enabled, l2data, l2len);

        pcap_close(options.listen1);
        pcap_close(options.listen2);
        libnet_destroy(options.intf1);
        libnet_destroy(options.intf2);
        exit(0);

    }
    
    //intf = 'eth0';

	
    // int i;
    /* main loop for non-bridge mode */
	//options.n_iter = 2;
	//printf("kuyyyyyyyyyyyyy\n");
	//options.n_iter =  0;
    if (options.n_iter > 0) {
		//printf("kuyyyyyyyyyyyyy\n");
        while (options.n_iter--) {  /* limited loop */
     for ( i = 0; i < 1; i++){//argc; i++) {
                /* reset cache markers for each iteration */
                cache_byte = 0;
                cache_bit = 0;

                /* replay file or live network depending on snaplen */
                if (options.sniff_snaplen == -1) {
					//strcpy(path,"/home/ake/test.pcap");
                    replay_file(rep->file, l2enabled, l2data, l2len);
                }
                else {
                    replay_live(rep->file, l2enabled, l2data, l2len);
                }
            }
        }
    }
    else {
        /* loop forever */
		//printf("kuyyyyyyyyyyyyyelse\n");
     while (1) {
		 //printf("kuyyyyyyyyyyyyywhile\n");
     for ( i = 0; i < 1; i++){                                 //argc; i++) {
                /* reset cache markers for each iteration */
                cache_byte = 0;
                cache_bit = 0;
				
                /* replay file or live network depending on snaplen */
                if (options.sniff_snaplen == -1) {
                      //replay_file(argv[i], l2enabled, l2data, l2len);
				      //printf("kuyyyyyyyyyyyyy\n");
					  //strcpy(path,"/home/ake/test.pcap");
					  //printf("%s\n",path);
                      replay_file(rep->file, l2enabled, l2data, l2len);
                }
                else {
                    replay_live(rep->file, l2enabled, l2data, l2len);
                }
            }
        }
    }
    //for (delay =0; delay< 1000000; delay++)
    //{
    //	printf("%d",delay);

    //}

    if (bytes_sent > 0)
        packet_stats();

    /* save the pcap write file */
   if (options.savepcap != NULL)
        pcap_dump_close(options.savedumper);

   if (options.savepcap2 != NULL)
        pcap_dump_close(options.savedumper2);

     //close the data dump files */
    if (options.datadumpfile)
       close(options.datadumpfile);

    if (options.datadumpfile2)
        close(options.datadumpfile2);

    return 1;

}                               /* main() */


/*
 * replay a live network on another interface
 * but only in a single direction (non-bridge mode)
 */
void
replay_live(char *iface, int l2enabled, char *l2data, int l2len)
{
    
    pcap_t *pcap = NULL;
    u_int32_t linktype = 0;
    char errbuf[PCAP_ERRBUF_SIZE];

    // if no interface specified, pick one //
    if ((!iface || !*iface) && !(iface = pcap_lookupdev(errbuf))) {
        errx(1, "Error determing live capture device : %s", errbuf);
    }

    if (strcmp(intf, iface) == 0) {
        warnx("WARNING: Listening and sending on the same interface!");
    }

    // open the interface //
    if ((pcap = pcap_open_live(iface, options.sniff_snaplen,
                               options.promisc, 0, errbuf)) == NULL) {
        errx(1, "Error opening live capture: %s", errbuf);
    }

    linktype = pcap_datalink(pcap);
    validate_l2(iface, l2enabled, l2data, l2len, linktype);

    // do we apply a bpf filter? //
    if (options.bpf_filter != NULL) {
        if (pcap_compile(pcap, &bpf, options.bpf_filter,
                         options.bpf_optimize, 0) != 0) {
            errx(1, "Error compiling BPF filter: %s", pcap_geterr(pcap));
        }
        pcap_setfilter(pcap, &bpf);
    }

    do_packets(NULL, pcap, linktype, l2enabled, l2data, l2len);
    pcap_close(pcap);
}

/* 
 * replay a pcap file out an interface
 */
void
replay_file(char *path, int l2enabled, char *l2data, int l2len)
{
    pcap_t *pcap = NULL;
    pcapnav_t *pcapnav = NULL;
    u_int32_t linktype = 0;

    pcapnav_init();

	//printf("%s\n",path);

#ifdef HAVE_TCPDUMP
    if (options.verbose) {
        tcpdump.filename = path;
        tcpdump_open(&tcpdump);
    }
#endif

    if ((pcapnav = pcapnav_open_offline(path)) == NULL) {
        errx(1, "Error opening file: %s", strerror(errno));
    }

	//printf("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk\n");

    pcap = pcapnav_pcap(pcapnav);
    linktype = pcap_datalink(pcap);

    validate_l2(path, l2enabled, l2data, l2len, linktype);

    apply_filter(pcapnav_pcap(pcapnav));

    do_packets(pcapnav, NULL, linktype, l2enabled, l2data, l2len);
    pcapnav_close(pcapnav);
#ifdef HAVE_TCPDUMP
    tcpdump_close(&tcpdump);
#endif
}

/*
 * applys a BPF filter if applicable
 */
void
apply_filter(pcap_t * pcap)
{

    // do we apply a bpf filter? //
    if (options.bpf_filter != NULL) {
        if (pcap_compile(pcap, &bpf, options.bpf_filter,
                         options.bpf_optimize, 0) != 0) {
            errx(1, "Error compiling BPF filter: %s", pcap_geterr(pcap));
        }
        pcap_setfilter(pcap, &bpf);
    }
}

/* 
 * if linktype not DLT_EN10MB we have to see if we can send the frames
 * if DLT_LINUX_SLL AND (options.intf1_mac OR l2enabled), then OK
 * else if l2enabled, then ok
 */
void
validate_l2(char *name, int l2enabled, char *l2data, int l2len, int linktype)
{

    if (linktype != DLT_EN10MB) {
        if (linktype == DLT_LINUX_SLL) {
            // if SLL, then either -2 or -I are ok //
            if ((memcmp(options.intf1_mac, NULL_MAC, 6) == 0) && (!l2enabled)) {
                warnx
                    ("Unable to process Linux Cooked Socket pcap without -2 or -I: %s",
                     name);
                return;
            }

            //if using dual interfaces, make sure -2 or -J is set //
            if (options.intf2 &&
                ((!l2enabled) ||
                 (memcmp(options.intf2_mac, NULL_MAC, 6) == 0))) {
                warnx
                    ("Unable to process Linux Cooked Socket pcap with -j without -2 or -J: %s",
                     name);
                return;
            }
        }
        else if (!l2enabled) {
            warnx("Unable to process non-802.3 pcap without layer 2 data: %s",
                  name);
            return;
        }
    }

    // calculate the maxpacket based on the l2len, linktype and mtu //
    if (l2enabled) {
        // custom L2 header //
        dbg(1, "Using custom L2 header to calculate max frame size");
        maxpacket = options.mtu + l2len;
    }
    else if ((linktype == DLT_EN10MB) || (linktype == DLT_LINUX_SLL)) {
        // ethernet //
        dbg(1, "Using Ethernet to calculate max frame size");
        maxpacket = options.mtu + LIBNET_ETH_H;
    }
    else {
        // oh fuck, we don't know what the hell this is, we'll just assume ethernet //
        maxpacket = options.mtu + LIBNET_ETH_H;
        warnx("Unable to determine layer 2 encapsulation, assuming ethernet\n"
              "You may need to increase the MTU (-t <size>) if you get errors");
    }

}


/*
 * parse the configfile, and put all the values into options
 */



void
usage(void)
{
    printf("Usage: tcpreplay [args] <file(s)>\n"
           "-A \"<args>\"\t\tPass arguments to tcpdump decoder (use w/ -v)\n"
           "-b\t\t\tBridge two broadcast domains in sniffer mode\n"
           "-c <cachefile>\t\tSplit traffic via cache file\n"
           "-C <CIDR1,CIDR2,...>\tSplit traffic by matching src IP\n");
#ifdef DEBUG
    printf("-d <level>\t\tEnable debug output to STDERR\n");
#endif
    printf("-D\t\t\tData dump mode (set this BEFORE -w and -W)\n"
           "-e <ip1:ip2>\t\tSpecify IP endpoint rewriting\n"
           "-f <configfile>\t\tSpecify configuration file\n"
           "-F\t\t\tFix IP, TCP, UDP and ICMP checksums\n"
           "-h\t\t\tHelp\n"
           "-i <nic>\t\tPrimary interface to send traffic out of\n"
           "-I <mac>\t\tRewrite dest MAC on primary interface\n"
           "-j <nic>\t\tSecondary interface to send traffic out of\n"
           "-J <mac>\t\tRewrite dest MAC on secondary interface\n"
           "-k <mac>\t\tRewrite source MAC on primary interface\n"
           "-K <mac>\t\tRewrite source MAC on secondary interface\n");
    printf("-l <loop>\t\tSpecify number of times to loop\n"
           "-L <limit>\t\tSpecify the maximum number of packets to send\n"
           "-m <multiple>\t\tSet replay speed to given multiple\n"
           "-M\t\t\tDisable sending martian IP packets\n"
           "-n\t\t\tNot nosy mode (not promisc in sniff/bridge mode)\n"
           "-N <CIDR1:CIDR2,...>\tRewrite IP's via pseudo-NAT\n"
#ifdef HAVE_PCAPNAV
           "-o <offset>\t\tStarting byte offset\n"
#endif
           "-O\t\t\tOne output mode\n"
           "-p <packetrate>\t\tSet replay speed to given rate (packets/sec)\n");
    printf("-P\t\t\tPrint PID\n"
           "-r <rate>\t\tSet replay speed to given rate (Mbps)\n"
           "-R\t\t\tSet replay speed to as fast as possible\n"
           "-s <seed>\t\tRandomize src/dst IP addresses w/ given seed\n"
           "-S <snaplen>\t\tSniff interface(s) and set the snaplen length\n"
           "-t <mtu>\t\tOverride MTU (defaults to 1500)\n"
           "-T\t\t\tTruncate packets > MTU so they can be sent\n"
           "-u pad|trunc\t\tPad/Truncate packets which are larger than the snaplen\n"
           "-v\t\t\tVerbose: print packet decodes for each packet sent\n"
           "-V\t\t\tVersion\n");
    printf("-w <file>\t\tWrite (primary) packets or data to file\n"
           "-W <file>\t\tWrite secondary packets or data to file\n"
           "-x <match>\t\tOnly send the packets specified\n"
           "-X <match>\t\tSend all the packets except those specified\n"
           "-1\t\t\tSend one packet per key press\n"
           "-2 <datafile>\t\tLayer 2 data\n"
           "<file1> <file2> ...\tFile list to replay\n");
    exit(1);
}


/*
 * Initialize globals
 */
void
init(void)
{
    bytes_sent = failed = pkts_sent = 0;
    //strcpy(intf,NULL);
	intf2 = NULL;
    memset(&options, 0, sizeof(options));

    //Default mode is to replay pcap once in real-time //
    options.mult = 1.0;
    options.n_iter = 1;
    options.rate = 0.0;
    options.packetrate = 0.0;

    // set the default MTU size //
    options.mtu = DEFAULT_MTU;

    // set the bpf optimize //
    options.bpf_optimize = BPF_OPTIMIZE;

    // sniff mode options //
    options.sniff_snaplen = -1; // disabled //
    options.promisc = 1;        // listen in promisc mode by default //

    // poll timeout (in ms) defaults to infinate //
    options.poll_timeout = -1;

    // disable limit send //
    options.limit_send = -1;

    // init the RBTree //
    rbinit();

#ifdef HAVE_TCPDUMP
    // clear out tcpdump struct //
    memset(&tcpdump, '\0', sizeof(tcpdump_t));
#endif

    cache_bit = cache_byte = 0;

    if (fcntl(STDERR_FILENO, F_SETFL, O_NONBLOCK) < 0)
        errx(1, "Unable to set STDERR to non-blocking");
}

void
packet_stats()
{
    int line; 
    float bytes_sec = 0.0, mb_sec = 0.0;
    int pkts_sec = 0;
    char bits[3],print[1000];
	FILE *replay;
	

	
    if (gettimeofday(&end, NULL) < 0)
        err(1, "gettimeofday");

    timersub(&end, &begin, &begin);
    if (timerisset(&begin)) {
        if (bytes_sent) {
            bytes_sec = bytes_sent / (begin.tv_sec + (float)begin.tv_usec / 1000000);
            mb_sec = (bytes_sec * 8) / (1024 * 1024);
        }
        if (pkts_sent)
            pkts_sec = pkts_sent / (begin.tv_sec + (float)begin.tv_usec / 1000000);
    }

    snprintf(bits, sizeof(bits), "%d", begin.tv_usec);

    fprintf(stderr, " %llu packets (%llu bytes) sent in %d.%s seconds\n",
            pkts_sent, bytes_sent, begin.tv_sec, bits);
    fprintf(stderr, " %.1f bytes/sec %.2f megabits/sec %d packets/sec\n",
            bytes_sec, mb_sec, pkts_sec);

	strcpy(print,"");
	replay = fopen("replay.txt","w");
	sprintf(print, " %llu packets (%llu bytes) sent in %d.%s seconds\n",pkts_sent, bytes_sent, begin.tv_sec, bits);
	line = strlen(print);
	fwrite(print,line,1,replay);
	strcpy(print,"");
	sprintf(print, " %.1f bytes/sec %.2f megabits/sec %d packets/sec\n",bytes_sec, mb_sec, pkts_sec);
	line = strlen(print);
	fwrite(print,line,1,replay);
	fclose( replay );



    if (failed) {
        fprintf(stderr,
                " %llu write attempts failed from full buffers and were repeated\n",
                failed);
    }
}
