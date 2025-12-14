// LinkList.cpp: implementation of the LinkList class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LinkList.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LinkList::LinkList()
{
	BlockPositionX = NULL;
	BlockPositionY = NULL;
	direction = NULL;
	NextLinkList = NULL;
}

LinkList::~LinkList()
{

}
