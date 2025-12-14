#include "stdafx.h"
#include "ngpanel.h"

#include "ngmisc.h"

//---------------------- NGPANEL
NGPANEL::NGPANEL()
{
	m_nStart	= 0;
	m_nLine		= 0;
	m_pTexture	= NULL;
	m_pTex1		= NULL;
	m_pTex2		= NULL;
	m_pTex3		= NULL;
};

NGPANEL::~NGPANEL()
{
};

DWORD NGPANEL::SetTexture(vector<NGTEXTURE*> texture)
{
	if (texture.size()<4)
		return FALSE;

	if (texture.at(0)!=NULL)
		m_pTexture	= texture.at(0)->GetTexture();
	if (texture.at(1)!=NULL)
		m_pTex1		= texture.at(1)->GetTexture();
	if (texture.at(2)!=NULL)
		m_pTex2		= texture.at(2)->GetTexture();
	if (texture.at(3)!=NULL)
		m_pTex3		= texture.at(3)->GetTexture();
	return TRUE;
}

DWORD NGPANEL::SetBackground(LPDIRECT3DTEXTURE8 texture)
{
	m_pTexture	= texture;
	return TRUE;
}
/*
DWORD NGPANEL::Create(NGPOINT ptWindow, NGPOINT size, DWORD	width, NGCOLOR4* pColor, BOOL border, FLOAT z)
{
	m_ptWindow	= ptWindow;
	m_bBorder	= border;
	m_fZLevel	= z;

	
	m_rcClient.right	= size.x * width;
	m_rcClient.bottom	= size.y * width;

	NGRECT	rc	= m_rcClient;
	rc.bottom	+= m_ptWindow.y;
	rc.top		+= m_ptWindow.y;
	rc.left		+= m_ptWindow.x;
	rc.right	+= m_ptWindow.x;

	NG2DVERTEX	vertex;
	DWORD	r	= rc.right;
	DWORD	l	= rc.left;
	DWORD	b	= rc.bottom;
	DWORD	t	= rc.top;
	DWORD	x	= size.x;
	DWORD	y	= size.y;
	DWORD	w	= width;
	DWORD	d	= w * border;
	DWORD	h	= x - (2*border);
	DWORD	k	= y - (2*border);

	if (border)
	{
		// b1
		D3DXVECTOR4	vec[16];

		vec[0]	= D3DXVECTOR4(l		, t		, z, 1.0f);
		vec[1]	= D3DXVECTOR4(l + w	, t		, z, 1.0f);
		vec[2]	= D3DXVECTOR4(l + w	, t + w	, z, 1.0f);
		vec[3]	= D3DXVECTOR4(l		, t + w	, z, 1.0f);

		vec[4]	= D3DXVECTOR4(r - w	, t		, z, 1.0f);
		vec[5]	= D3DXVECTOR4(r		, t		, z, 1.0f);
		vec[6]	= D3DXVECTOR4(r		, t + w	, z, 1.0f);
		vec[7]	= D3DXVECTOR4(r - w	, t + w , z, 1.0f);

		vec[8]	= D3DXVECTOR4(r - w	, b - w	, z, 1.0f);
		vec[9]	= D3DXVECTOR4(r		, b - w	, z, 1.0f);
		vec[10]	= D3DXVECTOR4(r		, b		, z, 1.0f);
		vec[11]	= D3DXVECTOR4(r - w	, b		, z, 1.0f);

		vec[12]	= D3DXVECTOR4(l		, b - w	, z, 1.0f);
		vec[13]	= D3DXVECTOR4(l + w	, b - w , z, 1.0f);
		vec[14]	= D3DXVECTOR4(l + w	, b		, z, 1.0f);
		vec[15]	= D3DXVECTOR4(l		, b		, z, 1.0f);

		D3DXVECTOR2	tex[8];
		tex[0]	= D3DXVECTOR2( 0.0f, 0.0f);
		tex[1]	= D3DXVECTOR2( 0.0f, 1.0f);
		tex[2]	= D3DXVECTOR2( 1.0f, 1.0f);
		tex[3]	= D3DXVECTOR2( 1.0f, 0.0f);

		tex[4]	= D3DXVECTOR2( 0.0f, (float)(y-2));
		tex[5]	= D3DXVECTOR2( 1.0f, (float)(y-2));
		tex[6]	= D3DXVECTOR2( (float)(x-2), 0.0f);
		tex[7]	= D3DXVECTOR2( (float)(x-2), 1.0f);

		vertex.dif	= 0x00000000;
		
		// corner
		vertex.pos	= vec[0];	vertex.tex	= tex[3];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[1];	vertex.tex	= tex[0];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[2];	vertex.tex	= tex[1];	m_Vertex1.push_back(vertex);
														m_Vertex1.push_back(vertex);
		vertex.pos	= vec[3];	vertex.tex	= tex[2];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[0];	vertex.tex	= tex[3];	m_Vertex1.push_back(vertex);

		vertex.pos	= vec[4];	vertex.tex	= tex[0];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[5];	vertex.tex	= tex[3];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[6];	vertex.tex	= tex[2];	m_Vertex1.push_back(vertex);
														m_Vertex1.push_back(vertex);
		vertex.pos	= vec[7];	vertex.tex	= tex[1];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[4];	vertex.tex	= tex[0];	m_Vertex1.push_back(vertex);

		vertex.pos	= vec[8];	vertex.tex	= tex[1];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[9];	vertex.tex	= tex[2];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[10];	vertex.tex	= tex[3];	m_Vertex1.push_back(vertex);
														m_Vertex1.push_back(vertex);
		vertex.pos	= vec[11];	vertex.tex	= tex[0];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[8];	vertex.tex	= tex[1];	m_Vertex1.push_back(vertex);

		vertex.pos	= vec[12];	vertex.tex	= tex[2];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[13];	vertex.tex	= tex[1];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[14];	vertex.tex	= tex[0];	m_Vertex1.push_back(vertex);
														m_Vertex1.push_back(vertex);
		vertex.pos	= vec[15];	vertex.tex	= tex[3];	m_Vertex1.push_back(vertex);
		vertex.pos	= vec[12];	vertex.tex	= tex[2];	m_Vertex1.push_back(vertex);

		// horz
		vertex.pos	= vec[1];	vertex.tex	= tex[3];	m_Vertex2.push_back(vertex);
		vertex.pos	= vec[4];	vertex.tex	= tex[6];	m_Vertex2.push_back(vertex);
		vertex.pos	= vec[7];	vertex.tex	= tex[7];	m_Vertex2.push_back(vertex);
														m_Vertex2.push_back(vertex);
		vertex.pos	= vec[2];	vertex.tex	= tex[2];	m_Vertex2.push_back(vertex);
		vertex.pos	= vec[1];	vertex.tex	= tex[3];	m_Vertex2.push_back(vertex);	
	
		vertex.pos	= vec[14];	vertex.tex	= tex[3];	m_Vertex2.push_back(vertex);
		vertex.pos	= vec[11];	vertex.tex	= tex[6];	m_Vertex2.push_back(vertex);
		vertex.pos	= vec[8];	vertex.tex	= tex[7];	m_Vertex2.push_back(vertex);
														m_Vertex2.push_back(vertex);
		vertex.pos	= vec[13];	vertex.tex	= tex[2];	m_Vertex2.push_back(vertex);
		vertex.pos	= vec[14];	vertex.tex	= tex[3];	m_Vertex2.push_back(vertex);

		// vert
		vertex.pos	= vec[3];	vertex.tex	= tex[0];	m_Vertex3.push_back(vertex);
		vertex.pos	= vec[2];	vertex.tex	= tex[3];	m_Vertex3.push_back(vertex);
		vertex.pos	= vec[13];	vertex.tex	= tex[5];	m_Vertex3.push_back(vertex);
														m_Vertex3.push_back(vertex);
		vertex.pos	= vec[12];	vertex.tex	= tex[4];	m_Vertex3.push_back(vertex);
		vertex.pos	= vec[3];	vertex.tex	= tex[0];	m_Vertex3.push_back(vertex);	
	
		vertex.pos	= vec[6];	vertex.tex	= tex[0];	m_Vertex3.push_back(vertex);
		vertex.pos	= vec[7];	vertex.tex	= tex[3];	m_Vertex3.push_back(vertex);
		vertex.pos	= vec[8];	vertex.tex	= tex[5];	m_Vertex3.push_back(vertex);
														m_Vertex3.push_back(vertex);
		vertex.pos	= vec[9];	vertex.tex	= tex[4];	m_Vertex3.push_back(vertex);
		vertex.pos	= vec[6];	vertex.tex	= tex[0];	m_Vertex3.push_back(vertex);

	}

	//x left, y top
	vertex.pos	= D3DXVECTOR4( l+d	, t+d	, z, 1.0f);
	vertex.dif	= pColor->c1;
	vertex.tex	= D3DXVECTOR2( 0.0f			, 0.0f);
	m_Vertex.push_back(vertex);
	//x right, y top
	vertex.pos	= D3DXVECTOR4( r-d	, t+d	, z, 1.0f);
	vertex.dif	= pColor->c2;
	vertex.tex	= D3DXVECTOR2( 1.0f*h		, 0.0f);
	m_Vertex.push_back(vertex);
	//x left, y bottom
	vertex.pos	= D3DXVECTOR4( l+d	, b-d	, z, 1.0f);
	vertex.dif	= pColor->c3;
	vertex.tex	= D3DXVECTOR2( 	0.0f		, 1.0f*k);
	m_Vertex.push_back(vertex);
	
	//x right, y bottom
	vertex.pos	= D3DXVECTOR4( r-d	, b-d	, z, 1.0f);	
	vertex.dif	= pColor->c4;
	vertex.tex	= D3DXVECTOR2( 1.0f*h		, 1.0f*k);
	m_Vertex.push_back(vertex);

	return TRUE;
}
*/
DWORD NGPANEL::CreateEx(NGRECTEX* rc1, NGCOLOR4* pColor, FLOAT z)
{
	//m_ptWindow	= ptWindow;
	m_rcClient	= *rc1;
	m_fZLevel	= z;
	m_bBorder	= FALSE;

	/*m_rcClient.left	= m_ptWindow.x;
	m_rcClient.top	= m_ptWindow.y;
	m_rcClient.right	= size.x;
	m_rcClient.bottom	= size.y;*/

	NGRECTEX	rc	= *rc1;/*m_rcClient;
	rc.bottom	+= m_ptWindow.y;
	rc.top		+= m_ptWindow.y;
	rc.left		+= m_ptWindow.x;
	rc.right	+= m_ptWindow.x;*/

	NG2DVERTEX	vertex;
	//x left, y top
	vertex.pos	= D3DXVECTOR4( rc.x, rc.y, z, 1.0f);
	vertex.dif	= pColor->c1;
	vertex.tex	= D3DXVECTOR2( 0.0f			, 0.0f);
	m_Vertex.push_back(vertex);
	//x right, y top
	vertex.pos	= D3DXVECTOR4( rc.sx + rc.x, rc.y, z, 1.0f);
	vertex.dif	= pColor->c2;
	vertex.tex	= D3DXVECTOR2( 1.0f			, 0.0f);
	m_Vertex.push_back(vertex);
	//x left, y bottom
	vertex.pos	= D3DXVECTOR4( rc.x, rc.sy + rc.y, z, 1.0f);
	vertex.dif	= pColor->c3;
	vertex.tex	= D3DXVECTOR2( 	0.0f		, 1.0f);
	m_Vertex.push_back(vertex);
	
	//x right, y bottom
	vertex.pos	= D3DXVECTOR4( rc.x + rc.sx, rc.y + rc.sy, z, 1.0f);	
	vertex.dif	= pColor->c4;
	vertex.tex	= D3DXVECTOR2( 1.0f		, 1.0);
	m_Vertex.push_back(vertex);

	return TRUE;
}

