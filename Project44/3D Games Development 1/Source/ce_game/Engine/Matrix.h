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
#include "d3dx8.h"
#include "Util.h"

//=====================================================================
//                            CMat Class
//=====================================================================
class CMat
{
private:
	D3DXMATRIX m_Mat;

public:
	CMat();
	CMat( const D3DXMATRIX& Mat );
	CMat( const CMat& cMat );

public:
	// Operation
	void Mul( const CMat *pcMat );			  // Mul Right
	void Mul( const D3DXMATRIX *pMat );

	void MulL( const CMat *pcMat );			  // Mul Left
	void MulL( const D3DXMATRIX *pMat );

	void LoadIdentity();
	void Translatef( float x, float y, float z );
	void Translatev( const D3DXVECTOR3 *pvTran );
	void Rotatef( float x, float y, float z, float AngleDeg );
	void Rotatev( const D3DXVECTOR3 *pvAxis, float AngleDeg );
	void RotateX( float AngleDeg );
	void RotateY( float AngleDeg );
	void RotateZ( float AngleDeg );
	void Scale( float sx, float sy, float sz );
	void Inverse();
	void Transpose();

public:
	// Get Matrix
	inline D3DXMATRIX GetMat() const
	{ return m_Mat; };

	inline const D3DXMATRIX *GetpMat() const
	{ return &m_Mat; };

	// Get Determinant
	inline float GetDet() const
	{ return Mat::Det( &m_Mat ); };

public:
	// Operator
	CMat operator = ( const CMat& cMat );
};

//=====================================================================
//                            CMovMat Class
//=====================================================================
class CMovMat  
{
public:
	CMovMat();
	virtual ~CMovMat();
private:
	// World Matrix
	CMat     m_cMat;
private:
	BOOL		m_bModifiedMat;
public:
	inline void SetModifiedMat()
		{ m_bModifiedMat = TRUE; };

private:
	// Up to Ground
	float       m_fUpToGnd;
private:
	D3DXVECTOR3 m_DirVec;
	int         m_DirVecMode;

private:
	// Position Scaling and Translation
	float  m_Px, m_Py, m_Pz;
	float  m_Sx, m_Sy, m_Sz;

	// Row : Angle Rotate around Front
	// Phi : Angle Rotate around Cross
	// Zetha : Angle Rotate around Up
	float  m_Row, m_Phi, m_Zetha;
private:	
	// Use Only in this Class
	HRESULT CalMatWithNMat();
	HRESULT CalMatWithFMat();
	HRESULT CalMatUnUseDirVec();
private:
	// Calculate Matrix
	HRESULT CalMat();

public:
	enum DirVecMode 
	{
		DV_UNUSE,      // Default +Y is Up( Not Use m_DirVec )
		DV_FRONTVEC,   // m_DirVec is Front		
        DV_NORMALVEC   // m_DirVec is Normal(Up)	
	};

//===================================================================
// Interface
//===================================================================
public:
	// ========================= Set ================================
	// Transformation
	HRESULT SetScale( float Sx, float Sy, float Sz );
	HRESULT SetRotation( float Row, float Phi, float Zetha );
	HRESULT SetPosition( float Px, float Py, float Pz );
    void    SetUpToGnd( float fUpToGnd );

	// Vector Direction and VecDirMode
	HRESULT SetDirVec( const D3DXVECTOR3* pVDir );
	void    SetDirVecMode( int nDirMode );

	// ========================= Get ================================
	inline float  Px(){ return m_Px; };
	inline float  Py(){ return m_Py; };
	inline float  Pz(){ return m_Pz; };

	inline float  Sx(){ return m_Sx; };
	inline float  Sy(){ return m_Sy; };
	inline float  Sz(){ return m_Sz; };

	inline float  Row()  { return m_Row; };
	inline float  Phi()  { return m_Phi; };
	inline float  Zetha(){ return m_Zetha; };

	inline float  GetUpToGnd(){ return m_fUpToGnd; };
	inline int    GetDirVecMode(){ return m_DirVecMode; };

public:
	D3DXMATRIX GetMat();
	const D3DXMATRIX *GetpMat();
};

