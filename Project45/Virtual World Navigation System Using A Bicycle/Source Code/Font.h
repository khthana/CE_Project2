// Font.h: interface for the CFont class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FONT_H__656AEF3D_35E9_40F5_AFB6_D1BEA7A6BF37__INCLUDED_)
#define AFX_FONT_H__656AEF3D_35E9_40F5_AFB6_D1BEA7A6BF37__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Base.h"

class CFont : public CBase  
{
public:
	void DrawText(LPSTR pText, int x, int y, D3DCOLOR rgbFontColour);
	CFont(LPDIRECT3DDEVICE8 pD3DDevice, LPSTR pFontFace, int nHeight, bool fBold, bool fItalic, bool fUnderlined);
	virtual ~CFont();
private:
	LPDIRECT3DDEVICE8 m_pD3DDevice;
	LPD3DXFONT m_pFont;
};

#endif // !defined(AFX_FONT_H__656AEF3D_35E9_40F5_AFB6_D1BEA7A6BF37__INCLUDED_)
