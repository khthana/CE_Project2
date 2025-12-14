#include "seqtree.h"

SeqNode::SeqNode(int x)
{
	left = NULL;
	right = NULL;
	element = x;
}

SeqTree::SeqTree()
{
	root = new SeqNode(-1);
	SeqLength = 0;
}

SeqTree::SeqTree(int x,int length)
{
	root = new SeqNode(x); 
	SeqLength = length; 
}

SeqTree::~SeqTree()
{
	makeEmpty(root);
}

void SeqTree::makeEmpty(SeqNode * & sn)
{
	if(sn != NULL){
//		cout<<"Left :"<<sn->element<<"|| ";
		makeEmpty(sn->left);
//		cout<<"Right :"<<sn->element<<"|| ";
		makeEmpty(sn->right);
//		cout<<"Del :"<<sn->element<<"|| ";
		delete sn;
	}
	sn = NULL;
}


//Seq begins with element of this tree but seq not in tree : return 1
//Seq not begings with element of this tree : return -1
//Seq was ready in this tree : return 0
int SeqTree::InsertSeq(const Array<int> &seq,int first,int last)
{
	if( SeqLength > (last - first)){
		return InsertSeq(root,seq,first,last);
	}
	else{
		cout<<endl<<"ERROR length of sequence "<<SeqLength;
		return -1;
	}
}

int SeqTree::InsertSeq(SeqNode * & sn,const Array<int> &seq,int first,int last)
{
	if(sn->element != seq[first])
		return -1;

	first ++;
	if(first > last)
		return 0;
	
	if(!sn->left){
		sn->left = new SeqNode(seq[first]);
		InsertSeq(sn->left,seq,first,last);
		return 1;
	}

	SeqNode * temp_ptr = sn->left;
	int status;
	while(1){
		status = InsertSeq(temp_ptr,seq,first,last);
		if(status == 0) return 0;
		if(status == 1) return 1;

		if(temp_ptr->right == NULL){
			temp_ptr->right = new SeqNode(seq[first]);
			InsertSeq(temp_ptr->right,seq,first,last);
			return 1;
		}
		temp_ptr = temp_ptr->right;
	}
}

//return 1 : if Seq was ready in this tree
//return 0 : otherwise
int SeqTree::SearchSeq(const Array<int> &seq,int first,int last)
{
	return SeqTree::SearchSeq(root,seq,first,last);
}

int SeqTree::SearchSeq(SeqNode *sn,const Array<int> &seq,int first,int last)
{
	if(sn->element != seq[first])
		return 0;
	
	first++;
	if(first > last)
		return 1;

	SeqNode * temp_ptr = sn->left;
	while(temp_ptr != NULL){
		if(SearchSeq(temp_ptr,seq,first,last))
			return 1;
	temp_ptr = temp_ptr->right;
	}
	return 0;
}

ostream &operator<<(ostream &s,SeqTree & st)
{
	int depth = 0;
	st.Write(st.root,s,depth);
	s<<"-1";
	return s;
}

void SeqTree::Write(SeqNode * sn,ostream &s,int &depth)
{
	s<<sn->element<<" ";
	SeqNode *temp_ptr = sn->left;
	while(temp_ptr){
		depth = 0;
		Write(temp_ptr,s,depth);
		temp_ptr=temp_ptr->right;
		if(temp_ptr) s<<"-"<<(depth+1)<<" ";
	}
	depth++;
}

istream &operator>>(istream &s,SeqTree &st)
{
	int read_next,depth=0;
	s>>read_next;
	st.root->element = read_next;
	st.Read(st.root,s,depth);
	return s;
}

//return 0 if end file or  end of stream input
//return 1 otherwise
int SeqTree::Read(SeqNode * & sn,istream &s,int &depth)
{
	int read_next;
	if(s.eof()) 
		return 0;
	
	s>>read_next;
	if(read_next == -1){
		return 0;
	}

	if(read_next >= 0){
		sn->left = new SeqNode(read_next);
		if(0 == Read(sn->left,s,depth))
				return 0;

		SeqNode * temp_ptr = sn->left;
		while(depth == 0){
			if(s.eof())
				return 0;

			s>>read_next;
			if(read_next == -1)
				return 0;
			
			temp_ptr->right = new SeqNode(read_next);
			temp_ptr = temp_ptr->right;
			if( 0 == Read(temp_ptr,s,depth))
				return 0;
		}
	}
	else
		depth = (-1 * read_next) -1;
	
	if(depth) 
		depth--;
	return 1;
}

int SeqTree::GetNumNode()
{
	return GetNumNode(root);
}

