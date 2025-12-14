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

#include "..\stdafx.h"
#include "Matrix.h"
#include "Util.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
CMovMat::CMovMat()
{
	SetPosition( 0, 0, 0 );
	SetScale   ( 1, 1, 1 );
	SetRotation( 0, 0, 0 );
	m_DirVec = cs::vY;

	m_fUpToGnd = 0;
	m_DirVecMode = CMovMat::DV_UNUSE;
	m_bModifiedMat = TRUE;
}

CMovMat::~CMovMat()
{

}

//====================================================================
// Name : CalMat NonMatNormal
// Desc : Calculate Matrix 	Non  MatNormal
//====================================================================
HRESULT CMovMat::CalMatUnUseDirVec()
{
	float fMoveUp = m_fUpToGnd * m_Sy;
	m_cMat.LoadIdentity();
	m_cMat.Scale( m_Sx, m_Sy, m_Sz );
	m_cMat.Translatef( 0, fMoveUp, 0 );
	m_cMat.RotateZ( m_Row );
	m_cMat.RotateX( m_Phi );
	m_cMat.RotateY( m_Zetha );
	m_cMat.Translatef( m_Px, m_Py, m_Pz );
	return S_OK;
}

//====================================================================
// Name : CalMat WithMatNormal
// Desc : Calculate Matrix WithMatNormal	 
//====================================================================
HRESULT CMovMat::CalMatWithNMat()
{
	float fMoveUp = m_fUpToGnd * m_Sy;

	// Calculate Normal Matrix
	D3DXMATRIX MatNormal;
	Mat::CalNMat( &MatNormal, &m_DirVec );
	// Calculate vCross
	D3DXVECTOR3 vCross;
	Vec3::MulMat( &vCross, &cs::vX, &MatNormal );
	// Calculate vFront
	D3DXVECTOR3 vFront;
	Vec3::MulMat( &vFront, &cs::vZ, &MatNormal );

	// Calculate Mat Rotate Around Cross Vector
	D3DXMATRIX MatRotateCross;
	Mat::RotAxis( &MatRotateCross,  &vCross, float( D3DXToRadian( m_Phi ) ) );
	// Calculate Mat Rotate Around Normal Vector
	D3DXMATRIX MatRotateNormal;
	Mat::RotAxis( &MatRotateNormal, &m_DirVec, float( D3DXToRadian( m_Zetha ) ) );
	// Calculate Mat Rotate Around Front Vector
	D3DXMATRIX MatRotateFront;
	Mat::RotAxis( &MatRotateFront, &vFront, float( D3DXToRadian( m_Row ) ) );

	m_cMat.LoadIdentity();
	m_cMat.Scale( m_Sx, m_Sy, m_Sz );
	m_cMat.Translatef( 0, fMoveUp, 0 );
	m_cMat.Mul( &MatNormal );
	m_cMat.Mul( &MatRotateFront );
	m_cMat.Mul( &MatRotateCross );
	m_cMat.Mul( &MatRotateNormal );
	m_cMat.Translatef( m_Px, m_Py, m_Pz );

	return S_OK;
}

HRESULT CMovMat::CalMatWithFMat()
{
	float fMoveUp = m_fUpToGnd * m_Sy;

	// Calculate Normal Matrix
	D3DXMATRIX MatFront;
	Mat::CalFMat( &MatFront, &m_DirVec );
	// Calculate vCross
	D3DXVECTOR3 vCross;
	Vec3::MulMat( &vCross, &cs::vX, &MatFront );
	// Calculate vFront
	D3DXVECTOR3 vNormal;
	Vec3::MulMat( &vNormal, &(cs::vY), &MatFront );

	// Calculate Mat Rotate Around Cross Vector
	D3DXMATRIX MatRotateCross;
	Mat::RotAxis( &MatRotateCross,  &vCross, float( D3DXToRadian( m_Phi ) ) );
	// Calculate Mat Rotate Around Normal Vector
	D3DXMATRIX MatRotateNormal;
	Mat::RotAxis( &MatRotateNormal, &vNormal, float( D3DXToRadian( m_Zetha ) ) );
	// Calculate Mat Rotate Around Front Vector
	D3DXMATRIX MatRotateFront;
	Mat::RotAxis( &MatRotateFront, &m_DirVec, float( D3DXToRadian( m_Row ) ) );

	m_cMat.LoadIdentity();
	m_cMat.Scale( m_Sx, m_Sy, m_Sz );
	m_cMat.Translatef( 0, fMoveUp, 0 );
	m_cMat.Mul( &MatFront );
	m_cMat.Mul( &MatRotateFront );
	m_cMat.Mul( &MatRotateCross );
	m_cMat.Mul( &MatRotateNormal );
	m_cMat.Translatef( m_Px, m_Py, m_Pz );

	return S_OK;
}

//====================================================================
// Name : CalMat 
// Desc : Calculate Matrix 	 
//====================================================================
HRESULT CMovMat::CalMat()
{
	m_bModifiedMat = FALSE;

	switch( m_DirVecMode )
	{
	case CMovMat::DV_UNUSE :
		{
			return CalMatUnUseDirVec();
		}
	case CMovMat::DV_FRONTVEC :
		{
			return CalMatWithFMat();
		}
	case CMovMat::DV_NORMALVEC :
		{
			return CalMatWithNMat();
		}
	default: 
		{
			break;
		}
	}

	return E_FAIL;
}

