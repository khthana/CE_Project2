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

//Texture::CTexture Tex("NeHe.bmp");
//CUseTexture Tex,Tex1;
CSLandModel ModelLand, ModelSky, ModelWater;
CStaticModel mdlShadowCylinder;
CStaticModel narong;

//CSCubeModel ModelBox;

//CSObjModel  ModelTree;
//CSoldier     Soldier01;
CSoldierList SoldierList;
CUseTexture TexBlood,TexCloud,TexFireBomb,TexWaterEf;

GLfloat LightAmbient[]=		{ 0.0f, 0.0f, 0.0f, 1.0f };
GLfloat LightDiffuse[]=		{ 1.0f, 0.80f, 0.520f, 1.0f };
GLfloat LightPosition[]=	{ 0.0f, 0.0f, 0.0f, 1.0f };

CProjectileObject     ProjectileObject;
CProjectileObjectList arProjectileObject; 

int g_nAmbRed	= 255;
int g_nAmbGreen = 248;
int g_nAmbBlue	= 220;

int g_nFogRed	= 171;
int g_nFogGreen = 183;
int g_nFogBlue	= 156;

float g_fFogStart = 271.0f;
float g_fFogEnd = 1750.340f;

float g_fV0 = 35.0f;

#ifdef _DEBUG
	#define		MAXTREE	50
#else
	#define		MAXTREE	20000
#endif


// save tree list
//#define SAVETREE


CTreeList  ModelTreeList;

CUseSounds GunSound;
CUseSounds GunSound2;
CUseSounds BombSound;
CUseSounds DieSound;


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

	 m_strTitle = "Game Engine Demo from Korkai Studio.";
	 m_bShoot = FALSE;

/*
P1=080,025
P2=165,025
P3=249,025
P4=080,088
P5=165,088
P6=249,088
P7=080,149
P8=165,149
P9=249,149
*/

/*
	int TopLeftX  = 94;	                   	int TopRightX = 260;
	int TopLeftY  = 24;                     int TopRightY = 23;



	int ButtomLeftX  = 74;	                int ButtomRightX = 263;
	int ButtomLeftY  = 161;                 int ButtomRightY = 162;
	

	
	m_calibase[0] = CPoint( TopLeftX, TopLeftY );
	m_calibase[1] = CPoint( (TopLeftX+TopRightX )/2, (TopLeftY+TopRightY)/2 );
	m_calibase[2] = CPoint( TopRightX, TopRightY );

	m_calibase[3] = CPoint( ((TopLeftX+ButtomLeftX)/2), ((TopLeftY+ButtomLeftY)/2 ));
	m_calibase[4] = CPoint( ( ((TopLeftX+ButtomLeftX)/2)+((TopRightX + ButtomRightX)/2) )/2, 
		                      (((TopLeftY+ButtomLeftY)/2 ) + (( TopRightY+ ButtomRightY)/2) )/2 );
	m_calibase[5] = CPoint( ((TopRightX + ButtomRightX)/2), (( TopRightY+ ButtomRightY)/2) );

	m_calibase[6] = CPoint( ButtomLeftX, ButtomLeftY );
	m_calibase[7] = CPoint( ( ButtomLeftX+ ButtomRightX)/2, (ButtomLeftY + ButtomRightY)/2 );
	m_calibase[8] = CPoint( ButtomRightX, ButtomRightY );
*/
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
	GunSound2.Use("Sound\\GunShot2.wav",100);
	DieSound.Use("Sound\\Die.WAV",10);
	BombSound.Use("Sound\\bomb.wav",100);
	mdlShadowCylinder.LoadModel( "Frame\\ShadowCylinder.maf" );
	
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


		// Set Up Camera
		/*
		m_Camera.SetParamsSystem1(  3.390f,31.542f, -71.169f,
								    -38.603783f,39.413685f, -101.286095f,
								    0.0f,1.0f,0.0f );
		*/
		m_Camera.SetParamsSystem1(  0.0f,0.0f, 0.0f,
		 						    0.0f,0.0f, 1.0f,
		 						    0.0f,1.0f,0.0f );
	
		ShowLoading(5.0f,"Load model : Land");

		//ModelLand.LoadModel( "Frame\\Land_Mul.maf" );
		ModelLand.LoadModel( "Frame\\RealLand_01.maf" );

		// Projectile Object
		ProjectileObject.LoadModel( "Frame\\BigBullet.maf" );
		arProjectileObject.SetLand( &ModelLand );

		ShowLoading(10.0f,"Load model : Water");
		ModelWater.LoadModel("Frame\\Water.maf");

		//ModelLand.LoadModel( "Frame\\Land.maf" );

		ShowLoading(15.0f,"Load model : Sky");

		ModelSky.LoadModel( "Frame\\Sky.maf" );

		ShowLoading(20.0f,"Load model : Tank");

