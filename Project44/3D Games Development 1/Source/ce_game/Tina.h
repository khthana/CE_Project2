//----------------------------------------------------------------------------------------
// Tina.h: interface for the CTina class.
//----------------------------------------------------------------------------------------
#ifndef __TINA_H__
#define __TINA_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Actor.h"
#include "Bullet.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------
#define TINA_NUM_ANIMATION		15
#define TINA_ANIM_NULL			0
#define TINA_ANIM_STAND			1
#define TINA_ANIM_SIT			2
#define TINA_ANIM_CROUCH		3


//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------
static char __szTinaAnimation[TINA_NUM_ANIMATION][20] =
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


static int TINA_ANIM_TYPE[TINA_NUM_ANIMATION] =
{
	TINA_ANIM_NULL,		// NULL
	TINA_ANIM_STAND,	// Idle
	TINA_ANIM_STAND,	// Run
	TINA_ANIM_STAND,	// Look
	TINA_ANIM_STAND,	// Jump
	TINA_ANIM_STAND,	// Shoot
	TINA_ANIM_STAND,	// Push
	TINA_ANIM_STAND,	// Pain
	TINA_ANIM_STAND,	// Pain2
	TINA_ANIM_STAND,	// Jeer
	TINA_ANIM_STAND,	// Jeer2
	TINA_ANIM_STAND,	// Aavoid
	TINA_ANIM_STAND,	// Dieback
	TINA_ANIM_STAND,	// Diefront
	TINA_ANIM_STAND,	// Diefall
};


static BOOL TINA_ANIM_IS_MOVING[TINA_NUM_ANIMATION] =
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
class CTina : public CActor  
{
public:
	enum TINA_ANIMATION
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

	enum TINA_OP
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
	TINA_ANIMATION	m_CurrentAnimationID;
	float			m_arAnimationFts[TINA_NUM_ANIMATION];
	CBullet			m_oBullet0;
	CBullet			m_oBullet1;

	//---constructors & destructor--------------------------------------------------------
	CTina();
	virtual ~CTina();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
	inline int GetNumAnimation(){ return TINA_NUM_ANIMATION; };
	BOOL SetAnimationID( TINA_ANIMATION AnimID, BOOL bBlend=FALSE, float fFinishBlendTime=0.125f );
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
	TINA_OP		m_iCurrentOp;
	TINA_OP		m_iNextOp;
	float		m_fWaitTime;

	int			m_iDeadBling;
	float		m_fLastTime;
};

#endif // !defined(AFX_TINA_H__906F7978_73F0_4C5E_B9A3_48BFA8F23FF1__INCLUDED_)
