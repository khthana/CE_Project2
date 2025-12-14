// Paragraph.h: interface for the CParagraph class.
//
//////////////////////////////////////////////////////////////////////
#include "LinkList.h"
#include "LinkListChar.h"
#include "LinkListPointer.h"
#include "LinkListSubParagraph.h"
#include "LinkListCharLine.h"

#if !defined(AFX_PARAGRAPH_H__0FBA3A0C_6541_45A9_9DEC_C89AA75330DD__INCLUDED_)
#define AFX_PARAGRAPH_H__0FBA3A0C_6541_45A9_9DEC_C89AA75330DD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CParagraph  
{
public:
	LinkListCharLine* HeadCharLine;
	LinkListPointer* LineList;
	int Right;
	int Left;
	int Bottom;
	int Top;
	long NumberofBlockround;
	LinkList* HeadPosition;
	LinkList* HeadOrder;
	LinkListChar* CharHead;
	LinkListChar* PictureHead;
	LinkListSubParagraph* HeadSubParagraph;
	int* Histogram;
	CParagraph();
	virtual ~CParagraph();
};

#endif // !defined(AFX_PARAGRAPH_H__0FBA3A0C_6541_45A9_9DEC_C89AA75330DD__INCLUDED_)
