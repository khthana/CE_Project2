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
#include "Util.h"
#include "GLGfx.h"
#include "Framemodel.h"
#include "Animation.h"
#include "Texture.h"
#include "Matrix.h"
#include "logger.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//================================================================
//	Math
//================================================================
double Math::Sin(double dAngle)
{
	return sin(dAngle);
}

double Math::Cos(double dAngle)
{
	return cos(dAngle);
}


double Math::Sin(float fAngle)
{
	return sin(double(fAngle));
}

double Math::Cos(float fAngle)
{
	return cos(double(fAngle));
}

float Math::Sinf(double dAngle)
{
	return float(sin(dAngle));
}

float Math::Cosf(double dAngle)
{
	return float(cos(dAngle));
}


float Math::Sinf(float fAngle)
{
	return float(sin(double(fAngle)));
}

float Math::Cosf(float fAngle)
{
	return float(cos(double(fAngle)));
}

double Math::ASin(double dAngle)
{

	if (dAngle>1.0)
	{
		dAngle = 1.0;
	}
	else
	if (dAngle<-1.0)
	{
		dAngle = -1.0;
	}

	return asin(dAngle);
}

double Math::ACos(double dAngle)
{

	if (dAngle>1.0)
	{
		dAngle = 1.0;
	}
	else
	if (dAngle<-1.0)
	{
		dAngle = -1.0;
	}

	return acos(dAngle);
}

double Math::ASin(float fAngle)
{

	if (fAngle>1.0f)
	{
		fAngle = 1.0f;
	}
	else
	if (fAngle<-1.0f)
	{
		fAngle = -1.0f;
	}

	return asin((double(fAngle)-1)+1);
}

double Math::ACos(float fAngle)
{
	if (fAngle>1.0f)
	{
		fAngle = 1.0f;
	}
	else
	if (fAngle<-1.0f)
	{
		fAngle = -1.0f;
	}

	return acos(double(fAngle));
}

float Math::ASinf(double dAngle)
{

	if (dAngle>1.0)
	{
		dAngle = 1.0;
	}
	else
	if (dAngle<-1.0)
	{
		dAngle = -1.0;
	}

	return float(asin(dAngle));
}

float Math::ACosf(double dAngle)
{

	if (dAngle>1.0)
	{
		dAngle = 1.0;
	}
	else
	if (dAngle<-1.0)
	{
		dAngle = -1.0;
	}

	return float(acos(dAngle));
}

float Math::ASinf(float fAngle)
{

	if (fAngle>1.0f)
	{
		fAngle = 1.0f;
	}
	else
	if (fAngle<-1.0f)
	{
		fAngle = -1.0f;
	}

	return float(asin(double(fAngle)));
}

float Math::ACosf(float fAngle)
{

	if (fAngle>1.0f)
	{
		fAngle = 1.0f;
	}
	else
	if (fAngle<-1.0f)
	{
		fAngle = -1.0f;
	}

	return float(acos(double(fAngle)));
}

//=============================================================================
//	Ray
//=============================================================================

//-----------------------------------------------------------------------------
// Name: InTriangle()
// Desc: Given a ray origin (orig) and direction (dir), and three vertices of
//       of a triangle, this function returns TRUE and the interpolated texture
//       coordinates if the ray intersects the triangle
//-----------------------------------------------------------------------------
BOOL Ray::InTriangle( const D3DXVECTOR3& orig,
                      const D3DXVECTOR3& dir, 
					  D3DXVECTOR3& v0, D3DXVECTOR3& v1, D3DXVECTOR3& v2,
                      FLOAT* t, FLOAT* u, FLOAT* v )
{
    // Find vectors for two edges sharing vert0
    D3DXVECTOR3 edge1 = v1 - v0;
    D3DXVECTOR3 edge2 = v2 - v0;

    // Begin calculating determinant - also used to calculate U parameter
    D3DXVECTOR3 pvec;
    D3DXVec3Cross( &pvec, &dir, &edge2 );

    // If determinant is near zero, ray lies in plane of triangle
    FLOAT det = D3DXVec3Dot( &edge1, &pvec );
    if( det < 0.0001f )
        return FALSE;

    // Calculate distance from vert0 to ray origin
    D3DXVECTOR3 tvec = orig - v0;

    // Calculate U parameter and test bounds
    *u = D3DXVec3Dot( &tvec, &pvec );
    if( *u < 0.0f || *u > det )
        return FALSE;

    // Prepare to test V parameter
    D3DXVECTOR3 qvec;
    D3DXVec3Cross( &qvec, &tvec, &edge1 );

    // Calculate V parameter and test bounds
    *v = D3DXVec3Dot( &dir, &qvec );
    if( *v < 0.0f || *u + *v > det )
        return FALSE;

    // Calculate t, scale parameters, ray intersects triangle
    *t = D3DXVec3Dot( &edge2, &qvec );
    FLOAT fInvDet = 1.0f / det;
    *t *= fInvDet;
    *u *= fInvDet;
    *v *= fInvDet;

    return TRUE;
}
/*
//====================================================================================== 
// Name : ScrToRay
// Desc : Convert Screen Cursor to Ray
//======================================================================================
HRESULT Ray::ScrToRay( int ptCursorX, int ptCursorY, int Width, int Height, 
  						            CCamera* pCamera, 
							        // Out
							        D3DXVECTOR3 *vRayOrigin, D3DXVECTOR3 *vRayDir )
{
	D3DXMATRIX matProj = pCamera->GetProjMatrix();
    D3DXVECTOR3 v;
    v.x =  ( ( ( 2.0f * ptCursorX ) / Width  ) - 1 ) / matProj._11;
    v.y = -( ( ( 2.0f * ptCursorY ) / Height ) - 1 ) / matProj._22;
    v.z =  1.0f;

	D3DXMATRIX matViewInv;
	D3DXMATRIX matView = pCamera->GetViewMatrix();
    D3DXMatrixInverse( &matViewInv, NULL, &matView );

	D3DXVECTOR3 vPickRayDir; 
    vPickRayDir.x  = v.x*matViewInv._11 + v.y*matViewInv._21 + v.z*matViewInv._31;
    vPickRayDir.y  = v.x*matViewInv._12 + v.y*matViewInv._22 + v.z*matViewInv._32;
    vPickRayDir.z  = v.x*matViewInv._13 + v.y*matViewInv._23 + v.z*matViewInv._33;

	D3DXVECTOR3 vPickRayOrig = pCamera->GetEyePt();
	*vRayOrigin = vPickRayOrig;
	*vRayDir    = vPickRayDir;

	Vec3::Normalize( vRayDir , &vPickRayDir );
	return S_OK;
}
*/
BOOL  Ray::v3ToScr ( const D3DXVECTOR3 *v3DPoint,  // Local Coordinate
								   const D3DXMATRIX  *MatWorld,
							       const D3DXMATRIX  *MatView,
							       const D3DXMATRIX  *MatProj,
								   const int ScreenWidth,
								   const int ScreenHeight,
							       // Out Put
								   int   *pScreenX,
								   int   *pScreenY,
								   float *pZ
							     )
{
	D3DXVECTOR4 v4DPoint = D3DXVECTOR4( v3DPoint->x,
										v3DPoint->y,
										v3DPoint->z,
										1 );
									
	D3DXVECTOR4 vOut;
	D3DXVec4Transform( &vOut,  &v4DPoint, MatWorld );
	D3DXVec4Transform( &vOut,  &vOut, MatView );
	
	if( vOut.z <= 0 ) 
	{
		return FALSE;
	}

	D3DXVec4Transform( &vOut,  &vOut, MatProj );

	vOut.x /= vOut.w;
	vOut.y /= vOut.w;
	vOut.z /= vOut.w;
	vOut.w /= vOut.w;

	if( ( vOut.z >= 0) && ( vOut.z <= 1 ) )
	{
		int MidX = ScreenWidth  / 2;
		int MidY = ScreenHeight / 2;
		
		// Assign Screen X
		if( pScreenX )
		{
			*pScreenX = MidX + int( vOut.x * float(ScreenWidth)/2 );
		}
		// Assign Screen Y
		if( pScreenY )
		{
			*pScreenY = MidY - int( vOut.y * float(ScreenHeight)/2 );
		}
		// Assign Z
		if( pZ )
		{
			*pZ = vOut.z;
		}

		return TRUE;
	}

	return FALSE;
}

//====================================================================
// Name : InSphere
// Desc : Check Vector pass in sphere
//====================================================================
BOOL   Ray::InSphere  ( // In
						  const D3DXVECTOR3*		 Center,
						  float fRadius,
  						  const D3DXMATRIX*       matWorld,

						  const D3DXVECTOR3&		 RayOrigin,
						  const D3DXVECTOR3&		 RayDirection,

						  float*   Distance
					   )
{

	D3DXVECTOR3 vU,vD, vCenter2,vCenter = (*Center) ;

    vCenter2.x  = vCenter.x*matWorld->_11 + vCenter.y*matWorld->_21 + vCenter.z*matWorld->_31 + matWorld->_41;
    vCenter2.y  = vCenter.x*matWorld->_12 + vCenter.y*matWorld->_22 + vCenter.z*matWorld->_32 + matWorld->_42;
    vCenter2.z  = vCenter.x*matWorld->_13 + vCenter.y*matWorld->_23 + vCenter.z*matWorld->_33 + matWorld->_43;

	
	vU.x = vCenter2.x - RayOrigin.x;
	vU.y = vCenter2.y - RayOrigin.y;
	vU.z = vCenter2.z - RayOrigin.z;

	D3DXVec3Normalize(&vD,&RayDirection);


	D3DXVec3Scale( &vD,&vD,D3DXVec3Dot(&vU,&vD)/D3DXVec3Length(&vD) );

	vD = vD - vU;

	float fDistance = D3DXVec3Length(&vD);

	if (Distance!=NULL) 
	{
		(*Distance) = fDistance;
	}

	return (fDistance <= fRadius );
}

