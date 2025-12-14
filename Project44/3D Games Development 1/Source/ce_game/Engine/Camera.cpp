//----------------------------------------------------------------------------------------
// Camera.cpp: implementation of the CCamera class.
//----------------------------------------------------------------------------------------



//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "..\stdafx.h"
#include "Camera.h"
#include <math.h>



//----------------------------------------------------------------------------------------
// Global access to the app (needed for the global WndProc())
//----------------------------------------------------------------------------------------
CCamera*			CCamera::s_pActiveCamera=NULL;
//CItemList<CCamera*>	CCamera::s_oCameraList;	



/*
------------+-----------------------------------------------------------------------------
 Function	| CCamera()
------------+-----------------------------------------------------------------------------
 Description| Default constructor for initializing the members.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CCamera::CCamera()
{
	Reset();
/*	if( !s_oCameraList.Search( this ) )
	{
		s_oCameraList.InsertAtTail( this );		
	}*/
}



/*
------------+-----------------------------------------------------------------------------
 Function	| ~CCamera()
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CCamera::~CCamera()
{
//	s_oCameraList.Delete( this );
}



VOID CCamera::Reset()
{
//	Matrix4X4Identity(&m_matView);
	m_vEye			= CVector3f(0.0f,50.0f,250.0f);
	m_vLookat		= CVector3f(0.0f,0.0f,0.0f);
	m_vUp			= CVector3f(0.0f,1.0f,0.0f);
	m_vView			= CVector3f(0.0f,0.0f,0.0f);
	m_vCross		= CVector3f(0.0f,0.0f,0.0f);
	
	m_vToEyePt		= CVector3f(0.0f,0.0f,0.0f);
	m_vToLookatPt	= CVector3f(0.0f,0.0f,0.0f);
//	Matrix4X4Identity(&m_matProj);
//	m_fFOV			= Pi/3.0f;
	m_fFOV			= 45.f;
//	m_fAspect		= 3.f/4.f;
	m_fAspect		= 4.f/3.f;
	m_fNearPlane	= 1.0f;
	m_fFarPlane		= 1000.0f;

	m_dR			= 0.0f;
	m_dPhi			= 0.0f;
	m_dTheta		= 0.0f;


	SetViewParams( m_vEye, m_vLookat, m_vUp );
    SetProjParams( 45.f, m_fAspect, m_fNearPlane, m_fFarPlane );
//  SetProjParams( D3DX_PI/4, 1.0f, m_fNearPlane, m_fFarPlane );
}



VOID CCamera::SetViewParams( CVector3f& vEye, CVector3f& vLookat, CVector3f& vUp )
{
    // Set attributes for the view matrix
    m_vEye    = vEye;
    m_vLookat = vLookat;
    m_vUp	  = vUp;

	// subtract distance
	CVector3f::Subtract( &m_vView, &m_vLookat, &m_vEye );

	// Normalized version of a 3-D vector.
	CVector3f::Normalize( &m_vView, &m_vView);

	// Determines the cross-product of two 3-D vectors.
	CVector3f::Cross( &m_vCross, &m_vView, &m_vUp );
/*
	// Builds a left-handed, look-at matrix.
//  Matrix4X4LookAtLH( &m_matView, &m_vEye, &m_vLookat, &m_vUp );

    D3DXVec3Normalize( &m_vView, &(m_vLookatPt - m_vEyePt) );
    D3DXVec3Cross( &m_vCross, &m_vView, &m_vUpVec );
*/
	// Temp DirectX vector
	D3DXVECTOR3 vDXEye( m_vEye.x, m_vEye.y, m_vEye.z);
	D3DXVECTOR3 vDXLookat( m_vLookat.x, m_vLookat.y, m_vLookat.z);
	D3DXVECTOR3 vDXUp( m_vUp.x, m_vUp.y, m_vUp.z);

	// Call DirectX methods
    D3DXMatrixLookAtLH( &m_matView, &vDXEye, &vDXLookat, &vDXUp );
    D3DXMatrixInverse( &m_matBillboard, NULL, &m_matView );
    m_matBillboard._41 = 0.0f;
    m_matBillboard._42 = 0.0f;
    m_matBillboard._43 = 0.0f;
	
	// Store to my variables
	m_vEye.x	= vDXEye.x;
	m_vEye.y	= vDXEye.y;
	m_vEye.z	= vDXEye.z;
	m_vLookat.x	= vDXLookat.x;
	m_vLookat.y	= vDXLookat.y;
	m_vLookat.z	= vDXLookat.z;
	m_vUp.x		= vDXUp.x;
	m_vUp.y		= vDXUp.y;
	m_vUp.z		= vDXUp.z;

	// Preparing the equal spherical coordinates
	FLOAT fX = vLookat.x-m_vEye.x;
	FLOAT fY = vLookat.y-m_vEye.y;
	FLOAT fZ = vLookat.z-m_vEye.z;

	m_dR = sqrt( (fX*fX)+(fY*fY)+(fZ*fZ) );

	if( !m_dR )
		return;

	m_dTheta = acos(fY/m_dR);
	
	if( !m_dTheta )
		return;

	m_dPhi = acos(CMath::Absolute(fX)/(m_dR*sin(m_dTheta)));
