#include "ngtexture.h"

BOOL NGRes2d::Add(NGIMAGE* image)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_ImagesMap.find(image->name);

	if (RcIter==m_ImagesMap.end())
	{
		m_Images.Add(image);
		m_ImagesMap.insert(String_Pair(image->name, m_Images.Length()-1));
	}

	return TRUE;
}

BOOL NGRes2d::Add(ArrayList<NGIMAGE*> images, NGDATA2D* data)
{
	map <string, INT> :: const_iterator RcIter;

	for (int i=0; i<images.Length(); i++)
	{
		RcIter = m_ImagesMap.find(images[i]->name);

		if (RcIter==m_ImagesMap.end())
		{
			m_Images.Add(images[i]);
			m_ImagesMap.insert(String_Pair(images[i]->name, m_Images.Length()-1));
		}
	}

	for (i=0; i<images.Length(); i++)
	{
		if (i==0)
			data->defIndex	= FindImage(images[i]->name);
		else
		{
			data->index.Add(FindImage(images[i]->name));
		}
	}

	RcIter = m_Data2dMap.find(data->name);

	if (RcIter==m_Data2dMap.end())
	{
		m_Data2d.Add(data);
		m_Data2dMap.insert(String_Pair(data->name, m_Data2d.Length()-1));
	}
	
	return TRUE;
}

INT NGRes2d::FindImage(string name)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_ImagesMap.find(name);

	if (RcIter==m_ImagesMap.end())
		return -1;

	return RcIter->second;
}

INT NGRes2d::FindData2d(string name)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_Data2dMap.find(name);

	if (RcIter==m_Data2dMap.end())
		return -1;

	return RcIter->second;
}

BOOL NGRes2d::CreateTexture(NG3D* p3d)
{
	if (p3d==NULL)
	{
		throw NGException();
		return FALSE;
	}

	m_p3d = p3d;
	m_pDevice = p3d->GetDevice();

	if (m_pDevice==NULL)
	{
		throw NGException();
		return FALSE;
	}

	CreateTexture();
	return true;
}

BOOL NGRes2d::CreateTexture()
{
	for (int i=0; i<m_Images.Length(); i++)
	{
		DDSURFACEDESC2 ddsd = m_Images[i]->surdesc;
		D3DFORMAT	d3dFormat;

		if (ddsd.ddpfPixelFormat.dwRGBBitCount==32)
			d3dFormat = D3DFMT_A8R8G8B8;
		else
			d3dFormat = D3DFMT_A1R5G5B5;
		
		LPDIRECT3DTEXTURE8 pTexture = NULL;
		
		m_pDevice->CreateTexture(	ddsd.dwWidth, ddsd.dwHeight, 0, 0, 
									d3dFormat, D3DPOOL_MANAGED, &pTexture);
		
		D3DLOCKED_RECT	d3dlr;
		WORD*			pPixel16 = NULL;
		DWORD*			pPixel32 = NULL;
		
		
		DWORD	dwSize	= m_Images[i]->size;
		BYTE*	pData	= new BYTE[dwSize];
		
		
		if (ddsd.ddpfPixelFormat.dwRGBBitCount==16)
		{
			pTexture->LockRect( 0, &d3dlr, NULL, 0);
			pPixel16 = (WORD*)d3dlr.pBits;
		
			memcpy((void*)pPixel16, (void*)m_Images[i]->data, dwSize);
			pTexture->UnlockRect(i);
		}
		else if (ddsd.ddpfPixelFormat.dwRGBBitCount==32)
		{
			pTexture->LockRect( 0, &d3dlr, NULL, 0);
			pPixel32 = (DWORD*)d3dlr.pBits;
		
			memcpy((void*)pPixel32, (void*)m_Images[i]->data, dwSize);
			pTexture->UnlockRect(0);
		}
		
		m_Textures.Add(pTexture);
	}
		
	return true;
}

LPDIRECT3DTEXTURE8 NGRes2d::GetTexture(DWORD id)
{
	if (id>=m_Textures.Length())
		return NULL;


	return m_Textures[id];
}

BOOL NGRes2d::UpdateTexture(DWORD id)
{
	if (id>=m_Images.Length())
		return FALSE;

	DWORD i = id;
	D3DLOCKED_RECT	d3dlr;
	DWORD*			pPixel32 = NULL;
		
		
	DWORD	dwSize	= m_Images[i]->size;
	
	m_Textures[i]->LockRect( 0, &d3dlr, NULL, 0);
	pPixel32 = (DWORD*)d3dlr.pBits;
	
	memcpy((void*)pPixel32, (void*)m_Images[i]->data, dwSize);
	m_Textures[i]->UnlockRect(i);

	return true;
}
