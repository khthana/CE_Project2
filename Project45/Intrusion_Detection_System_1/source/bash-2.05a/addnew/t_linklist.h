#if !defined (__T_LINKLIST_C_H)
#define __T_LINKLIST_C_H

#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <malloc.h>


struct LinkListNode{
		char * value;
		struct LinkListNode * next;
};


struct LinkList{
    struct LinkListNode 	*root;
//    int				count;

};

#endif



