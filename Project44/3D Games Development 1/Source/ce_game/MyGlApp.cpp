//----------------------------------------------------------------------------------------
// MyGlApp.cpp: implementation of the CMyGlApp class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "MyGlApp.h"
#include "Engine\GLGfx.h"
#include "Engine\EngineInterface.h"
#include "Engine\Text2D.h"
#include "Engine\Matrix.h"
#include "Engine\StaticModel.h"
#include "Engine\Texture.h"
#include "Engine\Triangle.h"
#include "Engine\DynamicModel.h"
#include "Engine\ModelData.h"
#include "Engine\staticmodeldata.h"
#include "Engine\Animation.h"
#include "Engine\EffectBillboardList.h"
#include "Engine\Sound.h"

#include "Scene.h"
#include "SoundContainer.h"


//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
// Global Data
//----------------------------------------------------------------------------------------
CColor4f CMyGlApp::s_oSceneColor;
CLight	 CMyGlApp::s_oSceneLight;
CFog	 CMyGlApp::s_oSceneFog;


/*
------------+-----------------------------------------------------------------------------
 Function	| CMyGlApp()
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CMyGlApp::CMyGlApp()
{
}



/*
------------+-----------------------------------------------------------------------------
 Function	| ~CMyGlApp()
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CMyGlApp::~CMyGlApp()
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
HRESULT CMyGlApp::OneTimeSceneInit(void)
{
	// Setup scene's color
	s_oSceneColor = CColor4f( 0.9575f, 0.9575f, 0.9575f, 1.0f );

	// Setup scene's light
	s_oSceneLight.m_oAmbient = CColor4f( 0.0f, 0.0f, 0.0f, 1.0f );
	s_oSceneLight.m_oDiffuse = CColor4f( 0.90f, 0.80f, 0.520f, 1.0f );
	s_oSceneLight.m_oPosition= CVector4f( 0.0f, 0.0f, 0.0f, 1.0f );

	// Setup scene's fog
	s_oSceneFog.m_oColor = CColor4f( 0.10f, 0.10f, 0.10f, 1.0f );
	s_oSceneFog.m_fStart = 500.0f;
	s_oSceneFog.m_fEnd	 = 1500.0f;

	//don't move out from Onetimescene (use texture for loading screen)
//	m_Mouse.UseTexture("Resource\\Texture\\Mouse001.tga");
	CScene::OneTimeSceneInit(this);

	// InitPort
	Port::InitPort();

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
HRESULT CMyGlApp::FinalCleanup(void)
{
	// Close Port
	Port::ClosePort();

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
HRESULT CMyGlApp::InitDeviceObjects(GLvoid)
{
	// local static data
	static BOOL  bFirstTime = TRUE;

	// Set active this camera
	m_oCamera.Active();

	// Setup project params of camera
	m_oCamera.SetProjParams( PI/4.f, (4.f/3.f)*m_fMonitor, 1.0f, 1000000.0f );

	// Loadding progress
	ShowLoading(0.0f,"Wait for loading");

	// Only one time process
	if( bFirstTime )
	{
		// Disable for the next time
		bFirstTime = FALSE;
/*
		// Setup view params of camera
		m_oCamera.SetViewParams
		(  
			CVector3f( 3.390f, 31.542f, -71.169f ),
			CVector3f( -38.603783f, 39.413685f, -101.286095f ),
			CVector3f( 0.0f, 1.0f, 0.0f )
		);
*/
		// Load sound of scene
//		CSoundContainer::OneTimeSceneInit();
		
		// Load land of scene
//		CScene::InitDeviceObjects();

		// Load actors
//		ShowLoading(100.0f,"Joey Model");
//		g_oJoey.LoadAnimModel( "Resource\\Model\\Joey\\joey.mas" );

	}

	// Loading Finished 
	ShowLoading(100.0f,"Finished");

	// Setup shad mode
	glShadeModel( GL_SMOOTH );							// Enable Smooth Shading
