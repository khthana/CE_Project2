#pragma warning(disable:4786)
#ifndef __NGFRAME_H
#define __NGFRAME_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngrender.h"
#include "ngmtrl.h"
#include "ngtexture.h"

#include <vector>
#include <string>
#include <queue>
#include <list>

using namespace std;

typedef enum NGFRAMEDATATYPE
{
	NFDT_POSITION	= 0x00000000,
	NFDT_NORMAL		= 0x00000001,
	NFDT_TEXCOORD0	= 0x00000002,
	NFDT_TEXCOORD1	= 0x00000003,
	NFDT_TEXCOORD2	= 0x00000004,
	NFDT_TEXCOORD3	= 0x00000005,
	NFDT_TEXCOORD4	= 0x00000006,
	NFDT_TEXCOORD5	= 0x00000007,
	NFDT_TEXCOORD6	= 0x00000008,
	NFDT_TEXCOORD7	= 0x00000009,
	
	NFBT_PNT2		= 0x10000001
};

// Namaza Graphics Vertex Type
typedef struct _NGVT_PNT2
{
	D3DXVECTOR3		p;		// Position
	D3DXVECTOR3		n;		// Normal
	D3DXVECTOR2		t0;		// Texture Coord 0
	D3DXVECTOR2		t1;		// Texture Coord 1
} NGVT_PNT2;

// VB is a collection of VT
typedef vector<NGVT_PNT2>	NGVB_PNT2;

class NGFRAMEEX
{
private:
	// Input raw data stream
	vector<D3DXVECTOR3>		m_vPos;		// Position input
	vector<D3DXVECTOR3>		m_vNorm;	// Normal input
	vector<D3DXVECTOR2>		m_vTex0;	// Texture Coord input at T0
	vector<D3DXVECTOR2>		m_vTex1;	// Texture Coord input at T1
	vector<D3DXVECTOR2>		m_vTex2;	// Texture Coord input at T2
	vector<D3DXVECTOR2>		m_vTex3;	// Texture Coord input at T3
	vector<D3DXVECTOR2>		m_vTex4;	// Texture Coord input at T4
	vector<D3DXVECTOR2>		m_vTex5;	// Texture Coord input at T5
	vector<D3DXVECTOR2>		m_vTex6;	// Texture Coord input at T6
	vector<D3DXVECTOR2>		m_vTex7;	// Texture Coord input at T7
	vector<FLOAT>			m_fRHW;
	vector<DWORD>			m_dwDiffuse;
	vector<DWORD>			m_dwSpecular;
	vector<FLOAT>			m_fBlend0;
	vector<FLOAT>			m_fBlend1;
	vector<FLOAT>			m_fBlend2;
	vector<FLOAT>			m_fBlend3;
	vector<BYTE>			m_bIndex0;
	vector<BYTE>			m_bIndex1;
	vector<BYTE>			m_bIndex2;
	vector<BYTE>			m_bIndex3;
	vector<DWORD>			m_dwMtrlID;
	vector<D3DXMATERIAL>	m_d3dMtrl;

	// Input mdl data stream
	vector<NGVB_PNT2>		m_vbPNT2;
	vector<NGMATERIAL>		m_ngMtrl;

	// Attribute
	BOOL					m_bMesh;		// have mesh data?
	BOOL					m_bVisible;		// visible?
	BOOL					m_bReady;		// ready to use?

	D3DXMATRIX				m_matTran;		// transformation
	D3DXMATRIX				m_matAnim;		// animation
	D3DXMATRIX				m_matRender;	// use to render
	D3DXMATRIX				m_matOffset;	// user specific data

	NGFRAMEEX*				m_parent;
	list<NGFRAMEEX*>		m_child;	

public:

	DWORD	AddData(VOID*, NGFRAMEDATATYPE);
	DWORD	Create();
	DWORD	Update();
	DWORD	SetParent(NGFRAMEEX*);
	DWORD	AddChild(NGFRAMEEX*);
	DWORD	RemoveChild(string*);
};

#endif