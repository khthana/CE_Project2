#include<stdlib.h>
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<sys/time.h>
#include<sys/ioctl.h>
#include<netinet/in.h>
#include<iostream.h>
#include<netinet/in.h>
#include<arpa/inet.h>



#include<iostream.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdlib.h>
#include<string>

#include "sc_config.h"
#include "sequence.h"
#include "dblist.h"
#include "auditdetail.h"

//#define SERVER "161.246.5.28"
//#define PORT 3000
//#define BUFFER_SIZE 256
#define AUDIT_FILE_PATH "./temp"

class ClientStatus{
	public:
		ClientStatus() { audit_packet = NULL; seq_stream = NULL; status = -1;}
		int status;
		AuditDetailPacket *audit_packet;
		Sequence * seq_stream;
		DBListNode *server_db;
};



int  ReadSeqFile(LinkList<string> & SysList, ScConfig & sc_conf, Array<SeqTree> & db,const AuditDetail & audit_detail);
void ReadSystemcallRefFile(LinkList<string> & SysList);
void ReadAuditFile(LinkList<string> & SysList, ScConfig & sc_conf, Array<SeqTree> & db,const AuditDetail & audit_detail);
string GetTime();
void PrintResult(LinkList<string> & SysList, ScConfig & sc_conf,Sequence & in_seq,const AuditDetail & audit_detail);
void WriteLogFile(LinkList<string> & SysList, ScConfig & sc_conf,Sequence & in_seq,const AuditDetailPacket & ad_packet);
int GetAuditDetail(const char * audit_name,AuditDetail & audit_detail,AuditDetailPacket & ad_packet,const int mode);

void SendSeq_FromAuditFile(ScConfig & sc_conf,LinkList<string> & SysList,const AuditDetail & audit_detail,const AuditDetailPacket & ad_packet,const int sock_fildes);
void SendSeq_FromSeqFile(ScConfig & sc_conf,const AuditDetail & audit_detail,const AuditDetailPacket & ad_packet,const int sock_fildes);


string str_hostname;

