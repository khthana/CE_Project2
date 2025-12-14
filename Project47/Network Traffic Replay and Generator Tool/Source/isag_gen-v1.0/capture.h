#include "pcap.h"




//void packet_handler(u_char *param, const struct pcap_pkthdr *header, const u_char *pkt_data);
int capture(char *file,char *device);
int readfile(char *file);
void CountPacket(int x);