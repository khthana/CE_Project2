
#ifndef _UTILS_H_
#define _UTILS_H_

int read_hexstring(char *l2string, char *hex, int hexlen);
int argv_create(char *p, int argc, char *argv[]);
void mac2hex(const char *mac, char *dst, int len);
void packet_stats();
void *get_layer4(ip_hdr_t * ip_hdr);
void parse_services(char *file);

#define MAX_ARGS 128


#endif
