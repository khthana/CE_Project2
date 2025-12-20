#ifndef skin
#define skin
class CXSkinnedMesh
{
private:
protected:
	D3DXMESHCONTAINER_EX *m_pMeshContainer1;
	D3DXMESHCONTAINER_EX *m_pMeshContainer2;
	LPDIRECT3DDEVICE9 m_pDevice;
	LPD3DXBUFFER m_pMaterialBuffer;
	LPD3DXBUFFER m_pAdjacencyBuffer;
	D3DXMATRIX *m_Transform;

public:

	CXFrameHierarchy *m_pFrames;

	CXSkinnedMesh(LPDIRECT3DDEVICE9 Device)
	{
		m_pFrames = NULL;
		m_pMeshContainer1 = NULL;
		m_pMeshContainer2 = NULL;
		m_pDevice = Device;
		m_pMaterialBuffer = m_pAdjacencyBuffer = NULL;
		m_Transform = NULL;
	}

	~CXSkinnedMesh()
	{
		SAFE_DELETE(m_pFrames);
		SAFE_DELETE(m_pMeshContainer1);
		SAFE_DELETE(m_pMeshContainer2);
	}

	VOID SetTransform(D3DXMATRIX *Transform)
	{
		m_Transform = Transform;
	}

	HRESULT LoadFromFile(char *File)
	{
		if(!FileExists(File))
			return E_FAIL;
		
		m_pMeshContainer1 = new D3DXMESHCONTAINER_EX();
		m_pMeshContainer2 = m_pMeshContainer1;

		m_pFrames = new CXFrameHierarchy();
		m_pFrames->LoadFromFile(File);

		CXFile *pFile = new CXFile();

		pFile->LoadFromFile(File);

		for(SIZE_T Counter = 0; Counter < pFile->GetChildCount(); Counter++)
		{
			CDataObject *DataObject = pFile->GetChild(Counter);

			ProcessItem(DataObject);

			SAFE_DELETE(DataObject);
		}

		SAFE_DELETE(pFile);

		return S_OK;
	}

	HRESULT ProcessItem(CDataObject* Item)
	{
		if(!Item)
			return E_FAIL;

		Item->GetData();

		if(Item->GetType() == TID_D3DRMMesh)
		{	
			LoadMeshFromDataObject(Item);
		}

		for(SIZE_T Counter = 0; Counter < Item->GetChildCount(); Counter++)
		{
			CDataObject *ChildItem = Item->GetChild(Counter);

			ProcessItem(ChildItem);

			SAFE_DELETE(ChildItem);
		}

		return S_OK;
	}

	HRESULT LoadMeshFromDataObject(CDataObject* Object)
	{
		if(!Object)
			return E_FAIL;

		//m_pMeshContainer = new D3DXMESHCONTAINER_EX();

		HRESULT Res = D3DXLoadSkinMeshFromXof(Object->GetDataInterface(), D3DXMESH_DYNAMIC, m_pDevice, &m_pAdjacencyBuffer,
									&m_pMaterialBuffer, NULL, &m_pMeshContainer2->NumMaterials, 
									&m_pMeshContainer2->pSkinInfo, &m_pMeshContainer2->MeshData.pMesh);

		if(SUCCEEDED(Res))
		{
				m_pMeshContainer2->MeshData.pMesh->CloneMeshFVF(0, m_pMeshContainer2->MeshData.pMesh->GetFVF(),
																m_pDevice, &m_pMeshContainer2->pSkinMesh);
		}

		m_pMeshContainer2->pMaterials = (D3DXMATERIAL*)m_pMaterialBuffer->GetBufferPointer();
		m_pMeshContainer2->pTextures = new LPDIRECT3DTEXTURE9[m_pMeshContainer2->NumMaterials];

		for(unsigned int Counter = 0; Counter < m_pMeshContainer2->NumMaterials; Counter++)
		{
			m_pMeshContainer2->pMaterials[Counter].MatD3D.Ambient = m_pMeshContainer2->pMaterials[Counter].MatD3D.Diffuse;
			m_pMeshContainer2->pTextures[Counter] = NULL;

			D3DXCreateTextureFromFile(m_pDevice, m_pMeshContainer2->pMaterials[Counter].pTextureFilename,
											&m_pMeshContainer2->pTextures[Counter]);
		}

		MapFramesToBones();
		m_pMeshContainer2->pNextMeshContainer = new D3DXMESHCONTAINER_EX();
		m_pMeshContainer2 = (D3DXMESHCONTAINER_EX*)m_pMeshContainer2->pNextMeshContainer;
		return S_OK;
	}

