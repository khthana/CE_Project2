#ifndef SCAN_DETECT
#define SCAN_DETECT
#include <stdarg.h>
#include <sys/time.h>
#include <unistd.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include "hostdb.h"
#include "report.h"
#include "node.h"
#include "manage.h"
//#define CNX_TTL 6
//#define MAX_CNX_COUNT 30

#define scan_ID 1
#define BIT(x) (1 << (x))

typedef struct _cnxInfo 
{
        unsigned char port[65536 / 8];
        unsigned int cnx_count;
        unsigned int first_port;
        unsigned int last_port;
	struct in_addr firstip,lastip;      
	char *kind;
       	long first_cnxtime;
	long last_cnxtime;
	int Shour;
	int Smin;
	int Ssec;
	int Ehour;
	int Emin;
	int Esec;

} cnxInfo_t;


class scan {
	private:
		unsigned int cnx_ttl;
		unsigned int max_cnx_count ;
		unsigned int dportcur;
		struct ip *ipcur;
		hostdb *scan_host;
		report_node report_scan;
		long check_1_min;
		long check_time;
		config *con;
		node *temp_node;
	public:
		scan(config *conf);
		~scan() {  };
		void do_report_if_needed(hostdb_t *h,cnxInfo_t *cnx,report *reportor);
		void expire_cnx(report *reportor);
		char *kind_cnxInfo(struct tcphdr *tcp);
		cnxInfo_t *new_cnx(node *data, const char *kind);
		void modify_cnx(node *data,cnxInfo_t *cnx);
		void update_hdb_entry(node *data, const char *kind, hostdb_t *h);
		void create_hdb_entry(node *data, const char *kind);
		void generic_packet(node *data, const char *kind);
		void tcp_packet(node *data);
		void udp_packet(node *data);
		void icmp_packet(node *data);
		void scandetect_run(node *data,report *reportor);
	};

#endif