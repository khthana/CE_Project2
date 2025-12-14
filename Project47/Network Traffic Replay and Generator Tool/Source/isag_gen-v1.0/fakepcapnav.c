
#include "config.h"
#include "fakepcapnav.h"
#include "err.h"
#include <stdlib.h>

#ifndef HAVE_PCAPNAV

/* pcapnav_init does nothing!  */
void
pcapnav_init(void)
{
    return;
}

/* pcapnav_open_offline opens a pcap file, 
 * and creates the struct for our use  
 */
pcapnav_t *
pcapnav_open_offline(const char *filename)
{
    pcapnav_t *pcapnav;
    char errbuf[PCAP_ERRBUF_SIZE];

    pcapnav = (pcapnav_t *) malloc(sizeof(pcapnav_t));
    if (pcapnav == NULL) {
        errx(1, "malloc() error: unable to malloc pcapnav_t");
    }

    pcapnav->pcap = pcap_open_offline(filename, errbuf);
    if (pcapnav->pcap == NULL) {
        errx(1, "Error opening pcap file %s: %s", filename, errbuf);
    }

    return (pcapnav);
}

/* closes our pcap file and free's the pcapnav */
void
pcapnav_close(pcapnav_t * pcapnav)
{
    pcap_close(pcapnav->pcap);
    free(pcapnav);
}

/* returns the pcap_t data struct */
pcap_t *
pcapnav_pcap(pcapnav_t * pcapnav)
{
    return (pcapnav->pcap);
}


#endif