int SeqTree::GetNumNode(SeqNode * sn)
{	
	int i =1;
	SeqNode *temp_ptr = sn->left;
	while(temp_ptr){
		i += GetNumNode(temp_ptr);
		temp_ptr=temp_ptr->right;
	}
	return i;
}

int SeqTree::GetNumLeave()
{
	return GetNumLeave(root);
}

int SeqTree::GetNumLeave(SeqNode * sn)
{
	int i=0;
	SeqNode *temp_ptr = sn->left;
	if(temp_ptr == NULL)
		i =1;
	while(temp_ptr){
		i += GetNumLeave(temp_ptr);
		temp_ptr=temp_ptr->right;
	}
	return i;
}

int SeqTree::GetNumBranch()
{
	return GetNumBranch(root);
}

int SeqTree::GetNumBranch(SeqNode * sn)
{
	int i=0;
	SeqNode *temp_ptr = sn->left;
	while(temp_ptr){
		i += (GetNumBranch(temp_ptr) + 1);
		temp_ptr=temp_ptr->right;
	}
	return i;
}

int SeqTree::HMD(const Array<int> &seq,int first,int last)
{
	return HMD(root,seq,first,last);
}

int SeqTree::HMD(SeqNode * sn,const Array<int> &seq,int first,int last)
{
	int total = 0;

	if(sn->element != seq[first]){
		total++;
	}

	first++;
	if(first > last){
		return total;
	}

	int min = last,misses;
	SeqNode *temp_ptr = sn->left;

	while(temp_ptr != NULL){
		misses = HMD(temp_ptr,seq,first,last);
		if(misses < min)
			min = misses;
		temp_ptr = temp_ptr->right;
	}
	return (total + min);
}

void SeqTree::ShowDiffSeq()
{
	Array<int> temp(SeqLength);
	int index=0;
	ShowDiffSeq(root,temp,index);
}

void SeqTree::ShowDiffSeq(SeqNode * sn,Array<int> &seq,int &index)
{
	if(index < SeqLength)
		seq[index] = sn->element;
	else
		cout<<endl<<"ERROR index of array form SeqTree::ShowDiffSeq"; 
	index++;

	SeqNode *temp_ptr = sn->left;
	if(temp_ptr == NULL)
		cout<<endl<<seq;
	while(temp_ptr != NULL){
		ShowDiffSeq(temp_ptr,seq,index);
		index--;
		temp_ptr = temp_ptr->right;
	}
}

/*
#include "fstream.h"
void main()
{	Array<int> seq(10);
	int  tmp,sel,j;
	SeqTree i(1,4);
	SeqTree b(1,4);
	ofstream seqout("test.db");
	
	seq[0]=1 ;seq[1]=2;seq[2]=3;seq[3]=4;
	b.InsertSeq(seq,0,3);
	seq[0]=1 ;seq[1]=2;seq[2]=5;seq[3]=7;
	b.InsertSeq(seq,0,3);

	seqout<<b;
	seqout.close();

	ifstream seqin("test.db");
	seqin>>i;
	seqin.close();
	
	while(1){
		cout<<endl<<"Menu :";
		cin>>sel;
		cout<<endl<<"data :";

		if(sel < 10)
		{
		j =0;
		cin>>tmp;
		while( tmp != -1 ){
			seq[j] = tmp;
			j++;
			cin>>tmp;
		}
		}
//		cout<<"input :"<<seq<<" : "<<j;

		switch(sel){
			case 1 : i.InsertSeq(seq,0,(j-1));
				 cout<<endl<<"Tree :"<<i;
				 break;
			case 2 : cout<<endl<<"Tree :"<<i;
				 cout<<endl<<"find :"<<seq;
				 cout<<" :"<<i.SearchSeq(seq,0,(j-1));
				 break;
			case 3 : cout<<endl<<"Tree :"<<i;
				 cout<<endl<<"HDM :"<<seq;
				 cout<<" :"<<i.HMD(seq,0,(j-1));
				 break;
			case 10 :cout<<endl;
//				 ofstream seqout("test.db");
//				 seqout<<i;
//				 seqout.close();
				 exit(0);
				 break;
			case 11 : cout<<endl<<"Tree :"<<i;
				 break;
			case 12 : cout<<endl<<"NumNode :"<<i.GetNumNode();
				 break;
			case 13 : cout<<endl<<"Numleave:"<<i.GetNumLeave();
				 break;
			case 14 : cout<<endl<<"Numbranch:"<<i.GetNumBranch();
				 break;
			case 15 : cout<<endl<<"Tree :"<<i;
				  i.ShowDiffSeq();
				  break;
		}

	}
}
*/