//		ModelBox.LoadModel( "Frame\\Tank.maf" );
        narong.LoadModel("Frame\\plan.maf");

		ShowLoading(25.0f,"Load model : Soldier");


//		Soldier01.SetLand( &ModelLand );
//		Soldier01.LoadModel( "AnimationSet\\Soldier02.mas" );
//		Soldier01.UsePartDef("pd\\Soldier01.pd");
//		Soldier01.LoadScript("SoldierScript\\SoldierScr01.ssc");

//		Soldier01.SetWalkParam( 1.8f, 0.5f );
//		Soldier01.SetStopParam( 1.0f );
	   //Soldier01.SetWalkStepDistance( 1.62f ); // OldModel
//		Soldier01.SetWalkStepDistance( 1.8f );
//		Soldier01.SetWalkVelocity( 2.0f );
		 
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
/*
		SoldierList.AddSoldier( "SoldierScript\\Leader02.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier201.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier202.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier203.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier204.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier205.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier206.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier207.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier208.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier209.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier210.ssc" );

		SoldierList.AddSoldier( "SoldierScript\\Leader03.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier301.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier303.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier303.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier304.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier305.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier306.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier307.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier308.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier309.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\NewSoldier310.ssc" );*/
/*		
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr01.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr02.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr03.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr04.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr05.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr06.ssc" );

		SoldierList.AddSoldier( "SoldierScript\\SoldierScr07.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr08.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr09.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr10.ssc" );
		
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr11.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr12.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr13.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr14.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr15.ssc" );


		SoldierList.AddSoldier( "SoldierScript\\SoldierScr16.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr17.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr18.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr19.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr20.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr21.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr22.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr23.ssc" );
		SoldierList.AddSoldier( "SoldierScript\\SoldierScr24.ssc" );
*/		

		

