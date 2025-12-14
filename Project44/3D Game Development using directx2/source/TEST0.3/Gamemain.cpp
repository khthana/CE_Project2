#define STRICT
#include "resource.h"
#include "GameMain.h"
#include "ngame.h"

static LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);

// real use
static GameMain*	main	= NULL;
static NGAME		game;
/*static NG3D*		g_NG3d	= NULL;
static LPDIRECT3DDEVICE8	device = NULL;

// testing
static NGSCENE*		scene	= NULL; 
static NGPANEL*		panel	= NULL;
static NGTEXT*		text	= NULL;
static NGCAMERA*	camera	= NULL;*/

GameMain::GameMain()
{
	m_hWnd			= NULL;
	m_hInstance		= NULL;
	m_strName		= STR_WINDOWNAME;
	m_strClass		= STR_WINDOWNAME;
	m_bReady		= FALSE;
	m_bActive		= FALSE;
	m_bPerfCounter	= FALSE;
	m_lFrequency	= 0;
	m_fOldTime		= 0;
	m_fTime			= 0;

	main = this;
}

BOOL GameMain::Create(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize	= sizeof(WNDCLASSEX); 

	wcex.style	= 0;
	wcex.lpfnWndProc	= (WNDPROC)WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, (LPCTSTR)IDI_MAIN);
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_BTNFACE + 1);
	wcex.lpszMenuName	= 0;
	wcex.lpszClassName	= m_strClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance,(LPCTSTR)IDI_SMALL);

	RegisterClassEx(&wcex);

	m_hWnd = CreateWindowEx(
				0L,//WS_EX_TOPMOST,
				m_strClass,m_strName,
				WS_OVERLAPPEDWINDOW,//WS_VISIBLE,
				50, 50, 
				1024, 768,
				NULL, NULL, hInstance, NULL);

	ShowWindow(m_hWnd,SW_NORMAL);
    UpdateWindow(m_hWnd);

	if (QueryPerformanceFrequency((LARGE_INTEGER*)&m_lFrequency))
		m_bPerfCounter	= TRUE;
	else 
		m_lFrequency = 1000;

    m_bActive	= TRUE;
	
    return TRUE;
}

INT GameMain::Run()
{
	static	FLOAT fOldTime = GetFloatTime();
	static	FLOAT fNewTime = fOldTime;
	static	FLOAT fOldTime2 = fNewTime;
	static	int iCount	= 0;
	int		zzz = 0;
	int		n	= 0;
//	char	buffer[100];
	BOOL	bGotMsg;
	BOOL	bDetect = FALSE;
    MSG		msg;
	//HACCEL	hAccelTable;

    // Load keyboard accelerators
	//hAccelTable = LoadAccelerators(hInst, (LPCTSTR)IDA_TRANSLATOR);

    // Now we're ready to recieve and process Windows messages.
    PeekMessage( &msg, NULL, 0U, 0U, PM_NOREMOVE );

    while( WM_QUIT != msg.message  )
    {
        // Use PeekMessage() if the app is active, so we can use idle time to
        // render the scene. Else, use GetMessage() to avoid eating CPU time.
        if (m_bActive)
            bGotMsg = PeekMessage(&msg, NULL, 0U, 0U, PM_REMOVE);
        else
            bGotMsg = GetMessage(&msg, NULL, 0U, 0U);

        if (bGotMsg)
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
        else
        {
            // Render a frame during idle time (no messages are waiting)
            if (m_bActive && m_bReady)
            {
				fOldTime = fNewTime;
				fNewTime = GetFloatTime();

				if (fNewTime<=fOldTime)
					fOldTime = fNewTime;

				game.GetInput();

				game.DoState();

				game.Update(fNewTime-fOldTime);

				game.Render();
				
				// GetTime here
/*				iCount++;

				fOldTime2 = fNewTime;
				fNewTime = GetFloatTime();

				if (fNewTime<=fOldTime)
				{
					fOldTime = fNewTime;
					iCount = 0;
				}

				
				if (fNewTime<=fOldTime2)
					fOldTime2 = fNewTime;

				if (fNewTime>=fOldTime + 1.0)
				{
					zzz	= iCount;
					iCount	= 0;
					fOldTime = fNewTime;
				}

				if (camera!=NULL)
					camera->Update();

				if (device!=NULL)
				{
					device->Clear(0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,0,0), 1.0f, 0);
					
					LPDIRECT3DSURFACE8	surface;
					device->GetRenderTarget(&surface);
					
					device->BeginScene();

					scene->Render(fNewTime-fOldTime2);
					panel->Render();

					device->EndScene();

					sprintf(buffer, "C: %d FPS: %d",bDetect, zzz, n);
					n = 0;
					text->SetText(buffer);
					text->Render(surface);

					device->Present(NULL, NULL, NULL, NULL);
					
				}*/
            }
        }
    }
    return msg.wParam;
}

