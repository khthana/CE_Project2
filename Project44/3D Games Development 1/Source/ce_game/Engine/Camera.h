//----------------------------------------------------------------------------------------
// Camera.h: interface for the CCamera class.
//----------------------------------------------------------------------------------------
#ifndef __CAMERA_H__
#define __CAMERA_H__



//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "..\Vector3f.h"



/*
------------+-----------------------------------------------------------------------------
 Class		| CCamera
------------+-----------------------------------------------------------------------------
 Description| The engine of graphics for rendering of graphics objects
 Author		| Mr.Apimun Junda
 Built on	| Sunday, October 21, 2001
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Apimun Junda. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CCamera  
{
public:
	//---constructors & destructor--------------------------------------------------------
	CCamera();
	virtual ~CCamera();
	
	//---members function-----------------------------------------------------------------
	CVector3f GetEye()			{ return m_vEye; }
	CVector3f GetLookat()		{ return m_vLookat; }
	CVector3f GetUp()			{ return m_vUp; }
	FLOAT GetFOV()				{ return m_fFOV; }
	FLOAT GetAspect()			{ return m_fAspect; }
	FLOAT GetNearPlane()		{ return m_fNearPlane; }
	FLOAT GetFarPlane()			{ return m_fFarPlane; }
	DOUBLE GetR()				{ return m_dR; };
	DOUBLE GetPhi()				{ return m_dPhi; };
	DOUBLE GetZetha()			{ return m_dTheta; };
	D3DXMATRIX GetView()		{ return m_matView; }
	D3DXMATRIX GetBillboard()	{ return m_matBillboard; }
	D3DXMATRIX GetProj()		{ return m_matProj; }
	VOID SetEye(CVector3f v)	{ m_vEye = v; }
	VOID SetLookat(CVector3f v)	{ m_vLookat = v; }
	VOID SetUp(CVector3f v)		{ m_vUp = v; }
	VOID SetFOV(FLOAT f)		{ m_fFOV = f; }
	VOID SetAspect(FLOAT f)		{ m_fAspect = f; }
	VOID SetNearPlane(FLOAT f)	{ m_fNearPlane = f; }
	VOID SetFarPlane(FLOAT f)	{ m_fFarPlane =f; }
	VOID SetViewParams(CVector3f&,CVector3f&,CVector3f&);
	VOID SetProjParams(FLOAT,FLOAT,FLOAT,FLOAT);
	VOID Reset();

	//---members function-----------------------------------------------------------------
    virtual HRESULT Initialize()	{ return S_OK; }	// Initialize device objects.
    virtual HRESULT Invalidate()    { return S_OK; }	// Release all vidmem objects.
    virtual HRESULT Restore()		{ return S_OK; }	// Recover device objects
    virtual HRESULT Destroy()		{ return S_OK; }	// Clear all device objects.
    virtual HRESULT FrameMove()     { return S_OK; }	// Calculate for change animation.
    virtual HRESULT Render()        { return S_OK; }	// Render the scene.

	VOID ZoomIn(FLOAT);
	VOID ZoomOut(FLOAT);

	VOID MoveForward(FLOAT);
	VOID MoveBackward(FLOAT);
	VOID MoveLeft(FLOAT);
	VOID MoveRight(FLOAT);
	VOID MoveUp(FLOAT);
	VOID MoveDown(FLOAT);

	VOID RotateLeft(DOUBLE);
	VOID RotateRight(DOUBLE);
	VOID RotateUp(DOUBLE);
	VOID RotateDown(DOUBLE);

	VOID OrbitLeft(DOUBLE);
	VOID OrbitRight(DOUBLE);
	VOID OrbitUp(DOUBLE);
	VOID OrbitDown(DOUBLE);

	VOID Active() { s_pActiveCamera = this; }

	//---members variable-----------------------------------------------------------------
	static	CCamera*			s_pActiveCamera;
//  static  CItemList<CCamera*>	s_oCameraList;	

protected:
	//---members variable-----------------------------------------------------------------
	CVector3f	m_vEye;			// Attributes for view matrix
	CVector3f	m_vLookat;		// The camera look-at target
	CVector3f	m_vUp;			// The current world's up, usually [0, 1, 0]. 
	CVector3f	m_vView;		// View vector for normalizing eye and lookat point
	CVector3f	m_vCross;		// Determines the cross-product of view and upvec
	D3DXMATRIX	m_matView;		// View matrix for transformation

	FLOAT       m_fFOV;         // Attributes for projection matrix
	FLOAT       m_fAspect;		// Aspect ratio
	FLOAT       m_fNearPlane;	// Near plane clipping
	FLOAT       m_fFarPlane;	// Far plane clipping
	CVector3f	m_vToEyePt;		// Destination of Camera point.
	CVector3f	m_vToLookatPt;	// Destination of Lookat Point.
	D3DXMATRIX	m_matProj;		// Project matrix.

	DOUBLE		m_dR;			// Magnitude of distance
	DOUBLE		m_dPhi;			// The angle about y-axis
	DOUBLE		m_dTheta;		// The angle about z-axis

	// Billboard effects
	D3DXMATRIX  m_matBillboard; // Special matrix for billboarding effects
};


#endif 