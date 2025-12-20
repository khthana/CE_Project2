#ifndef ani
#define ani
class CMatrixKey
{
private:
protected:
public:
	DWORD m_Time;
	D3DXMATRIX m_Matrix;
};

//-----------------------------------------------------------------------------

class CAnimation
{
private:
protected:
public:
	CAnimation *m_Next;
	D3DXFRAME *m_AnimBone;
	DWORD m_Length;

	CMatrixKey *m_Keys;
	DWORD m_NumKeys;
	char* m_Name;

	CAnimation()
	{
		m_Next = NULL;
		m_AnimBone = NULL;
		m_Length = m_NumKeys = 0;
		m_Keys = NULL;
		m_Name = NULL;
	}

	~CAnimation()
	{
		delete [] m_Keys;
	}
};

//-----------------------------------------------------------------------------

class CAnimationSet
{
private:
protected:
public:
	CAnimationSet *m_Next;
	CAnimation *m_Animations; 
	DWORD m_NumAnimations;
	char* m_Name;

	CAnimationSet()
	{
		m_Next = NULL;
		m_Name = NULL;
		m_Animations = NULL;
		m_NumAnimations = 0;
	}

	~CAnimationSet()
	{
	}

	HRESULT AddAnimationObject(CAnimation *Anim)
	{
		if(!Anim)
			return E_FAIL;

		if(!m_Animations)
			m_Animations = Anim;
		else
		{
			CAnimation *Anims = m_Animations;

			while(Anims->m_Next)
				Anims = Anims->m_Next;

			Anims->m_Next = Anim;
		}

		m_NumAnimations++;

		return S_OK;
	}
};

//-----------------------------------------------------------------------------

class CXAnimationController
{
private:
protected:
	CAnimationSet *m_AnimationSets;
	DWORD m_NumAnimationSets;
	CXFrameHierarchy *m_Frames;

	
	
	
public:
	DWORD m_CurrentTime;
	DWORD m_StartTime;
	CXAnimationController(CXFrameHierarchy *Frames)
	{
		m_AnimationSets = NULL;
		m_NumAnimationSets = m_StartTime = m_CurrentTime = 0;
		m_Frames = Frames;
	}

	~CXAnimationController()
	{
	}

	VOID Start()
	{
		m_StartTime = timeGetTime();
	}

	HRESULT AddAnimationSet(CAnimationSet *AnimSet)
	{
		if(!AnimSet)
			return E_FAIL;

		if(!m_AnimationSets)
			m_AnimationSets = AnimSet;
		else
		{
			CAnimationSet *AnimSets = m_AnimationSets;

			while(AnimSets->m_Next)
				AnimSets = AnimSets->m_Next;

			AnimSets->m_Next = AnimSet;
		}

		m_NumAnimationSets++;

		return S_OK;
	}

	HRESULT LoadFromFile(char *File)
	{
		if(!FileExists(File))
			return E_FAIL;

		LPD3DXFILE pFile = NULL;
		LPD3DXFILEENUMOBJECT Enum = NULL;

		if(SUCCEEDED(D3DXFileCreate(&pFile)))
		{
			pFile->RegisterTemplates(D3DRM_XTEMPLATES, D3DRM_XTEMPLATE_BYTES);
	
			if(SUCCEEDED(pFile->CreateEnumObject(File, D3DXF_FILELOAD_FROMFILE, &Enum)))
			{
				SIZE_T Size = 0;
				
				Enum->GetChildren(&Size);

				for(SIZE_T Counter = 0; Counter < Size; Counter++)
				{
					LPD3DXFILEDATA DataObject = NULL;
					Enum->GetChild(Counter, &DataObject);
					ProcessItems(DataObject);
					DataObject->Release();
				}

				Enum->Release();
			}

			pFile->Release();
		}

		return S_OK;
	}

	HRESULT ProcessItems(LPD3DXFILEDATA Object, CAnimationSet *AnimSet = NULL, CAnimation *Anim = NULL)
	{
		if(!Object)
			return E_FAIL;

		CAnimationSet *AnimationSet = AnimSet;
		CAnimation *Animation = Anim;

		GUID guid;

		Object->GetType(&guid);

		if((guid == TID_D3DRMAnimationSet) && (!Object->IsReference()))
		{
			SIZE_T Length = 0;

			AnimationSet = new CAnimationSet();

			Object->GetName(NULL, &Length);
			AnimationSet->m_Name = new char[Length];
			Object->GetName(AnimationSet->m_Name, &Length);

			AddAnimationSet(AnimationSet);
		}

		if((guid == TID_D3DRMAnimation) && (!Object->IsReference()))
		{
			if(AnimSet)
			{
				SIZE_T Length = 0;
				Animation = new CAnimation();
				Object->GetName(NULL, &Length);
				Animation->m_Name = new char[Length];
				Object->GetName(Animation->m_Name, &Length);

				AnimSet->AddAnimationObject(Animation);
				ProcessKeyFrames(Object, AnimationSet, Animation);
			}
		}

		SIZE_T Size = 0;
				
		Object->GetChildren(&Size);

		for(SIZE_T Counter = 0; Counter < Size; Counter++)
		{
			LPD3DXFILEDATA DataObject = NULL;
			Object->GetChild(Counter, &DataObject);
			ProcessItems(DataObject, AnimationSet, Animation);
			DataObject->Release();
		}

		return S_OK;
	}

