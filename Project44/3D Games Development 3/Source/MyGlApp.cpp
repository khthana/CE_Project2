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

#include "StdAfx.h"
#include "myglapp.h"
#include "d3dx8.h"


//Engine
#include "Engine\GLGfx.h"
#include "Engine\Matrix.h"
#include "Engine\StaticModel.h"
#include "Engine\Texture.h"
#include "Engine\Triangle.h"
#include "Engine\EngineInterface.h"
#include "Engine\Text2D.h"
#include "Engine\DynamicModel.h"
#include "Engine\ModelData.h"
#include "Engine\staticmodeldata.h"
#include "Engine\Animation.h"
#include "Engine\EffectBillboardList.h"
#include "Engine\Sound.h"
#include "ProjectileObject.h"

// Custom
#include "Soldier.h"
#include "Tree.h"
#include "TreeList.h"
#include "Camera2.h"	


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CSLandModel ModelLand,ModelLandSide,ModelSpace,ModelWater;

CStaticModel mdlShadowCylinder;

CStaticModel ModelCenterpoint;
CStaticModel ModelCenterpoint1,ModelCenterpoint2,ModelCenterpoint3;

CStaticModel ModelDavil3_1_1,ModelDavil3_2_1,ModelDavil3_3_1,ModelDavil3_4_1,
             ModelDavil3_1_2,ModelDavil3_2_2,ModelDavil3_3_2,ModelDavil3_4_2,
			 ModelDavil3_1_3,ModelDavil3_2_3,ModelDavil3_3_3,ModelDavil3_4_3,
			 ModelDavil3_1_4,ModelDavil3_2_4,ModelDavil3_3_4,ModelDavil3_4_4,
             ModelDavil3_1_5,ModelDavil3_2_5,ModelDavil3_3_5,ModelDavil3_4_5,
			 ModelDavil3_1_6,ModelDavil3_2_6,ModelDavil3_3_6,ModelDavil3_4_6,
			 ModelDavil3_1_7,ModelDavil3_2_7,ModelDavil3_3_7,ModelDavil3_4_7,
             ModelDavil3_1_8,ModelDavil3_2_8,ModelDavil3_3_8,ModelDavil3_4_8,
			 ModelDavil3_1_9,ModelDavil3_2_9,ModelDavil3_3_9,ModelDavil3_4_9,
			 ModelDavil3_1_10,ModelDavil3_2_10,ModelDavil3_3_10,ModelDavil3_4_10,
             ModelDavil3_1_11,ModelDavil3_2_11,ModelDavil3_3_11,ModelDavil3_4_11,
			 ModelDavil3_1_12,ModelDavil3_2_12,ModelDavil3_3_12,ModelDavil3_4_12,
			 ModelDavil3_1_13,ModelDavil3_2_13,ModelDavil3_3_13,ModelDavil3_4_13,
             ModelDavil3_1_14,ModelDavil3_2_14,ModelDavil3_3_14,ModelDavil3_4_14,
			 ModelDavil3_1_15,ModelDavil3_2_15,ModelDavil3_3_15,ModelDavil3_4_15,
			 ModelDavil3_1_16,ModelDavil3_2_16,ModelDavil3_3_16,ModelDavil3_4_16,
             ModelDavil3_1_17,ModelDavil3_2_17,ModelDavil3_3_17,ModelDavil3_4_17,
			 ModelDavil3_1_18,ModelDavil3_2_18,ModelDavil3_3_18,ModelDavil3_4_18,
             ModelDavil3_1_19,ModelDavil3_2_19,ModelDavil3_3_19,ModelDavil3_4_19,
			 ModelDavil3_1_20,ModelDavil3_2_20,ModelDavil3_3_20,ModelDavil3_4_20;


CStaticModel ModelDavil4_1,ModelDavil4_2,ModelDavil4_3,ModelDavil4_4,
             ModelDavil4_5,ModelDavil4_6,ModelDavil4_7,ModelDavil4_8,
			 ModelDavil4_9,ModelDavil4_10,ModelDavil4_11,ModelDavil4_12,
             ModelDavil4_13,ModelDavil4_14,ModelDavil4_15,ModelDavil4_16,
			 ModelDavil4_17,ModelDavil4_18,ModelDavil4_19,ModelDavil4_20,
			 ModelDavil4_21,ModelDavil4_22,ModelDavil4_23,ModelDavil4_24,
             ModelDavil4_25,ModelDavil4_26,ModelDavil4_27,ModelDavil4_28,
			 ModelDavil4_29,ModelDavil4_30,ModelDavil4_31,ModelDavil4_32,
             ModelDavil4_33,ModelDavil4_34,ModelDavil4_35,ModelDavil4_36,
			 ModelDavil4_37,ModelDavil4_38,ModelDavil4_39,ModelDavil4_40;


CStaticModel ModelDavil5_1,ModelDavil5_2,ModelDavil5_3;;
//CStaticModel ModelBox01;

CSoldierList SoldierList;
CUseTexture TexBlood,TexCloud,TexFireBomb,TexWaterEf;
CUseTexture TexStartGame,TexSkin,TexLife,TexDelLife;//,TexLogo1,TexLogo2,TexLogo3;

GLfloat LightAmbient[]=		{ 0.0f, 0.0f, 0.0f, 1.0f };
GLfloat LightDiffuse[]=		{ 1.0f, 0.80f, 0.520f, 1.0f };
GLfloat LightPosition[]=	{ 0.0f, 0.0f, 0.0f, 1.0f };

CProjectileObject     ProjectileObject;
CProjectileObjectList arProjectileObject; 

int g_nAmbRed	= 255;
int g_nAmbGreen = 248;
int g_nAmbBlue	= 220;

int g_nFogRed	= 0;
int g_nFogGreen = 0;
int g_nFogBlue	= 0;

int startgame = 0.0f;
float davil3index1 = 0.0;
float davil3index2 = -200.0;
float davil3index3 = -300.0;
float davil3index4 = 100.0; 
float davil3index5 = 150.0;
float davil3index6 = 500.0;
float davil3index7 = 200.0;
float davil3index8 = -400.0; 


float g_fFogStart = 4500.0f;
float g_fFogEnd = 5000.0f;

float g_fV0 = 50.0f;
float g_fV0_buelet = 500.0f;

int life = 3;
int score = 0;
int number_buelet  = 500;
int buelet_damage  = 5;
int number_bomb    = 200;
int bomb_damage    = 20;
int number_defence = 0;

float rada_x = 0.0f;
float rada_z = 0.0f;


float startpointx = 50.0f;
float startpointy = 100.0f;
float startpointz = 50.0f;

int wap1=0,wap2=0,wap3=0,wap4=0,wap5=0,wap6=0,wap7=0,wap8=0,
    wap9=0,wap10=0,wap11=0,wap12=0,wap13=0,wap14=0,wap15=0,wap16=0,
	wap17=0,wap18=0,wap19=0,wap20=0,wap21=0,wap22=0,wap23=0,wap24=0,
	wap25=0,wap26=0,wap27=0,wap28=0,wap29=0,wap30=0,wap31=0,wap32=0,
	wap33=0,wap34=0,wap35=0,wap36=0,wap37=0,wap38=0,wap39=0,wap40=0,
	wap41=0,wap42=0,wap43=0,wap44=0,wap45=0,wap46=0,wap47=0,wap48=0,
    wap49=0,wap50=0,wap51=0,wap52=0,wap53=0,wap54=0,wap55=0,wap56=0,
	wap57=0,wap58=0,wap59=0,wap60=0;

int tempwap1=0,tempwap2=0,tempwap3=0,tempwap4=0,tempwap5=0,tempwap6=0,tempwap7=0,tempwap8=0,
    tempwap9=0,tempwap10=0,tempwap11=0,tempwap12=0,tempwap13=0,tempwap14=0,tempwap15=0,tempwap16=0,
	tempwap17=0,tempwap18=0,tempwap19=0,tempwap20=0,tempwap21=0,tempwap22=0,tempwap23=0,tempwap24=0,
	tempwap25=0,tempwap26=0,tempwap27=0,tempwap28=0,tempwap29=0,tempwap30=0,tempwap31=0,tempwap32=0,
	tempwap33=0,tempwap34=0,tempwap35=0,tempwap36=0,tempwap37=0,tempwap38=0,tempwap39=0,tempwap40=0,
	tempwap41=0,tempwap42=0,tempwap43=0,tempwap44=0,tempwap45=0,tempwap46=0,tempwap47=0,tempwap48=0,
    tempwap49=0,tempwap50=0,tempwap51=0,tempwap52=0,tempwap53=0,tempwap54=0,tempwap55=0,tempwap56=0,
	tempwap57=0,tempwap58=0,tempwap59=0,tempwap60=0;

int davillife = 10;

#ifdef _DEBUG
	#define		MAXTREE	5
#else
	#define		MAXTREE	20
#endif

D3DXVECTOR3 LCur_pos;

// save tree list
//#define SAVETREE


//CTreeList  ModelTreeList;

CUseSounds GunSound;
CUseSounds BueletSound;
CUseSounds HitSound;
CUseSounds Score1Sound;
CUseSounds GunSound2;
CUseSounds BombSound;
CUseSounds DieSound;
CUseSounds TestSong;
CUseSounds TestSong2;
CUseSounds TestSong3;
CUseSounds TestSong4;
CUseSounds TestSong5;


CMyGlApp::CMyGlApp(void):
CGLApplication()
{
	m_MBLeft   = FALSE; // Left   Button
	m_MBMiddle = FALSE; // Middle Button	
	m_MBRight  = FALSE; // Right  Button
	ResetMBUp();

	m_MouseX = 10;
	m_MouseY = 10;

	//m_bFullscreen = TRUE;	// Fullscreen Flag Set To Fullscreen Mode By Default
	//m_nMode = 2;			// 800*600*32 Fullscreen

	 m_strTitle = "Game Engine Demo ";
	 m_bShoot = FALSE;


	m_calibase[0] = CPoint( 50, 200 );
	m_calibase[1] = CPoint( 338, 200 );
	m_calibase[2] = CPoint( 628, 200 );

	m_calibase[3] = CPoint( 50, 288 );
	m_calibase[4] = CPoint( 338, 288 ); 
	m_calibase[5] = CPoint( 628, 288 );

	m_calibase[6] = CPoint( 50, 377 );
	m_calibase[7] = CPoint( 338, 377 );
	m_calibase[8] = CPoint( 628, 377 );
}

CMyGlApp::~CMyGlApp(void)
{

}

HRESULT CMyGlApp::OneTimeSceneInit(void)
{
	//don't move out from Onetimescene (use texture for loading screen)
	m_Mouse.UseTexture("Texture\\Mouse001.tga"); 

	GunSound.Use("Sound\\GunShot.wav",10);
	BueletSound.Use("Sound\\buelet.wav",10);
	HitSound.Use("Sound\\hit.wav",10);
	Score1Sound.Use("Sound\\score1.wav",10);
	GunSound2.Use("Sound\\GunShot2.wav",100);
	DieSound.Use("Sound\\Die.WAV",10);
	BombSound.Use("Sound\\bomb.wav",100);
	mdlShadowCylinder.LoadModel( "Frame\\ShadowCylinder.maf" );
	TestSong.Use("Sound\\GetOutOfHere.wav",100);
	TestSong2.Use("Sound\\NotGoing.wav",100);
    TestSong3.Use("Sound\\red1.wav",100);
	TestSong4.Use("Sound\\red2.wav",100);
    TestSong5.Use("Sound\\red3.wav",100);
	// InitPort
	Port::InitPort();

	return S_OK;										// Everything Went OK
}

