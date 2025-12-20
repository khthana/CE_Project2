#ifndef base
#define base
class D3DXFRAME_EX : public D3DXFRAME
{
private:
protected:
public:
	D3DXMATRIX matCombined;
	D3DXMATRIX matOriginal;
	
	D3DXFRAME_EX()
	{
		Name = NULL;
		D3DXMatrixIdentity(&TransformationMatrix);
		D3DXMatrixIdentity(&matOriginal);
		D3DXMatrixIdentity(&matCombined);
		pMeshContainer = NULL;
		pFrameSibling = pFrameFirstChild = NULL;
	}

	~D3DXFRAME_EX()
	{
		SAFE_DELETE(pMeshContainer);
		SAFE_DELETE(pFrameSibling);
		SAFE_DELETE(pFrameFirstChild);
	}

	D3DXFRAME_EX* Find(const char* FrameName)
	{
		D3DXFRAME_EX *pFrame, *pFramePtr;

		if(Name && FrameName && !strcmp(FrameName, Name))
			return this;
	
		if((pFramePtr = (D3DXFRAME_EX*)pFrameSibling))
		{
			if((pFrame = pFramePtr->Find(FrameName)))
				return pFrame;
		}

		if((pFramePtr = (D3DXFRAME_EX*)pFrameFirstChild))
		{
			if((pFrame = pFramePtr->Find(FrameName)))
				return pFrame;
		}
	
		return NULL;
	}

	void Reset()
	{
		TransformationMatrix = matOriginal;
		
		D3DXFRAME_EX *pFramePtr = NULL;

		if((pFramePtr = (D3DXFRAME_EX*)pFrameSibling))
			pFramePtr->Reset();

		if((pFramePtr = (D3DXFRAME_EX*)pFrameFirstChild))
			pFramePtr->Reset();
	}

	void UpdateHierarchy(D3DXMATRIX *matTransformation = NULL)
	{
		D3DXFRAME_EX *pFramePtr = NULL;
		D3DXMATRIX matIdentity;

		if(!matTransformation)
		{
			D3DXMatrixIdentity(&matIdentity);
			matTransformation = &matIdentity;
		}
		
		matCombined = TransformationMatrix * (*matTransformation);

		if((pFramePtr = (D3DXFRAME_EX*)pFrameSibling))
			pFramePtr->UpdateHierarchy(matTransformation);

		if((pFramePtr = (D3DXFRAME_EX*)pFrameFirstChild))
			pFramePtr->UpdateHierarchy(&matCombined);
	}

	void AddChildFrame(D3DXFRAME_EX *Frame)
	{
		if(Frame)
		{
			if(!pFrameFirstChild)
				pFrameFirstChild = Frame;
			else
			{
				D3DXFRAME* FramePtr = pFrameFirstChild;

				while(FramePtr->pFrameSibling)
					FramePtr = FramePtr->pFrameSibling;
					
				FramePtr->pFrameSibling = Frame;	
			}
		}
	}
};

//-----------------------------------------------------------------------------

class CXFrameHierarchy
{
private:
protected:
	D3DXFRAME_EX *m_RootFrame;
	CXFile *m_pFile;

public:

	CXFrameHierarchy()
	{
		m_RootFrame = NULL;
		m_pFile = NULL;
	}

	~CXFrameHierarchy()
	{
		SAFE_DELETE(m_RootFrame);
		SAFE_DELETE(m_pFile);
	}

	HRESULT LoadFromFile(char *File)
	{
		m_pFile = new CXFile();
		m_pFile->LoadFromFile(File);

		for(SIZE_T Counter = 0; Counter < m_pFile->GetChildCount(); Counter++)
		{
			CDataObject *DataObject = m_pFile->GetChild(Counter);

			ProcessObject(DataObject, NULL);
		}

		return S_OK;
	}

	void UpdateHierarchy(D3DXMATRIX *matTransformation = NULL)
	{
		m_RootFrame->UpdateHierarchy(matTransformation);
	}

	void Reset()
	{
		m_RootFrame->Reset();
	}

	D3DXFRAME_EX* Find(const char* FrameName)
	{
		return m_RootFrame->Find(FrameName);
	}

