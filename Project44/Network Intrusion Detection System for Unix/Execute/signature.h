#ifndef _SIGNATURE_H
#define _SIGNATURE_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h> 
#include <sys/types.h> 
#include <netinet/in.h> 
#include <errno.h>
#include <sys/types.h>
#include <ctype.h> 
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>
#include <netinet/ip_icmp.h>
#include "report.h"
#include "node.h"
#include "manage.h"
#define TRUE 1
#define FALSE 0
//#define DEBUG
#define MAX_PATTERN_SIZE 256
#define STD_BUF_SIZE 256
#define LARGE_BUF_SIZE 1024
#define CASE_INSENSE 0
#define CASE_SENSE 1

/* content node */
typedef struct content_node{
  struct content_node *next;
  void * s_node;
  u_int sig_id;
  u_char *pattern; 
  int pattern_len;
  u_char *delta1;
  u_char *delta2;
  char * name;
  u_char pattern_mode; /* CASE_INSENSE CASE_SENSE REGEXP */
} c_node;

/* service node */
typedef struct service_node{
  u_long src_number;
  u_long dest_number;
  c_node *c_tree;
  struct service_node *next;
} s_node;

class signature {
	private:
		//struct signature_length sig_len;
		int signa_len_max;
  		int signa_len_min;
		s_node *tcp_tree;
		s_node *udp_tree;
		s_node *icmp_tree;
		report_node report_signature;
		report *reportors;
		config *con;
	public:
		/* prototype definition */
		signature(config *conf) { con =conf;  char *si_file=strdup(con->signature_file);init_signature(si_file);};
		void final( int signal);
		int get_next_str( char **reader, int max );
		c_node *new_c_node(s_node *service,  u_int sig_id, u_char *pattern, u_int pattern_len, char * name, u_char pattern_mode );
		s_node *new_s_node( u_long src_number,u_long dest_number );
		s_node * get_s_node( char *protocol, u_long src_number, u_long dst_number );
		c_node *detect_signature( node *data,u_char * capital, s_node **s_node_ptr,  c_node **c_node_ptr );
		int init_signature(char *sig_file);
		int make_pattern( u_char *pattern, u_int patternsize, char *sig_reader, char *endof_sig, u_char pattern_mode );
		int make_bin_pattern( u_char *sig_writer, char *bin_reader, char *endof_bin, u_char pattern_mode );
		int dump_c_tree(s_node * s_tree );
		void dump_s_tree(s_node * s_tree );
		void free_s_tree( s_node * s_tree);
		void free_c_tree( c_node * c_tree);
		int boyer_moore_match ( u_char * data, int data_length, u_char * pattern, int pattern_length, u_char *delta1, u_char *delta2 );
		u_char *boyer_moore_delta1( u_char *pattern, u_char pattern_length );
		u_char *boyer_moore_delta2( u_char *pattern, u_char pattern_length );
		void signature_run(node *data,report *reportor);
		void read_payload(node *data );
		int min(int value1, int value2);
		int max(int value1, int value2);
};
	
#endif /* __SIGNATURE_H */