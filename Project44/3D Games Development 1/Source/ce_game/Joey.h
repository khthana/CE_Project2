//----------------------------------------------------------------------------------------
// Joey.h: interface for the CJoey class.
//----------------------------------------------------------------------------------------
#ifndef __JOEY_H__
#define __JOEY_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Actor.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------
#define JOEY_NUM_ANIMATION		4
#define JOEY_ANIM_NULL			0
#define JOEY_ANIM_STAND			1
#define JOEY_ANIM_SIT			2
#define JOEY_ANIM_CROUCH		3


//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------
static char __szJoeyAnimation[JOEY_NUM_ANIMATION][20] =
{
	"NULL",
	"Idle",
	"Walk",
	"Dieback0",
};


static int JOEY_ANIM_TYPE[JOEY_NUM_ANIMATION] =
{
	JOEY_ANIM_NULL,		// NULL
	JOEY_ANIM_STAND,	// Idle
	JOEY_ANIM_STAND,	// Walk
	JOEY_ANIM_STAND,	// Dieback0
};


static BOOL JOEY_ANIM_IS_MOVING[JOEY_NUM_ANIMATION] =
{
	0,	// NULL 
	0,	// Idle
	1,	// Walk
	0,	// Dieback0 
};


static BOOL JOEY_ANIM_IS_STOP[JOEY_NUM_ANIMATION] =
{
	0,	// NULL, 
	0,	// Idle
	1,	// Walk
	0,	// Dieback0 
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
class CJoey : public CActor  
{
public:
	enum JOEY_ANIMATION
	{
		ANIM_NULL = 0,
		ANIM_Idle,
		ANIM_Walk,
		ANIM_Dieback0,
	};

	enum JOEY_OP
	{
		OP_NULL = 0,
		OP_IDLE,
		OP_WALKTOXZ,
        OP_RUNTOXZ,
		OP_CREEPTOXZ,
		OP_CROUCH,
		OP_SIT,
		OP_STAND,
		OP_FACETO,
		OP_GUNUP,
		OP_GUNDOWN,
		OP_FIRE,
		OP_WAIT,
		OP_DIEBACK0,
	};

	//---members variable-----------------------------------------------------------------
	JOEY_ANIMATION	m_CurrentAnimationID;
	float			m_arAnimationFts[JOEY_NUM_ANIMATION];

	//---constructors & destructor--------------------------------------------------------
	CJoey();
	virtual ~CJoey();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
	inline int GetNumAnimation(){ return JOEY_NUM_ANIMATION; };
	BOOL SetAnimationID( JOEY_ANIMATION AnimID, BOOL bBlend=FALSE, float fFinishBlendTime=0.125f );

	BOOL LoadAnimModel( const CString& strScrFileName );
	BOOL ProcessAI();

	// Override function
	virtual BOOL Process( float fElapseTime );
	HRESULT Render( const D3DXMATRIX* matCustom = NULL ); 

private:
	//---members variable-----------------------------------------------------------------
//	CPtrArray	m_Script;
	BOOL		m_bIsDoingOp;
	JOEY_OP		m_iCurrentOp;
	JOEY_OP		m_iNextOp;
	float		m_fWaitTime;
};


#endif // __JOEY_H__