BOOL Ray::InSphere( // In
						        float fXCenter,
						        float fYCenter,
								float fZCenter,
								float fRadius,
								const D3DXMATRIX*        matWorld,
								const D3DXVECTOR3&		 RayOrigin,
								const D3DXVECTOR3&		 RayDirection,

								float*   Distance
							)
{
	D3DXVECTOR3 vCenter;
	
	vCenter.x = fXCenter;
	vCenter.y = fYCenter;
	vCenter.z = fZCenter;

	return InSphere( &vCenter, fRadius, matWorld, RayOrigin, RayDirection, Distance );
}

BOOL  Ray::InArfVertices( // In
									    const D3DXVECTOR3& RayOrigin,
									    const D3DXVECTOR3& RayDirection, 
										const D3DXMATRIX*  matWorld,
									    float*             pVertices,
										unsigned int*      pIndices,
										int                NumFaces,
									    // Out
									    int*       pFaceIndex,
									    CTriangle* pTriangle,
									    FLOAT* pDistance, 
	  								    FLOAT* pU, 
									    FLOAT* pV )
{

    // Calculate Invert World Matrix
    D3DXMATRIX matWorldInv;
	Mat::Inverse( &matWorldInv, NULL, matWorld );

	// Inverse Ray Direction and Origin
	D3DXVECTOR3 vRayDirInv;
	D3DXVECTOR3 vRayOriginInv;

	// Rotate Inverse Ray Direction
    vRayDirInv.x  = RayDirection.x*matWorldInv._11 + RayDirection.y*matWorldInv._21 + RayDirection.z*matWorldInv._31;
    vRayDirInv.y  = RayDirection.x*matWorldInv._12 + RayDirection.y*matWorldInv._22 + RayDirection.z*matWorldInv._32;
    vRayDirInv.z  = RayDirection.x*matWorldInv._13 + RayDirection.y*matWorldInv._23 + RayDirection.z*matWorldInv._33;	

	// Inverse Ray Origin
	Vec3::MulMat( &vRayOriginInv, &RayOrigin,    &matWorldInv );

	BOOL bFound = FALSE;
	float MinDistance = 0;
	D3DXVECTOR3 _LocalV0, _LocalV1, _LocalV2;
	int _FaceIndex = -1;  
	float _U = 0.0f, _V = 0.0f;

    for( int i=0; i< NumFaces; i++ )
    {

		int i0 = pIndices[ (3*i) + 0 ] ;
		int i1 = pIndices[ (3*i) + 1 ] ;
		int i2 = pIndices[ (3*i) + 2 ] ;

		D3DXVECTOR3 tv0, tv1, tv2;
		tv0.x = pVertices[3*i0];
		tv0.y = pVertices[3*i0 + 1];
		tv0.z = pVertices[3*i0 + 2];

		tv1.x = pVertices[3*i1];
		tv1.y = pVertices[3*i1 + 1];
		tv1.z = pVertices[3*i1 + 2];

		tv2.x = pVertices[3*i2];
		tv2.y = pVertices[3*i2 + 1];
		tv2.z = pVertices[3*i2 + 2];
        
		float fPickU, fPickV;
		float TDistance;

        // Check if the ray passes through This Triangle
		if( Ray::InTriangle( vRayOriginInv, vRayDirInv, tv0, tv1, tv2,
							 &TDistance, &fPickU, &fPickV ) )
        {
			if( TDistance >= 0 )
			{
				if ( !bFound )
				{
					_FaceIndex  = i;
					_LocalV0	= tv0;
					_LocalV1	= tv1;
					_LocalV2	= tv2;
					MinDistance = TDistance;
					_U = fPickU;
					_V = fPickV;

				    bFound = TRUE;					
				}
				else
				{
				/*
					float _MinDistance = ( MinDistance >= 0 ) ? MinDistance : -MinDistance;
   					float _TDistance = ( TDistance >= 0 ) ? TDistance : -TDistance;
                */
					if( TDistance < MinDistance )
					{
						_FaceIndex  = i;
						_LocalV0	= tv0;
						_LocalV1	= tv1;
						_LocalV2	= tv2;
						MinDistance = TDistance;
						_U = fPickU;
						_V = fPickV;
					}
				}
			}
        }
    }

	// if Not found Return False
	if( !bFound ) 
	{
		return FALSE;
	}

	// Assign Face Index
	if( pFaceIndex != NULL )
	{
		*pFaceIndex = _FaceIndex;
	}

	// Assign Local Triangle
	if( pTriangle )
	{
		pTriangle->SetTriangle( _LocalV0, _LocalV1, _LocalV2 );
	}

	// Assign Distance
	if( pDistance != NULL )
	{
		*pDistance = MinDistance;
	}

	// Assign U and V
	if( pU != NULL )
	{
		*pU = _U;
	}	
	// Assign U and V
	if( pV != NULL )
	{
		*pV = _V;
	}	

	return TRUE;
}

BOOL Ray::InBlendArfVertices( // In
								const D3DXVECTOR3& RayOrigin,
								const D3DXVECTOR3& RayDirection, 
								const D3DXMATRIX*  matWorld,
								float*             pVertices1,
								float*             pVertices2,
								float              Factor, // 0.0f to 1.0f
								unsigned int*      pIndices,
								int                NumFaces,
								// Out
								int*       pFaceIndex,
								CTriangle* pTriangle,
								FLOAT* pDistance, 
	  							FLOAT* pU, 
								FLOAT* pV )
{
    // Calculate Invert World Matrix
    D3DXMATRIX matWorldInv;
	Mat::Inverse( &matWorldInv, NULL, matWorld );

	// Inverse Ray Direction and Origin
	D3DXVECTOR3 vRayDirInv;
	D3DXVECTOR3 vRayOriginInv;

	// Rotate Inverse Ray Direction
    vRayDirInv.x  = RayDirection.x*matWorldInv._11 + RayDirection.y*matWorldInv._21 + RayDirection.z*matWorldInv._31;
    vRayDirInv.y  = RayDirection.x*matWorldInv._12 + RayDirection.y*matWorldInv._22 + RayDirection.z*matWorldInv._32;
    vRayDirInv.z  = RayDirection.x*matWorldInv._13 + RayDirection.y*matWorldInv._23 + RayDirection.z*matWorldInv._33;	

	// Inverse Ray Origin
	Vec3::MulMat( &vRayOriginInv, &RayOrigin,    &matWorldInv );

	BOOL bFound = FALSE;
	float MinDistance = 0;
	D3DXVECTOR3 _LocalV0, _LocalV1, _LocalV2;
	int _FaceIndex = -1;  
	float _U = 0.0f, _V = 0.0f;

    for( int i=0; i< NumFaces; i++ )
    {

		int i0 = pIndices[ (3*i) + 0 ] ;
		int i1 = pIndices[ (3*i) + 1 ] ;
		int i2 = pIndices[ (3*i) + 2 ] ;

		D3DXVECTOR3 tv0, tv1, tv2;
		tv0.x = pVertices1[3*i0]     + Factor * ( pVertices2[3*i0] - pVertices1[3*i0] );
		tv0.y = pVertices1[3*i0 + 1] + Factor * ( pVertices2[3*i0+1] - pVertices1[3*i0+1] );
		tv0.z = pVertices1[3*i0 + 2] + Factor * ( pVertices2[3*i0+2] - pVertices1[3*i0+2] );

		tv1.x = pVertices1[3*i1]     + Factor * ( pVertices2[3*i1] - pVertices1[3*i1] );
		tv1.y = pVertices1[3*i1 + 1] + Factor * ( pVertices2[3*i1+1] - pVertices1[3*i1+1] );
		tv1.z = pVertices1[3*i1 + 2] + Factor * ( pVertices2[3*i1+2] - pVertices1[3*i1+2] );

		tv2.x = pVertices1[3*i2]     + Factor * ( pVertices2[3*i2] - pVertices1[3*i2] );
		tv2.y = pVertices1[3*i2 + 1] + Factor * ( pVertices2[3*i2+1] - pVertices1[3*i2+1] );;
		tv2.z = pVertices1[3*i2 + 2] + Factor * ( pVertices2[3*i2+2] - pVertices1[3*i2+2] );;
        
		float fPickU, fPickV;
		float TDistance;

        // Check if the ray passes through This Triangle
		if( Ray::InTriangle( vRayOriginInv, vRayDirInv, tv0, tv1, tv2,
							 &TDistance, &fPickU, &fPickV ) )
        {
			if( TDistance >= 0 )
			{
				if ( !bFound )
				{
					_FaceIndex  = i;
					_LocalV0	= tv0;
					_LocalV1	= tv1;
					_LocalV2	= tv2;
					MinDistance = TDistance;
					_U = fPickU;
					_V = fPickV;

				    bFound = TRUE;					
				}
				else
				{
				/*
					float _MinDistance = ( MinDistance >= 0 ) ? MinDistance : -MinDistance;
   					float _TDistance = ( TDistance >= 0 ) ? TDistance : -TDistance;
                */
					if( TDistance < MinDistance )
					{
						_FaceIndex  = i;
						_LocalV0	= tv0;
						_LocalV1	= tv1;
						_LocalV2	= tv2;
						MinDistance = TDistance;
						_U = fPickU;
						_V = fPickV;
					}
				}
			}
        }
    }

	// if Not found Return False
	if( !bFound ) 
	{
		return FALSE;
	}

	// Assign Face Index
	if( pFaceIndex != NULL )
	{
		*pFaceIndex = _FaceIndex;
	}

	// Assign Local Triangle
	if( pTriangle )
	{
		pTriangle->SetTriangle( _LocalV0, _LocalV1, _LocalV2 );
	}

	// Assign Distance
	if( pDistance != NULL )
	{
		*pDistance = MinDistance;
	}

	// Assign U and V
	if( pU != NULL )
	{
		*pU = _U;
	}	
	// Assign U and V
	if( pV != NULL )
	{
		*pV = _V;
	}	

	return TRUE;
}