//		ModelTree.LoadModel("frame\\Tree01.maf");

		TexBlood.Use( "Texture\\blood.tga" );
		TexCloud.Use( "Texture\\cloud.tga" );
		TexFireBomb.Use( "Texture\\FireBomb.tga" );
		TexWaterEf.Use("Texture\\WaterEf.tga");
		
	 #ifdef SAVETREE
	 //SAVETREE/////////////////////////////////////////////////////////////////////////////////////////////////////////   
		int nCountX = 0 ;
		for ( int nCount = 0 ; nCount < MAXTREE; nCount++)
		{
			int nRandom = rand()%9;

			//float fRX = ( float(rand()%80000)-40000.0f) /10.0f * 2.0f ;
			//float fRZ = ( float(rand()%80000)-40000.0f) /10.0f * 2.0f;
			float fRX = ( float( ( float(rand())/float(0x7fff) )* 30000.0f )-15000.0f) /10.0f * 2.0f ;
			float fRZ = ( float( ( float(rand())/float(0x7fff) )* 30000.0f )-15000.0f) /10.0f * 2.0f;
			float fSX = ((rand()%11) + 18) / 8.0f;
			float fSY = ((rand()%13) + 12) / 8.0f;

			if ( ( nRandom == 0 ) || ( nRandom == 7 ))
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_01.mam",
										fRX,0.0f,fRZ,
										fSX,fSY,fSX
									);
			}
			else if (( nRandom == 1 )|| ( nRandom == 8 ))
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_02.mam",
										fRX,0.0f,fRZ,
										fSX,fSY,fSX
									);
			}
			else if ( nRandom == 2 )
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_03.mam",
										fRX,0.0f,fRZ,
										fSX,fSY,fSX
									);
			}
			else if ( nRandom == 3 )
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_04.mam",
										fRX,0.0f,fRZ,
										fSX/2.0f,fSY/3.0f,fSX/2.0f
									);
			}
			else if ( nRandom == 4 )
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_05.mam",
										fRX,0.0f,fRZ,
										fSX/2.0f,fSY/3.0f,fSX/2.0f
									);
			}
			else if ( nRandom == 5 )
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_06.mam",
										fRX,0.0f,fRZ,
										fSX,fSY,fSX
									);
			}
			else if ( nRandom == 6 )
			{
				ModelTreeList.AddTree(	"MultiDetailData\\TType_07.mam",
										fRX,0.0f,fRZ,
										fSX,fSY,fSX
									);
			}


			(ModelTreeList.GetAt(nCountX))->LayOn(&ModelLand,FALSE);
			
			if ( (ModelTreeList.GetAt(nCountX))->Py() < 29.0f  )
			{
				ModelTreeList.Delete(nCountX--);
			}
			
			if ((nCount%(MAXTREE/(MAXTREE/10) ))==0)
			{
				ShowLoading( ((float(nCount)/MAXTREE) *75.0f ) + 25.0f,
								"Generate Tree Model : ...");
			}

			nCountX++;
		}

	    ModelTreeList.SaveToFile(  "Tree\\Now.tl"  );
	
	 //SAVETREE/////////////////////////////////////////////////////////////////////////////////////////////////////////   
	#else
	 //LoadTREE/////////////////////////////////////////////////////////////////////////////////////////////////////////   
		ShowLoading(40.0f,"Load model : Tree List");
		srand(50);
	    ModelTreeList.LoadFromFile( "Tree\\Now.tl" );
	 //LoadTREE/////////////////////////////////////////////////////////////////////////////////////////////////////////   
	#endif
	}



	ShowLoading(100.0f,"Finished");


	
	
	glShadeModel( GL_SMOOTH );							// Enable Smooth Shading
	/*
	glClearColor(0.0f, 0.0f, 0.0f, 0.5f);				// Black Background
	glClearDepth(1.0f);									// Depth Buffer Setup
	glEnable(GL_DEPTH_TEST);							// Enables Depth Testing
	glDepthFunc(GL_LEQUAL);								// The Type Of Depth Testing To Do*/
	
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);	// Really Nice Perspective Calculations
	

	ModelSky.SetScale( 1000,1000,1000 );
	//ModelBox.SetScale( 0.07f, 0.07f, 0.07f );


	glEnable( GL_CULL_FACE );
	glCullFace( GL_FRONT );

	//glEnable(GL_DEPTH_TEST);							// Enables Depth Testing
	//glDepthFunc(GL_LESS);								// The Type Of Depth Testing To Do
	glEnable(GL_TEXTURE_2D);							// Enable Texture Mapping ( NEW )

//	Blend01.LoadFrame("Frame\\man_001.maf","Frame\\man_002.maf");

	
	glLightfv(GL_LIGHT0, GL_AMBIENT, LightAmbient);		// Setup The Ambient Light
	glLightfv(GL_LIGHT0, GL_DIFFUSE, LightDiffuse);		// Setup The Diffuse Light
	glLightfv(GL_LIGHT0, GL_POSITION,LightPosition);	// Position The Light
