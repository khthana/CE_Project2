// LinkListPointer.cpp: implementation of the LinkListPointer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LinkListPointer.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

LinkListPointer::LinkListPointer()
{
	Head = NULL;
	Tail = NULL;
	ListSize = 0;
}

LinkListPointer::~LinkListPointer()
{

}
