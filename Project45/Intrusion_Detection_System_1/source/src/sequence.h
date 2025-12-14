#ifndef _SEQUENCE_H
#define _SEQUENCE_H

#include "t_array.h"
#include "anomallseq.h"
#include "seqtree.h"
#include "sc_config.h"
#include "auditdetail.h"

class Sequence{
public:
	Sequence(const ScConfig & sc_conf);
	~Sequence();
	int  ReadNext(const int value);
	void AddToDB(Array<SeqTree> & db);
	void CmpSeq(const Array<SeqTree> & db);
	int GetHMDMax() {return hmd_max;}
	int GetNumAnomall() {return num_anomall;}
	void ComputeHMD(const Array<SeqTree> & db);
	int GetFull() {return full;}
	AnomallSeq *GetAnomallSeql() { return anomall_seq->root;}
	void ClearSequence();
	void PrintAnomallSeq();
	void WriteAnomallDetail(ofstream & out_file);
	void WriteAnomallDetail(ofstream & out_file,LinkList<string> &SysList);



private:
	Array<int> seq;
	AnomallSeqLink *anomall_seq;
	int seq_length;
	int seq_count;
	int full;
//	int total_read;
	int hmd_max;
	int num_anomall;
	int keep_anomall_seq;
	int compute_hmd;
};

#endif
