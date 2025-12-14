#pragma warning(disable:4786)
#ifndef __NGBUFFER_H
#define __NGBUFFER_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include <vector>
#include <string>
#include <queue>
/*
#define NGFVF_PNT1		(D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_TEX0)
#define NGFVF_PNT1B2	(D3DFVF_XYZB2 | D3DFVF_NORMAL | D3DFVF_TEX0)
#define NGFVF_PNT1B4	(D3DFVF_XYZB4 | D3DFVF_LASTBETA_UBYTE4 | D3DFVF_NORMAL | D3DFVF_TEX0)
#define NGFVF_2DVERTEX	(D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1)

typedef struct _NGBLEND4
{
	union
	{
		struct
		{
			FLOAT b1;	FLOAT b2;	FLOAT b3;	FLOAT b4;
		};
		FLOAT b[4];
	};

	union
	{
		struct
		{
			BYTE i1;	BYTE i2;	BYTE i3;	BYTE i4;
		};
		BYTE i[4];
	};

	_NGBLEND4()
	{
		b[0] = 0.f;	b[1] = 0.f; b[2] = 0.f; b[3] = 0.f;
		i[0] = 0;	i[1] = 0;	i[2] = 0;	i[3] = 0;
	};
} NGBLEND4;

typedef struct _NGVB_PNT1
{
	D3DXVECTOR3	pos;
	D3DXVECTOR3	norm;
	D3DXVECTOR2	tex;
}	NGVB_PNT1;

typedef struct _NGVB_PNT1B4
{
	D3DXVECTOR3	pos;
	NGBLEND4	blend;
	D3DXVECTOR3	norm;
	D3DXVECTOR2	tex;
}	NGVB_PNT1B4;

typedef struct _NG2DVERTEX
{
	D3DXVECTOR4	pos;
	DWORD		dif;
	D3DXVECTOR2	tex;
} NG2DVERTEX;

typedef struct _NGFACE16
{
	union
	{
		struct
		{
			WORD f1;
			WORD f2;
			WORD f3;
		};
		WORD f[3];
	};
} NGFACE16;

typedef struct _NGFACE
{
	union
	{
		struct
		{
			DWORD f1;
			DWORD f2;
			DWORD f3;
		};
		DWORD f[3];
	};
} NGFACE, NGFACE32;

typedef struct _NGINDEXDESC
{
	DWORD	dwIB;					// index of index buffer
	DWORD	dwTexture;				// index of texture	
	DWORD	dwMtrl;					// index of mtrl
	DWORD	dwStartID;
	DWORD	dwNumID;

	_NGINDEXDESC()
	{
		dwIB		= 0;
		dwTexture	= 0;
		dwStartID	= 0;
		dwNumID		= 0;
		dwMtrl		= 0;
	}
} NGINDEXDESC;

typedef struct _NGRENDERDESC
{
	DWORD			dwVB;			// what VB;
	DWORD			dwStartVT;		// where to start
	DWORD			dwNumVT;		// amount of vertex
	DWORD			dwNumID;		// total of index
	DWORD			dwNumIB;		// amount of IB
	vector<NGINDEXDESC>	descID;		

	_NGRENDERDESC()
	{
		dwVB		= 0;
		dwNumIB		= 0;
		dwNumVT		= 0;
		dwNumID		= 0;
		dwStartVT	= 0;
	}
} NGRENDERDESC;

#define MAX_BUFFERSIZE	65000

class NGRENDERBUFFER
{
private:
	NG3D*					m_p3d;
	LPDIRECT3DDEVICE8		m_pDevice;

	vector<LPDIRECT3DVERTEXBUFFER8>	m_ppVB;
	vector<LPDIRECT3DINDEXBUFFER8>	m_ppIB;
	vector<LPVOID>			m_ppVertex;
	vector<LPVOID>			m_ppIndex;

	DWORD					m_Handle;
	DWORD					m_dwFVF;
	D3DFORMAT				m_d3dFMT;
	DWORD					m_typeIB;

	DWORD					m_dwNumVertex;	// total number
	DWORD					m_dwNumIndex;	// total number
	DWORD					m_typeIBSize;
	DWORD					m_typeVBSize;

	DWORD					CreateBuffer();
	DWORD					Optimize();

	BOOL					m_bRender;

public:
	vector<NGVB_PNT1>		m_PNT1;
	vector<NGVB_PNT1B4>		m_PNT1B4;
	vector<NG2DVERTEX>		m_2DVERTEX;
	vector<DWORD>			m_Vertex;

	vector<DWORD>			m_Index;
	vector<NGFACE16>		m_Face16;
	vector<NGFACE32>		m_Face32;

	NGRENDERBUFFER();
	~NGRENDERBUFFER()
	{};

	DWORD	Create(DWORD dwFVF, DWORD typeIndex);
	DWORD	AddMesh(LPVOID pMesh);
	DWORD	Prepare(NG3D*);
	DWORD	SetBuffer();
	DWORD	SetVB(DWORD);
	DWORD	SetIB(DWORD, DWORD min = 0);
//	DWORD	Render(NGINDEXDESC*, DWORD, DWORD, DWORD);
	DWORD	Render(DWORD, DWORD, DWORD, DWORD);
};
*/