/*
	glClearColor(0.0f, 0.0f, 0.0f, 0.5f);				// Black Background
	glClearDepth(1.0f);									// Depth Buffer Setup
	glEnable(GL_DEPTH_TEST);							// Enables Depth Testing
	glDepthFunc(GL_LEQUAL);								// The Type Of Depth Testing To Do
*/
	// 
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);	// Really Nice Perspective Calculations

	// Enable draw only in front face
	glEnable( GL_CULL_FACE );
	glCullFace( GL_FRONT );

//	glEnable(GL_DEPTH_TEST);							// Enables Depth Testing
//	glDepthFunc(GL_LESS);								// The Type Of Depth Testing To Do
	glEnable(GL_TEXTURE_2D);							// Enable Texture Mapping ( NEW )


	// Set light-source parameters.
	GLfloat LightAmbient[4];
	GLfloat LightDiffuse[4];
	GLfloat LightPosition[4];
	s_oSceneLight.m_oAmbient.GetGLfloat( &LightAmbient[0] );
	s_oSceneLight.m_oDiffuse.GetGLfloat( &LightDiffuse[0] );
	s_oSceneLight.m_oPosition.GetGLfloat( &LightPosition[0] );
/*	glLightfv(GL_LIGHT0, GL_AMBIENT, LightAmbient);		// Setup The Ambient Light
	glLightfv(GL_LIGHT0, GL_DIFFUSE, LightDiffuse);		// Setup The Diffuse Light
	glLightfv(GL_LIGHT0, GL_POSITION,LightPosition);	// Position The Light
//	glEnable(GL_LIGHTING);
//	glEnable(GL_LIGHT0);								// Enable Light One
//	glNormal3f(0.0f,0.0f,0.0f);
	glDisable(GL_LIGHTING);
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
HRESULT CMyGlApp::DeleteDeviceObjects(GLvoid)
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
HRESULT CMyGlApp::FrameMove(GLvoid)
{
	// Local static data
	static double	s_dAngle = 0;
	static float	s_fX = 5.0f;
	static float	s_fZ = 5.0f;
	static float	s_fHigh;

/*
	// Activate to engine interface
	CEngineInterface::AddLogicalTime( m_fElapsedTime );
*/
	// Insert key processing
	ProcessKey( m_fElapsedTime );
	CScene::FrameMove( m_fElapsedTime );

//	m_oCamera.LayOn( &g_oLand001 );
/*
	BYTE Data[10];
	if( Port::ReadData( 10, Data ) )
	{
//		ProcessComData( Data );
	}

//	arProjectileObject.Process( m_fElapsedTime );
*/
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
HRESULT CMyGlApp::Render(GLvoid)
{
	// Fog setting
	GLfloat afFogColor[4];
	s_oSceneFog.m_oColor.GetGLfloat( &afFogColor[0] );
	glFogi(GL_FOG_MODE, GL_LINEAR);				// Fog Mode
	glFogfv(GL_FOG_COLOR, afFogColor);			// Set Fog Color
//	glFogf(GL_FOG_DENSITY, g_fFogDen);			// How Dense Will The Fog Be
	glHint(GL_FOG_HINT, GL_DONT_CARE);			// Fog Hint Value
	glFogf(GL_FOG_START, s_oSceneFog.m_fStart);	// Fog Start Depth
	glFogf(GL_FOG_END, s_oSceneFog.m_fEnd);		// Fog End Depth
	glEnable(GL_FOG);							// Enables GL_FOG

	// Get current screen size
	RECT rcScreen;
	::GetClientRect( m_hWnd, &rcScreen );
	int ScrWidth  = rcScreen.right - rcScreen.left;
	int ScrHeight = rcScreen.bottom - rcScreen.top;

	// Call camera method for projection and viewing
//	m_oCamera.View();
	if( CMyCamera::s_pActiveCamera )
	{
		m_oCamera.Render();
	}
	else
	{
		gluPerspective( 45.0f, 4.0f/3.0f, 0.1f, 100.0f );
	}

	// Clear Scene
	GLGfx::Clear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);

	// Land rendering
	CScene::Render();


	// 2D begin---------------------------------------------------------------------------
