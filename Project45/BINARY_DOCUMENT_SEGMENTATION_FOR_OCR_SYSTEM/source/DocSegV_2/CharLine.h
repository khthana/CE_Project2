// harLine.h: interface for the CharLine class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_HARLINE_H__AE141C79_614F_441F_A7C8_3D54FC05F037__INCLUDED_)
#define AFX_HARLINE_H__AE141C79_614F_441F_A7C8_3D54FC05F037__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CharLine  
{
public:
	CharLine* BeforeCharLine;   // Link back
	BOOLEAN USED;				// use ready or not
	int Linelevel;				// level of pic alphabet; char is 3
	long Bottom;				// bottom of line
	long Top;					// top of line
	CharLine* NextCharLine;		// Link next
	CharLine();
	virtual ~CharLine();
};

#endif // !defined(AFX_HARLINE_H__AE141C79_614F_441F_A7C8_3D54FC05F037__INCLUDED_)
