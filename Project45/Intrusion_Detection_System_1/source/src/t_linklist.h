#ifndef __T_LINKLIST_H
#define __T_LINKLIST_H

#include <iostream.h>
#include <assert.h>


template <class T> class LinkListNode{
	public:
		LinkListNode() { next = NULL;}
		T	name;
		int 	value;
		LinkListNode<T> * next;
};

//not insert name ready in tree
template <class T> class LinkList{
  public:
    LinkList(void);
    ~LinkList(void);
    LinkList(const LinkList<T> & list);
    LinkList &operator = (const LinkList<T> & list);
    int Insert(const T & name) { return Insert(name,-1);}
    int Insert(const T & name,const int value);
   int Remove(const T & name);
    LinkListNode<T> * GetPosInsert(LinkListNode<T> * ptr,const T & name);
    
    void Clear(void);
    T *GetName(LinkListNode<T> * &ptr);
    T *GetNameFormValue(const int Value);
    int GetValue(const T & name);
    void SetValue(const T & Name,const int Value);
    LinkListNode<T> * GetHeadPosition() {return root;}
    int Search(const T & name);
    friend ostream &operator<<<>(ostream &s, LinkList<T> & list);
    int Empty(void) {return (root ? 0 : 1);}
  private:
    LinkListNode<T> 	*root;

};

template <class T> LinkList<T>::LinkList(void) {
  root = NULL;
//  count = 0;
}

template <class T> LinkList<T>::LinkList(const LinkList<T> &llist) {
  Clear();
  LinkListNode<T> *temp_ptr = llist.root;
  while (temp_ptr) {
    Insert(temp_ptr->T);
    temp_ptr = temp_ptr->next;
  }
}

template <class T> LinkList<T> &LinkList<T>::operator = (
                          const LinkList<T> &llist) {
  Clear();
  LinkListNode<T> *temp_ptr = llist.root;
  while (temp_ptr) {
    Insert(temp_ptr->T);
    temp_ptr = temp_ptr->next;
  }
  return *this;
}


template <class T> LinkList<T>::~LinkList(void) {
  Clear();
}


template <class T> void LinkList<T>::Clear(void) {
  if (root) {
    LinkListNode<T> *temp_ptr = root->next, *next_temp_ptr;
    delete root;
    while (temp_ptr) {
      next_temp_ptr = temp_ptr->next;
      delete temp_ptr;
      temp_ptr = next_temp_ptr;
    }
  }
  root = NULL;
}


//if name ready in list not insert and return 0;
template <class T> int LinkList<T>::Insert(const T & name,const int value) {

  LinkListNode<T> *tmp_pos,*tmp_ptr;
  LinkListNode<T> tmp_node;
  if (!root) {
     	root = new LinkListNode<T>;
     	assert(root);
 	root->name = name;
	root->value = value;
    return 1;
  } else {
	  
   	if (!Search(name)) {
		if( name < root->name){
	      	tmp_node.name = root->name;
		tmp_node.value = root->value;
     	 	tmp_node.next = root->next;
      		root->name = name;
      		root->next = new LinkListNode<T>;
		assert(root->next);
      		root->next->name = tmp_node.name;
		root->next->value = tmp_node.value;
      		root->next->next = tmp_node.next;
	}
	else{
		tmp_pos = GetPosInsert(root,name);
		tmp_ptr = root;
		while(tmp_ptr->next != tmp_pos){
			tmp_ptr = tmp_ptr->next;
		}

		tmp_ptr->next = new LinkListNode<T>;
		assert(tmp_ptr->next);
		tmp_ptr->next->name = name;
		tmp_ptr->next->value = value;
		tmp_ptr->next->next = tmp_pos;

	}
      	return 1;

    } else
	    	return 0;
   
  }
  
}


template <class T> int LinkList<T>::Remove(const T & name){
	
	LinkListNode<T> *tmp_node,*travel;
	int status = 0;
	if(root != NULL){
		if(root->name == name){
			tmp_node = root;
			root = root->next;
			delete tmp_node;
			status = 1;
		}else{
			travel = root;
			while(travel->next){
				if(travel->next->name == name){
					tmp_node = travel->next;
					travel->next = travel->next->next;
					status = 1;
				}
				if(travel->next != NULL)
					travel = travel->next;
			}
		}
	}
	
	return status;
}

template <class T> LinkListNode<T> * LinkList<T>::GetPosInsert(LinkListNode<T> * ptr,const T & name){
	if(ptr != NULL){
	if(ptr->name > name)
		return ptr;
	else
		return GetPosInsert(ptr->next,name);
	}
	else
		return NULL;
}

//return 1 if found
template <class T> int LinkList<T>::Search(const T &name) {
  int chk = 0;
  LinkListNode<T> *temp_ptr = root;
  while (temp_ptr && chk) {
    	if (temp_ptr->name == name)
      		 chk = 1;
    	temp_ptr = temp_ptr->next;
  }
  return chk;
}


template <class T> ostream &operator<<(ostream &s, LinkList<T> &list) {

  LinkListNode<T> * temp_ptr = list.root;
  while(temp_ptr){
  	s<<" "<<temp_ptr->name;
	temp_ptr = temp_ptr->next;
  }
  cout<<endl;
  return s;
}


template <class T> T *LinkList<T>::GetName(LinkListNode<T> * & ptr) {
	if(ptr){
		LinkListNode<T> * temp = ptr;
		ptr = ptr->next;
		return &temp->name;
	}
	else	return NULL; 
}

//return first name int list  that have value match
template <class T> T *LinkList<T>::GetNameFormValue(const int  Value){
	LinkListNode<T> * tmp_ptr = root;
	while(tmp_ptr){
		if(tmp_ptr->value == Value)
		{	return &tmp_ptr->name;
		}
		tmp_ptr = tmp_ptr->next;
	}
	return NULL;
}


template <class T> int LinkList<T>::GetValue(const T & name){
	int value_re = 0;
	LinkListNode<T> * tmp_ptr = root;
	while(tmp_ptr){
		if(tmp_ptr->name == name)
		{	value_re = tmp_ptr->value;
			break;
		}else{ if(tmp_ptr->name > name){
				value_re = 0;
				break;
			}
		}
		tmp_ptr = tmp_ptr->next;
	}
	return value_re;
}

template <class T> void LinkList<T>::SetValue(const T & Name,const int Value){
	
	LinkListNode<T> * tmp_ptr = root;
	while(tmp_ptr){
		if(tmp_ptr->name == Name)
		{	tmp_ptr->value = Value;
			break;
		}else{ if(tmp_ptr->name > Name){
				break;
			}
		}
		tmp_ptr = tmp_ptr->next;
	}
}

#endif

/*
void main(){
	LinkList<int> ll;
	int i;

	for(i =0;i<20;i++){
		ll.Insert(i);
	}
	cout<<ll;

	for(i=0;i<20;i++){
		ll.SetValue(i,i+6);
	}
	
	for(i=0;i<20;i++){
		cout<<" "<<ll.GetValue(i);
	}

	for(i=0; i< 20;i =i++ ){
		ll.Remove(i);
	}
	cout<<ll;

	for(int i=0; i< 20;i=i+3){
		ll.Insert(i);
	}
	cout<<ll;
	
	for(int i=20; i>= 0;i--){
		ll.Remove(i);
		cout<<ll<<endl;
	}
//	cout<<ll<<endl;
}

*/