//aa	glEnable(GL_LIGHTING);
//aa	glEnable(GL_LIGHT0);								// Enable Light One
	//glNormal3f(0.0f,0.0f,0.0f);*/
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
	//x += 0.02f;
	//z -= 2.0f * m_fElapsedTime;
	//ModelBox.SetPosition( x+2, 0, z );
	//ModelBox.SetRotation( 0, 0, Angle );

//	ModelBox.SetPosition( -4.0f, 0, z );
//	ModelBox.LayOn( &ModelLand );

	//Soldier01.SetPosition( 5, 0, 5 );
	//Soldier01.LayOn( &ModelLand );
    //Soldier01.Process( m_fElapsedTime );
	

	SoldierList.Process( m_fElapsedTime );

	ModelLand.SetScale(1,1,1);
	ModelWater.SetScale(1,1,1);

/*	static BOOL bFirstTimeLand  = TRUE;

	if ( bFirstTimeLand )
	{		 
		bFirstTimeLand = FALSE;
		m_Camera.LayOn( &ModelLand );
	}
*/
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

 		//glDrawArrays(GL_QUADS, 0, 40);
		//glDrawElements( GL_TRIANGLES, 6, GL_UNSIGNED_INT, arIndices ); 
	glDisable(GL_FOG);									// Disables GL_FOG
//	glColor3f(0.6f,0.45f,0.45f);
	glColor3f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f);

	ModelSky.Render();
	glEnable(GL_FOG);									// Enables GL_FOG

//	mdlShadowCylinder.Render();

	// Setup light
	//LightModel.Render();


//	glColor3f(0.5f,0.4f,0.4f);
	glColor3f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f);


	//ModelLand.Render();

	glDepthMask(1);
	//glColorMask(FALSE,FALSE,FALSE,FALSE);

	//========================Render Land=============================
/*	glEnable(GL_STENCIL_TEST);
	glStencilFunc(GL_ALWAYS, 1, 0xffffffff);
	glStencilOp( GL_KEEP, GL_KEEP, GL_REPLACE );*/

	//ModelLand.Render();
	static float y = 0.0f;
	static float Degree = 0.0f;
	Degree += m_fElapsedTime * 10;
	y = sin( cs::ToRad*Degree ) * 3;


    glEnable(GL_BLEND);
	glDepthMask(0);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);


	narong.SetPosition( 0, y, 0 );
//	narong.SetRotation( 0, 0, Degree );
	narong.Render();
	//================================================================
	//ModelLand.Render();
	//glColorMask(TRUE,TRUE,TRUE,TRUE);


	//Soldier01.SetPosition( -2, 0, 0 );
	//Soldier01.Render();

	//========================Render Soldier==========================
	SoldierList.Render(&m_Camera);	
	glDisable(GL_STENCIL_TEST);
	//================================================================

	arProjectileObject.Render();

	glEnable(GL_BLEND);
	//glEnable(GL_ALPHA_TEST);
	glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );	// Select The Type Of Blending
	//glAlphaFunc(GL_GREATER,0.0f);
	//glColor4f(1.0f,1.0f,1.0f, ( Math::Sinf(m_fTime*3.0f)+1.0f )/2.0f);


	glDisable(GL_BLEND);


	glColor3f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f);
	D3DXVECTOR3 vCamera = m_Camera.GetEyePt();
	ModelTreeList.RenderAll( vCamera , &m_Camera.GetBillboardMatrix() );


	glDisable(GL_BLEND);
	glDisable(GL_ALPHA_TEST);
	glEnable( GL_CULL_FACE );
	glCullFace( GL_FRONT );
	