int main(int argc,char *argv[]){

	//read config file
	ScConfig sc_conf;

	int mode=0;				//this hots audit and compute
	if(argc > 1){
		if(!strcmp(argv[1],"-seq"))	//read sequence to add or cmmpare
			mode = 1;
		if(!strcmp(argv[1],"-db"))	//print normal db
			mode = 2;
		if(!strcmp(argv[1],"-c"))	//client
			mode = 3;
		if(!strcmp(argv[1],"-s"))	//server
			mode = 4;
		if(!strcmp(argv[1],"-sendseq"))	//send stream form sequence file
			mode = 5;
		if((!mode) || (!strcmp(argv[1],"-help")) ){
			cout<<"Option not found "<<endl;
			cout<<"[-seq]     read audit from sequence file"<<endl;
			cout<<"[-db]      print normal database"<<endl;
			cout<<"[-c]       ids client"<<endl;
			cout<<"[-s]       ids server"<<endl;
			cout<<"[-sendseq] send stream form sequence file to server"<<endl;
			cout<<"[-help]    help"<<endl;
			exit(-1);
		}
	}

	//define for client
	int sock_fildes;
	int addr_len,server_addrlen,client_addrlen;
	struct sockaddr_in address;
	int connect_res;
//	int client_stream_len;
//	int client_buff[BUFFER_SIZE];

	//define for server
	int server_sock_fildes,client_sock_fildes = 0;
	struct sockaddr_in server_address;
	struct sockaddr_in client_address;
	int result;
//	LinkList<int> client_status;
	fd_set  read_fildes, test_fildes;
	ClientStatus * client_status[FD_SETSIZE];
	for(int i=0;i<FD_SETSIZE;i++){
		client_status[i] = NULL;
	}
	

	sock_fildes=socket(AF_INET,SOCK_STREAM,0);
	server_sock_fildes=socket(AF_INET,SOCK_STREAM,0);

	if((mode == 3) || (mode == 5)){

		address.sin_family=AF_INET;
		address.sin_addr.s_addr=inet_addr(sc_conf.server_address.c_str());
		address.sin_port=htons(sc_conf.server_port);
		addr_len=sizeof(address);

		connect_res=connect(sock_fildes,(struct sockaddr *)&address,addr_len);
		if(connect_res == -1){
			perror("connect error");
			close(sock_fildes);
			exit(0);
		}


		int  status_return,len_cli_passwd;

//		string send_passwd = "test";
		string send_passwd = sc_conf.passwd;
		
		len_cli_passwd = sizeof(char) * ( strlen(send_passwd.c_str())+1);
		write(sock_fildes,send_passwd.c_str(),len_cli_passwd);
		read(sock_fildes,&status_return,sizeof(int));
		if(status_return == 0){
			cerr<<"passwd not match"<<endl;
			close(sock_fildes);
			exit(0);
		}




	}

	if(mode == 4){
		server_address.sin_family=AF_INET;
		server_address.sin_addr.s_addr=htonl(INADDR_ANY);
		server_address.sin_port=htons(sc_conf.server_port);
		server_addrlen=sizeof(server_address);
		
		bind(server_sock_fildes,(struct sockaddr *)&server_address,server_addrlen);

		listen(server_sock_fildes,5);

		FD_ZERO(&read_fildes);
		FD_SET(server_sock_fildes,&read_fildes);

	}


	int fd,len_audit_name;
	char  audit_name[100];
	LinkList<string> SysList;
	

	DBList dbl(sc_conf);
	DBListNode * temp_dbln;
	AuditDetail audit_detail;
	AuditDetailPacket ad_packet;

	char char_hostname[50];
	size_t len_hostname=50;
	gethostname(char_hostname,len_hostname);
	str_hostname.assign(char_hostname,0,strlen(char_hostname));


	
	ReadSystemcallRefFile(SysList);
	
	if( (mode != 3) && (mode != 5)){
		LinkListNode<string> * temp_str = sc_conf.dectec_process.GetHeadPosition();
		while(temp_str){
			dbl.Insert(temp_str->name);
			temp_str = temp_str->next;
		}
	}

	switch(mode){
	
		case 0 : //if mode=0 read audit form audit file
		
			fd = open("/dev/auditsuccess",O_RDONLY);
			if(fd == -1){
				cerr<<endl<<"ERROR can't open /dev/auditsuccess";
				exit(-1);
			}
	
			while(1){
				len_audit_name = read(fd,audit_name,100);
				if(len_audit_name == -1){
					cerr<<endl<<"ERROR can't read /dev/auditsuccess";
					exit(-1);	
				}
		
				if(len_audit_name > 0){

					if(GetAuditDetail(audit_name,audit_detail,ad_packet,mode)){			
						temp_dbln = dbl.GetDBNode(audit_detail.process_name);
						ReadAuditFile(SysList,sc_conf,temp_dbln->DB,audit_detail);
						if(sc_conf.add_to_db){
							temp_dbln->WriteDB_File();
						}
					}

//				str_command = "/bin/rm " + new_audit_file;
//				system(str_command.c_str());
				}
			}
			close(fd);
			break;
		
		
		case 1://if mode=1 read audit form sequence file
		
			if(argc == 3){
				if(GetAuditDetail(argv[2],audit_detail,ad_packet,mode)){
					temp_dbln = dbl.GetDBNode(audit_detail.process_name);
					ReadSeqFile(SysList,sc_conf,temp_dbln->DB,audit_detail);
					if(sc_conf.add_to_db){
						temp_dbln->WriteDB_File();
					}
				}
			
			}
			else{
				cout<<"Please enter sequence file name"<<endl;
			}
		
			break;

		case 2:
			if(argc == 3){
				dbl.PrintDBNode(argv[2]);
			}
			else{
				cout<<"Please enter name db"<<endl;
			}
			break;

		case 3:
/*			char tmp[100];
			int client_stream_len,status;
			int client_buff[1024];
			while(1){
				cout<<"input  :";
				cin>>tmp;
				client_buff[0] = 50;
				client_buff[1] = 6;
				for(int i=0;i < 50;i++){
					client_buff[i+2] = i;
				}
				client_stream_len = sizeof(int) * 52;
				write(sock_fildes,(char*)&client_buff,client_stream_len);
				

				
//				read(sock_fildes,&ch3,1);
				
			}
*/
			fd = open("/dev/auditsuccess",O_RDONLY);
			if(fd == -1){
				cerr<<endl<<"ERROR can't open /dev/auditsuccess";
				exit(-1);
			}
	
			while(1){
				len_audit_name = read(fd,audit_name,100);
				if(len_audit_name == -1){
					cerr<<endl<<"ERROR can't read /dev/auditsuccess";
					exit(-1);	
				}
		
				if(len_audit_name > 0){

					if(GetAuditDetail(audit_name,audit_detail,ad_packet,mode)){
//						write(sock_fildes,(char*)&ad_packet,sizeof(ad_packet));
						SendSeq_FromAuditFile(sc_conf,SysList,audit_detail,ad_packet,sock_fildes);
					}

//				str_command = "/bin/rm " + new_audit_file;
//				system(str_command.c_str());
				}
			}
			close(fd);	

			break;
		case 4:
			while(1){
				int server_buff[sc_conf.buffer_size];
				int server_stream_len;
				int len_recive,cmd,status;
				int re;
				unsigned long int total_stream_recive = 0;
				string tmp_process_name;
				AuditDetailPacket ad_server;
				AuditDetail audit_detail_sever;
				char recive_passwd[51];
//				Sequence stream_seq(sc_conf);

			
		
				int fildes;
				int nread;


				test_fildes=read_fildes;
//				printf("Server waiting\n");
				result=select(FD_SETSIZE,&test_fildes,(fd_set *)0,(fd_set *)0,(struct timeval *)0);
				if(result < 1){
					perror("server5");
					exit(1);
				}
		
				for(fildes=0;fildes < FD_SETSIZE;fildes++){
					if(FD_ISSET(fildes,&test_fildes)){
						if(fildes == server_sock_fildes){
							client_sock_fildes=accept(server_sock_fildes,(struct sockaddr *)&client_address,
								(socklen_t *)&client_addrlen);
							FD_SET(client_sock_fildes,&read_fildes);
							printf("adding client on fildes %d\n",client_sock_fildes);
						//	client_status.Insert(client_sock_fildes,-5);
							client_status[client_sock_fildes] = new ClientStatus();
							assert(client_status[client_sock_fildes]);
							client_status[client_sock_fildes]->status = -4;
							
							
						}else{
							ioctl(fildes,FIONREAD,&nread);

							if(nread==0){
								close(fildes);
								FD_CLR(fildes,&read_fildes);
								printf("Removeing client on fildes %d\n",fildes);
						//		client_status.Remove(fildes);
								if(client_status[fildes]){
									delete client_status[fildes];
									client_status[fildes] = NULL;
								}
							}else{
								status = client_status[fildes]->status;
								switch(status){
	


								case -4: 	read(fildes,&recive_passwd,50);
										 //cout<<recive_passwd<<endl;
										 if(0 == strcmp(sc_conf.passwd.c_str(),recive_passwd)){
											re = 1;
											write(fildes,(char*)&re,sizeof(int));
											client_status[client_sock_fildes]->status = -5;
										 }
										 else{
											re=0;
											write(fildes,(char*)&re,sizeof(int));
											close(fildes);
											FD_CLR(fildes,&read_fildes);
											printf("passwd not match Removeing client on fildes %d\n",fildes);
											if(client_status[fildes]){
												delete client_status[fildes];
												client_status[fildes] = NULL;
											}
									 	}
										break;
					


								case -5:	
										read(fildes,&ad_server,sizeof(ad_server));
								//		client_status.SetValue(fildes,-6);
										tmp_process_name.assign(ad_server.process_name,0,strlen(ad_server.process_name));
								//		server_db = dbl.GetDBNode(tmp_process_name);
								//		stream_seq.ClearSequence();
										client_status[fildes]->status = -6;
										client_status[fildes]->audit_packet = new AuditDetailPacket(ad_server);
										client_status[fildes]->seq_stream = new Sequence(sc_conf);
										client_status[fildes]->server_db = dbl.GetDBNode(tmp_process_name);
										write(fildes,&re,sizeof(int));
										total_stream_recive =0;
										break;
									
									case -6:
										read(fildes,&len_recive,sizeof(int));
										read(fildes,&cmd,sizeof(int));
										if( (len_recive) > 0){
											server_stream_len  = len_recive * sizeof(int);
											read(fildes,&server_buff,server_stream_len);
								
										}
										total_stream_recive += len_recive;
										
						//				cout<<"Cmd :"<<cmd<<endl;
						//				cout<<"Len :"<<len_recive<<endl;
										for(int i=0; i< len_recive; i++){
						//					cout<<i<<":"<<server_buff[i]<<" ";
											if(0 == client_status[fildes]->seq_stream->ReadNext(server_buff[i])) break;
											if(client_status[fildes]->seq_stream->GetFull()){
												if(sc_conf.add_to_db)
													client_status[fildes]->seq_stream->AddToDB(client_status[fildes]->server_db->DB);
												else
													client_status[fildes]->seq_stream->CmpSeq(client_status[fildes]->server_db->DB);
											}
							

										}

						//				cout<<endl;
						//				cout<<"total stream :"<<total_stream_recive<<endl;

										if(cmd == 5){
											WriteLogFile(SysList,sc_conf,*client_status[fildes]->seq_stream,*client_status[fildes]->audit_packet);

											if(sc_conf.add_to_db){
												client_status[fildes]->server_db->WriteDB_File();
											}
											
											client_status[fildes]->status = -5;
	
											if(client_status[fildes]->audit_packet){
												delete client_status[fildes]->audit_packet;
												client_status[fildes]->audit_packet = NULL;
											}
											if(client_status[fildes]->seq_stream){
												delete client_status[fildes]->seq_stream;
												client_status[fildes]->seq_stream = NULL;
											}
										}

										cout<<endl;
										write(fildes,&re,sizeof(char));

										break;
								}

//								read(fildes,&ad_server,sizeof(ad_server));
//								cout<<ad_server;
							}
						}
					}
				}
			}
				break;

		case 5:		//if mode=1 read audit form sequence file
		
			if(argc == 3){
				if(GetAuditDetail(argv[2],audit_detail,ad_packet,1)){
					SendSeq_FromSeqFile(sc_conf,audit_detail,ad_packet,sock_fildes);
				}
			
			}
			else{
				cout<<"Please enter sequence file name"<<endl;
			}
			break;

		default: 	break;
		
	}
	return 0;
}


