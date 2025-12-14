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

#include <math.h>
#include "d3dx8math.h"
#include "d3dx8.h"
#include "Camera.h"
#include "Triangle.h"

// Delete and Release Macro
#define SAFE_DELETE(p)       { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_DELETE_ARRAY(p) { if(p) { delete[] (p);   (p)=NULL; } }
#define SAFE_RELEASE(p)      { if(p) { (p)->Release(); (p)=NULL; } }

// Constant 
namespace cs
{
	const D3DXMATRIX  IMat      = D3DXMATRIX( 1, 0, 0, 0,
										      0, 1, 0, 0,
										      0, 0, 1, 0,
										      0, 0, 0, 1 );

	const D3DXMATRIX  MatDXToGL = D3DXMATRIX( 1, 0, 0, 0,
									          0, 1, 0, 0,
									          0, 0,-1, 0,
									          0, 0, 0, 1 );

    const D3DXVECTOR3 vX        = D3DXVECTOR3( 1, 0, 0 );
    const D3DXVECTOR3 vY        = D3DXVECTOR3( 0, 1, 0 );
	const D3DXVECTOR3 vZ        = D3DXVECTOR3( 0, 0, 1 );

	const D3DXVECTOR3 v2Zero    = D3DXVECTOR2( 0, 0 );
	const D3DXVECTOR3 v3Zero    = D3DXVECTOR3( 0, 0, 0 );
	const D3DXVECTOR3 v4Zero    = D3DXVECTOR4( 0, 0, 0, 0 );
	
	// const float Pi      = D3DX_PI;
	const float Pi		   =   float( 3.14159265358979323846264338327950288419716939937510582);
	const float OneByPi    =   float( 1.0f / Pi );
	const float OneBy2Pi   =   float( 1.0f / (2*Pi) );
    const float Half_Pi    =   float(3.14159265358979323846264338327950288419716939937510582 * 0.5);
	const float Two_Pi	   =   float(3.14159265358979323846264338327950288419716939937510582 * 2.0);

	const float ToRad      =   Pi / float(180);
	const float ToDeg      =   float(180) / Pi;
}

// Class Utility
// Math Function 
class Math
{
public:
	static double Sin(double dAngle);
	static double Cos(double dAngle);
	static double Sin(float fAngle);
	static double Cos(float fAngle);

	static float Sinf(double dAngle);
	static float Cosf(double dAngle);
	static float Sinf(float fAngle);
	static float Cosf(float fAngle);

	static double ASin(double dAngle);
	static double ACos(double dAngle);
	static double ASin(float fAngle);
	static double ACos(float fAngle);

	static float ASinf(double dAngle);
	static float ACosf(double dAngle);
	static float ASinf(float fAngle);
	static float ACosf(float fAngle);	
};

// Vector Function
class Vec3
{
public:
	// Dot Product
	static float          Dot( CONST D3DXVECTOR3* pV1, CONST D3DXVECTOR3* pV2 ); 
	static D3DXVECTOR3*   Cross( D3DXVECTOR3* pOut, CONST D3DXVECTOR3* pV1, CONST D3DXVECTOR3* pV2 ); 
	static float          Length( CONST D3DXVECTOR3* pV );
	static float          LengthSq( CONST D3DXVECTOR3* pV );
	static D3DXVECTOR3*   Normalize( D3DXVECTOR3* pOut, CONST D3DXVECTOR3* pV );
	static D3DXVECTOR3*   Lerp( D3DXVECTOR3* pOut, CONST D3DXVECTOR3* pV1, CONST D3DXVECTOR3* pV2, FLOAT s );

	// Calculate Normal Vec
	static HRESULT CalNVec( D3DXVECTOR3* pVOut,
					 // Input	
					 const D3DXVECTOR3* v0,
					 const D3DXVECTOR3* v1,
		  			 const D3DXVECTOR3* v2 );

	// Multiply Vector With Matrix
	static HRESULT MulMat( D3DXVECTOR3* pVOut, const D3DXVECTOR3* pVIn, const D3DXMATRIX* pMat );
	static HRESULT MulMatRot( D3DXVECTOR3* pVOut, const D3DXVECTOR3* pVIn, const D3DXMATRIX* pMat );