//	ModelBox.Render();

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
	if( m_MBRight )
	{
		ShootX = m_MouseX;
		ShootY = m_MouseY;
	}
	else if ( m_bShoot )
	{
		ShootX = int(m_shootx);
		ShootY = int(m_shooty);		
	}


	//static nCountMouseDown
	if( ( m_MBRight || m_bShoot ) && ( (m_fTime - fPrevTime) > 0.1f ) )
	{
		CString strSoldierPart;
		D3DXVECTOR3 RayOrigin, RayDirection;
		Ray::ScrToRay( ShootX, ShootY, ScrWidth, ScrHeight, &m_Camera, &RayOrigin, &RayDirection );

		arProjectileObject.Add( RayOrigin, RayDirection * g_fV0 ); 

		fPrevTime = m_fTime;

		GunSound.Play();

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
		CTriangle TriHitSoldier;
		float USoldier, VSoldier;
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
		{
			float x, y, z;
			TriHitLand.GetPointFromUV( ULand, VLand, &x, &y, &z, ModelLand.GetpMat() );
			CloudList.Add(	"Texture\\cloud.tga",
							x,y,z,
							x,y+0.50f,z,
							0.0f,0.0f,
							0.80f,01.0f,
							float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,1.0f,
							float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.0f,
							02.50f);

		}
		*/

	}

//	glEnable(GL_ALPHA_TEST);
//	glAlphaFunc(m_func,m_fValuefunc);

	glDisable(GL_LIGHTING);				 
	glEnable(GL_BLEND);
	glDepthMask(0);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
	CloudList.Render(m_Camera.GetBillboardMatrix());
	glDepthMask(1);
	glDisable(GL_BLEND);
	glEnable(GL_DEPTH_TEST);


/*	glEnable(GL_STENCIL_TEST);
	glStencilFunc(GL_ALWAYS, 1, 0xffffffff);
	glStencilOp( GL_KEEP, GL_KEEP, GL_REPLACE );
*/
	glEnable(GL_BLEND);
	glDepthMask(0);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

	glColor4f(float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,1.0f);

	ModelWater.SetPosition(0.0f + Math::Sinf(-m_fTime*5.0f)/25.0f,
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

/*
	glStencilFunc(GL_EQUAL, 1, 0xffffffff);
	glStencilOp( GL_KEEP, GL_KEEP, GL_KEEP );


	GLGfx::Clear(GL_DEPTH_BUFFER_BIT);
	
	static float arDepth[800][600];
	glReadPixels( 0,0,800,600,GL_DEPTH_COMPONENT,GL_FLOAT,arDepth ); 

	glDepthMask(1);
	//glDisable(GL_DEPTH_TEST);	
	glDisable(GL_FOG);
	glCullFace( GL_BACK );

	D3DXMATRIX matView,matMove;
	Mat::Scaling( &matView,1.0f,-1.0f,1.0f );
	Mat::Translation( &matMove,0.0f,58.0f,0.0f);

	Mat::Mul( &matMove, &matMove , &m_Camera.GetViewMatrix() );
	Mat::Mul( &matView, &matView , &matMove );
	//Mat::Mul( &matView, &matView , &matMove);
	
	GLGfx::SetMatView( &matView );

	glColor4f(float(g_nAmbRed)/255.0f/1.1f,float(g_nAmbGreen)/255.0f/1.1f,float(g_nAmbBlue)/255.0f/1.1f,0.25f);

	ModelSky.Render();
	ModelLand.Render();
*/
	glDisable(GL_BLEND);
	glDisable(GL_STENCIL_TEST);
	glDepthMask(1);




	//TwoD begin
	/////////////////////////////////////////////////////////////////////////////////
	// TwoD Zone
	/////////////////////////////////////////////////////////////////////////////////
	CCamera Camera2D;
	Camera2D.SetParamsSystem1(	0.0f, 0.0f, 0.0f,
								0.0f, 0.0f, 1.0f,
								0.0f, 1.0f, 0.0f	);

	GLGfx::SetMatWorld(&cs::IMat);

	CText2D::PutPictureIn2D(&TexWaterEf, 0, 0, 100, 100, 0, 0, 0, 1, 1);

	GLGfx::SetMatWorld(&cs::IMat);
	Camera2D.View();

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

			sprintf(sz,"V0 = %f ", g_fV0 );
			CText2D::Putstring(sz,0.01f,0.80f,0,(0xffffffff));	

		}
