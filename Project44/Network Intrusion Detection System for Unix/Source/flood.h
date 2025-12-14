#ifndef FLOOD_DETECT
#define FLOOD_DETECT
#include <stdarg.h>
#include <sys/time.h>
#include <unistd.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include "hostdb.h"
#include "report.h"
#include "node.h"
#include "manage.h"
#define FLOOD_ID 1


typedef struct _cnxInfo_flood 
{
        unsigned int cnx_count;
        unsigned int port;
	struct in_addr firstip,lastip;      
	char *kind;
       	long first_cnxtime;
	long last_cnxtime;
	long time_check;
	int Shour;
	int Smin;
	int Ssec;
	int Ehour;
	int Emin;
	int Esec;
	u_long pps;
	float kbps;
	float kbp;
} cnxInfo_t_flood;


class flood {
	private:
		unsigned int cnx_ttl;
		unsigned int max_cnx_count ;
		u_long all_pps;
		float all_kbps;
		u_int num_p;
		struct ip *ipcur;
		hostdb *flood_host;
		report_node report_flood;
		report *reportors;
		long check_1_min;
		long check_time;
		config *con;
		node *temp_node;
	public:
		flood(config *conf);
		~flood(){ };
		void do_report_if_needed(hostdb_t *h,cnxInfo_t_flood *cnx,report *reportor);
		void expire_cnx();
		cnxInfo_t_flood *new_cnx(node *data, const char *kind);
		void modify_cnx(hostdb_t *h,node *data,cnxInfo_t_flood *cnx);
		void update_hdb_entry(node *data, const char *kind, hostdb_t *h);
		void create_hdb_entry(node *data, const char *kind);
		void generic_packet(node *data, const char *kind);
		void tcp_packet(node *data);
		void udp_packet(node *data);
		void icmp_packet(node *data);
		void flood_run(node *data,report *reportor);
	};

#endif