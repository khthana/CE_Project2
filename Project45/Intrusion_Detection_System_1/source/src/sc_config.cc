#include <fstream.h>
#include <string>
#include "sc_config.h"

ScConfig::ScConfig()
{
	SetDefault();
	ReadConfigFile();
}

void ScConfig::SetDefault()
{
	server_address = "127.0.0.1";
	server_port = 3000;
	buffer_size = 256;
	db_name = "sc_ids.db";
	user_name = "ids";
	passwd = "audit";
	seq_length = 6;
	max_diff_sc = 500;
	add_to_db = 0;
	hmd_on = 0;
	keep_seq_file = 0;
	print_result = 1;
	num_alert = 1;
}

void ScConfig::ReadConfigFile()
{
	
	string str_conf;
	string var_name;
	string var_value;
	unsigned int i=0;
	ifstream config_file("./sc.conf");
	

	if(!config_file.is_open()){
		cerr<<"WARNING Cannot open configuration file."
		    <<endl<<"I will continue using the default values"<<endl;
		return;
	}
	
	if(config_file.eof()){
		cerr<<"WARNING configuration file is empty."
		    <<endl<<"I will continue using the default values"<<endl;
		return;
	}

	config_file>>str_conf;

	while(!config_file.eof()){
		
		while(isspace(str_conf[i]))
			i++;
		
		if(str_conf.length() <= i){
			getline(config_file,str_conf);
			i=0;
			continue;
		}
		
		if(str_conf[i] == '#'){
			getline(config_file,str_conf);
			i=0;
			continue;
		}

		int first =i;
		while( (str_conf[i] != ':') && ( i <str_conf.length())){
			i++;
		}

		if( i == str_conf.length()){
			cerr<<"Error in configuration file."
			    <<endl<<"I will terminated"<<endl;
			exit(-1);
		}

		var_name.assign(str_conf,first,i-first);

		i++;
		while(isspace(str_conf[i]))
				i++;

		first = i;
		if((str_conf[i] == '\"') && ( i < str_conf.length())){
			i++;
			while(str_conf[i] != '\"'){
				i++;
			}
			first++;
		}
		else{
			while((i<str_conf.length()) && (!isspace(str_conf[i])) 
			     &&(str_conf[i] != '#')){
				i++;
			}
		}

		var_value.assign(str_conf,first,i-first);

//		cout<<endl<<"Name :"<<var_name;
//		cout<<endl<<"Value:"<<var_value;
		AssignVar(var_name,var_value);

		getline(config_file,str_conf);
		i=0;
	}
}

void ScConfig::AssignVar(const string var_name,const string  var_value)
{
	unsigned int i,j;
	string tmp_str;

	if(var_name == "db_name"){
		db_name = var_value;
	}
	else if(var_name == "user_name"){
		user_name = var_value;
	}
	else if(var_name == "passwd"){
		passwd = var_value;
	}
	else if(var_name == "seq_length"){
		seq_length = atoi(var_value.c_str());
	}
	else if(var_name == "max_diff_sc"){
		max_diff_sc = atoi(var_value.c_str());
	}
	else if(var_name == "add_to_db"){
		add_to_db = atoi(var_value.c_str());
	}
	else if(var_name == "hmd_on"){
		hmd_on = atoi(var_value.c_str());
	}
	else if(var_name == "report_anomall_seq"){
		report_anomall_seq = atoi(var_value.c_str());
	}
	else if(var_name == "report_all"){
		report_all = atoi(var_value.c_str());
	}
	else if(var_name =="keep_seq_file"){
		keep_seq_file = atoi(var_value.c_str());
	}
	else if(var_name == "print_result_to_screen"){
		print_result = atoi(var_value.c_str());
	}
	else if(var_name == "num_anomall_seq_alert"){
		num_alert = atoi(var_value.c_str());
	}
	else if(var_name == "server_address"){
		server_address = var_value;
	}
	else if(var_name == "server_port"){
		server_port = atoi(var_value.c_str());
	}
	else if(var_name == "buffer_size"){
		buffer_size = atoi(var_value.c_str());
	}
	else if(var_name == "DetectProcessName"){
		i=0;
		while(i < var_value.length()){
			j=i;
			while( (var_value[i] != ',') && (i<var_value.length())){
				i++;
			}
			tmp_str.assign(var_value,j,i-j);
			dectec_process.Insert(tmp_str);
			i++;
		}
	}
	else{
		cerr<<"Invalid variable :"<<var_name<<endl;
	}
}

/*
void main()
{
	ScConfig config;
}
*/
