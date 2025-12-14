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
#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library
#include "StaticModel.h"
#include "Util.h"
#include "GLGfx.h"
#include "Triangle.h"
#include "VertexColor.h"

CStaticModel::CStaticModel(void):
CModel()
{
	SetUseBoundSphereInRayTest( TRUE );
}

CStaticModel::~CStaticModel (void)
{
	ClearModel();
}

HRESULT CStaticModel::LoadModel( const char *strFileName )
{
	m_SModelData.Use( strFileName );

	return S_OK;
}

D3DXVECTOR3 CStaticModel::GetLocalCenter()
{
	return m_SModelData.GetCenter();
}

D3DXVECTOR3 CStaticModel::GetWorldCenter()
{
	D3DXVECTOR3 vWorldCenter;
	Vec3::MulMat( &vWorldCenter, &m_SModelData.GetCenter(), CMovMat::GetpMat() );
	return vWorldCenter;
}

float CStaticModel::GetRadius()
{
	return m_SModelData.GetRadius();
}

// Get Function
int CStaticModel::GetNumFaces()
{
	return m_SModelData.GetNumFaces();
}

int CStaticModel::GetNumVertices()
{
	return m_SModelData.GetNumVertices();
}

void CStaticModel::ClearModel()
{
	m_SModelData.UnUse();
}

HRESULT CStaticModel::Render( const D3DXMATRIX* matCustom )
{


	if( matCustom )
	{
		GLGfx::SetMatWorld( matCustom );
	}
	else
	{
		GLGfx::SetMatWorld( CMovMat::GetpMat() );
	}

	m_SModelData.Render();

	
	return S_OK;
}

BOOL CStaticModel::GetTriangle( int FaceIndex, CTriangle* pTriangle )
{
	ASSERT( pTriangle );
	float        *pVertices = m_SModelData.GetpVertices();
	unsigned int *pIndices  = m_SModelData.GetpIndices();
	int           NumFaces  = m_SModelData.GetNumFaces();

	if( ( FaceIndex >= 0 ) && ( FaceIndex < NumFaces ) )
	{
		int i0 = pIndices[ (3*FaceIndex) + 0 ];
		int i1 = pIndices[ (3*FaceIndex) + 1 ];
		int i2 = pIndices[ (3*FaceIndex) + 2 ];			

		D3DXVECTOR3 V0;
		V0.x = pVertices[3*i0];
		V0.y = pVertices[3*i0+1];
		V0.z = pVertices[3*i0+2];

		D3DXVECTOR3 V1;
		V1.x = pVertices[3*i1];
		V1.y = pVertices[3*i1+1];
		V1.z = pVertices[3*i1+2];

		D3DXVECTOR3 V2;
		V2.x = pVertices[3*i2];
		V2.y = pVertices[3*i2+1];
		V2.z = pVertices[3*i2+2];

		pTriangle->SetTriangle( V0, V1, V2 );
		return TRUE;
	}

	return FALSE;
}

BOOL CStaticModel::RayTest( const D3DXVECTOR3& RayOrigin,
							const D3DXVECTOR3& RayDirection, 
							// Out
							int*       pFaceIndex,
							CTriangle* pTriangle,
							FLOAT* pDistance, 
	  						FLOAT* pU, 
							FLOAT* pV )
{
	if( m_bUseBoundSphereInRayTest )
	{
		// if Not In Sphere then return FALSE
		if( !Ray::InSphere( &m_SModelData.GetCenter(), 
			                 m_SModelData.GetRadius(), 
			   			     CMovMat::GetpMat(), 
						     RayOrigin,
						     RayDirection ) )
		{
			return FALSE;
		}
	}

	// if InSphere then Continue Checking
	
	float *pVertices = m_SModelData.GetpVertices();
	if( !pVertices ) return FALSE;

	unsigned int *pIndices = m_SModelData.GetpIndices();
	int           NumFaces = m_SModelData.GetNumFaces();

	// Return
	return Ray::InArfVertices ( // In
	   					        RayOrigin,
								RayDirection, 
								CMovMat::GetpMat(),
								pVertices,
								pIndices,
								NumFaces,
								// Out
								pFaceIndex,
								pTriangle,
								pDistance, 
	  							pU, 
								pV );
}

