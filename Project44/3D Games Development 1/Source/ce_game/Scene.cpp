// Scene.cpp: implementation of the CScene class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Scene.h"
#include "MyGlApp.h"
#include "SoundContainer.h"

SCENE_PAGE	CScene::s_oPage=MENU_000;
//SCENE_PAGE	CScene::s_oPage=LOADING;
CEffectBillboardList CScene::s_oCloudList;
CMyGlApp*		CScene::s_pMyGlApp=NULL;
CSLandModel		CScene::s_oScene[NUM_SCENE_OBJ];
CStaticModel	CScene::s_oScene2[NUM_SCENE2_OBJ];
CTina			CScene::s_oPlayer;
CTony			CScene::s_oPlayer2;
CActor*			CScene::s_pActor[NUM_ACTOR_OBJ];
CEnvObj			CScene::s_oEnvObj[NUM_ENV0_OBJ+NUM_ENV1_OBJ+NUM_ENV2_OBJ];
CTina			CScene::s_oTina[NUM_TINA_OBJ];
CTony			CScene::s_oTony[NUM_TONY_OBJ];
CUseTexture		CScene::s_oTexture[NUM_TEXTURE];

/*
------------+-----------------------------------------------------------------------------
 Function	| CScene()
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CScene::CScene()
{
}


/*
------------+-----------------------------------------------------------------------------
 Function	| ~CScene()
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CScene::~CScene()
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
HRESULT CScene::OneTimeSceneInit(CMyGlApp* pApp)
{
	s_pMyGlApp = pApp;

	for(int i=0; i<NUM_ACTOR_OBJ; i++)
	{
		s_pActor[i]=NULL;
	}

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
HRESULT CScene::FinalCleanup(void)
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
HRESULT CScene::InitDeviceObjects(GLvoid)
{
/*	// Load land of scene
	CMyGlApp::ShowLoading(5.0f,"Load model : Land");
	s_oScene[0].LoadModel( "Resource\\Model\\scene_000_especial01.maf" );
	s_oScene[1].LoadModel( "Resource\\Model\\scene_000_ewall04.maf" );
	s_oScene[2].LoadModel( "Resource\\Model\\scene_000_tile01.maf" );
	s_oScene[3].LoadModel( "Resource\\Model\\scene_000_tile02.maf" );
	s_oScene[4].LoadModel( "Resource\\Model\\scene_000_vorsprung01.maf" );
	s_oScene[5].LoadModel( "Resource\\Model\\scene_000_wall003.maf" );
	s_oScene[6].LoadModel( "Resource\\Model\\scene_000_wall01_23.maf" );

	CMyGlApp::ShowLoading(100.0f,"Player Tina");
	s_oPlayer.LoadAnimModel();

	int iActor = 0;
	CMyGlApp::ShowLoading(100.0f,"Actor Model");
	for(int i=0; i<NUM_TINA_OBJ; i++)
	{
		s_oTina[i].LoadAnimModel();
		
		s_pActor[iActor]=&s_oTina[i];
		iActor++;
	}
*/
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
HRESULT CScene::DeleteDeviceObjects(GLvoid)
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
HRESULT CScene::FrameMove( float fElapsedTime )
{
//	s_oPlayer.Process( fElapsedTime );
	static float fLastTime = fElapsedTime;
	static float fBaseTime = fElapsedTime;
	switch( s_oPage )
	{
		case MENU_000:
		{
			if( s_pMyGlApp->m_arKey[VK_SPACE] ) 
			{
				s_oPage = LOADING;
			}
		}
		break;

		case LOADING:
		{
			FrameMoveLoading();
			s_oPage = GAMELOOP;
		}
		break;

		case GAMELOOP:
		{
			if(!CSoundContainer::s_oSound[SOUND_BACKGROUND00].IsSoundPlaying())
				CSoundContainer::s_oSound[SOUND_BACKGROUND00].Play();

			if( s_pMyGlApp->m_arKey[VK_END] ) 
			{
			fLastTime += fElapsedTime;
			if( 0.150f>(fLastTime-fBaseTime) )
			{
				return S_OK;
			}
				s_oPage = GAMEOVER;
				fBaseTime = fLastTime = fElapsedTime;
			}
//			s_oPlayer.ProcessKey( fElapsedTime, rcScreen, &m_arKey[0] );
			int iNumEnv = NUM_ENV0_OBJ+NUM_ENV1_OBJ+NUM_ENV2_OBJ;
			for(int i=0; i<iNumEnv; i++)
			{
				if( !s_oEnvObj[i].IsDead() )
					s_oEnvObj[i].Process( fElapsedTime );
			}

			for(i=0; i<NUM_TINA_OBJ; i++)
			{
//				if( !s_oTina[i].IsDead() )
				s_oTina[i].Process( fElapsedTime );
			}

			for(i=0; i<NUM_TONY_OBJ; i++)
			{
//				if( !s_oTina[i].IsDead() )
				s_oTony[i].Process( fElapsedTime );
			}
		}
		break;

		case GAMELOOP_INFO:
		{
		}
		break;

		case GAMEOVER:
		{
			if( s_pMyGlApp->m_arKey[VK_SPACE] ) 
			{
			fLastTime += fElapsedTime;
			if( 0.150f>(fLastTime-fBaseTime) )
			{
				return S_OK;
			}
				s_oPage = GAMELOOP;
				fBaseTime = fLastTime = fElapsedTime;
			}
		}
		break;

		case VICTORY:
		{
		}
		break;
	}

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
HRESULT CScene::Render(void)
{
	switch( s_oPage )
	{
		case MENU_000:
		{
			RenderMenu000();
		}
		break;

		case LOADING:
		{
			RenderLoading();
		}
		break;

		case GAMELOOP:
		{
			RenderGameLoop();
		}
		break;

		case GAMELOOP_INFO:
		{
		}
		break;

		case GAMEOVER:
		{
			RenderGameOver();
		}
		break;

		case VICTORY:
		{
		}
		break;
	}

	// Rendering is finished
	return S_OK;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHeight
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CScene::FrameMoveLoading(void)
{
	static bool bFirst = true;
	if( !bFirst )
	{
		return S_OK;
	}
	bFirst = false;


	// Load sound of scene
	CSoundContainer::OneTimeSceneInit();
		
	// Load land of scene
	CScene::InitDeviceObjects();

	// Load land of scene
	CMyGlApp::ShowLoading(5.0f,"Load model : Scene AJ");
	s_oScene[0].LoadModel( "Resource\\Model\\Scene\\scene000_003.maf" );
	s_oScene[1].LoadModel( "Resource\\Model\\Scene\\scene000_004.maf" );

	CMyGlApp::ShowLoading(15.0f,"Load model : Scene Tos");
	s_oScene[2].LoadModel( "Resource\\Model\\Scene\\scene001_002.maf" );
	CMyGlApp::ShowLoading(17.0f,"Load model : Scene Tos");
	s_oScene[3].LoadModel( "Resource\\Model\\Scene\\scene001_004.maf" );
	CMyGlApp::ShowLoading(20.0f,"Load model : Scene Tos");
	s_oScene[4].LoadModel( "Resource\\Model\\Scene\\scene001_006.maf" );
	CMyGlApp::ShowLoading(25.0f,"Load model : Scene Tos");
	s_oScene[5].LoadModel( "Resource\\Model\\Scene\\scene001_008.maf" );
	CMyGlApp::ShowLoading(27.0f,"Load model : Scene Tos");
	s_oScene[6].LoadModel( "Resource\\Model\\Scene\\scene001_011.maf" );
	CMyGlApp::ShowLoading(29.0f,"Load model : Scene Tos");
	s_oScene[7].LoadModel( "Resource\\Model\\Scene\\scene001_014.maf" );
	CMyGlApp::ShowLoading(31.0f,"Load model : Scene Tos");
	s_oScene[8].LoadModel( "Resource\\Model\\Scene\\scene001_016.maf" );
	CMyGlApp::ShowLoading(32.0f,"Load model : Scene Tos");
	s_oScene[9].LoadModel( "Resource\\Model\\Scene\\scene001_017.maf" );
	CMyGlApp::ShowLoading(35.0f,"Load model : Scene Tos");
	s_oScene[10].LoadModel( "Resource\\Model\\Scene\\scene001_018.maf" );
	CMyGlApp::ShowLoading(37.0f,"Load model : Scene Tos");
	s_oScene[11].LoadModel( "Resource\\Model\\Scene\\scene001_019.maf" );
	CMyGlApp::ShowLoading(40.0f,"Load model : Scene Tos");
	s_oScene[12].LoadModel( "Resource\\Model\\Scene\\scene001_020.maf" );
	CMyGlApp::ShowLoading(43.0f,"Load model : Scene Tos");
	s_oScene[13].LoadModel( "Resource\\Model\\Scene\\scene002_001.maf" );
	CMyGlApp::ShowLoading(45.0f,"Load model : Scene Tos");
	s_oScene[14].LoadModel( "Resource\\Model\\Scene\\scene002_003.maf" );
	CMyGlApp::ShowLoading(47.0f,"Load model : Scene Tos");
	s_oScene[15].LoadModel( "Resource\\Model\\Scene\\scene002_004.maf" );
	CMyGlApp::ShowLoading(49.0f,"Load model : Scene Tos");
	s_oScene[16].LoadModel( "Resource\\Model\\Scene\\scene002_006.maf" );
	CMyGlApp::ShowLoading(50.0f,"Load model : Scene Tos");
	s_oScene[17].LoadModel( "Resource\\Model\\Scene\\scene002_008.maf" );
	CMyGlApp::ShowLoading(52.0f,"Load model : Scene Tos");
	s_oScene[18].LoadModel( "Resource\\Model\\Scene\\scene002_009.maf" );
	CMyGlApp::ShowLoading(55.0f,"Load model : Scene Tos");
	s_oScene[19].LoadModel( "Resource\\Model\\Scene\\scene002_010.maf" );
	CMyGlApp::ShowLoading(57.0f,"Load model : Scene Tos");
	s_oScene[20].LoadModel( "Resource\\Model\\Scene\\scene002_012.maf" );
	CMyGlApp::ShowLoading(59.0f,"Load model : Scene Tos");
	s_oScene[21].LoadModel( "Resource\\Model\\Scene\\scene002_016.maf" );

	// ----------------Load scene that no collission detect------------------------
//	s_oScene2[0].LoadModel( "Resource\\Model\\Scene\\scene002_016.maf" );
	s_oScene2[0].LoadModel( "Resource\\Model\\Scene\\scene001_000.maf" );
	CMyGlApp::ShowLoading(62.0f,"Load model : Scene Tos");
	s_oScene2[1].LoadModel( "Resource\\Model\\Scene\\scene001_001.maf" );

	CMyGlApp::ShowLoading(65.0f,"Load model : Scene Tos");
	s_oScene2[2].LoadModel( "Resource\\Model\\Scene\\scene001_003.maf" );
	CMyGlApp::ShowLoading(68.0f,"Load model : Scene Tos");
	s_oScene2[3].LoadModel( "Resource\\Model\\Scene\\scene001_005.maf" );
	CMyGlApp::ShowLoading(70.0f,"Load model : Scene Tos");
	s_oScene2[4].LoadModel( "Resource\\Model\\Scene\\scene001_007.maf" );
	CMyGlApp::ShowLoading(73.0f,"Load model : Scene Tos");
	s_oScene2[5].LoadModel( "Resource\\Model\\Scene\\scene001_009.maf" );
	CMyGlApp::ShowLoading(75.0f,"Load model : Scene Tos");
	s_oScene2[6].LoadModel( "Resource\\Model\\Scene\\scene001_010.maf" );
	CMyGlApp::ShowLoading(77.0f,"Load model : Scene Tos");
	s_oScene2[7].LoadModel( "Resource\\Model\\Scene\\scene001_012.maf" );
	CMyGlApp::ShowLoading(79.0f,"Load model : Scene Tos");
	s_oScene2[8].LoadModel( "Resource\\Model\\Scene\\scene001_013.maf" );
	CMyGlApp::ShowLoading(81.0f,"Load model : Scene Tos");
	s_oScene2[9].LoadModel( "Resource\\Model\\Scene\\scene001_015.maf" );
	CMyGlApp::ShowLoading(82.0f,"Load model : Scene Tos");
	s_oScene2[10].LoadModel( "Resource\\Model\\Scene\\scene002_000.maf" );
	CMyGlApp::ShowLoading(83.0f,"Load model : Scene Tos");
	s_oScene2[11].LoadModel( "Resource\\Model\\Scene\\scene002_002.maf" );
	CMyGlApp::ShowLoading(84.0f,"Load model : Scene Tos");
	s_oScene2[12].LoadModel( "Resource\\Model\\Scene\\scene002_005.maf" );
	CMyGlApp::ShowLoading(85.0f,"Load model : Scene Tos");
	s_oScene2[13].LoadModel( "Resource\\Model\\Scene\\scene002_007.maf" );
	CMyGlApp::ShowLoading(86.0f,"Load model : Scene Tos");
	s_oScene2[14].LoadModel( "Resource\\Model\\Scene\\scene002_011.maf" );
	CMyGlApp::ShowLoading(87.0f,"Load model : Scene Tos");
	s_oScene2[15].LoadModel( "Resource\\Model\\Scene\\scene002_013.maf" );
	CMyGlApp::ShowLoading(88.0f,"Load model : Scene Tos");
	s_oScene2[16].LoadModel( "Resource\\Model\\Scene\\scene002_014.maf" );
	CMyGlApp::ShowLoading(89.0f,"Load model : Scene Tos");
	s_oScene2[17].LoadModel( "Resource\\Model\\Scene\\scene002_017.maf" );

	// -----------------------------------------------------------------------------------
	CMyGlApp::ShowLoading(90.0f,"Player Tina");
	s_oPlayer.LoadAnimModel();
	s_oPlayer.SetPosition( 120.f, s_oPlayer.Py(),  800.f);
	s_oPlayer.IncreaseHP(100);
	s_pMyGlApp->m_oCamera.SetEye(CVector3f( 120.f+50.f, s_oPlayer.Py(),  800.f+50.f));

	int iActor = 0;

	// -----------------------------------------------------------------------------------
	CMyGlApp::ShowLoading(91.0f,"Actor Model: Tina");
	for(int i=0; i<NUM_TINA_OBJ; i++)
	{
		s_oTina[i].LoadAnimModel();

		s_pActor[iActor]=&s_oTina[i];
		iActor++;
	}

	// Specific tina ai as initial position
	s_oTina[0].SetPosition( 20.f, s_oTina[0].Py(),  -60.f);
	s_oTina[1].SetPosition( 320.f, s_oTina[1].Py(),  785.f);
	s_oTina[2].SetPosition( 570.f, s_oTina[2].Py(),  -145.f);
	s_oTina[3].SetPosition( -360.f, s_oTina[3].Py(),   40.f);
	s_oTina[4].SetPosition( 335.f, s_oTina[4].Py(),  1355.f);

	// -----------------------------------------------------------------------------------
	CMyGlApp::ShowLoading(92.0f,"Actor Model: Tony");
	for(int ii=0; ii<NUM_TONY_OBJ; ii++)
	{
		s_oTony[ii].LoadAnimModel();

		s_pActor[iActor]=&s_oTony[ii];
		iActor++;
	}

	// Specific tina ai as initial position
	s_oTony[0].SetPosition( 690.f, s_oTony[0].Py(),  -440.f);
	s_oTony[1].SetPosition( 960.f, s_oTony[0].Py(),  -280.f);
	s_oTony[2].SetPosition( 880.f, s_oTony[0].Py(),  250.f);
	s_oTony[3].SetPosition( 115.f, s_oTony[0].Py(),  1088.f);
	s_oTony[4].SetPosition( -65.f, s_oTony[0].Py(),  830.f);
	s_oTony[5].SetPosition( 300.f, s_oTony[0].Py(),  40.f);
	s_oTony[6].SetPosition( -100.f, s_oTony[0].Py(),  300.f);
	s_oTony[7].SetPosition( 1060.f, s_oTony[0].Py(),  700.f);

	// -----------------------------------------------------------------------------------
	CMyGlApp::ShowLoading(93.0f,"Environment Model 0");
	for(i=0; i<NUM_ENV0_OBJ; i++)
	{
		s_oEnvObj[i].LoadAnimModel();
		
		s_pActor[iActor]=&s_oEnvObj[i];
		iActor++;
	}

	CMyGlApp::ShowLoading(94.0f,"Environment Model 1");
	int iUpperEnv1 = i+NUM_ENV1_OBJ;
	for(/**/; i<iUpperEnv1; i++)
	{
		s_oEnvObj[i].SetEnvType(CActor::ENVOBJ1);
		s_oEnvObj[i].LoadAnimModel();
		
		s_pActor[iActor]=&s_oEnvObj[i];
		iActor++;
	}

	CMyGlApp::ShowLoading(95.0f,"Environment Model 2");
	int iUpperEnv2 = i+NUM_ENV2_OBJ;
	for(/**/; i<iUpperEnv2; i++)
	{
		s_oEnvObj[i].SetEnvType(CActor::ENVOBJ2);
		s_oEnvObj[i].LoadAnimModel();
		
		s_pActor[iActor]=&s_oEnvObj[i];
		iActor++;
	}
//Health 10 objects ----------------------------
	s_oEnvObj[0].SetPosition( -350.f, s_oEnvObj[0].Py(), -30.f);
	s_oEnvObj[1].SetPosition( -350.f, s_oEnvObj[0].Py(), 360.f);
	s_oEnvObj[2].SetPosition( -80.f, s_oEnvObj[0].Py(),  -60.f);
	s_oEnvObj[3].SetPosition( 350.f, s_oEnvObj[0].Py(),  95.f);
	s_oEnvObj[4].SetPosition( 20.f, s_oEnvObj[0].Py(),   60.f);
	s_oEnvObj[5].SetPosition( 1070.f, s_oEnvObj[0].Py(), -400.f);
	s_oEnvObj[6].SetPosition( 870.f, s_oEnvObj[0].Py(),  -80.f);
	s_oEnvObj[7].SetPosition( 350.f, s_oEnvObj[0].Py(),  -6000.f);
	s_oEnvObj[8].SetPosition( -88.f, s_oEnvObj[0].Py(),  1075.f);
	s_oEnvObj[9].SetPosition( 414.f, s_oEnvObj[0].Py(),  1360.f);
//Bullet 1 ,7 objects
	s_oEnvObj[10].SetPosition( 160.f, s_oEnvObj[0].Py(), -175.f);
	s_oEnvObj[11].SetPosition( -165.f, s_oEnvObj[0].Py(),125.f);
	s_oEnvObj[12].SetPosition( 145.f, s_oEnvObj[0].Py(), 300.f);
	s_oEnvObj[13].SetPosition( 520.f, s_oEnvObj[0].Py(), -460.f);
	s_oEnvObj[14].SetPosition( 460.f, s_oEnvObj[0].Py(), 50.f);
	s_oEnvObj[15].SetPosition( -180.f, s_oEnvObj[0].Py(),1355.f);
	s_oEnvObj[16].SetPosition( 1060.f, s_oEnvObj[0].Py(),794.f);
//Bullet 2 ,5 objects
	s_oEnvObj[17].SetPosition( 330.f, s_oEnvObj[0].Py(), 1100.f);
	s_oEnvObj[18].SetPosition( -145.f, s_oEnvObj[0].Py(),-300.f);
	s_oEnvObj[19].SetPosition( 0.f, s_oEnvObj[0].Py(),   0.f);
	s_oEnvObj[20].SetPosition( 940.f, s_oEnvObj[0].Py(), -420.f);
	s_oEnvObj[21].SetPosition( 700.f, s_oEnvObj[0].Py(), 250.f);

	// Load textures
	CMyGlApp::ShowLoading(96.0f,"Load Texture : cloud");
	s_oTexture[TEXTURE_CLOUD].Use( "Resource\\Texture\\cloud.tga" );

	CMyGlApp::ShowLoading(97.0f,"Load Texture : fire");
	s_oTexture[TEXTURE_FIRE].Use( "Resource\\Texture\\FireBomb.tga" );

	CMyGlApp::ShowLoading(98.0f,"Load Texture : blue plasma");
	s_oTexture[TEXTURE_PLASMA].Use( "Resource\\Texture\\blue_plasma.tga" );

	CMyGlApp::ShowLoading(99.0f,"Load Texture : light 000");
	s_oTexture[TEXTURE_LIGHT000].Use( "Resource\\Texture\\light_000.tga" );

	CMyGlApp::ShowLoading(100.0f,"Load Texture : Tina");
	s_oTexture[TEXTURE_TINAINF].Use( "Resource\\Texture\\TinaInf.tga" );

	CMyGlApp::ShowLoading(100.0f,"Load Texture : Shadow");
	s_oTexture[TEXTURE_SHADOW].Use( "Resource\\Texture\\Shadow.tga" );

	return S_OK;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHeight
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CScene::RenderMenu000(void)
{
	// 2D begin---------------------------------------------------------------------------
	CMyCamera Camera2D;
	Camera2D.SetViewParams
	(  
		CVector3f( 0.0f, 0.0f, 0.0f ),
		CVector3f( 0.0f, 0.0f, 1.0f ),
		CVector3f( 0.0f, 1.0f, 0.0f )
	);

	GLGfx::SetMatWorld(&cs::IMat);
	Camera2D.Render();

	// Disable depth test for 2d drawing
	BOOL bIsEnable_DepthTest = glIsEnabled(GL_DEPTH_TEST);
	glDisable(GL_DEPTH_TEST);							// Disables Depth Testing
	glDisable(GL_LIGHTING);

	// Display number of frame/second
	char sz[255];

	// Display Tina's informaitons
	sprintf(sz,"%s", "โครงงาน การพัฒนาเกม 3 มิติโดยใช้ไดเร็กเอ็กซ์");
	CText2D::Putstring( sz, 0.2f, 0.10f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "เกมที่จะนำเสนอต่อไปนี้ เป็นเกมที่พัฒนาขึ้นมาโดยการนำเอาเกมเอนจินต์ที่ได้จัดทำร่วมกับกลุ่มโครงงานเดียวกัน");
	CText2D::Putstring( sz, -0.18f, 0.20f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "มาพัฒนาเป็นเกม 3 มิติ เพื่อเป็นการทดสอบความสามารถของเอนจินต์ กับเกมประเภท แอกชัน - แอดเวนเจอร์");
	CText2D::Putstring( sz, -0.18f, 0.25f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "จัดทำโดย...");
	CText2D::Putstring( sz,  0.1f, 0.40f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "นายทศพล ทุมมาลา");
	CText2D::Putstring( sz,  0.27f, 0.45f, 0.f, 0xffffffff );
	sprintf(sz,"%s", "42015305");
	CText2D::Putstring( sz,  0.6f, 0.45f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "นายรณชัย พรหมมี");
	CText2D::Putstring( sz,  0.27f, 0.50f, 0.f, 0xffffffff );
	sprintf(sz,"%s", "42015316");
	CText2D::Putstring( sz,  0.6f, 0.50f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "นายอภมันต์ จันทร์ดา");
	CText2D::Putstring( sz,  0.27f, 0.55f, 0.f, 0xffffffff );
	sprintf(sz,"%s", "42015331");
	CText2D::Putstring( sz,  0.6f, 0.55f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "ดร. วรวัฒน์ ลิ้มโภคา อาจารย์ที่ปรึกษา");
	CText2D::Putstring( sz,  0.25f, 0.65f, 0.f, 0xffffffff );

	sprintf(sz,"%s", "ปีการศึกษา 2544");
	CText2D::Putstring( sz,  0.37f, 0.7f, 0.f, 0xffffffff );
	
	sprintf(sz,"%s", "--------------------------------------------------------");
	CText2D::Putstring( sz,  0.0f, 0.9f, 0.f, 0xffff0fff );

	sprintf(sz,"%s", "เริ่มทดสอบเกม");
	CText2D::Putstring( sz,  0.26f, 0.95f, 0.f, 0xffff0fff );
	sprintf(sz,"%s", "กด space bar");
	CText2D::Putstring( sz, 0.52f, 0.95f, 0.f, 0xffff0fff );

	sprintf(sz,"%s", "ออกจากโปรแกรม");
	CText2D::Putstring( sz,  0.26f, 1.f, 0.f, 0xffff00ff );
	sprintf(sz,"%s", "กด escape");
	CText2D::Putstring( sz, 0.52f, 1.f, 0.f, 0xffff0fff );

	if( bIsEnable_DepthTest ) 
	{
		glEnable(GL_DEPTH_TEST);
	}

	// 2D end-----------------------------------------------------------------------------

	return S_OK;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHeight
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CScene::RenderLoading(void)
{
	// 2D begin---------------------------------------------------------------------------
	CMyCamera Camera2D;
	Camera2D.SetViewParams
	(  
		CVector3f( 0.0f, 0.0f, 0.0f ),
		CVector3f( 0.0f, 0.0f, 1.0f ),
		CVector3f( 0.0f, 1.0f, 0.0f )
	);

	GLGfx::SetMatWorld(&cs::IMat);
	Camera2D.Render();

	// Disable depth test for 2d drawing
	BOOL bIsEnable_DepthTest = glIsEnabled(GL_DEPTH_TEST);
	glDisable(GL_DEPTH_TEST);							// Disables Depth Testing
	glDisable(GL_LIGHTING);

	// Display number of frame/second
	char sz[255];
	
	sprintf(sz,"%s", "กรุณารอสักครู่ โปรแกรมกำลังจัดเตรียมข้อมูล...");
	CText2D::Putstring( sz, 0.0f, 0.50f, 0.f, 0xffffffff );

	if( bIsEnable_DepthTest ) 
	{
		glEnable(GL_DEPTH_TEST);
	}

	// 2D end-----------------------------------------------------------------------------

	return S_OK;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHeight
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CScene::RenderGameOver(void)
{
	// 2D begin---------------------------------------------------------------------------
	CMyCamera Camera2D;
	Camera2D.SetViewParams
	(  
		CVector3f( 0.0f, 0.0f, 0.0f ),
		CVector3f( 0.0f, 0.0f, 1.0f ),
		CVector3f( 0.0f, 1.0f, 0.0f )
	);

	GLGfx::SetMatWorld(&cs::IMat);
	Camera2D.Render();

	// Disable depth test for 2d drawing
	BOOL bIsEnable_DepthTest = glIsEnabled(GL_DEPTH_TEST);
	glDisable(GL_DEPTH_TEST);							// Disables Depth Testing
	glDisable(GL_LIGHTING);

	// Display number of frame/second
	char sz[255];

	// Display Tina's informaitons
	sprintf(sz,"%s", "GAME OVER:");
	CText2D::Putstring( sz, 0.2f, 0.30f, 0.f, 0xff0000ff );
	sprintf(sz,"%s", "PRESS SPACEBAR");
	CText2D::Putstring( sz, 0.5f, 0.30f, 0.f, 0xffff00ff );

	sprintf(sz,"%s", "EXIT:");
	CText2D::Putstring( sz, 0.2f, 0.35f, 0.f, 0xff0000ff );
	sprintf(sz,"%s", "PRESS ESCAPE");
	CText2D::Putstring( sz, 0.5f, 0.35f, 0.f, 0xffff00ff );


	if( bIsEnable_DepthTest ) 
	{
		glEnable(GL_DEPTH_TEST);
	}

	// 2D end-----------------------------------------------------------------------------
	
	return S_OK;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHeight
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CScene::RenderGameLoop(void)
{
	// Land rendering
	CColor4f c4 = CMyGlApp::s_oSceneColor;
	glColor3f( c4.r, c4.g, c4.b );
	glDepthMask(1);

//	glColorMask(FALSE,FALSE,FALSE,FALSE);
	for( int i=0; i<NUM_SCENE_OBJ; i++ )
	{
		s_oScene[i].Render();
	}

	for( i=0; i<NUM_SCENE2_OBJ; i++ )
	{
		s_oScene2[i].Render();
	}

	int iNumEnv = NUM_ENV0_OBJ+NUM_ENV1_OBJ+NUM_ENV2_OBJ;
	for(i=0; i<iNumEnv; i++)
	{
		if( !s_oEnvObj[i].IsDead() )
			s_oEnvObj[i].Render();
	}

	for(i=0; i<NUM_TINA_OBJ; i++)
	{
//		if( !s_oTina[i].IsDead() )
		s_oTina[i].Render();
	}

	for(i=0; i<NUM_TONY_OBJ; i++)
	{
//		if( !s_oTina[i].IsDead() )
		s_oTony[i].Render();
	}

	s_oPlayer.Render();
/*
	glDisable(GL_BLEND);
	glDisable(GL_ALPHA_TEST);
	glEnable( GL_CULL_FACE );
	glCullFace( GL_FRONT );
*/
	// Render cloud
	glDisable(GL_LIGHTING);				 
	glEnable(GL_BLEND);
	glDepthMask(0);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
	s_oCloudList.Render(s_pMyGlApp->m_oCamera.GetBillboard());
/**/
/*
	CMat matWorld;
	matWorld.Scale(	50.f, 50.f, 1.0f );
	matWorld.Mul(&CScene::s_pMyGlApp->m_oCamera.GetBillboard());
	matWorld.Translatef(s_oPlayer.Px(),s_oPlayer.Py(),s_oPlayer.Pz());
	GLGfx::SetMatWorld( matWorld.GetpMat() );
	glColor4f( 1.f, 1.f, 1.f, 0.5f );
	glBindTexture(GL_TEXTURE_2D, CScene::s_oTexture[TEXTURE_FIRE].Get());
	glCallList(  CEffectBillboard::m_DisplayListID );
*/
	glDepthMask(1);
	glDisable(GL_BLEND);
	glEnable(GL_DEPTH_TEST);


	// 2D begin---------------------------------------------------------------------------
	CMyCamera Camera2D;
	Camera2D.SetViewParams
	(  
		CVector3f( 0.0f, 0.0f, 0.0f ),
		CVector3f( 0.0f, 0.0f, 1.0f ),
		CVector3f( 0.0f, 1.0f, 0.0f )
	);

	GLGfx::SetMatWorld(&cs::IMat);
	Camera2D.Render();
/*

	matWorld;
	matWorld.Scale(	50.f, 50.f, 1.0f );
	matWorld.Mul(&CScenes_pMyGlApp->m_oCamera.GetBillboard());
	matWorld.Translatef(s_oPlayer.Px(),s_oPlayer.Py(),s_oPlayer.Pz());
	GLGfx::SetMatWorld( matWorld.GetpMat() );
	glColor4f( 1.f, 1.f, 1.f, 0.5f );
	glBindTexture(GL_TEXTURE_2D, CScene::s_oTexture[TEXTURE_TINAINF].Get());
	glCallList(  CEffectBillboard::m_DisplayListID );
*/
	// Disable depth test for 2d drawing
	BOOL bIsEnable_DepthTest = glIsEnabled(GL_DEPTH_TEST);
	glDisable(GL_DEPTH_TEST);							// Disables Depth Testing
	glDisable(GL_LIGHTING);

	// Display number of frame/second
	char sz[255];
	char sz2[255]="";

	// Display Tina's informaitons
	sprintf(sz,"Tina XYZ : %.3f, %.3f, %.3f", s_oPlayer.Px(), s_oPlayer.Py(), s_oPlayer.Pz() );
	CText2D::Putstring( sz, -0.375f, 0.90f, 0, 0x59ff0fff );

//	sprintf(sz,"Tina Ray : %.3f", s_oPlayer.fRay1);
//	CText2D::Putstring( sz, -0.375f, 0.90f, 0, 0x59ff0fff );

	sprintf(sz,"Tina Animate : %s", __szTinaAnimation[s_oPlayer.m_CurrentAnimationID]);
	CText2D::Putstring( sz, -0.375f, 0.95f, 0, 0x59ff0fff );

	//-------------------------------------------------------------------------------------
	int iHigh =s_oPlayer.GetHP();
	sz2[0]=0x0;
	for( int j=0; j<iHigh; j++ )
	{
		sz2[j]	='!';
		sz2[j+1]=0x0;
	}
	sprintf(sz,"Health : %s", sz2);
	CText2D::Putstring( sz, -0.375f, 1.00f, 0, 0x60ff0fff );

	//-------------------------------------------------------------------------------------
	iHigh =s_oPlayer.m_oBullet0.GetHP();
	sz2[0]=0x0;
	for(j=0; j<iHigh; j++ )
	{
		sz2[j]	='!';
		sz2[j+1]=0x0;
	}
	sprintf(sz,"Bullet A: %s", sz2);
	CText2D::Putstring( sz, -0.375f, 1.05f, 0, 0xff0000ff );

	if( bIsEnable_DepthTest ) 
	{
		glEnable(GL_DEPTH_TEST);
	}

	//-------------------------------------------------------------------------------------
	iHigh =s_oPlayer.m_oBullet1.GetHP();
	sz2[0]=0x0;
	for(j=0; j<iHigh; j++ )
	{
		sz2[j]	='!';
		sz2[j+1]=0x0;
	}
	sprintf(sz,"Bullet B: %s", sz2);
	CText2D::Putstring( sz, -0.375f, 1.10f, 0, 0xff00ffff );

	if( bIsEnable_DepthTest ) 
	{
		glEnable(GL_DEPTH_TEST);
	}
	// 2D end-----------------------------------------------------------------------------

	// Rendering is finished
	return S_OK;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHeight
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
float CScene::GetHeight( float fX, float fY, float fZ )
{
	// check is already reached
	D3DXVECTOR3	vSrc(fX, fY, fZ);
	D3DXVECTOR3	vDir(0.f, -1.f, 0.f);

	int   iNumSceneObj = CScene::GetNumSceneObj();
	float fRay1=RAND_MAX;
	for(int i=0; i<iNumSceneObj; i++)
	{
		int iNumFace = CScene::s_oScene[i].GetNumFaces();
		for(int j=0; j<iNumFace; j++)
		{
			CTriangle oTri;
			if( CScene::s_oScene[i].GetTriangle( j, &oTri ) )
			{
				FLOAT fT=0.f;
				FLOAT fU=0.f;
				FLOAT fV=0.f;
				if
				( 
					CMath::RayOnTriangle
					( 
						vSrc,
						vDir,
						oTri.GetV0(),
						oTri.GetV1(),
						oTri.GetV2(),
						&fT,
						&fU,
						&fV
					)
				)
				{
					if( /*(fRay1==RAND_MAX)||*/((fT>0)&&(fT<fRay1)) )
					{
						fRay1 = fT;
					}
				}
			}//end if
		}//end for
	}//end for

	return ( (fRay1==RAND_MAX)?(0.f):(fY-fRay1) );
}
