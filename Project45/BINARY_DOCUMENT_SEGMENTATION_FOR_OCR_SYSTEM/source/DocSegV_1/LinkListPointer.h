// LinkListPointer.h: interface for the LinkListPointer class.
//
//////////////////////////////////////////////////////////////////////
#include "LinkList.h"
#if !defined(AFX_LINKLISTPOINTER_H__7F01B66A_70AE_49D2_88F4_EE0E8ADA5F15__INCLUDED_)
#define AFX_LINKLISTPOINTER_H__7F01B66A_70AE_49D2_88F4_EE0E8ADA5F15__INCLUDED_

#include "LinkList.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class LinkListPointer  
{
public:
	long minpixel;
	long maxpixel;
	int ListSize;
	LinkList* Tail;
	LinkList* Head;
	LinkListPointer();
	virtual ~LinkListPointer();

};

#endif // !defined(AFX_LINKLISTPOINTER_H__7F01B66A_70AE_49D2_88F4_EE0E8ADA5F15__INCLUDED_)