union LPBUFFER
{
	LPVOID			pUnknown;
	NGVB_PNT1*		pPNT1;
	NGVB_PNT2*		pPNT2;
	NGVB_PNT1B4*	pPNT1B4;
	NGVB_PNT2B4*	pPNT2B4;
	NGVB_PRHWDT1*	pPRHWDT1;
	NGFACE*			pFace16;
};

#define BUFFER_LIMIT	65000

class NGBuffer
{
private:
	NG3D*					m_p3d;
	LPDIRECT3DDEVICE8		m_pDevice;

	LPDIRECT3DVERTEXBUFFER8	m_pVB;
	ArrayList<LPDIRECT3DINDEXBUFFER8>	m_ppIB;

	LPBUFFER	m_pVertex;
	ArrayList<LPBUFFER>	m_ppIndex;

	DWORD		m_Handle;
	DWORD		m_dwFVF;
	DWORD		m_dwFlags;
	D3DFORMAT	m_d3dFMT;
	DWORD		m_typeIB;

	DWORD		m_typeIBSize;
	DWORD		m_typeVBSize;

	BOOL		CreateVertexBuffer();
	BOOL		CreateIndexBuffer();
	DWORD		Optimize();

	BOOL		m_bRender;
	DWORD		m_vSize;
	DWORD		m_iSize;
	DWORD		m_iBuffer;

	ArrayList<LPVOID>	m_frames;

public:

	NGBuffer(DWORD);
	~NGBuffer()
	{};

	BOOL	Add(LPVOID);

	// 2d use
	BOOL	Add2D(LPVOID);
	VOID	Write(NGVB_PRHWDT1*, DWORD);

	BOOL	CreateBuffer(NG3D*);
	VOID	Render(LPVOID);
	VOID	Render2D(LPVOID);
	BOOL	SetVertexBuffer();
	BOOL	SetVertexBuffer2();

	DWORD	GetFVF()	{ return m_dwFVF;};
	LPDIRECT3DVERTEXBUFFER8*	GetVertexBuffer()	{ return &m_pVB;};
	DWORD	GetVertexNumber()	{ return m_vSize;};
};

class NGRenderBuffer
{
private:
	NG3D*					m_p3d;
	ArrayList<NGBuffer*>	m_pPNT1;
	ArrayList<NGBuffer*>	m_pPNT2;
	ArrayList<NGBuffer*>	m_pPNT1B4;
	ArrayList<NGBuffer*>	m_pPNT2B4;
	ArrayList<NGBuffer*>	m_pPRHWDT1;

public:
	NGRenderBuffer();
	//~NGRenderBuffer();
	BOOL	Add(LPVOID);
	BOOL	Add2d(LPVOID);
	BOOL	CreateBuffer(NG3D*);
	
};
/*
struct NGRENDERLIST
{

};
*/


#endif