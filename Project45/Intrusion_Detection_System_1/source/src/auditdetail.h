#ifndef AUDIT_DETAIL_H
#define AUDIT_DETAIL_H

#include <string>
#include <iostream.h>

class AuditDetail{
public:
	AuditDetail() {};
	AuditDetail(const string Uid,const string Uname,const string Pid,const string ProcessName,const string FileName,const string Time);
	AuditDetail(const AuditDetail & ad);
	void SetDetail(const string Uid,const string Uname,const string Pid,const string ProcessName,const string FileName,const string Time);
	friend ostream &operator<<(ostream &s,const AuditDetail & ad);
	string	uid;
	string 	pid;
	string  uname;
	string 	process_name;
	string	file_name;
	string 	time;
};

class AuditDetailPacket{
public:
	AuditDetailPacket() {};
	AuditDetailPacket(const string Uid,const string Uname,const string Hostname,const string Pid,const string ProcessName,const string Time);
	AuditDetailPacket(const AuditDetailPacket & ad);
	void SetDetail(const string Uid,const string Uname,const string Hostname,const string Pid,const string ProcessName,const string Time);
	friend ostream &operator<<(ostream &s,const AuditDetailPacket & ad);
	char	uid[10];
	char 	uname[50];
	char 	hostname[50];
	char  	pid[10];
	char  	process_name[100];
	char  	time[40];
};

#endif



