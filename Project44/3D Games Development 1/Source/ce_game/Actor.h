//----------------------------------------------------------------------------------------
// Actor.h: interface for the CActor class.
//----------------------------------------------------------------------------------------
#ifndef __ACTOR_H__
#define __ACTOR_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Engine\DynamicModel.h"
#include "Engine\StaticModel.h"
#include "Engine\Texture.h"
#include "Engine\Op.h"
#include "Vector3f.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Class		| CActor
------------+-----------------------------------------------------------------------------
 Description| 
 Author		| Mr.Apimun Junda
 Date		| Febuary 25, 2002
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CActor : public CDObjModel  
{
public:
	enum ACTOR_TYPE
	{
		BASE=0,
		PLAYER,
		TINA,
		TONY,
		ENVOBJ,
		ENVOBJ1,
		ENVOBJ2,
		BULLET,
		BULLET1,
	};
	enum ANIMATION
	{
		ANIM_NULL = 0,
		ANIM_Idle,
	};

	enum PROMPTSTATE
	{
		PROMPTSTATE_READY = 1,
		PROMPTSTATE_END   = 2
	};

	//---members variable-----------------------------------------------------------------
	ACTOR_TYPE		m_eActorType;				
	FLOAT			fRay1;
	CStaticModel	m_oBounding;

	//---constructors & destructor--------------------------------------------------------
	CActor();
	virtual ~CActor();

	//---members function-----------------------------------------------------------------
	// Access to actor's informations
	CActor* GetActor(){return this;}
	void DecreaseHP(int);
	void IncreaseHP(int);
	int  GetHP();
	BOOL IsDead();
	ACTOR_TYPE IsPickedEnvObj();
	virtual VOID IsHit(){}

	// Moving functions
	void GetDestMoving(float*, float*, float*);
	void SetDestMoving(float,  float,  float);
//	BOOL CalculateMoving(float,  float,  float,  float);
	BOOL CalculateMoving(float);
//	BOOL CalculateRotate(D3DXVECTOR3,float*);
	BOOL CalculateRotate(D3DXVECTOR3 vDestination, float* pResultZeta=NULL);

	BOOL IsCollided(D3DXVECTOR3*,D3DXVECTOR3*);
	BOOL IsCollidedPlayer( D3DXVECTOR3* pvSrc, D3DXVECTOR3* pvDir );


	// Override process and Render	// Render shadow and disable stencil test
	virtual BOOL LoadAnimModel()				{return FALSE;}
	D3DXVECTOR3 GetCurrent();
	FLOAT GetCurrentZetha() { return CMovMat::Zetha();}
	BOOL IsMoving();
	HRESULT FrameMove(FLOAT);
	BOOL Forward(FLOAT Long);
	BOOL RotateLeft(FLOAT);
	BOOL RotateRight(FLOAT);
//	virtual BOOL Process( float fElapseTime )	{return FALSE;}
	virtual HRESULT Render(const D3DXMATRIX* matCustom=NULL ); 

	BOOL UseShadow();
	BOOL UnUseShadow();

protected:
	//---members variable-----------------------------------------------------------------
	// Actor information
	CString			m_strName;
	int				m_iHP;
	
	// Orientation height pivot relative value from loding data
	float			m_fPivotY;

	// Destination moving data
	float			m_fDestX;
	float			m_fDestY;
	float			m_fDestZ;
	float			m_fMovingVelocity;
	float			m_fMovingStep;

	// Rotation data
//	float			m_fCurrZeta;
//	float			m_fDestZeta;
	float			m_fRotate;
	float			m_fRotationVelocity;
	float			m_fZetaDist;//dech edit
	float			m_fPathDist;//dech edit

	BOOL			m_bUseShadow;
/*	CStaticModel	m_ShadowCylinder;
	CUseTexture		m_TexShadow;
*/	BOOL			m_bRenderFire;
};



#endif // __ACTOR_H__
