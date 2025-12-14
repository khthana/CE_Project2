#include "ngmodel.h"
#include "ngcollision.h"

VOID NGModel::Add(NGFRAME* f)
{
	m_frame.Add(f);
	m_frameMap.insert(String_Pair(f->m_strName, m_frame.Length()-1));
}

VOID NGModel::Add(NGMTRLS* f)
{
	m_mtrls.Add(f);
	m_mtrlsMap.insert(String_Pair(f->strName, m_mtrls.Length()-1));
}

VOID NGModel::Add(NGANIME* f)
{
	m_anime.Add(f);
	m_animeMap.insert(String_Pair(f->m_strName, m_anime.Length()-1));
}

VOID NGModel::Add(NGCOLLIDE* f)
{
	m_collide.Add(f);
	m_collideMap.insert(String_Pair(f->name, m_collide.Length()-1));
}

INT NGModel::FindFrame(string name)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_frameMap.find(name);

	if (RcIter==m_frameMap.end())
		return -1;

	return RcIter->second;
}

INT NGModel::FindMtrl(string name)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_mtrlsMap.find(name);

	if (RcIter==m_mtrlsMap.end())
		return -1;

	return RcIter->second;
}

INT NGModel::FindAnime(string name)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_animeMap.find(name);

	if (RcIter==m_animeMap.end())
		return -1;

	return RcIter->second;
}

INT NGModel::FindCollide(string name)
{
	map <string, INT> :: const_iterator RcIter;

	RcIter = m_collideMap.find(name);

	if (RcIter==m_collideMap.end())
		return -1;

	return RcIter->second;
}

BOOL NGModel::Link(NGRes2d* res2d)
{
	m_res2d	= res2d;
	try 
	{
		for (int i=0; i<m_frame.Length(); i++)
		{
			// parent
			if (m_frame[i]->m_pindex>=0)
				m_frame[i]->m_parent = m_frame[m_frame[i]->m_pindex];
			else
				m_root.Add(m_frame[i]);

			// child
			m_frame[i]->m_child.Reserve(m_frame[i]->m_cIndex.Length());
			for (int j=0; j<m_frame[i]->m_cIndex.Length(); j++)
			{
				if (m_frame[i]->m_cIndex[j]<0)
					throw NGException();
				
				m_frame[i]->m_child[j] = m_frame[m_frame[i]->m_cIndex[j]];
			}

			// joint
			m_frame[i]->m_joint.Reserve(m_frame[i]->m_jIndex.Length());
			for (j=0; j<m_frame[i]->m_jIndex.Length(); j++)
			{
				if (m_frame[i]->m_jIndex[j]<0)
					throw NGException();
				
				m_frame[i]->m_joint[j] = m_frame[m_frame[i]->m_jIndex[j]];
			}

			// mtrl
			for (j=0; j<m_frame[i]->m_Index.index.Length(); j++)
			{
				if (m_frame[i]->m_Index.index[j]->mtrl<0)
					throw NGException();

				m_frame[i]->m_Index.index[j]->pMtrlSet	= m_mtrls[m_frame[i]->m_Index.index[j]->mtrl];
				m_frame[i]->m_renderDesc[j]->iMtrl		= m_frame[i]->m_Index.index[j]->mtrl;
			}
			
			// collide
			for (j=0; j<m_collide.Length(); j++)
			{
				if (m_collide[j]->parent == m_frame[i]->m_strName)
					m_collide[j]->parentID = i;
			}
		}

		// texture
		if (res2d!=NULL)
		{
			for (int i=0; i<m_mtrls.Length(); i++)
			{
				m_mtrls[i]->texID0 = res2d->FindData2d(m_mtrls[i]->tex0);
				m_mtrls[i]->texID1 = res2d->FindData2d(m_mtrls[i]->tex1);
				INT t0	= m_mtrls[i]->texID0;
				INT t1	= m_mtrls[i]->texID1;
			}
		}

		// Anime
		for (i=0; i<m_anime.Length(); i++)
		{
			for (int j=0; j<m_anime[i]->m_Sets.Length(); j++)
			{
				m_anime[i]->m_Sets[j]->frameID = FindFrame(m_anime[i]->m_Sets[j]->name);	
			}

			m_anime[i]->Initialize();
		}
	}
	catch (NGException)
	{
		return false;
	}
	return TRUE;
}