FLOAT GameMain::GetFloatTime()
{
	LONGLONG lTime;
	if (m_bPerfCounter)
		QueryPerformanceCounter((LARGE_INTEGER*)&lTime);
	else
		lTime = timeGetTime();
	
	return (FLOAT)lTime/m_lFrequency;
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    if (main)
        return main->MsgProc(hWnd, uMsg, wParam, lParam);

    return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

LRESULT GameMain::MsgProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	DWORD	dwActive;

	switch (uMsg)
	{
		case WM_CREATE:
			// Set up graphics
			NGCREATEINFO	sCreateInfo;
			sCreateInfo.bCursor			= FALSE;
			sCreateInfo.bUseDepthBuffer	= TRUE;
			sCreateInfo.bWindow			= FALSE;
			sCreateInfo.dwMinDepthBits  = 16;
			sCreateInfo.dwMinStencilBits= 0;
			sCreateInfo.dwNumDepthBuffer= 2;
			sCreateInfo.dwAdapter		= 0;
			sCreateInfo.dwWidth			= 1024;
			sCreateInfo.dwHeight		= 768;	
			sCreateInfo.dwMode			= 32;
			sCreateInfo.hWnd			= hWnd;

			game.InitGraphic(&sCreateInfo);
			game.InitInput();
			game.InitMusic();
			game.InitGame();

			m_bReady	= TRUE;

/*			NG3D::CreateGraphics(&sCreateInfo);

			g_NG3d	= Graphics()->GetGraphics();
			if (g_NG3d!=NULL)
			{
				m_bReady	= TRUE;
				device	= g_NG3d->GetDevice();
				camera	= new NGCAMERA(D3DXVECTOR3(15.0, 10.0, 15.0),D3DXVECTOR3(0.00,0.00,0.00));
				camera->Initialize(device);
		
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
			*/
			
				/*device->SetLight(0, &light);
				device->LightEnable(0, TRUE);*/		
		
			/*
				vecDir		= D3DXVECTOR3(0.0,-10.0,0.0);
				D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction,&vecDir);
				light.Direction	= vecDir;
				*/
		
				/*device->SetLight(1,&light);
				device->LightEnable(1,TRUE);*/
			/*	
				device->SetRenderState(D3DRS_LIGHTING, TRUE);
				//device->SetRenderState(D3DRS_AMBIENT, 0x55555555);
				device->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
		
				// Turn on the zbuffer
				device->SetRenderState(D3DRS_ZENABLE, TRUE);
				// Turn on specular 
				//device->SetRenderState(D3DRS_SPECULARENABLE,0);
				// Turn to fill solid
				//device->SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
				// Turn on edge antialias
				//device->SetRenderState(D3DRS_EDGEANTIALIAS,0);
				// Alpha blending
				device->SetRenderState(D3DRS_ALPHABLENDENABLE,TRUE);
				device->SetRenderState(D3DRS_SRCBLEND,D3DBLEND_SRCALPHA);
				device->SetRenderState(D3DRS_DESTBLEND,D3DBLEND_INVSRCALPHA);

				// Material
				/*device->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE,D3DMCS_COLOR1);
				device->SetRenderState(D3DRS_SPECULARMATERIALSOURCE,D3DMCS_COLOR2);
				device->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE,D3DMCS_MATERIAL);
				device->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE,D3DMCS_MATERIAL);
				device->SetRenderState( D3DRS_ALPHATESTENABLE,  TRUE );
				device->SetRenderState( D3DRS_ALPHAREF,         0x08 );
				device->SetRenderState( D3DRS_ALPHAFUNC,  D3DCMP_GREATEREQUAL );	
				device->SetRenderState( D3DRS_STENCILENABLE,    FALSE );
				device->SetRenderState( D3DRS_CLIPPING,         TRUE );
				device->SetRenderState( D3DRS_EDGEANTIALIAS,    FALSE );
				device->SetRenderState( D3DRS_CLIPPLANEENABLE,  FALSE );
				device->SetRenderState( D3DRS_VERTEXBLEND,      FALSE );
				device->SetRenderState( D3DRS_INDEXEDVERTEXBLENDENABLE, FALSE );
				device->SetRenderState( D3DRS_FOGENABLE,        FALSE );*/
			/*	device->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_SELECTARG1 );
				device->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_TEXTURE );
				device->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );
				device->SetTextureStageState( 0, D3DTSS_ALPHAOP,   D3DTOP_SELECTARG1 );
				device->SetTextureStageState( 0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE );
				device->SetTextureStageState( 0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE );
				device->SetTextureStageState( 0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
				device->SetTextureStageState( 0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR);
				device->SetTextureStageState( 0, D3DTSS_MIPFILTER, D3DTEXF_NONE );
				/*device->SetTextureStageState( 0, D3DTSS_TEXCOORDINDEX, 0 );
				device->SetTextureStageState( 0, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_DISABLE );
				device->SetTextureStageState( 1, D3DTSS_COLOROP,   D3DTOP_DISABLE );
				device->SetTextureStageState( 1, D3DTSS_ALPHAOP,   D3DTOP_DISABLE );*/
			/*}

			if (m_bReady)
			{
				RECT	rc	= {40, 40, 200, 70};
				panel	= new NGPANEL();
				NGCOLOR4	c;
				NGPOINT		p1	= {0,0};
				NGPOINT		p2	= {1,1};	
				c.c1	= 0x90000050;
				c.c2	= 0x90000050;
				c.c3	= 0xff00005f;
				c.c4	= 0xff00005f;
				panel->Create(p1,p2,300,&c);
				panel->Prepare(g_NG3d);
				
				NGDDSFILE	dds;
				//panel->SetBackground(dds.LoadFile("sp.dds"));


				text	= new NGTEXT();
				text->Create(rc);
				LPDIRECT3DSURFACE8	surface;
				device->GetRenderTarget(&surface);
				text->Prepare(surface, "AngsanaUPC", 10,10);

				scene	= new NGSCENE();

				//scene->AddModelFile("sieg_fight.mdl");
				scene->AddModelFile("test.mdl");
				scene->AddModelFile("stage1.mdl");
				scene->AddModelFile("mud.mdl");
				
				scene->Create(g_NG3d);

				scene->AddMapper(1, "start");
				
				scene->GetModel(0)->m_matModel	= scene->GetMapper(0)->m_matRender;
				scene->GetModel(0)->m_matModel.m[3][1]	+= 9.5f;
				camera->Focus(scene->GetModel(0));
			}*/

            break;
		case WM_ACTIVATE:
			dwActive = LOWORD(wParam);
			switch (dwActive)
			{
				case WA_ACTIVE:
					ShowWindow(hWnd,SW_RESTORE);
					m_bActive	= TRUE;
					break;
				case WA_CLICKACTIVE:
					ShowWindow(hWnd,SW_RESTORE);
					m_bActive	= TRUE;
					break;
				case WA_INACTIVE:
					ShowWindow(hWnd,SW_MINIMIZE);
					m_bActive	= FALSE;
					break;
			}
			break;
/*		case WM_KEYDOWN:
			switch (wParam)
			{
				case VK_ESCAPE:
					PostQuitMessage(0);
					break;
				case VK_PRIOR:
					camera->Orbit(0.0f,0.01f);
					break;
				case VK_NEXT:
					camera->Orbit(0.0f,-0.01f);
					break;
				case VK_DELETE:
					camera->Orbit(0.02f);
					break;
				case VK_END:
					camera->Orbit(-0.02f);
					break;
				case VK_UP:
					camera->Move(D3DXVECTOR3(5.0f,5.0f,5.0f), D3DXVECTOR3(0.0f,0.0f,0.0f));
					//camera->Pan(D3DXVECTOR3(0.0f,0.2f,0.0f));
					break;
				case VK_DOWN:
					camera->Move(D3DXVECTOR3(-5.0f,-5.0f,-5.0f), D3DXVECTOR3(0.0f,0.0f,0.0f));
					//camera->Pan(D3DXVECTOR3(0.0f,-0.2f,0.0f));
					break;
				case VK_LEFT:
					//camera->Pan(D3DXVECTOR3(-0.2f,0.0f,0.0f));
					break;
				case VK_RIGHT:
					//camera->Pan(D3DXVECTOR3(0.2f,0.0f,0.0f));
					break;
				case VK_ADD:
					scene->GetModel(0)->PlayAnime(1, TRUE, 8000, FALSE, TRUE);
					break;
				/*case VK_SUBTRACT:
					camera->Pan(D3DXVECTOR3(0.0f,0.0f,-0.2f));
					break;*/
			/*};
			break;*/
		/*case WM_LBUTTONDOWN:
			//model->SetAnime("ANIME#0");
			break;*/
		case WM_CLOSE:
			DestroyWindow(hWnd);
			break;
		case WM_DESTROY:
			// Add code here
			PostQuitMessage(0);
			break;
		default: 
			return DefWindowProc(hWnd, uMsg, wParam, lParam);
	}
   return 0;
}

