#include "stdafx.h"
#include "ngmdlfile.h"

DWORD NGMDLFILE::SaveFile(char* filename, NGMODEL* model)
{
	if (model==NULL)
		return FALSE;

	if (filename==NULL)
		return FALSE;

	m_File.Create(filename);

	/* mdlfile 
	[option]

	<MagicNumber>	=	"MDL ";

	<Frame Data>	=	m_strName;
						m_matTran;
						[m_Mesh];
						<Mesh Data>		=	m_Index;
											m_Position;
											[m_RHW;]
											m_Normal;
											m_TexCoord;
											m_MtrlIndex;
											[m_Blend];
											m_Mtrl;
						[m_Collide];
						<Collide Data>	=	m_Face;
											m_Position
						[m_Bone];
						<Bone Data>		=	strName;
											matOffset;
						[m_Child];
						<Frame Data>

	<Anime Data>	=	number of element
						{NGANIME}
						<Anime Data>	=	number of element
											{NGANIMATION}
											<Animation Data>	=	strName;
																	[keyTran]
																	[keyRot]
																	[keyScale]
																	[keyMat]
	<Collide Data>
	*/

	// <Magic Number>
	char	buffer[256];
	DWORD	dwSize;

	sprintf(buffer,"MDL ");
	m_File.WriteBuff(buffer, sizeof (char), 4);

	// <Frame Data>
	WriteFrame(model->GetFrameList()->at(0));
	// <Anime Data>
	// number of anime
	dwSize	= model->GetAnimeList()->size();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	for (int i=0; i<dwSize; i++)
	{
		WriteAnime(model->GetAnimeList()->at(i));
	}

	// Collide
	DWORD dwCollide	= model->GetCollideList()->size();
	m_File.WriteBuff(&dwCollide, sizeof(DWORD));
	for (i=0; i<dwCollide; i++)
	{
		NGCOLLIDE*	collide	= model->GetCollideList()->at(i);

		//m_Parent
		BOOL	write	= FALSE;
		for (DWORD j=0; j<model->GetFrameList()->size(); j++)
		{
			if (collide->GetParent()==model->GetFrameList()->at(j))
			{
				m_File.WriteBuff(&j, sizeof(DWORD));
				write	= TRUE;
			}
		}
		if (!write)
		{
			j	= 0;
			m_File.WriteBuff(&j, sizeof(DWORD));
		}
		
		//m_Face
		dwSize	= collide->m_Face.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&collide->m_Face.at(0), sizeof(NGFACE), dwSize);
			
		//m_Position
		dwSize	= collide->m_Position.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&collide->m_Position.at(0), sizeof(D3DXVECTOR3), dwSize);
	}
		
	return TRUE;
}

