#include "ngbuffer.h"
#include "ngmodel.h"
#include "ngframe.h"
#include "ngpanel.h"

//---------------------- NGBuffer
NGBuffer::NGBuffer(DWORD fvf)
{
	m_dwFVF = fvf;
	m_vSize = 0;
	m_iSize	= 0;
	m_iBuffer = 0;
}

BOOL NGBuffer::Add(LPVOID f)
{
	NGFRAME* frame = (NGFRAME*)f;

	if (frame->m_dwFVF!=m_dwFVF)
	{
		throw NGException();	// high damage error
		return FALSE;
	}

	if (m_vSize+frame->m_Vertex.Length()>BUFFER_LIMIT)
		return FALSE;

	if (m_iSize+frame->m_Index.Count()>BUFFER_LIMIT)
		return FALSE;

	if (frame->m_renderDesc.Length()>0)
	{
		throw NGException();	// high damage error
		return FALSE;
	}

	for (int i=0; i<frame->m_Index.index.Length(); i++)
	{
		frame->m_renderDesc.Add(new NGRENDERDESC());
		frame->m_renderDesc.Back()->pBuffer = this;
	}

	m_vSize += frame->m_Vertex.Length();
	m_iSize += frame->m_Index.Count();
	m_iBuffer += frame->m_Index.index.Length();
	m_frames.Add(frame);

	return TRUE;
}

BOOL NGBuffer::Add2D(LPVOID p)
{
	NGTextureBox*	tbox = (NGTextureBox*)p;

	if (m_vSize+4>BUFFER_LIMIT)
		return FALSE;
	
	tbox->GetRenderDesc()->pBuffer	= this;
	tbox->GetRenderDesc()->vStart	= m_vSize;
	m_vSize += 4;	
	m_frames.Add(tbox);

	return TRUE;
}

VOID NGBuffer::Write(NGVB_PRHWDT1* pData, DWORD start)
{
	m_pVB->Lock(0, m_typeVBSize*m_vSize, (BYTE**)&m_pVertex, 0);
	LPVOID	v	= (LPVOID)&m_pVertex.pPRHWDT1[start];
	memcpy( v, pData, m_typeVBSize*4);
	m_pVB->Unlock();
}

