//----------------------------------------------------------------------------------------
// SoundContainer.cpp: implementation of the CSoundContainer class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "SoundContainer.h"
#include "MyGlApp.h"


CUseSounds	CSoundContainer::s_oSound[NUM_SOUND];


/*
------------+-----------------------------------------------------------------------------
 Function	| CSoundContainer
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| 
 Return		| 
 Remarks    | 
 See Also	| 
------------+-----------------------------------------------------------------------------
*/
CSoundContainer::CSoundContainer()
{

}


/*
------------+-----------------------------------------------------------------------------
 Function	| ~CSoundContainer
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| 
 Return		| 
 Remarks    | 
 See Also	| 
------------+-----------------------------------------------------------------------------
*/
CSoundContainer::~CSoundContainer()
{

}


/*
------------+-----------------------------------------------------------------------------
 Function	| OneTimeSceneInit
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CSoundContainer::OneTimeSceneInit(void)
{
	// Load land of scene

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_WOMAN_IDLE00");
	s_oSound[SOUND_WOMAN_IDLE00].Use( "Resource\\Sound\\hic_jump_3.wav", 4 );
	
	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_WOMAN_JUMP00");
	s_oSound[SOUND_WOMAN_JUMP00].Use( "Resource\\Sound\\hic_jump_3.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_WOMAN_DIE00");
	s_oSound[SOUND_WOMAN_DIE00].Use( "Resource\\Sound\\hic_death_4.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_SHOOT_000");
	s_oSound[SOUND_SHOOT_000].Use( "Resource\\Sound\\sesam_shoot_5.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_STEP_000");
	s_oSound[SOUND_STEP_000].Use( "Resource\\Sound\\pl_step3.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_STEP_001");
	s_oSound[SOUND_STEP_001].Use( "Resource\\Sound\\pl_step4.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_WOMAN_PAIN00");
	s_oSound[SOUND_WOMAN_PAIN00].Use( "Resource\\Sound\\Hic_shield_4.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_CHARGE_000");
	s_oSound[SOUND_CHARGE_000].Use( "Resource\\Sound\\charge_000.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_CHARGE_001");
	s_oSound[SOUND_CHARGE_001].Use( "Resource\\Sound\\pick_bullet0.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_SHOOT_001");
	s_oSound[SOUND_SHOOT_001].Use( "Resource\\Sound\\bullet_shoot.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_EXPLODE_000");
	s_oSound[SOUND_EXPLODE_000].Use( "Resource\\Sound\\bullet_explode.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_HEALTH_UP");
	s_oSound[SOUND_HEALTH_UP].Use( "Resource\\Sound\\bh_health_up.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_FULL_HEALTH");
	s_oSound[SOUND_FULL_HEALTH].Use( "Resource\\Sound\\bh_full_health.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_HEALTH_CRITICAL");
	s_oSound[SOUND_HEALTH_CRITICAL].Use( "Resource\\Sound\\w_health_critical.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_FORCE_FILL");
	s_oSound[SOUND_FORCE_FILL].Use( "Resource\\Sound\\bs_forcefield_9.wav", 2 );
	
	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_SHOOT_002");
	s_oSound[SOUND_SHOOT_002].Use( "Resource\\Sound\\bullet1_shoot.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_EXPLODE_001");
	s_oSound[SOUND_EXPLODE_001].Use( "Resource\\Sound\\bullet1_explode.wav", 4 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_BREATH_000");
	s_oSound[SOUND_BREATH_000].Use( "Resource\\Sound\\hic_breath_3.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_MAN_PAIN00");
	s_oSound[SOUND_MAN_PAIN00].Use( "Resource\\Sound\\Kok_frontHit_3.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_MAN_DIE00");
	s_oSound[SOUND_MAN_DIE00].Use( "Resource\\Sound\\Kok_death_3.wav", 2 );

	CMyGlApp::ShowLoading(5.0f,"Sound : SOUND_BACKGROUND00");
//	s_oSound[SOUND_BACKGROUND00].Use( "Resource\\Sound\\crystal_ball.wav", 2 );
	s_oSound[SOUND_BACKGROUND00].Use( "Resource\\Sound\\techy.wav", 2 );

	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CSoundContainer::FinalCleanup(void)
{
	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CSoundContainer::InitDeviceObjects(GLvoid)
{
	// Initialize is finished
	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CSoundContainer::DeleteDeviceObjects(GLvoid)
{
	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CSoundContainer::FrameMove(GLvoid)
{
	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CSoundContainer::Render(GLvoid)
{
	// Rendering is finished
	return S_OK;
}

