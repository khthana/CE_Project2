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
#include "Engine\DynamicModel.h"
#include "Engine\StaticModel.h"
#include "Engine\Texture.h"
#include "Engine\Op.h"

#define __NumAnimation 29
static char __szAnimation[__NumAnimation][20] =
{
	"NULL",
	"Creep",
	"CrouchDie",    
	"CrouchFire",   
	"CrouchStop",   
	"CrouchSit",    
	"CrouchStand",  
	"SitDie",       
	"SitFire",      
	"SitStop",      
	"SitCrouch",    
	"SitStand",     
	"Walk",       
	"WalkHobble",   
	"Run",          
	"RunLeft",      
	"RunRight",     
	"StunLeft",    
	"StunRight",    
	"GunUp",        
	"GunDown",      
	"StandFire",    
	"StandStop",    
	"DieBack",      
	"DieBomb",      
	"DieFront",     
	"DieRun",       
	"StandCrouch",  
	"StandSit"  
};

#define AN_TYPE_NULL   0
#define AN_TYPE_STAND  1
#define AN_TYPE_SIT    2
#define AN_TYPE_CROUCH 3
static int AN_TYPE[__NumAnimation] =
{
	AN_TYPE_NULL, //NULL, 
	AN_TYPE_CROUCH,//Creep,
	AN_TYPE_CROUCH,//CrouchDie,    
	AN_TYPE_CROUCH,//CrouchFire,   
	AN_TYPE_CROUCH,//CrouchStop,   
	AN_TYPE_SIT,//CrouchSit,    
	AN_TYPE_STAND,//CrouchStand,  
	AN_TYPE_SIT,//SitDie,       
	AN_TYPE_SIT,//SitFire,      
	AN_TYPE_SIT,//SitStop,      
	AN_TYPE_CROUCH,//SitCrouch,    
	AN_TYPE_STAND,//SitStand,     
	AN_TYPE_STAND,//Walk,       
	AN_TYPE_STAND,//WalkHobble,   
	AN_TYPE_STAND,//Run,          
	AN_TYPE_STAND,//RunLeft,      
	AN_TYPE_STAND,//RunRight,     
	AN_TYPE_STAND,//StunLeft,    
	AN_TYPE_STAND,//StunRight,    
	AN_TYPE_STAND,//GunUp,        
	AN_TYPE_STAND,//GunDown,      
	AN_TYPE_STAND,//StandFire,    
	AN_TYPE_STAND,//StandStop,    
	AN_TYPE_STAND,//DieBack,      
    AN_TYPE_STAND,//DieBomb,      
	AN_TYPE_STAND,//DieFront,     
	AN_TYPE_STAND,//DieRun,       
	AN_TYPE_CROUCH,//StandCrouch,  
	AN_TYPE_SIT,//StandSit  
};

static BOOL AN_IS_MOVING[__NumAnimation] =
{
	0, //NULL, 
	1,//Creep,
	0,//CrouchDie,    
	0,//CrouchFire,   
	0,//CrouchStop,   
	0,//CrouchSit,    
	0,//CrouchStand,  
	0,//SitDie,       
	0,//SitFire,      
	0,//SitStop,      
	0,//SitCrouch,    
	0,//SitStand,     
	1,//Walk,       
	1,//WalkHobble,   
	1,//Run,          
	1,//RunLeft,      
	1,//RunRight,     
	0,//StunLeft,    
	0,//StunRight,    
	0,//GunUp,        
	0,//GunDown,      
	0,//StandFire,    
	0,//StandStop,    
	0,//DieBack,      
    0,//DieBomb,      
	0,//DieFront,     
	0,//DieRun,       
	0,//StandCrouch,  
	0,//StandSit  
};

static BOOL AN_IS_STOP[__NumAnimation] =
{
	0, //NULL, 
	0,//Creep,
	0,//CrouchDie,    
	0,//CrouchFire,   
	1,//CrouchStop,   
	0,//CrouchSit,    
	0,//CrouchStand,  
	0,//SitDie,       
	0,//SitFire,      
	1,//SitStop,      
	0,//SitCrouch,    
	0,//SitStand,     
	0,//Walk,       
	0,//WalkHobble,   
	0,//Run,          
	0,//RunLeft,      
	0,//RunRight,     
	0,//StunLeft,    
	0,//StunRight,    
	0,//GunUp,        
	0,//GunDown,      
	0,//StandFire,    
	1,//StandStop,    
	0,//DieBack,      
    0,//DieBomb,      
	0,//DieFront,     
	0,//DieRun,       
	0,//StandCrouch,  
	0,//StandSit  
};

