#include "stdafx.h"
#include "ngscene.h"

DWORD NGSCENE::AddModelFile(char* filename)
{
	string	strName	= filename;
	m_mdlName.push_back(strName);
	
	NGMODEL*	model = NULL;

	model	= m_mdlFile.LoadFile((char*)filename);
		
	if (model==NULL)
		return FALSE;

	m_Model.push_back(model);

	return TRUE;
}

DWORD NGSCENE::Create(NG3D* p3d)
{
	if (p3d==NULL)
		return FALSE;

	if (p3d->GetDevice()==NULL)
		return FALSE;

	if (p3d->GetDeviceCaps()->MaxVertexIndex > 0x0000FFFF)
		m_typeIB	= INDEX32;

	m_p3d	= p3d;

/*	// Loading model
	for (int i=0; i<m_mdlName.size(); i++)
	{
		NGMODEL*	model = NULL;

		model	= m_mdlFile.LoadFile((char*)m_mdlName.at(i).c_str());
		
		if (model==NULL)
			return FALSE;

		m_Model.push_back(model);
	}
*/
	// Preparing model and find out texture name
	for (int i=0; i<m_Model.size(); i++)
	{
		m_Model.at(i)->Prepare(m_typeIB);

		for (int j=0; j<m_Model.at(i)->GetFrameList()->size(); j++)
		{
			NGFRAME*	frame	= m_Model.at(i)->GetFrameList()->at(j);

			if (frame->GetMesh()!=NULL)
			{
				NGMESH*	mesh	= frame->GetMesh();

				for (int k=0; k<mesh->m_Mtrl.size(); k++)
				{
					D3DXMATERIAL*	mtrl	= &mesh->m_Mtrl.at(k);
					NGRENDERDESC*	rdesc	= mesh->GetRenderDesc();
					BOOL	exist	= FALSE;
					
					// check Mtrl
					for (int m=0; m<m_Mtrl.size(); m++)
					{
						if (mtrl==m_Mtrl.at(m))
						{
							exist	= TRUE;
							break;
						}
					}
					
					if (!exist)
						m_Mtrl.push_back(mtrl);
					rdesc->descID.at(k).dwMtrl	= m;
					
					// check texture
					if (mtrl->pTextureFilename!=NULL)
					{
						string	name	= mtrl->pTextureFilename;
						exist	= FALSE;

						for (int l=0; l<m_ddsName.size();l++)
						{
							if (name==m_ddsName.at(l))
							{
								exist	= TRUE;
								break;
							}
						}

						if (!exist)
						{
							m_ddsName.push_back(name);
							NGTEXTURE*	tex	= new NGTEXTURE();
							m_Texture.push_back(tex);
						}					
						rdesc->descID.at(k).dwTexture	= l;
					}
				}
			}
		}
	}

	DWORD ddd	= m_ddsName.size();

	for (i=0; i<m_ddsName.size(); i++)
	{
		LPDIRECT3DTEXTURE8	texture	= m_ddsFile.LoadFile((char*)m_ddsName.at(i).c_str());
		m_Texture.at(i)->AddTexture(texture);
	}

	CreateBuffer(p3d);

	return TRUE;
}

DWORD NGSCENE::CreateBuffer(NG3D* p3d)
{
	m_PNT1	= new NGRENDERBUFFER();
	m_PNT1->Create(NGFVF_PNT1, INDEX16);
	m_FB1	= new NGFRAMEBUFFER();

	m_PNT1B4	= new NGRENDERBUFFER();
	m_PNT1B4->Create(NGFVF_PNT1B4, INDEX16);
	m_FB2	= new NGFRAMEBUFFER();

	for (int i=0; i<m_Object.size(); i++)
	{
		for (int j=0; j<m_Object.at(i)->GetFrameList()->size(); j++)
		{

			NGFRAME*	frame	= m_Object.at(i)->GetFrameList()->at(j);
			NGMESH*		mesh	= frame->GetMesh();
			
			if (mesh!=NULL)
			{
				switch (mesh->GetFVF())
				{
				case NGFVF_PNT1:
					{
						if (mesh->GetRenderBuffer()==NULL)
						{
							m_PNT1->AddMesh((void*)mesh);	
						}
						m_FB1->AddFrame(frame);
					}
					break;
				case NGFVF_PNT1B4:
					{
						if (mesh->GetRenderBuffer()==NULL)
						{
							m_PNT1B4->AddMesh((void*)mesh);	
						}
						m_FB2->AddFrame(frame);
					}
					break;
				case NGFVF_2DVERTEX:
					break;
				}
			}
		}
	}

	m_PNT1->Prepare(p3d);
	m_PNT1B4->Prepare(p3d);

	return TRUE;
}