//	m_dPhi = atan(Absolute(fY/fX));

	if( fX>=0.0f && fZ>=0.0f )			//	+x,+y
		return;
	else
	if( fX< 0.0f && fZ>=0.0f )			//	-x,+y
		m_dPhi = PI-m_dPhi;
	else
	if( fX< 0.0f && fZ< 0.0f )			//	-x,-y
		m_dPhi += PI;
	else
	if( fX>=0.0f && fZ< 0.0f )			//	+x,-y
		m_dPhi = PIX2-m_dPhi;
/*	if( fX>=0.0f && fY>=0.0f )			//	+x,+y
		return;
	else
	if( fX< 0.0f && fY>=0.0f )			//	-x,+y
		m_dPhi = Pi-m_dPhi;
	else
	if( fX<=0.0f && fY< 0.0f )			//	-x,-y
		m_dPhi += Pi;
	else
	if( fX> 0.0f && fY< 0.0f )			//	+x,-y
		m_dPhi = PIX2-m_dPhi;
*/}



VOID CCamera::SetProjParams
( 
	FLOAT fFOV,
	FLOAT fAspect,
	FLOAT fNearPlane,
    FLOAT fFarPlane 
)
{
    // Set attributes for the projection matrix
    m_fFOV        = fFOV;
    m_fAspect     = fAspect;
    m_fNearPlane  = fNearPlane;
    m_fFarPlane   = fFarPlane;

	// Builds a left-handed perspective projection matrix based on a field of view (FOV).
//  MatrixPerspectiveFovLH( &m_matProj, fFOV, fAspect, fNearPlane, fFarPlane );
    D3DXMatrixPerspectiveFovLH( &m_matProj, fFOV, fAspect, fNearPlane, fFarPlane );
}