	HRESULT ProcessObject(CDataObject *DataObject, D3DXFRAME_EX *Parent)
	{
		//If data object is NULL then exit

		if(!DataObject)
			return E_FAIL;

		D3DXFRAME_EX *Frame = NULL;

		DataObject->GetData();

		//Is data object is a reference then skip object
		if(DataObject->IsReference())
			return E_FAIL;

		//Is data object a frame?
		if(DataObject->GetType() == TID_D3DRMFrame)
		{
			Frame = new D3DXFRAME_EX();
			LPD3DXFILEDATA Interface = DataObject->GetDataInterface();

			//Get frame name
			SIZE_T Size = 0;
			Interface->GetName(NULL, &Size);
			Frame->Name = new char[Size];
			Interface->GetName(Frame->Name, &Size);
				
			//Is there currently a parent frame?
			if(!Parent)
			{
				if(m_RootFrame)
				{
					//Should not usually occur, but if so, then add as sibling of root frame

					D3DXFRAME* FramePtr = m_RootFrame;

					while(FramePtr->pFrameSibling)
						FramePtr = FramePtr->pFrameSibling;

					FramePtr->pFrameSibling = Frame;
				}
				else
					m_RootFrame = Frame; //Make this frame the root
			}
			else
			{
				Parent->AddChildFrame(Frame); //Add as child of the parent frame
			}
		}

		//If data object is a transformation matrix
		if(DataObject->GetType() == TID_D3DRMFrameTransformMatrix)
		{
			//Make sure there is a parent frame to add matrix to
			if(Parent)
			{
				D3DXMATRIX *Matrix = NULL;
				SIZE_T Size = 0;

				//Lock matrix data
				DataObject->Lock(&Size, (const void**) &Matrix);

				if(Size == sizeof(D3DXMATRIX))
				{
					//Copy over matrix
					Parent->TransformationMatrix = *(Matrix);
					Parent->matOriginal = Parent->TransformationMatrix;
				}
				
				//Unlock matrix data
				DataObject->Unlock();
			}
		}

		//Process child objects

		for(SIZE_T Counter = 0; Counter < DataObject->GetChildCount(); Counter++)
		{
			CDataObject *ChildObject = DataObject->GetChild(Counter);

			ProcessObject(ChildObject, Frame);
		}

		return S_OK;
	}
};

//-----------------------------------------------------------------------------

class D3DXMESHCONTAINER_EX : public D3DXMESHCONTAINER
{
private:
protected:
public:

	LPDIRECT3DTEXTURE9 *pTextures;
	ID3DXMesh *pSkinMesh;

	D3DXMATRIX **ppFrameMatrices;
	D3DXMATRIX *pBoneMatrices;

	D3DXMESHCONTAINER_EX()
	{
		Name = NULL;
		MeshData.pMesh = NULL;
		pMaterials= NULL;
		pEffects = NULL;
		NumMaterials = 0;
		pAdjacency = NULL;
		pSkinInfo = NULL;
		pNextMeshContainer = NULL;
		pTextures = NULL;
		pSkinMesh = NULL;
		ppFrameMatrices = NULL;
		pBoneMatrices = NULL;
	}

	~D3DXMESHCONTAINER_EX()
	{
		if(pTextures)
		{
			for(unsigned int Counter = 0; Counter < NumMaterials; Counter++)
			{
				if(pTextures[Counter])
					pTextures[Counter]->Release();
			}

			delete [] pTextures;
			pTextures = NULL;
		}

		NumMaterials = 0;

		if(Name)
		{
			delete [] Name; Name = NULL;
		}

		if(pEffects)
		{
			delete pEffects; pEffects = NULL;
		}

		if(pAdjacency)
		{
			delete [] pAdjacency; pAdjacency = NULL;
		}

		if(ppFrameMatrices)
		{
			delete [] ppFrameMatrices; ppFrameMatrices = NULL;
		}

		if(pBoneMatrices)
		{
			delete [] pBoneMatrices; pBoneMatrices = NULL;
		}

		if(MeshData.pMesh)
			MeshData.pMesh->Release();

		if(pSkinInfo)
			pSkinInfo->Release();

		if(pSkinMesh)
			pSkinMesh->Release();

		if(pNextMeshContainer)
		{
			delete pNextMeshContainer; pNextMeshContainer = NULL;
		}
	}

	D3DXMESHCONTAINER_EX* Find(char *MeshName)
	{
		D3DXMESHCONTAINER_EX *pMesh, *pMeshPtr;

		if(Name && MeshName && !strcmp(MeshName, Name))
			return this;

		if((pMeshPtr = (D3DXMESHCONTAINER_EX*) pNextMeshContainer))
		{
			if((pMesh = pMeshPtr->Find(MeshName)))
				return pMesh;
		}

		return NULL;
	}
};
#endif