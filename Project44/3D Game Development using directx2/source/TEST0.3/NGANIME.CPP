#include "nganime.h"

//--------------------------------------------------------
//	Class : NGANIME
//	
//		Container of anime data
//
//--------------------------------------------------------
BOOL NGANIME::AddAnimation(NGANIMATION* pAnim)
{
	if (pAnim==NULL)
		return FALSE;

	m_Anim.push_back(pAnim);
	m_playAnime	= new NGPLAYANIME();
	return TRUE;
}

DWORD NGANIME::FindLength()
{
	// find length
	DWORD	length = 0;
	for (int j=0; j<m_Anim.size(); j++)
	{
		if (!m_Anim.at(j)->keyTran.empty())
			if (m_Anim.at(j)->keyTran.back().dwTime>length)
				length	= m_Anim.at(j)->keyTran.back().dwTime;
		if (!m_Anim.at(j)->keyRot.empty())
			if (m_Anim.at(j)->keyRot.back().dwTime>length)
				length	= m_Anim.at(j)->keyRot.back().dwTime;
		if (!m_Anim.at(j)->keyScale.empty())
			if (m_Anim.at(j)->keyScale.back().dwTime>length)
				length	= m_Anim.at(j)->keyScale.back().dwTime;
	}
	m_dwLength	= length;
	return m_dwLength;
}

DWORD NGANIME::Update(FLOAT inputtime)
{
	FLOAT time;

	if (m_playAnime->bPlay)
	{
		m_playAnime->fTime	+= inputtime;
		time	= m_playAnime->dwFactor * m_playAnime->fTime;

		NGANIMATION*	anim;
		FLOAT			factor;
		FLOAT			fTime1;
		FLOAT			fTime2;
		INT				key;
		D3DXVECTOR3		vecTran;
		D3DXVECTOR3		vecScale;
		D3DXQUATERNION	quatRot;
		D3DXMATRIX		matAnime;
		BOOL			bTran;
		BOOL			bRot;
		BOOL			bScale;

		if (time>GetLength())
		{
			m_playAnime->fTime	= 0;
			if (m_playAnime->bLoop)
			{
				time	= 0.0000001f;
			}
			else
			{
				m_playAnime->bPlay	= FALSE;
				for (int j=0; j<GetAnimList()->size(); j++)
				{
					GetAnimList()->at(j)->frame->m_matAnim	= 
						GetAnimList()->at(j)->frame->m_matTran;
				}
				return TRUE;
			}
		}

		for (int j=0; j<GetAnimList()->size(); j++)
		{
			anim	= GetAnimList()->at(j);
			bTran	= TRUE;
			bRot	= TRUE;
			bScale	= TRUE;
			D3DXMatrixIdentity(&matAnime);
			
			// update tran key
			key	= -1;
			for (int k=0; k<anim->keyTran.size()-1; k++)
			{
				if ((anim->keyTran.at(k).dwTime <= time)&&
					(anim->keyTran.at(k+1).dwTime > time))
				{
					key = k;
					break;
				}
			}

			if (key<0)
			{
				bTran	= FALSE;
			}
			else
			{
				fTime1	= (FLOAT)anim->keyTran.at(key).dwTime;
				fTime2	= (FLOAT)anim->keyTran.at(key+1).dwTime;
				factor	= (time - fTime1)/(fTime2 - fTime1);
					
				D3DXVec3Lerp( &vecTran, &anim->keyTran.at(key).key, &anim->keyTran.at(key+1).key, factor);
			}

			// update rot key
			key	= -1;
			for (k=0; k<anim->keyRot.size()-1; k++)
			{
				if ((anim->keyRot.at(k).dwTime < time)&&
					(anim->keyRot.at(k+1).dwTime > time))
				{
					key = k;
					break;
				}
			}

			if (key<0)
			{
				bRot	= FALSE;
			}
			else
			{
				fTime1	= (FLOAT)anim->keyRot.at(key).dwTime;
				fTime2	= (FLOAT)anim->keyRot.at(key+1).dwTime;
				factor	= (time - fTime1)/(fTime2 - fTime1);

				D3DXQUATERNION	q1,q2;
				q1.x	= -anim->keyRot.at(key).key.y;
				q1.y	= -anim->keyRot.at(key).key.z;
				q1.z	= -anim->keyRot.at(key).key.w;
				q1.w	=  anim->keyRot.at(key).key.x;
				q2.x	= -anim->keyRot.at(key+1).key.y;
				q2.y	= -anim->keyRot.at(key+1).key.z;
				q2.z	= -anim->keyRot.at(key+1).key.w;
				q2.w	=  anim->keyRot.at(key+1).key.x;
					
				D3DXQuaternionSlerp( &quatRot, &q1, &q2, factor);	
			}

			// update scale key
			key	= -1;
			for (k=0; k<anim->keyScale.size()-1; k++)
			{
				if ((anim->keyScale.at(k).dwTime < time)&&
					(anim->keyScale.at(k+1).dwTime > time))
				{
					key = k;
					break;
				}
			}

			if (key<0)
			{
				bScale	= FALSE;
			}
			else
			{
				fTime1	= (FLOAT)anim->keyScale.at(key).dwTime;
				fTime2	= (FLOAT)anim->keyScale.at(key+1).dwTime;
				factor	= (time - fTime1)/(fTime2 - fTime1);
					
				D3DXVec3Lerp( &vecScale, &anim->keyScale.at(key).key, &anim->keyScale.at(key+1).key, factor);
			}			
	
			D3DXMATRIX	matTran,matRot,matScale;
			if (bScale||bRot||bTran)
				D3DXMatrixIdentity(&anim->frame->m_matAnim);
			
			if (bScale)
			{
				D3DXMatrixScaling(&matScale,vecScale.x,vecScale.y,vecScale.z);
				D3DXMatrixMultiply(&anim->frame->m_matAnim,&anim->frame->m_matAnim,&matScale);
			}
			if (bRot)
			{	
				D3DXMatrixRotationQuaternion(&matRot,&quatRot);
				D3DXMatrixMultiply(&anim->frame->m_matAnim,&anim->frame->m_matAnim,&matRot);
			}
			if (bTran)
			{
				D3DXMatrixTranslation(&matTran,vecTran.x,vecTran.y,vecTran.z);
				D3DXMatrixMultiply(&anim->frame->m_matAnim,&anim->frame->m_matAnim,&matTran);
			}
		}
	}

	return TRUE;
};