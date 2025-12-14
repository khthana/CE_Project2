// Link_Fragment.h: interface for the Link_Fragment class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LINK_FRAGMENT_H__716657F9_4D9B_41A4_81A0_9B8F81474564__INCLUDED_)
#define AFX_LINK_FRAGMENT_H__716657F9_4D9B_41A4_81A0_9B8F81474564__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Fragment.h"

#define Max_ReFragment 50

class Link_Fragment  
{
public:
	CString IP_Src;
	CString IP_Dst;
	int Identification[2];
	int Protocal;
	int Sec;
	int PointArray;
	Fragment Array_Fragment[Max_ReFragment];
	Link_Fragment();
	virtual ~Link_Fragment();

};

#endif // !defined(AFX_LINK_FRAGMENT_H__716657F9_4D9B_41A4_81A0_9B8F81474564__INCLUDED_)
