#include "ngframe.h"

//--------------------------------------------------------
//	Class : NGMESH										
//	
//		Container of mesh data
//
//--------------------------------------------------------

NGMESH::NGMESH()
{
	m_dwFVF		= D3DFVF_XYZ;
	m_typeVB	= STATIC;
	m_typeIB	= INDEX16;

	m_pVertex	= NULL;
	m_pIndex	= NULL;
	m_pBuffer	= NULL;
}

// for scene class use
DWORD NGMESH::Prepare(NGIBTYPE typeIB)
{
	m_typeIB	= typeIB;
	m_typeVB	= STATIC;
	// Create vertex buffer 
	if (m_Position.empty())
		return TRUE;

	if (!m_Blend.empty())
		m_dwFVF	= D3DFVF_XYZB4 | D3DFVF_LASTBETA_UBYTE4;

	int x = m_Normal.size();
	if (!m_Normal.empty())
		m_dwFVF	|= D3DFVF_NORMAL;

	if (!m_TexCoord.empty())
		m_dwFVF	|= D3DFVF_TEX0;

	if (!FillVertex())
		return FALSE;

	return TRUE;
}

DWORD NGMESH::FillVertex()
{
	DWORD	dwSize	= m_Position.size();
	DWORD	dwIndex	= m_Mtrl.size();
	DWORD	dw;

	if (dwSize==0)
		return FALSE;

	switch(m_dwFVF)
	{
	case NGFVF_PNT1:
		{
			// fill position
			NGVB_PNT1*	pVertex	= new NGVB_PNT1[dwSize];

			dw = m_Normal.size();

			if (m_Normal.size() < dwSize)
				return FALSE;

			dw = m_TexCoord.size();

			if (m_TexCoord.size() < dwSize)
				return FALSE;

			for (int i=0; i<dwSize; i++)
			{
				pVertex[i].pos	= m_Position.at(i);
				pVertex[i].norm	= m_Normal.at(i);
				pVertex[i].tex	= m_TexCoord.at(i);
			}
			m_pVertex	= (LPVOID)pVertex;
		}
		break;
	case NGFVF_PNT1B4:
		{
			// fill position
			NGVB_PNT1B4*	pVertex	= new NGVB_PNT1B4[dwSize];

			if (m_Normal.size() < dwSize)
				return FALSE;

			if (m_TexCoord.size() < dwSize)
				return FALSE;

			if (m_Blend.size() < dwSize)
				return FALSE;

			for (int i=0; i<dwSize; i++)
			{
				pVertex[i].pos	= m_Position.at(i);
				pVertex[i].norm	= m_Normal.at(i);
				pVertex[i].tex	= m_TexCoord.at(i);

				
				DWORD dwBlend	= m_Blend.at(i).size();
				INT		b;

				for (b=0; b<dwBlend; b++)
				{
					pVertex[i].blend.b[b]	= m_Blend.at(i).at(b).fWeight;
					pVertex[i].blend.i[b]	= m_Blend.at(i).at(b).bySkinIndex;
				}
			}
			m_pVertex	= (LPVOID)pVertex;
		}
		break;
	default:
			return FALSE;
	}

	m_renderDesc.dwNumVT	= dwSize;
	m_renderDesc.dwStartVT	= 0;

	dwSize	= m_Index.size();
	if (dwSize==0)
	{
		// Currently, no allow no-index
		m_typeIB	= NOINDEX;
		return FALSE;
	}

	m_renderDesc.dwNumID	= dwSize;

	switch (m_typeIB)
	{
	case INDEX16:
		{
			NGINDEX16*	pIndex	= new NGINDEX16[dwIndex];
			NGFACE16*	pFace16	= new NGFACE16[dwSize];

			NGFACE16	face;
			for (int i=0; i<dwSize; i++)
			{
				face.f1	= (WORD)m_Index.at(i).f1;
				face.f2	= (WORD)m_Index.at(i).f2;
				face.f3	= (WORD)m_Index.at(i).f3;
				pIndex[m_MtrlIndex.at(i)].push_back(face);
			}

			DWORD dwCount		= 0;
			for (i=0; i<dwIndex; i++)
			{
				NGINDEXDESC	idesc;
				idesc.dwStartID	= dwCount;
				idesc.dwNumID	= pIndex[i].size();
				
				m_renderDesc.descID.push_back(idesc);

				for (int j=0; j<pIndex[i].size(); j++)
				{
					pFace16[dwCount]	= pIndex[i].at(j);
					dwCount++;
				}
				pIndex[i].clear();
			}
			m_pIndex	= pFace16;
			delete [] pIndex;
		}
		break;
	case INDEX32:
		{
			// Reserve space for n index
			NGINDEX32*	pIndex	= new NGINDEX32[dwIndex];
			NGFACE32*	pFace32	= new NGFACE32[dwSize];

			for (int i=0; i<dwSize; i++)
			{
				pIndex[m_MtrlIndex.at(i)].push_back(m_Index.at(i));
			}

			DWORD dwCount		= 0;
			for (i=0; i<dwIndex; i++)
			{
				NGINDEXDESC	idesc;
				idesc.dwStartID	= dwCount;
				idesc.dwNumID	= pIndex[i].size();
				
				m_renderDesc.descID.push_back(idesc);

				for (int j=0; j<pIndex[i].size(); j++)
				{
					pFace32[dwCount]	= pIndex[i].at(j);
					dwCount++;
				}
				pIndex[i].clear();
			}
			m_pIndex	= pFace32;
			delete [] pIndex;
		}
		break;
	default:
		return FALSE;
	}
	return TRUE;
}

