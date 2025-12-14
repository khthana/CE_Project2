// PingSweeps.h: interface for the PingSweeps class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PINGSWEEPS_H__C2E06498_5337_4D52_A852_A1FF0565468B__INCLUDED_)
#define AFX_PINGSWEEPS_H__C2E06498_5337_4D52_A852_A1FF0565468B__INCLUDED_

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

#endif // !defined(AFX_PINGSWEEPS_H__C2E06498_5337_4D52_A852_A1FF0565468B__INCLUDED_)