/*
// Old
BOOL CStaticModel::GetHigh1( // In
							 float px, float pz,
							 // Out
							 float*     pHigh,
							 int*       pFaceIndex,
							 CTriangle* pTriangle )
{
	int NumFaces = m_SModelData.GetNumFaces();
	CTriangle CurrentTriangle;
	float High = 0.0f;
	for( int i = 0; i < NumFaces; i++ )
	{
		GetTriangle( i, &CurrentTriangle );

		float x0 = CurrentTriangle.GetV0().x;
		float x1 = CurrentTriangle.GetV1().x;
		float x2 = CurrentTriangle.GetV2().x;
		float z0 = CurrentTriangle.GetV0().z;
		float z1 = CurrentTriangle.GetV1().z;
		float z2 = CurrentTriangle.GetV2().z;
		
		float MidX = ( x0 + x1 + x2 ) / 3.0f;
		float MidZ = ( z0 + z1 + z2 ) / 3.0f;

		float R1Sq = ( ( MidX - x0 ) * ( MidX - x0 ) ) + ( ( MidZ - z0 ) * ( MidZ - z0 ) );
		float R2Sq = ( ( MidX - x1 ) * ( MidX - x1 ) ) + ( ( MidZ - z1 ) * ( MidZ - z1 ) );
		if( R2Sq > R1Sq ) 
		{
			R1Sq = R2Sq;
		}
		float R3Sq = ( ( MidX - x2 ) * ( MidX - x2 ) ) + ( ( MidZ - z2 ) * ( MidZ - z2 ) );
		if( R3Sq > R1Sq ) 
		{
			R1Sq = R3Sq;
		}

		float LengthFromPointSq = ( ( MidX - px ) * ( MidX - px ) ) + ( ( MidZ - pz ) * ( MidZ - pz ) );
		
		if ( sqrt(LengthFromPointSq) < sqrt(R1Sq) )
		{
			if( CurrentTriangle.GetHigh( px, pz, &High ) )
			{
				if( pHigh )
				{
					*pHigh = High;
				}
				if( pFaceIndex )
				{
					*pFaceIndex = i;
				}
				if( pTriangle )
				{
					pTriangle->SetTriangle( CurrentTriangle.GetV0(),
											CurrentTriangle.GetV1(),
											CurrentTriangle.GetV2() );
				}
				return TRUE;
			}
		}
	}

	return FALSE;
}
*/

// New GetHigh
BOOL CStaticModel::GetHigh1( // In
							 float px, float pz,
							 // Out
							 float*     pHigh,
							 int*       pFaceIndex,
							 CTriangle* pTriangle )
{
	int NumFaces = m_SModelData.GetNumFaces();
	CTriangle CurrentTriangle;
	float High = 0.0f;
	for( int i = 0; i < NumFaces; i++ )
	{
		GetTriangle( i, &CurrentTriangle );

		if( CurrentTriangle.GetHigh( px, pz, &High ) )
		{
			if( pHigh )
			{
				*pHigh = High;
			}
			if( pFaceIndex )
			{
				*pFaceIndex = i;
			}
			if( pTriangle )
			{
				pTriangle->SetTriangle( CurrentTriangle.GetV0(),
										CurrentTriangle.GetV1(),
										CurrentTriangle.GetV2() );
			}
			return TRUE;
		}
	}

	return FALSE;
}

//=========================================================================================================
// CSObjModel Class
//=========================================================================================================
CSObjModel::CSObjModel():
CStaticModel()
{
	SetCacheSize( 5 );
}

CSObjModel::~CSObjModel()
{

}

BOOL CSObjModel::LayOn( CSLandModel* ppLandModel )
{
	/*
	float px = CMovMat::Px();
	float pz = CMovMat::Pz();
	float High = 0.0f;

	if( ppLandModel->GetHigh1( px, pz, &High ) )
	{
		CMovMat::SetPosition( px, High, pz );
		return TRUE;
	}

	return FALSE;
	*/

	
	// Check in Cache first
	float High;
	if( !CacheTri.GetHigh1( CMovMat::Px(),
						    CMovMat::Pz(),
						    &High ) )
	{
		// If not found in cache, Search in earth
		CTriangle HitTriangle;
		if( ppLandModel->GetHigh1( CMovMat::Px(),
								  CMovMat::Pz(),
								  &High, NULL, &HitTriangle ) )
		{
			CMovMat::SetPosition( CMovMat::Px(),
								  High,
								  CMovMat::Pz() );
			CacheTri.Add( HitTriangle );
			return TRUE;
		}

		// If not found in both return false
		return FALSE;
	}
	else
	{
		CMovMat::SetPosition( CMovMat::Px(),
								  High,
								  CMovMat::Pz() );
	}

	// If in Cache Return True
	return TRUE;
	
}

