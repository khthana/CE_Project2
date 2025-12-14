#include "ngame.h"

NGAME::NGAME()
{
	m_NG3d		= NULL;
	m_device	= NULL;
	
	m_scene		= NULL; 
	m_panel		= NULL;
	m_text		= NULL;
	m_camera	= NULL;
	
	m_pInput	= NULL;

	m_pMusic	= NULL;

	m_CurTime	= 0.0f;
	m_PrevTime	= 0.0f;
	m_TempTime	= 0.0f;

	m_stGame	= gstart;
//	m_stWorld	= wstart;
};

NGAME::~NGAME()
{
	/*m_pMusic->Clear();
	DEL(m_pMusic);*/
};


DWORD NGAME::InitGraphic(NGCREATEINFO*	pCreateInfo)
{
	m_hWnd	= pCreateInfo->hWnd;

	NG3D::CreateGraphics(pCreateInfo);

	m_NG3d	= Graphics()->GetGraphics();
	
	if (m_NG3d==NULL)
		return FALSE;
	
	m_device	= m_NG3d->GetDevice();

	if (m_device==NULL)
		return FALSE;
	/*		
	camera	= new NGCAMERA(D3DXVECTOR3(15.0, 10.0, 15.0),D3DXVECTOR3(0.00,0.00,0.00));
	camera->Initialize(m_device);
	*/
	D3DXVECTOR3 vecDir		= D3DXVECTOR3(5,0.0,-10.0);
	D3DXCOLOR	cDiffuse	= 0xff999999;
	D3DXCOLOR	cAmbient	= 0xff000000;
	D3DXCOLOR	cSpecular	= 0xffffffff;
	NGLIGHT	light;
	
	D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction,&vecDir);
	light.Type		= D3DLIGHT_DIRECTIONAL;
	light.Diffuse	= (D3DCOLORVALUE)cDiffuse;
	light.Ambient	= (D3DCOLORVALUE)cAmbient;
	light.Specular	= (D3DCOLORVALUE)cSpecular;
	light.Directional(light.Direction,light.Diffuse,light.Specular,light.Ambient);
	
	m_device->SetLight(0, &light);
	m_device->LightEnable(0, TRUE);		
	
	vecDir		= D3DXVECTOR3(0.0,-10.0,0.0);
	D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction,&vecDir);
	light.Direction	= vecDir;
	
	m_device->SetLight(1,&light);
	m_device->LightEnable(1,TRUE);
	
	m_device->SetRenderState(D3DRS_LIGHTING, FALSE);
	m_device->SetRenderState(D3DRS_AMBIENT, 0xffffffff);
	m_device->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	
	// Turn on the zbuffer
	m_device->SetRenderState(D3DRS_ZENABLE, TRUE);
	// Turn on specular 
	//m_device->SetRenderState(D3DRS_SPECULARENABLE,0);
	// Turn to fill solid
	//m_device->SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
	// Turn on edge antialias
	m_device->SetRenderState(D3DRS_EDGEANTIALIAS,TRUE);
	// Alpha blending
	m_device->SetRenderState(D3DRS_ALPHABLENDENABLE,TRUE);
	m_device->SetRenderState(D3DRS_SRCBLEND,D3DBLEND_SRCALPHA);
	m_device->SetRenderState(D3DRS_DESTBLEND,D3DBLEND_INVSRCALPHA);
	m_device->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE);

	// Material
	/*m_device->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE,D3DMCS_COLOR1);
	m_device->SetRenderState(D3DRS_SPECULARMATERIALSOURCE,D3DMCS_COLOR2);
	m_device->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE,D3DMCS_MATERIAL);
	m_device->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE,D3DMCS_MATERIAL);
	m_device->SetRenderState( D3DRS_ALPHATESTENABLE,  TRUE );
	m_device->SetRenderState( D3DRS_ALPHAREF,         0x08 );
	m_device->SetRenderState( D3DRS_ALPHAFUNC,  D3DCMP_GREATEREQUAL );	
	m_device->SetRenderState( D3DRS_STENCILENABLE,    FALSE );
	m_device->SetRenderState( D3DRS_CLIPPING,         TRUE );
	m_device->SetRenderState( D3DRS_EDGEANTIALIAS,    FALSE );
	m_device->SetRenderState( D3DRS_CLIPPLANEENABLE,  FALSE );
	m_device->SetRenderState( D3DRS_VERTEXBLEND,      FALSE );
	m_device->SetRenderState( D3DRS_INDEXEDVERTEXBLENDENABLE, FALSE );
	m_device->SetRenderState( D3DRS_FOGENABLE,        FALSE );*/
