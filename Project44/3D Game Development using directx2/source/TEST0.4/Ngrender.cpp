#include "ngrender.h"

NGRenderer* NGRenderer::m_this	= NULL;

int compare2(const void* arg1,const void* arg2)
{
	NGRENDERDESC** a1 = (NGRENDERDESC**)arg1;
	NGRENDERDESC** a2 = (NGRENDERDESC**)arg2;
	NGRENDERDESC*  r1 = *a1;
	NGRENDERDESC*  r2 = *a2;

	if ((DWORD)r1->pBuffer > (DWORD)r2->pBuffer) return -1;
	if ((DWORD)r1->pBuffer < (DWORD)r2->pBuffer) return +1;
	if (r1->t0 > r2->t0) return -1;
	if (r1->t0 < r2->t0) return +1;
	if (r1->t1 > r2->t1) return -1;
	if (r1->t1 < r2->t1) return +1;

	/*
	if (p1->Format > p2->Format)	return -1;
	if (p1->Format < p2->Format)	return +1;
	if (p1->Width  < p2->Width)		return -1;
	if (p1->Width  > p2->Width)		return +1;
	if (p1->Height < p2->Height)	return -1;
	if (p1->Height > p2->Height)	return +1;
	*/
	
	return 0;
}

BOOL NGRenderer::Clear()
{
	m_index = 0;
	m_index2 = 0;
	return true;
}

BOOL NGRenderer::Add(NGRENDERDESC* rdesc)
{
	//m_rdesc.Add(rdesc);

	if (rdesc->pBuffer->GetFVF()==NGFVF_PRHWDT1)
	{
		m_tbdesc[m_index2] = rdesc;
		m_index2++;
	}
	else
	{
		m_rdesc[m_index] = rdesc;
		m_index++;
	}
	return true;
}

BOOL NGRenderer::Sort()
{
	qsort((void*)m_rdesc, (size_t)m_index, sizeof(NGRENDERDESC*), compare2);
	return true;
}

BOOL NGRenderer::Render()
{
	if (m_p3d==NULL)
		throw NGException();

	m_pDevice->BeginScene();

	for (int i=0; i<m_index; i++)
	{
		// Vertex buffer
		if ((i==0)||(m_curBuffer!=m_rdesc[i]->pBuffer))
		{
			m_curBuffer = m_rdesc[i]->pBuffer;
			m_rdesc[i]->pBuffer->SetVertexBuffer();
		}

		// Texture
		if (m_curTex0!=m_rdesc[i]->t0)
		{		
			m_curTex0 = m_rdesc[i]->t0;
			if ((m_curTex0<0)||(m_curTex0>m_Size2d))
				m_pDevice->SetTexture(0, NULL);
			else
				m_pDevice->SetTexture(0, m_res2d->GetTexture(m_curTex0));
		}
		if (m_curTex1!=m_rdesc[i]->t1)
		{
			m_curTex1 = m_rdesc[i]->t1;
			if ((m_curTex1<0)||(m_curTex1>m_Size2d))
				m_pDevice->SetTexture(1, NULL);
			else 
				m_pDevice->SetTexture(1, m_res2d->GetTexture(m_curTex1));
		}

		if ((i==0)||(m_dwFVF!=m_curBuffer->GetFVF()))
		{
			m_dwFVF	= m_curBuffer->GetFVF();
			if ((m_dwFVF==NGFVF_PNT1B4)||(m_dwFVF==NGFVF_PNT2B4))
			{
				m_pDevice->SetRenderState( D3DRS_SOFTWAREVERTEXPROCESSING,TRUE);
				m_pDevice->SetRenderState( D3DRS_INDEXEDVERTEXBLENDENABLE, TRUE);
				m_pDevice->SetRenderState( D3DRS_VERTEXBLEND, /*m_rdesc[i]->blend-1*/1);
			}
			else
			{
				m_pDevice->SetRenderState( D3DRS_SOFTWAREVERTEXPROCESSING, FALSE);
				m_pDevice->SetRenderState( D3DRS_INDEXEDVERTEXBLENDENABLE, FALSE);
				m_pDevice->SetRenderState( D3DRS_VERTEXBLEND, 0);
			}
		}
		
		if ((m_dwFVF==NGFVF_PNT1B4)||(m_dwFVF==NGFVF_PNT2B4))
		{
			for (int j=0; j<(*m_rdesc[i]->joint).Length(); j++)
			{	
				m_pDevice->SetTransform(D3DTS_WORLDMATRIX(j+1), &(*m_rdesc[i]->joint)[j]->m_matRender);
				m_pDevice->MultiplyTransform(D3DTS_WORLDMATRIX(j+1), &(*m_rdesc[i]->jOffset)[j]);
			}
		}
		
		m_rdesc[i]->pBuffer->Render(m_rdesc[i]);
	}	

	for (i=0; i<m_index2; i++)
	{
		if ((i==0)||(m_curBuffer!=m_rdesc[i]->pBuffer))
		{
			m_curBuffer = m_tbdesc[i]->pBuffer;
			m_tbdesc[i]->pBuffer->SetVertexBuffer2();
		}

		// Texture
		if (m_curTex0!=m_tbdesc[i]->t0)
		{
			m_curTex0 = m_tbdesc[i]->t0;
			if (m_curTex0<0)
				m_pDevice->SetTexture(0, NULL);
			else
				m_pDevice->SetTexture(0, m_res2d->GetTexture(m_curTex0));
		}
		if (m_curTex1!=m_tbdesc[i]->t1)
		{
			m_curTex1 = m_tbdesc[i]->t1;
			if (m_curTex1<0)
				m_pDevice->SetTexture(1, NULL);
			else 
				m_pDevice->SetTexture(1, m_res2d->GetTexture(m_curTex1));
		}

		m_tbdesc[i]->pBuffer->Render2D(m_tbdesc[i]);
	}

	m_pDevice->EndScene();
	Clear();
	return true;
}

NGRenderer* NGRenderer::Initial(NG3D* p3d)
{
	m_p3d = p3d;
	m_pDevice = p3d->GetDevice();

	if (m_pDevice==NULL)
	{
		throw NGException();
		return FALSE;
	}

	return m_this;
}

VOID NGRenderer::SetRes2d(NGRes2d* r2d)
{
	if (r2d==NULL)
		throw NGException();

	m_res2d		= r2d;
	m_Size2d	= r2d->CountTexture();
}


NGRenderer* NGRenderer::CreateRenderer(NG3D* p3d)
{
	if (p3d==NULL)
	{
		throw NGException();
		return FALSE;
	}

	if (m_this!=NULL)
		return m_this;

	new NGRenderer();

	return Renderer()->Initial(p3d);
}