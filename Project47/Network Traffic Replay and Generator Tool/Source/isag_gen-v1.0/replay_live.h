
#ifndef _REPLAY_LIVE_H_
#define _REPLAY_LIVE_H_

#include "config.h"
#include "rbtree.h"
#include <libnet.h>

/*
 * RBTree node object for tracking which side of tcpreplay where 
 * each source MAC address lives
 */
struct macsrc_t {
    RB_ENTRY(macsrc_t) node;
    u_char key[ETHER_ADDR_LEN];
    u_char source;              /* interface device name we first saw the source MAC */
    libnet_t *libnet;           /* libnet handle to send packets out */
};

/* pri and secondary pcap interfaces */
#define PCAP_INT1 0
#define PCAP_INT2 1

/* our custom pcap_dispatch handler user struct */
struct live_data_t {
    u_int32_t linktype;
    int l2enabled;
    int l2len;
    u_char source;
    char *l2data;
};

void rbinit(void);
void do_bridge(pcap_t *, pcap_t *, int, char *, int);


#endif
