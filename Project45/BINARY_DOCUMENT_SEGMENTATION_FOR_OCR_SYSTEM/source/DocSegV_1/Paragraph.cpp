// Paragraph.cpp: implementation of the CParagraph class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Paragraph.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CParagraph::CParagraph()
{
	Bottom=Left=Right=Top =0;
	HeadPosition = NULL;
	HeadOrder = NULL;
	NumberofBlockround =0;
	CharHead = NULL;
	LineList = NULL;
	HeadSubParagraph = NULL;
	HeadCharLine = NULL;
	PictureHead = NULL;
	Histogram = NULL;
}

CParagraph::~CParagraph()
{

}
