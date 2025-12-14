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

#include "..\stdafx.h"
#include <D3D8.h>

//=========================================================================
// Name : CResAbstract 
// Desc : Class CResAbstract.
//=========================================================================
class CResAbstract
{
public:
	// Override
	virtual HRESULT OneTimeSceneInit()        = 0;
	virtual HRESULT InitDeviceObjects()       = 0;
	virtual HRESULT RestoreDeviceObjects()    = 0;
	virtual HRESULT FrameMove()               = 0;
	virtual HRESULT Render()                  = 0;
	virtual HRESULT InvalidateDeviceObjects() = 0;
	virtual HRESULT DeleteDeviceObjects()     = 0;
	virtual HRESULT FinalCleanup()			  = 0;
};

//=========================================================================
// Name : CAbstract 
// Desc : Class Abstract.
//=========================================================================
class CAbstract : public CObject, public CResAbstract  
{
	DECLARE_SERIAL(CAbstract)

public:
	// Name 
	CString m_strKey;

public:
	CAbstract();
	virtual ~CAbstract();

public:
	//Serializeable
	virtual void Serialize( CArchive& ar );	

public:
	// Override
	virtual HRESULT OneTimeSceneInit()         { return S_OK; };
	virtual HRESULT InitDeviceObjects()        { return S_OK; };
	virtual HRESULT RestoreDeviceObjects()     { return S_OK; };
	virtual HRESULT FrameMove()                { return S_OK; };
	virtual HRESULT Render()				   { return S_OK; };
	virtual HRESULT InvalidateDeviceObjects()  { return S_OK; };
	virtual HRESULT DeleteDeviceObjects()	   { return S_OK; };
	virtual HRESULT FinalCleanup()			   { return S_OK; };

};

//=========================================================================
// Name : CAbArray 
// Desc : Class for a group of CAbstract.
//=========================================================================
class CAbArray : public CAbstract
{
	DECLARE_SERIAL(CAbArray)

private: 
	// Data
	CObArray m_arData;

public:
	// Constructor & Destructor
	CAbArray();
	virtual ~CAbArray();

public:
	// Interface
	void Add( CAbstract *pAbstract );
	void InsertAt( int Index, CAbstract *pAbstract );

	void DeleteAt( int Index );
	void DeleteAll();
	
	CAbstract *GetAt( int Index );
	int GetUpperBound();

	// SearchByName
	CAbstract *SearchByNameP( const CString &strName );
	int        SearchByNameI( const CString &strName );

public:
	//Serializeable
	virtual void Serialize( CArchive& ar );	

public:
	// Override
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT RestoreDeviceObjects();
	virtual HRESULT FrameMove();
	virtual HRESULT Render();
	virtual HRESULT InvalidateDeviceObjects();
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT FinalCleanup();

};


