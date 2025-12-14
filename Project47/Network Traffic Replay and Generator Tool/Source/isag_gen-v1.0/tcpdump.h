
#ifndef _TCPDUMP_H_
#define _TCPDUMP_H_

/* line buffer stdout, read from stdin */
#define TCPDUMP_ARGS " -n -l -r-"

/* max number of tcpdump options; must be a multiple of 4 */
#define OPTIONS_VEC_SIZE 32

/* how long to wait (in ms) to write to tcpdump */
#define TCPDUMP_POLL_TIMEOUT 500

/* delim to be used for strtok() to process tcpdump args */
#define OPT_DELIM " -"

/* output file of data passed to tcpdump when debug level 5 is enabled */
#define TCPDUMP_DEBUG "tcpdump.debug"

/* taken from libpcap's savefile.c */
#define TCPDUMP_MAGIC 0xa1b2c3d4
#define PATCHED_TCPDUMP_MAGIC 0xa1b2cd34

struct tcpdump {
    char *filename;
    char *args;
    struct pcap_file_header pfh;
    int pid;
    int fd; /* fd to write to. 1/2 of the socketpair */
    /* following vars are for figuring out exactly what we send to
     * tcpdump.  See TCPDUMP_DEBUG 
     */
#ifdef DEBUG
    int debugfd;
    char debugfile[255];
#endif
};

typedef struct tcpdump tcpdump_t;

int tcpdump_init(tcpdump_t *tcpdump);
int tcpdump_open(tcpdump_t *tcpdump);
int tcpdump_print(tcpdump_t *tcpdump, struct pcap_pkthdr *pkthdr, u_char *data);

void tcpdump_close(tcpdump_t *tcpdump);

#endif
