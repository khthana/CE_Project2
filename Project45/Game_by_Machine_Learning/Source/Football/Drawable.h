// Drawable.h: interface for the CDrawable class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_DRAWABLE_H__B7176FFE_4529_46B1_A434_C6E5ABE11BBD__INCLUDED_)
#define AFX_DRAWABLE_H__B7176FFE_4529_46B1_A434_C6E5ABE11BBD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CDrawable : public CObject  
{
public:
	CDrawable();
	virtual ~CDrawable();

	virtual HRESULT CreateSurface(CDisplay *Display) = 0;
	virtual HRESULT Draw(CSurface *Surface,POINT StartPoint) = 0;
	virtual void ReleaseSurface() = 0;
	virtual void Update(DWORD TimeDiff) = 0;
};

#endif // !defined(AFX_DRAWABLE_H__B7176FFE_4529_46B1_A434_C6E5ABE11BBD__INCLUDED_)