float Tool::GetDistance( float px1, float py1, float pz1,
		                 float px2, float py2, float pz2 )
{
	return float( sqrt ( ( px2 - px1 )*( px2 - px1 ) +
					( py2 - py1 )*( py2 - py1 ) +
					( pz2 - pz1 )*( pz2 - pz1 ) ) );
}

//============================================================================
// Vec3
//============================================================================
// Dot Product
float Vec3::Dot( CONST D3DXVECTOR3* pV1, CONST D3DXVECTOR3* pV2 )
{
	return D3DXVec3Dot( pV1, pV2 );
}

// Cross Product
D3DXVECTOR3* Vec3::Cross( D3DXVECTOR3* pOut, CONST D3DXVECTOR3* pV1, CONST D3DXVECTOR3* pV2 )
{
	return D3DXVec3Cross( pOut, pV1, pV2 ); 
}

// Length of Vector
float Vec3::Length( CONST D3DXVECTOR3* pV )
{
	return D3DXVec3Length( pV );
}

// Length^2 of Vector
float Vec3::LengthSq( CONST D3DXVECTOR3* pV )
{
	return D3DXVec3LengthSq( pV );
}

// Convert to Unit Vector
D3DXVECTOR3* Vec3::Normalize( D3DXVECTOR3* pOut, CONST D3DXVECTOR3* pV )
{
	return D3DXVec3Normalize( pOut, pV );
}

// Interpolate Vector with Blend factor
D3DXVECTOR3*   Vec3::Lerp( D3DXVECTOR3* pOut, CONST D3DXVECTOR3* pV1, CONST D3DXVECTOR3* pV2, FLOAT s )
{
	return D3DXVec3Lerp( pOut, pV1, pV2, s );
}

// Return Angle of Vector in Degree
double Vec3::RetAngleDeg(const D3DXVECTOR3* pV1, const D3DXVECTOR3* pV2)
{
	float LV1 = D3DXVec3Length( pV1 );
	float LV2 = D3DXVec3Length( pV2 );

	//====================================================
    #ifdef _DEBUG
	if( (LV1 == 0) || (LV2 == 0) )
	{
		TRACE("ERROR In Vec3::RetAngleDeg");
		ASSERT(	FALSE );
	}
	#endif
	//====================================================

	float DotProduct = D3DXVec3Dot( pV1, pV2 );
	double CosZetha = DotProduct/(LV1 * LV2);

	return D3DXToDegree( Math::ACosf( CosZetha ) );
};        

// Calculate Zetha Phi in Degree
HRESULT Vec3::CalZethaPhiDeg( const D3DXVECTOR3* pV,
											// Out
											double* Zetha, double* Phi )
{
	// Calculate Phi
	*Phi = Vec3::RetAngleDeg( &cs::vY, pV );
    if( (*Phi == 0.0) || (*Phi == 180.0) )
	{
		*Zetha = 0.0;
		return S_OK;
	}
	
	// Shadow in XZ Plane
	D3DXVECTOR3 pV_XZPlane = D3DXVECTOR3( pV->x, 0, pV->z );
	double Angle = Vec3::RetAngleDeg( &cs::vZ, &pV_XZPlane );
	
	if (pV_XZPlane.x >= 0)
	{
		*Zetha = Angle;
		return S_OK;
	}
	else
	{
		*Zetha = 360 - Angle;
		return S_OK;
	}

	return S_OK;	
}

// Calculate Normal Vec
HRESULT Vec3::CalNVec( D3DXVECTOR3* pVOut,
									 // Input	
									 const D3DXVECTOR3* v0,
									 const D3DXVECTOR3* v1,
		  							 const D3DXVECTOR3* v2 )
{
	//====================================================
    #ifdef _DEBUG
		D3DXVECTOR3 e1 = *v1 - *v0;
		D3DXVECTOR3 e2 = *v2 - *v0;
		D3DXVECTOR3 e3 = *v1 - *v2;
		float d1 = D3DXVec3Length( &e1 );
		float d2 = D3DXVec3Length( &e2 );
		float d3 = D3DXVec3Length( &e3 );
		if( (d1 == 0.0f) || (d1 == 0.0f) || (d1 == 0.0f) )
		{
			TRACE("ERROR In Vec3::CalNVec");
			ASSERT(	FALSE );
		}
	#endif
	//====================================================

    D3DXVECTOR3 edge1 = *v1 - *v0;
    D3DXVECTOR3 edge2 = *v2 - *v0;
	D3DXVECTOR3 vTmp;

    D3DXVec3Cross( &vTmp, &edge1, &edge2 );
	D3DXVec3Normalize( pVOut, &vTmp );
	return S_OK;
}

HRESULT Vec3::MulMat( D3DXVECTOR3* pVOut, const D3DXVECTOR3* pVIn, const D3DXMATRIX* pMat )
{
    pVOut->x  = pVIn->x*pMat->_11 + pVIn->y*pMat->_21 + pVIn->z*pMat->_31 + pMat->_41;
    pVOut->y  = pVIn->x*pMat->_12 + pVIn->y*pMat->_22 + pVIn->z*pMat->_32 + pMat->_42;
    pVOut->z  = pVIn->x*pMat->_13 + pVIn->y*pMat->_23 + pVIn->z*pMat->_33 + pMat->_43;	
	return S_OK;
}

HRESULT Vec3::MulMatRot( D3DXVECTOR3* pVOut, const D3DXVECTOR3* pVIn, const D3DXMATRIX* pMat )
{
    pVOut->x  = pVIn->x*pMat->_11 + pVIn->y*pMat->_21 + pVIn->z*pMat->_31;
    pVOut->y  = pVIn->x*pMat->_12 + pVIn->y*pMat->_22 + pVIn->z*pMat->_32;
    pVOut->z  = pVIn->x*pMat->_13 + pVIn->y*pMat->_23 + pVIn->z*pMat->_33;	
	return S_OK;
}

//===============================================================================================
//	Mat
//===============================================================================================
float Mat::Det( CONST D3DXMATRIX *pM )
{
	return D3DXMatrixfDeterminant( pM );
}

D3DXMATRIX* Mat::Mul( D3DXMATRIX *pOut, CONST D3DXMATRIX *pM1, CONST D3DXMATRIX *pM2 )
{
	return D3DXMatrixMultiply( pOut, pM1, pM2 );
}

D3DXMATRIX* Mat::Transpose( D3DXMATRIX *pOut, CONST D3DXMATRIX *pM )
{
	return D3DXMatrixTranspose( pOut, pM );
}

D3DXMATRIX* Mat::Inverse( D3DXMATRIX *pOut, FLOAT *pDeterminant, CONST D3DXMATRIX *pM )
{
	return D3DXMatrixInverse( pOut, pDeterminant, pM );
}

D3DXMATRIX* Mat::Scaling( D3DXMATRIX *pOut, FLOAT sx, FLOAT sy, FLOAT sz )
{
	return D3DXMatrixScaling( pOut, sx, sy, sz );
}

D3DXMATRIX* Mat::Translation( D3DXMATRIX *pOut, FLOAT x, FLOAT y, FLOAT z )
{
	return D3DXMatrixTranslation( pOut, x, y, z );
}

D3DXMATRIX* Mat::RotX( D3DXMATRIX *pOut, FLOAT Angle )
{
	return D3DXMatrixRotationX( pOut, Angle );
}

D3DXMATRIX* Mat::RotY( D3DXMATRIX *pOut, FLOAT Angle )
{
	return D3DXMatrixRotationY( pOut, Angle );
}

D3DXMATRIX* Mat::RotZ( D3DXMATRIX *pOut, FLOAT Angle )
{
	return D3DXMatrixRotationZ( pOut, Angle );
}

D3DXMATRIX* Mat::RotAxis( D3DXMATRIX *pOut, CONST D3DXVECTOR3 *pV, FLOAT Angle )
{
	return D3DXMatrixRotationAxis( pOut, pV, Angle );
}

