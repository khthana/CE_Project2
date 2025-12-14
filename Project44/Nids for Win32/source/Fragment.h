// Fragment.h: interface for the Fragment class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FRAGMENT_H__E823B4DF_6DF9_48AC_88DD_EEF6F6CC6BEE__INCLUDED_)
#define AFX_FRAGMENT_H__E823B4DF_6DF9_48AC_88DD_EEF6F6CC6BEE__INCLUDED_

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

#endif // !defined(AFX_FRAGMENT_H__E823B4DF_6DF9_48AC_88DD_EEF6F6CC6BEE__INCLUDED_)
