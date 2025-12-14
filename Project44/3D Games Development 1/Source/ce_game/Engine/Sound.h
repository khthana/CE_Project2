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

#include "DsUtil.h"         // Header File For Use CSound , CSoundManager
#include "Logger.h"         // Header File For Use Logger


/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseSounds
//
//	Function		CUseSounds.Use(const CString& strFileName);
//	Function		CUseSounds.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CSoundsManage
//
//	Static Function CSoundsManage::StaticInitDeviceObject(HWND hWnd);
//	Static Function CSoundsManage::StaticDeleteDeviceObject();
//	Static Function CSoundsManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// Class CSounds
/////////////////////////////////////////////////////////////////////
class CSoundsAb : public CAbstract  
{

public:
	static CSoundManager SoundManager;

private:
	CSound *  m_Sounds;
	int	 m_nBufferSize;
	int  m_nNumber;

	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_Sounds"
	}

	void _FinalClean()
	{
		//Do Delete data from "m_Sounds"
		//don't forget set m_Sounds to NULL if it is Pointer

	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Sounds"

		// Load the wave file into a DirectSound buffer
		if ( m_nBufferSize <= 0 )
		{
			Log("Sound Size buffer Error !!  ( Size <= 0 )");
			ASSERT(FALSE);
		}

		char sz[512];
		sprintf(sz,"%s",m_strKey);

		if( FAILED(SoundManager.Create( &m_Sounds, sz, 0, GUID_NULL ,m_nBufferSize) ) )
		{
			// Not a critical failure, so just update the status
			char sz[255];
			sprintf(sz,"SoundManager.Create( &m_Sounds, %s, 0, GUID_NULL ,3) Error !!",m_strKey);
			Log(sz);
			ASSERT(FALSE);
			return; 
		}
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Sounds"
		//don't forget set m_Sounds to NULL if it is Pointer
		if ( m_Sounds != NULL )
		{
			delete m_Sounds;
			m_Sounds = NULL;
		}
	}

public:
	CSoundsAb(const CString& strName, int nBufferSize);
	virtual ~CSoundsAb();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteSounds();
	BOOL	AddSounds();
	
	CSound *  GetSounds() { return (m_nNumber>0)?m_Sounds:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CSoundsManage
/////////////////////////////////////////////////////////////////////
class CSoundsManage 
{
private :
	static CAbTree AbTree;


public:

	// Static for Implementation this Class
	static void StaticInitDeviceObjects(HWND hWnd);
	static void StaticDeleteDeviceObjects();
	static void StaticFinalCleanUp();

	static int GetSize(){return AbTree.GetSize();}

private:
	// User Interface
	static CSound *  Add( const CString& pName , int nBufferSize);
	static CSound *  GetSounds( const CString& pName );
	static CSoundsAb *	GetpSounds( const CString& pName );
	static void Remove( const CString& pName );

	friend class CUseSounds;

};



/////////////////////////////////////////////////////////////////////
// Class CUseSounds 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseSounds
{
public:
	CUseSounds() { m_bCreate = FALSE; pSounds = NULL; }
	~CUseSounds() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CSoundsAb * pSounds;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CSoundsManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pSounds = NULL;
	}

	void Use(const CString& pName, int nBufferSize)
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;

			CSoundsManage::Add(pName, nBufferSize);
			CSoundsManage::Remove(m_strKey);

			m_strKey = pName;					
			pSounds = CSoundsManage::GetpSounds(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CSoundsManage::Add(m_strKey, nBufferSize);
			pSounds = CSoundsManage::GetpSounds(m_strKey);
		}
	}

	CSound *  Get()
	{
		return ( pSounds != NULL ) ? pSounds->GetSounds():NULL;
	}

	void Play(DWORD dwFlags = 0, DWORD dwPriority = 0 )
	{
		CSound * pSound =  Get();

		if (pSound)
		{
			pSound->Play( dwPriority , dwFlags );
		}
	}

	HRESULT Stop()
	{
		CSound * pSound =  Get();
		return	pSound->Stop();
	}
	
	HRESULT Reset()
	{
		CSound * pSound =  Get();
		return	pSound->Reset();
	}

	BOOL IsSoundPlaying()
	{
		CSound * pSound =  Get();
		return	pSound->IsSoundPlaying();
	}
};

