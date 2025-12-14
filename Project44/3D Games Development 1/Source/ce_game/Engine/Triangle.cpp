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

#include "triangle.h"
#include "Util.h"
#include "D3DX8.h"
#include "GLGfx.h"

CTriangle::CTriangle()
{

}

/*
CTriangle( const CTriangle &Triangle )
{
	
}*/

CTriangle::CTriangle( const D3DXVECTOR3& V0,
						       const D3DXVECTOR3& V1,
						       const D3DXVECTOR3& V2 )
{
	m_V0 = V0;
	m_V1 = V1;
	m_V2 = V2;
	CalNormalVec();
}

void CTriangle::SetTriangle( const D3DXVECTOR3& V0,
			                          const D3DXVECTOR3& V1,
			                          const D3DXVECTOR3& V2 )
{
	m_V0 = V0;
	m_V1 = V1;
	m_V2 = V2;
	CalNormalVec();
}

CTriangle::~CTriangle()
{

}

HRESULT CTriangle::CalNormalVec()
{
	Vec3::CalNVec( &m_VecNormal, &m_V0, &m_V1, &m_V2 );
	return S_OK;
}

// RayTest Function
BOOL  CTriangle::RayTest(  const  D3DXVECTOR3& vRayOrigin,
				                   const  D3DXVECTOR3& vRayDirection,
								   D3DXMATRIX *pMatWorld, // MatWorld
				                   float* pDistance )
{
	float U=0.0f, V=0.0f, _Distance=0.0f;

	D3DXVECTOR3 WV0, WV1, WV2;
	Vec3::MulMat( &WV0, &m_V0, pMatWorld );
	Vec3::MulMat( &WV1, &m_V1, pMatWorld );
	Vec3::MulMat( &WV2, &m_V2, pMatWorld );

	BOOL Result = Ray::InTriangle( vRayOrigin,
				  	               vRayDirection,
								   WV0, 
								   WV1, 
								   WV2,
								   &_Distance,
								   &U, &V );

	if (Result)
	{
		if( _Distance >= 0 )
		{
			*pDistance = _Distance;
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	else
	{
		return FALSE;
	}
} 

BOOL CTriangle::IsVertexInRectScreen( CRect Rect,
	                                           const D3DXMATRIX *MatWorld,
											   const D3DXMATRIX *MatView,
											   const D3DXMATRIX *MatProj,
											   int   ScreenWidth,
											   int   ScreenHeight,
											   int   SelMode )
{
	int Count = 0; 
	int P0X, P0Y;
	int P1X, P1Y;
	int P2X, P2Y;
	
	if( Ray::v3ToScr( &m_V0, 
					  MatWorld,
					  MatView,
					  MatProj,
					  ScreenWidth,
					  ScreenHeight,
					  // Out
					  &P0X,
					  &P0Y ) )	
	{  
		if( (P0X >= Rect.left)&&
			(P0Y >= Rect.top)&&
			(P0X <= Rect.right)&&
			(P0Y <= Rect.bottom) )
		{
			Count++;
		}	
	}

	// Check Second Vertex
	if( Ray::v3ToScr( &m_V1, 
					  MatWorld,
					  MatView,
					  MatProj,
					  ScreenWidth,
					  ScreenHeight,
					  // Out
					  &P1X,
					  &P1Y ) )	
	{
		if( (P1X >= Rect.left)&&
			(P1Y >= Rect.top)&&
			(P1X <= Rect.right)&&
			(P1Y <= Rect.bottom) )
		{
			Count++;
		}	
	}

	// Check Third Vertex
	if( Ray::v3ToScr( &m_V2, 
					  MatWorld,
					  MatView,
					  MatProj,
					  ScreenWidth,
					  ScreenHeight,
					  // Out
					  &P2X,
					  &P2Y ) )	
	{
		if( (P2X >= Rect.left)&&
			(P2Y >= Rect.top)&&
			(P2X <= Rect.right)&&
			(P2Y <= Rect.bottom) )
		{
			Count++;
		}	
	}
	
	if( SelMode == ALL )
	{
		return ( Count == 3 );
	}
	else
	{
		return ( Count > 0 );
	}
}

HRESULT CTriangle::Render( const D3DXMATRIX *pMatWorld )
{	

	GLGfx::SetMatWorld( pMatWorld );
	GLGfx::BeginDraw( GLDrawMode::TRIANGLES );
		glVertex3f( m_V0.x, m_V0.y, m_V0.z );
		glVertex3f( m_V1.x, m_V1.y, m_V1.z );
		glVertex3f( m_V2.x, m_V2.y, m_V2.z );
	GLGfx::EndDraw();

	return S_OK;
}

HRESULT CTriangle::RenderNVec( const D3DXMATRIX *pMatWorld )
{

	float StartX = ( m_V0.x + m_V1.x + m_V2.x ) / 3.0f;
	float StartY = ( m_V0.y + m_V1.y + m_V2.y ) / 3.0f;
	float StartZ = ( m_V0.z + m_V1.z + m_V2.z ) / 3.0f;
	float EndX   = StartX + m_VecNormal.x;
	float EndY   = StartY + m_VecNormal.y;
	float EndZ   = StartZ + m_VecNormal.z;

	GLGfx::SetMatWorld( pMatWorld );
	GLGfx::BeginDraw( GLDrawMode::LINES );
		glVertex3f( StartX, StartY, StartZ );
		glVertex3f( EndX,   EndY,   EndZ );
	GLGfx::EndDraw();


	return S_OK;
}

//Return true if ref point is in Triangle
BOOL CTriangle::IsXZOn( float px, float pz )
{
	D3DXVECTOR3 Vector1, Vector2;
	double angle1, angle2, angle3;
	angle1 = angle2 = angle3 = 0;

	// 0 with 1
	Vector1=D3DXVECTOR3( m_V1.x - px,
								   0, 
						 m_V1.z - pz );

	Vector2=D3DXVECTOR3( m_V0.x - px,
								   0,
						 m_V0.z - pz );

	if ( Vec3::Length( &Vector1 ) * Vec3::Length( &Vector2 ) == 0.0 )
	{
		return(true);
	};

	angle1 = Vec3::RetAngleDeg( &Vector1, &Vector2);
	angle1 = angle1>180+1.0 ? 360-angle1:angle1;
	// 0 with 2
	Vector1=D3DXVECTOR3( m_V0.x - px,
								   0,
						 m_V0.z - pz);

	Vector2=D3DXVECTOR3( m_V2.x - px,
								   0,
						 m_V2.z - pz);

	if ( Vec3::Length( &Vector1 ) * Vec3::Length( &Vector2 ) == 0.0 )
	{
		return(true);
	};

	angle2 = Vec3::RetAngleDeg( &Vector1, &Vector2 );  
	angle2 = angle2>180+1.0 ? 360-angle2:angle2;

	// 1 with 2
	Vector1=D3DXVECTOR3( m_V1.x - px,
								   0,
						 m_V1.z - pz);

	Vector2=D3DXVECTOR3( m_V2.x - px,
								   0,
						 m_V2.z - pz);

	if ( Vec3::Length( &Vector1 ) * Vec3::Length( &Vector2 ) == 0.0 )
	{
		return(true);
	};

	angle3 = Vec3::RetAngleDeg( &Vector1, &Vector2 );
	angle3 = angle3>180+1.0 ? 360-angle3:angle3;

	if (((angle1+angle2+angle3)>360.0-0.05)&&(((angle1+angle2+angle3)<360.0+0.05)))
	{
		return(true);
	};
	
	return(false);
};

BOOL CTriangle::GetHigh( float px, float pz, float *pHigh )
{
	if( GetMaxX() < px ) return FALSE;
	if( GetMaxZ() < pz ) return FALSE;
	if( GetMinX() > px ) return FALSE;
	if( GetMinZ() > pz ) return FALSE;

	if ( IsXZOn( px, pz ) )
	{
		float ny = m_VecNormal.y;
		if( ny != 0.0f )
		{
			float nx = m_VecNormal.x;
			float nz = m_VecNormal.z;

			float x = px - m_V0.x; 
			float z = pz - m_V0.z;
			*pHigh = ((-(x*nx)-(z*nz))/ny) + m_V0.y;
			return TRUE;
		}
	}

	return FALSE;
}

void CTriangle::GetPointFromUV( float U, float V,
								// Out
								float* pX, float* pY, float* pZ,
								const D3DXMATRIX *MatWorld ) 
{
	D3DXVECTOR3 v0 = GetV0();
	D3DXVECTOR3 v1 = GetV1();
	D3DXVECTOR3 v2 = GetV2();

	D3DXVECTOR3 wv0, wv1, wv2;
	Vec3::MulMat( &wv0, &v0, MatWorld );
	Vec3::MulMat( &wv1, &v1, MatWorld );
	Vec3::MulMat( &wv2, &v2, MatWorld );
	
	D3DXVECTOR3 Vec1 = D3DXVECTOR3( wv1.x - wv0.x,
									wv1.y - wv0.y,
									wv1.z - wv0.z );

	D3DXVECTOR3 Vec2 = D3DXVECTOR3( wv2.x - wv0.x,
									wv2.y - wv0.y,
									wv2.z - wv0.z );

	if( pX )
	{
		*pX = wv0.x + U*Vec1.x + V*Vec2.x;
	}
	if( pY )
	{
		*pY = wv0.y + U*Vec1.y + V*Vec2.y;
	}
	if( pZ )
	{
		*pZ = wv0.z + U*Vec1.z + V*Vec2.z;
	}
}

// Min Max Function
float   CTriangle::GetMinX()
{
	float MinX = m_V0.x;
	if( m_V1.x < MinX ) MinX = m_V1.x;
	if( m_V2.x < MinX ) MinX = m_V2.x;
	return MinX;
}

float   CTriangle::GetMaxX()
{
	float MaxX = m_V0.x;
	if( m_V1.x > MaxX ) MaxX = m_V1.x;
	if( m_V2.x > MaxX ) MaxX = m_V2.x;
	return MaxX;
}

float   CTriangle::GetMinY()
{
	float MinY = m_V0.y;
	if( m_V1.y < MinY ) MinY = m_V1.y;
	if( m_V2.y < MinY ) MinY = m_V2.y;
	return MinY;
}

float   CTriangle::GetMaxY()
{
	float MaxY = m_V0.y;
	if( m_V1.y > MaxY ) MaxY = m_V1.y;
	if( m_V2.y > MaxY ) MaxY = m_V2.y;
	return MaxY;
}

float   CTriangle::GetMinZ()
{
	float MinZ = m_V0.z;
	if( m_V1.z < MinZ ) MinZ = m_V1.z;
	if( m_V2.z < MinZ ) MinZ = m_V2.z;
	return MinZ;
}

float   CTriangle::GetMaxZ()
{
	float MaxZ = m_V0.z;
	if( m_V1.z > MaxZ ) MaxZ = m_V1.z;
	if( m_V2.z > MaxZ ) MaxZ = m_V2.z;
	return MaxZ;
}