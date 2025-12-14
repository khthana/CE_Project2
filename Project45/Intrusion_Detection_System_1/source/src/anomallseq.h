#ifndef ANOMALL_SEQ_H
#define ANOMALL_SEQ_H

#include "t_array.h"
#include "t_linklist.h"
#include <string>

class AnomallSeq{
public:
	AnomallSeq() { seq =NULL; next = NULL;}
	Array<int> *seq;
	AnomallSeq * next;
};


class AnomallSeqLink{
public:
	AnomallSeqLink() { root = NULL;}
	~AnomallSeqLink();
	void InsertSeq(Array<int> & seq);
	friend ostream &operator<<(ostream & s,const AnomallSeqLink & Aseq);
	friend ofstream & operator<<(ofstream & out_file,const AnomallSeqLink & Aseq);
	void WriteSeqToFile(ofstream & out_file,LinkList<string> & SysList);
	
	AnomallSeq * root;
};

#endif

