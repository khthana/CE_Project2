#ifndef SCIDS_CONFIG_H
#define SCIDS_CONFIG_H

#include <string>
#include "t_linklist.h"

class ScConfig{
	public:
		ScConfig();
		void SetDefault();
		void ReadConfigFile();
		void AssignVar(const string var_name,const string var_value);

		string db_name;
		string user_name;
		string passwd;
		string server_address;
		int server_port;
		int buffer_size;
		int seq_length;
		int max_diff_sc;
		int add_to_db;
		int hmd_on;
		int report_anomall_seq;
		int report_all;
		int keep_seq_file;
		int print_result;
		int num_alert;
		LinkList<string> dectec_process;
};

#endif
		