DWORD NGMDLFILE::WriteFrame(NGFRAME* frame)
{
	BOOL	bValid;
	DWORD	dwSize;
	char	buffer[256];

	if (frame==NULL)
		return FALSE;

	// m_strName
	dwSize	= frame->m_strName.length();
	sprintf(buffer, "%s", frame->m_strName.c_str());
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	m_File.WriteBuff(buffer, sizeof(char), dwSize);

	// m_matTran
	m_File.WriteBuff(&frame->m_matTran, sizeof(D3DXMATRIX));

	// m_Mesh
	NGMESH*	mesh	= frame->GetMesh();
	if (mesh==NULL)
		bValid	= FALSE;
	else
		bValid	= TRUE;

	m_File.WriteBuff(&bValid, sizeof(BOOL));
	
	if (bValid)
	{
		//m_Index
		dwSize	= mesh->m_Index.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&mesh->m_Index.at(0), sizeof(NGFACE), dwSize);
		
		//m_Position
		dwSize	= mesh->m_Position.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&mesh->m_Position.at(0), sizeof(D3DXVECTOR3), dwSize);

		//m_RGW
		dwSize	= mesh->m_RHW.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&mesh->m_RHW.at(0), sizeof(FLOAT), dwSize);

		//m_Normal
		dwSize	= mesh->m_Normal.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&mesh->m_Normal.at(0), sizeof(D3DXVECTOR3), dwSize);

		//m_TexCoord
		dwSize	= mesh->m_TexCoord.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&mesh->m_TexCoord.at(0), sizeof(D3DXVECTOR2), dwSize);

		//m_MtrlIndex
		dwSize	= mesh->m_Index.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&mesh->m_MtrlIndex.at(0), sizeof(UINT), dwSize);

		//m_Blend
		dwSize	= mesh->m_Blend.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		for (int i=0; i<dwSize; i++)
		{
			DWORD	blendSize;
			blendSize	= mesh->m_Blend.at(i).size();
			m_File.WriteBuff(&blendSize, sizeof (DWORD));
			if (blendSize>0)
			{
				for (int x=0; x<blendSize; x++)
				{
					m_File.WriteBuff(&mesh->m_Blend.at(i).at(x).bySkinIndex, sizeof(BYTE));
					m_File.WriteBuff(&mesh->m_Blend.at(i).at(x).fWeight, sizeof(FLOAT));
				}
			}
		}

		// m_Mtrl
		dwSize	= mesh->m_Mtrl.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		for (i=0; i<dwSize; i++)
		{
			DWORD	nameSize;
			if (mesh->m_Mtrl.at(i).pTextureFilename==NULL)
				nameSize	= 0;
			else
				nameSize	= strlen(mesh->m_Mtrl.at(i).pTextureFilename);
			m_File.WriteBuff(&mesh->m_Mtrl.at(i), sizeof(D3DMATERIAL8));
			m_File.WriteBuff(&nameSize, sizeof (DWORD));
			if (nameSize>0)
				m_File.WriteBuff(mesh->m_Mtrl.at(i).pTextureFilename, sizeof(char), nameSize);
		}
	}

	// m_Bone
	dwSize	= frame->m_Bone.size();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	for (int i=0; i<dwSize; i++)
	{
		DWORD	nameSize;
		nameSize	= frame->m_Bone.at(i).strName.length();
		sprintf(buffer, "%s", frame->m_Bone.at(i).strName.c_str());
		m_File.WriteBuff(&nameSize, sizeof (DWORD));
		m_File.WriteBuff(buffer, sizeof(char), nameSize);
		m_File.WriteBuff(&frame->m_Bone.at(i).matOffset, sizeof(D3DXMATRIX));
	}

	// m_Child
	dwSize	= frame->m_pChild.size();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	for (i=0; i<dwSize; i++)
	{
		WriteFrame(frame->m_pChild.at(i));
	}
	
	return TRUE;
}


DWORD NGMDLFILE::WriteAnime(NGANIME* anime)
{
	DWORD	dwSize;
	char	buffer[256];

	// number of animation
	dwSize	= anime->GetAnimList()->size();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));

	// length
	dwSize	= anime->FindLength();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));

	// name
	dwSize	= anime->m_strName.length();
	sprintf(buffer, "%s", anime->m_strName.c_str());
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	m_File.WriteBuff(buffer, sizeof(char), dwSize);

	// Animation
	for (int i=0; i<anime->GetAnimList()->size(); i++)
	{
		NGANIMATION*	anim	= anime->GetAnimList()->at(i);
		
		// joint name
		dwSize	= anim->strFrame.length();
		sprintf(buffer, "%s", anim->strFrame.c_str());
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		m_File.WriteBuff(buffer, sizeof(char), dwSize);

		// tran key
		dwSize	= anim->keyTran.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyTran.at(0), sizeof(NGKEY3), dwSize);
	
		// rot key
		dwSize	= anim->keyRot.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyRot.at(0), sizeof(NGKEY4), dwSize);

		// scale key
		dwSize	= anim->keyScale.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyScale.at(0), sizeof(NGKEY3), dwSize);

		// mat key
		dwSize	= anim->keyMat.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyMat.at(0), sizeof(NGKEY16), dwSize);
	}
	
	return TRUE;
}
												
