#include "stdafx.h"
#include "ngmodel.h"
//#include "ngfile.h"

//--------------------------------------------------------
//	Class : NGMODEL
//	
//		Model behavior
//
//--------------------------------------------------------

BOOL NGMODEL::Create(NGFRAME* root, NGANIME* anime)
{
	if (root==NULL)
		return FALSE;
	m_pRoot	= root;

	if (anime!=NULL)
		m_pAnime.push_back(anime);
	
	return TRUE;
}

BOOL NGMODEL::Traverse(NGFRAME* frame)
{
	if (frame==NULL)
		return TRUE;
	
	m_pFrame.push_back(frame);

	if (frame->m_pChild.empty())
		return TRUE;

	for (int i=0; i<frame->m_pChild.size(); i++)
		Traverse(frame->m_pChild.at(i));

	return TRUE;
};

DWORD NGMODEL::AddAnime(NGANIME* anime)
{
	char	buffer[20];
	sprintf( buffer, "Untitled%d%3", m_pAnime.size()+1);
	anime->m_strName	= buffer;
	m_pAnime.push_back(anime);
	m_pAnime.back()->FindLength();
	return TRUE;
}

BOOL NGMODEL::Prepare(NGIBTYPE typeIB)
{
	if (m_pRoot	== NULL)
		return FALSE;

	// Initial matrix
	D3DXMatrixIdentity(&m_matModel);

	// Traverse NGFRAME tree and make list of them
	Traverse(m_pRoot);

	// Initialize
	for (int i=0; i<m_pFrame.size(); i++)
	{
		if (!m_pFrame.at(i)->Prepare(typeIB))
			return FALSE;
	}

	// Find Bone
	for (i=0; i<m_pFrame.size(); i++)
	{
		for (int j=0; j<m_pFrame.at(i)->m_Bone.size(); j++)
		{
			for (int k=0; k<m_pFrame.size(); k++)
			{
				if (m_pFrame.at(k)->m_strName == m_pFrame.at(i)->m_Bone.at(j).strName)
				{
					m_pFrame.at(i)->m_Bone.at(j).pBone	= m_pFrame.at(k);
					break;
				}
			}
		}
	}

	// Link anime
	for (i=0; i<m_pAnime.size(); i++)
	{
		for (int j=0; j<m_pAnime.at(i)->GetAnimList()->size(); j++)
		{
			for (int k=0; k<m_pFrame.size(); k++)
			{
				if (m_pAnime.at(i)->GetAnimList()->at(j)->strFrame==m_pFrame.at(k)->m_strName)
				{
					m_pAnime.at(i)->GetAnimList()->at(j)->frame	= m_pFrame.at(k);
					break;
				}
			}
		}
	}

		// Link Collide
	for (i=0; i<m_pCollide.size(); i++)
	{
		if (m_pCollide.at(i)->m_FrameID	== 0)
			m_pCollide.at(i)->SetParent(&m_matModel);
		else
			m_pCollide.at(i)->SetParent(&m_pFrame.at(m_pCollide.at(i)->m_FrameID)->m_matRender);
	}

	return TRUE;
}

DWORD	NGMODEL::PlayAnime(	DWORD index,	BOOL play,	DWORD factor,	
							BOOL reset,		BOOL  loop,	FLOAT time)
{
	if (m_pAnime.size()<=index)
		return FALSE;
	if (m_pAnime.at(index)->m_playAnime->bPlay != play)
		m_pAnime.at(index)->m_playAnime->fTime		= time;

	m_pAnime.at(index)->m_playAnime->bPlay		= play;
	m_pAnime.at(index)->m_playAnime->dwFactor	= factor;
	m_pAnime.at(index)->m_playAnime->bReset		= reset;
	m_pAnime.at(index)->m_playAnime->bLoop		= loop;
	return TRUE;
};
/*
DWORD	NGMODEL::PlayAnime(	char* name,		BOOL play,	DWORD factor,	
							BOOL reset,		BOOL  loop,	FLOAT time)
{

	return TRUE;
};
*/
DWORD	NGMODEL::UpdateAnime(FLOAT inputtime)
{
	for (int i=0; i<m_pAnime.size(); i++)
	{
		m_pAnime.at(i)->Update(inputtime);
	}

	return TRUE;
};

