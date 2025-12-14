#include "anomallseq.h"
void AnomallSeqLink::InsertSeq(Array<int> & seq)
{
	AnomallSeq *temp_ptr, *temp_new;

	temp_ptr = root;
	
	if(temp_ptr){
		while(temp_ptr->next != NULL)
			temp_ptr = temp_ptr->next;
	}

	temp_new = new AnomallSeq;
	assert(temp_new);
	temp_new->seq = new Array<int> (seq);
	assert(temp_new->seq);
	if(root == NULL)
		root=temp_new;
	else
		temp_ptr->next = temp_new;
}

ostream &operator<<(ostream & s,const AnomallSeqLink & Aseq)
{
	AnomallSeq *temp_ptr;
	temp_ptr = Aseq.root;
	while(temp_ptr){
		s<<endl<<*temp_ptr->seq;
		temp_ptr = temp_ptr->next;
	}
	return s;
}

ofstream &operator<<(ofstream  & out_file,const AnomallSeqLink & Aseq)
{
	AnomallSeq *temp_ptr;
	temp_ptr = Aseq.root;
	while(temp_ptr){
		out_file<<endl<<*temp_ptr->seq;
		temp_ptr = temp_ptr->next;
	}
	return out_file;
}

void AnomallSeqLink::WriteSeqToFile(ofstream & out_file,LinkList<string> & SysList){
	int i,tmp;
	int seq_len;
	
	AnomallSeq *temp_ptr;
	temp_ptr = root;
	if(temp_ptr){
		seq_len = temp_ptr->seq->Size();
	
	while(temp_ptr){
		out_file<<endl;
		for(i=0;i<seq_len;i++){
			tmp = temp_ptr->seq->Data(i);
			out_file<<*SysList.GetNameFormValue(tmp)<<" ";
		}
		temp_ptr = temp_ptr->next;
	}
	}
}

AnomallSeqLink::~AnomallSeqLink()
{
	AnomallSeq *temp_ptr,*tdel;
	temp_ptr = root;
	while(temp_ptr){
		tdel = temp_ptr;
		temp_ptr = temp_ptr->next;
		delete tdel->seq;
		delete tdel;
	}		
}

