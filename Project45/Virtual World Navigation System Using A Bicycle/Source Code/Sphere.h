// Sphere.h: interface for the CSphere class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SPHERE_H__FC705F3B_568E_4973_B608_B8F7700D9ECE__INCLUDED_)
#define AFX_SPHERE_H__FC705F3B_568E_4973_B608_B8F7700D9ECE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <d3dx8.h>
#include "Base.h"

//Define a FVF for our sphere
#define SPHERE_D3DFVF_CUSTOMVERTEX (D3DFVF_XYZ|D3DFVF_NORMAL|D3DFVF_TEX1)

class CSphere : public CBase  
{
private:
	//Define a custom vertex for our sphere
	struct SPHERE_CUSTOMVERTEX
	{
		FLOAT x, y, z;		//Position of vertex in 3D space
		FLOAT nx, ny, nz;	//Lighting Normal
		FLOAT tu, tv;		//Texture coordinates
	};

public:
	bool SetMaterial(D3DCOLORVALUE rgbaDiffuse, D3DCOLORVALUE rgbaAmbient, D3DCOLORVALUE rgbaSpecular, D3DCOLORVALUE rgbaEmissive, float rPower);
	bool SetTexture(const char* szTextureFilePath);
	DWORD Render();
	CSphere(LPDIRECT3DDEVICE8 pD3DDevice, int nRings = 20, int nSegments = 20);
	virtual ~CSphere();

private:
	bool CreateIndexBuffer();
	bool UpdateVertices();
	bool CreateVertexBuffer();
	LPDIRECT3DDEVICE8 m_pD3DDevice;
	LPDIRECT3DVERTEXBUFFER8 m_pVertexBuffer;
	LPDIRECT3DTEXTURE8 m_pTexture;
	D3DMATERIAL8 m_matMaterial;
	LPDIRECT3DINDEXBUFFER8 m_pIndexBuffer;	

	int m_nRings;
	int m_nSegments;

	DWORD m_dwNumOfVertices;	
	DWORD m_dwNumOfIndices;
	DWORD m_dwNumOfPolygons;
};

#endif // !defined(AFX_SPHERE_H__FC705F3B_568E_4973_B608_B8F7700D9ECE__INCLUDED_)
