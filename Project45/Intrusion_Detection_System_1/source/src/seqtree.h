#ifndef SEQ_TREE_H
#define SEQ_TREE_H

#include "t_array.h"
class SeqNode{
	public:
		SeqNode(int x);
		
		SeqNode *left;
		SeqNode *right;
		int element;
};

class SeqTree{
	public:
		SeqTree();
		SeqTree(int x,int length);
		~SeqTree();

		int InsertSeq(const Array<int> &seq,int first,int last);
		int SearchSeq(const Array<int> &seq,int first,int last);
		int HMD(const Array<int> &seq,int first,int last);
		void ShowDiffSeq();
		void ShowDiffSeq(SeqNode * sn,Array<int> & seq,int &index);
		friend ostream &operator<<(ostream &s,SeqTree &st);
		friend istream &operator>>(istream &s,SeqTree &st);
		int GetNumNode();
		int GetNumLeave();
		int GetNumBranch();
		void SetRoot(int x) { root->element = x;}
		void SetLength(int x) { SeqLength = x;}
		int GetRoot(){ return root->element;}
		int GetLength() { return SeqLength;}
	private:
		int InsertSeq(SeqNode * & sn,const Array<int> &seq,int first,int last);
		int SearchSeq(SeqNode * sn,const Array<int> &seq,int first,int last);
		int HMD(SeqNode * sn,const Array<int> &seq,int first,int last);
		void makeEmpty(SeqNode * & sn);
		void Write(SeqNode * sn,ostream &s,int &depth);
		int Read(SeqNode * & sn,istream &s,int &depth);
		int GetNumNode(SeqNode *sn);
		int GetNumLeave(SeqNode *sn);
		int GetNumBranch(SeqNode *sn);
		
		SeqNode *root;
		int SeqLength;
};

#endif
