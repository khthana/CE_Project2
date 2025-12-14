
#ifndef __CIDR_H__
#define __CIDR_H__

struct cidr_type {
    unsigned long network;
    int masklen;
    struct cidr_type *next;
};

typedef struct cidr_type CIDR;

struct cidr_map {
    CIDR *from;
    CIDR *to;
    struct cidr_map *next;
};
typedef struct cidr_map CIDRMAP;

int ip_in_cidr(const CIDR *, const unsigned long);
int check_ip_CIDR(CIDR *, const unsigned long);
int parse_cidr(CIDR **, char *, char *delim);
int parse_cidr_map(CIDRMAP **, char *);
int parse_endpoints(CIDRMAP **, CIDRMAP **, char *);
u_char *ip2cidr(const unsigned long, const int);
void add_cidr(CIDR *, CIDR **);
CIDR *new_cidr(void);
CIDRMAP *new_cidr_map(void);
void destroy_cidr(CIDR *);
void print_cidr(CIDR *);
char *cidr2iplist(CIDR *, char);
#endif
