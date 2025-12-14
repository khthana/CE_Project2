#ifndef _DB_LIST_NODE_H
#define _DB_LIST_NODE_H

#include <string>
#include <fstream.h>
#include <stdio.h>

#include "t_array.h"
#include "sc_config.h"
#include "seqtree.h"


class DBListNode{
public:
	DBListNode(string Name,int Len,int Size);
	int ReadDB_File();
	int WriteDB_File();
	void PrintDB();
	
	string		dbname;
	string 		str_seq_length;
	int 		seq_length;
	Array<SeqTree> 	DB;
	DBListNode 	*next;
};

DBListNode::DBListNode(string Name,int Len,int Size){
	char tmp_seql[6];
	dbname = Name;
	seq_length = Len;
	sprintf(tmp_seql,"%d",Len);
	str_seq_length = tmp_seql;
	DB.Allocate(Size);
	next = NULL;
}

void DBListNode::PrintDB(){
	cout<<"DB name:"<<dbname<<" Length:"<<seq_length;
	for(int i=0; i<DB.Size() ; i++){
		if(-1 != DB[i].GetRoot()){
			DB[i].ShowDiffSeq();
		}
	}
}

int DBListNode::ReadDB_File(){
	
	 int root,db_seq_length,db_size=0;
	 string temp,db_name;

	 db_name = "./normal_db/" + dbname + "_"+ str_seq_length +".db";

	 ifstream db_stream(db_name.c_str());
	 if(!db_stream.is_open()){
		 cerr<<endl<<"WANNING Cannot  open database file "
	             <<db_name<<endl;
		 return 0;
	}

	 db_stream>>temp;
	 if(temp != "#Seq_length:"){
		 cerr<<endl<<"WANNING invalid in database file format"<<endl;
		 return 0;
	 }
	
	 db_stream>>db_seq_length;
	 if(db_seq_length != seq_length){
	 	cerr<<endl<<"WANNING Dabase sequence length not match"
		    <<endl;
		return 0;
	}

	db_stream>>root;
	while(!db_stream.eof()){
		if(root == -1) break;
		DB[root].SetLength(seq_length);
		db_stream>>DB[root];
		db_size += DB[root].GetNumNode();
		db_stream>>root;
	}
	db_stream.close();

	return db_size;
}


int  DBListNode::WriteDB_File(){
	
	string db_name;

	db_name = "./normal_db/" + dbname + "_"+ str_seq_length +".db";
	ofstream db_file(db_name.c_str());

	if(!db_file.is_open()){
		cerr<<endl<<"ERROR Cannot open database file"
		    <<db_name<<endl;
		return 0;
	}

	db_file<<"#Seq_length: "<<seq_length<<endl;

	for(int i=0; i < DB.Size() ; i++){
		if(-1 != DB[i].GetRoot()){
			db_file<<i<<endl;
			db_file<<DB[i]<<endl;			
		}
	}
	db_file<<"-1"<<endl;
	db_file.close();
	return 1;
}
#endif