//device->GetBackBuffer(0, D3DBACKBUFFER_TYPE_MONO, &surface);
					//text->Render(surface);

					

					//panel->Render();
					//sprite->Render();
					/*
					v1.clear();
					for (int i=0; i<box->GetFrameList()->at(2)->GetMesh()->m_Index.size(); i++)
					{
						p1.Prepare(	&box->GetFrameList()->at(2)->GetMesh()->m_Position, 
									&box->GetFrameList()->at(2)->GetMesh()->m_Index.at(i));
						v1.push_back(p1);
					}

					v2.clear();
					vector<D3DXVECTOR3>	vpos;
					for ( i=0; i<ball->GetFrameList()->at(3)->GetMesh()->m_Position.size(); i++)
					{
						vpos.push_back(ball->GetFrameList()->at(3)->GetMesh()->m_Position.at(i) + pos);
					}
					for ( i=0; i<ball->GetFrameList()->at(3)->GetMesh()->m_Index.size(); i++)
					{

						p2.Prepare(	&vpos,&ball->GetFrameList()->at(3)->GetMesh()->m_Index.at(i));
						v2.push_back(p2);
					}
					*/

				/*	v1.clear();
					for (int i=0; i<box->GetFrameList()->at(4)->GetMesh()->m_Index.size(); i++)
					{
						p1.Prepare(	&box->GetFrameList()->at(4)->GetMesh()->m_Position, 
									&box->GetFrameList()->at(4)->GetMesh()->m_Index.at(i));
						v1.push_back(p1);
					}*/

					/*v2.clear();
					vector<D3DXVECTOR3>	vpos;
					for (int i=0; i<ball->GetFrameList()->at(1)->GetMesh()->m_Position.size(); i++)
					{
						vpos.push_back(ball->GetFrameList()->at(1)->GetMesh()->m_Position.at(i) + pos);
					}
					for ( i=0; i<ball->GetFrameList()->at(1)->GetMesh()->m_Index.size(); i++)
					{

						p2.Prepare(	&vpos,&ball->GetFrameList()->at(1)->GetMesh()->m_Index.at(i));
						v2.push_back(p2);
					}*/