DWORD NGSCENE::Render(FLOAT fTime)
{
	for (int i=0; i<m_Object.size(); i++)
		m_Object.at(i)->Update(fTime);

	NGFRAME*		frame;
	NGRENDERDESC*	rdesc;
	LPDIRECT3DDEVICE8	device	= m_p3d->GetDevice();

	if (device==NULL)
		return FALSE;

	// NGFVF_PNT1
	DWORD dwSize	= m_FB1->GetSize();
	DWORD dwVB		= 0xFFFFFFFF;
	DWORD dwTexture	= 0xFFFFFFFF;
	DWORD dwIB		= 0xFFFFFFFF;

	device->SetRenderState(D3DRS_SOFTWAREVERTEXPROCESSING, FALSE);
	device->SetRenderState(D3DRS_INDEXEDVERTEXBLENDENABLE, FALSE);
	device->SetRenderState(D3DRS_VERTEXBLEND, 0);

	for (i=0; i<dwSize; i++)
	{
		NGFRAMEDESC*	fdesc	= m_FB1->GetFrame(i);

		// set vertex buffer
		if (fdesc->dwVB!=dwVB)
		{
			dwVB	= fdesc->dwVB;
			m_PNT1->SetVB(fdesc->dwVB);
		}

		// set texture
		if (fdesc->dwTexture!=dwTexture)
		{
			dwTexture	= fdesc->dwTexture;
			if (dwTexture==0)
				device->SetTexture(0, NULL);
			else
				device->SetTexture(0, m_Texture.at(dwTexture)->GetTexture());
		}

		
		for (int j=0; j<fdesc->frame.size(); j++)
		{
			frame	= fdesc->frame.at(j);
			rdesc	= frame->GetMesh()->GetRenderDesc();
			m_PNT1->SetIB(fdesc->dwIB, rdesc->dwStartVT);
			frame->SetFrameMatrix(device);
			device->SetMaterial(&m_Mtrl.at(fdesc->dwMtrl)->MatD3D);
			if (i==1)
				device->SetMaterial(&m_Mtrl.at(1)->MatD3D);
			m_PNT1->Render(0, rdesc->dwNumVT, 0, fdesc->numID.at(j));
		}
	}

	// NGFVF_PNT1B4
	dwSize	= m_FB2->GetSize();
	dwVB		= 0xFFFFFFFF;
	dwTexture	= 0xFFFFFFFF;
	dwIB		= 0xFFFFFFFF;

	device->SetRenderState(D3DRS_SOFTWAREVERTEXPROCESSING,TRUE);
	device->SetRenderState(D3DRS_INDEXEDVERTEXBLENDENABLE,TRUE);
	device->SetRenderState(D3DRS_VERTEXBLEND,D3DVBF_3WEIGHTS);

	for (i=0; i<dwSize; i++)
	{
		NGFRAMEDESC*	fdesc	= m_FB2->GetFrame(i);

		// set vertex buffer
		if (fdesc->dwVB!=dwVB)
		{
			dwVB	= fdesc->dwVB;
			m_PNT1B4->SetVB(fdesc->dwVB);
		}

		// set texture
		if (fdesc->dwTexture!=dwTexture)
		{
			dwTexture	= fdesc->dwTexture;
			device->SetTexture(0, m_Texture.at(dwTexture)->GetTexture());
		}

		for (int j=0; j<fdesc->frame.size(); j++)
		{
			frame	= fdesc->frame.at(j);

			if (!frame->m_bVisible)
				continue;

			// set bone
			for (int i=0; i<frame->m_Bone.size(); i++)
			{	
				device->SetTransform(D3DTS_WORLDMATRIX(i),&frame->m_Bone.at(i).pBone->m_matRender);
				device->MultiplyTransform(D3DTS_WORLDMATRIX(i),&frame->m_Bone.at(i).matOffset);
			}

			
			rdesc	= frame->GetMesh()->GetRenderDesc();
			m_PNT1B4->SetIB(fdesc->dwIB, rdesc->dwStartVT);
			frame->SetFrameMatrix(device);
			device->SetMaterial(&m_Mtrl.at(fdesc->dwMtrl)->MatD3D);
			device->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE);
			m_PNT1B4->Render(0, rdesc->dwNumVT, 0, fdesc->numID.at(j));
		}
	}

	return TRUE;
}

NGMODEL* NGSCENE::GetModel(DWORD i)
{
	if (i>m_Object.size()+1)
		return NULL;

	return m_Object.at(i);
}

NGFRAME* NGSCENE::GetMapper(DWORD i)
{
	if (i>m_Mapper.size()+1)
		return NULL;

	return m_Mapper.at(i);
}

DWORD NGSCENE::AddMapper(DWORD i, char* strFrame)
{
	if (i>m_Object.size()+1)
		return FALSE;

	vector<NGFRAME*>*	pFrame	= m_Object.at(i)->GetFrameList();

	for (DWORD m = 0; m<pFrame->size(); m++)
	{
		if (strFrame==pFrame->at(m)->m_strName)
		{
			m_Mapper.push_back(pFrame->at(m));
			return TRUE;
		}
	}

	return FALSE;
}

DWORD NGSCENE::AddObject(DWORD i)
{
	if (i>m_Model.size()+1)
		return FALSE;

	m_Object.push_back(m_Model.at(i));

	return TRUE;

	/*	m_Object.push_back(m_Model.at(0));
	m_Object.push_back(m_Model.at(1));
	m_Object.push_back(m_Model.at(2));
	m_Object.push_back(m_Model.at(3));
	m_Object.push_back(m_Model.at(3));*/
}

DWORD NGSCENE::AddCollide(NGCOLLIDE* col)
{
	if (col==NULL)
		return FALSE;

	m_Collide.push_back(col);

	return TRUE;
}

NGCOLLIDE* NGSCENE::GetCollide(DWORD i)
{
	if (i>=m_Collide.size())
		return NULL;

	return m_Collide.at(i);
}