NGMODEL* NGMDLFILE::LoadFile(char* filename)
{
	NGMODEL*	model	= new NGMODEL();

	if (filename==NULL)
		return FALSE;

	if (!m_File.Exists(filename))
		return FALSE;

	if (!m_File.Open(filename))
		return FALSE;

	// <Magic Number>
	DWORD	dwSize;
	DWORD	dwMagic;

	m_File.ReadBuff(&dwMagic, sizeof(DWORD));
	if (dwMagic!=0x204c444d)
		return FALSE;


	// <Frame Data>
	NGFRAME*	root	= new NGFRAME();
	ReadFrame(root);
	model->Create(root);
	// <Anime Data>
	// number of anime
	m_File.ReadBuff(&dwSize, sizeof(DWORD));
	for (int i=0; i<dwSize; i++)
	{
		NGANIME*	anime	= new NGANIME();
		ReadAnime(anime);
		model->AddAnime(anime);
	}
	// <Collide Data>
	// Number of collide
	DWORD	dwCollide;
	m_File.ReadBuff(&dwCollide, sizeof(DWORD));
	for (i=0; i<dwCollide; i++)
	{
		NGCOLLIDE*	collide	= new NGCOLLIDE();
		//m_Parent
		m_File.ReadBuff(&collide->m_FrameID, sizeof(DWORD));

		//m_Index
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			collide->m_Face.resize(dwSize);
			m_File.ReadBuff(&collide->m_Face.at(0), sizeof(NGFACE), dwSize);
		}
	
		//m_Position
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			collide->m_Position.resize(dwSize);
			m_File.ReadBuff(&collide->m_Position.at(0), sizeof(D3DXVECTOR3), dwSize);
		}
		model->AddCollide(collide);
	}

	return model;
}

DWORD NGMDLFILE::ReadFrame(NGFRAME* frame)
{
	BOOL	bValid;
	DWORD	dwSize;
	char	buffer[256];

	if (frame==NULL)
		return FALSE;

	// m_strName
	m_File.ReadBuff(&dwSize, sizeof(DWORD));
	m_File.ReadBuff(buffer, sizeof(char), dwSize);
	buffer[dwSize]	= '\0';
	frame->m_strName	= buffer;

	// m_matTran
	m_File.ReadBuff(&frame->m_matTran, sizeof(D3DXMATRIX));

	// m_Mesh
	m_File.ReadBuff(&bValid, sizeof(BOOL));

	if (bValid)
	{
		NGMESH*	mesh	= new NGMESH();

		//m_Index
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			mesh->m_Index.resize(dwSize);
			m_File.ReadBuff(&mesh->m_Index.at(0), sizeof(NGFACE), dwSize);
		}
		
		//m_Position
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			mesh->m_Position.resize(dwSize);
			m_File.ReadBuff(&mesh->m_Position.at(0), sizeof(D3DXVECTOR3), dwSize);
		}

		//m_RGW
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			mesh->m_RHW.resize(dwSize);
			m_File.ReadBuff(&mesh->m_RHW.at(0), sizeof(FLOAT), dwSize);
		}

		//m_Normal
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			mesh->m_Normal.resize(dwSize);
			m_File.ReadBuff(&mesh->m_Normal.at(0), sizeof(D3DXVECTOR3), dwSize);
		}

		//m_TexCoord
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			mesh->m_TexCoord.resize(dwSize);
			m_File.ReadBuff(&mesh->m_TexCoord.at(0), sizeof(D3DXVECTOR2), dwSize);
		}

		//m_MtrlIndex
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			mesh->m_MtrlIndex.resize(dwSize);
			m_File.ReadBuff(&mesh->m_MtrlIndex.at(0), sizeof(UINT), dwSize);
		}

		//m_Blend
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		for (int i=0; i<dwSize; i++)
		{
			DWORD blendSize;
			m_File.ReadBuff(&blendSize, sizeof(DWORD));
			if (blendSize>0)
			{
				NGBLEND	blend;
				NGSKIN	skin;

				for (int x=0; x<blendSize; x++)
				{
					m_File.ReadBuff(&skin.bySkinIndex, sizeof(BYTE));
					m_File.ReadBuff(&skin.fWeight, sizeof(FLOAT));
					blend.push_back(skin);
				}
				mesh->m_Blend.push_back(blend);
			}
		}

		// m_Mtrl
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		for (i=0; i<dwSize; i++)
		{
			DWORD nameSize;
			D3DXMATERIAL	mtrl;
			
			m_File.ReadBuff(&mtrl.MatD3D, sizeof(D3DMATERIAL8));
			m_File.ReadBuff(&nameSize, sizeof(DWORD));

			mtrl.pTextureFilename	= NULL;
			if (nameSize>0)
			{
				m_File.ReadBuff(buffer, sizeof(char), nameSize);
				buffer[nameSize]	= '\0';
				mtrl.pTextureFilename	= new char[nameSize];
				sprintf(mtrl.pTextureFilename, "%s", buffer);
			}

			mesh->m_Mtrl.push_back(mtrl);
		}
	
		frame->SetMesh(mesh);
	}

	// m_Bone
	m_File.ReadBuff(&dwSize, sizeof(DWORD));
	for (int i=0; i<dwSize; i++)
	{
		DWORD nameSize;
		NGBONE	bone;

		m_File.ReadBuff(&nameSize, sizeof(DWORD));
		m_File.ReadBuff(buffer, sizeof(char), nameSize);
		buffer[nameSize]	= '\0';
		bone.strName	= buffer;
		m_File.ReadBuff(&bone.matOffset, sizeof(D3DXMATRIX));

		frame->m_Bone.push_back(bone);
	}

	// m_Child
	m_File.ReadBuff(&dwSize, sizeof(DWORD));
	for (i=0; i<dwSize; i++)
	{
		NGFRAME*	child	= new NGFRAME();

		child->m_pParent	= frame;
		ReadFrame(child);
		frame->m_pChild.push_back(child);
	}
	
	return TRUE;
}


