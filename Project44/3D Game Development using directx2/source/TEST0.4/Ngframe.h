#pragma warning(disable:4786)
#ifndef __NGFRAME_H
#define __NGFRAME_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngbuffer.h"
#include "ngtexture.h"
#include "ngmtrl.h"

#include <vector>
#include <string>
#include <queue>

using namespace std;

struct NGVERTEX
{
private: 
	LPVERTEX		vertex;
	DWORD			length;
	DWORD			size;
	LPVOID			first;
	
	
public:
	DWORD			type;
	
	NGVERTEX()
	{
		type = 0;
		length = 0;
		size = 0;
		first = NULL;
	}

	VOID	Create(DWORD);
	BOOL	Reserve(DWORD);

	BOOL	Add(NGVB_PNT1);
	BOOL	Add(NGVB_PNT2);
	BOOL	Add(NGVB_PNT1B4);
	BOOL	Add(NGVB_PNT2B4);

	LPVOID	Vertex() {return vertex.pUnknown;};
	LPVOID	First()	 {return first;};
	INT		Size()	 {return size;};
	INT		Length() {return length;};
};

struct NGINDEXSET
{
	ArrayList<NGFACE>	face;
	int					mtrl;
	NGMTRLS*			pMtrlSet;

	NGINDEXSET()
	{
		mtrl = -1;
	}
};

struct NGINDEX
{
	ArrayList<NGINDEXSET*>	index;

	INT		Count();
};

struct NGFRAMEDESC
{
	INT		numPos;			// number of data in position field
	INT		numBlend;		// number of element in blend field
	BOOL	bNormal;		// exist of normal
	BOOL	bTex0;			// exist of tex0
	BOOL	bTex1;			// exist of tex1
	INT		numIndexSet;	// number of index set
	INT		numChild;		// number of child
	INT		numJoint;		// number of joint
};

struct NGFRAMEX;

struct NGRENDERDESC
{
	NGBuffer*		pBuffer;
	INT				vStart;
	INT				vCount;
	INT				iBuffer;
	INT				iStart;
	INT				iCount;
	INT				iMtrl;
	INT				t0;
	INT				t1;
	INT				blend;
	D3DMATERIAL8*	mtrl;
	D3DMATRIX*		mat;
	ArrayList<NGFRAMEX*>*	joint;
	ArrayList<D3DXMATRIX>*	jOffset;

	NGRENDERDESC()
	{
		pBuffer = NULL;
		mtrl	= NULL;
		mat		= NULL;
		vStart	= 0;
		vCount	= 0;
		iStart	= 0;
		iCount	= 0;
		blend	= 0;
		iBuffer	= -1;
		t0		= -1;
		t1		= -1;
		joint		= NULL;	
		jOffset		= NULL;
	}
};

struct NGFRAMEX
{
	BOOL					m_bRender;
	BOOL					m_bMesh;

	string					m_strName;
							
	D3DXMATRIX				m_matTran;
	D3DXMATRIX				m_matAnime;
	D3DXMATRIX				m_matRender;
							
	NGFRAMEDESC				m_fdesc;

	DWORD					m_dwFVF;
						
	ArrayList<INT>			m_jIndex;
	ArrayList<NGFRAMEX*>	m_joint;
	ArrayList<D3DXMATRIX>	m_jOffset;

	ArrayList<INT>			m_cIndex;
	ArrayList<NGFRAMEX*>	m_child;

	ArrayList<NGRENDERDESC*> m_renderDesc;
							
	NGFRAMEX*				m_parent;
	INT						m_pindex;

	NGFRAMEX()
	{
		m_parent = NULL;
		m_bRender = true;
		m_bMesh	= false;
		m_matAnime = m_matTran;
		//D3DXMatrixIdentity(&m_matAnime);
		D3DXMatrixIdentity(&m_matRender);
	}

	VOID	UpdateFrame(D3DXMATRIX*);
};

struct NGFRAME
{
	BOOL					m_bRender;
	BOOL					m_bMesh;

	string					m_strName;
							
	D3DXMATRIX				m_matTran;
	D3DXMATRIX				m_matOffset;
							
	NGFRAMEDESC				m_fdesc;

	DWORD					m_dwFVF;
							
	NGVERTEX				m_Vertex;
	NGINDEX					m_Index;
						
	ArrayList<INT>			m_jIndex;
	ArrayList<NGFRAME*>		m_joint;
	ArrayList<D3DXMATRIX>	m_jOffset;

	ArrayList<INT>			m_cIndex;
	ArrayList<NGFRAME*>		m_child;

	ArrayList<NGRENDERDESC*> m_renderDesc;
							
	NGFRAME*				m_parent;
	INT						m_pindex;

	NGFRAME()
	{
		m_parent = NULL;
		m_bRender = true;
		m_bMesh	= false;
	}

	NGFRAMEX* ToFrameX();
};

#endif