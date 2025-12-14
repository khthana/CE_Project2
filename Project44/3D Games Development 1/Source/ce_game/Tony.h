//----------------------------------------------------------------------------------------
// Tony.h: interface for the CTony class.
//----------------------------------------------------------------------------------------
#ifndef __TONY_H__
#define __TONY_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Actor.h"
#include "Bullet.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------
#define TONY_NUM_ANIMATION		15
#define TONY_ANIM_NULL			0
#define TONY_ANIM_STAND			1
#define TONY_ANIM_SIT			2
#define TONY_ANIM_CROUCH		3


//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------
static char __szTonyAnimation[TONY_NUM_ANIMATION][20] =
{
	"NULL",
	"Idle",
	"run",
	"look",
	"jump",
	"shoot",
	"push",
	"pain",
	"pain2",
	"jeer",
	"jeer2",
	"avoid",
	"dieback",
	"diefront",
	"diefall",
};


static int TONY_ANIM_TYPE[TONY_NUM_ANIMATION] =
{
	TONY_ANIM_NULL,		// NULL
	TONY_ANIM_STAND,	// Idle
	TONY_ANIM_STAND,	// Run
	TONY_ANIM_STAND,	// Look
	TONY_ANIM_STAND,	// Jump
	TONY_ANIM_STAND,	// Shoot
	TONY_ANIM_STAND,	// Push
	TONY_ANIM_STAND,	// Pain
	TONY_ANIM_STAND,	// Pain2
	TONY_ANIM_STAND,	// Jeer
	TONY_ANIM_STAND,	// Jeer2
	TONY_ANIM_STAND,	// Aavoid
	TONY_ANIM_STAND,	// Dieback
	TONY_ANIM_STAND,	// Diefront
	TONY_ANIM_STAND,	// Diefall
};


static BOOL TONY_ANIM_IS_MOVING[TONY_NUM_ANIMATION] =
{
	0,	// NULL 
	0,	// Idle
	1,	// Run
	0,	// Look
	1,	// Jump
	0,	// Shoot
	0,	// Push
	0,	// Pain
	0,	// Pain2
	0,	// Jeer
	0,	// Jeer2
	0,	// Aavoid
	1,	// Dieback
	1,	// Diefront
	1,	// Diefall
};


/*
------------+-----------------------------------------------------------------------------
 Class		| 
------------+-----------------------------------------------------------------------------
 Description| 
 Author		| 
 Date		| 
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CTony : public CActor  
{
public:
	enum TONY_ANIMATION
	{
		ANIM_NULL = 0,
		ANIM_Idle,
		ANIM_Run,
		ANIM_Look,
		ANIM_Jump,
		ANIM_Shoot,
		ANIM_Push,
		ANIM_Pain,
		ANIM_Pain2,
		ANIM_Jeer,
		ANIM_Jeer2,
		ANIM_Avoid,
		ANIM_Dieback,
		ANIM_Diefront,
		ANIM_Diefall,
	};

	enum TONY_OP
	{
		OP_NULL = 0,
		OP_IDLE,
		OP_WALKTOXZ,
        OP_RUNTOXZ,
		OP_JUMPTOXZ,
		OP_JEER,
		OP_PAIN,
		OP_AVOID,
		OP_LOOK,
		OP_WAIT,
		OP_DIE,
		OP_DEAD,
		OP_ACTION,
	};

	//---members variable-----------------------------------------------------------------
	TONY_ANIMATION	m_CurrentAnimationID;
	float			m_arAnimationFts[TONY_NUM_ANIMATION];
	CBullet			m_oBullet0;
	CBullet			m_oBullet1;

	//---constructors & destructor--------------------------------------------------------
	CTony();
	virtual ~CTony();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
	inline int GetNumAnimation(){ return TONY_NUM_ANIMATION; };
	BOOL SetAnimationID( TONY_ANIMATION AnimID, BOOL bBlend=FALSE, float fFinishBlendTime=0.125f );
	virtual BOOL LoadAnimModel();
	virtual VOID IsHit();
	BOOL ProcessAI();
	HRESULT ProcessKey( FLOAT fElapsedTime, RECT rcScreen, BOOL* m_arKey );

	// Override function
	virtual BOOL Process( float fElapseTime );
	HRESULT Render( const D3DXMATRIX* matCustom = NULL ); 

private:
	//---members variable-----------------------------------------------------------------
//	CPtrArray	m_Script;
	BOOL		m_bIsDoingOp;
	TONY_OP		m_iCurrentOp;
	TONY_OP		m_iNextOp;
	float		m_fWaitTime;

	int			m_iDeadBling;
	float		m_fLastTime;
};

#endif // !defined(AFX_TONY_H__906F7978_73F0_4C5E_B9A3_48BFA8F23FF1__INCLUDED_)