DWORD NGMDLFILE::ReadAnime(NGANIME* anime)
{
	DWORD	dwSize;
	DWORD	dwLength;
	DWORD	dwAnim;
	char	buffer[256];

	// number of animation
	m_File.ReadBuff(&dwAnim, sizeof(DWORD));
	/*
	dwSize	= anime->GetAnimList()->size();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	*/

	// length
	m_File.ReadBuff(&dwLength, sizeof(DWORD));
	/*
	dwSize	= anime->FindLength();
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	*/

	// name
	m_File.ReadBuff(&dwSize, sizeof(DWORD));
	m_File.ReadBuff(buffer, sizeof(char), dwSize);
	buffer[dwSize]	= '\0';
	anime->m_strName	= buffer;
	/*
	dwSize	= anime->m_strName.length();
	sprintf(buffer, "%s", anime->m_strName.c_str());
	m_File.WriteBuff(&dwSize, sizeof(DWORD));
	m_File.WriteBuff(buffer, sizeof(char), dwSize);
	*/
	// Animation
	for (int i=0; i<dwAnim; i++)
	{
		NGANIMATION*	anim	= new NGANIMATION();
		
		// joint name
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		m_File.ReadBuff(buffer, sizeof(char), dwSize);
		buffer[dwSize]	= '\0';
		anim->strFrame	= buffer;
		/*
		dwSize	= anim->strFrame.length();
		sprintf(buffer, "%s", anim->strFrame.c_str());
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		m_File.WriteBuff(buffer, sizeof(char), dwSize);
		*/

		// tran key
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			anim->keyTran.resize(dwSize);
			m_File.ReadBuff(&anim->keyTran.at(0), sizeof(NGKEY3), dwSize);
		}
		/*
		dwSize	= anim->keyTran.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyTran.at(0), sizeof(NGKEY3), dwSize);
		*/

		// rot key
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			anim->keyRot.resize(dwSize);
			m_File.ReadBuff(&anim->keyRot.at(0), sizeof(NGKEY4), dwSize);
		}
		/*
		dwSize	= anim->keyRot.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyRot.at(0), sizeof(NGKEY4), dwSize);
		*/

		// scale key
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			anim->keyScale.resize(dwSize);
			m_File.ReadBuff(&anim->keyScale.at(0), sizeof(NGKEY3), dwSize);
		}
		/*
		dwSize	= anim->keyScale.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyScale.at(0), sizeof(NGKEY3), dwSize);
		*/

		// mat key
		m_File.ReadBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
		{
			anim->keyMat.resize(dwSize);
			m_File.ReadBuff(&anim->keyMat.at(0), sizeof(NGKEY16), dwSize);
		}
		/*
		dwSize	= anim->keyMat.size();
		m_File.WriteBuff(&dwSize, sizeof(DWORD));
		if (dwSize>0)
			m_File.WriteBuff(&anim->keyMat.at(0), sizeof(NGKEY16), dwSize);
		*/

		anime->AddAnimation(anim);	
	}

	return TRUE;
}
		