	// Return Angle of Vector in Degree
	static double  RetAngleDeg(const D3DXVECTOR3* pV1, const D3DXVECTOR3* pV2);

	// Calculate Zetha Phi
	static HRESULT CalZethaPhiDeg( const D3DXVECTOR3* pV,
							// Out
							double* Zetha, double* Phi );
};

// Matrix Function
class Mat
{
public:
	static float       Det( CONST D3DXMATRIX *pM );
	static D3DXMATRIX* Mul( D3DXMATRIX *pOut, CONST D3DXMATRIX *pM1, CONST D3DXMATRIX *pM2 );
	static D3DXMATRIX* Transpose( D3DXMATRIX *pOut, CONST D3DXMATRIX *pM );
	static D3DXMATRIX* Inverse( D3DXMATRIX *pOut, FLOAT *pDeterminant, CONST D3DXMATRIX *pM );
	static D3DXMATRIX* Scaling( D3DXMATRIX *pOut, FLOAT sx, FLOAT sy, FLOAT sz );
	static D3DXMATRIX* Translation( D3DXMATRIX *pOut, FLOAT x, FLOAT y, FLOAT z );
	static D3DXMATRIX* RotX( D3DXMATRIX *pOut, FLOAT Angle );
    static D3DXMATRIX* RotY( D3DXMATRIX *pOut, FLOAT Angle );
	static D3DXMATRIX* RotZ( D3DXMATRIX *pOut, FLOAT Angle );
	static D3DXMATRIX* RotAxis( D3DXMATRIX *pOut, CONST D3DXVECTOR3 *pV, FLOAT Angle );
	static D3DXMATRIX* Identity( D3DXMATRIX* pOut );

	// Calculate Normal Matrix
	static HRESULT CalNMat( D3DXMATRIX* pMatOut, const D3DXVECTOR3* pVNormal );
	static HRESULT CalFMat( D3DXMATRIX* pMatOut, const D3DXVECTOR3* pVFront );
	static HRESULT CalCMat( D3DXMATRIX* pMatOut, const D3DXVECTOR3* pVCross );
};

// RayTest Function
class Ray
{
public:
	// ===============================Ray Test Function===================================
	// IntersectTriangle
	static 	BOOL   InTriangle( const D3DXVECTOR3& orig,
					   const D3DXVECTOR3& dir, D3DXVECTOR3& v0,
					   D3DXVECTOR3& v1, D3DXVECTOR3& v2,
					   FLOAT* t, FLOAT* u, FLOAT* v );

	// Check Vector pass in sphere
	static BOOL   InSphere  ( // In
								const D3DXVECTOR3*		 vCenter,

								float fRadius,

								const D3DXMATRIX*        matWorld,

								const D3DXVECTOR3&		 RayOrigin,
								const D3DXVECTOR3&		 RayDirection,

								float*   Distance = NULL );

	static BOOL   InSphere  ( // In
								float fXCenter,
								float fYCenter,
								float fZCenter,

								float fRadius,

								const D3DXMATRIX*        matWorld,

								const D3DXVECTOR3&		 RayOrigin,
								const D3DXVECTOR3&		 RayDirection,

								float*   Distance = NULL );

	// Convert Screen Cursor to Ray
	static HRESULT  ScrToRay( int ptCursorX, int ptCursorY, int Width, int Height, 
  		 					  CCamera *pCamera, 
							  // Out
							  D3DXVECTOR3 *vRayOrigin, D3DXVECTOR3 *vRayDir );

	static BOOL     v3ToScr       ( const D3DXVECTOR3 *v3DPoint,  // Local Coordinate
							 const D3DXMATRIX  *MatWorld,
							 const D3DXMATRIX  *MatView,
							 const D3DXMATRIX  *MatProj,
							 const int ScreenWidth,
							 const int ScreenHeight,
							 // Out Put
							 int   *pScreenX,
							 int   *pScreenY,
							 float *pZ = NULL );

