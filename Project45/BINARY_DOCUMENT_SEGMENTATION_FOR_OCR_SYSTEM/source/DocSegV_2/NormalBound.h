// NormalBound.h: interface for the CNormalBound class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_NORMALBOUND_H__C64CCF9A_8EB2_4D71_A39B_CAFB1C4FFEB6__INCLUDED_)
#define AFX_NORMALBOUND_H__C64CCF9A_8EB2_4D71_A39B_CAFB1C4FFEB6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CNormalBound  
{
public:
	long Bottom;				// bottom of normal char in line
	long Top;					// top of normal char in line
	CNormalBound();
	virtual ~CNormalBound();
};

#endif // !defined(AFX_NORMALBOUND_H__C64CCF9A_8EB2_4D71_A39B_CAFB1C4FFEB6__INCLUDED_)
