#ifndef _BOOTP_H_
#define _BOOTP_H_

#include "types.h"

struct iphdr {
    u_char      ihl:4,
                version:4;
    u_char      tos;
    u_short     tot_len;
    u_short     id;
    u_short     frag_off;
    u_char      ttl;
    u_char      protocol;
    u_short     check;
    u_int32_t   saddr;
    u_int32_t   daddr;
    /*The options start here. */
};

struct udphdr {
    u_short     source;
    u_short     dest;
    u_short     len;
    u_short     check;
};

struct bootp {
    u_char      op;             /* packet opcode type */
    u_char      htype;          /* hardware addr type */
    u_char      hlen;           /* hardware addr length */
    u_char      hops;           /* gateway hops */
    long        xid;            /* transaction ID */
    u_short     secs;           /* seconds since boot began */
    u_short     unused;
    u_int32_t   ciaddr;         /* client IP address */
    u_int32_t   yiaddr;         /* 'your' IP address */
    u_int32_t   siaddr;         /* server IP address */
    u_int32_t   giaddr;         /* gateway IP address */
    u_char      chaddr[16];     /* client hardware address */
    char        sname[64];      /* server host name */
    char        file[128];      /* boot file name */
    u_char      vend[64];       /* vendor-specific area */
};

/*
 * UDP port numbers, server and client.
 */
#define IPPORT_BOOTPS   67
#define IPPORT_BOOTPC   68

#define BOOTREQUEST     1
#define BOOTREPLY       2

#define BOOTP_PAD       0
#define BOOTP_SUBNET    1
#define BOOTP_GATEWAY   3
#define BOOTP_DNS       6
#define BOOTP_HOSTNAME  12
#define BOOTP_END       0xff

/*
 * "vendor" data permitted for Stanford boot clients.
 */
struct vend {
    u_char      v_magic[4];     /* magic number */
    u_int32_t   v_flags;        /* flags/opcodes, etc. */
    u_char      v_unused[56];   /* currently unused */
};

#define VM_STANFORD     "STAN"  /* v_magic for Stanford */

/* v_flags values */
#define VF_PCBOOT       1       /* an IBMPC or Mac wants environment info */
#define VF_HELP         2       /* help me, I'm not registered */

typedef struct {
    u_char          ethdestin[6];   /* Ethernet packet header */
    u_char          ethsource[6];
    u_short         ethproto;
    struct iphdr    iph;
    struct udphdr   udph;
    struct bootp    bootinfo;
} BOOTP;

#endif  /* _BOOTP_H_ */