BOOL NGBuffer::CreateVertexBuffer()
{
	if (m_frames.Length()==0)
		return true;

	try
	{
		LPBUFFER	data;
		INT			size = 0;
		switch (m_dwFVF)
		{
		case NGFVF_PNT1:
			{
				m_dwFlags = D3DUSAGE_WRITEONLY;
				m_typeVBSize = sizeof(NGVB_PNT1);
				DWORD decs[]=	{	
									D3DVSD_STREAM(0),
									D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
									D3DVSD_END()
								};
				m_pDevice->CreateVertexShader(decs, NULL, &m_Handle, 0);
				data.pPNT1 = new NGVB_PNT1[m_vSize];

				for (int i=0; i<m_frames.Length(); i++)
				{
					NGFRAME*	f = (NGFRAME*)m_frames[i];
					for (int j=0; j<f->m_renderDesc.Length(); j++)
					{
						f->m_renderDesc[j]->vStart	= size;
						f->m_renderDesc[j]->vCount	= f->m_Vertex.Length();
					}
					memcpy(&data.pPNT1[size], f->m_Vertex.First(), f->m_Vertex.Length()*sizeof(NGVB_PNT1));
					size+=f->m_Vertex.Length();
				}
				if (size!=m_vSize)
					throw NGException();
			}
			break;
		case NGFVF_PNT2:
			{
				m_dwFlags = D3DUSAGE_WRITEONLY;
				m_typeVBSize = sizeof(NGVB_PNT2);
				DWORD decs[]=	{	
									D3DVSD_STREAM(0),
									D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
									D3DVSD_REG(D3DVSDE_TEXCOORD1, D3DVSDT_FLOAT2),
									D3DVSD_END()
								};
				m_pDevice->CreateVertexShader(decs, NULL, &m_Handle, 0);
				data.pPNT2 = new NGVB_PNT2[m_vSize];
				for (int i=0; i<m_frames.Length(); i++)
				{
					NGFRAME*	f = (NGFRAME*)m_frames[i];
					for (int j=0; j<f->m_renderDesc.Length(); j++)
					{
						f->m_renderDesc[j]->vStart	= size;
						f->m_renderDesc[j]->vCount	= f->m_Vertex.Length();
					}
					memcpy(&data.pPNT2[size], f->m_Vertex.First(), f->m_Vertex.Length()*sizeof(NGVB_PNT2));
					size+=f->m_Vertex.Length();
				}
				if (size!=m_vSize)
					throw NGException();
			}
			break;
		case NGFVF_PNT1B4:
			{
				m_dwFlags = D3DUSAGE_WRITEONLY | D3DUSAGE_SOFTWAREPROCESSING;
				m_typeVBSize = sizeof(NGVB_PNT1B4);
				DWORD decs[]=	{	
									D3DVSD_STREAM(0),
									D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_BLENDWEIGHT, D3DVSDT_FLOAT4),
									D3DVSD_REG(D3DVSDE_BLENDINDICES, D3DVSDT_UBYTE4),
									D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
									D3DVSD_END()
								};
				m_pDevice->CreateVertexShader(decs, NULL, &m_Handle, 0);
				data.pPNT1B4 = new NGVB_PNT1B4[m_vSize];
				for (int i=0; i<m_frames.Length(); i++)
				{
					NGFRAME*	f = (NGFRAME*)m_frames[i];
					for (int j=0; j<f->m_renderDesc.Length(); j++)
					{
						f->m_renderDesc[j]->vStart	= size;
						f->m_renderDesc[j]->vCount	= f->m_Vertex.Length();
					}
					memcpy(&data.pPNT1B4[size], f->m_Vertex.First(), f->m_Vertex.Length()*sizeof(NGVB_PNT1B4));
					size+=f->m_Vertex.Length();
				}
				if (size!=m_vSize)
					throw NGException();
			}
			break;
		case NGFVF_PNT2B4:
			{
				m_dwFlags = D3DUSAGE_WRITEONLY;
				m_typeVBSize = sizeof(NGVB_PNT2B4);
				DWORD decs[]=	{	
									D3DVSD_STREAM(0),
									D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_BLENDWEIGHT, D3DVSDT_FLOAT4),
									D3DVSD_REG(D3DVSDE_BLENDINDICES, D3DVSDT_UBYTE4),
									D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
									D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
									D3DVSD_REG(D3DVSDE_TEXCOORD1, D3DVSDT_FLOAT2),
									D3DVSD_END()
								};
				m_pDevice->CreateVertexShader(decs, NULL, &m_Handle, 0);
				data.pPNT2B4 = new NGVB_PNT2B4[m_vSize];
				for (int i=0; i<m_frames.Length(); i++)
				{
					NGFRAME*	f = (NGFRAME*)m_frames[i];
					for (int j=0; j<f->m_renderDesc.Length(); j++)
					{
						f->m_renderDesc[j]->vStart	= size;
						f->m_renderDesc[j]->vCount	= f->m_Vertex.Length();
					}
					memcpy(&data.pPNT2B4[size], f->m_Vertex.First(), f->m_Vertex.Length()*sizeof(NGVB_PNT2B4));
					size+=f->m_Vertex.Length();
				}
				if (size!=m_vSize)
					throw NGException();
			}
			break;
		case NGFVF_PRHWDT1:
			{
				m_dwFlags = D3DUSAGE_WRITEONLY | D3DUSAGE_DYNAMIC;
				m_typeVBSize = sizeof(NGVB_PRHWDT1);
				DWORD decs[]=	{	
									D3DVSD_STREAM(0),
									D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT4),
									D3DVSD_REG(D3DVSDE_DIFFUSE, D3DVSDT_D3DCOLOR),
									D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
									D3DVSD_END()
								};
				m_pDevice->CreateVertexShader(decs, NULL, &m_Handle, 0);
				data.pPRHWDT1 = new NGVB_PRHWDT1[m_vSize];
			}
			break;
		}

		if (FAILED(m_pDevice->CreateVertexBuffer(m_vSize*m_typeVBSize, m_dwFlags, m_dwFVF, D3DPOOL_DEFAULT, &m_pVB)))
			throw NGException();
		m_pVB->Lock(0, m_vSize*m_typeVBSize, (BYTE**)&m_pVertex, 0);
		memcpy(m_pVertex.pUnknown, data.pUnknown, m_vSize*m_typeVBSize);
		m_pVB->Unlock();
	}
	catch (NGException)
	{
		throw NGException();
		return FALSE;
	}
	return true;
}
		