DWORD NGPANEL::Prepare(NG3D* p3d)
{
	if (p3d==NULL)
		return FALSE;

	if (p3d->GetDevice()==NULL)
		return FALSE;

	m_p3d	= p3d;

	HRESULT hr;

	if (FAILED(hr = m_p3d->GetDevice()->CreateVertexBuffer( m_Vertex.size()*sizeof(NG2DVERTEX),
									D3DUSAGE_DYNAMIC | D3DUSAGE_WRITEONLY, NGFVF_2DVERTEX, D3DPOOL_DEFAULT,&m_pVB)))
		MessageBox(NULL,"HI","HI",MB_OK);

	if (FAILED(m_pVB->Lock(0,m_Vertex.size()*sizeof(NG2DVERTEX),(BYTE**)&m_pVertices,0)))
		MessageBox(NULL,"HI","HI",MB_OK);

	memcpy((void*)m_pVertices,(void*)&m_Vertex.at(0), m_Vertex.size()*sizeof(NG2DVERTEX));

	if (FAILED(m_pVB->Unlock()))
		MessageBox(NULL,"HI","HI",MB_OK);


	if (m_bBorder)
	{
		if (FAILED(hr = m_p3d->GetDevice()->CreateVertexBuffer( m_Vertex1.size()*sizeof(NG2DVERTEX),
										0, NGFVF_2DVERTEX, D3DPOOL_DEFAULT,&m_pVB1)))
			return hr;
	
		m_pVB1->Lock(0,m_Vertex1.size()*sizeof(NG2DVERTEX),(BYTE**)&m_pVert1,0);
		memcpy((void*)m_pVert1,(void*)&m_Vertex1.front(), m_Vertex1.size()*sizeof(NG2DVERTEX));
		m_pVB1->Unlock();

		if (FAILED(hr = m_p3d->GetDevice()->CreateVertexBuffer( m_Vertex2.size()*sizeof(NG2DVERTEX),
										0, NGFVF_2DVERTEX, D3DPOOL_DEFAULT,&m_pVB2)))
			return hr;
	
		m_pVB2->Lock(0,m_Vertex2.size()*sizeof(NG2DVERTEX),(BYTE**)&m_pVert2,0);
		memcpy((void*)m_pVert2,(void*)&m_Vertex2.front(), m_Vertex2.size()*sizeof(NG2DVERTEX));
		m_pVB2->Unlock();

		if (FAILED(hr = m_p3d->GetDevice()->CreateVertexBuffer( m_Vertex3.size()*sizeof(NG2DVERTEX),
										0, NGFVF_2DVERTEX, D3DPOOL_DEFAULT,&m_pVB3)))
			return hr;
	
		m_pVB3->Lock(0,m_Vertex3.size()*sizeof(NG2DVERTEX),(BYTE**)&m_pVert3,0);
		memcpy((void*)m_pVert3,(void*)&m_Vertex3.front(), m_Vertex3.size()*sizeof(NG2DVERTEX));
		m_pVB3->Unlock();
	}
	return TRUE;
}

