#include "ngrender.h"
#include "ngmodel.h"

NGRENDERBUFFER::NGRENDERBUFFER()
{
	m_bRender	= FALSE;
	m_Handle	= 0;
	m_dwFVF		= 0;
	m_typeIB	= 0;
}

DWORD NGRENDERBUFFER::Create(DWORD dwFVF, DWORD typeIB)
{
	m_dwFVF		= dwFVF;
	m_typeIB	= typeIB;
	return TRUE;
}

DWORD NGRENDERBUFFER::AddMesh(LPVOID pArg)
{
	if (m_bRender)
		return FALSE;

	NGMESH*	mesh = (NGMESH*)pArg;

	if (mesh==NULL)
		return FALSE;

	if (mesh->GetFVF()!=m_dwFVF)
		return FALSE;

	
	NGRENDERDESC	rdesc	= *mesh->GetRenderDesc();

	DWORD	sizeVB;
	DWORD	sizeIB;

	

	switch (m_dwFVF)
	{
	case NGFVF_PNT1:
		{
			sizeVB	= m_PNT1.size();
			
			if ((sizeVB==0)&&(m_Vertex.size()==0))
				m_Vertex.push_back(sizeVB);
			if ((sizeVB + rdesc.dwNumVT) > MAX_BUFFERSIZE)
				m_Vertex.push_back(sizeVB);		// Add index to dedicate create new buffer

			// copy data
			for (int i=0; i<rdesc.dwNumVT; i++)
			{
				NGVB_PNT1*	pVertex	= (NGVB_PNT1*)mesh->GetVertex();
				m_PNT1.push_back(pVertex[i]);
			}
	
			if (m_Vertex.size()>1)
				rdesc.dwStartVT	= sizeVB - m_Vertex.back();
			else
				rdesc.dwStartVT	= sizeVB;	
			rdesc.dwVB		= m_Vertex.size()-1;
		}
		break;

	case NGFVF_PNT1B4:
		{
			sizeVB	= m_PNT1B4.size();
			
			if ((sizeVB==0)&&(m_Vertex.size()==0))
				m_Vertex.push_back(sizeVB);
			if ((sizeVB + rdesc.dwNumVT) > MAX_BUFFERSIZE)
				m_Vertex.push_back(sizeVB);		// Add index to dedicate create new buffer

			// copy data
			for (int i=0; i<rdesc.dwNumVT; i++)
			{
				NGVB_PNT1B4*	pVertex	= (NGVB_PNT1B4*)mesh->GetVertex();
				m_PNT1B4.push_back(pVertex[i]);
				
				/*for (int x=0; x<4; x++)
				{
					if (m_PNT1B4.at(i).blend.b[x]	> 0.0f)
						m_PNT1B4.at(i).blend.i[x]++;
				}*/
			}
	
			if (m_Vertex.size()>1)
				rdesc.dwStartVT	= sizeVB - m_Vertex.back();
			else
				rdesc.dwStartVT	= sizeVB;	
			rdesc.dwVB		= m_Vertex.size()-1;
		}
		break;
/*
	case NGFVF_PNT1B4:
		{
			sizeVB	= m_PNT1B4.size();
			if ((sizeVB + rdesc.dwNumVT) > MAX_BUFFERSIZE)
				return 2; // vertex buffer overflow

			for (int i=0; i<rdesc.dwNumVT; i++)
			{
				NGVB_PNT1B4*	pVertex	= (NGVB_PNT1B4*)mesh->GetVertex();
				m_PNT1B4.push_back(pVertex[i]);
			}

			rdesc.dwStartVT	= sizeVB;
		}
		break;

	case NGFVF_2DVERTEX:
		{
			sizeVB	= m_PNT1.size();
			if ((sizeVB + rdesc.dwNumVT) > MAX_BUFFERSIZE)
				return 2; // vertex buffer overflow

			for (int i=0; i<rdesc.dwNumVT; i++)
			{
				NG2DVERTEX*	pVertex	= (NG2DVERTEX*)mesh->GetVertex();
				m_2DVERTEX.push_back(pVertex[i]);
			}

			rdesc.dwStartVT	= sizeVB;
		}
		break;*/
	default:
		return FALSE;
	}

	sizeIB	= mesh->m_Index.size();
	switch (m_typeIB)
	{
	case INDEX16:
		{
			rdesc.dwNumIB	= rdesc.descID.size();
			NGFACE16*	F16	= (NGFACE16*)mesh->GetIndex();
			DWORD		c	= 0;

			for (int i=0; i<rdesc.descID.size(); i++)
			{
				rdesc.descID.at(i).dwIB		= m_Index.size();
				rdesc.descID.at(i).dwMtrl	= i;
				for (int j=0; j<rdesc.descID.at(i).dwNumID; j++)
					m_Face16.push_back(F16[j+c]);
				m_Index.push_back(m_Face16.size());
				c+=rdesc.descID.at(i).dwNumID;				
			}
		}
		break;
/*	case INDEX32:
		{
			m_Index.push_back(m_Face32.size());
			rdesc.dwIB	= m_Index.size()-1;
			NGFACE32*	F32	= (NGFACE32*)mesh->GetIndex();

			for (int i=0; i<rdesc.descID.size(); i++)
			{
				DWORD	nIndex	= 0;
				for (int j=0; j<rdesc.descID.at(i).dwNumID; j++)
				{
					m_Face32.push_back(F32[nIndex]);
					nIndex++;
				}
			}
		}
		break;*/
	}

	mesh->SetRenderBuffer(this);
	mesh->SetRenderDesc(rdesc);

	return TRUE;
}