NGClone* NGModel::Clone()
{
	NGClone*	clone = new NGClone();

	clone->m_pTemplate	= this;
	clone->m_pAnime		= &m_anime;
	clone->m_pMtrls		= &m_mtrls;
	clone->m_res2d		= m_res2d;
	D3DXMatrixIdentity(&clone->m_matRender);
	
	clone->m_frame.Reserve(m_frame.Length());
	for (int i=0; i<m_frame.Length(); i++)
		clone->m_frame[i]	= m_frame[i]->ToFrameX();

//	clone->m_collide.Reserve(m_collide.Length());
	clone->m_collide	= new NGDetector();
	for (i=0; i<m_collide.Length(); i++)
	{
		D3DXMATRIX*	mat;
		if (m_collide[i]->parentID<0)
			mat = &clone->m_matModel;
		else
			mat	= &clone->m_frame[m_collide[i]->parentID]->m_matRender;
		clone->m_collide->Add(m_collide[i], mat);
/*		clone->m_collide[i]	= new NGCOLLIDE();
		clone->m_collide[i]->name	= m_collide[i]->name;
		clone->m_collide[i]->parent	= m_collide[i]->parent;
		clone->m_collide[i]->type	= m_collide[i]->type;
		clone->m_collide[i]->radius	= m_collide[i]->radius;
		clone->m_collide[i]->height	= m_collide[i]->height;
		
		clone->m_collide[i]->pos.Reserve(m_collide[i]->pos.Length());
		for (int j=0; j<m_collide[i]->pos.Length(); j++)
		{
			clone->m_collide[i]->pos[j]	= m_collide[i]->pos[j];
		}

		clone->m_collide[i]->index.Reserve(m_collide[i]->index.Length());
		for (j=0; j<m_collide[i]->index.Length(); j++)
		{
			clone->m_collide[i]->index[j]	= m_collide[i]->index[j];
		}*/
	}

	return clone;
}

//-------------------------------------- NGClone

NGClone::NGClone()
{
	D3DXMatrixIdentity(&m_matModel);
	m_Parent	= NULL;
	m_pTemplate = NULL;
}

INT NGClone::FindFrame(string str)
{
	return m_pTemplate->FindFrame(str);
}

INT NGClone::FindAnime(string str)
{
	return m_pTemplate->FindAnime(str);
}

INT NGClone::FindMtrl(string str)
{
	return m_pTemplate->FindMtrl(str);
}

INT NGClone::FindCollide(string str)
{
	return m_pTemplate->FindCollide(str);
}

BOOL NGClone::AddPlayAnim(NGPLAYANIME pa)
{
	NGPLAYANIME*	pAnim = new NGPLAYANIME();
	*pAnim	= pa;
	
	if (pAnim->ID>=0)
	{
		// use id to find out
		switch (pAnim->type)
		{
		case ANIME_MTRL:
			{

			}
			break;
		case ANIME_ANIM:
			{
				if (pAnim->ID>=(*m_pAnime).Length())
					return false;

				m_playList.Add(pAnim);

				for (int i=0; i<(*m_pAnime)[pAnim->ID]->m_Sets.Length(); i++)
				{
					if (pAnim->length<(*m_pAnime)[pAnim->ID]->m_Sets[i]->keyTime)
						pAnim->length	= (*m_pAnime)[pAnim->ID]->m_Sets[i]->keyTime;
				}

				pAnim->length*=0.001f;
			}
			break;
		}
	}
	else
	{
		// use name to find out
	}
	return true;
}

BOOL NGClone::Play(INT id, BOOL loop, BOOL reset, FLOAT time)
{
	if (id<m_playList.Length())
	{
		m_playList[id]->play	= true;
		m_playList[id]->loop	= loop;
		m_playList[id]->reset	= reset;
		m_playList[id]->prev	= time;
	}
	else
		return false;

	return true;
}

BOOL NGClone::Update(FLOAT time)
{
	UpdateMtrl(time);
	UpdateTexture(time);
	UpdateAnime(time);
	UpdateMatrix();
	update = true;

	Render();
	return true;
}

BOOL NGClone::UpdateAnime(FLOAT time)
{
	for (int i=0; i<m_playList.Length(); i++)
	{
		if (m_playList[i]->play)
		{
			// update
			switch (m_playList[i]->type)
			{
			case ANIME_ANIM:
				{
					/*if (time<0.001)
						return true;
					FLOAT ts = time + m_playList[i]->prev;
					FLOAT tx = m_playList[i]->time + ts;
					FLOAT ty = (*m_pAnime)[m_playList[i]->ID]->m_keyTime;
					if (tx > ty)
					{
						if (m_playList[i]->loop)
						{
							m_playList[i]->time = tx - ty;
							m_playList[i]->prev += time;
						}
						else
						{	
							m_playList[i]->play	= false;
							m_playList[i]->time	= 0.0f;
							m_playList[i]->prev += time;
						}
					}
					else
					{
						m_playList[i]->time += time;
					}*/

					if (time<0.00001)
						return TRUE;

		//			char	buff[200];
					FLOAT	keyTime	= m_playList[i]->prev + time;
					FLOAT	endTime	= m_playList[i]->length * 0.1;
					/*sprintf(buff, "%f %f", keyTime, endTime);
					SetWindowText(Graphics()->GetCreateInfo()->hWnd, buff);*/

					if (keyTime>endTime)
					{
						keyTime = keyTime - endTime;
						m_playList[i]->time	= keyTime;
						m_playList[i]->prev	= keyTime;

						if (!m_playList[i]->loop)
							m_playList[i]->play	= FALSE;
						//MessageBox(NULL, "test", "test", MB_OK);
					}
					else
					{
						m_playList[i]->time = keyTime;
						m_playList[i]->prev = keyTime;
					}

					if (m_playList[i]->play)
					{
						NGANIME*	aset	= (*m_pAnime)[m_playList[i]->ID];
						for (int j=0; j<aset->m_Sets.Length(); j++)
						{
							m_frame[aset->m_Sets[j]->frameID]->m_matAnime	= aset->PlaySet(j, m_playList[i]->time);
						}
					}
				}
				break;
			}
		}
	}
	return true;
}