/*
		sprintf(sz,"Program Military Simulator Beta 0.2");
		CText2D::Putstring(sz,0.01f,0.95f,0,(0xffff00)|(x));

		sprintf(sz,"x= %f , y = %f , z = %f", vCamera.x,vCamera.y,vCamera.z);
		CText2D::Putstring(sz,0.01f,0.2f,0,(0xffff00)|(0xff));	
		

		sprintf(sz,"Current Animation Time is %f", Soldier01.GetCurrentAnimationTime() );
		CText2D::Putstring(sz,0.01f,0.4f,0,(0xffff00)|(0xff));

		sprintf(sz,"Velocity is %f", Soldier01.GetWalkVelocity() );
		CText2D::Putstring(sz,0.01f,0.5f,0,(0xffff00)|(0xff));

		sprintf(sz,"State is %s", Soldier01.GetStrState() );
		CText2D::Putstring(sz,0.01f,0.6f,0,(0xffff00)|(0xff));

		sprintf(sz,"Desire Action is %s", Soldier01.GetStrDesireAction() );
		CText2D::Putstring(sz,0.01f,0.7f,0,(0xffff00)|(0xff));

		sprintf(sz,"Current Action is %s", Soldier01.GetStrCurrentAction() );
		CText2D::Putstring(sz,0.01f,0.8f,0,(0xffff00)|(0xff));

*/
		//sprintf(sz,"HP is %d", Soldier01.GetHP() );
		//CText2D::Putstring(sz,0.01f,0.3f,0,(0xffff00)|(0xff));

		//sprintf(sz,"P is %f ,%f", Soldier01.Px(), Soldier01.Pz() );
		//CText2D::Putstring(sz,0.01f,0.4f,0,(0xffff00)|(0xff));

		/*
		float fDesX, fDesZ;
		//Soldier01.GetDestination( &fDesX, &fDesZ );
		sprintf(sz,"D is %f ,%f", fDesX, fDesZ );
		CText2D::Putstring(sz,0.01f,0.5f,0,(0xffff00)|(0xff));
*/

		m_Mouse.Render();

	if ( bIsEnable_DepthTest ) glEnable(GL_DEPTH_TEST);

	//TwoD end

	ResetMBUp(); // For Mouse
	m_bShoot = FALSE;
	return S_OK;										// Everything Went OK
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
			//Soldier01.SetDesireAction( CSoldier::ACTION_GUNUP );
			//Soldier01.DecreaseHP( 20 );
			/*
			static BOOL test = TRUE;
			if ( test )
			{
				test = ! test;
				Soldier01.SetAnimation("left");
			}
			else
			{
				test = ! test;
				Soldier01.SetAnimation("walk");
			}

			float Ts = Soldier01.GetTimeScale();
			//Soldier01.SetTimeScale( Ts * 1.1f );
			*/

			m_MBRightUp = TRUE;
			m_MBRight  = FALSE;
			return 0;
		}
		
	}
	return CGLApplication::MsgProc( hWnd, uMsg, wParam, lParam ); 
}

HRESULT CMyGlApp::ProcessKey( float fElapsedTime )
{
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
	if( m_arKey['G']) 
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
		m_Camera.S2_RotateUp( fElapsedTime*50.0f );
	}
	//==========================================================================

	//============================Rotate Down==================================
	if( m_arKey['Z'] || (m_MouseY == ScrHeight - 1 )  ) 
	{
		m_Camera.S2_RotateDown( fElapsedTime*50.0f );
	}

	//==========================================================================

	return S_OK;
}

void CMyGlApp::ShowLoading(float fPercent,const CString& Message)
{
	//CUseTexture TexLoading;
	//TexLoading.Use("texture\\Mouse001.tga");

	CCamera Camera2D;
	Camera2D.SetParamsSystem1(	0.0f, 0.0f, 0.0f,
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


