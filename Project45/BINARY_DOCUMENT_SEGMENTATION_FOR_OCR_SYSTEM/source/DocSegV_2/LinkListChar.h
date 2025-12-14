// LinkListChar.h: interface for the LinkListChar class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LINKLISTCHAR_H__C3F9E050_1DB5_48CD_ACFD_2CE86FC0C144__INCLUDED_)
#define AFX_LINKLISTCHAR_H__C3F9E050_1DB5_48CD_ACFD_2CE86FC0C144__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class LinkListChar  
{
public:
	int mark;			// used or not use yet
	LinkListChar* BackLinkList;
	int Position;		// Now I think it not used
	long Top;			// Top of Character
	long Bottom;		// Bottom of Character
	long Left;			// Left of Character
	long Right;			// Right of Character
	LinkListChar* NextLinkList;
	LinkListChar();
	virtual ~LinkListChar();
};

#endif // !defined(AFX_LINKLISTCHAR_H__C3F9E050_1DB5_48CD_ACFD_2CE86FC0C144__INCLUDED_)
