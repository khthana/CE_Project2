#pragma warning(disable:4786)
#ifndef __NGFRAME_H
#define __NGFRAME_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngrender.h"
#include "ngtexture.h"

#include <vector>
#include <string>
#include <queue>

using namespace std;

class	NGFRAME;

enum	NGVBTYPE	{ STATIC, DYNAMICWO, DYNAMICRW};

typedef enum _NGIBTYPE	
{ 
	NOINDEX	= 0,
	INDEX16	= 16,
	INDEX32	= 32
} NGIBTYPE;

typedef struct _NGSKIN
{
	BYTE	bySkinIndex;
	FLOAT	fWeight;

	_NGSKIN()
	{
		bySkinIndex	= 0;
		fWeight		= 0.0f;
	};

} NGSKIN;
/*
typedef struct _NGMATERIAL
{
	D3DMATERIAL8			MatD3D;
	LPSTR         			pTextureFilename;
	NGTEXTURE*				pTexture;
	
	_NGMATERIAL()
	{
		pTextureFilename	= NULL;
		pTexture	= NULL;
	};
} NGMATERIAL;
*/
typedef std::vector<NGSKIN>		NGBLEND;
typedef std::vector<NGFACE16>	NGINDEX16;
typedef std::vector<NGFACE32>	NGINDEX32;

class NGMESH
{
protected:
	// Attribute
	NGVBTYPE				m_typeVB;
	NGIBTYPE				m_typeIB;

	LPVOID					m_pIndex;
	LPVOID					m_pVertex;

	DWORD					m_dwFVF;	// Flexible Vertex Format
	D3DFORMAT				m_d3dFMT;	// Index Buffer Format

	NGRENDERDESC			m_renderDesc;
	NGRENDERBUFFER*			m_pBuffer;

	DWORD	FillVertex();				

public:
	vector<NGFACE>			m_Index;
	vector<D3DXVECTOR3>		m_Position;		
	vector<FLOAT>			m_RHW;			
	vector<D3DXVECTOR3>		m_Normal;
	vector<D3DXVECTOR2>		m_TexCoord;
	vector<UINT>			m_MtrlIndex;
	vector<NGBLEND>			m_Blend;
	vector<D3DXMATERIAL>	m_Mtrl;

	NGMESH();
	// for scene class use
	DWORD		Prepare(NGIBTYPE);
	DWORD		Render(LPDIRECT3DDEVICE8);
	DWORD		SetRenderDesc(NGRENDERDESC);
	DWORD		SetRenderBuffer(NGRENDERBUFFER*);
	DWORD		Clear();

	LPVOID			GetVertex()			{ return m_pVertex;};
	LPVOID			GetIndex()			{ return m_pIndex;};
	NGRENDERDESC*	GetRenderDesc()		{ return &m_renderDesc;};
	DWORD			GetFVF()			{ return m_dwFVF;};
	NGRENDERBUFFER*	GetRenderBuffer()	{ return m_pBuffer;};
};

typedef struct _NGBONE
{
	std::string		strName;
	D3DXMATRIX		matOffset;
	NGFRAME*		pBone;

	_NGBONE()
	{
		pBone	= NULL;
	}
} NGBONE;

class NGFRAME
{
protected:
	// Mesh Attribute
	NGMESH*					m_pMesh;

public:

	// Attribute
	// Basic Attribute
	BOOL					m_bVisible;
	std::string				m_strName;		// Frame Name
	D3DXMATRIX				m_matTran;		// Frame Transformation Matrix
	D3DXMATRIX				m_matAnim;
	D3DXMATRIX				m_matRender;
	// Bone Attribute
	vector<NGBONE>			m_Bone;
	
	// Hierarchy Attribute
	std::vector<NGFRAME*>	m_pChild;
	NGFRAME*				m_pParent;

	// Implementation
	NGFRAME()
	{
		m_bVisible	= TRUE;
		m_pMesh		= NULL;
		m_pParent	= NULL;
		m_matAnim	= m_matTran;
		m_matRender	= m_matTran;
	};

	NGMESH*		CreateMesh();
	DWORD		Prepare(NGIBTYPE);
	DWORD		SetFrameMatrix(LPDIRECT3DDEVICE8);
	DWORD		SetJointMatrix(LPDIRECT3DDEVICE8);

	DWORD		ClearMesh();

	NGMESH*		GetMesh()				{ return m_pMesh;};
	VOID		SetMesh(NGMESH* mesh)	{ m_pMesh	= mesh;};
};

typedef struct _NGFRAMEDESC
{
	DWORD		dwVB;
	DWORD		dwTexture;
	DWORD		dwMtrl;
	DWORD		dwIB;
	vector<NGFRAME*>	frame;
	vector<DWORD>		numID;

	_NGFRAMEDESC(DWORD VB=0, DWORD Texture=0, DWORD Mtrl=0, DWORD IB=0)
	{
		dwVB		= VB;
		dwTexture	= Texture;
		dwMtrl		= Mtrl;
		dwIB		= IB;
	}
} NGFRAMEDESC;

class NGFRAMEBUFFER
{
private:
	vector<NGFRAMEDESC*>	m_fdesc; 

public:

	DWORD	AddFrame(NGFRAME*);
	DWORD			GetSize()		{ return m_fdesc.size();};
	NGFRAMEDESC*	GetFrame(DWORD, DWORD, DWORD);
	NGFRAMEDESC*	GetFrame(DWORD i)	{ return m_fdesc.at(i);};
};

#endif