int  GetAuditDetail(const char * audit_name,AuditDetail & audit_detail,AuditDetailPacket & ad_packet,const int mode){
	
	int i,j;
	int name_len = strlen(audit_name);
	string str_uid,str_pid,process_name,audit_file,new_audit_file,str_command,str_time;
	string str_uname="Sua Injoy";
	

	j=i=0;
	while( (audit_name[i] != '-' && (i < name_len) )){
		if(audit_name[i] == '/')
			j=i+1;
		i++;
	}
	if(i >= name_len){
		cout<<"ERROR in audit file name uid"<<endl;
		return 0;
	}
	str_uid.assign(audit_name,j,i-j);
			
	i++;
	j=i;
	while((audit_name[i] != '-') && (i < name_len)){
		i++;
	}	
	if(i >= name_len){
		cout<<"ERROR in audit file name pid"<<endl;
		return 0;
	}

	str_pid.assign(audit_name,j,i-j);

	switch(mode){
		case 0:
		case 3:
			i++;
			j=i;
			while( (audit_name[i] != '.') && (i < name_len) ){
				i++;
			}
			if(i >= name_len){
				cout<<"ERROR in audit file name process name 1"<<endl;
				return 0;
			}

			process_name.assign(audit_name,j,i-j);
			str_time = GetTime();
			break;

		case 1:
			i++;
			j=i;
			while((audit_name[i] != '-') && (i < name_len)){
				i++;
			}	
			if(i >= name_len){
				cout<<"ERROR in audit file name process name 2"<<endl;
				return 0;
			}

			process_name.assign(audit_name,j,i-j);
	

			i++;
			j=i;
			while( (audit_name[i] != '.') && (i < name_len) ){
				i++;
			}
			if(i >= name_len){
				cout<<"ERROR in audit file name time"<<endl;
				return 0;
			}

			str_time.assign(audit_name,j,i-j);
			break;
		
	}

	
	audit_file.assign(audit_name,0,strlen(audit_name));
	
	switch(mode){
		case 0 :
		case 3 :
			new_audit_file = audit_file + ".New";
			audit_detail.SetDetail(str_uid,str_uname,str_pid,process_name,new_audit_file,str_time);
			if(mode == 3){
				ad_packet.SetDetail(str_uid,str_uname,str_hostname,str_pid,process_name,str_time);
			}
			str_command = "/bin/mv " + audit_file +" " +  new_audit_file;
			system(str_command.c_str());
			break;
			
		case 1 :
			audit_detail.SetDetail(str_uid,str_uname,str_pid,process_name,audit_file,str_time);
			//this for mode 5 send seq stream from seq file
			ad_packet.SetDetail(str_uid,str_uname,str_hostname,str_pid,process_name,str_time);
			break;
	}
		

	return 1;
}