BOOL NGClone::UpdateMtrl(FLOAT)
{
	// Update material content data


	// Updata frame texture

	return true;
}

BOOL NGClone::UpdateTexture(FLOAT)
{
	for (int i=0; i<(*m_pMtrls).Length(); i++)
	{
		NGMTRLS*	mtrls	= (*m_pMtrls)[i];
		if (mtrls->texID0 >= 0)
		{
			NGDATA2D* d2d = m_res2d->GetData2d(mtrls->texID0);
			mtrls->image0 = d2d->defIndex;
		}

		if (mtrls->texID1 >= 0)
		{
			NGDATA2D* d2d = m_res2d->GetData2d(mtrls->texID1);
			mtrls->image1 = d2d->defIndex;
		}

		for (int j=0; j<m_rdesc.Length(); j++)
		{
			if (m_rdesc[j]->iMtrl == i)
			{
				m_rdesc[j]->t0	= mtrls->image0;
				m_rdesc[j]->t1	= mtrls->image1;
			}
		}
	}

	return true;
}

BOOL NGClone::UpdateMatrix()
{
	if (m_Parent!=NULL)
	{
		D3DXMatrixMultiply(&m_matRender, &m_matModel, m_Parent->GetMatrix());
	}
	else
		m_matRender	= m_matModel;

	for (int i=0; i<m_root.Length(); i++)
	{
		m_root[i]->UpdateFrame(&m_matModel);
	}
	return TRUE;
}

BOOL NGClone::Link()
{
	try 
	{
		// Dump data to file
		NGFILE	file;
		/*file.Create("Dump.dat");
		file.Write(" ");*/

		

		for (int i=0; i<m_frame.Length(); i++)
		{
			char* buf;
			if (m_frame[i]->m_strName.length()>3)
			{
				
				buf	= (char*)m_frame[i]->m_strName.c_str();
				if ((buf[0]=='c')&&(buf[0]=='c')&&(buf[0]=='c'))
					m_frame[i]->m_bRender	= FALSE;
			}

			// name
			/*if (m_frame[i]->m_joint.Length()>0)
			{
				file.WriteBuff(buf, m_frame[i]->m_strName.length());
				file.Write("\r\n");
			}*/

			// matrix
			m_frame[i]->m_matAnime = m_frame[i]->m_matTran;
			
			/*if (m_frame[i]->m_joint.Length()>0)
			{
				char	buffer[50];
				for (int m=0; m<4; m++)
				{
					for (int n=0; n<4; n++)
					{
						//itoa(m_frame[i]->m_matTran.m[m][n],buffer,0);
						sprintf(buffer, "%.3f", m_frame[i]->m_matTran.m[m][n]);
						file.WriteBuff(buffer, strlen(buffer));
						file.Write(", ");
					}
					file.Write("\r\n");
				}
			}*/


			// parent
			if (m_frame[i]->m_pindex>=0)
				m_frame[i]->m_parent = m_frame[m_frame[i]->m_pindex];
			else
				m_root.Add(m_frame[i]);

			// child
			m_frame[i]->m_child.Reserve(m_frame[i]->m_cIndex.Length());
			for (int j=0; j<m_frame[i]->m_cIndex.Length(); j++)
			{
				if (m_frame[i]->m_cIndex[j]<0)
					throw NGException();
				
				m_frame[i]->m_child[j] = m_frame[m_frame[i]->m_cIndex[j]];
			}

			// joint
			m_frame[i]->m_joint.Reserve(m_frame[i]->m_jIndex.Length());
			for (j=0; j<m_frame[i]->m_jIndex.Length(); j++)
			{
				if (m_frame[i]->m_jIndex[j]<0)
					throw NGException();
				
				m_frame[i]->m_joint[j] = m_frame[m_frame[i]->m_jIndex[j]];
			}

			// mtrl
			m_mtrls.Reserve(m_pMtrls->Length());
			for (j=0; j<m_pMtrls->Length(); j++)
			{
				m_mtrls[j]	= &(*m_pMtrls)[j]->mtrlDef.mtrlD3D;
			}

			// render description
			for (j=0; j<m_frame[i]->m_renderDesc.Length(); j++)
			{
				m_frame[i]->m_renderDesc[j]->mat	= &m_frame[i]->m_matRender;
				m_frame[i]->m_renderDesc[j]->mtrl	= m_mtrls[m_frame[i]->m_renderDesc[j]->iMtrl];
				m_frame[i]->m_renderDesc[j]->joint	= &m_frame[i]->m_joint;
				m_frame[i]->m_renderDesc[j]->jOffset= &m_frame[i]->m_jOffset;
				
				m_rdesc.Add(m_frame[i]->m_renderDesc[j]);
			}
			
			for (j=0; j<m_frame[i]->m_joint.Length(); j++)
			{
				// name
				file.WriteBuff(	(char*)m_frame[i]->m_joint[j]->m_strName.c_str(),
								m_frame[i]->m_joint[j]->m_strName.length());
				file.Write("\r\n");
			}
/*
			if (m_frame[i]->m_joint.Length()>0)
			{
				LPDIRECT3DVERTEXBUFFER8 pVB;
				pVB	= *m_frame[i]->m_renderDesc[0]->pBuffer->GetVertexBuffer();
				int size = m_frame[i]->m_renderDesc[0]->pBuffer->GetVertexNumber();
				NGVB_PNT1B4*	pData;
				pVB->Lock(0, size, (BYTE**)&pData, 0);
				
				char	buffer[200];
				for (int x=0; x<size; x++)
				{
					sprintf(buffer, "%.3f, %.3f, %.3f, %.3f, %d, %d, %d, %d" , 
						pData[x].b.b1, pData[x].b.b2, pData[x].b.b3, pData[x].b.b4,
						pData[x].b.i1, pData[x].b.i2, pData[x].b.i3, pData[x].b.i4);
					file.WriteBuff(buffer, strlen(buffer));
					file.Write("\r\n");
				}

				pVB->Unlock();
			}*/
		}
	//	file.Close();
	}
	catch (NGException)
	{
		return false;
	}
	return true;
}

