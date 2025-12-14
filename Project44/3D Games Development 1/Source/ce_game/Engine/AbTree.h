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

#include "Abstract.h"


class CAbTree : public CObArray, public CResAbstract  
{
	DECLARE_SERIAL(CAbTree)

public:
	CAbTree();
	virtual ~CAbTree();


//User Interface
public:

	int Add(CAbstract * pData);
	int Add(CObject * newElement) { Add(((CAbstract*) newElement));}

	CAbstract * GetAtName( const CString& Sz);
	CAbstract * RemoveAtName( const CString& Sz);
	int GetAtNameInt( const CString& Sz);

// Serialization
public:
	virtual void Serialize(CArchive& ar);

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