VOID CCamera::ZoomIn( FLOAT fValue )
{
	if( (m_fFOV-fValue) < 0.0f )
		return;

	m_fFOV -= fValue;

	SetProjParams( m_fFOV, m_fAspect, m_fNearPlane, m_fFarPlane );
	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::ZoomOut( FLOAT fValue )
{
	m_fFOV += fValue;

	SetProjParams( m_fFOV, m_fAspect, m_fNearPlane, m_fFarPlane );
	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::MoveForward( FLOAT fValue )
{
	CVector3f vTemp;
	CVector3f::Subtract( &vTemp, &m_vLookat, &m_vEye );
	CVector3f::Scale( &vTemp, &vTemp, fValue );

	FLOAT fDist = (FLOAT)CVector3f::Distance(&m_vLookat,&m_vEye);
	vTemp.x = vTemp.x/fDist;
	vTemp.y = vTemp.y/fDist;
	vTemp.z = vTemp.z/fDist;

	CVector3f::Add( &m_vLookat, &m_vLookat, &vTemp );
	CVector3f::Add( &m_vEye, &m_vEye, &vTemp );

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::MoveBackward( FLOAT fValue )
{
	CVector3f vTemp;
	CVector3f::Subtract( &vTemp, &m_vLookat, &m_vEye );
	CVector3f::Scale( &vTemp, &vTemp, fValue );

	FLOAT fDist = (FLOAT)CVector3f::Distance(&m_vLookat,&m_vEye);
	vTemp.x = vTemp.x/fDist;
	vTemp.y = vTemp.y/fDist;
	vTemp.z = vTemp.z/fDist;

	CVector3f::Subtract( &m_vLookat, &m_vLookat, &vTemp );
	CVector3f::Subtract( &m_vEye, &m_vEye, &vTemp );

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::MoveLeft( FLOAT fValue )
{
	DOUBLE dPhi = m_dPhi+PIBY2;
	FLOAT  fX	= (FLOAT)(fValue*cos(dPhi));
	FLOAT  fZ	= (FLOAT)(fValue*sin(dPhi));

	m_vLookat.x	-= fX;
	m_vEye.x	-= fX;

	m_vLookat.z	-= fZ;
	m_vEye.z	-= fZ;

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::MoveRight( FLOAT fValue )
{
	DOUBLE dPhi = m_dPhi+PIBY2;
	FLOAT  fX	= (FLOAT)(fValue*cos(dPhi));
	FLOAT  fZ	= (FLOAT)(fValue*sin(dPhi));

	m_vLookat.x	+= fX;
	m_vEye.x	+= fX;

	m_vLookat.z	+= fZ;
	m_vEye.z	+= fZ;

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::MoveUp( FLOAT fValue )
{
	m_vLookat.y	+= fValue;
	m_vEye.y	+= fValue;

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::MoveDown( FLOAT fValue )
{
	m_vLookat.y	-= fValue;
	m_vEye.y	-= fValue;

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::RotateLeft( DOUBLE dRadian )
{
	FLOAT	fX = m_vLookat.x-m_vEye.x;
	FLOAT	fZ = m_vLookat.z-m_vEye.z;
	DOUBLE dXZ = sqrt( (fX*fX)+(fZ*fZ) );

	DOUBLE newPhi = m_dPhi+dRadian;
	while( newPhi>=PIX2 )
	{
		newPhi -= PIX2;
	}

//	m_vLookat.x	= (FLOAT)(dXY*cos(newPhi));
//	m_vLookat.y	= (FLOAT)(dXY*sin(newPhi));
	m_vLookat.x	+= (FLOAT)(dXZ*(cos(newPhi)-cos(m_dPhi)));
	m_vLookat.z	+= (FLOAT)(dXZ*(sin(newPhi)-sin(m_dPhi)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::RotateRight( DOUBLE dRadian )
{
	FLOAT	fX = m_vLookat.x-m_vEye.x;
	FLOAT	fZ = m_vLookat.z-m_vEye.z;
	DOUBLE dXZ = sqrt( (fX*fX)+(fZ*fZ) );

	DOUBLE newPhi = m_dPhi-dRadian;
	while( newPhi<0.0 )
	{
		newPhi += PIX2;
	}

	m_vLookat.x	+= (FLOAT)(dXZ*(cos(newPhi)-cos(m_dPhi)));
	m_vLookat.z	+= (FLOAT)(dXZ*(sin(newPhi)-sin(m_dPhi)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::RotateUp( DOUBLE dRadian )
{
	DOUBLE newTheta = m_dTheta-dRadian;
	if( newTheta <= 0.0f )
		newTheta  = 0.0001f;

	DOUBLE newXZ = m_dR*(sin(newTheta)-sin(m_dTheta));
	m_vLookat.x	+= (FLOAT)(newXZ*(cos(m_dPhi)));
	m_vLookat.z	+= (FLOAT)(newXZ*(sin(m_dPhi)));
	m_vLookat.y	+= (FLOAT)(m_dR*(cos(newTheta)-cos(m_dTheta)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::RotateDown( DOUBLE dRadian )
{
	DOUBLE newTheta = m_dTheta+dRadian;
	if( newTheta >= PI )
		newTheta  = PI-0.0001f;

	DOUBLE newXZ = m_dR*(sin(newTheta)-sin(m_dTheta));
	m_vLookat.x	+= (FLOAT)(newXZ*(cos(m_dPhi)));
	m_vLookat.z	+= (FLOAT)(newXZ*(sin(m_dPhi)));
	m_vLookat.y	+= (FLOAT)(m_dR*(cos(newTheta)-cos(m_dTheta)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::OrbitLeft( DOUBLE dRadian )
{
	FLOAT	fX = m_vLookat.x-m_vEye.x;
	FLOAT	fZ = m_vLookat.z-m_vEye.z;
	DOUBLE dXZ = sqrt( (fX*fX)+(fZ*fZ) );
	
	DOUBLE newPhi = m_dPhi-dRadian;
	while( newPhi<0.0 )
	{
		newPhi += PIX2;
	}

	m_vEye.x -= (FLOAT)(dXZ*(cos(newPhi)-cos(m_dPhi)));
	m_vEye.z -= (FLOAT)(dXZ*(sin(newPhi)-sin(m_dPhi)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::OrbitRight( DOUBLE dRadian )
{
	FLOAT	fX = m_vLookat.x-m_vEye.x;
	FLOAT	fZ = m_vLookat.z-m_vEye.z;
	DOUBLE dXZ = sqrt( (fX*fX)+(fZ*fZ) );

	DOUBLE newPhi = m_dPhi+dRadian;
	while( newPhi>=PIX2 )
	{
		newPhi -= PIX2;
	}

	m_vEye.x -= (FLOAT)(dXZ*(cos(newPhi)-cos(m_dPhi)));
	m_vEye.z -= (FLOAT)(dXZ*(sin(newPhi)-sin(m_dPhi)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::OrbitUp( DOUBLE dRadian )
{
	DOUBLE newTheta = m_dTheta+dRadian;
	if( newTheta >= PI )
		newTheta  = PI-0.0001f;

	DOUBLE newXZ = m_dR*(sin(newTheta)-sin(m_dTheta));
	m_vEye.x	-= (FLOAT)(newXZ*(cos(m_dPhi)));
	m_vEye.z	-= (FLOAT)(newXZ*(sin(m_dPhi)));
	m_vEye.y	-= (FLOAT)(m_dR*(cos(newTheta)-cos(m_dTheta)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}



VOID CCamera::OrbitDown( DOUBLE dRadian )
{
	DOUBLE newTheta = m_dTheta-dRadian;
	if( newTheta <= 0.0f )
		newTheta  = 0.0001f;

	DOUBLE newXZ = m_dR*(sin(newTheta)-sin(m_dTheta));
	m_vEye.x	-= (FLOAT)(newXZ*(cos(m_dPhi)));
	m_vEye.z	-= (FLOAT)(newXZ*(sin(m_dPhi)));
	m_vEye.y	-= (FLOAT)(m_dR*(cos(newTheta)-cos(m_dTheta)));

	SetViewParams( m_vEye, m_vLookat, m_vUp );
}
