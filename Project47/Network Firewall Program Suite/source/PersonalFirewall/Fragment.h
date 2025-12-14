// Fragment.h: interface for the Fragment class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FRAGMENT_H__DCFAE2E9_1F7F_436A_865C_535EF2115757__INCLUDED_)
#define AFX_FRAGMENT_H__DCFAE2E9_1F7F_436A_865C_535EF2115757__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Fragment  
{
public:
	int Size_Data;
	BOOL Flag_U;
	BOOL Flag_D;
	BOOL Flag_M;
	LONG Offset;
	Fragment();
	virtual ~Fragment();

};

#endif // !defined(AFX_FRAGMENT_H__DCFAE2E9_1F7F_436A_865C_535EF2115757__INCLUDED_)