BOOL NGBuffer::CreateIndexBuffer()
{
	if (m_dwFVF==NGFVF_PRHWDT1)
		return true;

	if (m_iBuffer<0)
	{
		throw NGException();
		return false;
	}
	if (m_iBuffer==0)
		return true;

	m_ppIB.Reserve(m_iBuffer);
	m_ppIndex.Reserve(m_iBuffer);

	try
	{
		INT ix = 0;
		m_d3dFMT = D3DFMT_INDEX16;
		m_typeIB = 16;
		m_typeIBSize = sizeof(NGFACE);

		for (int i=0; i<m_frames.Length(); i++)
		{
			NGFRAME* f = (NGFRAME*)m_frames[i];
			for (int j=0; j<f->m_Index.index.Length(); j++)
			{
				INT length = f->m_Index.index[j]->face.Length();
				if (length==0)
				{
					f->m_renderDesc[j]->iBuffer = -1;
					f->m_renderDesc[j]->iCount	= length;
					continue;
				}
				if (FAILED(m_pDevice->CreateIndexBuffer(length*m_typeIBSize, 0, 
						D3DFMT_INDEX16, D3DPOOL_DEFAULT, &m_ppIB[ix])))
					throw NGException();
				m_ppIB[ix]->Lock(0, length*m_typeIBSize, (BYTE**)&m_ppIndex[ix], 0);
				memcpy(m_ppIndex[ix].pUnknown, &f->m_Index.index[j]->face.Front(), length*m_typeIBSize);
				m_ppIB[ix]->Unlock();
				f->m_renderDesc[j]->iBuffer = ix;
				f->m_renderDesc[j]->iCount	= length;
				ix++;
			}
		}
	}
	catch(NGException)
	{
		throw NGException();
		return false;
	}
	return true;
}

BOOL NGBuffer::CreateBuffer(NG3D* p3d)
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

	try
	{
		CreateVertexBuffer();
		CreateIndexBuffer();
	}
	catch (NGException)
	{
		throw NGException();
		return false;
	}
	return true;
}

VOID NGBuffer::Render(LPVOID r)
{
	NGRENDERDESC* rdesc = (NGRENDERDESC*)r;
	if (rdesc->pBuffer!=this)
		throw NGException();

	if (rdesc->iBuffer<0)
		return;
	m_pDevice->SetIndices(m_ppIB[rdesc->iBuffer], rdesc->vStart);
	m_pDevice->SetMaterial(rdesc->mtrl);

	m_pDevice->SetTransform(D3DTS_WORLD, rdesc->mat);

	if (FAILED(m_pDevice->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 
									0, rdesc->vCount,
									0, rdesc->iCount)))
		throw NGException();
}

VOID NGBuffer::Render2D(LPVOID r)
{
	NGRENDERDESC* rdesc = (NGRENDERDESC*)r;
	if (rdesc->pBuffer!=this)
		throw NGException();

	if (FAILED(m_pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, rdesc->vStart, 2)))
		throw NGException();
}

BOOL NGBuffer::SetVertexBuffer()
{
	m_pDevice->SetVertexShader(m_Handle);
	m_pDevice->SetStreamSource(0, m_pVB, m_typeVBSize);

	return true;
}

BOOL NGBuffer::SetVertexBuffer2()
{
	m_pDevice->SetVertexShader(D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1);
	m_pDevice->SetStreamSource(0, m_pVB, m_typeVBSize);

	return true;
}

//---------------------- NGRenderBuffer

NGRenderBuffer::NGRenderBuffer()
{
	m_pPNT1.Add(new NGBuffer(NGFT_PNT1));
	m_pPNT2.Add(new NGBuffer(NGFT_PNT2));
	m_pPNT1B4.Add(new NGBuffer(NGFT_PNT1B4));
	m_pPNT2B4.Add(new NGBuffer(NGFT_PNT2B4));
}



