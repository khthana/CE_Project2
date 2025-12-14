#include "ngpanel.h"

//-------------------------------------------------- NGPanelControl

NGPanelControl* NGPanelControl::m_this = NULL;

NGPanelControl::NGPanelControl()
{
	m_deskTop	= NULL;
	m_default	= NULL;
	m_curHandle	= 0;
	m_this		= this; 
}

NGPanelControl* NGPanelControl::CreatePanelCtrl(DWORD sx, DWORD sy, DWORD px, DWORD py)
{
	
	if (m_this)
		return m_this;

	new NGPanelControl();

	return PanelControl()->InitialCtrl(sx, sy, px, py);
}

NGPanelControl* NGPanelControl::InitialCtrl(DWORD sx, DWORD sy, DWORD px, DWORD py)
{
	if (m_deskTop!=NULL)
		return m_this;
	NGPanel*	desktop	= new NGPanel(sx, sy, px, py);
	m_deskTop	= desktop;
	m_default	= desktop;
	desktop->Update(TRUE);
	m_curHandle	= 1;

	return m_this;
}

VOID NGPanelControl::SetDesktop(NGPanel* desk)
{
	if (desk)
		m_deskTop = desk;
}

VOID NGPanelControl::Update()
{
	if (m_deskTop==NULL)
		return;

	m_deskTop->Update(false);
}

//---------------------------------------------------- NGPanel

NGPanel::NGPanel()
{
}

NGPanel::NGPanel(DWORD px, DWORD py, DWORD sx, DWORD sy)
{
	m_desc.dock	= DockType.none;
	m_desc.sx	= sx;		// specific size
	m_desc.sy	= sy;
	m_desc.px	= px;
	m_desc.py	= py;

	m_asx	= sx;			// availble size
	m_asy	= sy;
	m_apx	= 0;
	m_apy	= 0;

	m_desc.bAlwaysTop	= false;
	m_desc.name			= "desktop";
	m_desc.pParent		= NULL;
	m_handle	= 0;
	m_update	= true;
	m_show		= true;
}

NGPanel::NGPanel(NGPANELCREATE* pc)
{
	m_desc	= *pc;
	
	if (m_desc.pParent==NULL)
		m_desc.pParent = PanelControl()->GetDesktop();
	
	m_desc.pParent->AddChild(this);
	m_handle= 0;
	m_show	= true;
}

VOID NGPanel::Create(NGPANELCREATE* pc)
{
	NGPanel::NGPanel(pc);
}

