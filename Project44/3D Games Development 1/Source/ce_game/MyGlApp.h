//----------------------------------------------------------------------------------------
// MyGlApp.h: interface for the CMyGlApp class.
//----------------------------------------------------------------------------------------
#ifndef __MYGLAPP_H__
#define __MYGLAPP_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "GLApplication.h"
#include "Engine\MousePointer.h"
#include "Engine\Camera.h"
#include "Light.h"
#include "Fog.h"
#include "DMyCamera.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Class		| CMyGlApp
------------+-----------------------------------------------------------------------------
 Description| Major class of game process
 Author		| Mr.Apimun Junda
 Date		| Febuary 25, 2002
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CMyGlApp : public CGLApplication  
{
public:
	//---members variable-----------------------------------------------------------------
	static CColor4f	s_oSceneColor;
	static CLight	s_oSceneLight;
	static CFog		s_oSceneFog;
	CDMyCamera		m_oCamera;

	//---constructors & destructor--------------------------------------------------------
	CMyGlApp();
	virtual ~CMyGlApp();

	//---members function-----------------------------------------------------------------
	virtual HRESULT InitDeviceObjects(GLvoid);
	virtual HRESULT DeleteDeviceObjects(GLvoid);
	virtual HRESULT OneTimeSceneInit(void);
	virtual HRESULT FinalCleanup(void);
	virtual HRESULT FrameMove(GLvoid);
	virtual HRESULT Render(GLvoid);

	static void ShowLoading(float,const CString&);
	HRESULT ProcessKey(float);
	LRESULT CALLBACK MsgProc(HWND,UINT,WPARAM,LPARAM);

protected:
	//---members variable-----------------------------------------------------------------
	
};


#endif // __MYGLAPP_H__