int  ReadSeqFile(LinkList<string> & SysList, ScConfig & sc_conf, Array<SeqTree> & db,const AuditDetail & audit_detail){
	
	Sequence in_seq(sc_conf);
	
	ifstream seq_stream(audit_detail.file_name.c_str());
	int element;
        
	if(!seq_stream.is_open()){
		cerr<<endl<<"ERROR Cannot open sequence file "
		    <<audit_detail.file_name.c_str()<<endl;
		return -1;
	}

	seq_stream>>element;
	while(!seq_stream.eof()){
//		if(element == -1) break;
		if(0 == in_seq.ReadNext(element)) break;
		if(in_seq.GetFull()){
			if(sc_conf.add_to_db)
				in_seq.AddToDB(db);
			else
				in_seq.CmpSeq(db);
		}
		seq_stream>>element;
	}
	seq_stream.close();
	PrintResult(SysList,sc_conf,in_seq,audit_detail);
	return 0;
}


void ReadAuditFile(LinkList<string> & SysList, ScConfig & sc_conf,Array<SeqTree> & db,const AuditDetail & audit_detail){

	string str_audit,sys_name;
	Sequence in_seq(sc_conf);
	unsigned int i;
	int value;

	string seq_file_name = "./seq/" +audit_detail.uid + "-" + audit_detail.pid + "-" +  audit_detail.process_name +"-"+ audit_detail.time + ".seq";

	ifstream audit_file(audit_detail.file_name.c_str());
	
	ofstream seq_file;
	if(sc_conf.keep_seq_file){
		seq_file.open(seq_file_name.c_str());
	}

	if(!audit_file.is_open()){
		cout<<endl<<"Connot opend file : "<<audit_detail.file_name;
		return;
	}

	if(audit_file.eof()){
		cout<<endl<<"Audit file not contrain audit data ";
		return;
	}
	
	getline(audit_file,str_audit);
	while(!audit_file.eof()){
		
		i=0;
		while( (str_audit[i] != '(') && ( i < str_audit.length())){
			i++;
		}

		if(i == str_audit.length()){
			cout<<endl<<"Error in Audit file";
			exit(-1);
		}
		
		sys_name.assign(str_audit,0,i);
		
		value = SysList.GetValue(sys_name);
		if(sc_conf.keep_seq_file == 1){
			seq_file<<value<<" ";
		}
		if(sc_conf.keep_seq_file == 2){
			seq_file<<sys_name<<" "<<value<<endl;
		}
		
		

		in_seq.ReadNext(value);
		if(in_seq.GetFull()){
			if(sc_conf.add_to_db)
				in_seq.AddToDB(db);
			else
				in_seq.CmpSeq(db);		//should past db only
		}
		

		getline(audit_file,str_audit);
	}
	
	if(sc_conf.keep_seq_file){
		seq_file<<"-1";
	}
	audit_file.close();

	PrintResult(SysList,sc_conf,in_seq,audit_detail);
	
	if(sc_conf.keep_seq_file){
		seq_file.close();
	}
}

	