// Don't Forget
// Load mas
// Load PartDef
class CSLandModel; 
class CTriangle;
// This Class use for model Soiler in Military Simulator project
class CSoldier : public CDObjModel  
{
public:
	enum ANIMATION
	{
		AN_NULL = 0,
		AN_Creep,
		AN_CrouchDie,    
		AN_CrouchFire,   
		AN_CrouchStop,   
		AN_CrouchSit,    
		AN_CrouchStand,  
		AN_SitDie,       
		AN_SitFire,      
		AN_SitStop,      
		AN_SitCrouch,    
		AN_SitStand,     
		AN_Walk,       
		AN_WalkHobble,   
		AN_Run,          
		AN_RunLeft,      
		AN_RunRight,     
		AN_StunLeft,    
		AN_StunRight,    
		AN_GunUp,        
		AN_GunDown,      
		AN_StandFire,    
		AN_StandStop,    
		AN_DieBack,      
		AN_DieBomb,      
		AN_DieFront,     
		AN_DieRun,       
		AN_StandCrouch,  
		AN_StandSit     
	};
	inline int GetNumAnimation()
	{ return __NumAnimation; };

	enum OPTYPE
	{
		OP_WALKTOXZ = 0,
        OP_RUNTOXZ,
		OP_CREEPTOXZ,
		OP_CROUCH,
		OP_SIT,
		OP_STAND,
		OP_FACETO,
		OP_GUNUP,
		OP_GUNDOWN,
		OP_FIRE,
		OP_WAIT
	};

	enum PROMPTSTATE
	{
		PROMPTSTATE_READY = 1,
		PROMPTSTATE_END   = 2
	};

private:
	PROMPTSTATE m_PromptState;

public:
	// Constructor and Destructor
	CSoldier();
	~CSoldier();

private:
	// Personal Information
	CString m_strName;

private:
	int     m_nHP;

public:
	void DecreaseHP(int HP);
	int  GetHP();
	BOOL IsDead();

//===========================Land===========================
private:
	CSLandModel *m_pLand;

public:
	void GetCurrentTriangleInLand( CTriangle *pTriangle );
	void GetCurrentNormal( D3DXVECTOR3 *pvCurrentNormal );

	void SetLand( CSLandModel *pLand );
	CSLandModel *GetLand();
//==========================================================

public:
	BOOL CalculateMoving( float DelX, float DelZ, float Velocity, float fElapseTime );
	void FaceTo( float X, float Z );


public:
	// Override process and Render
	virtual BOOL Process( float fElapseTime );

	// Render shadow and disable stencil test
	HRESULT Render( const D3DXMATRIX* matCustom = NULL ); 


//=============================Script=========================================
private:
	CPtrArray m_Script;
	BOOL      m_bDoingScriptOp;
	int       m_nCurrentOp;

private:
	void DoNextOp();
public:
	BOOL LoadScript( const CString& strScrFileName );
	void DestroyScript();

//==========================Animation=========================================
private:
	ANIMATION m_CurrentAnimationID;
	float     m_arAnimationFts[__NumAnimation];

public:
	BOOL SetAnimationID( ANIMATION AnimationID, 
					     BOOL  bBlend           = FALSE, 
					     float fFinishBlendTime = 1.0f/8.0f );

	void SetAnimationToStop( BOOL  bBlend           = TRUE, 
					         float fFinishBlendTime = 1.0f/8.0f );
	
	float GetAnimationFts( ANIMATION AnimationID );

	inline ANIMATION GetCurrentAnimationID()
		{ return m_CurrentAnimationID; };


//==========================Animation Parameter===============================
private:
	// Animation Walk
	float   m_fWalkStepDistance;
	float   m_fWalkVelocity;

public:
	void  SetWalkParam( float fWalkStepDistance, float fVelocity );
	void  SetWalkVelocity( float fVelocity );