void CSObjModel::SetCacheSize( int nCacheSize )
{
	ASSERT( nCacheSize >= 0 );
	CacheTri.SetCacheSize( nCacheSize );	
}

// Class CSCubeModel
CSCubeModel::CSCubeModel():
CSObjModel()
{
	// Cube
	/*
	SetLocalVecTestHigh( D3DXVECTOR3( -2, -2,  2 ),
						 D3DXVECTOR3(  2, -2,  2 ),
					     D3DXVECTOR3( -2, -2, -2 ),
					     D3DXVECTOR3(  2, -2, -2 ) );
	*/	
	// Tank
	SetLocalVecTestHigh( D3DXVECTOR3(  -1,  0,  0.63f ),
						 D3DXVECTOR3(   1,  0,  0.63f ),
					     D3DXVECTOR3(  -1,  0, -0.73f ),
					     D3DXVECTOR3(   1,  0, -0.73f ) );
}

CSCubeModel::~CSCubeModel()
{

}

HRESULT CSCubeModel::CalculateVecNormal( CSLandModel* pLandModel )
{
	SetModifiedMat();// Set Modify Mat
	D3DXVECTOR3 vTestWorldHigh1, vTestWorldHigh2, vTestWorldHigh3, vTestWorldHigh4;

	CMovMat MoveMatrix;
	MoveMatrix.SetDirVecMode( CMovMat::DV_NORMALVEC );

	MoveMatrix.SetPosition( CMovMat::Px(), 
		                    0.0f, 
							CMovMat::Pz() );

	MoveMatrix.SetScale   ( CMovMat::Sx(), 
		                    CMovMat::Sy(),
						    CMovMat::Sz() );

	MoveMatrix.SetRotation( 0, 0, float(CMovMat::Zetha()) );

	//D3DXMATRIX Mat = MoveMatrix.GetMat();
	const D3DXMATRIX *pMat = MoveMatrix.GetpMat();
	Vec3::MulMat( &vTestWorldHigh1, &m_vLocalTestHigh1, pMat );
	Vec3::MulMat( &vTestWorldHigh2, &m_vLocalTestHigh2, pMat );
	Vec3::MulMat( &vTestWorldHigh3, &m_vLocalTestHigh3, pMat );
	Vec3::MulMat( &vTestWorldHigh4, &m_vLocalTestHigh4, pMat );


	// Result
	BOOL Result;
	// Use lower
	CTriangle Triangle;
	
	// Vec 1
	if( !CacheTri.GetHigh1( vTestWorldHigh1.x, vTestWorldHigh1.z, &vTestWorldHigh1.y ) )
	{
		Result = pLandModel->GetHigh1( vTestWorldHigh1.x, vTestWorldHigh1.z, &vTestWorldHigh1.y,
			                           NULL, &Triangle );
			
		if( !Result ) return E_FAIL;
		CacheTri.Add ( Triangle );
	}

	// Vec 2
	if( !CacheTri.GetHigh1( vTestWorldHigh2.x, vTestWorldHigh2.z, &vTestWorldHigh2.y ) )
	{
		Result = pLandModel->GetHigh1( vTestWorldHigh2.x, vTestWorldHigh2.z, &vTestWorldHigh2.y,
			                           NULL, &Triangle );
			
		if( !Result ) return E_FAIL;
		CacheTri.Add( Triangle );
	}

	// Vec 3
	if( !CacheTri.GetHigh1( vTestWorldHigh3.x, vTestWorldHigh3.z, &vTestWorldHigh3.y ) )
	{
		Result = pLandModel->GetHigh1( vTestWorldHigh3.x, vTestWorldHigh3.z, &vTestWorldHigh3.y,
			                           NULL, &Triangle );
			
		if( !Result ) return E_FAIL;
		CacheTri.Add( Triangle );
	}

	// Vec 4
	if( !CacheTri.GetHigh1( vTestWorldHigh4.x, vTestWorldHigh4.z, &vTestWorldHigh4.y ) )
	{
		Result = pLandModel->GetHigh1( vTestWorldHigh4.x, vTestWorldHigh4.z, &vTestWorldHigh4.y,
			                           NULL, &Triangle );
			
		if( !Result ) return E_FAIL;
		CacheTri.Add( Triangle );
	}

	// Calculate Average Normal Vector
	D3DXVECTOR3 nVec1, nVec2, nVec3, nVec4;
	Vec3::CalNVec( &nVec1, &vTestWorldHigh1, &vTestWorldHigh2, &vTestWorldHigh3 );
	Vec3::CalNVec( &nVec2, &vTestWorldHigh2, &vTestWorldHigh4, &vTestWorldHigh1 );
	Vec3::CalNVec( &nVec3, &vTestWorldHigh3, &vTestWorldHigh1, &vTestWorldHigh4 );
	Vec3::CalNVec( &nVec4, &vTestWorldHigh4, &vTestWorldHigh3, &vTestWorldHigh2 );

	#ifdef _DEBUG
	if( ( nVec1.y < 0 ) || ( nVec1.y < 0 ) || ( nVec1.y < 0 ) || ( nVec1.y < 0 ) )
	{
		TRACE("nVec < 0 in CSCubeModel::CalculateVecNormal");
		ASSERT(FALSE);
	}
	#endif

	D3DXVECTOR3 nVecAvg = D3DXVECTOR3( float(nVec1.x + nVec2.x + nVec3.x + nVec4.x) / 4.0f, 
									   float(nVec1.y + nVec2.y + nVec3.y + nVec4.y) / 4.0f,
									   float(nVec1.z + nVec2.z + nVec3.z + nVec4.z) / 4.0f );

	// TRACE("\n nVecAvg.x = %f \n nVecAvg.y = %f \n nVecAvg.z = %f", nVecAvg.x, nVecAvg.y, nVecAvg.z);
		   
	CMovMat::SetDirVecMode( CMovMat::DV_NORMALVEC );
	CMovMat::SetDirVec( &nVecAvg );
	
	return S_OK;
}