VOID NGPanel::UpdateSize()
{
	m_asx	= m_desc.sx;
	m_asy	= m_desc.sy;
	m_apx	= 0;
	m_apy	= 0;

	switch (m_desc.dock)
	{
	case DOCK_TOP:
		{
			if (m_desc.pParent==NULL)
			{
				m_px	= 0;
				m_py	= 0;
				m_sx	= m_desc.sx;
				m_sy	= m_desc.sy;
			}
			else
			{
				m_apx	= m_desc.pParent->m_apx;
				m_apy	= m_desc.pParent->m_apy;
				m_asx	= m_desc.pParent->m_asx;
				m_asy	= (m_desc.sy>m_desc.pParent->m_asy)? m_desc.pParent->m_asy : m_desc.sy;

				m_desc.pParent->m_apy += m_asy;
				m_desc.pParent->m_asy -= m_asy;
				
				m_px	= m_apx + m_desc.pParent->m_px;
				m_py	= m_apy	+ m_desc.pParent->m_py;
				m_sx	= m_asx + m_px;
				m_sy	= m_asy + m_py;
			}
		}
		break;
	case DOCK_BOTTOM:
		{
			if (m_desc.pParent==NULL)
			{
				m_px	= 0;
				m_py	= 0;
				m_sx	= m_apx;
				m_sy	= m_apy;
			}
			else
			{
				m_apx	= m_desc.pParent->m_apx;
				m_asx	= m_desc.pParent->m_asx;

				INT size	= m_desc.pParent->m_apy + m_desc.pParent->m_asy - m_desc.sy;

				if (size<0)
				{
					size =  m_desc.pParent->m_apy;
					m_asy	= m_desc.pParent->m_asy;
				}
				else
				{	
					//m_apy	= size;
					m_asy	= m_desc.sy;
				}

				m_desc.pParent->m_asy -= m_asy;
				
				m_px	= m_apx + m_desc.pParent->m_px;
				m_py	= m_apy	+ m_desc.pParent->m_py + size;
				m_sx	= m_asx + m_px;
				m_sy	= m_asy + m_py;
			}
		}
		break;
	case DOCK_LEFT:
		{
			if (m_desc.pParent==NULL)
			{
				m_px	= 0;
				m_py	= 0;
				m_sx	= m_apx;
				m_sy	= m_apy;
			}
			else
			{
				m_apx	= m_desc.pParent->m_apx;
				m_apy	= m_desc.pParent->m_apy;
				m_asx	= (m_desc.sx>m_desc.pParent->m_asx)? m_desc.pParent->m_asx : m_desc.sx;
				m_asy	= m_desc.pParent->m_asy;

				m_desc.pParent->m_apx += m_asx;
				m_desc.pParent->m_asx -= m_asx;
				
				m_px	= m_apx + m_desc.pParent->m_px;
				m_py	= m_apy	+ m_desc.pParent->m_py;
				m_sx	= m_asx + m_px;
				m_sy	= m_asy + m_py;
			}	
		}
		break;
	case DOCK_RIGHT:
		{
			if (m_desc.pParent==NULL)
			{
				m_px	= 0;
				m_py	= 0;
				m_sx	= m_apx;
				m_sy	= m_apy;
			}
			else
			{
				m_apy	= m_desc.pParent->m_apy;
				m_asy	= m_desc.pParent->m_asy;

				INT size	= m_desc.pParent->m_apx + m_desc.pParent->m_asx - m_desc.sx;

				if (size<0)
				{
					size	= m_desc.pParent->m_apx;
					m_asx	= m_desc.pParent->m_asx;
				}
				else
				{	
					//m_apx	= size;
					m_asx	= m_desc.sx;
				}

				m_desc.pParent->m_asx -= m_asx;
				
				m_px	= m_apx + m_desc.pParent->m_px + size;
				m_py	= m_apy	+ m_desc.pParent->m_py;
				m_sx	= m_asx + m_px;
				m_sy	= m_asy + m_py;
			}
		}
		break;
	case DOCK_FILL:
		{
			if (m_desc.pParent==NULL)
			{
				m_px	= 0;
				m_py	= 0;
				m_sx	= m_apx;
				m_sy	= m_apy;
			}
			else
			{
				m_apx	= m_desc.pParent->m_apx;
				m_apy	= m_desc.pParent->m_apy;
				m_asx	= m_desc.pParent->m_asx;
				m_asy	= (m_desc.sy>m_desc.pParent->m_asy)? m_desc.pParent->m_asy : m_desc.sy;

				m_desc.pParent->m_apy += m_asy;
				m_desc.pParent->m_asy -= m_asy;
				
				m_px	= m_apx + m_desc.pParent->m_px;
				m_py	= m_apy	+ m_desc.pParent->m_py;
				m_sx	= m_asx + m_px;
				m_sy	= m_asy + m_py;
			}
		}
		break;
	case DOCK_NONE:
		{
			if (m_desc.pParent==NULL)
			{
				m_px	= 0;
				m_py	= 0;
				m_sx	= m_desc.sx;
				m_sy	= m_desc.sy;
			}
			else
			{
				m_px	= m_desc.px + m_desc.pParent->m_px;
				m_py	= m_desc.py + m_desc.pParent->m_py;
				m_sx	= m_desc.sx + m_px;
				m_sy	= m_desc.sy + m_py;
				/*
				if (m_desc.pParent->m_px>m_px)
				{
					m_apx= m_desc.pParent->m_px - m_px;
					m_px = m_desc.pParent->m_px;
				}

				if (m_desc.pParent->m_py>m_py)
				{
					m_apy= m_desc.pParent->m_py - m_py;
					m_py = m_desc.pParent->m_py;
				}

				if (m_desc.pParent->m_sx<m_sx)
				{
					m_asx-= m_sx - m_desc.pParent->m_sx;
					m_sx = m_desc.pParent->m_sx;
				}

				if (m_desc.pParent->m_sy<m_sy)
				{
					m_asy-= m_sy - m_desc.pParent->m_sy;
					m_sy = m_desc.pParent->m_sy;
				}
				*/
			}
		}
		break;
	}
}
	

VOID NGPanel::Update(BOOL update)
{
	if (update)
		m_update = update;

	UpdateSize();


	for (int i=0; i<m_child.Length(); i++)
	{
		m_child[i]->Update(m_update);
	}

	m_update = false;
}

