// LinkListChar.cpp: implementation of the LinkListChar class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LinkListChar.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LinkListChar::LinkListChar()
{
	Left = NULL;
	Right = NULL;
	Top = NULL;
	Bottom = NULL;
	NextLinkList =NULL;
	BackLinkList = NULL;
	mark = NULL;
}

LinkListChar::~LinkListChar()
{
	
}
