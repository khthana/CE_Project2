#include "ngtexture.h"

WORD NGDDSFILE::GetBits(DWORD dwMask)
{
    WORD wBits = 0;
    while (dwMask)
    {
        dwMask = dwMask & (dwMask - 1);  
        wBits++;
    }
    return wBits;
}

LPDIRECT3DTEXTURE8 NGDDSFILE::LoadFile(char* pathname)
{
	if (!m_File.Exists(pathname))
		return NULL;

	m_File.Open(pathname);

	/*
	DWORD dwMagic (0x20534444, or "DDS ")
    DDSURFACEDESC2 ddsd (this provides information about the surface format)
    BYTE bData1[] (this is the surface data for the main surface)
    [BYTE bData2[]...] (surface data for attached surfaces, if any, follow)
	*/

	m_File.ReadBuff(&m_dwMagic, sizeof (DWORD));

	if (m_dwMagic!=0x20534444)
		return NULL;

	if (!m_File.ReadBuff(&m_ddsd, sizeof (DDSURFACEDESC2)))
		return NULL;

	DWORD	dwMipmap	= 1;
	if (dwMipmap<m_ddsd.dwMipMapCount)
		dwMipmap	= m_ddsd.dwMipMapCount;

	LPDIRECT3DDEVICE8	device	= NG3D::GetGraphics()->GetDevice();
	if (device==NULL)
		return NULL;

	INT A	= GetBits(m_ddsd.ddpfPixelFormat.dwRGBAlphaBitMask);
	INT R	= GetBits(m_ddsd.ddpfPixelFormat.dwRBitMask);
	INT G	= GetBits(m_ddsd.ddpfPixelFormat.dwGBitMask);
	INT B	= GetBits(m_ddsd.ddpfPixelFormat.dwBBitMask);
	D3DFORMAT	d3dFormat;

	if (G==8)
		if (A==0)
			d3dFormat = D3DFMT_X8R8G8B8;
		else 
		if (A==8)
			d3dFormat = D3DFMT_A8R8G8B8;
	if (G==6)
		d3dFormat = D3DFMT_R5G6B5;
	if (G==5)
		if (A==1)
			d3dFormat = D3DFMT_A1R5G5B5;
		else
			d3dFormat = D3DFMT_X1R5G5B5;
	if (G==4)
		if (A==4)
			d3dFormat = D3DFMT_A4R4G4B4;
		else
			d3dFormat = D3DFMT_X4R4G4B4;

	LPDIRECT3DTEXTURE8 pTexture = NULL;

	device->CreateTexture(	m_ddsd.dwWidth, m_ddsd.dwHeight, dwMipmap, 0, 
							d3dFormat, D3DPOOL_MANAGED, &pTexture);

	D3DLOCKED_RECT	d3dlr;
	WORD*			pPixel16	= NULL;
	DWORD*			pPixel32 = NULL;


	for (int i=0;i<dwMipmap;i++)
	{
		DWORD	dwSize	= (m_ddsd.dwWidth*m_ddsd.dwHeight*m_ddsd.ddpfPixelFormat.dwRGBBitCount/2)/(4*(i+1));
		BYTE*	pData	= new BYTE[dwSize];

		if (!m_File.ReadBuff(pData, sizeof(BYTE), dwSize))
			return NULL;

		if (m_ddsd.ddpfPixelFormat.dwRGBBitCount==16)
		{
			pTexture->LockRect( i, &d3dlr, NULL, 0);
			pPixel16 = (WORD*)d3dlr.pBits;

			memcpy((void*)pPixel16, (void*)pData, dwSize);
			pTexture->UnlockRect(i);
		}
		else if (m_ddsd.ddpfPixelFormat.dwRGBBitCount==32)
		{
			pTexture->LockRect( i, &d3dlr, NULL, 0);
			pPixel32 = (DWORD*)d3dlr.pBits;

			memcpy((void*)pPixel32, (void*)pData, dwSize);
			pTexture->UnlockRect(i);
		}
	}

	return pTexture;
}
/*
DWORD NGTEXCTRL::LoadSeries(char* filename, char* extent, DWORD start, DWORD number)
{
	char buffer[64];
	for (int i=0; i<number; i++)
	{
		sprintf(buffer, "%s%d.%s", filename, start+i, extent);

		NGTEXTURE* tex	= m_ddsFile.LoadFile(buffer);

		if (tex!=NULL)
			m_Texture.push_back(tex);
	}

	m_dwNumTex = m_Texture.size();

	return TRUE;
}
*/
DWORD NGTEXTURE::Update(FLOAT time)
{
	if (m_dwNumTex==0)
		return FALSE;

	m_fTime+=time;
	if (m_fTime > m_fFactor)
	{
		m_fTime=0;
		m_dwCurrTex++;
	}

	if (m_dwCurrTex>=m_dwNumTex)
		m_dwCurrTex=0;

	return TRUE;
}

DWORD NGTEXTURE::AddTexture(LPDIRECT3DTEXTURE8 pTexture)
{
	m_Texture.push_back(pTexture);
	m_dwNumTex++;
	
	return TRUE;
}

DWORD NGTEXTURE::SetTexture(DWORD i)
{
	if (m_Texture.size()<i)
		return m_dwCurrTex;

	m_dwCurrTex	= i;
	return i;
}

LPDIRECT3DTEXTURE8 NGTEXTURE::GetTexture()
{
	if (m_dwCurrTex >= m_Texture.size())
		return NULL;
	return m_Texture.at(m_dwCurrTex);
}
	