DWORD NGPANEL::Render()
{
	LPDIRECT3DDEVICE8	device = m_p3d->GetDevice();
	if (device==NULL)
		return FALSE;

	DWORD decs[]	= 
	{
		D3DVSD_STREAM(0),
		D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT4),
		D3DVSD_REG(D3DVSDE_DIFFUSE, D3DVSDT_D3DCOLOR),
		D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
		D3DVSD_END()
	};
	
	DWORD handle;
	device->CreateVertexShader( decs, NULL, &handle, 0);

	device->SetTexture(0, m_pTexture);
	device->SetVertexShader(NGFVF_2DVERTEX);
	device->SetStreamSource(0, m_pVB, sizeof(NG2DVERTEX));
	device->DrawPrimitive(D3DPT_TRIANGLESTRIP , 0, 2);
/*
	if (m_bBorder)
	{
		device->SetTexture(0, m_pTex1);
		device->SetVertexShader(NGFVF_2DVERTEX);
		device->SetStreamSource(0, m_pVB1, sizeof(NG2DVERTEX));
		device->DrawPrimitive(D3DPT_TRIANGLELIST , 0, 8);

		device->SetTexture(0, m_pTex2);
		device->SetVertexShader(NGFVF_2DVERTEX);
		device->SetStreamSource(0, m_pVB2, sizeof(NG2DVERTEX));
		device->DrawPrimitive(D3DPT_TRIANGLELIST , 0, 4);

		device->SetTexture(0, m_pTex3);
		device->SetVertexShader(NGFVF_2DVERTEX);
		device->SetStreamSource(0, m_pVB3, sizeof(NG2DVERTEX));
		device->DrawPrimitive(D3DPT_TRIANGLELIST , 0, 4);
	}
*/
	return TRUE;
}