BOOL NGClone::Render()
{
//	char*	b;
	for (int i=0; i<m_frame.Length(); i++)
	{
		if (m_frame[i]->m_bRender&&m_frame[i]->m_bMesh)// and bRender
		{
			for (int j=0; j<m_frame[i]->m_renderDesc.Length(); j++)
			{
				Renderer()->Add(m_frame[i]->m_renderDesc[j]);
			}
		}
	}

	return true;
}

NGRes3d::NGRes3d()
{
	m_numClone	= 0;
}

BOOL NGRes3d::Link(NGRes2d* r2d)
{
	if (r2d==NULL)
		return FALSE;

	for (int i=0; i<m_model.Length(); i++)
	{
		m_model[i]->Link(r2d);
	}

	return TRUE;
}

BOOL NGRes3d::AddModel(NGModel* mdl, string name)
{
	if (mdl==NULL)
		return FALSE;
	m_model.Add(mdl);
	m_mapModel.insert(Model_Pair(mdl->GetName(), mdl));
	return TRUE;
}

NGModel* NGRes3d::Find(string name)
{
	map <string, NGModel*> :: const_iterator RcIter;

	RcIter = m_mapModel.find(name);

	if (RcIter==m_mapModel.end())
		return NULL;

	return RcIter->second;
}

NGModel* NGRes3d::GetModel(DWORD i)
{
	if (i<m_model.Length())
		return NULL;

	return m_model[i];
}


BOOL	NGRes3d::CreateClone(string, NGClone*&)
{
	

	return TRUE;
}

BOOL	NGRes3d::CreateClone(INT ix, NGClone*& clone)
{
	if (ix>=m_model.Length())
		return FALSE;
	
	clone	= m_model[ix]->Clone();
	m_clone[m_numClone]	= clone;
	m_numClone++;
	
	return TRUE;
}

BOOL	NGRes3d::DestroyClone(NGClone*)
{

	return TRUE;
}

BOOL	NGRes3d::Render(FLOAT time)
{
	for (int i=0; i<m_numClone; i++)
	{
		m_clone[i]->Update(time);
		//m_clone[i]->Render();	
	}
	return TRUE;
}

BOOL	NGRes3d::UpdateMatrix()
{

	return TRUE;
}

BOOL	NGRes3d::Detect()
{
	for (int i=0; i<m_numClone; i++)
	{
		for (int j=i+1; j<m_numClone; j++)
		{
			DetectCollision(m_clone[i]->m_collide, m_clone[j]->m_collide);
		}
	}

	return TRUE;
}

