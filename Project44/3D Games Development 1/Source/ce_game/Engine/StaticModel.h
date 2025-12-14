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
#include "Triangle.h"
#include "CacheTriangle.h"
#include "D3DX8.h"
#include "PartDef.h"
#include "StaticModelData.h"
#include "Model.h"

//======================================================================
// Class : CStaticModel
// Desc  : Class Static Model
//======================================================================
class CStaticModel : public CModel
{
public:
	CStaticModel(void);
	~CStaticModel(void);

	// Start Override

public:
	D3DXVECTOR3 GetLocalCenter();
	D3DXVECTOR3 GetWorldCenter();
	float GetRadius();

public:
	// Get Function
	int GetNumFaces();
	int GetNumVertices();

public:
	// RayTest and GetHigh
	// if Hit then return FaceIndex
	// else return -1
	BOOL RayTest( const D3DXVECTOR3& RayOrigin,
				  const D3DXVECTOR3& RayDirection, 
				  // Out
				  int*       pFaceIndex = NULL,
				  CTriangle* pTriangle  = NULL,
				  FLOAT*	 pDistance  = NULL, 
				  FLOAT*	 pU         = NULL, 
				  FLOAT*     pV         = NULL );

public:
	HRESULT LoadModel( const char *strFileName );
	void    ClearModel();
	HRESULT Render( const D3DXMATRIX* matCustom =NULL );

	// End Override

	
	BOOL GetTriangle( int FaceIndex, CTriangle* pTriangle );
	// GetHigh1 Use Far1 Solution Use Only x and z 
	BOOL GetHigh1( // In
				   float px, float pz,
				   // Out
				   float*     pHigh = NULL,
				   int*       pFaceIndex = NULL,
				   CTriangle* pTriangle  = NULL );

protected:
	CUseStaticModelData m_SModelData;
};


class CSLandModel;
class CSObjModel : public CStaticModel
{
public:
	CSObjModel();
	~CSObjModel();

protected:
	// Cache Triangle Use for GetHigh
	CCacheTriangle CacheTri;

public:
	BOOL LayOn( CSLandModel *pLandModel ); // pModel Not Modify
	void SetCacheSize( int nCacheSize );
};

//======================================================================
// Class : CSCubeModel
// Desc  : Model that use Average Plane Normal Vector
//======================================================================
class CSCubeModel: public CSObjModel
{
public:
	CSCubeModel();
	~CSCubeModel();

private:					
	// Local
								   // Top View
D3DXVECTOR3 m_vLocalTestHigh1; // 1      2 
D3DXVECTOR3 m_vLocalTestHigh2; // 
D3DXVECTOR3 m_vLocalTestHigh3; //
D3DXVECTOR3 m_vLocalTestHigh4; // 3      4

public:
	HRESULT CalculateVecNormal( CSLandModel* pLandModel );

public:
	HRESULT SetLocalVecTestHigh( D3DXVECTOR3 vTestLocalHigh1,
								 D3DXVECTOR3 vTestLocalHigh2,
								 D3DXVECTOR3 vTestLocalHigh3,
								 D3DXVECTOR3 vTestLocalHigh4 );

public:
	BOOL LayOn( CSLandModel *pLandModel ); // pModel Not Modify

};

//==================================================================
// Class : CSLandModel
// Desc  : Land Model
//==================================================================
class CSLandModel : public CStaticModel{
public:
	CSLandModel();
	~CSLandModel();
};