DWORD NGPANEL::Move(INT x, INT y)
{
	m_rcClient.x	+= x;
	m_rcClient.y	+= y;

	NGRECT rc;
	rc.left		= m_rcClient.x;
	rc.right	= m_rcClient.x + m_rcClient.sx;
	rc.top		= m_rcClient.y;
	rc.bottom	= m_rcClient.y + m_rcClient.sy;
	
	//x left, y top
	m_Vertex.at(0).pos	= D3DXVECTOR4( rc.left, rc.top, m_fZLevel, 1.0f);
	//x right, y top
	m_Vertex.at(1).pos	= D3DXVECTOR4( rc.right, rc.top, m_fZLevel, 1.0f);

	//x left, y bottom
	m_Vertex.at(2).pos	= D3DXVECTOR4( rc.left, rc.bottom, m_fZLevel, 1.0f);
	
	//x right, y bottom
	m_Vertex.at(3).pos	= D3DXVECTOR4( rc.right, rc.bottom, m_fZLevel, 1.0f);


	m_pVB->Lock( 0, m_Vertex.size()*sizeof(NG2DVERTEX),(BYTE**)&m_pVertices,0);
	memcpy((void*)m_pVertices,(void*)&m_Vertex.at(0), m_Vertex.size()*sizeof(NG2DVERTEX));
	m_pVB->Unlock();

	return TRUE;
}

