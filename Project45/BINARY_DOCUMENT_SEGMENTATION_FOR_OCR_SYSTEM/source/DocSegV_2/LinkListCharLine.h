// LinkListCharLine.h: interface for the LinkListCharLine class.
//
//////////////////////////////////////////////////////////////////////
#include "LinkListChar.h"

#if !defined(AFX_LINKLISTCHARLINE_H__C76E44A9_9E7F_4086_8D76_AFFC049F1F14__INCLUDED_)
#define AFX_LINKLISTCHARLINE_H__C76E44A9_9E7F_4086_8D76_AFFC049F1F14__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class LinkListCharLine  // Line in Paragraph
{
public:
	LinkListChar* HeadCharinLine; // This Line have these char keep in here
	LinkListCharLine* NextCharLine; // next link
	LinkListCharLine();
	virtual ~LinkListCharLine();
};

#endif // !defined(AFX_LINKLISTCHARLINE_H__C76E44A9_9E7F_4086_8D76_AFFC049F1F14__INCLUDED_)
