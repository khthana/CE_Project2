#include <vector>
#include <windows.h>
#include <mmsystem.h>
#include <tchar.h>
//#include <stdio.h> 
#include <stdarg.h>
#include "DXUtil.h"
#include "Mesh.h"


std::vector<D3DMATERIAL9>       Mtrls(0);
std::vector<IDirect3DTexture9*> Textures(0);

CMesh::CMesh()
{
	m_dwNumMtrls  = 0;
	m_pMesh      = 0;
}

CMesh::~CMesh()
{
}

HRESULT CMesh::Create( LPDIRECT3DDEVICE9 m_pd3dDevice, TCHAR* strFilename )
{
    HRESULT hr;

	//
	// Load the XFile data.
	//
	hr = D3DXLoadMeshFromX(  
		strFilename,
		D3DXMESH_MANAGED,
		m_pd3dDevice,
		&m_pAdjBuffer,
		&m_pMtrlBuffer,
		0,
		&m_dwNumMtrls,
		&m_pMesh);
	if(FAILED(hr))
	{
		::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
		return hr;
	}

	//
	// Extract the materials, and load textures.
	//

	if( m_pMtrlBuffer != 0 && m_dwNumMtrls != 0 )
	{
		D3DXMATERIAL* mtrls = (D3DXMATERIAL*)m_pMtrlBuffer->GetBufferPointer();

		for(int i = 0; i < m_dwNumMtrls; i++)
		{
			// the MatD3D property doesn't have an ambient value set
			// when its loaded, so set it now:
			mtrls[i].MatD3D.Ambient = mtrls[i].MatD3D.Diffuse;

			// save the ith material
			Mtrls.push_back( mtrls[i].MatD3D );

			// check if the ith material has an associative texture
			if( mtrls[i].pTextureFilename != 0 )
			{
				// yes, load the texture for the ith subset
				IDirect3DTexture9* tex = 0;
				D3DXCreateTextureFromFile(
					m_pd3dDevice,
					mtrls[i].pTextureFilename,
					&tex);

				// save the loaded texture
				Textures.push_back( tex );
			}
			else
			{
				// no texture for the ith subset
				Textures.push_back( 0 );
			}
		}
	}
//	d3d::Release<ID3DXBuffer*>(mtrlBuffer); // done w/ buffer
    SAFE_RELEASE( m_pMtrlBuffer );

	//
	// Optimize the mesh.
	//

	hr = m_pMesh->OptimizeInplace(		
		D3DXMESHOPT_ATTRSORT |
		D3DXMESHOPT_COMPACT  |
		D3DXMESHOPT_VERTEXCACHE,
		(DWORD*)m_pAdjBuffer->GetBufferPointer(),
		0, 0, 0);

//	d3d::Release<ID3DXBuffer*>(adjBuffer); // done w/ buffer
    SAFE_RELEASE( m_pAdjBuffer );


	if(FAILED(hr))
	{
		::MessageBox(0, "OptimizeInplace() - FAILED", 0, 0);
		return hr;
	}

	return S_OK;
}

HRESULT CMesh::Render( LPDIRECT3DDEVICE9 m_pd3dDevice )
{
	for(int i = 0; i < Mtrls.size(); i++)
	{
		m_pd3dDevice->SetMaterial( &Mtrls[i] );
		m_pd3dDevice->SetTexture(0, Textures[i]);
		m_pMesh->DrawSubset(i);
	}	
	
	return S_OK;
}

HRESULT CMesh::InvalidateDeviceObjects()
{
	for(int i = 0; i < Textures.size(); i++)
		SAFE_RELEASE( Textures[i] );

    SAFE_RELEASE( m_pMesh );   
	return S_OK;
}