if( CScene::s_oPage==GAMELOOP )
{
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
	sprintf( sz,"Frames/Second: %.3f FPS", m_fFPS );
	CText2D::Putstring( sz, -0.375f, -0.15f, 0, 0xff0000ff );

/*		//Engine::TwoDZone::CText2D::Putstring("Font thai Engine สวัสดีครับ",0.07f,0.9f,0,0xffffffff);

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
*/
/*	// Display fog information
	sprintf( sz, "Fog Start: %.3f", s_oSceneFog.m_fStart );
	CText2D::Putstring( sz, -0.375f, -0.10f, 0, 0x0000ffff );

	sprintf( sz, "Fog End: %.3f", s_oSceneFog.m_fEnd );
	CText2D::Putstring( sz, -0.375f, -0.05f, 0, 0x0000ffff );

	INT iR = (INT)(s_oSceneFog.m_oColor.r*255.f);
	INT iG = (INT)(s_oSceneFog.m_oColor.g*255.f);
	INT iB = (INT)(s_oSceneFog.m_oColor.b*255.f);
	sprintf(sz,"Fog RGB: %d,%d,%d", iR, iG, iB );
	CText2D::Putstring( sz, -0.375f, 0.00f, 0, 0x0000ffff );

	// Display light information
	iR = (INT)(s_oSceneColor.r*255.f);
	iG = (INT)(s_oSceneColor.g*255.f);
	iB = (INT)(s_oSceneColor.b*255.f);
	sprintf(sz,"Light RGB: %d,%d,%d", iR, iG, iB );
	CText2D::Putstring( sz, -0.375f, 0.05f, 0, 0xff00ffff );

	// Display camera information
	CVector3f vE = m_oCamera.GetEye();
	sprintf(sz,"Camera Eye: %.3f, %.3f, %.3f", vE.x, vE.y, vE.z );
	CText2D::Putstring( sz, -0.375f, 0.10f, 0, 0xffff00ff );
			
	CVector3f vL = m_oCamera.GetLookat();
	sprintf(sz,"Camera Lookat: %.3f, %.3f, %.3f", vL.x, vL.y, vL.z );
	CText2D::Putstring( sz, -0.375f, 0.15f, 0, 0xffff00ff );

	sprintf(sz,"Camera FOV: %.3f", m_oCamera.GetFOV() );
	CText2D::Putstring( sz, -0.375f, 0.20f, 0, 0xffff00ff );

	sprintf(sz,"Camera Aspect: %.3f", m_oCamera.GetAspect() );
	CText2D::Putstring( sz, -0.375f, 0.25f, 0, 0xffff00ff );
/*
	FLOAT GetNearPlane()		{ return m_fNearPlane; }
	FLOAT GetFarPlane()			{ return m_fFarPlane; }
/*
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
/*
		m_Mouse.Render();
*/
	// Display Tina's informaitons
	/*
	sprintf(sz,"Tina XYZ : %.3f, %.3f, %.3f", CScene::s_oTina[0].Px(), CScene::s_oTina[0].Py(), CScene::s_oTina[0].Pz() );
	CText2D::Putstring( sz, -0.375f, 0.30f, 0, 0x59ff0fff );

	sprintf(sz,"Tina Ray : %.3f", CScene::s_oTina[0].fRay1);
	CText2D::Putstring( sz, -0.375f, 0.35f, 0, 0x59ff0fff );

	sprintf(sz,"Tina Animate : %s", __szTinaAnimation[CScene::s_oTina[0].m_CurrentAnimationID]);
	CText2D::Putstring( sz, -0.375f, 0.40f, 0, 0x59ff0fff );
*/

	if( bIsEnable_DepthTest ) 
	{
		glEnable(GL_DEPTH_TEST);
	}
}
	// 2D end-----------------------------------------------------------------------------

	// Rendering is finished
	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| 
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
LRESULT CALLBACK CMyGlApp::MsgProc
(	
	HWND    hWnd,			// Handle For This Window
	UINT	uMsg,			// Message For This Window
	WPARAM	wParam,			// Additional Message Information
	LPARAM	lParam			// Additional Message Information
)
{
	switch (uMsg)
    {
		case WM_MOUSEMOVE :
		{
			return 0;
		}

		case WM_LBUTTONDOWN :
		case WM_MBUTTONDOWN :
		case WM_RBUTTONDOWN :
		{
			return 0;
		}
								  
		case WM_LBUTTONUP :
		{
			return 0;
		}

		case WM_MBUTTONUP :
		{
			return 0;
		}
		
		case WM_RBUTTONUP :
		{
			return 0;
		}
	}

	return CGLApplication::MsgProc( hWnd, uMsg, wParam, lParam ); 
}