HRESULT CMyGlApp::FinalCleanup(void)
{
	// Close Port
	Port::ClosePort();
	
	return S_OK;										// Everything Went OK
}


HRESULT CMyGlApp::InitDeviceObjects(GLvoid)
{
	ShowLoading(0.0f,"Wait for loading");

	ShowLoading(0.0f,"Generate camera");

	static BOOL  bFirstTime = TRUE;

	m_Camera.SetProjParams( D3DX_PI / 4.0f, 1.33f * m_fMonitor, 1.0f, 1000000000.0f );
	//m_Camera.SetProjParams( D3DX_PI * 14.0f / 180.0f, 1.66f * m_fMonitor, 1.0f, 1000000000.0f );

	if (bFirstTime)
	{
		bFirstTime = FALSE;

		m_Camera.SetParamsSystem1(  startpointx, startpointy, startpointz,
		 						    -startpointx, startpointy, -startpointz,
		 						    0.0f, 1.0f, 0.0f );
          
		ShowLoading(5.0f,"Load model : Land");         
        ModelLand.LoadModel( "Frame\\marsmars.maf" );
        ModelLandSide.LoadModel ( "Frame\\marsside.maf" );

		ShowLoading(5.0f,"Load model : centerpoint");    
		//ModelBox01.LoadModel( "Frame\\Box01.maf" ); 
        ModelCenterpoint.LoadModel( "Frame\\A.maf" ); 
        ModelCenterpoint1.LoadModel( "Frame\\centerpoint1.maf" );         
        ModelCenterpoint2.LoadModel( "Frame\\centerpoint2.maf" );
        ModelCenterpoint3.LoadModel( "Frame\\centerpoint3.maf" );

		ShowLoading(15.0f,"Load model : Water");         
        ModelWater.LoadModel( "Frame\\water.maf" );         
       
		ShowLoading(15.0f,"Load model : Davil");         
        ModelDavil3_1_1.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_1.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_1.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_1.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_2.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_2.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_2.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_2.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_3.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_3.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_3.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_3.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_4.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_4.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_4.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_4.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_5.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_5.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_5.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_5.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_6.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_6.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_6.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_6.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_7.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_7.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_7.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_7.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_8.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_8.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_8.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_8.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_9.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_9.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_9.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_9.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_10.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_10.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_10.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_10.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_11.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_11.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_11.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_11.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_12.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_12.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_12.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_12.LoadModel( "Frame\\p3_l.maf" );
        ModelDavil3_1_13.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_13.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_13.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_13.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_14.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_14.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_14.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_14.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_15.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_15.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_15.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_15.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_16.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_16.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_16.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_16.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_17.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_17.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_17.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_17.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_18.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_18.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_18.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_18.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_19.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_19.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_19.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_19.LoadModel( "Frame\\p3_l.maf" );
		ModelDavil3_1_20.LoadModel( "Frame\\p3_b.maf" );         
        ModelDavil3_2_20.LoadModel( "Frame\\p3_fly.maf" );
        ModelDavil3_3_20.LoadModel( "Frame\\p3_bl.maf" );         
        ModelDavil3_4_20.LoadModel( "Frame\\p3_l.maf" );


		ModelDavil4_1.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_2.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_3.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_4.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_5.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_6.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_7.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_8.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_9.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_10.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_11.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_12.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_13.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_14.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_15.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_16.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_17.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_18.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_19.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_20.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_21.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_22.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_23.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_24.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_25.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_26.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_27.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_28.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_29.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_30.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_31.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_32.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_33.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_34.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_35.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_36.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_37.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_38.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_39.LoadModel( "Frame\\p4.maf" );
		ModelDavil4_40.LoadModel( "Frame\\p4.maf" );
        
        
		ModelDavil5_1.LoadModel( "Frame\\p5_b.maf" );
        ModelDavil5_2.LoadModel( "Frame\\p5_t.maf" );
        ModelDavil5_3.LoadModel( "Frame\\p5_fly.maf" );


		ShowLoading(15.0f,"Load model : Space");
        ModelSpace.LoadModel("Frame\\space.maf"); 
		// Projectile Object
		ProjectileObject.LoadModel( "Frame\\BigBullet.maf" );
		arProjectileObject.SetLand( &ModelLand);
        
		/*ShowLoading(20.0f,"Load model : Tank");

		ShowLoading(25.0f,"Load model : Soldier");
		 */
		/*
		SoldierList.SetLand( &ModelLand );
		SoldierList.AddSoldier( "SoldierScript\\Leader01.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier01.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier02.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier03.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier04.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier05.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier06.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier07.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier08.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier09.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier10.ssc" );
        */

		TexBlood.Use( "Texture\\blood.tga" );
		TexCloud.Use( "Texture\\cloud.tga" );
		TexFireBomb.Use( "Texture\\FireBomb.tga" );
		TexWaterEf.Use("Texture\\WaterEf.tga");
        TexStartGame.Use("Texture\\startgame.tga");
        TexSkin.Use("Texture\\skin.tga");
		TexLife.Use("Texture\\number_life.tga");
        TexDelLife.Use ("Texture\\number_life_delete.tga");
		//TexLogo1.Use("Texture\\yuna.tga");  
		//TexLogo2.Use("Texture\\yuna.tga"); 
		//TexLogo3.Use("Texture\\yuna.tga"); 
		

	}

	ShowLoading(100.0f,"Finished");
	glShadeModel( GL_SMOOTH );							// Enable Smooth Shading
	
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);	// Really Nice Perspective Calculations
	


	glEnable( GL_CULL_FACE );
	glCullFace( GL_FRONT );
	glEnable(GL_TEXTURE_2D);							// Enable Texture Mapping ( NEW )
	
	glLightfv(GL_LIGHT0, GL_AMBIENT, LightAmbient);		// Setup The Ambient Light
	glLightfv(GL_LIGHT0, GL_DIFFUSE, LightDiffuse);		// Setup The Diffuse Light
	glLightfv(GL_LIGHT0, GL_POSITION,LightPosition);	// Position The Light

	glDisable(GL_LIGHTING);

	return S_OK;										// Everything Went OK
}

HRESULT CMyGlApp::DeleteDeviceObjects(GLvoid)
{

	return S_OK;										// Everything Went OK
}

HRESULT CMyGlApp::FrameMove(GLvoid)
{
	CEngineInterface::AddLogicalTime( m_fElapsedTime );

	ProcessKey( m_fElapsedTime );
	static double Angle = 0;
	Angle += m_fElapsedTime * 20;
	static float x = 5.0f;
	static float z = 5.0f;
	static float High;

	

	SoldierList.Process( m_fElapsedTime );
	ModelLand.SetScale(5,5,5);
    ModelLandSide.SetScale(5,5,5);
	ModelWater.SetScale(5,5,5);
    ModelSpace.SetScale(5,5,5);  
    //ModelBox01.SetScale(5,5,5);
	ModelCenterpoint.SetScale(5,5,5);
    ModelCenterpoint1.SetScale(0.25,0.25,0.25);
	ModelCenterpoint2.SetScale(0.25,0.25,0.25);  
    ModelCenterpoint3.SetScale(0.25,0.25,0.25);  

	ModelDavil3_1_1.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_1.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_1.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_1.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_2.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_2.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_2.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_2.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_3.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_3.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_3.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_3.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_4.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_4.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_4.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_4.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_5.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_5.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_5.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_5.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_6.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_6.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_6.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_6.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_7.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_7.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_7.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_7.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_8.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_8.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_8.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_8.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_9.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_9.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_9.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_9.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_10.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_10.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_10.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_10.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_11.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_11.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_11.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_11.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_12.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_12.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_12.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_12.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_13.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_13.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_13.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_13.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_14.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_14.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_14.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_14.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_15.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_15.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_15.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_15.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_16.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_16.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_16.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_16.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_17.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_17.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_17.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_17.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_18.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_18.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_18.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_18.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_19.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_19.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_19.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_19.SetScale(0.02f,0.02f,0.02f);

	ModelDavil3_1_20.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_2_20.SetScale(0.02f,0.02f,0.02f);
    ModelDavil3_3_20.SetScale(0.02f,0.02f,0.02f);
	ModelDavil3_4_20.SetScale(0.02f,0.02f,0.02f);


    ModelDavil4_1.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_2.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_3.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_4.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_5.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_6.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_7.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_8.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_9.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_10.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_11.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_12.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_13.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_14.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_15.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_16.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_17.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_18.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_19.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_20.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_21.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_22.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_23.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_24.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_25.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_26.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_27.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_28.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_29.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_30.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_31.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_32.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_33.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_34.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_35.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_36.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_37.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_38.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_39.SetScale(0.02f,0.02f,0.02f);
	ModelDavil4_40.SetScale(0.02f,0.02f,0.02f);
	
	
	ModelDavil5_1.SetScale(0.02f,0.02f,0.02f);
	ModelDavil5_2.SetScale(0.02f,0.02f,0.02f);
	ModelDavil5_3.SetScale(0.02f,0.02f,0.02f);
	//m_Camera.LayOn( &ModelLand );
   

	BYTE Data[10];
	if( Port::ReadData( 10, Data ) )
	{
		ProcessComData( Data );
	}

	arProjectileObject.Process( m_fElapsedTime );

	return S_OK;										// Everything Went OK
}

CEffectBillboardList CloudList;