DWORD NGMODEL::Reset()
{
	ResetMatrix(m_pRoot);
	return TRUE;
}

DWORD NGMODEL::ResetMatrix(NGFRAME* frame)
{
	if (frame==NULL)
		return TRUE;

	frame->m_matAnim	= frame->m_matTran;

	if (frame->m_pChild.empty())
		return TRUE;

	for (int i=0; i<frame->m_pChild.size(); i++)
		ResetMatrix(frame->m_pChild.at(i));

	return TRUE;
}

DWORD NGMODEL::UpdateMatrix(NGFRAME* frame)
{
	if (frame==NULL)
		return TRUE;

	// Update matrix
	if (frame->m_pParent==NULL)
		D3DXMatrixMultiply(	&frame->m_matRender, &frame->m_matAnim, 
							&m_matModel);
	else
		D3DXMatrixMultiply(	&frame->m_matRender, &frame->m_matAnim, 
							&frame->m_pParent->m_matRender);

	if (frame->m_pChild.empty())
		return TRUE;

	for (int i=0; i<frame->m_pChild.size(); i++)
		UpdateMatrix(frame->m_pChild.at(i));

	return TRUE;
}

DWORD NGMODEL::SetModelPos(D3DXVECTOR3 vec)
{
	D3DXMatrixTranslation( &m_matModel, vec.x, vec.y, vec.z);
	//D3DXMatrixMultiply(&m_pRoot->m_matAnim, &m_pRoot->m_matAnim, &m_matModel);
	return TRUE;
};

DWORD NGMODEL::Update(FLOAT time)
{
	UpdateAnime(time);
	UpdateMatrix(m_pRoot);

	return TRUE;
}

DWORD NGMODEL::CopyFrame(NGFRAME* parent)
{
	return TRUE;
}

NGANIME* NGMODEL::CopyAnime()
{
	return NULL;
}

NGMODEL* NGMODEL::Cone()
{
	return NULL;
}

DWORD NGMODEL::AddCollide(NGCOLLIDE* collide)
{
	if (collide==NULL)
		return FALSE;
	m_pCollide.push_back(collide);
	return TRUE;
}

DWORD NGMODEL::Visible(BOOL bVisible)
{
	m_bVisible	= bVisible;

	for (int i=0; i<m_pFrame.size(); i++)
	{
		m_pFrame.at(i)->m_bVisible	= bVisible;
	};

	return TRUE;
}

BOOL NGMODEL::IsPlaying()
{
	for (int i=0; i<m_pAnime.size(); i++)
	{
		if (m_pAnime.at(i)->m_playAnime)
			return TRUE;
	}

	return FALSE;
}

VOID NGMODEL::SetRefPoint(D3DXVECTOR3 vec)
{
	m_RefPoint	= vec;
}

D3DXVECTOR3 NGMODEL::GetRefPoint()
{
	D3DXVECTOR3 vec;

	D3DXVec3TransformCoord(&vec, &m_RefPoint, &m_matModel);

	return vec;
}

VOID NGMODEL::SetCylinder(D3DXVECTOR3 vec, FLOAT h, FLOAT r)
{
	m_Cylinder.SetData(vec, h, r);
}

NGCYLINDER NGMODEL::GetCylinder()
{
	D3DXVECTOR3 vec;
	NGCYLINDER	cyl;
	
	D3DXVec3TransformCoord(&vec, &m_Cylinder.RefPoint, &m_matModel);
	cyl.SetData(vec, m_Cylinder.Height, m_Cylinder.Radius);

	return cyl;
}