void SendSeq_FromSeqFile(ScConfig & sc_conf,const AuditDetail & audit_detail,const AuditDetailPacket & ad_packet,const int sock_fildes){
	
	
	ifstream seq_stream(audit_detail.file_name.c_str());
	int element;
	unsigned long int total_len;
	int client_buff[sc_conf.buffer_size],stream_len,status_return;

	
	write(sock_fildes,(char*)&ad_packet,sizeof(ad_packet));
	read(sock_fildes,&status_return,sizeof(int));
        
	if(!seq_stream.is_open()){
		cerr<<endl<<"ERROR Cannot open sequence file "
		    <<audit_detail.file_name.c_str()<<endl;
		exit(1);
	}

	seq_stream>>element;
	total_len = 0;
	stream_len = 2;
	while(!seq_stream.eof()){

		if(stream_len < sc_conf.buffer_size){
			client_buff[stream_len] = element;
			stream_len ++;
			total_len ++;
		}else{
			client_buff[0] = stream_len-2;
			client_buff[1] = 4;

//			for(i=0;i< stream_len; i++){
//				cout<<" "<<(i-2)<<":"<<client_buff[i];
//			}
//			cout<<"total :"<<total_len<<endl;
			stream_len = sizeof(int) * stream_len;
			write(sock_fildes,(char*)&client_buff,stream_len);
			read(sock_fildes,&status_return,sizeof(int));
			
//			cout<<endl<<"new:";
			
			stream_len = 2;
			client_buff[stream_len] = element;
			stream_len++;
			total_len ++;
			
		}
		seq_stream>>element;
	}
	//in seqfile contain -1 do not put -1 in buffer
	client_buff[0] = stream_len-2;
	client_buff[1] = 5;

//	for(i=0;i<stream_len; i++){
//		cout<<" "<<(i-2)<<":"<<client_buff[i];
//	}
		
	stream_len = sizeof(int) * stream_len;
	write(sock_fildes,(char*)&client_buff,stream_len);
	read(sock_fildes,&status_return,sizeof(int));
	


	cout<<endl<<"Send file "<<audit_detail.file_name;
	cout<<endl<<"total"<<total_len<<endl;

	seq_stream.close();
}



