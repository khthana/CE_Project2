#ifndef HOST
#define HOST

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <time.h>
#include <iostream.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>
#include <netinet/ip.h>
#include <sys/time.h>
#include <netinet/if_ether.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <ctype.h>
#include <string.h>
#include "node.h"
#define MAX_PLUGIN 5
#define HASH_SIZE 512
#define hkey(saddr, daddr, prot) \
		(( (saddr) ^ (daddr) ^ (prot)) & (HASH_SIZE - 1))
#define host_key(ip) hkey(ip->ip_src.s_addr, ip->ip_dst.s_addr, ip->ip_p)
#define hostdb_get_data(h, id) (h)->pdata[(id)]
#define hostdb_set_data(h, id, data) (h)->pdata[(id)] = (data)

typedef struct _hostdb {
        struct ip *ip;
	u_int srcport,dstport;  // src and dst port
        int key_cache;
        unsigned long *pdata;
        struct _hostdb *prev, *next;
        struct _hostdb *hprev, *hnext;		
} hostdb_t;

class hostdb {
	
	private:
		hostdb_t *host_hash[HASH_SIZE];
		hostdb_t *first_host;
		hostdb_t *last_host;	
	public:
		hostdb(){  memset(host_hash, 0, HASH_SIZE - 1); first_host =NULL; last_host =NULL;}
		hostdb_t *hostdb_search(node *data);
		hostdb_t *hostdb_new(node *data);
		void hostdb_del(hostdb_t *h, const unsigned int pid);
		int ip_match(const struct ip *ip1, const struct ip *ip2);
		hostdb_t *search(hostdb_t *bucket, const struct ip *ip);
		void host_add(hostdb_t **bucket, hostdb_t *h);
		void host_del(hostdb_t **bucket, hostdb_t *h);
		hostdb_t  *get_host_hash(int i) {return host_hash[i];}
		hostdb_t  *get_first_host(void) {return first_host;}
		~hostdb() {};
		
	
	};


#endif