/*	m_device->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_SELECTARG1 );
	m_device->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_TEXTURE );
	m_device->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );
	m_device->SetTextureStageState( 0, D3DTSS_ALPHAOP,   D3DTOP_SELECTARG1 );
	m_device->SetTextureStageState( 0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE );
	m_device->SetTextureStageState( 0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE );
	m_device->SetTextureStageState( 0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
	m_device->SetTextureStageState( 0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR);
	m_device->SetTextureStageState( 0, D3DTSS_MIPFILTER, D3DTEXF_NONE );
	/*m_device->SetTextureStageState( 0, D3DTSS_TEXCOORDINDEX, 0 );
	m_device->SetTextureStageState( 0, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_DISABLE );
	m_device->SetTextureStageState( 1, D3DTSS_COLOROP,   D3DTOP_DISABLE );
	m_device->SetTextureStageState( 1, D3DTSS_ALPHAOP,   D3DTOP_DISABLE );*/

	return TRUE;
}

DWORD NGAME::InitInput()
{
	if (m_pInput!=NULL)
		DEL(m_pInput);

	m_pInput	= new NINPUT();

	m_pInput->CreateInput(m_hWnd);

	m_pInput->CreateKeyboard();
	m_pInput->CreateMouse();
	m_pInput->CreateJoystick();

	m_kb.i[0]	= 0xc8;
	m_kb.i[1]	= 0xd0;
	m_kb.i[2]	= 0xcb;
	m_kb.i[3]	= 0xcd;

	m_kb.i[4]	= 0x1f;
	m_kb.i[5]	= 0x12;
	m_kb.i[6]	= 0x2d;
	m_kb.i[7]	= 0x20;

	m_kb.i[8]	= 0x13;
	m_kb.i[9]	= 0x14;
	m_kb.i[10]	= 0x11;
	m_kb.i[11]	= 0x10;

	m_kb.i[12]	= 0x01;
	m_kb.i[13]	= 0x1c;

	return TRUE;
}

DWORD NGAME::InitSound()
{
	
	return TRUE;
}

DWORD NGAME::InitMusic()
{
	if (m_pMusic!=NULL)
		DEL(m_pMusic);

	m_pMusic	= new NMUSIC();

	m_pMusic->InitGraph();

	return TRUE;
}

DWORD NGAME::InitVideo()
{

	return TRUE;
}

DWORD NGAME::Update(FLOAT fTime)
{
	m_PrevTime	= m_CurTime;
	m_CurTime	+= fTime;

	if (m_CurTime < m_PrevTime)
		m_PrevTime	= m_CurTime;

	return TRUE;
}

DWORD NGAME::Render()
{
	static INT		iCount	= 0;
	static INT		iFPS	= 0;
	static FLOAT	fOneSec	= m_CurTime;
	static char		buffer[100];

	iCount++;

	if (m_CurTime>=fOneSec + 1.0f)
	{
		iFPS	= iCount;
		iCount	= 0;
		fOneSec = m_CurTime;
	}

	/*if (m_camera!=NULL)
		m_camera->Update();*/

	if (m_device!=NULL)
	{
		m_device->Clear(0, NULL, /*D3DCLEAR_TARGET|*/D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,0,0), 1.0f, 0);
		
		LPDIRECT3DSURFACE8	surface;
		m_device->GetRenderTarget(&surface);
		
		m_device->BeginScene();

		DoStateRender();
		//m_panel->Render();

		

		m_device->EndScene();

		sprintf(buffer, "C: %d FPS: %d",10, iFPS);

		m_text->SetText(buffer);
		m_text->Render(surface);

		DoStatePostRender(surface);

		m_device->Present(NULL, NULL, NULL, NULL);
	}

	return TRUE;
}

DWORD NGAME::GetInput()
{
	m_pInput->Pool();
	BYTE*	data	= m_pInput->GetKBData();

	for (int i=0; i<14; i++)
	{
		if (data[m_kb.i[i]] & 0x80)
			m_Data.i[i] = TRUE;
		else
			m_Data.i[i] = FALSE;
	}

	if (m_CurTime<m_TempTime)
	{
		for (i=0; i<14; i++)
			m_Data.i[i] = FALSE;
	}
	else
		m_TempTime = 0.0f;

	if (m_Data.select)
	{
		m_pMusic->Clear();
		DEL(m_pMusic);
		DestroyWindow(m_hWnd);
	}

	return TRUE;
}