void SendSeq_FromAuditFile(ScConfig & sc_conf,LinkList<string> & SysList,const AuditDetail & audit_detail,const AuditDetailPacket & ad_packet,const int sock_fildes){

	string str_audit,sys_name;
	unsigned int i;
	unsigned long int total_len;
	int client_buff[sc_conf.buffer_size],stream_len,status_return;

	string seq_file_name = "./seq/" +audit_detail.uid + "-" + audit_detail.pid + "-" +  audit_detail.process_name +"-"+ audit_detail.time + ".seq";


	write(sock_fildes,(char*)&ad_packet,sizeof(ad_packet));
	read(sock_fildes,&status_return,sizeof(int));

	ifstream audit_file(audit_detail.file_name.c_str());
//	ofstream seq_file(seq_file_name.c_str());

	if(!audit_file.is_open()){
		cout<<endl<<"Connot opend file : "<<audit_detail.file_name;
		return;
	}

	if(audit_file.eof()){
		cout<<endl<<"Audit file not contrain audit data ";
		return;
	}
	
	stream_len = 2;
	total_len =0;
	getline(audit_file,str_audit);
	while(!audit_file.eof()){
		

		i=0;
		while( (str_audit[i] != '(') && ( i < str_audit.length())){
			i++;
		}

		if(i == str_audit.length()){
			cout<<endl<<"Error in Audit file";
			exit(-1);
		}
		
		sys_name.assign(str_audit,0,i);
		
		if(stream_len < sc_conf.buffer_size){
			client_buff[stream_len] = SysList.GetValue(sys_name);
			stream_len ++;
			total_len++;
		}else{
			client_buff[0] = stream_len-2;
			client_buff[1] = 4;
	// not show seq to  send
	//		for(int j=0;j< stream_len; j++){
	//			cout<<" "<<(j-2)<<":"<<client_buff[j];
	//		}
			stream_len = sizeof(int) * stream_len;
			write(sock_fildes,(char*)&client_buff,stream_len);
			read(sock_fildes,&status_return,sizeof(int));
			
//			cout<<endl<<"toatal :"<<total_len;
//			cout<<endl<<"new:";
			
			stream_len = 2;
			client_buff[stream_len] = SysList.GetValue(sys_name);
			stream_len++;
			total_len++;
		}
		
//		seq_file<<value<<" ";

		
		
		getline(audit_file,str_audit);
	}

		client_buff[stream_len] = -1;
		stream_len ++;
		total_len ++;
		client_buff[0] = stream_len-2;
		client_buff[1] = 5;

//		for(int j=0;j<stream_len; j++){
//			cout<<" "<<(j-2)<<":"<<client_buff[j];
//		}
		
		stream_len = sizeof(int) * stream_len;
		write(sock_fildes,(char*)&client_buff,stream_len);
		read(sock_fildes,&status_return,sizeof(int));

	cout<<endl<<"Send Process "<<audit_detail.process_name<<" PID:"<<audit_detail.pid;
	cout<<endl<<"total"<<total_len<<endl;;

//	seq_file<<"-1";
	audit_file.close();

//	PrintResult(SysList,sc_conf,in_seq,audit_detail);
	
//	seq_file.close();
}