DWORD	NGMESH::SetRenderDesc(NGRENDERDESC rdesc)
{
	m_renderDesc	= rdesc;
	return TRUE;
}

DWORD	NGMESH::SetRenderBuffer(NGRENDERBUFFER* pRBuff)
{
	if (pRBuff==NULL)
		return FALSE;
	m_pBuffer	= pRBuff;
	return TRUE;
}

DWORD	NGMESH::Render(LPDIRECT3DDEVICE8 device)
{
/*	if (m_pBuffer!=NULL)
	{
		for (int i=0; i<m_renderDesc.descID.size(); i++)
		{
			device->SetMaterial(&m_Mtrl.at(i).MatD3D);
			if (m_Mtrl.at(i).pTexture!=NULL)
				device->SetTexture(0, m_Mtrl.at(i).pTexture->GetTexture());
			else
				device->SetTexture(0, NULL);
			///*m_pBuffer->Render(	&m_renderDesc.descID.at(i),
								m_renderDesc.dwIB,
								m_renderDesc.dwStartVT, 
								m_renderDesc.dwNumVT);*
			m_pBuffer->Render(	m_renderDesc.dwStartVT, m_renderDesc.dwNumVT,
								m_renderDesc.descID.at(i).dwStartID,
								m_renderDesc.descID.at(i).dwNumID);
		}
	}
*/
	return TRUE;
}

DWORD NGMESH::Clear()
{
	m_Index.clear();
	m_Position.clear();		
	m_RHW.clear();			
	m_Normal.clear();
	m_TexCoord.clear();
	m_MtrlIndex.clear();
	m_Blend.clear();
//	m_Mtrl.clear();

	return TRUE;
}

//--------------------------------------------------------
//	Class : NGFRAME
//	
//		Behavior of each mesh 
//
//--------------------------------------------------------

NGMESH* NGFRAME::CreateMesh()
{
	m_pMesh	= new NGMESH();
	return m_pMesh;
}

DWORD	NGFRAME::Prepare(NGIBTYPE typeIB)
{
	if (m_pParent==NULL)
		m_matRender	= m_matTran;
	else
		D3DXMatrixMultiply(&m_matRender, &m_matTran, &m_pParent->m_matRender);

	m_matAnim	= m_matTran;

	if (m_pMesh==NULL)
		return TRUE;

	m_pMesh->Prepare(typeIB);
	return TRUE;
}

DWORD	NGFRAME::SetFrameMatrix(LPDIRECT3DDEVICE8 device)
{
	if (device==NULL)
		return FALSE;

	device->SetTransform(D3DTS_WORLD,&m_matRender);

	return TRUE;
}

DWORD	NGFRAME::SetJointMatrix(LPDIRECT3DDEVICE8 device)
{
	if (device==NULL)
		return FALSE;

	for (int i=0; i<m_Bone.size(); i++)
	{
		device->SetTransform(D3DTS_WORLDMATRIX(i),&m_Bone.at(i).pBone->m_matRender);
		device->MultiplyTransform(D3DTS_WORLDMATRIX(i),&m_Bone.at(i).matOffset);
	}

	return TRUE;
}

DWORD NGFRAME::ClearMesh()
{
	if (m_pMesh==NULL)
		return TRUE;
	m_pMesh->Clear();
	DEL(m_pMesh);
	return TRUE;
}

DWORD NGFRAMEBUFFER::AddFrame(NGFRAME* frame)
{
	if (frame==NULL)
		return FALSE;

	NGMESH*	mesh	= frame->GetMesh();
	if (mesh==NULL)
		return FALSE;

	if (mesh->GetRenderBuffer()==NULL)
		return FALSE;

	NGRENDERDESC*	rdesc	= mesh->GetRenderDesc();
	BOOL bFound;

	for (int i=0; i<rdesc->descID.size(); i++)
	{
		bFound	= FALSE;
		for (int j=0; j<m_fdesc.size(); j++)
		{
			if ((m_fdesc.at(j)->dwVB		= rdesc->dwVB)	&&
				(m_fdesc.at(j)->dwTexture	= rdesc->descID.at(i).dwTexture) &&
				(m_fdesc.at(j)->dwIB		= rdesc->descID.at(i).dwIB)	&&
				(m_fdesc.at(j)->dwMtrl		= rdesc->descID.at(i).dwMtrl))
			{
				m_fdesc.at(j)->frame.push_back(frame);
				m_fdesc.at(j)->numID.push_back(rdesc->descID.at(i).dwNumID);
				bFound	= TRUE;
				break;
			}
		}
		
		if (!bFound)
		{
			NGFRAMEDESC*	fdesc	= new NGFRAMEDESC(	rdesc->dwVB, 
														rdesc->descID.at(i).dwTexture, 
														rdesc->descID.at(i).dwMtrl,
														rdesc->descID.at(i).dwIB);

			fdesc->frame.push_back(frame);
			fdesc->numID.push_back(rdesc->descID.at(i).dwNumID);
			m_fdesc.push_back(fdesc);
		}
	}
	
	return TRUE;
}

NGFRAMEDESC* NGFRAMEBUFFER::GetFrame(DWORD dwVB, DWORD dwTex, DWORD dwIB)
{
	for (int i=0; i<m_fdesc.size(); i++)
	{
		if ((m_fdesc.at(i)->dwVB		= dwVB)	&&
			(m_fdesc.at(i)->dwTexture	= dwTex) &&
			(m_fdesc.at(i)->dwIB		= dwIB))
		{
			return m_fdesc.at(i);
		}
	}
	return NULL;
}

