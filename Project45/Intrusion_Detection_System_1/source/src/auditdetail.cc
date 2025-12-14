#include "auditdetail.h"
AuditDetail::AuditDetail(const string Uid,const string Uname,const string Pid,const string ProcessName,const string FileName,const string Time){
	uid = Uid;
	uname = Uname;
	pid = Pid;
	process_name = ProcessName;
	file_name = FileName;
	time = Time;
}

AuditDetail::AuditDetail(const AuditDetail & ad){
	uid = ad.uid;
	uname = ad.uname;
	pid = ad.pid;
	process_name = ad.process_name;
	file_name = ad.file_name;
	time = ad.time;
}

void AuditDetail::SetDetail(const string Uid,const string Uname,const string Pid,const string ProcessName,const string FileName,const string Time){
	uid = Uid;
	uname = Uname;
	pid = Pid;
	process_name = ProcessName;
	file_name = FileName;
	time = Time;
}

ostream & operator<<(ostream &s,const AuditDetail & ad){
//	s<<"User ID:"<<ad.uid<<"  User Name:"<<ad.uname<<endl
	s<<"User ID:"<<ad.uid<<endl
	 <<"Process ID:"<<ad.pid<<"   Process Name:"<<ad.process_name<<endl
	 <<"Time:"<<ad.time;
	return s;
}


AuditDetailPacket::AuditDetailPacket(const string Uid,const string Uname,const string Hostname,const string Pid,const string ProcessName,const string Time){
	SetDetail(Uid,Uname,Hostname,Pid,ProcessName,Time);
}


AuditDetailPacket::AuditDetailPacket(const AuditDetailPacket & ad){
	SetDetail(ad.uid,ad.uname,ad.hostname,ad.pid,ad.process_name,ad.time);
}



void AuditDetailPacket::SetDetail(const string Uid,const string Uname,const string Hostname,const string Pid,const string ProcessName,const string Time){
	strcpy(uid,Uid.c_str());
	strcpy(uname,Uname.c_str());
	strcpy(hostname,Hostname.c_str());
	strcpy(pid,Pid.c_str());
	strcpy(process_name,ProcessName.c_str());
	strcpy(time,Time.c_str());	
}



ostream & operator<<(ostream &s,const AuditDetailPacket & ad){

//	s<<"UserID:"<<ad.uid<<"  UserName:"<<ad.uname<<endl
	s<<"User ID:"<<ad.uid<<endl
	 <<"Hostname:"<<ad.hostname<<endl
	 <<"ProcessID:"<<ad.pid<<"   ProcessName:"<<ad.process_name<<endl
	 <<"Time :"<<ad.time;
	return s;

}


