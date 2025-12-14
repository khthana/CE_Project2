//----------------------------------------------------------------------------------------
// Scene.h: interface for the CScene class.
//----------------------------------------------------------------------------------------
#ifndef __SCENE_H__
#define __SCENE_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Engine\StaticModel.h"
#include "Engine\EffectBillboardList.h"
#include "MyGlApp.h"
#include "Tina.h"
#include "Tony.h"
#include "EnvObj.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------
// tina's definition
#define	NUM_TINA_OBJ	5
#define	NUM_TONY_OBJ	8
#define	NUM_ENV0_OBJ	10
#define	NUM_ENV1_OBJ	7
#define	NUM_ENV2_OBJ	5

// Summary obj...
#define	NUM_ACTOR_OBJ	NUM_TINA_OBJ+NUM_TONY_OBJ+NUM_ENV0_OBJ+NUM_ENV1_OBJ+NUM_ENV2_OBJ
#define	NUM_SCENE_OBJ	22
#define	NUM_SCENE2_OBJ	18


// tina's definition
#define	TEXTURE_CLOUD		0
#define	TEXTURE_FIRE		1
#define	TEXTURE_PLASMA		2
#define	TEXTURE_LIGHT000	3
#define	TEXTURE_TINAINF		4
#define	TEXTURE_SHADOW		5
#define	NUM_TEXTURE			6

//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------
enum SCENE_PAGE
{
	MENU_000=0,
	LOADING,
	GAMELOOP,
	GAMELOOP_INFO,
	GAMEOVER,
	VICTORY,
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
class CScene  
{
public:

	//---members variable-----------------------------------------------------------------
	static CEffectBillboardList s_oCloudList;
	static CMyGlApp*	s_pMyGlApp;
	static SCENE_PAGE	s_oPage;
	static CSLandModel	s_oScene[NUM_SCENE_OBJ];
	static CStaticModel	s_oScene2[NUM_SCENE2_OBJ];
	static CActor*		s_pActor[NUM_ACTOR_OBJ];
	static CEnvObj		s_oEnvObj[NUM_ENV0_OBJ+NUM_ENV1_OBJ+NUM_ENV2_OBJ];
	static CTina		s_oTina[NUM_TINA_OBJ];
	static CTony		s_oTony[NUM_TONY_OBJ];
	static CTina		s_oPlayer;
	static CTony		s_oPlayer2;

	static CUseTexture	s_oTexture[NUM_TEXTURE];

	//---constructors & destructor--------------------------------------------------------
	CScene();
	virtual ~CScene();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
	static HRESULT OneTimeSceneInit(CMyGlApp*);
	static HRESULT InitDeviceObjects(void);
	static HRESULT DeleteDeviceObjects(void);
	static HRESULT FinalCleanup(void);
	static HRESULT FrameMove(float);
	static HRESULT Render(void);
	static int GetNumSceneObj()	{return NUM_SCENE_OBJ;}
	static int GetNumTinaObj()	{return NUM_TINA_OBJ;}
	static int GetNumTonyObj()	{return NUM_TONY_OBJ;}
	static int GetNumEnvObj()	{return NUM_ENV0_OBJ+NUM_ENV1_OBJ+NUM_ENV2_OBJ;}
	static int GetNumEnv0Obj()	{return NUM_ENV0_OBJ;}
	static int GetNumEnv1Obj()	{return NUM_ENV1_OBJ;}
	static int GetNumEnv2Obj()	{return NUM_ENV2_OBJ;}
	static int GetNumActorObj()	{return NUM_ACTOR_OBJ;}
	static float GetHeight(float,float,float);

protected:
	static HRESULT FrameMoveLoading(void);
	static HRESULT RenderMenu000(void);
	static HRESULT RenderLoading(void);
	static HRESULT RenderGameLoop(void);
	static HRESULT RenderGameOver(void);
};


#endif // __SCENE_H__
