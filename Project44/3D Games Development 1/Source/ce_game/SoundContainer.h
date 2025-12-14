//----------------------------------------------------------------------------------------
// SoundContainer.h: interface for the CSoundContainer class.
//----------------------------------------------------------------------------------------
#ifndef __SOUNDCONTAINER_H__
#define __SOUNDCONTAINER_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Engine\Sound.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------
#define	SOUND_BACKGROUND00		0
#define	SOUND_WOMAN_IDLE00		1
#define	SOUND_WOMAN_JUMP00		2
#define	SOUND_WOMAN_DIE00		3
#define	SOUND_SHOOT_000			4
#define	SOUND_STEP_000			5
#define	SOUND_STEP_001			6
#define	SOUND_WOMAN_PAIN00		7
#define	SOUND_CHARGE_000		8
#define	SOUND_CHARGE_001		9
#define	SOUND_SHOOT_001			10
#define	SOUND_EXPLODE_000		11
#define	SOUND_HEALTH_UP			12
#define	SOUND_FULL_HEALTH		13
#define	SOUND_HEALTH_CRITICAL	14
#define	SOUND_FORCE_FILL		15
#define	SOUND_SHOOT_002			16
#define	SOUND_EXPLODE_001		17
#define	SOUND_BREATH_000		18
#define	SOUND_MAN_PAIN00		19
#define	SOUND_MAN_DIE00			20

#define	NUM_SOUND				21

//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------


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
class CSoundContainer  
{
public:
	//---members variable-----------------------------------------------------------------
	static CUseSounds s_oSound[NUM_SOUND];

	//---constructors & destructor--------------------------------------------------------
	CSoundContainer();
	virtual ~CSoundContainer();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
	static HRESULT InitDeviceObjects(void);
	static HRESULT DeleteDeviceObjects(void);
	static HRESULT OneTimeSceneInit(void);
	static HRESULT FinalCleanup(void);
	static HRESULT FrameMove(void);
	static HRESULT Render(void);
	static int GetNumSound(){return NUM_SOUND;}
};


#endif // __SOUNDCONTAINER_H__