void ReadSystemcallRefFile(LinkList<string> & SysList)
{
	
	string str_conf;
	string var_name;
	string var_value;
	unsigned int i=0;

	
	ifstream config_file("sys_data.ref");
	

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

	getline(config_file,str_conf);
	while(!config_file.eof()){
		int first =i = 0;
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
		while((i<str_conf.length()) && (!isspace(str_conf[i])) 
			&&(str_conf[i] != '#')){
			i++;
		}

		var_value.assign(str_conf,first,i-first);
		SysList.Insert(var_name,atoi(var_value.c_str()));
		getline(config_file,str_conf);
	}
	config_file.close();
}

string GetTime(){
	time_t	timer;
	struct tm * tblock;
	string str;
	timer = time(NULL);
	tblock = localtime(&timer);
	str = asctime(tblock);
	str.assign(str,0,str.length() - 1);
	return str;
}

void PrintResult(LinkList<string> & SysList, ScConfig & sc_conf,Sequence & in_seq,const AuditDetail & ad){
	
	AuditDetailPacket ad_packet(ad.uid,ad.uname,str_hostname,ad.pid,ad.process_name,ad.time);
	WriteLogFile(SysList,sc_conf,in_seq,ad_packet);
}


void WriteLogFile(LinkList<string> & SysList, ScConfig & sc_conf,Sequence & in_seq,const AuditDetailPacket & ad_packet){
	string MailAlert = "mailto root -s \"IDS Alert  ";
	
	if(sc_conf.report_all || ( in_seq.GetNumAnomall() >= sc_conf.num_alert)){
	
		if( (sc_conf.add_to_db == 0) && ( in_seq.GetNumAnomall() >= sc_conf.num_alert) ){
			MailAlert = MailAlert +" Date:" + ad_packet.time + " HostName:" + ad_packet.hostname + " UserID:" + ad_packet.uid +  "\" <> ~.";
			system(MailAlert.c_str());
		}
	
		if(sc_conf.print_result){
			cout<<endl<<ad_packet<<endl;
			in_seq.PrintAnomallSeq();
			cout<<endl;
		}
		
		ofstream logfile("audit.log", ios::app);
		if(!logfile){
			cerr<<"Log file could not be opened"<<endl;
			exit(1);
		}
	
		logfile<<"Time :"<<ad_packet.time<<endl;
		logfile<<"HostName :"<<ad_packet.hostname<<endl;
//		logfile<<"UserID :"<<ad_packet.uid<<"\t UserName :"<<ad_packet.uname<<endl;
		logfile<<"UserID :"<<ad_packet.uid<<endl;
		logfile<<"ProcessID "<<ad_packet.pid<<"\t ProcessName :"<<ad_packet.process_name<<endl;
//		in_seq.WriteAnomallDetail(logfile);
		in_seq.WriteAnomallDetail(logfile,SysList);
		logfile<<endl<<"<----------------------------------------------------------------------->"<<endl<<endl;
		logfile.close();
	}
}