VOID NGPanel::AddChild(NGPanel* pnl)
{
	m_child.Add(pnl);
}

VOID NGPanel::RemoveChild(NGPanel* pnl)
{
	for (int i=0; i<m_child.Length(); i++)
	{
		if (m_child[i]==pnl)
		{
			((NGPanel*)m_child[i])->SetParent(NULL);
			(*(NGPanel*)m_child[i]) = NULL;
		}
	}
}

VOID NGPanel::SetParent(NGPanel* pnl)
{
	m_desc.pParent	= pnl;
}

BOOL NGPanel::SetPosition(DWORD x, DWORD y)
{
	m_desc.px = x;
	m_desc.py = y;
	return TRUE;
}

//------------------------------------------------------ NGTextureBox

NGTextureBox::NGTextureBox(NGPANELCREATE* pc) 
{
	m_desc	= *pc;
	
	if (m_desc.pParent==NULL)
		m_desc.pParent = PanelControl()->GetDesktop();
	
	m_desc.pParent->AddChild(this);
	m_handle= 0;
	m_show	= true;
	m_Level		= 0.0f;
	ZeroMemory(m_color, sizeof(m_color));
	ZeroMemory(&m_rdesc, sizeof(m_rdesc));

	m_rdesc.vCount	= 4;
	m_rdesc.iCount	= 2;
	m_rdesc.t0		= -1;
	m_rdesc.t1		= -1;
	m_ts			= D3DXVECTOR2(0.0f, 0.0f);
	m_tz			= D3DXVECTOR2(1.0f, 0.25f);

}

VOID NGTextureBox::GenerateVertex()
{
	m_vertex[0].p	= D3DXVECTOR4(m_px, m_py, m_Level, 1.0f);
	m_vertex[1].p	= D3DXVECTOR4(m_sx, m_py, m_Level, 1.0f);
	m_vertex[2].p	= D3DXVECTOR4(m_px, m_sy, m_Level, 1.0f);
	m_vertex[3].p	= D3DXVECTOR4(m_sx, m_sy, m_Level, 1.0f);
	m_vertex[0].d	= m_color[0];
	m_vertex[1].d	= m_color[1];
	m_vertex[2].d	= m_color[2];
	m_vertex[3].d	= m_color[3];
	m_vertex[0].t	= m_ts;
	m_vertex[1].t	= D3DXVECTOR2(m_tz.x, m_ts.y);
	m_vertex[2].t	= D3DXVECTOR2(m_ts.x, m_tz.y);
	m_vertex[3].t	= m_tz;
}

VOID NGTextureBox::SetColor(DWORD c0, DWORD c1, DWORD c2, DWORD c3)
{
	m_color[0]	= c0;	
	m_color[1]	= c1;
	m_color[2]	= c2;
	m_color[3]	= c3;
	m_update = true;
}

VOID NGTextureBox::SetColor(DWORD c)
{
	m_color[0]	= c;	
	m_color[1]	= c;
	m_color[2]	= c;
	m_color[3]	= c;
	m_update = true;
}

VOID NGTextureBox::SetLevel(FLOAT l)
{
	m_Level = l;
	m_update = true;
}

VOID NGTextureBox::SetTexture(string)
{
	//rdesc.t0	= id;
	m_update = true;
}

VOID NGTextureBox::Update(BOOL update)
{
	if (update)
		m_update = update;


	UpdateSize();

	
	GenerateVertex();
	m_rdesc.pBuffer->Write(m_vertex, m_rdesc.vStart);
	Renderer()->Add(&m_rdesc);
	
	for (int i=0; i<m_child.Length(); i++)
	{
		m_child[i]->Update(m_update);
	}

	m_update = false;
}

//------------------------------------------------------- Text
NGText::NGText(NGPanel* pnl, INT x, INT y)
{
	NGPANELCREATE	pc;
	pc.dock = DockType.none;
	pc.px	= x;
	pc.py	= y;
	pc.sx	= 256;
	pc.sy	= 64;
	pc.pParent	= pnl;

	m_strFont	= "Angsana New";
	m_dwFontHeight = 20;
	m_res2d		= NULL;

	m_color		= 0xFFFFFFFF;

	m_textBox[0]	= new NGTextureBox(&pc);
	m_textBox[0]->m_ts	= D3DXVECTOR2(0.0f,0.0f);
	m_textBox[0]->m_tz	= D3DXVECTOR2(1.0f, 1.0f);

/*	pc.px	+= 256;
	m_textBox[1]	= new NGTextureBox(&pc);
	
	pc.px	+= 256;
	m_textBox[2]	= new NGTextureBox(&pc);
	pc.px	+= 256;
	m_textBox[3]	= new NGTextureBox(&pc);*/
}

