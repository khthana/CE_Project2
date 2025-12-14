// Point.cpp: implementation of the CLocation class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Point.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CLocation,CObject,0)

CLocation::CLocation()
{
}

CLocation::CLocation(const CLocation &Loc)
: x(Loc.x), y(Loc.y)
{
}

CLocation::CLocation(DOUBLE _x,DOUBLE _y)
: x(_x), y(_y)
{
}

const CLocation& CLocation::operator=(const CLocation &rhs)
{
	x = rhs.x; 
	y = rhs.y;
	return *this;	
}


BOOL CLocation::operator ==(const CLocation &rhs)
{
	return (x == rhs.x) && (y == rhs.y);
}

CLocation CLocation::Reverse()
{
	return CLocation(GROUND_HEIGHT - x,GROUND_WIDTH - y);
}


void CLocation::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		ar << x << y;
	}
	else
	{
		ar >> x >> y;
	}
}

/*void CLocation::Load(CDFile &file)
{
	x = file.ReadDOUBLE();
	y = file.ReadDOUBLE();
}

void CLocation::Save(CDFile &file)
{
	file.WriteDOUBLE(x);
	file.WriteDOUBLE(y);
}
*/