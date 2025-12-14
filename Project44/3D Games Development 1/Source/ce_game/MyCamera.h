//----------------------------------------------------------------------------------------
// MyCamera.h: interface for the CMyCamera class.
//----------------------------------------------------------------------------------------
#ifndef __MYCAMERA_H__
#define __MYCAMERA_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Engine\Camera.h"
#include "Engine\GLGfx.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Class		| CMyCamera
------------+-----------------------------------------------------------------------------
 Description| 
 Author		| Mr.Apimun Junda
 Date		| Febuary 25, 2002
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CMyCamera : public CCamera  
{
public:
	//---members variable-----------------------------------------------------------------

	//---constructors & destructor--------------------------------------------------------
	CMyCamera();
	virtual ~CMyCamera();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
    virtual HRESULT Initialize();//	{ return S_OK; }	// Initialize device objects.
    virtual HRESULT Invalidate()    { return S_OK; }	// Release all vidmem objects.
    virtual HRESULT Restore()		{ return S_OK; }	// Recover device objects
    virtual HRESULT Destroy()		{ return S_OK; }	// Clear all device objects.
    virtual HRESULT FrameMove()     { return S_OK; }	// Calculate for change animation.
    virtual HRESULT Render();//     { return S_OK; }	// Render the scene.
	HRESULT ProcessKey(FLOAT,RECT,BOOL*);
};


#endif // __MYCAMERA_H__