	static BOOL     InArfVertices ( // In
								const D3DXVECTOR3& RayOrigin,
								const D3DXVECTOR3& RayDirection, 
								const D3DXMATRIX*  matWorld,
								float*             pVertices,
								unsigned int*      pIndices,
								int                NumFaces,
								// Out
								int*       pFaceIndex = NULL,
								CTriangle* pTriangle  = NULL,
								FLOAT*     pDistance  = NULL, 
	  							FLOAT*     pU         = NULL, 
								FLOAT*     pV         = NULL );

	static BOOL     InBlendArfVertices   ( // In
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
									FLOAT* pV );


};

class String
{
public:
	static CString Token(const char *String, int WordIndex, char *strSeps );
	static bool    IsInString( char *string, const char *search ); 
};


class CAnimation;
class CUseAnimation;
class CUseTexture;
class Tool
{

public:

	static float GetDistance( float px1, float py1, float pz1,
		                      float px2, float py2, float pz2 );

	static void CalBoundSphere( float *pVertices, int numVertices,
		                        // Out
							    float *pcx, float *pcy, float *pcz, // Center
							    float *pr );

	static void CalBoundSphere( float *pVertices, int numVertices,
		                        // Out
								D3DXVECTOR3 *pvCenter,
								float *pr );
	
	static void GetPointFromTriangleUV( const CTriangle& Triangle, 
		                                float U, float V,
									    // Out
									    float* pX, float* pY, float* pZ );

	static void RenderBlend( float *pVertices0, float *pVertices1,
							 float *pTexCoord0, float *pTexCoord1,
							 float fBPos, float fBUV,
							 unsigned int *pIndices,     
							 int           NumFaces,
							 float        *pVertexColor = NULL,
						 	 BOOL   bBlendPosition = TRUE, BOOL bBlendUV = FALSE );


	static void RenderBlendAnimation(	CAnimation * pAnimation1 ,float fTime1,
										CAnimation * pAnimation2 ,float fTime2,
										float fBPos,float fBUV = 0.0f,
										BOOL bBlendPosition = TRUE,
										BOOL bBlendUV = FALSE
									);

	static void RenderBlendAnimation(	CUseAnimation * pAnimation1 ,float fTime1,
										CUseAnimation * pAnimation2 ,float fTime2,
										float fBPos,float fBUV = 0.0f,
										BOOL bBlendPosition = TRUE,
										BOOL bBlendUV = FALSE
									);

	static void PutSqrTexture3D( CUseTexture *pUseTexture,
		                         // Position
								 float x, float y, float z,
								 float fSize, 
								 const D3DXVECTOR3* pvFront,
								 float Alpha = 1.0f,
								 float Angle = 0.0f );

	// Tmp 
	static void CastShadow  ( // Light Position
		                      float* lp,
							  // Object Data
		                      float*             pVertices,
							  unsigned int*      pIndices,
							  int                NumFaces,
							  const D3DXMATRIX * pMatWorld );

	static void CalPlaneEquation( // In
								  float v0x, float v0y, float v0z,
		                          float v1x, float v1y, float v1z,
								  float v2x, float v2y, float v2z,
								  // Out
								  float *a, float *b, float *c, float *d );

};

struct TGAFILE
{
	unsigned char imageTypeCode;
	short int     imageWidth;
	short int     imageHeight;
	unsigned char bitCount;
	unsigned char *imageData;
};

class Image
{
public:
	static int LoadTGAFile( const char *filename, TGAFILE *tgaFile );

	// Delete Pointer when finished
	static int LoadImageData( const char *filename, float *(&pfRGBA) );
	static int LoadDepthData( const char *filename, float *(&pfDepth) );
};

// Engine LogicalTime 
class Timer
{
private:
	static float m_fLogicalTime; // Logical Time In Second

public:
	static inline float GetLogicalTime()
		{ return m_fLogicalTime; };

friend class CEngineInterface;
};

class Port
{
private:
	static HANDLE m_hPort;
	static BOOL m_bInitPort;

public:
	static BOOL   InitPort();
	static BOOL   ClosePort();
	static HANDLE GethPort();

	static BOOL   ReadData( int PackSize, BYTE* Data );
};