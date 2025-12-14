
#ifndef _EDIT_PACKETS_H_
#define _EDIT_PACKETS_H_

#include <libnet.h>
#include <pcap.h>
#include "tcpreplay.h"
#include "cidr.h"

#define SLL_HDR_LEN 16          /* Linux cooked socket (SLL) header length
                                 * Got that from libpcap's sll.h
                                 */


int untrunc_packet(struct pcap_pkthdr *, u_char *, ip_hdr_t *, libnet_t *,
                    int);
int randomize_ips(struct pcap_pkthdr *, u_char *, ip_hdr_t *, libnet_t *, int);
void fix_checksums(struct pcap_pkthdr *, ip_hdr_t *, libnet_t *);
int rewrite_l2(struct pcap_pkthdr *, u_char *, const u_char *, u_int32_t,
               int, char *, int);
int extract_data(u_char *, int, int, char *[]);
u_int32_t remap_ip(CIDR *cidr, const u_int32_t original);
int rewrite_ipl3(ip_hdr_t *ip_hdr, libnet_t *l);
int rewrite_iparp(arp_hdr_t *arp_hdr, libnet_t *l);
#endif