HRESULT CMyGlApp::Render(GLvoid)
{


	//===================R==============G=============B
	float fogColor[4] = {g_nFogRed/255.0f,g_nFogGreen/255.0f,g_nFogBlue/255.0f,1.0f};
	glFogi(GL_FOG_MODE, GL_LINEAR);			// Fog Mode
	glFogfv(GL_FOG_COLOR, fogColor);					// Set Fog Color
	//glFogf(GL_FOG_DENSITY, g_fFogDen);						// How Dense Will The Fog Be
	glHint(GL_FOG_HINT, GL_DONT_CARE);					// Fog Hint Value
	glFogf(GL_FOG_START, g_fFogStart);							// Fog Start Depth
	glFogf(GL_FOG_END, g_fFogEnd);							// Fog End Depth
	glEnable(GL_FOG);									// Enables GL_FOG



	// UseFul Data
	RECT ScrRect;
	::GetClientRect( m_hWnd, &ScrRect );
	int ScrWidth  = ScrRect.right - ScrRect.left;
	int ScrHeight = ScrRect.bottom - ScrRect.top;

	// Camera View
	m_Camera.View();

	// Clear Scene
//	ModelBox.Render();

	GLGfx::Clear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
	glDisable(GL_FOG);									// Disables GL_FOG
//	glColor3f(0.6f,0.45f,0.45f);
	glColor3f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f);

	glEnable(GL_FOG);									// Enables GL_FOG

	glColor3f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f);

	glDepthMask(1);
	
	//SoldierList.Render(&m_Camera);	
	glDisable(GL_STENCIL_TEST);
	//================================================================

	arProjectileObject.Render();

	glEnable(GL_BLEND);
	//glEnable(GL_ALPHA_TEST);
	glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );	// Select The Type Of Blending

	glDisable(GL_BLEND);

	glColor3f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f);
	D3DXVECTOR3 vCamera = m_Camera.GetEyePt();

	glDisable(GL_BLEND);
	glDisable(GL_ALPHA_TEST);
	glEnable( GL_CULL_FACE );
	glCullFace( GL_FRONT );

	CString strSoldierPart;
	D3DXVECTOR3 RayOrigin, RayDirection;
	Ray::ScrToRay( m_MouseX, m_MouseY, ScrWidth, ScrHeight, &m_Camera, &RayOrigin, &RayDirection );
     
	if( m_MBLeft )
	{
		CTriangle TriHit;
		float U, V;
		if( ModelLand.RayTest( RayOrigin, RayDirection, NULL, &TriHit, NULL, &U, &V ) )
		{

		}
        

	}
    
	static float fPrevTime = m_fTime;

	int ShootX, ShootY;
	if( m_MBRight || m_MBLeft )
	{
		ShootX = m_MouseX;
		ShootY = m_MouseY;
	}
	else if ( m_bShoot )
	{
		ShootX = int(m_shootx);
		ShootY = int(m_shooty);		
	}

    if( ( m_MBLeft || m_bShoot ) && ( (m_fTime - fPrevTime) > 0.2f ) )
	{
	    CString strSoldierPart;
		D3DXVECTOR3 RayOrigin, RayDirection;
		Ray::ScrToRay( ShootX, ShootY, ScrWidth, ScrHeight, &m_Camera, &RayOrigin, &RayDirection );
        arProjectileObject.Add( RayOrigin, RayDirection * g_fV0_buelet ); 

		fPrevTime = m_fTime;
		BueletSound.Play();
		
		
		CTriangle TriHitLand;
		float ULand, VLand;
		//int   FaceIndexLand;
		float DistanceLand;
		BOOL  bHitLand    = FALSE;
		if(  ModelDavil4_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ))
			wap1++;
		if(  ModelDavil4_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ))
		    wap2++;
	    if(	 ModelDavil4_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
	        wap3++; 
		if(  ModelDavil4_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
	        wap4++; 
		if(  ModelDavil4_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
            wap5++; 
		if(  ModelDavil4_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ) 
		    wap6++; 
		if(  ModelDavil4_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
		    wap7++;	 
		if(	 ModelDavil4_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
	        wap8++;
		if(  ModelDavil4_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap9++;
	    if(  ModelDavil4_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap10++;
		if(  ModelDavil4_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap11++;
		if(  ModelDavil4_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap12++;
	    if(  ModelDavil4_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap13++;
	    if(  ModelDavil4_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap14++;
        if(  ModelDavil4_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ) 
			wap15++;
		if(  ModelDavil4_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap16++;
		if(  ModelDavil4_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
            wap17++; 
	    if(  ModelDavil4_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap18++;
	    if(  ModelDavil4_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap19++;
        if(  ModelDavil4_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap20++;
		if(  ModelDavil4_21.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ) 
			wap21++;
		if(  ModelDavil4_22.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap22++;
		if(  ModelDavil4_23.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap23++;
	    if(  ModelDavil4_24.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
            wap24++; 
	    if(  ModelDavil4_25.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap25++;
        if(  ModelDavil4_26.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ) 
			wap26++;
		if(  ModelDavil4_27.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap27++;
		if(  ModelDavil4_28.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap28++;
	    if(  ModelDavil4_29.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap29++;
	    if(  ModelDavil4_30.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap30++;
		if(  ModelDavil4_31.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap31++;
		if(  ModelDavil4_32.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap32++;
	    if(  ModelDavil4_33.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap33++;
	    if(  ModelDavil4_34.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap34++;
        if(  ModelDavil4_35.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ) 
			wap35++;
		if(  ModelDavil4_36.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap36++;
		if(  ModelDavil4_37.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap37++;
	    if(  ModelDavil4_38.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap38++;
	    if(  ModelDavil4_39.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap39++;
        if(  ModelDavil4_40.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap40++;

		if(  ModelDavil4_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil4_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil4_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil4_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil4_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil4_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil4_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil4_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil4_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil4_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil4_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil4_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil4_21.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil4_22.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil4_23.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_24.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_25.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil4_26.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil4_27.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil4_28.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_29.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil4_30.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil4_31.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil4_32.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_33.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_34.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil4_35.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil4_36.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil4_37.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_38.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil4_39.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil4_40.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
		{
		   	bHitLand = TRUE;
		}

        if(  ModelDavil3_1_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap41++;
	         
		if(  ModelDavil3_1_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
            wap42++;  
	         
		if(  ModelDavil3_1_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_2_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		     ModelDavil3_3_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap43++;
	         
		if(  ModelDavil3_1_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap44++;
		   	 
		if(  ModelDavil3_1_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap45++;
		     
		if(  ModelDavil3_1_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap46++;
	         
		if(  ModelDavil3_1_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap47++;
	         
		if(  ModelDavil3_1_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap48++;
	         
		if(  ModelDavil3_1_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap49++;
		   	 
		if(  ModelDavil3_1_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap50++;
             
		if(  ModelDavil3_1_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap51++;
	         
		if(  ModelDavil3_1_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap52++;
	         
		if(  ModelDavil3_1_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap53++;
	         
		if(  ModelDavil3_1_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap54++;
		   	 
		if(  ModelDavil3_1_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap55++;
		     
		if(  ModelDavil3_1_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap56++;
	         
		if(  ModelDavil3_1_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  )
			wap57++;
	         
		if(  ModelDavil3_1_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_2_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
	        wap58++; 

		if(  ModelDavil3_1_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
		    wap59++;    	 

		if(  ModelDavil3_1_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
			wap60++;
 

		if(  ModelDavil3_1_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_1.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_2.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_2_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_3.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_1_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_4.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_1_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_5.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_1_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_6.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_7.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_2_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_8.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_1_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_9.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_1_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_10.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_1_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_11.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_12.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_2_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_13.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_1_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_14.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_1_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_15.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_1_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_2_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_3_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_4_16.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
             ModelDavil3_2_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  || 
		     ModelDavil3_3_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
		   	 ModelDavil3_4_17.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_1_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand )  ||
	         ModelDavil3_2_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		     ModelDavil3_3_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_4_18.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_1_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_3_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) || 
		     ModelDavil3_4_19.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
		   	 ModelDavil3_1_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_2_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
	         ModelDavil3_3_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) ||
             ModelDavil3_4_20.RayTest( RayOrigin, RayDirection, NULL, &TriHitLand, &DistanceLand, &ULand, &VLand ) )
		{
		   	bHitLand = TRUE;
		}


		if (bHitLand) 
        {
            HitSound.Play();
			score = score+10;
			if (score % 500 == 0)
			{
			    Score1Sound.Play(); 
			}
		}	
	}

	//static nCountMouseDown
	if( ( m_MBRight || m_bShoot ) && ( (m_fTime - fPrevTime) > 0.3f ) )
	{
		CString strSoldierPart;
		D3DXVECTOR3 RayOrigin, RayDirection;
		Ray::ScrToRay( ShootX, ShootY, ScrWidth, ScrHeight, &m_Camera, &RayOrigin, &RayDirection );

		arProjectileObject.Add( RayOrigin, RayDirection * g_fV0 ); 

		fPrevTime = m_fTime;

		GunSound.Play();

/////////////////////////////////////// EFFECT /////////////////
		/*
		CTriangle TriHitLand;
		float ULand, VLand;
		//int   FaceIndexLand;
		float DistanceLand;
		BOOL  bHitLand    = FALSE;
		if( ModelLand.RayTest( RayOrigin, RayDirection, NULL, 
			                   &TriHitLand, &DistanceLand, &ULand, &VLand ) ) 
		{
		   	bHitLand = TRUE;
		}
        
		CSoldier *pHitSoldier;
		float USoldier, VSoldier;
		CTriangle TriHitSoldier;
		int   FaceIndexSoldier;
		float DistanceSoldier;
		BOOL  bHitSoldier = FALSE;
		pHitSoldier = SoldierList.RayTest( RayOrigin, 
										   RayDirection, 
										   &FaceIndexSoldier, 
										   &TriHitSoldier, 
										   &DistanceSoldier, 
										   &USoldier, 
										   &VSoldier );
		if( pHitSoldier )
		{
			bHitSoldier = TRUE;
		}

		if( bHitSoldier && bHitLand )
		{
			if( DistanceSoldier <= DistanceLand )
			{
				bHitLand = FALSE;
			}
			else
			{
				bHitSoldier = FALSE;
			}
		}

		// Check Hit Soldier or Land
		if( bHitSoldier )
		{
			CString strSoldierPart = pHitSoldier->GetPart( FaceIndexSoldier );
			strSoldierPart.MakeUpper();

			if( strSoldierPart == "GUN" )
			{

			}
			else if ( ( strSoldierPart == "HEAD" ) || ( strSoldierPart == "HEART" ) || ( strSoldierPart == "HELMET" ) )
			{
				pHitSoldier->DecreaseHP( 1000 );

				float x, y, z;
				TriHitSoldier.GetPointFromUV( USoldier, VSoldier, &x, &y, &z, pHitSoldier->GetpMat() );

				CloudList.Add(	"Texture\\blood.tga",
								x,y,z,
								x,y,z,
								1.30f,1.30f,
								1.80f,1.80f,
								float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.80f,
								float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.20f,
								0.10f);

			}
			else
			{
				pHitSoldier->DecreaseHP( 1000 );		
				
				float x, y, z;
				TriHitSoldier.GetPointFromUV( USoldier, VSoldier, &x, &y, &z, pHitSoldier->GetpMat() );

				CloudList.Add(	"Texture\\blood.tga",
								x,y,z,
								x,y,z,
								1.30f,1.30f,
								1.80f,1.80f,
								float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.80f,
								float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.20f,
								0.10f);

			}

		}

		if( bHitLand )
		//if (life == 2)
		{
			DieSound.Play();
		    float x, y, z;
			//TriHitLand.GetPointFromUV( ULand, VLand, &x, &y, &z, ModelLand.GetpMat() );
			x = 50;  y = 100; z = 0;
			CloudList.Add(	"Texture\\cloud.tga",
							x,y,z,
							x,y+0.50f,z,
							0.0f,0.0f,
							1.0f,01.0f,
							float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,1.0f,
							float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.0f,
							02.50f);
             
		}
*/		
///////////////////////////////// END EFFECT/////////////////////////
	}


	glDisable(GL_LIGHTING);				 
	glEnable(GL_BLEND);
	glDepthMask(0);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
	CloudList.Render(m_Camera.GetBillboardMatrix());
	glDepthMask(1);
	glDisable(GL_BLEND);
	glEnable(GL_DEPTH_TEST);


	glEnable(GL_BLEND);
	glDepthMask(0);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

	glColor4f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,1.0f);

/*	ModelWater.SetPosition(0.0f + Math::Sinf(-m_fTime*5.0f)/25.0f,
							29.0f + Math::Sinf(-m_fTime/5.0f)/50.0f,
							0.0f + Math::Cosf(-m_fTime*5.0f)/25.0f);
	ModelWater.Render();

	ModelWater.SetPosition(01.20f + Math::Sinf(m_fTime*4.0f)/25.0f,
							29.0f + Math::Sinf(m_fTime/3.0f)/50.0f,
							01.20f + Math::Cosf(m_fTime*4.0f)/25.0f);
	ModelWater.Render();

	ModelWater.SetPosition(00.60f + Math::Sinf(m_fTime*3.0f)/5.0f,
							29.0f + Math::Sinf(m_fTime/6.0f)/60.0f,
							02.20f + Math::Cosf(m_fTime*3.0f)/15.0f);
	ModelWater.Render();
*/
	//ModelWater.SetPosition(0.0f,0.0f,0.0f);
	

	glDisable(GL_BLEND);
	glDisable(GL_STENCIL_TEST);
	glDepthMask(1);
    ModelSpace.Render();   
    ModelLand.Render();
	ModelLandSide.Render();

	//ModelBox01.Render();
	ModelCenterpoint.Render();
	ModelCenterpoint1.Render();
    ModelCenterpoint2.Render();

	static float watermove = 0.0f;
	static float waterdegree = 0.0f;
	waterdegree += m_fElapsedTime*35;           
	watermove = sin(cs::ToRad*waterdegree)*7;
	ModelWater.SetPosition(0.0f,-0.2f,watermove);    
	ModelWater.Render();

static float centerpoint3rotate = 0.0f;
	         centerpoint3rotate += m_fElapsedTime*10;
	         ModelCenterpoint3.SetRotation(0,0,centerpoint3rotate);

    ModelCenterpoint3.Render();
///////////////////////////////////////////FLY PROCESS//////////////        
    ProcessFly();
	
///////////////////////////////////////////END DAVIL////////////		
		
		//TwoD begin
	/////////////////////////////////////////////////////////////////////////////////
	// TwoD Zone
	/////////////////////////////////////////////////////////////////////////////////
	CCamera Camera2D;
	Camera2D.SetParamsSystem1(	0.0f, 0.0f, 0.0f,
								0.0f, 0.0f, 1.0f,
								0.0f, 1.0f, 0.0f	);

	GLGfx::SetMatWorld(&cs::IMat);
	
	D3DXVECTOR3 vEyeAt  = m_Camera.CCamera::GetEyePt();
	D3DXVECTOR3 vLookAt = m_Camera.CCamera::GetLookatPt();
	
	Camera2D.View();
	CText2D::PutPictureIn2D(&TexSkin, 0.0f,  0.7f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	
	rada_x = 0.10+vEyeAt.x/60000;
	rada_z = 0.86-vEyeAt.z/50000;
	CText2D::PutPictureIn2D(&TexBlood, rada_x,  rada_z, rada_x+0.01, rada_z+0.01, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	

	CText2D::PutPictureIn2D(&TexDelLife, 0.27f,  0.83f, 0.37f, 0.96f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    CText2D::PutPictureIn2D(&TexDelLife, 0.38f,  0.83f, 0.48f, 0.96f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    CText2D::PutPictureIn2D(&TexDelLife, 0.49f,  0.83f, 0.59f, 0.96f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
  
	if (life > 0)
	  CText2D::PutPictureIn2D(&TexLife, 0.27f,  0.83f, 0.37f, 0.96f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    if (life > 1)  
	  CText2D::PutPictureIn2D(&TexLife, 0.38f,  0.83f, 0.48f, 0.96f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    if (life > 2)  
	  CText2D::PutPictureIn2D(&TexLife, 0.49f,  0.83f, 0.59f, 0.96f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    
	
	//CText2D::PutPictureIn2D(&TexLogo1, 0.0f,  0.8f, 0.35f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    //CText2D::PutPictureIn2D(&TexLogo2, 0.35f, 0.8f, 0.7f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    //CText2D::PutPictureIn2D(&TexLogo3, 0.7f,  0.8f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
    
	 
	
	BOOL bIsEnable_DepthTest = glIsEnabled(GL_DEPTH_TEST);
	glDisable(GL_DEPTH_TEST);							// Disables Depth Testing

	glDisable(GL_LIGHTING);

		//Tex1.Use("Texture\\SignalandNumber.bmp");
		//Engine::TwoDZone::PutPictureIn2D( &Tex1,0,0,0.5f,0.5f,0.0f,0.0f,0.0f,01.0f,01.0f);
		char sz[255];
		sprintf(sz,"%.2f เฟรมต่อวินาที",m_fFPS);
		CText2D::Putstring(sz,0.01f,0.012f,0,0xffffffff);

		//Engine::TwoDZone::CText2D::Putstring("Font thai Engine สวัสดีครับ",0.07f,0.9f,0,0xffffffff);

		m_Mouse.SetMousePos( m_MouseX, m_MouseY, ScrWidth, ScrHeight );
		//float fMouseDepth = 0.0f;
		//glReadPixels( 0, 0, ScrWidth, ScrHeight, GL_DEPTH_COMPONENT, GL_FLOAT, &fMouseDepth );
 		//sprintf( sz, "Depth = %f", fMouseDepth );
		//CText2D::Putstring(sz,0.01f,0.112f,0,0xffffffff);

		int x =  int(((Math::Sinf(m_fTime*2.0f)+1.0f)/2.0f)*255.0f);
		x = x & (0x000000ff);
/*
		if ( m_arKey['W'] ) g_nAmbRed++;
		if ( m_arKey['S'] ) g_nAmbRed--;
		if ( g_nAmbRed > 255 ) g_nAmbRed = 255;
		if ( g_nAmbRed < 0 )   g_nAmbRed = 0;

		if ( m_arKey['E'] ) g_nAmbGreen++;
		if ( m_arKey['D'] ) g_nAmbGreen--;
		if ( g_nAmbGreen > 255 ) g_nAmbGreen = 255;
		if ( g_nAmbGreen < 0 )   g_nAmbGreen = 0;

		if ( m_arKey['R'] ) g_nAmbBlue++;
		if ( m_arKey['F'] ) g_nAmbBlue--;
		if ( g_nAmbBlue > 255 ) g_nAmbBlue = 255;
		if ( g_nAmbBlue < 0 )   g_nAmbBlue = 0;


		if ( m_arKey['T'] ) g_nFogRed++;
		if ( m_arKey['G'] ) g_nFogRed--;
		if ( g_nFogRed > 255 ) g_nFogRed = 255;
		if ( g_nFogRed < 0 )   g_nFogRed = 0;

		if ( m_arKey['Y'] ) g_nFogGreen++;
		if ( m_arKey['H'] ) g_nFogGreen--;
		if ( g_nFogGreen > 255 ) g_nFogGreen = 255;
		if ( g_nFogGreen < 0 )   g_nFogGreen = 0;

		if ( m_arKey['U'] ) g_nFogBlue++;
		if ( m_arKey['J'] ) g_nFogBlue--;
		if ( g_nFogBlue > 255 ) g_nFogBlue = 255;
		if ( g_nFogBlue < 0 )   g_nFogBlue = 0;

		if ( m_arKey['I'] ) g_fFogStart+= m_fElapsedTime * 150.0f;
		if ( m_arKey['K'] ) g_fFogStart-= m_fElapsedTime * 150.0f;
		if ( g_fFogStart > g_fFogEnd ) g_fFogStart = g_fFogEnd;
		if ( g_fFogStart < 0.0f ) g_fFogStart = 0.0f;

		if ( m_arKey['O'] ) g_fFogEnd+= m_fElapsedTime * 150.0f;
		if ( m_arKey['L'] ) g_fFogEnd-= m_fElapsedTime * 150.0f;
		if ( g_fFogEnd > 15000.0f ) g_fFogEnd = 15000.0f;
		if ( g_fFogEnd < g_fFogStart ) g_fFogEnd = g_fFogStart;

		
		if ( m_arKey['N'] ) g_fV0+= m_fElapsedTime * 10;
		if ( m_arKey['M'] ) g_fV0-= m_fElapsedTime * 10;
		if ( g_fV0 > 500.0f ) g_fV0 = 500.0f;
		if ( g_fV0 < 1.0f )   g_fV0 = 1.0f;
*/
		static BOOL bShowData = TRUE;
		static BOOL bPressedF12 = FALSE;

		if ( m_arKey[VK_F12] && (! bPressedF12) )
		{
			bPressedF12 = TRUE;
			bShowData = ! bShowData;
		}

		if ( (! m_arKey[VK_F12]) && ( bPressedF12) )
		{
			bPressedF12 = FALSE;
		}

		if ( bShowData )
		{
			/*
			sprintf(sz,"Fog Start = %f , End = %f " ,g_fFogStart,g_fFogEnd);
			CText2D::Putstring(sz,0.01f,0.852f,0,0xffffffff);

			sprintf(sz,"Fog R = %d ,G = %d , B = %d",g_nFogRed,g_nFogGreen,g_nFogBlue);
			CText2D::Putstring(sz,0.01f,0.902f,0,0xffffffff);

			sprintf(sz,"Ambient R = %d ,G = %d , B = %d",g_nAmbRed,g_nAmbGreen,g_nAmbBlue);
			CText2D::Putstring(sz,0.01f,0.952f,0,0xffffffff);
              
			D3DXVECTOR3 vEyeAt  = m_Camera.CCamera::GetEyePt();
			D3DXVECTOR3 vLookAt = m_Camera.CCamera::GetLookatPt();

			sprintf(sz,"Camera At %f, %f, %f", vEyeAt.x, vEyeAt.y, vEyeAt.z );
			CText2D::Putstring(sz,0.01f,0.1f,0,(0xff));
			
			sprintf(sz,"Camera Look %f, %f, %f", vLookAt.x, vLookAt.y, vLookAt.z );
			CText2D::Putstring(sz,0.01f,0.2f,0,(0xff));	
            */
            sprintf(sz,"SCORE %d",score);
			CText2D::Putstring(sz,0.01f,0.1f,0,(0xffffffff));
		    /*
			D3DXVECTOR3 RayOrigin, RayDirection;
	       	Ray::ScrToRay( ShootX, ShootY, ScrWidth, ScrHeight, &m_Camera, &RayOrigin, &RayDirection );
        
			sprintf(sz,"RayOrigin %d  %d",RayOrigin.x,RayOrigin.y);
			CText2D::Putstring(sz,0.01f,0.2f,0,(0xffffffff));

			sprintf(sz,"RayDirection %d  %d",RayDirection.x,RayDirection.y);
			CText2D::Putstring(sz,0.01f,0.3f,0,(0xffffffff));
			
			
			sprintf(sz,"V0 = %f ", g_fV0 );
			CText2D::Putstring(sz,0.01f,0.80f,0,(0xffffffff));			
            */
			sprintf(sz,"%d ", number_buelet );// BUELET
			CText2D::Putstring(sz,0.86f,0.80f,0,(0xffffffff));
			
			sprintf(sz,"%d ", buelet_damage );// BUELET DAMAGE
			CText2D::Putstring(sz,0.93f,0.80f,0,(0xffffffff));	

			sprintf(sz,"%d ",number_bomb );// BOMB 
			CText2D::Putstring(sz,0.86f,0.87f,0,(0xffffffff));	

			sprintf(sz,"%d ",bomb_damage );// BOMB DAMAGE
			CText2D::Putstring(sz,0.93f,0.87f,0,(0xffffffff));	

			sprintf(sz,"%d ", number_defence);// DEFENCE
			CText2D::Putstring(sz,0.86f,0.94f,0,(0xffffffff));	

            sprintf(sz,"Life = %d", life );
			CText2D::Putstring(sz,0.85f,0.05f,0,(0xff));	
            /*  
			sprintf(sz,"V0 = %d ,%d ,%d", ShootX, ShootY, LCur_pos.z );
			CText2D::Putstring(sz,0.01f,0.5f,0,(0xffffffff));
            */  		
		}

		m_Mouse.Render();

	if ( bIsEnable_DepthTest ) glEnable(GL_DEPTH_TEST);

	//TwoD end

	ResetMBUp(); // For Mouse
	m_bShoot = FALSE;
											// Everything Went OK
 
/////////////////// gogogo ///////////////


    
	float speed = 0.3f;

	m_Camera.S2_MoveForward( speed );   
	m_Camera.S2_MoveUp( (vLookAt.y-vEyeAt.y)*speed/1000 );
	if (ProcessBound(vEyeAt.x,vLookAt.x,vEyeAt.y,vLookAt.y,vEyeAt.z,vLookAt.z) == 1)
    { 
		 m_Camera.S2_MoveBackward( speed );   
	     m_Camera.S2_MoveDown( (vLookAt.y-vEyeAt.y)*speed/1000 );
	}
	/////////////////////end go /////////////////////
  
	//////////////////// song ///////////////////
    
	if (startgame <1000)
	  startgame = startgame+1.0;
	if (startgame < 100) 
	{
	  GLGfx::SetMatWorld(&cs::IMat);
	  CText2D::PutPictureIn2D(&TexStartGame, 0.0f,  0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	}	
    else
    {
	  ProcessSong();
	}

	////////////////////end song ///////////////
	return S_OK;
}

LRESULT CALLBACK CMyGlApp::MsgProc(	HWND    hWnd,			// Handle For This Window
									UINT	uMsg,			// Message For This Window
									WPARAM	wParam,			// Additional Message Information
									LPARAM	lParam )		// Additional Message Information
{
	switch (uMsg)
    {
		case WM_MOUSEMOVE :
		{
			m_MouseX = LOWORD (lParam) ;
			m_MouseY = HIWORD (lParam) ;
			return 0;
		}

		case WM_LBUTTONDOWN :
		case WM_MBUTTONDOWN :
		case WM_RBUTTONDOWN :
		{
			if( wParam & MK_LBUTTON ) m_MBLeft   = TRUE;
			if( wParam & MK_MBUTTON ) m_MBMiddle = TRUE;
			if( wParam & MK_RBUTTON ) m_MBRight  = TRUE;
			return 0;
		}
								  
		case WM_LBUTTONUP :
		{
			m_MBLeftUp = TRUE;  
			m_MBLeft   = FALSE;
			//TRACE("MouseX = %d, MouseY = %d \n", m_MouseX, m_MouseY );
			if (number_buelet > 0)
			number_buelet--;
			return 0;
		}
		case WM_MBUTTONUP :
		{
			m_MBMiddleUp = TRUE;
			m_MBMiddle   = FALSE;
			return 0;
		}
		case WM_RBUTTONUP :
		{
			m_MBRightUp = TRUE;
			m_MBRight  = FALSE;
		    if (number_bomb > 0)
			number_bomb--; 
			return 0;
		}
		
	}
	return CGLApplication::MsgProc( hWnd, uMsg, wParam, lParam ); 
}

HRESULT CMyGlApp::ProcessKey( float fElapsedTime )
{

	D3DXVECTOR3 vEyeAt  = m_Camera.CCamera::GetEyePt();
    D3DXVECTOR3 vLookAt = m_Camera.CCamera::GetLookatPt();	
	// MoveForward
	static float MoveForward = 0.0f;
	static float fLimit = 20.5f;
	if( m_arKey[VK_NUMPAD8]) 
	{
		MoveForward+=(fElapsedTime/6.0f); 
		if( MoveForward > fLimit ) MoveForward = fLimit;
	}
	else 
	{
		MoveForward-=(fElapsedTime/3.0f);
	}

	if (MoveForward<=0.0f) 
	{
		MoveForward = 0.0f;
	}
	else
	{
		m_Camera.S2_MoveForward( MoveForward );
	    m_Camera.S2_MoveUp( (vLookAt.y-vEyeAt.y)*MoveForward/1000 );
		// check bound 
		if (ProcessBound(vEyeAt.x,vLookAt.x,vEyeAt.y,vLookAt.y,vEyeAt.z,vLookAt.z) == 1)
        { 
		   m_Camera.S2_MoveBackward( MoveForward );
	       m_Camera.S2_MoveDown( (vLookAt.y-vEyeAt.y)*MoveForward/1000 );
		   MoveForward = 0.0f;
		} 
		   
	}

	// MoveBackward
	static float MoveBackward = 0.0f;
	if( m_arKey[VK_NUMPAD2]) 
	{
		MoveBackward+=(fElapsedTime/6.0f); 
		if( MoveBackward > fLimit ) MoveBackward = fLimit;
	}	
	else 
	{
		MoveBackward-=(fElapsedTime/3.0f);
	}

	if (MoveBackward<=0.0f) 
	{
		MoveBackward = 0.0f;
	}
	else
	{
		m_Camera.S2_MoveBackward( MoveBackward );
	    m_Camera.S2_MoveDown( (vLookAt.y-vEyeAt.y)*MoveBackward/1000 );  
		if (ProcessBound(vEyeAt.x,vLookAt.x,vEyeAt.y,vLookAt.y,vEyeAt.z,vLookAt.z) == 1)
        { 
		   m_Camera.S2_MoveForward( MoveBackward );
	       m_Camera.S2_MoveUp( (vLookAt.y-vEyeAt.y)*MoveBackward/1000 );
		   MoveBackward = 0.0f;
		} 
	   
	}

	// MoveLeft
	static float MoveLeft = 0.0f;
	if( m_arKey[VK_NUMPAD4]) 
	{
		MoveLeft+=(fElapsedTime/6.0f); 
		if( MoveLeft > fLimit ) MoveLeft = fLimit;
	}
	else 
	{
		MoveLeft-=(fElapsedTime/3.0f);
	}

	if (MoveLeft<=0.0f) 
	{
		MoveLeft = 0.0f;
	}
	else
	{
		m_Camera.S2_MoveLeft( MoveLeft );
	}

	static float MoveRight = 0.0f;
	if( m_arKey[VK_NUMPAD6]) 
	{
		MoveRight+=(fElapsedTime/6.0f); 
		if( MoveRight > fLimit ) MoveRight = fLimit;
	}
	else 
	{
		MoveRight-=(fElapsedTime/3.0f);
	}

	if (MoveRight<=0.0f) 
	{
		MoveRight = 0.0f;
	}
	else
	{
		m_Camera.S2_MoveRight( MoveRight );
	}

	// MoveUp
	static float MoveUp = 0.0f;
	if( m_arKey['P']) 
	{
		MoveUp+=(fElapsedTime/6.0f); 
		if( MoveUp > fLimit ) MoveUp = fLimit;
	}
	else 
	{
		MoveUp-=(fElapsedTime/3.0f);
	}

	if (MoveUp<=0.0f) 
	{
		MoveUp = 0.0f;
	}
	else
	{
		m_Camera.S2_MoveUp( MoveUp );
	}

	// MoveDown
	static float MoveDown = 0.0f;
	if( m_arKey['B']) 
	{
		MoveDown+=(fElapsedTime/6.0f); 
		if( MoveDown > fLimit ) MoveDown = fLimit;
	}
	else 
	{
		MoveDown-=(fElapsedTime/3.0f);
	}

	if (MoveDown<=0.0f) 
	{
		MoveDown = 0.0f;
	}
	else
	{
		m_Camera.S2_MoveDown( MoveDown );
	}
	// UseFul Data
	RECT ScrRect;
	::GetClientRect( m_hWnd, &ScrRect );
	int ScrWidth  = ScrRect.right - ScrRect.left;
	int ScrHeight = ScrRect.bottom - ScrRect.top;
////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////	
	//============================Rotate Left=================================
	if( m_arKey[VK_NUMPAD7] || (m_MouseX == 0) ) 
	{
		m_Camera.S2_RotateLeft( fElapsedTime*50.0f );
	}

	//============================Rotate Right================================
	if( m_arKey[VK_NUMPAD9] || (m_MouseX == ScrWidth - 1) ) 
	{
		m_Camera.S2_RotateRight( fElapsedTime*50.0f );
	}

	//============================Rotate Up===================================
	if( m_arKey['A'] || (m_MouseY == 0) ) 
	{
		m_Camera.S2_RotateUp( fElapsedTime*20.0f );
	}
	//==========================================================================

	//============================Rotate Down==================================
	if( m_arKey['Z'] || (m_MouseY == ScrHeight - 1 )  ) 
	{
		m_Camera.S2_RotateDown( fElapsedTime*20.0f );
	}
	//============================ Stop ==============================
	/*if( m_arKey['X'] ) 
	{
		
	}*/

	//==========================================================================

	return S_OK;
}

void CMyGlApp::ShowLoading(float fPercent,const CString& Message)
{
	//CUseTexture TexLoading;
	//TexLoading.Use("texture\\Mouse001.tga");

	CCamera Camera2D;
	Camera2D.SetParamsSystem1(	0.0f,0.0f, 0.0f,
								0.0f, 0.0f, 1.0f,
								0.0f, 1.0f, 0.0f	);
	Camera2D.View();
   
	
	glEnable(GL_TEXTURE_2D);							// Enable Texture Mapping ( NEW )

	GLGfx::Clear();
	
	char sz[255];
	
	
	sprintf(sz,"Now Loading ... ");
	CText2D::Putstring(sz,0.385f,0.49f,0.0f, 0xffffffff);

	sprintf(sz,"... %s",Message);
	CText2D::Putstring(sz,0.05f,0.93f,0.0f, 0xffffffff);	

	glColor4f(0.3f,0.3f,0.3f,1.0f);
	CText2D::PutPictureIn2D(NULL,0.30f,0.55f,0.70f,0.555f,0.0f,0.0f,0.0f,0.0f,0.0f);
	
	glColor4f(1.0f,1.0f,1.0f,1.0f);
	CText2D::PutPictureIn2D(NULL,0.30f,0.55f,
								0.3f +( (0.70f-0.30f) * (fPercent/100.0f) ),0.555f,
								0.0f,0.0f,0.0f,0.0f,0.0f);
	GLGfx::SwapBuffers();

}
int CMyGlApp::ProcessBound(float vx0,float vx1,float vy0,float vy1,float vz0,float vz1)
{
    // ground bound 
	float vi = vx1-vx0 ;
	float vk = vz1-vz0 ;
	float vj = vy1-vy0 ;
	if ((vy0 < 1.0) && (vj < 0))
	{
        m_Camera.SetParamsSystem1(  startpointx, startpointy, startpointz,
		 						    -startpointx, startpointy, startpointz,
		 						    0.0f, 1.0f, 0.0f ); 
		life = life-1;
		//CloudList.Render(m_Camera.GetBillboardMatrix());
		DieSound.Play();
		if (life < 0) life = 0;
		return 1;
	}
	
	return 0;

}

void CMyGlApp::ProcessSong()
{    	
    int randsound = 0;
	randsound = rand()%1500;
	if (randsound == 25) 
		 TestSong.Play();
	if (randsound == 500) 
		 TestSong2.Play();
	if (randsound == 100) 
		 TestSong3.Play();
	if (randsound == 1000) 
		 TestSong4.Play();
	if (randsound == 1200) 
		 TestSong5.Play();


}
void CMyGlApp::ProcessFly()
{    	
	D3DXVECTOR3 vEyeAt  = m_Camera.CCamera::GetEyePt();
    D3DXVECTOR3 vLookAt = m_Camera.CCamera::GetLookatPt();
    static float degree = 0.0f;
        degree = m_fElapsedTime/0.2;
        
		davil3index1 = davil3index1+degree*1.5f;
        davil3index2 = davil3index2+degree*2.0f;
        davil3index3 = davil3index3+degree*2.5f;
		davil3index4 = davil3index4+degree*3.0f;
		davil3index5 = davil3index5+degree*3.5f;
        davil3index6 = davil3index6+degree*4.0f;
        davil3index7 = davil3index7+degree*4.5f;
		davil3index8 = davil3index8+degree;
	
        
		
/*		ModelDavil3_1.SetPosition(davil3index1,200,-3000);
		ModelDavil3_2.SetPosition(davil3index1,200,-3000);
		ModelDavil3_3.SetPosition(davil3index1,200,-3000);
		ModelDavil3_4.SetPosition(davil3index1,200,-3000);
*/		ModelDavil4_1.SetPosition(davil3index2,180,-2900);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
		ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/      if (wap1 < davillife)
		{
		  ModelDavil4_1.Render();
		} 
		else
		{
		  tempwap1++;
		}
/*		ModelDavil3_1.SetPosition(davil3index2,100,-2850);
		ModelDavil3_2.SetPosition(davil3index2,100,-2850);
		ModelDavil3_3.SetPosition(davil3index2,100,-2850);
		ModelDavil3_4.SetPosition(davil3index2,100,-2850);
*/		ModelDavil4_2.SetPosition(davil3index1,100,-2700);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap2 < davillife)
		{
		   ModelDavil4_2.Render();
		}
		else
		{
		   tempwap2++;
		}
/*		ModelDavil3_1.SetPosition(davil3index3,150,-2700);
		ModelDavil3_2.SetPosition(davil3index3,150,-2700);
		ModelDavil3_3.SetPosition(davil3index3,150,-2700);
		ModelDavil3_4.SetPosition(davil3index3,150,-2700);
*/		ModelDavil4_3.SetPosition(davil3index1,550,-2620);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/      if (wap3 < davillife)
		{
		  ModelDavil4_3.Render();
		}
		else
		{
			tempwap3++;
		}

/*		ModelDavil3_1.SetPosition(davil3index2,50,-2550);
		ModelDavil3_2.SetPosition(davil3index2,50,-2550);
		ModelDavil3_3.SetPosition(davil3index2,50,-2550);
		ModelDavil3_4.SetPosition(davil3index2,50,-2550);
*/		ModelDavil4_4.SetPosition(davil3index1,300,-2400);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/      if (wap4 < davillife)
		{
		  ModelDavil4_4.Render();
		}
		else
		{
			tempwap4++;
		}

/*		ModelDavil3_1.SetPosition(davil3index3,50,-2400);
		ModelDavil3_2.SetPosition(davil3index3,50,-2400);
		ModelDavil3_3.SetPosition(davil3index3,50,-2400);
		ModelDavil3_4.SetPosition(davil3index3,50,-2400);
*/		ModelDavil4_5.SetPosition(davil3index2,350,-2250);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
		ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap5 < davillife)
		{
		  ModelDavil4_5.Render();
		}
		else
		{
			tempwap5++;
		}
    
/*		ModelDavil3_1_1.SetPosition(davil3index4,150,-2100);
		ModelDavil3_2_1.SetPosition(davil3index4,150,-2100);
		ModelDavil3_3_1.SetPosition(davil3index4,150,-2100);
		ModelDavil3_4_1.SetPosition(davil3index4,150,-2100);
*/		ModelDavil4_6.SetPosition(davil3index2,450,-2050);
/*		ModelDavil3_1_1.Render();
		ModelDavil3_2_1.Render();
        ModelDavil3_3_1.Render();
		ModelDavil3_4_1.Render();
*/		if (wap6 < davillife)
		{
		   ModelDavil4_6.Render();
		}
		else
		{
			tempwap6++;
		}

/*		ModelDavil3_1_2.SetPosition(davil3index7,50,-2000);
		ModelDavil3_2_2.SetPosition(davil3index7,50,-2000);
		ModelDavil3_3_2.SetPosition(davil3index7,50,-2000);
		ModelDavil3_4_2.SetPosition(davil3index7,50,-2000);
*/		ModelDavil4_7.SetPosition(davil3index1,250,-1800);
/*		ModelDavil3_1_2.Render();
		ModelDavil3_2_2.Render();
        ModelDavil3_3_2.Render();
		ModelDavil3_4_2.Render();
*/		if (wap7 < davillife)
		{
		  ModelDavil4_7.Render();
		}
		else
		{
			tempwap7++;
		}

/*		ModelDavil3_1_3.SetPosition(davil3index8,50,-1550);
		ModelDavil3_2_3.SetPosition(davil3index8,50,-1550);
		ModelDavil3_3_3.SetPosition(davil3index8,50,-1550);
		ModelDavil3_4_3.SetPosition(davil3index8,50,-1550);
*/		ModelDavil4_8.SetPosition(davil3index8,250,-1350);
/*		ModelDavil3_1_3.Render();
		ModelDavil3_2_3.Render();
        ModelDavil3_3_3.Render();
		ModelDavil3_4_3.Render();
*/	    if (wap8 < davillife)
		{
		   ModelDavil4_8.Render();
		}
		else
		{
			tempwap8++;
		}

/*		ModelDavil3_1_4.SetPosition(davil3index2,300,-1200);
		ModelDavil3_2_4.SetPosition(davil3index2,300,-1200);
		ModelDavil3_3_4.SetPosition(davil3index2,300,-1200);
		ModelDavil3_4_4.SetPosition(davil3index2,300,-1200);
*/		ModelDavil4_9.SetPosition(davil3index2,400,-1100);
/*		ModelDavil3_1_4.Render();
		ModelDavil3_2_4.Render();
		ModelDavil3_3_4.Render();
		ModelDavil3_4_4.Render();
*/		if (wap9 < davillife)
		{
		   ModelDavil4_9.Render();
		}
		else
		{
			tempwap9++;
		}
    
/*		ModelDavil3_1_5.SetPosition(davil3index1,200,-1050);
		ModelDavil3_2_5.SetPosition(davil3index1,200,-1050);
		ModelDavil3_3_5.SetPosition(davil3index1,200,-1050);
		ModelDavil3_4_5.SetPosition(davil3index1,200,-1050);
*/		ModelDavil4_10.SetPosition(davil3index8,100,-1000);
/*		ModelDavil3_1_5.Render();
		ModelDavil3_2_5.Render();
        ModelDavil3_3_5.Render();
		ModelDavil3_4_5.Render();
*/		if (wap10 < davillife)
		{
		   ModelDavil4_10.Render();
		}
		else
		{
			tempwap10++;
		}

		ModelDavil3_1_6.SetPosition(davil3index1,300,-900);
		ModelDavil3_2_6.SetPosition(davil3index1,300,-900);
		ModelDavil3_3_6.SetPosition(davil3index1,300,-900);
		ModelDavil3_4_6.SetPosition(davil3index1,300,-900);
		ModelDavil4_11.SetPosition(davil3index1,100,-800);
		if (wap46 < davillife)
		{
			ModelDavil3_1_6.Render();
			ModelDavil3_2_6.Render();
			ModelDavil3_3_6.Render();
			ModelDavil3_4_6.Render();
		}
		else
		{
		    tempwap46++;
		}

		if (wap11 < davillife)
		{
		   ModelDavil4_11.Render();
		}
		else
		{
			tempwap11++;
		}

		ModelDavil3_1_7.SetPosition(davil3index2,50,-850);
		ModelDavil3_2_7.SetPosition(davil3index2,50,-850);
		ModelDavil3_3_7.SetPosition(davil3index2,50,-850);
		ModelDavil3_4_7.SetPosition(davil3index2,50,-850);
		ModelDavil4_12.SetPosition(davil3index3,550,-750);
		if (wap47 < davillife)
		{
			ModelDavil3_1_7.Render();
			ModelDavil3_2_7.Render();
			ModelDavil3_3_7.Render();
			ModelDavil3_4_7.Render();
		}
		else
		{
			tempwap47++;
		}

		if (wap12 < davillife)
		{
		   ModelDavil4_12.Render();
		}
		else
		{
			tempwap12++;
		}

		ModelDavil3_1_8.SetPosition(davil3index3,150,-650);
		ModelDavil3_2_8.SetPosition(davil3index3,150,-650);
		ModelDavil3_3_8.SetPosition(davil3index3,150,-650);
		ModelDavil3_4_8.SetPosition(davil3index3,150,-650);
		ModelDavil4_13.SetPosition(davil3index1,150,-650);
		if (wap48 < davillife)
		{
			ModelDavil3_1_8.Render();
			ModelDavil3_2_8.Render();
			ModelDavil3_3_8.Render();
			ModelDavil3_4_8.Render();
		}
		else
		{
			tempwap48++;
		}

		if (wap13 < davillife)
		{
		   ModelDavil4_13.Render();
		}
		else
		{
			tempwap13++;
		}
      
		ModelDavil3_1_9.SetPosition(davil3index4,250,-550);
		ModelDavil3_2_9.SetPosition(davil3index4,250,-550);
		ModelDavil3_3_9.SetPosition(davil3index4,250,-550);
		ModelDavil3_4_9.SetPosition(davil3index4,250,-550);
		ModelDavil4_14.SetPosition(davil3index1,250,-450);
		if (wap49 < davillife)
		{
			ModelDavil3_1_9.Render();
			ModelDavil3_2_9.Render();
			ModelDavil3_3_9.Render();
			ModelDavil3_4_9.Render();
		}
		else
		{
			tempwap49++;
		}

		if (wap14 < davillife)
		{
		  ModelDavil4_14.Render();
		}
		else
		{
			tempwap14++;
		}
        
		ModelDavil3_1_10.SetPosition(davil3index5,30,-350);
		ModelDavil3_2_10.SetPosition(davil3index5,30,-350);
		ModelDavil3_3_10.SetPosition(davil3index5,30,-350);
		ModelDavil3_4_10.SetPosition(davil3index5,30,-350);
		ModelDavil4_15.SetPosition(davil3index3,100,-300);
		if (wap50 < davillife)
		{
			ModelDavil3_1_10.Render();
			ModelDavil3_2_10.Render();
			ModelDavil3_3_10.Render();
			ModelDavil3_4_10.Render();
		}
		else
		{
			tempwap50++;
		}

		if (wap15 < davillife)
		{
		  ModelDavil4_15.Render();
		}
		else
		{
			tempwap15++;// = 0;
		}

		ModelDavil3_1_11.SetPosition(davil3index4,75,-250);
		ModelDavil3_2_11.SetPosition(davil3index4,75,-250);
		ModelDavil3_3_11.SetPosition(davil3index4,75,-250);
		ModelDavil3_4_11.SetPosition(davil3index4,75,-250);
		ModelDavil4_16.SetPosition(davil3index8,175,-200);
		if (wap51 < davillife)
		{
			ModelDavil3_1_11.Render();
			ModelDavil3_2_11.Render();
			ModelDavil3_3_11.Render();
			ModelDavil3_4_11.Render();
		}
		else
		{
			tempwap51++;
		}

		if (wap16 < davillife)
		{
		  ModelDavil4_16.Render();
		}
		else
		{
			tempwap16++;
		}

		ModelDavil3_1_12.SetPosition(davil3index1,150,-150);
		ModelDavil3_2_12.SetPosition(davil3index1,150,-150);
		ModelDavil3_3_12.SetPosition(davil3index1,150,-150);
		ModelDavil3_4_12.SetPosition(davil3index1,150,-150);
		ModelDavil4_17.SetPosition(davil3index2,200,-100);
		if (wap52 < davillife)
		{
			ModelDavil3_1_12.Render();
			ModelDavil3_2_12.Render();
			ModelDavil3_3_12.Render();
			ModelDavil3_4_12.Render();
		}
		else
		{
			tempwap52++;
		}

		if (wap17 < davillife)
		{
		  ModelDavil4_17.Render();
		}
		else
		{
			tempwap17++;
		}
    
		ModelDavil3_1_13.SetPosition(davil3index2,50,-50);
		ModelDavil3_2_13.SetPosition(davil3index2,50,-50);
		ModelDavil3_3_13.SetPosition(davil3index2,50,-50);
		ModelDavil3_4_13.SetPosition(davil3index2,50,-50);
		ModelDavil4_18.SetPosition(davil3index8,250,-50);
		if (wap53 < davillife)
		{
			ModelDavil3_1_13.Render();
			ModelDavil3_2_13.Render();
			ModelDavil3_3_13.Render();
			ModelDavil3_4_13.Render();
		}
		else
		{
			tempwap53++;
		}

		if (wap18 < davillife)
		{
		  ModelDavil4_18.Render();
		}
		else
		{
			tempwap18++;
		}

		ModelDavil3_1_14.SetPosition(davil3index1,150,-100);
		ModelDavil3_2_14.SetPosition(davil3index1,150,-100);
		ModelDavil3_3_14.SetPosition(davil3index1,150,-100);
		ModelDavil3_4_14.SetPosition(davil3index1,150,-100);
		ModelDavil4_19.SetPosition(davil3index1,50,-50);
		if (wap54 < davillife)
		{
			ModelDavil3_1_14.Render();
			ModelDavil3_2_14.Render();
			ModelDavil3_3_14.Render();
			ModelDavil3_4_14.Render();
		}
		else
		{
			tempwap54++;
		}

		if (wap19 < davillife)
		{
		  ModelDavil4_19.Render();
		}
		else
		{
			tempwap19++;
		}

		ModelDavil3_1_15.SetPosition(davil3index2,175,0);
		ModelDavil3_2_15.SetPosition(davil3index2,175,0);
		ModelDavil3_3_15.SetPosition(davil3index2,175,0);
		ModelDavil3_4_15.SetPosition(davil3index2,175,0);
		ModelDavil4_20.SetPosition(davil3index8,275,0);
		if (wap55 < davillife)
		{
			ModelDavil3_1_15.Render();
			ModelDavil3_2_15.Render();
			ModelDavil3_3_15.Render();
			ModelDavil3_4_15.Render();
		}
		else
		{
			tempwap55++;
		}

		if (wap20 < davillife)
		{
		  ModelDavil4_20.Render();
		}
		else
		{
			tempwap20++;
		}

		ModelDavil3_1_16.SetPosition(davil3index2,200,0);
		ModelDavil3_2_16.SetPosition(davil3index2,200,0);
		ModelDavil3_3_16.SetPosition(davil3index2,200,0);
		ModelDavil3_4_16.SetPosition(davil3index2,200,0);
		ModelDavil4_21.SetPosition(davil3index1,180,0);
		if (wap56 < davillife)
		{
			ModelDavil3_1_16.Render();
			ModelDavil3_2_16.Render();
			ModelDavil3_3_16.Render();
			ModelDavil3_4_16.Render();
		}
		else
		{
			tempwap56++;
		}

		if (wap21 < davillife)
		{
		  ModelDavil4_21.Render();
		}
		else
		{
			tempwap21++;
		}
    
		ModelDavil3_1_17.SetPosition(davil3index3,50,50);
		ModelDavil3_2_17.SetPosition(davil3index3,50,50);
		ModelDavil3_3_17.SetPosition(davil3index3,50,50);
		ModelDavil3_4_17.SetPosition(davil3index3,50,50);
		ModelDavil4_22.SetPosition(davil3index8,50,150);
		if (wap57 < davillife)
		{
			ModelDavil3_1_17.Render();
			ModelDavil3_2_17.Render();
			ModelDavil3_3_17.Render();
			ModelDavil3_4_17.Render();
		}
		else
		{
			tempwap57++;
		}

		if (wap22 < davillife)
		{
		  ModelDavil4_22.Render();
		}
		else
		{
		  tempwap22++;
		}
		ModelDavil3_1_18.SetPosition(davil3index7,150,100);
		ModelDavil3_2_18.SetPosition(davil3index7,150,100);
		ModelDavil3_3_18.SetPosition(davil3index7,150,100);
		ModelDavil3_4_18.SetPosition(davil3index7,150,100);
		ModelDavil4_23.SetPosition(davil3index1,200,120);
		if (wap58 < davillife)
		{
			ModelDavil3_1_18.Render();
			ModelDavil3_2_18.Render();
			ModelDavil3_3_18.Render();
			ModelDavil3_4_18.Render();
		}
		else
		{
			tempwap58++;
		}

		if (wap23 < davillife)
		{
		  ModelDavil4_23.Render();
        }
		else
		{
			tempwap23++;
		}

		ModelDavil3_1_19.SetPosition(davil3index4,250,250);
		ModelDavil3_2_19.SetPosition(davil3index4,250,250);
		ModelDavil3_3_19.SetPosition(davil3index4,250,250);
		ModelDavil3_4_19.SetPosition(davil3index4,250,250);
		ModelDavil4_24.SetPosition(davil3index4,500,200);
		if (wap59 < davillife)
		{
			ModelDavil3_1_19.Render();
			ModelDavil3_2_19.Render();
			ModelDavil3_3_19.Render();
			ModelDavil3_4_19.Render();
		}
		else
		{
			tempwap59++;
		}

		if (wap24 < davillife)
		{
		  ModelDavil4_24.Render();
		}
		else
		{
			tempwap24++;
		}

		ModelDavil3_1_20.SetPosition(davil3index2,250,400);
		ModelDavil3_2_20.SetPosition(davil3index2,250,400);
		ModelDavil3_3_20.SetPosition(davil3index2,250,400);
		ModelDavil3_4_20.SetPosition(davil3index2,250,400);
		ModelDavil4_25.SetPosition(davil3index8,550,400);
		if (wap60 < davillife)
		{
			ModelDavil3_1_20.Render();
			ModelDavil3_2_20.Render();
			ModelDavil3_3_20.Render();
			ModelDavil3_4_20.Render();
		}
		else
		{
			tempwap60++;
		}

		if (wap25 < davillife)
		{  
			ModelDavil4_25.Render();
		}
		else
		{
			tempwap25++;
		}
		ModelDavil3_1_1.SetPosition(davil3index8,350,500);
		ModelDavil3_2_1.SetPosition(davil3index8,350,500);
		ModelDavil3_3_1.SetPosition(davil3index8,350,500);
		ModelDavil3_4_1.SetPosition(davil3index8,350,500);
		ModelDavil4_26.SetPosition(davil3index2,50,700);
		if (wap41 < davillife)
		{
		 ModelDavil3_1_1.Render();
		 ModelDavil3_2_1.Render();
         ModelDavil3_3_1.Render();
		 ModelDavil3_4_1.Render();
		}
		else
		{
			tempwap41++;
		}

		if (wap26 < davillife)
		{
		   ModelDavil4_26.Render();
		}
		else
		{
			tempwap26++;
		}

		ModelDavil3_1_2.SetPosition(davil3index1,300,800);
		ModelDavil3_2_2.SetPosition(davil3index1,300,800);
		ModelDavil3_3_2.SetPosition(davil3index1,300,800);
		ModelDavil3_4_2.SetPosition(davil3index1,300,800);
		ModelDavil4_27.SetPosition(davil3index2,100,900);
		if (wap42 < davillife)
		{
			ModelDavil3_1_2.Render();
			ModelDavil3_2_2.Render();
			ModelDavil3_3_2.Render();
			ModelDavil3_4_2.Render();
		}
		else
		{
			tempwap42++;
		}

		if (wap27 < davillife)
		{
			ModelDavil4_27.Render();
		}
		else
		{
			tempwap27++;
		}

		ModelDavil3_1_3.SetPosition(davil3index7,50,1000);
		ModelDavil3_2_3.SetPosition(davil3index7,50,1000);
		ModelDavil3_3_3.SetPosition(davil3index7,50,1000);
		ModelDavil3_4_3.SetPosition(davil3index7,50,1000);
		ModelDavil4_28.SetPosition(davil3index1,150,800);
		if (wap43 < davillife)
		{
			ModelDavil3_1_3.Render();
			ModelDavil3_2_3.Render();
			ModelDavil3_3_3.Render();
			ModelDavil3_4_3.Render();
		}
		else
		{
			tempwap43++;
		}

		if (wap28 < davillife)
		{
		  ModelDavil4_28.Render();
		}
		else
		{
			tempwap28++;
		}

		ModelDavil3_1_4.SetPosition(davil3index2,30,1050);
		ModelDavil3_2_4.SetPosition(davil3index2,30,1050);
		ModelDavil3_3_4.SetPosition(davil3index2,30,1050);
		ModelDavil3_4_4.SetPosition(davil3index2,30,1050);
		ModelDavil4_29.SetPosition(davil3index2,130,1050);
		if (wap44 < davillife)
		{
			ModelDavil3_1_4.Render();
			ModelDavil3_2_4.Render();
			ModelDavil3_3_4.Render();
			ModelDavil3_4_4.Render();
		}
		else
		{
			tempwap44++;
		}

		if (wap29 < davillife)
		{
		   ModelDavil4_29.Render();
		}
		else
		{
			tempwap29++;
		}
		ModelDavil3_1_5.SetPosition(davil3index3,270,1250);
		ModelDavil3_2_5.SetPosition(davil3index3,270,1250);
		ModelDavil3_3_5.SetPosition(davil3index3,270,1250);
		ModelDavil3_4_5.SetPosition(davil3index3,270,1250);
		ModelDavil4_30.SetPosition(davil3index1,270,1350);
		if (wap45 < davillife)
		{
			ModelDavil3_1_5.Render();
			ModelDavil3_2_5.Render();
			ModelDavil3_3_5.Render();
			ModelDavil3_4_5.Render();
		}
		else
		{
			tempwap45++;
		}

		if (wap30 < davillife)
		{
		  ModelDavil4_30.Render();
		}
		else
		{
			tempwap30++;
		}

/*		ModelDavil3_1.SetPosition(davil3index1,100,1500);
		ModelDavil3_2.SetPosition(davil3index1,100,1500);
		ModelDavil3_3.SetPosition(davil3index1,100,1500);
		ModelDavil3_4.SetPosition(davil3index1,100,1500);
*/		ModelDavil4_31.SetPosition(davil3index3,30,1600);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap31 < davillife)
		{
		  ModelDavil4_31.Render();
		}
		else
		{
			tempwap31++;
		}
/*		ModelDavil3_1.SetPosition(davil3index3,250,1750);
		ModelDavil3_2.SetPosition(davil3index3,250,1750);
		ModelDavil3_3.SetPosition(davil3index3,250,1750);
		ModelDavil3_4.SetPosition(davil3index3,250,1750);
*/		ModelDavil4_32.SetPosition(davil3index8,50,1750);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
*/		if (wap32 < davillife)
		{
			ModelDavil4_32.Render();
		}
		else
		{
			tempwap32++;
		}
/*		ModelDavil3_1.SetPosition(davil3index1,50,1850);
		ModelDavil3_2.SetPosition(davil3index1,50,1850);
		ModelDavil3_3.SetPosition(davil3index1,50,1850);
		ModelDavil3_4.SetPosition(davil3index1,50,1850);
*/		ModelDavil4_33.SetPosition(davil3index2,50,1950);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
		ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap33 < davillife)
		{
			ModelDavil4_33.Render();
		}
		else
		{
			tempwap33++;
		}

/*		ModelDavil3_1.SetPosition(davil3index4,250,2050);
		ModelDavil3_2.SetPosition(davil3index4,250,2050);
		ModelDavil3_3.SetPosition(davil3index4,250,2050);
		ModelDavil3_4.SetPosition(davil3index4,250,2050);
*/		ModelDavil4_34.SetPosition(davil3index1,150,2150);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap34 < davillife)
		{
		  ModelDavil4_34.Render();
		}
		else
		{
			tempwap34++;
		}
/*		ModelDavil3_1.SetPosition(davil3index3,50,2350);
		ModelDavil3_2.SetPosition(davil3index3,50,2350);
		ModelDavil3_3.SetPosition(davil3index3,50,2350);
		ModelDavil3_4.SetPosition(davil3index3,50,2350);
*/		ModelDavil4_35.SetPosition(davil3index8,150,2350);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap35 < davillife)
		{
			ModelDavil4_35.Render();
		}
		else
		{
			tempwap35++;
		}
/*		ModelDavil3_1.SetPosition(davil3index2,75,2450);
		ModelDavil3_2.SetPosition(davil3index2,75,2450);
		ModelDavil3_3.SetPosition(davil3index2,75,2450);
		ModelDavil3_4.SetPosition(davil3index2,75,2450);
*/		ModelDavil4_36.SetPosition(davil3index8,75,2600);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap36 < davillife)
		{
			ModelDavil4_36.Render();
		}
		else
		{
			tempwap36++;
		}
/*		ModelDavil3_1.SetPosition(davil3index3,25,2750);
		ModelDavil3_2.SetPosition(davil3index3,25,2750);
		ModelDavil3_3.SetPosition(davil3index3,25,2750);
		ModelDavil3_4.SetPosition(davil3index3,25,2750);
*/		ModelDavil4_37.SetPosition(davil3index8,50,2800);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
		ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap37 < davillife)
		{
			ModelDavil4_37.Render();
		}
		else
		{
			tempwap37++;
		}
/*		ModelDavil3_1.SetPosition(davil3index8,150,2850);
		ModelDavil3_2.SetPosition(davil3index8,150,2850);
		ModelDavil3_3.SetPosition(davil3index8,150,2850);
		ModelDavil3_4.SetPosition(davil3index8,150,2850);
*/		ModelDavil4_38.SetPosition(davil3index2,250,2850);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap38 < davillife)
		{
			ModelDavil4_38.Render();
		}
		else
		{
			tempwap38++;
		}
/*		ModelDavil3_1.SetPosition(davil3index1,50,2900);
		ModelDavil3_2.SetPosition(davil3index1,50,2900);
		ModelDavil3_3.SetPosition(davil3index1,50,2900);
		ModelDavil3_4.SetPosition(davil3index1,50,2900);
*/		ModelDavil4_39.SetPosition(davil3index8,150,3050);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap39 < davillife)
		{
			ModelDavil4_39.Render();
		}
		else
		{
			tempwap39++;
		}
/*		ModelDavil3_1.SetPosition(davil3index4,20,3000);
		ModelDavil3_2.SetPosition(davil3index4,20,3000);
		ModelDavil3_3.SetPosition(davil3index4,20,3000);
		ModelDavil3_4.SetPosition(davil3index4,20,3000);
*/		ModelDavil4_40.SetPosition(davil3index1,150,3150);
/*		ModelDavil3_1.Render();
		ModelDavil3_2.Render();
        ModelDavil3_3.Render();
		ModelDavil3_4.Render();
*/		if (wap21 < davillife)
		{
		   ModelDavil4_40.Render();
		}
		else
		{
			tempwap40++;
		}

        if (tempwap1 > 5000) wap1 = 0;
		if (tempwap2 > 5000) wap2 = 0;
        if (tempwap3 > 5000) wap3 = 0;
		if (tempwap4 > 5000) wap4 = 0;
		if (tempwap5 > 5000) wap5 = 0;
		if (tempwap6 > 5000) wap6 = 0;
        if (tempwap7 > 5000) wap7 = 0;
		if (tempwap8 > 5000) wap8 = 0;
		if (tempwap9 > 5000) wap9 = 0;
		if (tempwap10 > 5000) wap10 = 0;
        if (tempwap11 > 5000) wap11 = 0;
		if (tempwap12 > 5000) wap12 = 0;
		if (tempwap13 > 5000) wap13 = 0;
		if (tempwap14 > 5000) wap14 = 0;
        if (tempwap15 > 5000) wap15 = 0;
		if (tempwap16 > 5000) wap16 = 0;
		if (tempwap17 > 5000) wap17 = 0;
		if (tempwap18 > 5000) wap18 = 0;
        if (tempwap19 > 5000) wap19 = 0;
		if (tempwap20 > 5000) wap20 = 0;
		if (tempwap21 > 5000) wap21 = 0;
		if (tempwap22 > 5000) wap22 = 0;
        if (tempwap23 > 5000) wap23 = 0;
		if (tempwap24 > 5000) wap24 = 0;
		if (tempwap25 > 5000) wap25 = 0;
		if (tempwap26 > 5000) wap26 = 0;
		if (tempwap27 > 5000) wap27 = 0;
		if (tempwap28 > 5000) wap28 = 0;
        if (tempwap29 > 5000) wap29 = 0;
		if (tempwap30 > 5000) wap30 = 0;
		if (tempwap31 > 5000) wap31 = 0;
		if (tempwap32 > 5000) wap32 = 0;
        if (tempwap33 > 5000) wap33 = 0;
		if (tempwap34 > 5000) wap34 = 0;
		if (tempwap35 > 5000) wap35 = 0;
		if (tempwap36 > 5000) wap36 = 0;
        if (tempwap37 > 5000) wap37 = 0;
		if (tempwap38 > 5000) wap38 = 0;
		if (tempwap39 > 5000) wap39 = 0;
		if (tempwap40 > 5000) wap40 = 0;
        if (tempwap41 > 5000) wap41 = 0;
		if (tempwap42 > 5000) wap42 = 0;
		if (tempwap43 > 5000) wap43 = 0;
		if (tempwap44 > 5000) wap44 = 0;
        if (tempwap45 > 5000) wap45 = 0;
		if (tempwap46 > 5000) wap46 = 0;
		if (tempwap47 > 5000) wap47 = 0;
		if (tempwap48 > 5000) wap48 = 0;
        if (tempwap49 > 5000) wap49 = 0;
		if (tempwap50 > 5000) wap50 = 0;
		if (tempwap51 > 5000) wap51 = 0;
		if (tempwap52 > 5000) wap52 = 0;
        if (tempwap53 > 5000) wap53 = 0;
		if (tempwap54 > 5000) wap54 = 0;
		if (tempwap55 > 5000) wap55 = 0;
		if (tempwap56 > 5000) wap56 = 0;
		if (tempwap57 > 5000) wap57 = 0;
		if (tempwap58 > 5000) wap58 = 0;
        if (tempwap59 > 5000) wap59 = 0;
		if (tempwap60 > 5000) wap60 = 0;



		if(davil3index1-vEyeAt.x > 600) 
			{ davil3index1 = vEyeAt.x-600.0; }
		if(davil3index1-vEyeAt.x < -600) 
			{ davil3index1 = vEyeAt.x+600.0; }
		if(davil3index2-vEyeAt.x > 500) 
			{ davil3index2 = vEyeAt.x-500.0; }
		if(davil3index2-vEyeAt.x < -500) 
			{ davil3index2 = vEyeAt.x+500.0; }
		if(davil3index3-vEyeAt.x > 550) 
			{ davil3index3 = vEyeAt.x-550.0; }
		if(davil3index3-vEyeAt.x < -550) 
			{ davil3index3 = vEyeAt.x+550.0; }
		if(davil3index4-vEyeAt.x > 700) 
			{ davil3index4 = vEyeAt.x-700.0; }
		if(davil3index4-vEyeAt.x < -700) 
			{ davil3index4 = vEyeAt.x+700.0; }
		if(davil3index5-vEyeAt.x > 500) 
			{ davil3index5 = vEyeAt.x-500.0; }
		if(davil3index5-vEyeAt.x < -500) 
			{ davil3index5 = vEyeAt.x+500.0; }
		if(davil3index6-vEyeAt.x > 600) 
			{ davil3index6 = vEyeAt.x-600.0; }
		if(davil3index6-vEyeAt.x < -600) 
			{ davil3index6 = vEyeAt.x+600.0; }
		if(davil3index7-vEyeAt.x > 700) 
			{ davil3index7 = vEyeAt.x-700.0; }
		if(davil3index7-vEyeAt.x < -700) 
			{ davil3index7 = vEyeAt.x+700.0; }
		if(davil3index8-vEyeAt.x > 400) 
			{ davil3index8 = vEyeAt.x-400.0; }
		if(davil3index8-vEyeAt.x < -400) 
			{ davil3index8 = vEyeAt.x+400.0; }
		
}
void CMyGlApp::ProcessComData(BYTE *pData)
{
	int id = 0;
	char TempX[5], TempY[5];
	CopyMemory(TempX, pData + 1, 4);
	CopyMemory(TempY, pData + 5, 4);
	TempX[4] = TempY[4] = 0;

	float x = float(atoi(TempX));
	float y = float(atoi(TempY));

	CRect rect(m_calibase[0], m_calibase[8]);
	if (!rect.PtInRect(CPoint(int(x), int(y) )))
	{
		return;
	}

	int Q = 0;
	if (x <= m_calibase[4].x)
	{
       if (y <= m_calibase[4].y)
	   {
           Q = 1;
		}
		else
		{
           Q = 3;
		}
	}
	else
	{
        if (y <= m_calibase[4].y)
		{
			Q = 2;
		}
		else
		{
            Q = 4;
		}        
    }

	CRect rcClient;
	GetClientRect(m_hWnd, rcClient);

	switch( Q)
	{
		case 0:
			return;
		case 1:
			x -= m_calibase[0].x + (m_calibase[3].x - m_calibase[0].x) / 2;
			y -= m_calibase[0].y + (m_calibase[1].y - m_calibase[0].y) / 2;
			x = rcClient.Width() / 2 * x / ((float) ((m_calibase[1].x - m_calibase[0].x) + (m_calibase[4].x - m_calibase[3].x)) / 2.0f);
			y = rcClient.Height() / 2 * y / ((float) ((m_calibase[3].y - m_calibase[0].y) + (m_calibase[4].y - m_calibase[1].y)) / 2.0f);
			break;
		case 2:
			x -= m_calibase[1].x + (m_calibase[4].x - m_calibase[1].x) / 2;
			y -= m_calibase[1].y + (m_calibase[2].y - m_calibase[1].y) / 2;
			x = rcClient.Width() / 2 * x / ((float) ((m_calibase[2].x - m_calibase[1].x) + (m_calibase[5].x - m_calibase[4].x)) / 2.0f) + rcClient.Width()/2;
			y = rcClient.Height() / 2 * y / ((float) ((m_calibase[4].y - m_calibase[1].y) + (m_calibase[5].y - m_calibase[2].y)) / 2.0f);
			break;
		case 3:
			x -= m_calibase[3].x + (m_calibase[6].x - m_calibase[3].x) / 2;
			y -= m_calibase[3].y + (m_calibase[4].y - m_calibase[3].y) / 2;
			x = rcClient.Width() / 2  * x / ((float) ((m_calibase[4].x - m_calibase[3].x) + (m_calibase[7].x - m_calibase[6].x)) / 2.0f);
			y = rcClient.Height() / 2 * y / ((float) ((m_calibase[6].y - m_calibase[3].y) + (m_calibase[7].y - m_calibase[4].y)) / 2.0f) + rcClient.Height()/2;
			break;
		case 4:
			x -= m_calibase[4].x + (m_calibase[7].x - m_calibase[4].x) / 2;
			y -= m_calibase[4].y + (m_calibase[5].y - m_calibase[4].y) / 2;
			x = rcClient.Width() / 2  * x / ((float) ((m_calibase[5].x - m_calibase[4].x) + (m_calibase[8].x - m_calibase[7].x)) / 2.0f) + rcClient.Width()/2;
			y = rcClient.Height() / 2 * y / ((float) ((m_calibase[7].y - m_calibase[4].y) + (m_calibase[8].y - m_calibase[5].y)) / 2.0f) + rcClient.Height()/2;
			break;
	}
	
	m_shootx = x;
	m_shooty = y;	
	m_bShoot = TRUE;
}


