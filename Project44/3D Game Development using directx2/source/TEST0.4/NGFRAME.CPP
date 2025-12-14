#include "ngframe.h"

VOID NGVERTEX::Create(DWORD t)
{
	if (type!=0)
		return;

	type = t;
	
	switch(type)
	{
	case NGFVF_PNT1:
		size = sizeof(NGVB_PNT1);
		vertex.pPNT1	= new vector<NGVB_PNT1>;
		break;
	case NGFVF_PNT2:
		size = sizeof(NGVB_PNT2);
		vertex.pPNT2	= new vector<NGVB_PNT2>;
		break;
	case NGFVF_PNT1B4:
		size = sizeof(NGVB_PNT1B4);
		vertex.pPNT1B4	= new vector<NGVB_PNT1B4>;
		break;
	case NGFVF_PNT2B4:
		size = sizeof(NGVB_PNT2B4);
		vertex.pPNT2B4	= new vector<NGVB_PNT2B4>;
		break;
	}
}

BOOL NGVERTEX::Reserve(DWORD s)
{
	switch(type)
	{
	case 0:
		{
			return FALSE;
		}
		break;
	case NGFVF_PNT1:
		{
			vertex.pPNT1->resize(s);
			length = s;
		}
		break;
	case NGFVF_PNT2:
		{
			vertex.pPNT2->resize(s);
			length = s;
		}
		break;
	case NGFVF_PNT1B4:
		{
			vertex.pPNT1B4->resize(s);
			length = s;
		}
		break;
	case NGFVF_PNT2B4:
		{
			vertex.pPNT2B4->resize(s);
			length = s;
		}
		break;
	}

	return true;
}

BOOL NGVERTEX::Add(NGVB_PNT1 v)
{
	if (type==NGFVF_PNT1)
	{
		vertex.pPNT1->push_back(v);
		first = (LPVOID)&vertex.pPNT1->front();
		length = vertex.pPNT1->size();
		return TRUE;
	}
	return FALSE;
}

BOOL NGVERTEX::Add(NGVB_PNT2 v)
{
	if (type==NGFVF_PNT2)
	{
		vertex.pPNT2->push_back(v);
		first = (LPVOID)&vertex.pPNT2->front();
		length = vertex.pPNT2->size();
		return TRUE;
	}
	return FALSE;
}

BOOL NGVERTEX::Add(NGVB_PNT1B4 v)
{
	if (type==NGFVF_PNT1B4)
	{
		vertex.pPNT1B4->push_back(v);
		first = (LPVOID)&vertex.pPNT1B4->at(0);
		length = vertex.pPNT1B4->size();
		return TRUE;
	}
	return FALSE;
}

BOOL NGVERTEX::Add(NGVB_PNT2B4 v)
{
	if (type==NGFVF_PNT2B4)
	{
		vertex.pPNT2B4->push_back(v);
		first = (LPVOID)&vertex.pPNT2B4->front();
		length = vertex.pPNT2B4->size();
		return TRUE;
	}
	return FALSE;
}

INT NGINDEX::Count()
{
	INT c = 0;
	for (int i=0; i<index.Length(); i++)
		c += index[i]->face.Length();
	return c;
}

NGFRAMEX* NGFRAME::ToFrameX()
{
	NGFRAMEX* fx = new NGFRAMEX();
	int i;

	fx->m_bMesh		= m_bMesh;
	fx->m_bRender	= m_bRender;
	fx->m_dwFVF		= m_dwFVF;
	fx->m_strName	= m_strName;
	fx->m_matTran	= m_matTran;
	fx->m_fdesc		= m_fdesc;
	
	fx->m_jIndex.Reserve(m_jIndex.Length());
	fx->m_joint.Reserve(m_joint.Length());
	fx->m_jOffset.Reserve(m_jOffset.Length());
	for (i=0; i<m_jIndex.Length(); i++)
	{
		fx->m_jIndex[i]		= m_jIndex[i];
		fx->m_jOffset[i]	= m_jOffset[i];
	}

	fx->m_cIndex.Reserve(m_cIndex.Length());
	for (i=0; i<m_cIndex.Length(); i++)
		fx->m_cIndex[i]		= m_cIndex[i];

	fx->m_renderDesc.Reserve(m_renderDesc.Length());
	for (i=0; i<m_renderDesc.Length(); i++)
	{
		fx->m_renderDesc[i] = new NGRENDERDESC();
		fx->m_renderDesc[i]->pBuffer	= m_renderDesc[i]->pBuffer;
		fx->m_renderDesc[i]->vStart		= m_renderDesc[i]->vStart;
		fx->m_renderDesc[i]->vCount		= m_renderDesc[i]->vCount;
		fx->m_renderDesc[i]->iBuffer	= m_renderDesc[i]->iBuffer;
		fx->m_renderDesc[i]->iStart		= m_renderDesc[i]->iStart;
		fx->m_renderDesc[i]->iCount		= m_renderDesc[i]->iCount;
		fx->m_renderDesc[i]->iMtrl		= m_renderDesc[i]->iMtrl;
		fx->m_renderDesc[i]->blend		= m_fdesc.numBlend;
		fx->m_renderDesc[i]->t0			= m_renderDesc[i]->t0;
		fx->m_renderDesc[i]->t1			= m_renderDesc[i]->t1;
	}

	fx->m_pindex		= m_pindex;

	return fx;
}

VOID NGFRAMEX::UpdateFrame(D3DXMATRIX* mat)
{
/*	if (m_parent==NULL)
	{
		m_matRender	= m_matAnime;
	}
	else
	{*/
		//D3DXMatrixMultiply(&m_matRender,&m_matAnime,mat);
		//D3DXMatrixMultiply(&m_matAnime,&m_matAnime,&m_matTran);
		D3DXMATRIX matCombine	= *mat;
		D3DXMATRIX matI;
		D3DXMatrixIdentity(&matI);

		D3DXMatrixMultiply(&matCombine, &m_matAnime, mat);
		D3DXMatrixMultiply(&m_matRender, &matCombine, &matI);
		//D3DXMatrixMultiply(&m_matRender, &m_matAnime, mat);

		//m_matRender = matCombine;
		//D3DXMatrixIdentity(&m_matAnime);
		//D3DXMatrixMultiply(&matCombine, &m_matAnime, mat);
		//D3DXMatrixMultiply(&m_matRender, &matCombine, &m_matTran);
		//D3DXMatrixMultip
		//D3DXMatrixMultiply(&m_matRender, &matCombine, &m_matAnime);
		//m_matRender	= m_matTran;
		//D3DXMatrixMultiply(&m_matRender,&m_matAnime,&m_parent->m_matRender);
	//}

	for (int i=0; i<m_child.Length(); i++)
	{
		m_child[i]->UpdateFrame(&m_matRender);
	}
}