// Calculate Normal Matrix
HRESULT Mat::CalNMat( D3DXMATRIX* pMatOut, const D3DXVECTOR3* pVNormal )
{
	/*
	// Calculate Cross Product
	D3DXVECTOR3 vCross;
	D3DXVec3Cross( &vCross, &cs::vY, pVNormal );
	
	double Angle = 0;
	Angle = Vec3::RetAngleDeg( &cs::vY, pVNormal );

	D3DXMatrixRotationAxis( pMatOut, &(vCross), D3DXToRadian( float(Angle) ) );
	return S_OK;
	*/

	D3DXVECTOR3 vCross;
	double Angle = 0;

	D3DXVECTOR3 vNormalNormalize;
	Vec3::Normalize( &vNormalNormalize, pVNormal );

	if( vNormalNormalize == -cs::vY )
	{
		vCross = cs::vX;
		Angle  = 180.0f;
	}
	else
	{
		D3DXVec3Cross( &vCross, &cs::vY, pVNormal );
		Angle = Vec3::RetAngleDeg( &cs::vY, pVNormal );
	}

	D3DXMatrixRotationAxis( pMatOut, &(vCross), D3DXToRadian( float(Angle) ) );
	return S_OK;
}

// Calculate Front Matrix
HRESULT Mat::CalFMat( D3DXMATRIX* pMatOut, const D3DXVECTOR3* pVFront )
{
/*
	// Calculate Cross Product
	D3DXVECTOR3 vCross;
	D3DXVec3Cross( &vCross, &cs::vZ, pVFront );
	
	double Angle = 0;
	Angle = Vec3::RetAngleDeg( &cs::vZ, pVFront );

	D3DXMatrixRotationAxis( pMatOut, &(vCross), D3DXToRadian( float(Angle) ) );
	return S_OK;
*/

	// Calculate Cross Product
	D3DXVECTOR3 vCross;
	double Angle = 0;

	D3DXVECTOR3 vFrontNormalize;
	Vec3::Normalize( &vFrontNormalize, pVFront );

	if( vFrontNormalize == -cs::vZ )
	{
		vCross = cs::vX;
		Angle  = 180.0f;
	}
	else
	{
		D3DXVec3Cross( &vCross, &cs::vZ, pVFront );
		Angle = Vec3::RetAngleDeg( &cs::vZ, pVFront );
	}

	D3DXMatrixRotationAxis( pMatOut, &(vCross), D3DXToRadian( float(Angle) ) );
	return S_OK;
}

// Calculate Cross Matrix
HRESULT Mat::CalCMat( D3DXMATRIX* pMatOut, const D3DXVECTOR3* pVCross )
{
	// Calculate Cross Product
	D3DXVECTOR3 vCross;
	D3DXVec3Cross( &vCross, &cs::vX, pVCross );
	
	double Angle = 0;
	Angle = Vec3::RetAngleDeg( &cs::vX, pVCross );

	D3DXMatrixRotationAxis( pMatOut, &(vCross), D3DXToRadian( float(Angle) ) );
	return S_OK;
}

D3DXMATRIX* Mat::Identity( D3DXMATRIX* pOut )
{
	return D3DXMatrixIdentity( pOut );
}

CString String::Token(const char *String, int WordIndex, char *strSeps)
{
	// Check Index
	if ( WordIndex <= 0 ) return "";

	// New String
	char *tmpString = new char[strlen(String) + 1];
	strcpy( tmpString , String );

	// Token
    char *strToken = strtok( tmpString, strSeps );

	int i = 1;
	while( ( strToken != NULL ) && ( i < WordIndex ) ) 
    {
        strToken = strtok( NULL, strSeps );
		i++;
    }

	// String Return
	CString strReturn;

	// Check if NULL
	if ( strToken != NULL )
	{
		strReturn = strToken;
	}

	// Delete tmpString and Return
	delete [] tmpString;
	return strReturn;
}

bool String::IsInString( char *string, const char *search ) 
{
	int pos=0;
	int maxpos=strlen(search)-1;
	int len=strlen(string);	
	char *other;
	for (int i=0; i<len; i++) {
		if ((i==0) || ((i>1) && string[i-1]=='\n')) {				// New Extension Begins Here!
			other=&string[i];			
			pos=0;													// Begin New Search
			while (string[i]!='\n') {								// Search Whole Extension-String
				if (string[i]==search[pos]) pos++;					// Next Position
				if ((pos>maxpos) && string[i+1]=='\n') return true; // We Have A Winner!
				i++;
			}			
		}
	}	
	return false;													// Sorry, Not Found!
}

// Tool
void Tool::CalBoundSphere( float* pVertices, int numVertices,
		                   // Out
						   float *pcx, float *pcy, float *pcz, // Center
						   float *pr )
{

	// Find Center
	float SumX = 0.0f;
	float SumY = 0.0f;
	float SumZ = 0.0f;

	for( int i = 0; i <numVertices; i++ )
	{
		float x = pVertices[ 3*i + 0 ];
		float y = pVertices[ 3*i + 1 ];
		float z = pVertices[ 3*i + 2 ];

		SumX += x;
		SumY += y;
		SumZ += z;
	}

	float cx = SumX / numVertices;
	float cy = SumY / numVertices;
	float cz = SumZ / numVertices;

	*pcx = cx;
	*pcy = cy;
	*pcz = cz;

	// Find Radius
	float MaxR = 0.0f;
	i = 0;
	for( i = 0; i <numVertices; i++ )
	{
		float x = pVertices[ 3*i + 0 ];
		float y = pVertices[ 3*i + 1 ];
		float z = pVertices[ 3*i + 2 ];
		
		float TmpR = float( sqrt( (cx-x) * (cx-x) +
			                      (cy-y) * (cy-y) +
						          (cz-z) * (cz-z) ) );

		if( TmpR > MaxR ) 
		{
			MaxR = TmpR;
		}
	}	

	*pr = MaxR;
}

void Tool::CalBoundSphere( float *pVertices, int numVertices,
						   // Out
					       D3DXVECTOR3 *pvCenter,
					       float *pr )
{
	float cx, cy, cz;
	float r;
	CalBoundSphere( pVertices, numVertices,
		           // Out
				   &cx, &cy, &cz, // Center
				   &r );
	*pr = r;
	pvCenter->x = cx;
	pvCenter->y = cy;
	pvCenter->z = cz;
}

void Tool::GetPointFromTriangleUV( const CTriangle& Triangle, 
		                           float U, float V,
								   // Out
								   float* pX, float* pY, float* pZ )
{
	D3DXVECTOR3 v0 = Triangle.GetV0();
	D3DXVECTOR3 v1 = Triangle.GetV1();
	D3DXVECTOR3 v2 = Triangle.GetV2();

	D3DXVECTOR3 Vec1 = D3DXVECTOR3( v1.x - v0.x,
									v1.y - v0.y,
									v1.z - v0.z );

	D3DXVECTOR3 Vec2 = D3DXVECTOR3( v2.x - v0.x,
									v2.y - v0.y,
									v2.z - v0.z );

	if( pX )
	{
		*pX = v0.x + U*Vec1.x + V*Vec2.x;
	}
	if( pY )
	{
		*pY = v0.y + U*Vec1.y + V*Vec2.y;
	}
	if( pZ )
	{
		*pZ = v0.z + U*Vec1.z + V*Vec2.z;
	}
}

