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
	int mark;
	LinkListChar* BackLinkList;
	int Position;
	long Top;
	long Bottom;
	long Left;
	long Right;
	LinkListChar* NextLinkList;
	LinkListChar();
	virtual ~LinkListChar();

};

#endif // !defined(AFX_LINKLISTCHAR_H__C3F9E050_1DB5_48CD_ACFD_2CE86FC0C144__INCLUDED_)
