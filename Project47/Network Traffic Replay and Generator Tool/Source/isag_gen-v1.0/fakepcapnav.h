
#ifndef _FAKEPCAPNAV_H_
#define _FAKEPCAPNAV_H_

#include "config.h"
#include <pcap.h>

#ifndef HAVE_PCAPNAV

typedef struct pcapnav pcapnav_t;

struct pcapnav {
    pcap_t *pcap;
};

void pcapnav_init(void);
pcapnav_t *pcapnav_open_offline(const char *);
void pcapnav_close(pcapnav_t *);
pcap_t *pcapnav_pcap(pcapnav_t *);

#endif

#endif