NGText::NGText(NGPanel* pnl, INT x, INT y, string font, DWORD h)
{
	NGPANELCREATE	pc;
	pc.dock = DockType.none;
	pc.px	= x;
	pc.py	= y;
	pc.sx	= 256;
	pc.sy	= 64;
	pc.pParent	= (pnl==NULL)? PanelControl()->GetDesktop() : pnl;

	m_textBox[0]	= new NGTextureBox(&pc);
	pc.px	+= 256;
/*	m_textBox[1]	= new NGTextureBox(&pc);
	pc.px	+= 256;
	m_textBox[2]	= new NGTextureBox(&pc);
	pc.px	+= 256;
	m_textBox[3]	= new NGTextureBox(&pc);*/

	m_strFont	= font;
	m_dwFontHeight = h;
	m_res2d		= NULL;
	m_color		= 0xFFFFFFFF;
}

BOOL NGText::Create(NGRes2d* res2d)
{
	m_res2d	= res2d;

	// Prepare to create a bitmap
    BITMAPINFO bmi;
    ZeroMemory(&bmi.bmiHeader,sizeof(BITMAPINFOHEADER));
    bmi.bmiHeader.biSize        = sizeof(BITMAPINFOHEADER);
    bmi.bmiHeader.biWidth       =  (int)1024;
    bmi.bmiHeader.biHeight      = -(int)64;
    bmi.bmiHeader.biPlanes      = 1;
    bmi.bmiHeader.biCompression = BI_RGB;
    bmi.bmiHeader.biBitCount    = 32;

    // Create a DC and a bitmap for the font
    m_hDC		= CreateCompatibleDC(NULL);
    m_hBitmap	= CreateDIBSection( m_hDC, &bmi, DIB_RGB_COLORS,
                                          (VOID**)&m_pBmpBits, NULL, 0 );
    SetMapMode(m_hDC, MM_TEXT);

	// Create a font.  By specifying ANTIALIASED_QUALITY, we might get an
    // antialiased font, but this is not guaranteed.
    INT nHeight	= -m_dwFontHeight;//-MulDiv( m_dwFontHeight, (INT)(GetDeviceCaps(hDC, LOGPIXELSY) * m_fTextScale), 72 );
    m_hFont		= CreateFont( 32, 0, 0, 0, FW_NORMAL, FALSE,
                          FALSE, FALSE, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS,
                          CLIP_DEFAULT_PRECIS, ANTIALIASED_QUALITY,
                          VARIABLE_PITCH, m_strFont.c_str());
    if (NULL==m_hFont)
        return FALSE;

    SelectObject( m_hDC, m_hBitmap);
    SelectObject( m_hDC, m_hFont);

	INT num = m_res2d->CountTexture();
	char name[32];
	sprintf(name, "text%d", num);

	m_image = new NGIMAGE();
	m_image->surdesc.dwWidth	= 256;
	m_image->surdesc.dwHeight	= 256;
	m_image->surdesc.dwDepth	= 32;
	m_image->surdesc.ddpfPixelFormat.dwRGBBitCount	= 32;
	m_image->name				= name;
	m_image->data	= new BYTE[256*256*4];
	m_image->size	= 256*256*4;

	//memset(m_image->data, 0xff, sizeof(256*256));
	//ZeroMemory(m_image->data, sizeof(m_image->data));

	for (int i=0; i<256*256; i++)
	{
		m_image->data[i*4]	= rand();
		m_image->data[i*4+1]	= rand();
		m_image->data[i*4+2]	= rand();
		m_image->data[i*4+3]	= 0xff;
	}

	m_res2d->Add(m_image);
	
	//ZeroMemory(image->data, sizeof(image->data));

	m_Texname	= name;
	m_TexID		= num;
	m_textBox[0]->GetRenderDesc()->t0	= num;
/*	m_textBox[1]->GetRenderDesc()->t0	= num;
	m_textBox[2]->GetRenderDesc()->t0	= num;
	m_textBox[3]->GetRenderDesc()->t0	= num;*/

	return TRUE;
}

