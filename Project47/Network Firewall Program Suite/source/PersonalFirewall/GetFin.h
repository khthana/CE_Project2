// GetFin.h: interface for the CGetFin class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GETFIN_H__BF55A0D4_B9ED_4AC3_89F2_AEEE4B17FA02__INCLUDED_)
#define AFX_GETFIN_H__BF55A0D4_B9ED_4AC3_89F2_AEEE4B17FA02__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CGetFin  
{
public:
	CString IP_Src;
	CString IP_Dst;
	int Old_Min;
	CGetFin();
	virtual ~CGetFin();

};

#endif // !defined(AFX_GETFIN_H__BF55A0D4_B9ED_4AC3_89F2_AEEE4B17FA02__INCLUDED_)
