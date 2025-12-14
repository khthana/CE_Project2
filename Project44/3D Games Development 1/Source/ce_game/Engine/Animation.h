/////////////////////////////////////////////////////////////////////////////
//
//	Copyright (c) 2001, Maetee Supreanruey and Anusorn Krasantisuk
//	All Rights Reserved.
//
//	This is UNPUBLISHED PROPRIETARY SOURCE CODE of Maetee Supreanruey 
//	and Anusorn Krasantisuk, the contents of this file may not be 
//	disclosed to third parties, copied or duplicated in any form, 
//	in whole or in part, without the prior written permission of 
//	Maetee Supreanruey and Anusorn Krasantisuk.
//
/////////////////////////////////////////////////////////////////////////////


#pragma once

#include <d3d8.h>			// Header File For The Direct3D8 Library

#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library

#include "Abtree.h"			// Header File For Use CAbtree
#include "Abstract.h"		// Header File For Use CAbstact
#include "GLGfx.h"          // Header File For Use CGLGfx  (check InitDeviceObjects promt )

#include "FrameModel.h"

/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseAnimation
//
//	Function		CUseAnimation.Use(const CString strFileName);
//	Function		CUseAnimation.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CAnimationManage
//
//	Static Function CAnimationManage::StaticInitDeviceObject();
//	Static Function CAnimationManage::StaticDeleteDeviceObject();
//	Static Function CAnimationManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CAnimation
/////////////////////////////////////////////////////////////////////

class CAnimationAb : public CAbstract  
{
private:
	CAnimation * m_Animation;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_Animation"
		if ( m_Animation == NULL )
		{
			m_Animation = new CAnimation;
			m_Animation->LoadAnimationFromFile(m_strKey);
		}
	}

	void _FinalClean()
	{
		//Do Delete data from "m_Animation"
		//don't forget set m_Animation to NULL if it is Pointer
		if ( m_Animation != NULL)
		{
			m_Animation->Clear();
			delete m_Animation;
			m_Animation = NULL;
		}
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Animation"
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Animation"
		//don't forget set m_Animation to NULL if it is Pointer
	}

public:
	CAnimationAb( const CString& strName );
	virtual ~CAnimationAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteAnimation();
	BOOL	AddAnimation();
	
	CAnimation * GetAnimation() { return (m_nNumber>0)?m_Animation:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CAnimationManage
/////////////////////////////////////////////////////////////////////
class CAnimationManage 
{
private :
	static CAbTree AbTree;

public:

	// Static for Implementation this Class
	static void StaticInitDeviceObjects();
	static void StaticDeleteDeviceObjects();
	static void StaticFinalCleanUp();

	static int GetSize(){return AbTree.GetSize();}

private:
	// User Interface
	static CAnimation * Add( const CString& pName);
	static CAnimation * GetAnimation( const CString& pName);
	static CAnimationAb *	GetpAnimation( const CString& pName);
	static void Remove( const CString& pName);

	friend class CUseAnimation;

};



/////////////////////////////////////////////////////////////////////
// Class CUseAnimation 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseAnimation : public CAbstract
{
public:
	CUseAnimation() { m_bCreate = FALSE; pAnimation = NULL; }
	CUseAnimation( const CString& pName ) { m_bCreate = FALSE; pAnimation = NULL; Use(pName); }
	~CUseAnimation() { UnUse(); }

private :
	CString m_strName;
	BOOL m_bCreate;
	CAnimationAb * pAnimation;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CAnimationManage::Remove(m_strName);
		}
		m_strName.Empty();
		pAnimation = NULL;
	}

	void Use(const CString pName)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strName) return;

			CAnimationManage::Add(pName);
			CAnimationManage::Remove(m_strName);

			m_strName = pName;					
			pAnimation = CAnimationManage::GetpAnimation(m_strName);
		}
		else
		{

			m_bCreate = TRUE;
			m_strName = pName;

			CAnimationManage::Add(m_strName);
			pAnimation = CAnimationManage::GetpAnimation(m_strName);
		}
	}

	CAnimation * Get()
	{
		return ( pAnimation != NULL ) ? pAnimation->GetAnimation():NULL;
	}

	void Render(float fTime)
	{
		CAnimation * pAnimation = Get();
		if (pAnimation != NULL)
		{
			pAnimation->Render(fTime);
		}
	}

	D3DXVECTOR3 GetLocalCenter(float fTime)
	{
		CAnimation * pAnimation = Get();
		if (pAnimation != NULL)
		{
			return pAnimation->GetLocalCenter(fTime);
		}
		return cs::v3Zero;
	}

	float GetRadius(float fTime)
	{
		CAnimation * pAnimation = Get();

		if (pAnimation != NULL)
		{
			return pAnimation->GetRadius(fTime);
		}

		return 0.0f;
	}

	float GetMaxTime()
	{
		CAnimation * pAnimation = Get();

		if (pAnimation != NULL)
		{
			return pAnimation->GetMaxTime();
		}

		return 0.0f;
	}

	int GetNumFaces()
	{
		CAnimation * pAnimation = Get();

		if (pAnimation != NULL)
		{
			return pAnimation->GetNumFaces();
		}

		return 0;
	}

	int GetNumVertices()
	{
		CAnimation * pAnimation = Get();

		if (pAnimation != NULL)
		{
			return pAnimation->GetNumVertices();
		}

		return 0;
	}

	BOOL RayTest( 
				  const D3DXVECTOR3& RayOrigin,
				  const D3DXVECTOR3& RayDirection, 
				  const D3DXMATRIX*  matWorld, 
				  float fBPos,
				  BOOL bUseBoundSphereInRayTest,
				  // Out
				  int*       pFaceIndex = NULL,
				  CTriangle* pTriangle  = NULL,
				  FLOAT*	 pDistance  = NULL, 
				  FLOAT*	 pU         = NULL, 
				  FLOAT*     pV         = NULL )
	{
		CAnimation * pAnimation = Get();
		
		if (pAnimation != NULL)
		{
			return pAnimation->RayTest(
										RayOrigin,
										RayDirection,
										matWorld,
										fBPos,
										bUseBoundSphereInRayTest,
										pFaceIndex,
										pTriangle,
										pDistance,
										pU,
										pV         
									  );
		}

		return FALSE;
	}

};

