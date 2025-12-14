// harLine.cpp: implementation of the CharLine class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "DibV1.h"
#include "CharLine.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CharLine::CharLine()
{
	USED = false;
	Top = NULL;
	Bottom = NULL;
	NextCharLine = NULL;
	BeforeCharLine = NULL;
	Linelevel =0;
}

CharLine::~CharLine()
{

}
