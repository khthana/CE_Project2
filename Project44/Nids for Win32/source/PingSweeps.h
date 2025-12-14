// PingSweeps.h: interface for the PingSweeps class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PINGSWEEPS_H__000DF2AB_C029_4DFE_9FDD_C9D3C55B8D1B__INCLUDED_)
#define AFX_PINGSWEEPS_H__000DF2AB_C029_4DFE_9FDD_C9D3C55B8D1B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class PingSweeps  
{
public:
	CString IP_Src;
	CString IP_Dst;
	PingSweeps();
	virtual ~PingSweeps();

};

#endif // !defined(AFX_PINGSWEEPS_H__000DF2AB_C029_4DFE_9FDD_C9D3C55B8D1B__INCLUDED_)
