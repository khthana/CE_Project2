// Paragraph.h: interface for the CParagraph class.
//
//////////////////////////////////////////////////////////////////////
#include "LinkList.h"
#include "LinkListChar.h"
#include "LinkListPointer.h"
#include "LinkListSubParagraph.h"
#include "LinkListCharLine.h"
#include "CharLine.h"

#if !defined(AFX_PARAGRAPH_H__0FBA3A0C_6541_45A9_9DEC_C89AA75330DD__INCLUDED_)
#define AFX_PARAGRAPH_H__0FBA3A0C_6541_45A9_9DEC_C89AA75330DD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CParagraph  
{
public:
	CharLine* CharLineList;			//keep position of alphabet line ; 1 a line of writting or print of Thai have 4 line 
	LinkListCharLine* HeadCharLine; //keep each line character
	LinkListPointer* LineList;		//not use now
	int Right;						//Right of paragraph
	int Left;						//Left of paragraph
	int Bottom;						//Bottom of paragraph
	int Top;						//Top of paragraph
	long NumberofBlockround;		//Number of rounded Block
	LinkList* HeadPosition;			//Link list of window from start to end
	LinkList* HeadOrder;			//Link list arrage of HeadPosition Left to Right
	LinkListChar* CharHead;			//Link list of all Char in this paragraph
	LinkListChar* PictureHead;		//Link list of all Picture in this paragraph
	LinkListSubParagraph* HeadSubParagraph; //Link list of sub paragraph in this paragraph
	double* Histogram;				//Histogram in each pixel row 
	BOOLEAN* divideparagraphmark;	//mark check my paragraph must have column divide
	CParagraph();
	virtual ~CParagraph();

};

#endif // !defined(AFX_PARAGRAPH_H__0FBA3A0C_6541_45A9_9DEC_C89AA75330DD__INCLUDED_)