DWORD NGPANEL::MoveTo(INT x, INT y)
{
	m_rcClient.x	= x;
	m_rcClient.y	= y;

	NGRECT rc;
	rc.left		= m_rcClient.x;
	rc.right	= m_rcClient.x + m_rcClient.sx;
	rc.top		= m_rcClient.y;
	rc.bottom	= m_rcClient.y + m_rcClient.sy;
	
	//x left, y top
	m_Vertex.at(0).pos	= D3DXVECTOR4( rc.left, rc.top, m_fZLevel, 1.0f);
	//x right, y top
	m_Vertex.at(1).pos	= D3DXVECTOR4( rc.right, rc.top, m_fZLevel, 1.0f);

	//x left, y bottom
	m_Vertex.at(2).pos	= D3DXVECTOR4( rc.left, rc.bottom, m_fZLevel, 1.0f);
	
	//x right, y bottom
	m_Vertex.at(3).pos	= D3DXVECTOR4( rc.right, rc.bottom, m_fZLevel, 1.0f);


	m_pVB->Lock( 0, m_Vertex.size()*sizeof(NG2DVERTEX),(BYTE**)&m_pVertices,0);
	memcpy((void*)m_pVertices,(void*)&m_Vertex.at(0), m_Vertex.size()*sizeof(NG2DVERTEX));
	m_pVB->Unlock();

	return TRUE;
}


DWORD NGTEXT::Create(RECT rc)
{
	m_rcClient		= rc;
	m_ptWindow.x	= rc.left;
	m_ptWindow.y	= rc.top;
	m_dwWidth		= rc.right - rc.left;
	m_dwHeight		= rc.bottom - rc.top;

	return TRUE;
}

