// Terrain.h: interface for the CTerrain class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_TERRAIN_H__605B63BD_B46A_44BF_A2F2_573132F97949__INCLUDED_)
#define AFX_TERRAIN_H__605B63BD_B46A_44BF_A2F2_573132F97949__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <d3dx8.h>
#include "Base.h"

//Define a FVF for our terrain
#define TERRAIN_D3DFVF_CUSTOMVERTEX (D3DFVF_XYZ|D3DFVF_NORMAL|D3DFVF_TEX1)

class CTerrain : public CBase  
{
private:
	//Define a custom vertex for our terrain
	struct TERRAIN_CUSTOMVERTEX
	{
		FLOAT x, y, z;		//Position of vertex in 3D space
		FLOAT nx, ny, nz;	//Lighting Normal
		FLOAT tu, tv;		//Texture coordinates
	};

public:
	bool SetMaterial(D3DCOLORVALUE rgbaDiffuse, D3DCOLORVALUE rgbaAmbient, D3DCOLORVALUE rgbaSpecular, D3DCOLORVALUE rgbaEmissive, float rPower);
	bool SetTexture(const char* szTextureFilePath);
	bool SetPosition(WORD xs, WORD xe ,WORD zs, WORD ze);
	DWORD Render();
	CTerrain(LPDIRECT3DDEVICE8 pD3DDevice, WORD wRows = 20, WORD wCols = 20, WORD xs = -10, WORD zs = 10, float rTileSize = 1.0, WORD wMaxHeight = 10);
	virtual ~CTerrain();

private:
	bool CreateIndexBuffer();
	bool UpdateVertices();
	bool CreateVertexBuffer();
	LPDIRECT3DDEVICE8 m_pD3DDevice;
	LPDIRECT3DVERTEXBUFFER8 m_pVertexBuffer;
	LPDIRECT3DTEXTURE8 m_pTexture;
	D3DMATERIAL8 m_matMaterial;
	LPDIRECT3DINDEXBUFFER8 m_pIndexBuffer;	

	WORD m_wRows;
	WORD m_wCols;
	WORD m_wMaxHeight;
	float m_rTileSize;

	WORD posZStart;
	WORD posZEnd;
	WORD posXStart;
	WORD posXEnd;

	DWORD m_dwNumOfVertices;	
	DWORD m_dwNumOfIndices;
	DWORD m_dwNumOfPolygons;

};

#endif // !defined(AFX_TERRAIN_H__605B63BD_B46A_44BF_A2F2_573132F97949__INCLUDED_)