DWORD NGRENDERBUFFER::Prepare(NG3D* p3d)
{
	if (m_bRender)
		return FALSE;

	if (p3d==NULL)
		return FALSE;

	if (p3d->GetDevice()==NULL)
		return FALSE;

	m_p3d		= p3d;
	m_pDevice	= p3d->GetDevice();

	CreateBuffer();

	return TRUE;
}


DWORD NGRENDERBUFFER::CreateBuffer()
{
	m_bRender	= TRUE;

	LPVOID	pVertex;
	LPVOID	pIndex;

	switch (m_typeIB)
	{
	case INDEX16:
		{
			m_dwNumIndex	= m_Face16.size();
			m_typeIBSize	= sizeof(NGFACE16);
			m_d3dFMT		= D3DFMT_INDEX16;
		}
		break;
	case INDEX32:
		{
			m_dwNumIndex	= m_Face32.size();
			m_typeIBSize	= sizeof(NGFACE32);
			m_d3dFMT		= D3DFMT_INDEX32;
		}
		break;
	default:
		return FALSE;
	}

	switch (m_dwFVF)
	{
	case NGFVF_PNT1:
		{
			m_typeVBSize	= sizeof(NGVB_PNT1);
			m_dwNumVertex	= m_PNT1.size();
			//pVertex		= &m_PNT1.front();//&m_PNT1.at(0);

			DWORD decs[]=	{	
								D3DVSD_STREAM(0),
								D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
								D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
								D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
								D3DVSD_END()
							};
			m_pDevice->CreateVertexShader( decs, NULL, &m_Handle, 0);
		}
		break;
	case NGFVF_PNT1B4:
		{
			m_typeVBSize	= sizeof(NGVB_PNT1B4);
			m_dwNumVertex	= m_PNT1B4.size();
			//pVertex		= &m_PNT1B4.at(0);

			DWORD decs[]=	{	
								D3DVSD_STREAM(0),
								D3DVSD_REG(D3DVSDE_POSITION, D3DVSDT_FLOAT3),
								D3DVSD_REG(D3DVSDE_BLENDWEIGHT, D3DVSDT_FLOAT4),
								D3DVSD_REG(D3DVSDE_BLENDINDICES, D3DVSDT_UBYTE4),
								D3DVSD_REG(D3DVSDE_NORMAL, D3DVSDT_FLOAT3),
								D3DVSD_REG(D3DVSDE_TEXCOORD0, D3DVSDT_FLOAT2),
								D3DVSD_END()
							};
			m_pDevice->CreateVertexShader( decs, NULL, &m_Handle, 0);
		}
		break;
	default:
		return FALSE;
	}
/*
	if (FAILED(m_pDevice->CreateVertexBuffer(	m_dwNumVertex*m_typeVBSize,
												D3DUSAGE_WRITEONLY, m_dwFVF, 
												D3DPOOL_MANAGED, &m_lpVB)))
			return FALSE;
		
	m_lpVB->Lock(0, m_dwNumVertex*m_typeVBSize ,(BYTE**)&m_pVertex,0);
	memcpy((void*)m_pVertex, (void*)pVertex, m_dwNumVertex*m_typeVBSize);
	m_lpVB->Unlock();
*/
	for (int i=0; i<m_Vertex.size(); i++)
	{
		DWORD	dwSize;
		DWORD	dwStart;

		if (m_Vertex.size()==(i+1))
		{
			dwStart	= 0;
			dwSize	= m_dwNumVertex - m_Vertex.at(i);
		}
		else
		{
			dwStart = m_Vertex.at(i);
			dwSize	= m_Vertex.at(i+1) - m_Vertex.at(i);
		}
		/*if (i==m_Vertex.size()-1)
			dwSize	= m_dwNumIndex - m_Index.at(i);
		else
			dwSize	= m_Index.at(i+1) - m_Index.at(i);*/

		LPDIRECT3DVERTEXBUFFER8	lpVB;
	 	LPVOID					pData;
		DWORD					flag	= D3DUSAGE_WRITEONLY;
		switch (m_dwFVF)
		{
		case NGFVF_PNT1:
			pVertex	= &m_PNT1.at(dwStart);
			break;
		case NGFVF_PNT1B4:
			pVertex	= &m_PNT1B4.at(dwStart);
			flag	|= D3DUSAGE_SOFTWAREPROCESSING;
			break;
		default:
			return FALSE;
		}

		if (FAILED(m_pDevice->CreateVertexBuffer(	dwSize*m_typeVBSize,
													//D3DUSAGE_WRITEONLY, m_dwFVF, 
													flag, m_dwFVF, 
													D3DPOOL_MANAGED, &lpVB)))
			return FALSE;
		
		lpVB->Lock(0, dwSize*m_typeVBSize ,(BYTE**)&pData,0);
		memcpy((void*)pData, (void*)pVertex, dwSize*m_typeVBSize);
		lpVB->Unlock();

		m_ppVB.push_back(lpVB);
		m_ppVertex.push_back(pData);
	}

	for (i=0; i<m_Index.size(); i++)
	{
		DWORD	dwSize;
		DWORD	dwStart;

		if (i==0)
		{
			dwStart	= 0;
			dwSize	= m_Index.at(i);
		}
		else
		{
			dwStart = m_Index.at(i-1);
			dwSize	= m_Index.at(i) - m_Index.at(i-1);
		}
		/*
		DWORD	dwSize;
		if (i==m_Index.size()-1)
			dwSize	= m_dwNumIndex - m_Index.at(i);
		else
			dwSize	= m_Index.at(i+1) - m_Index.at(i);
*/
		LPDIRECT3DINDEXBUFFER8	lpIB;
		LPVOID					pData;
		switch (m_typeIB)
		{
		case INDEX16:
				pIndex	= &m_Face16.at(dwStart);
			break;
		case INDEX32:
				pIndex	= &m_Face32.at(dwStart);
			break;
		}

		if (FAILED(m_pDevice->CreateIndexBuffer(dwSize*m_typeIBSize,
												D3DUSAGE_WRITEONLY, m_d3dFMT, 
												D3DPOOL_MANAGED, &lpIB)))
			return FALSE;
		
		lpIB->Lock(0, dwSize*m_typeIBSize, (BYTE**)&pData, 0);	
		memcpy((void*)pData, (void*)pIndex, dwSize*m_typeIBSize);
		lpIB->Unlock();

		m_ppIB.push_back(lpIB);
		m_ppIndex.push_back(pData);
	}

	m_PNT1.clear();
	m_PNT1B4.clear();
	m_2DVERTEX.clear();

	m_Face16.clear();
	m_Face32.clear();
	
	return TRUE;
}