DWORD NGTEXT::Prepare(LPDIRECT3DSURFACE8 surface, char* Fontname, DWORD height, DWORD width)
{
	if (surface==NULL)
		return FALSE;

	m_Target	= surface;
	m_Target->GetDesc(&m_desc);

	m_strFont	= Fontname;
	m_dwFontHeight	= height;

	// Prepare to create a bitmap
    BITMAPINFO bmi;
    ZeroMemory(&bmi.bmiHeader,sizeof(BITMAPINFOHEADER));
    bmi.bmiHeader.biSize        = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth       =  (int)m_dwWidth;
    bmi.bmiHeader.biHeight      = -(int)m_dwHeight;
    bmi.bmiHeader.biPlanes      = 1;
    bmi.bmiHeader.biCompression = BI_RGB;
    bmi.bmiHeader.biBitCount    = GetBitDepth(m_desc.Format);

    // Create a DC and a bitmap for the font
    m_hDC		= CreateCompatibleDC(NULL);
    m_hBitmap	= CreateDIBSection( m_hDC, &bmi, DIB_RGB_COLORS,
                                          (VOID**)&m_pBmpBits, NULL, 0 );
    SetMapMode(m_hDC, MM_TEXT);

	// Create a font.  By specifying ANTIALIASED_QUALITY, we might get an
    // antialiased font, but this is not guaranteed.
    INT nHeight	= -m_dwFontHeight;//-MulDiv( m_dwFontHeight, (INT)(GetDeviceCaps(hDC, LOGPIXELSY) * m_fTextScale), 72 );
    m_hFont		= CreateFont( height, 0, 0, 0, FW_NORMAL, FALSE,
                          FALSE, FALSE, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS,
                          CLIP_DEFAULT_PRECIS, ANTIALIASED_QUALITY,
                          VARIABLE_PITCH, m_strFont.c_str());
    if (NULL==m_hFont)
        return FALSE;

    SelectObject( m_hDC, m_hBitmap);
    SelectObject( m_hDC, m_hFont);

	return TRUE;
}

DWORD NGTEXT::Render(LPDIRECT3DSURFACE8 surface)
{
	if (surface!=NULL)
	{
		m_Target	= surface;
		m_Target->GetDesc(&m_desc);
	}

    // Set text properties
    SetTextColor( m_hDC, RGB(255, 255, 255) );
    SetBkColor(   m_hDC, 0x00000000);
	SetBkMode(	  m_hDC, OPAQUE);
    SetTextAlign( m_hDC, TA_TOP );

	//GetTextExtentPoint32(m_hDC, m_Text.at(0).c_str(), m_Text.at(0).length() , &size);
	ExtTextOut(m_hDC, 0, 0, ETO_OPAQUE, NULL, m_Text.at(0).c_str(), m_Text.at(0).length(), NULL);

	INT xMin, xMax, yMin, yMax;
	RECT	rcClient	= m_rcClient;

	xMin	= 0;
	yMin	= 0;
	xMax	= m_dwWidth;
	yMax	= m_dwHeight;

	if (m_rcClient.top<0)
	{
		yMin	= -m_rcClient.top;
		rcClient.top	= 0;
	}

	if (m_rcClient.bottom>m_desc.Height)
	{
		yMax	-= m_rcClient.bottom - m_desc.Height;
		rcClient.bottom	= m_desc.Height;
	}

	if ((m_rcClient.top>m_desc.Height)||(m_rcClient.bottom<0))
	{
		yMin	= 0;
		yMax	= 0;
	}

	if (m_rcClient.left<0)
	{
		xMin	= -m_rcClient.left;
		rcClient.left	= 0;
	}

	if (m_rcClient.right>m_desc.Width)
	{
		xMax	-= m_rcClient.right - m_desc.Width;
		rcClient.right	= m_desc.Width;
	}

	if ((m_rcClient.left>m_desc.Width)||(m_rcClient.right<0))
	{
		xMin	= 0;
		xMax	= 0;
	}
	

	m_Target->LockRect(&m_d3dlr, &rcClient, 0);

	switch (GetBitDepth(m_desc.Format))
	{
	case 32:
		{
			DWORD*	pBits	= (DWORD*)m_d3dlr.pBits;
			DWORD	pitch	= m_d3dlr.Pitch/4;
			DWORD*	pBmp	= (DWORD*)m_pBmpBits;
			DWORD	bDraw;

			/*
			for (int y=0; y<m_dwHeight; y++)
			{
				for (int x=0; x<m_dwWidth; x++)
				{*/
			for (int y=yMin; y<yMax; y++)
			{
				for (int x=xMin; x<xMax; x++)
				{
					INT	sy	= y-yMin;
					INT	sx	= x-xMin;
					INT wy	= y;
					INT wx	= x;
					bDraw	= pBmp[(m_dwWidth)*wy + wx] || 0x00000000;				

					if (bDraw)
					{
						pBits[pitch*(sy+1) + (sx+1)]	= 0x00000000;
						pBits[pitch*sy + sx]	= pBmp[(m_dwWidth)*wy + wx]; //* bDraw);
					}
				}
			}
			
		}
		break;

	case 16:
		{

		}
		break;

	default:
		break;
	}

	m_Target->UnlockRect();

	
	return TRUE;
}