//====================================================================
// Name : SetPosition
// Desc : Set Position of Object	
//====================================================================
HRESULT CMovMat::SetPosition( float Px, float Py, float Pz )
{
	m_bModifiedMat = TRUE;
	m_Px = Px;
	m_Py = Py;
	m_Pz = Pz;
	return S_OK;
}

//====================================================================
// Name : SetScale
// Desc : Set Scaling of Object	
//====================================================================
HRESULT CMovMat::SetScale ( float Sx, float Sy, float Sz )
{
	m_bModifiedMat = TRUE;
	m_Sx = Sx;
	m_Sy = Sy;
	m_Sz = Sz;
	return S_OK;
}

//====================================================================
// Name : SetRotation
// Desc : Set Rotation of Object	
//====================================================================
HRESULT CMovMat::SetRotation( float Row, float Phi, float Zetha )
{
	m_bModifiedMat = TRUE;
	m_Row   = Row;
	m_Phi   = Phi;
	m_Zetha = Zetha;
	return S_OK;
}

//====================================================================
// Name : SetDirVec
// Desc : Set Direction Vector of Object	
//====================================================================
HRESULT CMovMat::SetDirVec( const D3DXVECTOR3* pVDir )
{
	m_bModifiedMat = TRUE;
	m_DirVec = *pVDir;
	return S_OK;
}

void CMovMat::SetDirVecMode( int nDirMode )
{
	m_bModifiedMat = TRUE;
	m_DirVecMode   = nDirMode;
}

// Set Up to Ground
void CMovMat::SetUpToGnd( float fUpToGnd )
{ 
	m_bModifiedMat = TRUE;
	m_fUpToGnd = fUpToGnd; 
};

//====================================================================
// Name : GetMat
// Desc : Get Matrix 	
//====================================================================
D3DXMATRIX CMovMat::GetMat()
{
	if( m_bModifiedMat == TRUE )
	{
		CalMat();
	}

	return m_cMat.GetMat();
}

const D3DXMATRIX* CMovMat::GetpMat()  
{
	if( m_bModifiedMat == TRUE )
	{
		CalMat();
	}

	return m_cMat.GetpMat(); 
}

//=====================================================================
//                            CMat Class
//=====================================================================
CMat::CMat()
{
	m_Mat = cs::IMat;
}

CMat::CMat( const D3DXMATRIX& Mat )
{
	m_Mat = Mat;
}

CMat::CMat( const CMat& cMat )
{
	m_Mat = cMat.GetMat();
}

// Operation
void CMat::LoadIdentity()
{
	Mat::Identity( &m_Mat );
}

void CMat::Translatef( float x, float y, float z )
{
	D3DXMATRIX _Mat;
	Mat::Translation( &_Mat, x, y, z );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );
}

void CMat::Translatev( const D3DXVECTOR3 *pvTran )
{
	D3DXMATRIX _Mat;
	Mat::Translation( &_Mat, pvTran->x, pvTran->y, pvTran->z );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::Rotatef( float x, float y, float z, float AngleDeg )
{
	D3DXMATRIX _Mat;
	float AngleRad = cs::ToRad * AngleDeg;
	Mat::RotAxis( &_Mat, &D3DXVECTOR3(x, y, z), AngleRad );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::Rotatev( const D3DXVECTOR3 *pvAxis, float AngleDeg )
{
	D3DXMATRIX _Mat;
	float AngleRad = cs::ToRad * AngleDeg;
	Mat::RotAxis( &_Mat, pvAxis, AngleRad );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::RotateX( float AngleDeg )
{
	D3DXMATRIX _Mat;
	float AngleRad = cs::ToRad * AngleDeg;
	Mat::RotX( &_Mat, AngleRad );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::RotateY( float AngleDeg )
{
	D3DXMATRIX _Mat;
	float AngleRad = cs::ToRad * AngleDeg;
	Mat::RotY( &_Mat, AngleRad );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::RotateZ( float AngleDeg )
{
	D3DXMATRIX _Mat;
	float AngleRad = cs::ToRad * AngleDeg;
	Mat::RotZ( &_Mat, AngleRad );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::Scale( float sx, float sy, float sz )
{
	D3DXMATRIX _Mat;
	Mat::Scaling( &_Mat, sx, sy, sz );
	Mat::Mul( &m_Mat, &m_Mat, &_Mat );	
}

void CMat::Inverse()
{
	float Det; // Tmp
	Mat::Inverse( &m_Mat, &Det, &m_Mat );
}

void CMat::Transpose()
{
	Mat::Transpose( &m_Mat, &m_Mat );
}

void CMat::Mul( const D3DXMATRIX *pMat )
{
	Mat::Mul( &m_Mat, &m_Mat, pMat );
}

void  CMat::Mul( const CMat *pcMat )
{
	Mat::Mul( &m_Mat, &m_Mat, pcMat->GetpMat() );
}

void CMat::MulL( const CMat *pcMat )			  // Mul Left
{
	Mat::Mul( &m_Mat, pcMat->GetpMat(), &m_Mat );
}

void CMat::MulL( const D3DXMATRIX *pMat )
{
	Mat::Mul( &m_Mat, pMat, &m_Mat );
}

CMat CMat::operator = ( const CMat& cMat )
{
	m_Mat = cMat.GetMat();
	return *this;
}