void Tool::RenderBlend( float *pVertices0, float *pVertices1,
						float *pTexCoord0, float *pTexCoord1,
						float fBPos, float fBUV,
						unsigned int *pIndices,     
						int           NumFaces,
						float        *pVertexColor,
						BOOL   bBlendPosition, BOOL bBlendUV )
{
	if ( pVertexColor ) // Use Vertex Color
	{
		// No Blend
		if( !bBlendPosition && !bBlendUV )
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				int startTIndex = 6*i;

				glTexCoord2f( pTexCoord0[startTIndex+0], pTexCoord0[startTIndex+1] );
				glColor3fv( &pVertexColor[3*i0] );
				glVertex3f( pVertices0[3*i0], pVertices0[3*i0+1], pVertices0[3*i0+2] );

				glTexCoord2f( pTexCoord0[startTIndex+2], pTexCoord0[startTIndex+3] );
				glColor3fv( &pVertexColor[3*i1] );
				glVertex3f( pVertices0[3*i1], pVertices0[3*i1+1], pVertices0[3*i1+2] );

				glTexCoord2f( pTexCoord0[startTIndex+4], pTexCoord0[startTIndex+5] );
				glColor3fv( &pVertexColor[3*i2] );
				glVertex3f( pVertices0[3*i2], pVertices0[3*i2+1], pVertices0[3*i2+2] );
			}
			glEnd();
		}
		// Blend Only Position
		else if( bBlendPosition && !bBlendUV ) 
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				// UV Not Blend
				int   startTIndex = 6*i;
				float TU0 = pTexCoord0[startTIndex+0];
				float TV0 = pTexCoord0[startTIndex+1];

				float TU1 = pTexCoord0[startTIndex+2];
				float TV1 = pTexCoord0[startTIndex+3]; 

				float TU2 = pTexCoord0[startTIndex+4];
				float TV2 = pTexCoord0[startTIndex+5]; 

				// Position Blend
				float PX0 = pVertices0[3*i0]   + fBPos * ( pVertices1[3*i0]   - pVertices0[3*i0] );   
				float PY0 = pVertices0[3*i0+1] + fBPos * ( pVertices1[3*i0+1] - pVertices0[3*i0+1] );
				float PZ0 = pVertices0[3*i0+2] + fBPos * ( pVertices1[3*i0+2] - pVertices0[3*i0+2] );

				float PX1 = pVertices0[3*i1]   + fBPos * ( pVertices1[3*i1]   - pVertices0[3*i1] );   
				float PY1 = pVertices0[3*i1+1] + fBPos * ( pVertices1[3*i1+1] - pVertices0[3*i1+1] );
				float PZ1 = pVertices0[3*i1+2] + fBPos * ( pVertices1[3*i1+2] - pVertices0[3*i1+2] );

				float PX2 = pVertices0[3*i2]   + fBPos * ( pVertices1[3*i2]   - pVertices0[3*i2] );   
				float PY2 = pVertices0[3*i2+1] + fBPos * ( pVertices1[3*i2+1] - pVertices0[3*i2+1] );
				float PZ2 = pVertices0[3*i2+2] + fBPos * ( pVertices1[3*i2+2] - pVertices0[3*i2+2] );

				glTexCoord2f( TU0, TV0 );
				glColor3fv( &pVertexColor[3*i0] );
				glVertex3f( PX0, PY0, PZ0 );

				glTexCoord2f( TU1, TV1 );
				glColor3fv( &pVertexColor[3*i1] );
				glVertex3f( PX1, PY1, PZ1 );

				glTexCoord2f( TU2, TV2 );
				glColor3fv( &pVertexColor[3*i2] );
				glVertex3f( PX2, PY2, PZ2 );
			}
			glEnd();
		}
		// Blend Only UV
		else if( !bBlendPosition && bBlendUV ) 
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				// UV Blend
				int   startTIndex = 6*i;
				float TU0 = pTexCoord0[startTIndex+0] + fBUV * ( pTexCoord1[startTIndex+0] - pTexCoord0[startTIndex+0] );
				float TV0 = pTexCoord0[startTIndex+1] + fBUV * ( pTexCoord1[startTIndex+1] - pTexCoord0[startTIndex+1] );

				float TU1 = pTexCoord0[startTIndex+2] + fBUV * ( pTexCoord1[startTIndex+2] - pTexCoord0[startTIndex+2] );
				float TV1 = pTexCoord0[startTIndex+3] + fBUV * ( pTexCoord1[startTIndex+3] - pTexCoord0[startTIndex+3] ); 

				float TU2 = pTexCoord0[startTIndex+4] + fBUV * ( pTexCoord1[startTIndex+4] - pTexCoord0[startTIndex+4] );
				float TV2 = pTexCoord0[startTIndex+5] + fBUV * ( pTexCoord1[startTIndex+5] - pTexCoord0[startTIndex+5] ); 

				// Position Not Blend
				float PX0 = pVertices0[3*i0];   
				float PY0 = pVertices0[3*i0+1];
				float PZ0 = pVertices0[3*i0+2];

				float PX1 = pVertices0[3*i1];   
				float PY1 = pVertices0[3*i1+1];
				float PZ1 = pVertices0[3*i1+2];

				float PX2 = pVertices0[3*i2];   
				float PY2 = pVertices0[3*i2+1];
				float PZ2 = pVertices0[3*i2+2];

				glTexCoord2f( TU0, TV0 );
				glColor3fv( &pVertexColor[3*i0] );
				glVertex3f( PX0, PY0, PZ0 );

				glTexCoord2f( TU1, TV1 );
				glColor3fv( &pVertexColor[3*i1] );
				glVertex3f( PX1, PY1, PZ1 );

				glTexCoord2f( TU2, TV2 );
				glColor3fv( &pVertexColor[3*i2] );
				glVertex3f( PX2, PY2, PZ2 );
			}
			glEnd();
		}
		// Blend Position and UV
		else if( bBlendPosition && bBlendUV )  
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				// UV Blend
				int   startTIndex = 6*i;
				float TU0 = pTexCoord0[startTIndex+0] + fBUV * ( pTexCoord1[startTIndex+0] - pTexCoord0[startTIndex+0] );
				float TV0 = pTexCoord0[startTIndex+1] + fBUV * ( pTexCoord1[startTIndex+1] - pTexCoord0[startTIndex+1] );

				float TU1 = pTexCoord0[startTIndex+2] + fBUV * ( pTexCoord1[startTIndex+2] - pTexCoord0[startTIndex+2] );
				float TV1 = pTexCoord0[startTIndex+3] + fBUV * ( pTexCoord1[startTIndex+3] - pTexCoord0[startTIndex+3] ); 

				float TU2 = pTexCoord0[startTIndex+4] + fBUV * ( pTexCoord1[startTIndex+4] - pTexCoord0[startTIndex+4] );
				float TV2 = pTexCoord0[startTIndex+5] + fBUV * ( pTexCoord1[startTIndex+5] - pTexCoord0[startTIndex+5] ); 

				// Position Blend
				float PX0 = pVertices0[3*i0]   + fBPos * ( pVertices1[3*i0]   - pVertices0[3*i0] );   
				float PY0 = pVertices0[3*i0+1] + fBPos * ( pVertices1[3*i0+1] - pVertices0[3*i0+1] );
				float PZ0 = pVertices0[3*i0+2] + fBPos * ( pVertices1[3*i0+2] - pVertices0[3*i0+2] );

				float PX1 = pVertices0[3*i1]   + fBPos * ( pVertices1[3*i1]   - pVertices0[3*i1] );   
				float PY1 = pVertices0[3*i1+1] + fBPos * ( pVertices1[3*i1+1] - pVertices0[3*i1+1] );
				float PZ1 = pVertices0[3*i1+2] + fBPos * ( pVertices1[3*i1+2] - pVertices0[3*i1+2] );

				float PX2 = pVertices0[3*i2]   + fBPos * ( pVertices1[3*i2]   - pVertices0[3*i2] );   
				float PY2 = pVertices0[3*i2+1] + fBPos * ( pVertices1[3*i2+1] - pVertices0[3*i2+1] );
				float PZ2 = pVertices0[3*i2+2] + fBPos * ( pVertices1[3*i2+2] - pVertices0[3*i2+2] );

				glTexCoord2f( TU0, TV0 );
				glColor3fv( &pVertexColor[3*i0] );
				glVertex3f( PX0, PY0, PZ0 );

				glTexCoord2f( TU1, TV1 );
				glColor3fv( &pVertexColor[3*i1] );
				glVertex3f( PX1, PY1, PZ1 );

				glTexCoord2f( TU2, TV2 );
				glColor3fv( &pVertexColor[3*i2] );
				glVertex3f( PX2, PY2, PZ2 );
			}
			glEnd();
		}
	}
	else // Not Use Vertex Color
	{
		// Not Blend
		if( !bBlendPosition && !bBlendUV ) 
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				int startTIndex = 6*i;

				glTexCoord2f( pTexCoord0[startTIndex+0], pTexCoord0[startTIndex+1] );
				glVertex3f( pVertices0[3*i0], pVertices0[3*i0+1], pVertices0[3*i0+2] );

				glTexCoord2f( pTexCoord0[startTIndex+2], pTexCoord0[startTIndex+3] );
				glVertex3f( pVertices0[3*i1], pVertices0[3*i1+1], pVertices0[3*i1+2] );

				glTexCoord2f( pTexCoord0[startTIndex+4], pTexCoord0[startTIndex+5] );
				glVertex3f( pVertices0[3*i2], pVertices0[3*i2+1], pVertices0[3*i2+2] );
			}
			glEnd();
		}
		// Blend Only Position
		else if( bBlendPosition && !bBlendUV )
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				// UV Not Blend
				int   startTIndex = 6*i;
				float TU0 = pTexCoord0[startTIndex+0];
				float TV0 = pTexCoord0[startTIndex+1];

				float TU1 = pTexCoord0[startTIndex+2];
				float TV1 = pTexCoord0[startTIndex+3]; 

				float TU2 = pTexCoord0[startTIndex+4];
				float TV2 = pTexCoord0[startTIndex+5]; 

				// Position Blend
				float PX0 = pVertices0[3*i0]   + fBPos * ( pVertices1[3*i0]   - pVertices0[3*i0] );   
				float PY0 = pVertices0[3*i0+1] + fBPos * ( pVertices1[3*i0+1] - pVertices0[3*i0+1] );
				float PZ0 = pVertices0[3*i0+2] + fBPos * ( pVertices1[3*i0+2] - pVertices0[3*i0+2] );

				float PX1 = pVertices0[3*i1]   + fBPos * ( pVertices1[3*i1]   - pVertices0[3*i1] );   
				float PY1 = pVertices0[3*i1+1] + fBPos * ( pVertices1[3*i1+1] - pVertices0[3*i1+1] );
				float PZ1 = pVertices0[3*i1+2] + fBPos * ( pVertices1[3*i1+2] - pVertices0[3*i1+2] );

				float PX2 = pVertices0[3*i2]   + fBPos * ( pVertices1[3*i2]   - pVertices0[3*i2] );   
				float PY2 = pVertices0[3*i2+1] + fBPos * ( pVertices1[3*i2+1] - pVertices0[3*i2+1] );
				float PZ2 = pVertices0[3*i2+2] + fBPos * ( pVertices1[3*i2+2] - pVertices0[3*i2+2] );

				glTexCoord2f( TU0, TV0 );
				glVertex3f( PX0, PY0, PZ0 );

				glTexCoord2f( TU1, TV1 );
				glVertex3f( PX1, PY1, PZ1 );

				glTexCoord2f( TU2, TV2 );
				glVertex3f( PX2, PY2, PZ2 );
			}
			glEnd();

		}
		// Blend Only UV
		else if( !bBlendPosition && bBlendUV ) 
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				// UV Blend
				int   startTIndex = 6*i;
				float TU0 = pTexCoord0[startTIndex+0] + fBUV * ( pTexCoord1[startTIndex+0] - pTexCoord0[startTIndex+0] );
				float TV0 = pTexCoord0[startTIndex+1] + fBUV * ( pTexCoord1[startTIndex+1] - pTexCoord0[startTIndex+1] );

				float TU1 = pTexCoord0[startTIndex+2] + fBUV * ( pTexCoord1[startTIndex+2] - pTexCoord0[startTIndex+2] );
				float TV1 = pTexCoord0[startTIndex+3] + fBUV * ( pTexCoord1[startTIndex+3] - pTexCoord0[startTIndex+3] ); 

				float TU2 = pTexCoord0[startTIndex+4] + fBUV * ( pTexCoord1[startTIndex+4] - pTexCoord0[startTIndex+4] );
				float TV2 = pTexCoord0[startTIndex+5] + fBUV * ( pTexCoord1[startTIndex+5] - pTexCoord0[startTIndex+5] ); 

				// Position Not Blend
				float PX0 = pVertices0[3*i0];   
				float PY0 = pVertices0[3*i0+1];
				float PZ0 = pVertices0[3*i0+2];

				float PX1 = pVertices0[3*i1];   
				float PY1 = pVertices0[3*i1+1];
				float PZ1 = pVertices0[3*i1+2];

				float PX2 = pVertices0[3*i2];   
				float PY2 = pVertices0[3*i2+1];
				float PZ2 = pVertices0[3*i2+2];

				glTexCoord2f( TU0, TV0 );
				glVertex3f( PX0, PY0, PZ0 );

				glTexCoord2f( TU1, TV1 );
				glVertex3f( PX1, PY1, PZ1 );

				glTexCoord2f( TU2, TV2 );
				glVertex3f( PX2, PY2, PZ2 );
			}
			glEnd();
		}
		// Blend Position and UV
		else if( bBlendPosition && bBlendUV )  
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				// UV Blend
				int   startTIndex = 6*i;
				float TU0 = pTexCoord0[startTIndex+0] + fBUV * ( pTexCoord1[startTIndex+0] - pTexCoord0[startTIndex+0] );
				float TV0 = pTexCoord0[startTIndex+1] + fBUV * ( pTexCoord1[startTIndex+1] - pTexCoord0[startTIndex+1] );

				float TU1 = pTexCoord0[startTIndex+2] + fBUV * ( pTexCoord1[startTIndex+2] - pTexCoord0[startTIndex+2] );
				float TV1 = pTexCoord0[startTIndex+3] + fBUV * ( pTexCoord1[startTIndex+3] - pTexCoord0[startTIndex+3] ); 

				float TU2 = pTexCoord0[startTIndex+4] + fBUV * ( pTexCoord1[startTIndex+4] - pTexCoord0[startTIndex+4] );
				float TV2 = pTexCoord0[startTIndex+5] + fBUV * ( pTexCoord1[startTIndex+5] - pTexCoord0[startTIndex+5] ); 

				// Position Blend
				float PX0 = pVertices0[3*i0]   + fBPos * ( pVertices1[3*i0]   - pVertices0[3*i0] );   
				float PY0 = pVertices0[3*i0+1] + fBPos * ( pVertices1[3*i0+1] - pVertices0[3*i0+1] );
				float PZ0 = pVertices0[3*i0+2] + fBPos * ( pVertices1[3*i0+2] - pVertices0[3*i0+2] );

				float PX1 = pVertices0[3*i1]   + fBPos * ( pVertices1[3*i1]   - pVertices0[3*i1] );   
				float PY1 = pVertices0[3*i1+1] + fBPos * ( pVertices1[3*i1+1] - pVertices0[3*i1+1] );
				float PZ1 = pVertices0[3*i1+2] + fBPos * ( pVertices1[3*i1+2] - pVertices0[3*i1+2] );

				float PX2 = pVertices0[3*i2]   + fBPos * ( pVertices1[3*i2]   - pVertices0[3*i2] );   
				float PY2 = pVertices0[3*i2+1] + fBPos * ( pVertices1[3*i2+1] - pVertices0[3*i2+1] );
				float PZ2 = pVertices0[3*i2+2] + fBPos * ( pVertices1[3*i2+2] - pVertices0[3*i2+2] );

				glTexCoord2f( TU0, TV0 );
				glVertex3f( PX0, PY0, PZ0 );

				glTexCoord2f( TU1, TV1 );
				glVertex3f( PX1, PY1, PZ1 );

				glTexCoord2f( TU2, TV2 );
				glVertex3f( PX2, PY2, PZ2 );
			}
			glEnd();
		}
	}	
}