/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| 
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CMyGlApp::ProcessKey( float fElapsedTime )
{
	switch( CScene::s_oPage )
	{
		case MENU_000:
		{
		}
		break;

		case LOADING:
		{
		}
		break;

		case GAMELOOP:
		{
			if( m_arKey['P'] ) 
			{
				CMyGlApp::s_oSceneFog.m_fEnd	+= fElapsedTime*100.0f;
			}
			else
			if( m_arKey[';'] ) 
			{
				CMyGlApp::s_oSceneFog.m_fEnd	-= fElapsedTime*100.0f;
			}
			else
			if( m_arKey['O'] ) 
			{
				CMyGlApp::s_oSceneFog.m_fStart	+= fElapsedTime*100.0f;
			}
			else
			if( m_arKey['L'] ) 
			{
				CMyGlApp::s_oSceneFog.m_fStart	-= fElapsedTime*100.0f;
			}
			else	// ok camera process
			{
				// Process camera key control
				if( m_arKey['Y'] ) 
				{
					m_oCamera.m_Distance	-= fElapsedTime*64.0f;
				}
				else
				if( m_arKey['H'] ) 
				{
					m_oCamera.m_Distance	+= fElapsedTime*64.0f;
				}
				else
				if( m_arKey['U'] ) 
				{
					m_oCamera.m_UpDistance	+= fElapsedTime*64.0f;
				}
				else
				if( m_arKey['J'] ) 
				{
					m_oCamera.m_UpDistance	-= fElapsedTime*64.0f;
				}

				RECT rcScreen;
				::GetClientRect( m_hWnd, &rcScreen );
				CScene::s_oPlayer.ProcessKey( fElapsedTime, rcScreen, &m_arKey[0] );
				m_oCamera.Process(CScene::s_oPlayer.GetCurrent(), CScene::s_oPlayer.GetCurrentZetha());
			}
		
			// process camera's AI
			m_oCamera.FrameMove();
		}
		break;

		case GAMELOOP_INFO:
		{
		}
		break;

		case GAMEOVER:
		{
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
 Parameters	| 
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
void CMyGlApp::ShowLoading( float fPercent, const CString& Message )
{
/*	CCamera Camera2D;
	Camera2D.SetParamsSystem1
	(	
		0.0f, 0.0f, 0.0f,
		0.0f, 0.0f, 1.0f,
		0.0f, 1.0f, 0.0f	
	);
	Camera2D.View();
*/
	glEnable(GL_TEXTURE_2D);	// Enable Texture Mapping ( NEW )

	GLGfx::Clear();
	
	char sz[255];

	sprintf(sz,"Now Loading... ");
	CText2D::Putstring(sz,0.385f,0.49f,0.0f, 0xffffffff);

	sprintf(sz,"... %s",Message);
	CText2D::Putstring(sz,0.05f,0.93f,0.0f, 0xffffffff);	

	glColor4f(0.3f,0.3f,0.3f,1.0f);
	CText2D::PutPictureIn2D(NULL,0.30f,0.55f,0.70f,0.555f,0.0f,0.0f,0.0f,0.0f,0.0f);
	
	glColor4f(1.0f,1.0f,1.0f,1.0f);
	CText2D::PutPictureIn2D
	(
		NULL,
		0.30f,
		0.55f,
		0.3f+((0.70f-0.30f)*(fPercent/100.0f)),
		0.555f,
		0.0f,
		0.0f,
		0.0f,
		0.0f,
		0.0f
	);
	
	GLGfx::SwapBuffers();
}
