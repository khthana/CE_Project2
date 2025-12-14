// DMyCamera.h: interface for the CDMyCamera class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_DMYCAMERA_H__900C9F73_FB8F_4490_AF56_5E1F26D33BC5__INCLUDED_)
#define AFX_DMYCAMERA_H__900C9F73_FB8F_4490_AF56_5E1F26D33BC5__INCLUDED_

#include "Vector3f.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "MyCamera.h"

class CDMyCamera : public CMyCamera  
{
public:
	BOOL RayTest( D3DXVECTOR3 vEyeDestemp,D3DXVECTOR3 vDir,FLOAT* Dist);
	CVector3f GetDirection();
	CDMyCamera();
	virtual ~CDMyCamera();
	//---members function-----------------------------------------------------------------
    //virtual HRESULT Initialize();//	{ return S_OK; }	// Initialize device objects.
    //virtual HRESULT Invalidate()    { return S_OK; }	// Release all vidmem objects.
    //virtual HRESULT Restore()		{ return S_OK; }	// Recover device objects
    //virtual HRESULT Destroy()		{ return S_OK; }	// Clear all device objects.
    virtual HRESULT FrameMove(); //    { return S_OK; }	// Calculate for change animation.
    //virtual HRESULT Render();//     { return S_OK; }	// Render the scene.
	HRESULT Process(D3DXVECTOR3 vObj,FLOAT zetha);

//private:
	FLOAT		m_Distance;
	FLOAT		m_UpDistance;
	FLOAT		m_Zetha;
	D3DXVECTOR3 m_vEyeDes;
	FLOAT		m_fEyeSentitive;
};

#endif // !defined(AFX_DMYCAMERA_H__900C9F73_FB8F_4490_AF56_5E1F26D33BC5__INCLUDED_)