BOOL CSCubeModel::LayOn( CSLandModel *pLandModel ) // pModel Not Modify
{
	// pTank OK;
	float Tx = CMovMat::Px();
	float Tz = CMovMat::Pz();
	float High;

	if( CacheTri.GetHigh1( Tx, Tz, &High ) )
	{
		CMovMat::SetPosition( Tx, High, Tz );
		CalculateVecNormal( pLandModel );
		return TRUE;
	}
	else
	{
		CTriangle Triangle;
		if( pLandModel->GetHigh1( Tx, Tz, &High, NULL, &Triangle ) )
		{
			CacheTri.Add( Triangle );
			CMovMat::SetPosition( Tx, High, Tz );
			CalculateVecNormal( pLandModel );
		    return TRUE;
		}
	}
	
	return FALSE;
}

//====================================================================
// Name: SetLocalVecTestHigh
// Desc: Set Vector TestHigh
//====================================================================
HRESULT CSCubeModel::SetLocalVecTestHigh( D3DXVECTOR3 vLocalTestHigh1,
										  D3DXVECTOR3 vLocalTestHigh2,
									      D3DXVECTOR3 vLocalTestHigh3,
									      D3DXVECTOR3 vLocalTestHigh4 )
{
	m_vLocalTestHigh1 = vLocalTestHigh1;
	m_vLocalTestHigh2 = vLocalTestHigh2;
	m_vLocalTestHigh3 = vLocalTestHigh3;
	m_vLocalTestHigh4 = vLocalTestHigh4;
	return S_OK;
}

//=========================================================================================================
// CSLandModel Class
//=========================================================================================================
CSLandModel::CSLandModel():
CStaticModel()
{
	SetUseBoundSphereInRayTest( FALSE );
}

CSLandModel::~CSLandModel()
{

}