void Tool::RenderBlendAnimation(	CAnimation * pAnimation1 ,float fTime1,
									CAnimation * pAnimation2 ,float fTime2,
									float fBPos,float fBUV,
									BOOL bBlendPosition,
									BOOL bBlendUV
								  )
{
	CUseModelData * pModelData1 = pAnimation1->GetpModelData(fTime1);
	CUseModelData * pModelData2 = pAnimation2->GetpModelData(fTime2);

	if ( pModelData1 == NULL ) 
	{
		Log("function BlendAnimation Error !! pModelData1 = NULL");
		return;
	}

	if ( pModelData2 == NULL ) 
	{
		Log("function BlendAnimation Error !! pModelData2 = NULL");
		return;
	}


	// Bind Texture
	glBindTexture( GL_TEXTURE_2D, pModelData1->GetpTexture() );

	// Collect Inportance Data
	float *pVertices0 = pModelData1->GetpVertices();
	float *pVertices1 = pModelData2->GetpVertices();
	float *pTexCoord0 = pModelData1->GetpTexCoord();
	float *pTexCoord1 = pModelData2->GetpTexCoord();

	// 0 and 1 Same
	unsigned int *pIndices     = pModelData1->GetpIndices();
	float        *pVertexColor = (pModelData1->GetNumVertexColor() == 0)?
								  NULL : pModelData1->GetpVertexColor();
	int           NumFaces     = pModelData1->GetNumFaces();
	

	Tool::RenderBlend(	pVertices0,pVertices1,
						pTexCoord0,pTexCoord1, 
						fBPos,fBUV,
						pIndices,
						NumFaces,
						pVertexColor,
						bBlendPosition,
						bBlendUV);
}

void Tool::RenderBlendAnimation(	CUseAnimation * pAnimation1 ,float fTime1,
									CUseAnimation * pAnimation2 ,float fTime2,
									float fBPos,float fBUV,
									BOOL bBlendPosition ,
									BOOL bBlendUV 
								  )
{
	 RenderBlendAnimation(	pAnimation1->Get() , fTime1,
							pAnimation2->Get() , fTime2,
							fBPos, fBUV,
							bBlendPosition,
							bBlendUV
						  );
}

void Tool::PutSqrTexture3D ( CUseTexture *pUseTexture,
		                     // Position
							 float x, float y, float z,
							 float fSize, 
							 const D3DXVECTOR3* pvFront,
							 float Alpha ,
							 float Angle )
{
	CMovMat MovMat;
	MovMat.SetPosition( x, y, z );
	MovMat.SetScale( fSize, fSize, fSize );
	MovMat.SetDirVecMode( CMovMat::DV_FRONTVEC );
	MovMat.SetDirVec( pvFront );
	MovMat.SetRotation( float(Angle),
		 			    MovMat.CMovMat::Phi(),
						MovMat.CMovMat::Zetha() );

	GLGfx::SetMatWorld( MovMat.GetpMat() );
	glBindTexture( GL_TEXTURE_2D, pUseTexture->Get() );
	GLGfx::BeginDraw( GLDrawMode::QUADS );
		glTexCoord2f(0.0f, -0.0f);glVertex3f(  0.5f,  0.5f, 0.0f );
		glTexCoord2f(1.0f, -0.0f);glVertex3f( -0.5f,  0.5f, 0.0f );
		glTexCoord2f(1.0f, -1.0f);glVertex3f( -0.5f, -0.5f, 0.0f );
		glTexCoord2f(0.0f, -1.0f);glVertex3f(  0.5f, -0.5f, 0.0f );
	GLGfx::EndDraw();

}