DWORD NGTEXT::SetText(char* strText)
{
	if (m_Text.size() == 0)
		m_Text.push_back(strText);
	m_Text.at(0)	= strText;
	return TRUE;
}

DWORD NGTEXT::Move(INT x, INT y)
{
	m_rcClient.top	+= y;
	m_rcClient.left	+= x;
	m_rcClient.bottom	+=y;
	m_rcClient.right	+=x;
	m_ptWindow.x	+= x;
	m_ptWindow.y	+= y;	
	return TRUE;
}

DWORD NGTEXT::MoveTo(INT x, INT y)
{
	m_rcClient.top	= y;
	m_rcClient.left	= x;
	m_rcClient.bottom	= m_dwHeight+y;
	m_rcClient.right	= m_dwWidth+x;
	m_ptWindow.x	= x;
	m_ptWindow.y	= y;
	return TRUE;
}

VOID NGPACKAGE::AddPanel(NGPANEL* panel)
{
	if (panel==NULL)
		return;

	m_pPanel.push_back(panel);
	m_ptPanel.push_back(NGPOINT(panel->GetClient().x-m_ptWindow.x,
								panel->GetClient().y-m_ptWindow.y));

}


VOID NGPACKAGE::AddText(NGTEXT* text)
{
	if (text==NULL)
		return;

	m_pText.push_back(text);
	m_ptText.push_back(NGPOINT(text->GetClient().x-m_ptWindow.x,
								text->GetClient().y-m_ptWindow.y));

}

DWORD NGPACKAGE::Move(INT x, INT y)
{
	m_ptWindow.x+=x;
	m_ptWindow.y+=y;

	for (int i=0; i<m_pPanel.size(); i++)
		m_pPanel.at(i)->Move(x,y);

	for (i=0; i<m_pText.size(); i++)
		m_pText.at(i)->Move(x,y);

	return TRUE;
}

DWORD NGPACKAGE::MoveTo(INT x, INT y)
{
	m_ptWindow.x	= x;
	m_ptWindow.y	= y;
	INT mx,my;
	for (int i=0; i<m_pPanel.size(); i++)
	{
		mx	= x + m_ptPanel.at(i).x;
		my	= y	+ m_ptPanel.at(i).y;
		m_pPanel.at(i)->MoveTo(mx,my);
	}

	for (i=0; i<m_pText.size(); i++)
	{
		mx	= x + m_ptText.at(i).x;
		my	= y	+ m_ptText.at(i).y;
		m_pText.at(i)->MoveTo(mx,my);
	}

	return TRUE;
}