	void  GetWalkParam( float*   pfWalkStepDistance, float*   pfVelocity );

private:
	// Animation WalkHobble
	float   m_fWalkHobbleStepDistance;
	float   m_fWalkHobbleVelocity;

public:
	void  SetWalkHobbleParam( float fWalkHobbleStepDistance, float fVelocity );
	void  SetWalkHobbleVelocity( float fVelocity );

	void  GetWalkHobbleParam( float*   pfWalkHobbleStepDistance, float*   pfVelocity );

private:
	// Animation Run
	float   m_fRunStepDistance;
	float   m_fRunVelocity;

public:
	void  SetRunParam( float fRunStepDistance, float fVelocity );
	void  SetRunVelocity( float fVelocity );


	void  GetRunParam( float*   pfRunStepDistance, float*   pfVelocity );

private:
	// Animation RunLeft
	float   m_fRunLeftStepDistance;
	float   m_fRunLeftVelocity;

public:
	void  SetRunLeftParam( float fRunLeftStepDistance, float fVelocity );
	void  SetRunLeftVelocity( float fVelocity );


	void  GetRunLeftParam( float*   pfRunLeftStepDistance, float*   pfVelocity );

private:
	// Animation RunRight
	float   m_fRunRightStepDistance;
	float   m_fRunRightVelocity;

public:
	void  SetRunRightParam( float fRunRightStepDistance, float fVelocity );
	void  SetRunRightVelocity( float fVelocity );


	void  GetRunRightParam( float*   pfRunRightStepDistance, float*   pfVelocity );

private:
	// Animation Creep
	float   m_fCreepStepDistance;
	float   m_fCreepVelocity;

public:
	void  SetCreepParam( float fCreepStepDistance, float fVelocity );
	void  SetCreepVelocity( float fVelocity );

	void  GetCreepParam( float*   pfCreepStepDistance, float*   pfVelocity );


//===========================Destination======================================
private:
	//BOOL  m_bTryToDestination;
	float m_fDesX, m_fDesZ;

public:
	//void	SetTryToDestination( BOOL bTry );
	//BOOL    GetTryToDestination();

	void    SetDestination( float fDesX, float fDesZ );
	void    GetDestination( float *pfDesX, float *pfDesZ );


//==========================Block Function====================================
public:
	virtual void  SetTimeScale( float fTS )
	{ ASSERT(FALSE); return; };
	virtual BOOL  SetAnimation( const CString& strAction, 
								BOOL  bBlend           = FALSE, 
								float fFinishBlendTime = 1.0f/8.0f )
	{ ASSERT(FALSE); return FALSE; };

	virtual BOOL  SetAnimation( int   Index, 
								BOOL  bBlend           = FALSE, 
								float fFinishBlendTime = 1.0f/8.0f )
	{  ASSERT(FALSE); return FALSE; };

private:
	BOOL m_FirstDie;

private:
	BOOL         m_bUseShadow;
	CStaticModel m_ShadowCylinder;
	CUseTexture  m_TexShadow;

public:
	BOOL UseShadow();
	BOOL UnUseShadow();

private:
	float m_fWaitTime;
	BOOL m_bRenderFire;

};


//============================================================================
// Class CSoldierList
//============================================================================
class CSoldierList
{
public:
	CSoldierList();
	~CSoldierList();

public:
	void DestroyAllSoldier();

private:
	CPtrArray m_arSoldier;

public:
	BOOL AddSoldier( CString strScriptName );
	int  GetNumSoldier();

	BOOL    Process( float fElapseTime );
	HRESULT Render( CCamera *pCamera );

private:
	CSLandModel *m_pLand;

public:
	void SetLand( CSLandModel *pLand );
	CSLandModel *GetLand();

	CSoldier* RayTest( const D3DXVECTOR3& RayOrigin,
					   const D3DXVECTOR3& RayDirection, 
					   // Out
					   int*       pFaceIndex = NULL,
					   CTriangle* pTriangle  = NULL,
					   FLOAT*	  pDistance  = NULL, 
					   FLOAT*	  pU         = NULL, 
 					   FLOAT*     pV         = NULL );

	inline CSoldier *GetAt( int i ) { return (CSoldier *)m_arSoldier.GetAt(i); };
	inline int GetUpperBound() { return m_arSoldier.GetUpperBound(); };

};
