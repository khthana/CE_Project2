// LinkList.h: interface for the LinkList class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LINKLIST_H__B5BE51A0_4352_4223_B74E_FF3F674749B5__INCLUDED_)
#define AFX_LINKLIST_H__B5BE51A0_4352_4223_B74E_FF3F674749B5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
//   0  direction
// 7    1
// 6     2
//  5   3
//    4
class LinkList  // BlockLinkList
{
public:
	char direction;  //LRTB   L 701 R345 T 2 B 6
	long BlockPositionX;
	long BlockPositionY;
	LinkList* NextLinkList;
	LinkList();
	virtual ~LinkList();
};

#endif // !defined(AFX_LINKLIST_H__B5BE51A0_4352_4223_B74E_FF3F674749B5__INCLUDED_)