	bool CXSkinnedMesh::IsSkinnedMesh()
	{
		if(m_pMeshContainer2)
			if(m_pMeshContainer2->pSkinInfo && m_pMeshContainer2->pSkinInfo->GetNumBones())
				return true;

		return false;
	}

	VOID MapFramesToBones()
	{
		if(IsSkinnedMesh())
		{
			DWORD NumBones = m_pMeshContainer2->pSkinInfo->GetNumBones();

			m_pMeshContainer2->ppFrameMatrices = new D3DXMATRIX*[NumBones];
			m_pMeshContainer2->pBoneMatrices = new D3DXMATRIX[NumBones];

			for(DWORD Counter = 0; Counter < NumBones; Counter++)
			{
				const char* BoneName = m_pMeshContainer2->pSkinInfo->GetBoneName(Counter);

				D3DXFRAME_EX* FramePtr = m_pFrames->Find(BoneName);

				if(FramePtr)
					m_pMeshContainer2->ppFrameMatrices[Counter] =  &FramePtr->matCombined;
				else
					m_pMeshContainer2->ppFrameMatrices[Counter] = NULL;
			}
		}
	}

	VOID Update()
	{
		m_pFrames->UpdateHierarchy(m_Transform);

		DWORD NumBones = m_pMeshContainer2->pSkinInfo->GetNumBones();

		for(DWORD Counter = 0; Counter < NumBones; Counter++)
		{
			m_pMeshContainer2->pBoneMatrices[Counter] = (*m_pMeshContainer2->pSkinInfo->GetBoneOffsetMatrix(Counter));

			if(m_pMeshContainer2->ppFrameMatrices[Counter])
				m_pMeshContainer2->pBoneMatrices[Counter] *= (*m_pMeshContainer2->ppFrameMatrices[Counter]);
		}

		void *SrcPtr, *DesPtr;

		m_pMeshContainer2->MeshData.pMesh->LockVertexBuffer(D3DLOCK_READONLY, (void**) &SrcPtr);
		m_pMeshContainer2->pSkinMesh->LockVertexBuffer(0, (void**) &DesPtr);

		m_pMeshContainer2->pSkinInfo->UpdateSkinnedMesh(m_pMeshContainer2->pBoneMatrices, NULL,
																SrcPtr, DesPtr);

		m_pMeshContainer2->MeshData.pMesh->UnlockVertexBuffer();
		m_pMeshContainer2->pSkinMesh->UnlockVertexBuffer();
	}

	bool CXSkinnedMesh::Render()
	{m_pMeshContainer2 = m_pMeshContainer1;
		while (m_pMeshContainer2)
		{
			if(m_pMeshContainer2->pSkinMesh)
			{
				Update();

				for(unsigned int Counter = 0; Counter < m_pMeshContainer2->NumMaterials; Counter++)
				{
					m_pDevice->SetMaterial(&m_pMeshContainer2->pMaterials[Counter].MatD3D);
					m_pDevice->SetTexture(0, m_pMeshContainer2->pTextures[Counter]);

					m_pMeshContainer2->pSkinMesh->DrawSubset(Counter);
				}

				
			}
		m_pMeshContainer2 = (D3DXMESHCONTAINER_EX*)m_pMeshContainer2->pNextMeshContainer;
		}return true;
		//return false;	
	}
};
#endif