	HRESULT ProcessKeyFrames(LPD3DXFILEDATA Object, CAnimationSet *AnimSet = NULL, CAnimation *Anim = NULL)
	{
		if((!Object) || (!AnimSet) || (!Anim))
			return E_FAIL;

		SIZE_T Size = 0;
				
		Object->GetChildren(&Size);

		for(SIZE_T Counter = 0; Counter < Size; Counter++)
		{
			LPD3DXFILEDATA DataObject = NULL;
			Object->GetChild(Counter, &DataObject);

			GUID guid;

			DataObject->GetType(&guid);

			if((guid == TID_D3DRMFrame) && (!Object->IsReference()))
			{
				SIZE_T Length = 0;
				char *Name = NULL;

				DataObject->GetName(NULL, &Length);
				Name = new char[Length];
				DataObject->GetName(Name, &Length);
				Anim->m_AnimBone = m_Frames->Find(Name);
				delete [] Name;
			}
			
			if((guid == TID_D3DRMAnimationKey) && (!Object->IsReference()))
			{
				DWORD *DataPtr = NULL;
				SIZE_T BufferSize = 0;

				if(SUCCEEDED(DataObject->Lock(&BufferSize, (const void**) &DataPtr)))
				{
					DWORD Type = *DataPtr++;
					DWORD NumKeys = *DataPtr++;
					
					if(Type == 4)
					{
						CMatrixKey *Key = new CMatrixKey[NumKeys];

						for(DWORD Counter = 0; Counter < NumKeys; Counter++)
						{
							Key[Counter].m_Time = *DataPtr++;

							if(Key[Counter].m_Time > Anim->m_Length)
								Anim->m_Length = Key[Counter].m_Time;

							DataPtr++;
							
							D3DXMATRIX *mPtr = (D3DXMATRIX*) DataPtr;

							Key[Counter].m_Matrix = *mPtr;
							DataPtr+=16;
						}

						Anim->m_Keys = Key;
						Anim->m_NumKeys = NumKeys;
					}
				}

				DataObject->Unlock();
				ProcessKeyFrames(DataObject, AnimSet, Anim);
			}

			DataObject->Release();
		}

		return S_OK;
	}
D3DXMATRIX Calmatrix(CMatrixKey *StartKey,CMatrixKey *EndKey,DWORD Ctime)
{	DWORD TimeDifference = EndKey->m_Time - StartKey->m_Time;
	float Scalar = (float) (Ctime - StartKey->m_Time)/ TimeDifference;

	D3DXMATRIX Matrix = EndKey->m_Matrix - StartKey->m_Matrix;

	Matrix *= Scalar;
	Matrix += StartKey->m_Matrix;
	return Matrix;
}

	VOID Update(int speed,DWORD add)
	{
		m_CurrentTime = timeGetTime() - m_StartTime;
		m_CurrentTime *= speed;
		m_CurrentTime += add;
		if(!m_AnimationSets)
			return;

		CAnimationSet *Sets = m_AnimationSets;

		while(Sets)
		{
			CAnimation *Animation = Sets->m_Animations;
			Animation = Animation->m_Next;
			while(Animation)
			{
				CMatrixKey *Keys = Animation->m_Keys;

				CMatrixKey *StartKey = NULL;
				CMatrixKey *EndKey = NULL;
				for(DWORD Counter = 0; Counter < Animation->m_NumKeys; Counter++)
				{if(!EndKey)
					if(m_CurrentTime >= Keys[Counter].m_Time)
						StartKey = &Keys[Counter];
					else
						EndKey = &Keys[Counter];
				}

				if(!EndKey)
					Animation->m_AnimBone->TransformationMatrix = StartKey->m_Matrix;
				else
				{	
					
					Animation->m_AnimBone->TransformationMatrix = Calmatrix(StartKey,EndKey,m_CurrentTime);
				}

				Animation = Animation->m_Next;
			}

			Sets = Sets->m_Next;
		}
	}
};
#endif