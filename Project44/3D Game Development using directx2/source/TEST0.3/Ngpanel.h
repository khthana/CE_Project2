#pragma warning(disable:4786)
#ifndef __NGPANEL_H
#define __NGPANEL_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngtexture.h"
#include "ngrender.h"

#include <vector>
#include <string>
#include <queue>

using namespace std;

typedef struct _NGPOINT
{
	INT		x;
	INT		y;

	_NGPOINT(INT ix=0, INT iy=0)
	{
		x	= ix; y	= iy;
	}
} NGPOINT;

typedef struct _NGCOLOR4
{
	DWORD	c1;
	DWORD	c2;
	DWORD	c3;
	DWORD	c4;
} NGCOLOR4;

typedef struct _NGRECT
{
	INT		left;
	INT		right;
	INT		bottom;
	INT		top;
} NGRECT;

typedef struct _NGRECTEX
{
	INT		x;
	INT		y;
	INT		sx;
	INT		sy;

	_NGRECTEX(INT ix = 0, INT iy =0, INT isx=0, INT isy=0)
	{
		x	= ix;	y	= iy;
		sx	= isx;	sy	= isy;
	};
} NGRECTEX;

class NGPANEL
{
private:
	/*NGPOINT	m_ptWindow;
	NGRECT	m_rcClient;*/
	NGRECTEX	m_rcClient;
	DWORD		m_dwWidth;
	DWORD		m_dwHeight;
	BOOL		m_bBorder;
	FLOAT		m_fZLevel;

	// Vertex
	NG3D*						m_p3d;
	vector<NG2DVERTEX>			m_Vertex;
	vector<NG2DVERTEX>			m_Vertex1;
	vector<NG2DVERTEX>			m_Vertex2;
	vector<NG2DVERTEX>			m_Vertex3;
	
	LPDIRECT3DVERTEXBUFFER8		m_pVB;
	LPDIRECT3DTEXTURE8			m_pTexture;
	NG2DVERTEX*					m_pVertices;

	LPDIRECT3DVERTEXBUFFER8		m_pVB1;
	LPDIRECT3DTEXTURE8			m_pTex1;
	NG2DVERTEX*					m_pVert1;

	LPDIRECT3DVERTEXBUFFER8		m_pVB2;
	LPDIRECT3DTEXTURE8			m_pTex2;
	NG2DVERTEX*					m_pVert2;

	LPDIRECT3DVERTEXBUFFER8		m_pVB3;
	LPDIRECT3DTEXTURE8			m_pTex3;
	LPVOID						m_pVert3;

	// Text
	vector<string>*	m_pText;
	DWORD	m_nStart;
	DWORD	m_nLine;

public:
	NGPANEL();
	~NGPANEL();

	//DWORD	Create(NGPOINT, NGPOINT, DWORD, NGCOLOR4* color = NULL, BOOL border=FALSE, FLOAT zlev = 0.0f);
	DWORD	CreateEx(NGRECTEX*, NGCOLOR4* color = NULL, FLOAT zlev=0.0f);
	DWORD	Prepare(NG3D*);
	DWORD	SetText(vector<string>*);
	DWORD	NextText();
	DWORD	SetTexture(vector<NGTEXTURE*>);
	DWORD	Move(INT, INT);
	DWORD	MoveTo(INT, INT);
	DWORD	Size(DWORD, DWORD);
	DWORD	SizeTo(DWORD, DWORD);
	DWORD	SetBackground(LPDIRECT3DTEXTURE8);

	NGRECTEX	GetClient()		{return m_rcClient;};

	DWORD	Render();
};

class NGTEXT
{
private:
	RECT	m_rcClient;
	NGPOINT	m_ptWindow;
	DWORD	m_dwWidth;
	DWORD	m_dwHeight;

	string  m_strFont;            // Font properties
    DWORD   m_dwFontHeight;
    DWORD   m_dwFontFlags;
	HFONT	m_hFont;
	HDC		m_hDC;
	BYTE*	m_pBmpBits;
	HBITMAP	m_hBitmap;

	LPDIRECT3DSURFACE8	m_Target;
	D3DSURFACE_DESC		m_desc;
	D3DLOCKED_RECT		m_d3dlr;

	vector<string>	m_Text;

public:
	NGTEXT()
	{
	};

	DWORD	Create(RECT);
	DWORD	Prepare(LPDIRECT3DSURFACE8, char*, DWORD, DWORD);
	DWORD	Render(LPDIRECT3DSURFACE8 surface = NULL);
	DWORD	SetText(char*);
	DWORD	Move(INT,INT);
	DWORD	MoveTo(INT,INT);
	NGRECTEX	GetClient()	{return NGRECTEX(m_ptWindow.x, m_ptWindow.y, m_dwWidth, m_dwHeight);};
};

class NGPACKAGE
{
private:
	vector<NGPANEL*>	m_pPanel;
	vector<NGTEXT*>		m_pText;
	vector<NGPOINT>		m_ptPanel;
	vector<NGPOINT>		m_ptText;

	NGPOINT				m_ptWindow;

public:

	NGPACKAGE()
	{
		m_ptWindow	= NGPOINT();
	}

	VOID	AddPanel(NGPANEL*);
	VOID	AddText(NGTEXT*);

	DWORD	Move(INT, INT);
	DWORD	MoveTo(INT, INT);

	NGPOINT*	GetPos()		{ return &m_ptWindow;};
	DWORD		GetSize()		{ return m_pPanel.size()+m_pText.size();};

};



#endif