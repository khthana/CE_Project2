// LinkList.h: interface for the LinkList class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LINKLIST_H__B5BE51A0_4352_4223_B74E_FF3F674749B5__INCLUDED_)
#define AFX_LINKLIST_H__B5BE51A0_4352_4223_B74E_FF3F674749B5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class LinkList  
{
public:
	char direction;
	long BlockPositionX;
	long BlockPositionY;
	LinkList* NextLinkList;
	LinkList();
	virtual ~LinkList();
};

#endif // !defined(AFX_LINKLIST_H__B5BE51A0_4352_4223_B74E_FF3F674749B5__INCLUDED_)
