#include "sequence.h"
#include <fstream.h>

Sequence::Sequence(const ScConfig & sc_conf)
{
	seq.Allocate(sc_conf.seq_length);
	seq_length = sc_conf.seq_length;
	compute_hmd = sc_conf.hmd_on;
	
	if( sc_conf.report_anomall_seq){
		keep_anomall_seq = 1;
		anomall_seq = new AnomallSeqLink();
		assert(anomall_seq);
	}
	else{
		keep_anomall_seq = 0;
		anomall_seq = NULL;
	}

	seq_count = 0;
	full = 0;
	hmd_max = 0;
	num_anomall = 0;
}

Sequence::~Sequence()
{
	if(anomall_seq)
		delete anomall_seq;
}

void Sequence::ClearSequence()
{
	seq_count = 0;
	full =0;
	hmd_max = 0;
	if(anomall_seq)
	{
		delete anomall_seq;
		anomall_seq = new AnomallSeqLink();
		assert(anomall_seq);
	}
	
}

//return 0;if end of input sequence
//return 1;otherwise
int  Sequence::ReadNext(const int value)
{
	int i;
	if(value == -1){
		full = 0;
		seq_count = 0;
		return 0;	
	}
	else{
//		total_read++;
		if(seq_count < seq_length){
			seq[seq_count] = value;
			seq_count++;
			if(seq_count == seq_length)
				full = 1;
		}
		else{
			for(i=0; i< (seq_length-1); i++)
				seq[i] = seq[i+1];

			seq[i] = value;
		}
	}
	return 1;	
}

void  Sequence::AddToDB(Array<SeqTree> & db)
{

	if( db[seq[0]].GetRoot() == -1){
		db[seq[0]].SetRoot(seq[0]);
		db[seq[0]].SetLength(seq_length);
	}
	//if count new seq  do search seq and count
	db[seq[0]].InsertSeq(seq,0,seq_length-1);
}

void Sequence::CmpSeq(const Array<SeqTree> & db)
{
	int found=0;
	
//	for(int i=0; (i < db.Size()) && (found == 0) ; i++){
//		if(db[i].GetRoot() != -1){
			found = db[seq[0]].SearchSeq(seq,0,seq_length-1);
//		}
//	}

	if(!found){
//		cout<<endl<<"cmp :"<<seq<<" NumAnomall->"<<(num_anomall +1);
//		cout<<endl<<db[seq[0]];
		if(keep_anomall_seq && anomall_seq){
			anomall_seq->InsertSeq(seq);
		}
		num_anomall++;	
	}
	if( (found == 0) && (compute_hmd)){
		ComputeHMD(db);
	}

}

void Sequence::PrintAnomallSeq()
{
	
	if(compute_hmd)
		cout<<"Hamming Distance :"<<hmd_max<<endl;
	
	cout<<"Number of Anomall Sequence :"<<num_anomall;

	if(keep_anomall_seq)
		cout<<*anomall_seq<<endl;
}

void Sequence::WriteAnomallDetail(ofstream & out_file){

	if(compute_hmd)
		out_file<<"Hamming Distance :"<<hmd_max<<endl;
	
	out_file<<"Number of Anomall Sequence :"<<num_anomall;

	if(keep_anomall_seq)
		out_file<<*anomall_seq<<endl;
}


void Sequence::WriteAnomallDetail(ofstream & out_file,LinkList<string> & SysList){

	if(compute_hmd)
		out_file<<"Hamming Distance :"<<hmd_max<<endl;
	
	out_file<<"Number of Anomall Sequence :"<<num_anomall;

	if(keep_anomall_seq){
		anomall_seq->WriteSeqToFile(out_file,SysList);
	}
}


void Sequence::ComputeHMD(const Array<SeqTree> & db)
{
	int miss,total_miss;

	total_miss = seq_length;
	for(int i=0; i < db.Size() ;i++)
	{
		if(db[i].GetRoot() != -1){
			miss = db[i].HMD(seq,0,seq_length-1);

			if(miss < total_miss){
				total_miss = miss;
			}
		}
	}
	
	if(total_miss > hmd_max){
		hmd_max = total_miss;
	}
}
/*
void main(){
}
*/