DWORD NGAME::InitGame()
{
	RECT	rc	= {40, 40, 200, 70};

	/*m_panel->Create(p1,p2,300,&c);
	m_panel->Prepare(m_NG3d);
	
	NGDDSFILE	dds;
	m_panel->SetBackground(dds.LoadFile("sp.dds"));*/

	m_Siegfried.SetData("Siegfried", 
						1,		100,
						0,		1000,
						50,		50,
						10,		10,
						30,		20,		25,		5,		10);

	m_Orfina.SetData("Orfina",
						1,		100,
						0,		1000,
						32,		32,
						30,		30,
						5,		20,		30,		20,		15);

	m_text	= new NGTEXT();
	m_text->Create(rc);
	LPDIRECT3DSURFACE8	surface;
	m_device->GetRenderTarget(&surface);
	m_text->Prepare(surface, "AngsanaUPC", 50,10);
	m_text->SetText("HI");

	m_World.Create(m_hWnd, m_NG3d, &m_Data, m_pMusic);
	m_Menu.Create(m_hWnd, m_NG3d, &m_Data, m_pMusic);
	m_Battle.Create(m_hWnd, m_NG3d, &m_Data, m_pMusic);
/*
	m_scene	= new NGSCENE();

	m_scene->AddModelFile("test.mdl");
	m_scene->AddModelFile("stage3.mdl");
	m_scene->AddModelFile("mud.mdl");

	m_scene->AddObject(0);
	m_scene->AddObject(1);
	m_scene->AddObject(2);
	
	m_scene->Create(m_NG3d);

	m_scene->AddMapper(1, "start");
	
	m_scene->GetModel(0)->m_matModel.m[3][0]	= m_scene->GetMapper(0)->m_matRender.m[3][0];
	m_scene->GetModel(0)->m_matModel.m[3][1]	= m_scene->GetMapper(0)->m_matRender.m[3][1] + 9.5f;
	m_scene->GetModel(0)->m_matModel.m[3][2]	= m_scene->GetMapper(0)->m_matRender.m[3][2];	
	m_camera->Focus(m_scene->GetModel(0));

	NGCOLLIDE col;
	col.m_Position.push_back(D3DXVECTOR3(0.0f, 0.0f, 0.0f));
	col.m_Position.push_back(D3DXVECTOR3(2.0f, 11.5f, 0.0f));
	col.m_Position.push_back(D3DXVECTOR3(-2.0f, 11.5f, 0.0f));

	NGFACE	f;
	f.f1	= 0;
	f.f2	= 1;
	f.f3	= 2;
	col.m_Face.push_back(f);

	col.m_FrameID	= 0;

	m_scene->GetModel(0)->AddCollide(&col);
*/
	return TRUE;
}

DWORD NGAME::DoState()
{
	switch (m_stGame)
	{

	case gstart:
		{
			m_stGame	= gworld;
			DoInitState();
		}
		break;

	case gworld:
		{	
			switch (m_World.m_state)
			{
			case wmenu:
				{
					m_stGame	= gmenu;
					m_Menu.StartFrom(wstart);
					//m_Menu.m_state	= wstart;
					DoInitState();
					Wait(0.1f);
				}
				break;

			case wbattle:
				{
					m_stGame	= gbattle;
					m_Battle.StartFrom(wstart);
					DoInitState();
					Wait(0.1f);
				}
				break;

			default:
				m_World.DoState(m_CurTime-m_PrevTime);
			}
		}
		break;
	
	case gmenu:
		{
			
			m_Menu.DoState(m_CurTime-m_PrevTime);
/*			switch (m_Menu.m_state)
			{
			case wworld:
				{
					m_stGame	= gworld;
					m_World.m_state	= wstate;
					Wait(0.1f);
				}
				break;

			default:
				m_Menu.DoState(m_CurTime-m_PrevTime);
			}*/
		}
		break;

	case gbattle:
		{
			
			m_Battle.DoState(m_CurTime-m_PrevTime);

		}
		break;
	
	default:
		DestroyWindow(m_hWnd);
	}

	return TRUE;
};

DWORD NGAME::DoInitState()
{
	switch (m_stGame)
	{

	case gstart:
		{

		}
		break;

	case gworld:
		{	
			m_World.m_state	= wstart;
			m_World.DoInitState(0.0f);
		}
		break;

	case gmenu:
		{
			m_Menu.DoInitState(0.0f);
		}
		break;

	case gbattle:
		{
			m_Battle.DoInitState(0.0f);
		}
		break;

	default:
		DestroyWindow(m_hWnd);
	}

	return TRUE;
};

DWORD NGAME::DoStateRender()
{
	switch (m_stGame)
	{

	case gstart:
		{

		}
		break;

	case gworld:
		{	
			/*
			m_stWorld	= wstart;
			DoWorldState();		
			*/
			m_World.DoRender();
		}
		break;

	case gmenu:
		{

			m_Menu.DoRender();
		}
		break;

	case gbattle:
		{

			m_Battle.DoRender();
		}
		break;

	default:
		DestroyWindow(m_hWnd);
	}

	return TRUE;
}

DWORD NGAME::Wait(FLOAT fTime)
{
	m_TempTime	= fTime + m_CurTime;
	return TRUE;
}

DWORD NGAME::DoStatePostRender(LPDIRECT3DSURFACE8 surface)
{
	switch (m_stGame)
	{

	case gstart:
		{

		}
		break;

	case gworld:
		{	
			/*
			m_stWorld	= wstart;
			DoWorldState();		
			*/
		}
		break;

	case gmenu:
		{

			m_Menu.DoPostRender(surface);
		}
		break;

	case gbattle:
		{

		}
		break;

	default:
		DestroyWindow(m_hWnd);
	}

	return TRUE;
}
	