/*
					bDetect = FALSE;

					for ( int i=0; i<v1.size(); i++)
					{
						for (int j=0; j<v2.size(); j++)
						{
							if (v1.at(i).Detect(&v2.at(j)))
								n++;
							if (v1.at(i).GetDetect())
								bDetect = TRUE;
							//n++;
						}
					}

					/*for ( i=0; i<v2.size(); i++)
					{
						for (int j=0; j<v1.size(); j++)
						{
							if (v2.at(i).Detect(&v1.at(j)))
								n++;
							if (v2.at(i).GetDetect())
								bDetect = TRUE;
							//n++;
						}
					}

				panel	= new NGPANEL();

				NGPOINT	pt	= {0, 360};
				NGPOINT s	= {20,5};
				NGCOLOR4 c	= {0xf00000ff, 0xa00000ff, 0x800000ff, 0x800000ff};
				panel->Create(pt, s, 40, &c, TRUE, 0.0f);
				panel->Prepare(g_NG3d);

				
				RECT	rc	= {40, 400, 300, 500};
				
				text	= new NGTEXT();
				
				NGDDSFILE	ddsFile;
			//	NGTEXTURE*	Tex;
				vector<NGTEXTURE*> temp;
				temp.push_back(NULL);
				Tex = ddsFile.LoadFile("bcorner1.dds");
				temp.push_back(Tex);
				Tex = ddsFile.LoadFile("bhorz1.dds");
				temp.push_back(Tex);
				Tex = ddsFile.LoadFile("bvert1.dds");
				temp.push_back(Tex);

				panel->SetTexture(temp);

				pt.x	= 200;
				pt.y	= 100;

				s.x		= 1;
				s.y		= 1;

				NGXLOADER	x;
/*
				box	= x.LoadFile("tri1.x");
				ball= x.LoadFile("tri2.x");

				box	= x.LoadFile("dt.x");
				ball= x.LoadFile("box.x");

				pos	= D3DXVECTOR3(0.0f, 0.0f, 0.0f);

//				box->Prepare(g_NG3d);
//				ball->Prepare(g_NG3d);
				
/*				v1.clear();
				for (int i=0; i<box->GetFrameList()->at(4)->GetMesh()->m_Index.size(); i++)
				{
					p1.Prepare(	&box->GetFrameList()->at(4)->GetMesh()->m_Position, 
								&box->GetFrameList()->at(4)->GetMesh()->m_Index.at(i));
					v1.push_back(p1);
				}

				vector<D3DXVECTOR3>	vpos;
					for ( i=0; i<ball->GetFrameList()->at(1)->GetMesh()->m_Position.size(); i++)
					{
						vpos.push_back(ball->GetFrameList()->at(1)->GetMesh()->m_Position.at(i) + pos);
					}
					for ( i=0; i<ball->GetFrameList()->at(1)->GetMesh()->m_Index.size(); i++)
					{

						p2.Prepare(	&vpos,&ball->GetFrameList()->at(1)->GetMesh()->m_Index.at(i));
						v2.push_back(p2);
					}
*/

/*
				p1.Detect(&p2);
				p2.Detect(&p1);


				sprite = new NGPANEL();

				sprite->Create(pt, s, 300, &c);
				texctrl.LoadSeries("FIRE","dds",1,20);
				sprite->Prepare(g_NG3d);
		
				vector<D3DXVECTOR3>	v;
				D3DXVECTOR3	pos;
				pos	= D3DXVECTOR3(2,2,0);
				v.push_back(pos);
				pos	= D3DXVECTOR3(-1,2,0);
				v.push_back(pos);
				pos	= D3DXVECTOR3(0,-2,0);
				v.push_back(pos);

  */