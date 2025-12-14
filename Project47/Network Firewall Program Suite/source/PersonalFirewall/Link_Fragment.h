// Link_Fragment.h: interface for the Link_Fragment class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LINK_FRAGMENT_H__AE089833_4CA2_4368_9993_1F077F19D129__INCLUDED_)
#define AFX_LINK_FRAGMENT_H__AE089833_4CA2_4368_9993_1F077F19D129__INCLUDED_

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

#endif // !defined(AFX_LINK_FRAGMENT_H__AE089833_4CA2_4368_9993_1F077F19D129__INCLUDED_)