BOOL NGRenderBuffer::Add2d(LPVOID t)
{
	NGTextureBox* tb = (NGTextureBox*)t;

	BOOL complete;

	complete = false;

	for (int j=0; j<m_pPRHWDT1.Length(); j++)
	{
		if (m_pPRHWDT1[j]->Add2D(tb))
		{
			complete = true;
			break;	
		}
	}

	if (!complete)
	{
		m_pPRHWDT1.Add(new NGBuffer(NGFT_PRHWDT1));
		if (!m_pPRHWDT1.Back()->Add2D(tb))
		{
			return false;
			throw NGException();
		}
	}

	return true;
}

BOOL NGRenderBuffer::Add(LPVOID mdl)
{
	NGModel* model = (NGModel*)mdl;

	ArrayList<NGFRAME*>	frame = *model->Frame();
	BOOL complete;

	for (int i=0; i<frame.Length(); i++)
	{
		if (!frame[i]->m_bMesh)
			continue;

		complete = false;

		switch (frame[i]->m_Vertex.type)
		{
		case NGFVF_PNT1:
			{
				for (int j=0; j<m_pPNT1.Length(); j++)
				{
					if (m_pPNT1[j]->Add(frame[i]))
					{
						complete = true;
						break;	
					}
				}

				if (!complete)
				{
					m_pPNT1.Add(new NGBuffer(NGFT_PNT1));
					if (!m_pPNT1.Back()->Add(frame[i]))
					{
						return false;
						throw NGException();
					}
				}
			}
			break;
		case NGFVF_PNT2:
			{
				for (int j=0; j<m_pPNT2.Length(); j++)
				{
					if (m_pPNT2[i]->Add(frame[i]))
					{
						complete = true;
						break;	
					}
				}

				if (!complete)
				{
					m_pPNT1.Add(new NGBuffer(NGFT_PNT2));
					if (!m_pPNT2.Back()->Add(frame[i]))
					{
						return false;
						throw NGException();
					}
				}
			}
			break;
		case NGFVF_PNT1B4:
			{
				for (int j=0; j<m_pPNT1B4.Length(); j++)
				{
					if (m_pPNT1B4[j]->Add(frame[i]))
					{
						complete = true;
						break;		
					}
				}

				if (!complete)
				{
					m_pPNT1B4.Add(new NGBuffer(NGFT_PNT1B4));
					if (!m_pPNT1.Back()->Add(frame[i]))
					{
						return false;
						throw NGException();
					}
				}
			}
			break;
		case NGFVF_PNT2B4:
			{
				for (int j=0; j<m_pPNT2B4.Length(); j++)
				{
					if (m_pPNT2B4[j]->Add(frame[i]))
					{
						complete = true;
						break;	
					}
				}

				if (!complete)
				{
					m_pPNT2B4.Add(new NGBuffer(NGFT_PNT2B4));
					if (!m_pPNT2B4.Back()->Add(frame[i]))
					{
						return false;
						throw NGException();
					}
				}
			}
			break;
		}
	}

	return TRUE;
}

BOOL NGRenderBuffer::CreateBuffer(NG3D* p3d)
{
	if (p3d==NULL)
		throw NGException();

	m_p3d = p3d;

	try
	{
		int i;
		for (i=0; i<m_pPNT1.Length(); i++)
			m_pPNT1[i]->CreateBuffer(m_p3d);

		for (i=0; i<m_pPNT2.Length(); i++)
			m_pPNT2[i]->CreateBuffer(m_p3d);

		for (i=0; i<m_pPNT1B4.Length(); i++)
			m_pPNT1B4[i]->CreateBuffer(m_p3d);

		for (i=0; i<m_pPNT2B4.Length(); i++)
			m_pPNT2B4[i]->CreateBuffer(m_p3d);

		for (i=0; i<m_pPRHWDT1.Length(); i++)
			m_pPRHWDT1[i]->CreateBuffer(m_p3d);
	}
	catch (NGException)
	{
		throw NGException();
		return false;
	}

	return true;
}