DWORD NGRENDERBUFFER::SetBuffer()
{
	m_pDevice->SetVertexShader(m_Handle);
//	m_pDevice->SetStreamSource(0, m_lpVB, m_typeVBSize);

	return TRUE;
}

/*
DWORD NGRENDERBUFFER::Render(NGINDEXDESC* idesc, DWORD nIB, DWORD minVertex, DWORD numVertex)
{
	if (idesc==NULL)
		return FALSE;

	m_pDevice->SetIndices(m_ppIB.at(nIB), minVertex);
	m_pDevice->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, numVertex, 
									idesc->dwStartID, idesc->dwNumID);
	return TRUE;
}
*/

DWORD NGRENDERBUFFER::SetVB(DWORD dwVB)
{
	if (dwVB>m_ppVB.size()-1)
		return FALSE;

	m_pDevice->SetVertexShader(m_Handle);
	if (FAILED(m_pDevice->SetStreamSource(0, m_ppVB.at(dwVB), m_typeVBSize)))
		return FALSE;

	return TRUE;
}

DWORD NGRENDERBUFFER::SetIB(DWORD dwIB, DWORD min)
{
	if (dwIB>m_ppIB.size()-1)
		return FALSE;

	if (FAILED(m_pDevice->SetIndices(m_ppIB.at(dwIB), min)))
		return FALSE;

	return TRUE;
}

DWORD NGRENDERBUFFER::Render(DWORD minVertex, DWORD numVertex, DWORD minIndex, DWORD numIndex)
{
	if (FAILED(m_pDevice->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, minVertex, numVertex, 
									minIndex, numIndex)))
		return FALSE;
	return TRUE;
}

DWORD NGRENDERBUFFER::Optimize()
{
	// Optimize for FIFO vertex cache that can store up to 10 vertex

	return TRUE;
}