void Tool::CastShadow( // Light Position
		               float* lp,        
					   // Object Data
		               float*             pVertices,
					   unsigned int*      pIndices,
					   int                NumFaces,
					   const D3DXMATRIX * pMatWorld )
{
	BOOL *pbLightVisible;
	pbLightVisible = new BOOL[NumFaces];

	for( int i = 0; i < NumFaces; i++ )
	{
		int i0 = pIndices[ (3*i) + 0 ] ;
		int i1 = pIndices[ (3*i) + 1 ] ;
		int i2 = pIndices[ (3*i) + 2 ] ;

		float v0x, v0y, v0z;
		float v1x, v1y, v1z;
		float v2x, v2y, v2z;
		v0x=pVertices[3*i0]; v0y=pVertices[3*i0+1]; v0z=pVertices[3*i0+2];
		v1x=pVertices[3*i1]; v1y=pVertices[3*i1+1]; v1z=pVertices[3*i1+2];
		v2x=pVertices[3*i2]; v2y=pVertices[3*i2+1]; v2z=pVertices[3*i2+2];
		
		float a,b,c,d;
		Tool::CalPlaneEquation( v0x, v0y, v0z,
								v1x, v1y, v1z,
								v2x, v2y, v2z,
								
								&a, &b, &c, &d ); 

		float side = a*lp[0]+b*lp[1]+c*lp[2]+d*lp[3];
		if (side >0)
		{
			pbLightVisible[i] = TRUE;
		}
		else 
		{
			pbLightVisible[i] = FALSE;
		}
	}

	SAFE_DELETE_ARRAY( pbLightVisible );

	//===========================================================================
 	glDisable(GL_LIGHTING);
	glDepthMask(GL_FALSE);
	glDepthFunc(GL_LEQUAL);

	
	glEnable(GL_STENCIL_TEST);
	glColorMask(0, 0, 0, 0);
	glStencilFunc(GL_ALWAYS, 1, 0xffffffff);

	// first pass, stencil operation decreases stencil value
	glFrontFace(GL_CCW);
	glStencilOp(GL_KEEP, GL_KEEP, GL_INCR);

	/*
	unsigned int	j, k, jj;
	unsigned int	p1, p2;

	
	for( i = 
	

	//===========================================================================
	unsigned int	j, k, jj;
	unsigned int	p1, p2;
	float			side;

 	glDisable(GL_LIGHTING);
	glDepthMask(GL_FALSE);
	glDepthFunc(GL_LEQUAL);

	
	glEnable(GL_STENCIL_TEST);
	glColorMask(0, 0, 0, 0);
	glStencilFunc(GL_ALWAYS, 1, 0xffffffff);

	// first pass, stencil operation decreases stencil value
	glFrontFace(GL_CCW);
	glStencilOp(GL_KEEP, GL_KEEP, GL_INCR);
	for (i=0; i<o->nPlanes; i++)
	{
		if (o->planes[i].visible)
		{
			for (j=0;j<3;j++)
			{
				float           v1x, v1y, v1z;
				float           v2x, v2y, v2z;

				// here we have an edge, we must draw a polygon
				p1 = o->planes[i].p[j];
				jj = (j+1)%3;
				p2 = o->planes[i].p[jj];

				//calculate the length of the vector
				v1x = (o->points[p1].x - lp[0])*100;
				v1y = (o->points[p1].y - lp[1])*100;
				v1z = (o->points[p1].z - lp[2])*100;

				v2x = (o->points[p2].x - lp[0])*100;
				v2y = (o->points[p2].y - lp[1])*100;
				v2z = (o->points[p2].z - lp[2])*100;
				
				//draw the polygon
				glBegin(GL_TRIANGLE_STRIP);
					glVertex3f(o->points[p1].x,
								o->points[p1].y,
								o->points[p1].z);
					glVertex3f(o->points[p1].x + v1.x,
								o->points[p1].y + v1.y,
								o->points[p1].z + v1.z);

					glVertex3f(o->points[p2].x,
								o->points[p2].y,
								o->points[p2].z);
					glVertex3f(o->points[p2].x + v2.x,
								o->points[p2].y + v2.y,
								o->points[p2].z + v2.z);
				glEnd();
			}
		}
	}
    

	
	// second pass, stencil operation increases stencil value
	glFrontFace(GL_CW);
	glStencilOp(GL_KEEP, GL_KEEP, GL_DECR);
	for (i=0; i<o->nPlanes;i++)
	{
		if (o->planes[i].visible)
		{
			for (j=0;j<3;j++)
			{

				// here we have an edge, we must draw a polygon
				p1 = o->planes[i].p[j];
				jj = (j+1)%3;
				p2 = o->planes[i].p[jj];

				//calculate the length of the vector
				v1.x = (o->points[p1].x - lp[0])*100;
				v1.y = (o->points[p1].y - lp[1])*100;
				v1.z = (o->points[p1].z - lp[2])*100;

				v2.x = (o->points[p2].x - lp[0])*100;
				v2.y = (o->points[p2].y - lp[1])*100;
				v2.z = (o->points[p2].z - lp[2])*100;
				
				//draw the polygon
				glBegin(GL_TRIANGLE_STRIP);
					glVertex3f(o->points[p1].x,
								o->points[p1].y,
								o->points[p1].z);
					glVertex3f(o->points[p1].x + v1.x,
								o->points[p1].y + v1.y,
								o->points[p1].z + v1.z);

					glVertex3f(o->points[p2].x,
								o->points[p2].y,
								o->points[p2].z);
					glVertex3f(o->points[p2].x + v2.x,
								o->points[p2].y + v2.y,
								o->points[p2].z + v2.z);
				glEnd();
			}
		}
	}
	
	glFrontFace(GL_CCW);
	glColorMask(1, 1, 1, 1);

	
	//draw a shadowing rectangle covering the entire screen
	glColor4f(0.0f, 0.0f, 0.0f, 0.4f);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glStencilFunc(GL_NOTEQUAL, 0, 0xffffffff);
	glStencilOp(GL_KEEP, GL_KEEP, GL_KEEP);
	glPushMatrix();
	glLoadIdentity();
	glBegin(GL_TRIANGLE_STRIP);
		glVertex3f(-0.1f, 0.1f,-0.10f);
		glVertex3f(-0.1f,-0.1f,-0.10f);
		glVertex3f( 0.1f, 0.1f,-0.10f);
		glVertex3f( 0.1f,-0.1f,-0.10f);
	glEnd();
	glPopMatrix();
	glDisable(GL_BLEND);

	glDepthFunc(GL_LEQUAL);
	glDepthMask(GL_TRUE);
	glEnable(GL_LIGHTING);
	glDisable(GL_STENCIL_TEST);
	glShadeModel(GL_SMOOTH);
	*/

}

void Tool::CalPlaneEquation( // In
							  float v0x, float v0y, float v0z,
		                      float v1x, float v1y, float v1z,
							  float v2x, float v2y, float v2z,
							  // Out
							  float *a,  float *b,  float *c, float *d )
{
	*a = v0y*(v1z-v2z) + v1y*(v2z-v0z) + v2y*(v0z-v1z);
	*b = v0z*(v1x-v2x) + v1z*(v2x-v0x) + v2z*(v0x-v1x);
	*c = v0x*(v1y-v2y) + v1x*(v2y-v0y) + v2x*(v0y-v1y);
	*d =-( v0x*(v1y*v2z - v2y*v1z) +
		   v1x*(v2y*v0z - v0y*v2z) +
		   v2x*(v0y*v1z - v1y*v0z) );
}

// Image
int Image::LoadTGAFile( const char *filename, TGAFILE *tgaFile )
{
	FILE *filePtr;          
	unsigned char ucharBad; 
	short int sintBad;
	long imageSize;
	int colorMode;
	long imageIdx;
	unsigned char colorSwap;

	// Open TGA file
	filePtr = fopen( filename, "rb" );
	if( !filePtr ) return 0;

	// read first two bytes of data we don't need
	fread( &ucharBad, sizeof(unsigned char), 1, filePtr );
	fread( &ucharBad, sizeof(unsigned char), 1, filePtr );

	// read in the image file
	fread( &tgaFile->imageTypeCode, sizeof(unsigned char), 1, filePtr );

	// image type is only 2 or 3 
	if( (tgaFile->imageTypeCode != 2) && (tgaFile->imageTypeCode != 3) )
	{
		fclose(filePtr);
		return 0;
	}
	
	// read 13 bytes of data we don't need
	fread( &sintBad, sizeof(short int), 1, filePtr );
	fread( &sintBad, sizeof(short int), 1, filePtr );
	fread( &ucharBad, sizeof(unsigned char), 1, filePtr );
	fread( &sintBad, sizeof(short int), 1, filePtr );
	fread( &sintBad, sizeof(short int), 1, filePtr );

	// read image dimensions
	fread( &tgaFile->imageWidth, sizeof(short int), 1, filePtr );
	fread( &tgaFile->imageHeight, sizeof(short int), 1, filePtr );

	// read image bit depth
	fread( &tgaFile->bitCount, sizeof(unsigned char), 1, filePtr );

	// read 1 byte of data we don't need
	fread( &ucharBad, sizeof(unsigned char), 1, filePtr );

	// colorMode -> 3 = BGR, 4 = BGRA
	colorMode = tgaFile->bitCount / 8;
	imageSize = tgaFile->imageWidth * tgaFile->imageHeight * colorMode;

	// Allocate memory for image data
	tgaFile->imageData = (unsigned char*)malloc( sizeof(unsigned char) * imageSize );

	// Read the Image Data
	fread( tgaFile->imageData, sizeof(unsigned char), imageSize, filePtr );

	// change bgr to rgb 
	for( imageIdx = 0; imageIdx < imageSize; imageIdx += colorMode )
	{
		colorSwap = tgaFile->imageData[imageIdx];
		tgaFile->imageData[imageIdx]     = tgaFile->imageData[imageIdx + 2];
		tgaFile->imageData[imageIdx + 2] = colorSwap; 
		//TRACE("Alpha = %d", tgaFile->imageData[imageIdx + 3] ); 
	}

	// close the file
	fclose(filePtr);
	
	return 1;
}

