// Point.h: interface for the CLocation class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_POINT_H__C7579BA7_50CD_4CD3_B703_0A44706B2812__INCLUDED_)
#define AFX_POINT_H__C7579BA7_50CD_4CD3_B703_0A44706B2812__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CLocation : public CObject
{
	DECLARE_SERIAL(CLocation)
public:
	DOUBLE x;
	DOUBLE y;
public:
	CLocation();
	CLocation(const CLocation& Loc);
	CLocation(DOUBLE x,DOUBLE y);

	const CLocation& operator=(const CLocation& rhs);
	BOOL operator ==(const CLocation &rhs);

	CLocation Reverse();
	void Serialize(CArchive &ar);
};

typedef CLocation *PCLocation;
typedef CLocation **PPCLocation;
typedef CLocation ***PPPCLocation;

#endif // !defined(AFX_POINT_H__C7579BA7_50CD_4CD3_B703_0A44706B2812__INCLUDED_)
