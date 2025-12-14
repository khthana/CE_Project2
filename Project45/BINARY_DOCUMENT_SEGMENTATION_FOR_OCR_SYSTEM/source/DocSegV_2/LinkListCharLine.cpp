// LinkListCharLine.cpp: implementation of the LinkListCharLine class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LinkListCharLine.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LinkListCharLine::LinkListCharLine()
{
	HeadCharinLine = NULL;
	NextCharLine = NULL;
}

LinkListCharLine::~LinkListCharLine()
{

}
