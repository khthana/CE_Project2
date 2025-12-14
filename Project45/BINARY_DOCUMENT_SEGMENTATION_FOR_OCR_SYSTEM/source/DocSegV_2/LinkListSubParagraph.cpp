// LinkListSubParagraph.cpp: implementation of the LinkListSubParagraph class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LinkListSubParagraph.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LinkListSubParagraph::LinkListSubParagraph()
{
	picrow = -1;
	blockrow = -1;
	NextSubParagraph = NULL;
}

LinkListSubParagraph::~LinkListSubParagraph()
{

}


