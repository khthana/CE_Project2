#ifndef _DB_LIST_H
#define _DB_LIST_H

#include "dblistnode.h"


class  DBList{
public:
	DBList(ScConfig & sc_conf);
	~DBList();
	void Insert(const string  name);
	void PrintDBNode(const string  name);
	void PrintDBAll();
	DBListNode *  GetDBNode(const string name);
//	friend ostream &operator<<(ostream & s,const DBList & dbl);
	
	DBListNode * DBHead;
	int	seq_length;
	int 	max_diff_sc;
};

DBList::DBList(ScConfig & sc_conf){
	seq_length = sc_conf.seq_length;
	max_diff_sc = sc_conf.max_diff_sc;
	DBHead = NULL;
}

void DBList::Insert(const string name)
{
	DBListNode *temp_ptr,*temp_new;
	
	temp_ptr = DBHead;
	if(temp_ptr){
		while(temp_ptr->next != NULL)
			temp_ptr = temp_ptr->next;
	}

	temp_new = new DBListNode(name,seq_length,max_diff_sc);
	assert(temp_new);
	temp_new->ReadDB_File();

	if(DBHead == NULL)
		DBHead=temp_new;
	else
		temp_ptr->next = temp_new;

}

void DBList::PrintDBNode(const string name){
	DBListNode *temp_ptr;

	temp_ptr = GetDBNode(name);
	if(temp_ptr)
		temp_ptr->PrintDB();
	else
		cout<<"Can't not print DB "<<name;
}

DBListNode *  DBList::GetDBNode(const string name){
	DBListNode * temp_ptr;
	
	temp_ptr = DBHead;
	while(temp_ptr){
		if(temp_ptr->dbname == name)
			break;
		else
			temp_ptr = temp_ptr->next;
	}
	return temp_ptr;
}

void DBList::PrintDBAll(){
	DBListNode *temp_ptr;
	if(DBHead){
		temp_ptr = DBHead;
		while(temp_ptr){
			temp_ptr->PrintDB();
			temp_ptr = temp_ptr->next;	
		}
	}
	else
		cout<<"No DBNode"<<endl;
}


/*ostream &operator<<(ostream & s,const DBList & db)
{
	int i,size;
	DBListNode *temp_ptr;
	temp_ptr = db.DBhead;
	while(temp_ptr){
		s<<endl<<*temp_ptr->name<<endl;
		
		size = temp_ptr->DB->Size();
		for(i=0;i < size ; i++){
			if(-1 != temp_ptr->DB[i]->GetRoot())			
		}
		
		temp_ptr = temp_ptr->next;
	}
	return s;

}
*/

DBList::~DBList()
{
	DBListNode *temp_ptr;
	while(DBHead){
		temp_ptr = DBHead;
		DBHead = DBHead->next;
		delete temp_ptr;
	}
}

#endif

/*
void main(){
	ScConfig sc_conf;
	DBList dbl(sc_conf);

	dbl.Insert("ls");
	dbl.Insert("ps");
	dbl.Insert("cat");
	
	DBListNode * ptr = dbl.GetDBNode("ps");
	ptr->PrintDB();
//	dbl.PrintDBAll();

//	bl.PrintDBNode("ls");

//	DBListNode dbn("ls",sc_conf.seq_length,sc_conf.max_diff_sc);
//	dbn.ReadDB_File();
//	dbn.WriteDB_File();
//	dbn.PrintDB();
}
*/