VOID NGText::SetText(string text)
{
	m_text = text;

	if (m_res2d==NULL)
		return;

	Generate();
}

VOID NGText::SetRes2d(NGRes2d* res2d)
{
	if (res2d == NULL)
		return;
	m_res2d	= res2d;
}

VOID NGText::SetColor(DWORD c)
{
	m_textBox[0]->SetColor(c);
/*	m_textBox[1]->SetColor(c);
	m_textBox[2]->SetColor(c);
	m_textBox[3]->SetColor(c);*/
}

BOOL NGText::Generate()
{
    // Set text properties
	SelectObject( m_hDC, m_hBitmap);
    SelectObject( m_hDC, m_hFont);

    SetTextColor( m_hDC, RGB(255, 255, 255) );
    SetBkColor(   m_hDC, 0x00000000);
	//SetBkMode(	  m_hDC, OPAQUE);
    SetTextAlign( m_hDC, TA_TOP );
	//m_text = "HIIIIIIIIIIIII";

	//GetTextExtentPoint32(m_hDC, m_Text.at(0).c_str(), m_Text.at(0).length() , &size);
	
	memset(m_pBmpBits, 0x00000000, 256*256*4);
	ExtTextOut(m_hDC, 0, 0, 0/*ETO_OPAQUE*/, NULL, m_text.c_str(), m_text.length(), NULL);
	BYTE*	pBmp	= (BYTE*)m_pBmpBits;

	DWORD*	p32	= (DWORD*)pBmp;
	DWORD*	pd	= (DWORD*)m_image->data;

	//memset(m_image->data, 0xffffffff, 256*256);

	for (int i=0; i<256*256; i++)
	{
		if (p32[i])
			pd[i]	= 0xffffffff; 
		else
			pd[i]	= 0x00000000;
	}
	//memcpy(m_image->data, pBmp, 256*256*4);

	/*for (int i=0; i<256*256; i++)
	{
		m_image->data[i*4]	= rand();
		m_image->data[i*4+1]	= rand();
		m_image->data[i*4+2]	= rand();
		m_image->data[i*4+3]	= 0xff;
	}*/


/*	for (int i=0; i<64; i++)
		memcpy(&m_image->data[i*256*4], &pBmp[i*1024*4], 256*4);
	
	for (i=64; i<128; i++)
		memcpy(&m_image->data[i*256*4], &pBmp[(i-64)*1024*4+64], 256*4);
	
	for (i=128; i<192; i++)
		memcpy(&m_image->data[i*256*4], &pBmp[(i-128)*1024*4+128], 256*4);
	
	for (i=192; i<256; i++)
		memcpy(&m_image->data[i*256*4], &pBmp[(i-192)*1024*4+192], 256*4);*/

	m_res2d->UpdateTexture(m_TexID);
	


/*
	m_Target->LockRect(&m_d3dlr, &rcClient, 0);

	switch (GetBitDepth(m_desc.Format))
	{
	case 32:
		{
			DWORD*	pBits	= (DWORD*)m_d3dlr.pBits;
			DWORD	pitch	= m_d3dlr.Pitch/4;
			DWORD*	pBmp	= (DWORD*)m_pBmpBits;
			DWORD	bDraw;

			
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
*/

	return TRUE;
}

VOID NGText::Update(BOOL update)
{

}

VOID NGText::AddToBuffer(NGRenderBuffer* rBuffer)
{
	rBuffer->Add2d(m_textBox[0]);		
/*	rBuffer->Add2d(m_textBox[1]);
	rBuffer->Add2d(m_textBox[2]);
	rBuffer->Add2d(m_textBox[3]);*/
}

//-------------------------------------------- Global function
BOOL	CreatePanelCtrl(NGPanelControl*& pc, DWORD sizex, DWORD sizey, DWORD posx, DWORD posy)
{
	pc	= PanelControl()->GetPanelCtrl();
	if (pc!=NULL)
		return false;
	
	pc	= NGPanelControl::CreatePanelCtrl(sizex, sizey, posx, posy);


	return true;
};


BOOL	CreatePanel(NGPANELCREATE* pc, NGPanel*& pnl)
{
	NGPanelControl*	pctrl	= PanelControl()->GetPanelCtrl();

	if (pctrl==NULL)
		return false;

	return true;
};

BOOL	ClosePanel(DWORD handle);
BOOL	ShowPanel(DWORD handle, BOOL show);