// Use in DrawPixel
// Use in only 32 Bit Format
int Image::LoadImageData( const char *filename, float *(&pfRGBA) )
{
	TGAFILE tgaFile;
	LoadTGAFile( filename, &tgaFile );
	ASSERT(tgaFile.bitCount / 8 == 4);	

	int Width  = tgaFile.imageWidth;
	int Height = tgaFile.imageHeight;
	unsigned char *puImageData = tgaFile.imageData;
	
	int Counter = 0;
	pfRGBA = new float[Width*Height*4];
	for( int i=0; i < Height; i++ )
	{
		for( int j=0; j<Width; j++ )
		{
			unsigned char *pNowPixel = puImageData + (4*((i*Width)+j));
			unsigned char R = pNowPixel[0];
			unsigned char G = pNowPixel[1];
			unsigned char B = pNowPixel[2];
			unsigned char A = pNowPixel[3];
			pfRGBA[Counter++] = float(R) / float(255);
			pfRGBA[Counter++] = float(G) / float(255);
			pfRGBA[Counter++] = float(B) / float(255);
			pfRGBA[Counter++] = float(A) / float(255);
		}
	}
	
	free( tgaFile.imageData );  
	return 1;
}

int Image::LoadDepthData( const char *filename, float *(&pfDepth) )
{
	TGAFILE tgaFile;
	LoadTGAFile( filename, &tgaFile );
	ASSERT(tgaFile.bitCount / 8 == 4);	

	int Width  = tgaFile.imageWidth;
	int Height = tgaFile.imageHeight;
	unsigned char *puImageData = tgaFile.imageData;
	
	int Counter = 0;
	pfDepth = new float[Width*Height];
	for( int i=0; i < Height; i++ )
	{
		for( int j=0; j<Width; j++ )
		{
			unsigned char *pNowPixel = puImageData + (4*((i*Width)+j));
			unsigned char R = pNowPixel[0];
			unsigned char G = pNowPixel[1];
			unsigned char B = pNowPixel[2];
			unsigned char A = pNowPixel[3];
			pfDepth[Counter++] = float(R) / float(255);
			/*
			pfRGBA[Counter++] = float(G) / float(255);
			pfRGBA[Counter++] = float(B) / float(255);
			pfRGBA[Counter++] = float(A) / float(255);
			*/
		}
	}
	
	free( tgaFile.imageData );  
	return 1;
}

// Port
BOOL   Port::m_bInitPort = FALSE;
HANDLE Port::m_hPort = NULL;
BOOL Port::InitPort()
{
	if( !m_bInitPort )
	{
		// DWORD dwThreadID;
		DWORD dwError;
		DCB PortDCB;
		COMMTIMEOUTS CommTimeouts;

		// Open the serial port.
		m_hPort = CreateFile("COM1", GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);

		// If it fails to open the port, return FALSE.
		if (m_hPort == INVALID_HANDLE_VALUE ) 
		{
		dwError = GetLastError ();
		return FALSE;
		}

		PortDCB.DCBlength = sizeof (DCB);     

		// Get the default port setting information.
		GetCommState (m_hPort, &PortDCB);

		// Change the DCB structure settings.
		PortDCB.BaudRate = 9600;              // Current baud 
		PortDCB.fBinary = TRUE;               // Binary mode; no EOF check 
		PortDCB.fParity = TRUE;               // Enable parity checking. 
		PortDCB.fOutxCtsFlow = FALSE;         // No CTS output flow control 
		PortDCB.fOutxDsrFlow = FALSE;         // No DSR output flow control 
		PortDCB.fDtrControl = DTR_CONTROL_ENABLE; 
											// DTR flow control type 
		PortDCB.fDsrSensitivity = FALSE;      // DSR sensitivity 
		PortDCB.fTXContinueOnXoff = TRUE;     // XOFF continues Tx 
		PortDCB.fOutX = FALSE;                // No XON/XOFF out flow control 
		PortDCB.fInX = FALSE;                 // No XON/XOFF in flow control 
		PortDCB.fErrorChar = FALSE;           // Disable error replacement. 
		PortDCB.fNull = FALSE;                // Disable null stripping. 
		PortDCB.fRtsControl = RTS_CONTROL_ENABLE; 
											// RTS flow control 
		PortDCB.fAbortOnError = FALSE;        // Do not abort reads/writes on 
											// error.
		PortDCB.ByteSize = 8;                 // Number of bits/bytes, 4-8 
		PortDCB.Parity = NOPARITY;            // 0-4=no,odd,even,mark,space 
		PortDCB.StopBits = ONESTOPBIT;        // 0,1,2 = 1, 1.5, 2 

		// Configure the port according to the specifications of the DCB 
		// structure.
		if (!SetCommState (m_hPort, &PortDCB))
		{
		// Could not configure the serial port.
		dwError = GetLastError ();
		return FALSE;
		}

		// Retrieve the time-out parameters for all read and write operations
		// on the port. 
		GetCommTimeouts (m_hPort, &CommTimeouts);

		// Change the COMMTIMEOUTS structure settings.
		CommTimeouts.ReadIntervalTimeout = MAXDWORD;  
		CommTimeouts.ReadTotalTimeoutMultiplier = 0;  
		CommTimeouts.ReadTotalTimeoutConstant = 0;    
		CommTimeouts.WriteTotalTimeoutMultiplier = 10;  
		CommTimeouts.WriteTotalTimeoutConstant = 1000;    

		// Set the time-out parameters for all read and write operations
		// on the port. 
		if (!SetCommTimeouts (m_hPort, &CommTimeouts))
		{
		// Could not set the time-out parameters.
		dwError = GetLastError ();
		return FALSE;
		}

		// Direct the port to perform extended functions SETDTR and SETRTS.
		// SETDTR: Sends the DTR (data-terminal-ready) signal.
		// SETRTS: Sends the RTS (request-to-send) signal. 
		EscapeCommFunction (m_hPort, SETDTR);
		EscapeCommFunction (m_hPort, SETRTS);

		// Specify a set of events to be monitored for the port.
		SetCommMask (m_hPort, EV_RXCHAR | EV_CTS | EV_DSR | EV_RLSD | EV_RING);

	/*
	//==============================Thread==============================================
		HANDLE hReadThread;
		// Create a read thread for reading data from the communication port.
		if (hReadThread = ::CreateThread(NULL, 0, PortReadThread, this, 0, &dwThreadID))
		{
			CloseHandle (hReadThread);
		}
		else
		{
		// Could not create the read thread.
		dwError = GetLastError ();
		return FALSE;
		}
	*/

		m_bInitPort = TRUE;
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

BOOL Port::ClosePort()
{
	if( m_bInitPort )
	{
		DWORD dwError;
		if (m_hPort != INVALID_HANDLE_VALUE)
		{
			// Close the communication port.
			if (!CloseHandle (m_hPort))
			{
				dwError = GetLastError ();
				return FALSE;
			}
			else
			{
				m_hPort = INVALID_HANDLE_VALUE;
				return TRUE;
			}
		}

		m_bInitPort = FALSE;
		return FALSE;
	}
	else 
	{
		return FALSE;
	}
}

HANDLE Port::GethPort()
{
	if( !m_bInitPort )
	{
		Log("Error in Port::GethPort()");
		ASSERT(FALSE);
	}

	return m_hPort;
}

BOOL Port::ReadData( int PackSize, BYTE* Data )
{
	ZeroMemory( Data, PackSize * sizeof( BYTE ) );
	//============================ Read port here ================================
	if( (Port::GethPort() != INVALID_HANDLE_VALUE) && (m_bInitPort) )
	{
		BYTE Byte;
		DWORD dwBytesTransferred;

		// Read the data from the serial port.
		ReadFile( Port::GethPort(), &Byte, 1, &dwBytesTransferred, 0);

		if (dwBytesTransferred != 0)
		{

			static  int   nPoint = 0;
			static  BYTE  pData[10];

			while ( dwBytesTransferred != 0 )
			{
				pData[nPoint++] = Byte ; 

				if ( nPoint > 10 )
				{
					Log(" Error PortData nPoint > 10 ");
					return FALSE;
				}

				if ( (char)Byte == 'S' )
				{
					nPoint = 1;
				}

				if ( (char)Byte == 'E' )
				{
					memcpy(Data,pData,10);
/*
					char sz[255]; 
					sprintf(sz,"Finished pData = %c%c%c%c%c%c%c%c%c%c",
								pData[0],
								pData[1],pData[2],pData[3],pData[4],
								pData[5],pData[6],pData[7],pData[8],
								pData[9]);
					Log(sz);
*/
					nPoint = 1;
					return TRUE;
				}

				ReadFile( Port::GethPort(), &Byte, 1, &dwBytesTransferred, 0 );
			}

			return FALSE;

		}
		else
		{
			// Not Have Data Read
			return FALSE;
		}
	}

	Log("Error In Port::ReadData");

	return FALSE;
}	

// Initialize Logical Timer
float Timer::m_fLogicalTime = 0;