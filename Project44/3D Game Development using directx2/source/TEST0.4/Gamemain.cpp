#define STRICT
#include "resource.h"
#include "GameMain.h"
#include "ng.h"

static LRESULT CALLBACK WndProc(HWND,UINT,WPARAM,LPARAM);

// real use
static GameMain*	main	= NULL;
//static NGAME		game;

static	NG3D*				g3d		= NULL;
static	NGPanelControl*		gPanel	= NULL;
static	NGRenderer*			gRender	= NULL;
static	NGScene*			gScene	= NULL;
static	NGTextureBox*		gTBox	= NULL;
static	NGText*	text = NULL;
static	NGCamera*	c;

static	NGClone*	test;

static FLOAT				newTime;
static FLOAT				oldTime;
static LPDIRECT3DDEVICE8	device = NULL;

/*
static NG3D*		g_NG3d	= NULL;
static NGPanelControl* pPCtrl	= NULL;
static LPDIRECT3DDEVICE8	device = NULL;
static NGRenderBuffer* rb;
static NGRenderer* renderer;
static NGCamera*	c;
static NGClone*		sheep;

static NGTextureBox* t;
static NGClone*		clone;
static NGClone*		clone2;
*/
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
				800, 600,
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
	static	float oneSec = 0.0f;
	int		zzz = 0;
	int		n	= 0;
	char	buffer[100];
	BOOL	bGotMsg;
	BOOL	bDetect = FALSE;
    MSG		msg;
	static	x = 0;
	static  y = 0;
	static  b = TRUE;
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
				oldTime	= newTime;
				newTime	= GetFloatTime();

				if (device!=NULL)
				{
					device->Clear(0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0,0,0), 1.0f, 0);
					
					gTBox->SetPosition(x, y);

					if (b)
						x++;
					else
						x--;

					iCount++;

					oneSec+=(newTime-oldTime);

					if (oneSec<0.0f)
						oneSec = 0.0f;

					if (oneSec>1.0f)
					{
						oneSec = 0.0f;
						
						sprintf(buffer, "ขณะนี้ทำงานอยู่ที่ %d FPS", iCount);
						text->SetText(buffer);
						iCount = 0;
					}


					if (x>400)
					{
						//sprintf(buffer, " จำนวนครั้งคือ %d", n);
						b = FALSE;
						//text->SetText(buffer);
						n++;
					}
					if (x<0)
						b = TRUE;


					gPanel->Update();
					//gScene->Detect();

					//test->GetMatrix()->m[3][1]	= (*test->Detector()->GetGround())[0]->height[0];

					gScene->Render(newTime-oldTime);

					gRender->Sort();
					gRender->Render();
					gRender->Clear();
					

					device->Present(NULL, NULL, NULL, NULL);
					
				}

				oldTime = newTime;
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
	static bool set = false;

	switch (uMsg)
	{
		case WM_CREATE:
			// Set up graphics
			{
				NGCREATEINFO	sCreateInfo;
				sCreateInfo.bCursor			= FALSE;
				sCreateInfo.bUseDepthBuffer	= TRUE;
				sCreateInfo.bWindow			= TRUE;
				sCreateInfo.dwMinDepthBits  = 16;
				sCreateInfo.dwMinStencilBits= 0;
				sCreateInfo.dwNumDepthBuffer= 2;
				sCreateInfo.dwAdapter		= 0;
				sCreateInfo.dwWidth			= 1024;
				sCreateInfo.dwHeight		= 768;	
				sCreateInfo.dwMode			= 32;
				sCreateInfo.hWnd			= hWnd;

				CreateGraphics(&sCreateInfo);

				g3d		= Graphics()->GetGraphics();				
				gPanel	= PanelControl()->GetPanelCtrl();
				gRender	= Renderer()->GetRenderer();
				
				gScene	= new NGScene();
				
				if (g3d)
				{
					device		= g3d->GetDevice();
					m_bReady	= TRUE;

					NGPANELCREATE	pc;
					pc.sx	= 400;
					pc.sy	= 200;
					pc.px	= -10;
					pc.py	= 50;
					pc.name = "this desktop";
					pc.pParent = NULL;

					NGTextureBox*	tb = NULL;
					NGTextureBox*	tb2= NULL;
					NGTextureBox*	tb3= NULL;
					NGTextureBox*	tb4= NULL;
					NGTextureBox*	tb5= NULL;
					
					gScene->Add(&pc,tb);

					pc.sx	= 800;
					pc.sy	= 10;
					pc.px	= 0;
					pc.py	= 0;
					pc.name	= "texturebox";
					pc.pParent = tb;
					pc.dock	= DockType.bottom;

					
					
					gScene->Add(&pc,tb2);
					tb->SetColor(0x5fffff00);
					tb2->SetColor(0x9f0000ff);
					gTBox = tb;
					pc.dock = DockType.top;

					gScene->Add(&pc,tb3);
					tb3->SetColor(0xaf00ff00);

					pc.dock = DockType.left;
					pc.sx	= 10;

					gScene->Add(&pc,tb4);
					tb4->SetColor(0xcf00ffff);

					pc.dock = DockType.right;
					pc.sx	= 10;
					pc.pParent = tb;

					gScene->Add(&pc,tb5);
					tb5->SetColor(0xcf000000);

					
					pc.px	= 200;
					pc.py	= 200;
					pc.pParent = tb;
					gScene->Add(&pc,text);
					text->SetColor(0xaf00ff00);

					gScene->LoadTEX("stage1.tx2");
					gScene->LoadTEX("stage2.tx2");
					gScene->LoadTEX("stage3.tx2");
					gScene->LoadTEX("stage4.tx2");
					gScene->LoadTEX("stage5.tx2");
					gScene->LoadTEX("stage6.tx2");
					gScene->LoadTEX("stage7.tx2");
					gScene->LoadMDL("test.md2");

					gScene->LoadTEX("boy1.tx2");
					gScene->LoadTEX("boy2.tx2");
					gScene->LoadTEX("boy3.tx2");
					gScene->LoadTEX("boy4.tx2");
					gScene->LoadTEX("boy5.tx2");
					gScene->LoadMDL("boy.md2");

					gScene->LoadTEX("robotex.tx2");
					gScene->LoadMDL("robot.md2");

					NGClone*	stage	= NULL;
					NGClone*	boy		= NULL;
					NGClone*	boy2	= NULL;
					NGClone*	robot	= NULL;
					
					gScene->Initial();
					gScene->Clone(0, stage);
					gScene->Clone(1, boy);
					//gScene->Clone(1, boy2);

					//gScene->Clone(2, robot);
					stage->Update(0.0f);
					boy->Update(0.0f);
					//boy2->Update(0.0f);
					//robot->Update(0.0f);

					NGPLAYANIME	pa;
					pa.AnimeByID(0);
					boy->AddPlayAnim(pa);
					pa.AnimeByID(1);
					boy->AddPlayAnim(pa);
					pa.AnimeByID(2);
					boy->AddPlayAnim(pa);
					boy->Play(1,true,true, 0);

					//boy->GetMatrix()->m[0][0]	= 1;
					//D3DXMATRIX	mat;
					//D3DXMatrixRotationYawPitchRoll(boy->GetMatrix(), PI/2, 0, 0);
					

					test = boy;

					/*pa.AnimeByID(0);
					boy2->AddPlayAnim(pa);
					pa.AnimeByID(1);
					boy2->AddPlayAnim(pa);
					pa.AnimeByID(2);
					boy2->AddPlayAnim(pa);
					boy2->Play(2,true,true, 0);
					oy2->GetMatrix()->m[3][2]	= -7.5f;b*/
					
					/*robot->AddPlayAnim(pa);
					pa.AnimeByID(1);
					robot->AddPlayAnim(pa);
					pa.AnimeByID(2);
					robot->AddPlayAnim(pa);
					pa.AnimeByID(3);
					robot->AddPlayAnim(pa);

					robot->Play(2,true,true, 0);


				/*	gScene->LoadTEX("a5.tx2");
					gScene->LoadTEX("plant.tx2");
					gScene->LoadTEX("plantb.tx2");
					gScene->LoadTEX("tree.tx2");
					gScene->LoadTEX("leaf2.tx2");
					gScene->LoadMDL("scene.md2");

					gScene->LoadTEX("face.tx2");
					gScene->LoadTEX("hair.tx2");
					gScene->LoadTEX("other.tx2");
					gScene->LoadTEX("shirt.tx2");
					gScene->LoadMDL("boy.md2");

					gScene->LoadTEX("robotex.tx2");
					gScene->LoadMDL("robot.md2");

					NGClone*	clone;
					NGClone*	boy;
					NGClone*	bot;

					gScene->Initial();
					//gScene->Clone(0, clone);
					//gScene->Clone(1, boy);
					gScene->Clone(2, bot);
					//clone->Update(0.0f);
					//boy->Update(0.0f);
					//bee->Update(0.0f);

					NGPLAYANIME pa;
					pa.AnimeByID(0);
				//	pa.AnimeByID(1);
					//boy->AddPlayAnim(pa);
					//boy->Play(0,true,true, 0);

					bot->AddPlayAnim(pa);
					bot->Play(0,true,true, 0);

					//clone->AddPlayAnim(pa);
					//clone->Play(0, true, true, 0);*/

					/*NGCamera*/	
					
					c	= gScene->GetCamera();

					gScene->GetCamera()->CreateCamera(g3d);
					gScene->GetCamera()->SetFrom(D3DXVECTOR3(20.0, 20.0, 20.0));
					gScene->GetCamera()->SetTo(D3DXVECTOR3(0.00,10.00,0.00));
					gScene->GetCamera()->Update();

					gScene->GetLight()->Initial(g3d);
					D3DXVECTOR3	vDir;
					vDir =  *c->GetTarget()- *c->GetPosition();
					NGLIGHT light;
					light.DirectLight(vDir, 0xffffffff,0x00000000, 0);
					gScene->GetLight()->Set(LightMask.Light0, light);

					NGLight*	l = new NGLight();
					l->Initial(g3d);
					vDir =  *c->GetTarget()- *c->GetPosition() ;
					DWORD color	= 0xFFFFFFFF;
					DWORD color2 = 0xff808080;
					light.DirectLight(vDir, color, color, color2);
					l->Set(LightMask.Light0, light);

					device->SetRenderState(D3DRS_AMBIENT, 0xff707070);
					device->SetRenderState(D3DRS_LIGHTING, TRUE);
					device->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE);
					device->SetRenderState(D3DRS_ALPHABLENDENABLE,TRUE);
					device->SetRenderState(D3DRS_SRCBLEND,D3DBLEND_SRCALPHA);
					device->SetRenderState(D3DRS_DESTBLEND,D3DBLEND_INVSRCALPHA);
					device->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
					device->SetTexture(0,NULL);
					/*device->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_SELECTARG2 );
					device->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_TEXTURE );
					device->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );*/

					device->SetTextureStageState( 0, D3DTSS_ALPHAOP,   D3DTOP_SELECTARG1 );
					device->SetTextureStageState( 0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE );
					device->SetTextureStageState( 0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE );

					device->SetTextureStageState( 0, D3DTSS_MINFILTER, D3DTEXF_LINEAR);
					device->SetTextureStageState( 0, D3DTSS_MAGFILTER, D3DTEXF_LINEAR);
					device->SetTextureStageState( 0, D3DTSS_MIPFILTER, D3DTEXF_NONE );

					device->SetRenderState( D3DRS_DITHERENABLE, TRUE );
					device->SetRenderState( D3DRS_ZENABLE, TRUE );
					//device->SetRenderState( D3DRS_SPECULARENABLE, TRUE );
					device->SetRenderState( D3DRS_NORMALIZENORMALS, TRUE );
					
					//device->SetRenderState( D3DRS_CULLMODE, D3DCULL_CW );
					device->SetRenderState( D3DRS_LIGHTING, TRUE );
					
					device->SetRenderState( D3DRS_COLORVERTEX, FALSE );
					/*device->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_MODULATE );
					device->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_TEXTURE );
					device->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );
					device->SetTextureStageState( 0, D3DTSS_ALPHAOP,   D3DTOP_DISABLE );*/

					gScene->Activate();

					text->SetText("นี้คือการทดสอบ");

					newTime = GetFloatTime();
					oldTime	= newTime;
				}
				/*NGMD2File md2;
				NGTX2File tx2;
				rb = new NGRenderBuffer();
				NGRes2d*  R2d = new NGRes2d();
				NGModel* model = md2.LoadMD2("box.md2");
				md2.LoadMD2("boy9.md2");
				NGModel* sphere = md2.LoadMD2("sphere.md2");

				tx2.LoadTX2("wood.tx2",R2d);
				rb->Add(model);
				rb->Add(sphere);
				
				NGCREATEINFO	sCreateInfo;
				sCreateInfo.bCursor			= FALSE;
				sCreateInfo.bUseDepthBuffer	= TRUE;
				sCreateInfo.bWindow			= TRUE;
				sCreateInfo.dwMinDepthBits  = 16;
				sCreateInfo.dwMinStencilBits= 0;
				sCreateInfo.dwNumDepthBuffer= 2;
				sCreateInfo.dwAdapter		= 0;
				sCreateInfo.dwWidth			= 800;
				sCreateInfo.dwHeight		= 600;	
				sCreateInfo.dwMode			= 32;
				sCreateInfo.hWnd			= hWnd;

				CreateGraphics(&sCreateInfo);


				g_NG3d	= Graphics()->GetGraphics();
				
				pPCtrl	= PanelControl()->GetPanelCtrl();
				
				renderer	= Renderer()->GetRenderer();
				renderer->SetRes2d(R2d);

				if (g_NG3d==NULL)
				{
					MessageBox(NULL, "Extremely error", "error", MB_OK);
					DestroyWindow(0);
				}

				m_bReady = true;
				device = g_NG3d->GetDevice();

				NGPANELCREATE	pc;
				pc.sx	= 300;
				pc.sy	= 400;
				pc.px	= 0;
				pc.py	= 100;
				pc.pParent	= NULL;
				NGPanel*	pnl = new NGPanel(&pc);
				pc.pParent = pnl;
				pc.sx	= 100;
				pc.sy	= 100;
				pc.px	= 200;
				pc.py	= 0;
				NGTextureBox* tb = new NGTextureBox(&pc);
				t = tb;
				t ->SetColor(0x00FF00FF, 0x5F00FF00, 0x9F0000FF, 0xFFFF0000);
				rb->Add2d(t);

				rb->CreateBuffer(g_NG3d);
				model->Link(R2d);
				sphere->Link(R2d);
				clone = model->Clone();
				clone2	= sphere->Clone();
				clone->Link();
				clone2->Link();
				clone->Update(0.0f);
				clone2->Update(0.0f);
				NGPLAYANIME pa;
				pa.AnimeByID(0);
				clone->AddPlayAnim(pa);
				clone->Play(0, true, true, 0);
				R2d->CreateTexture(g_NG3d);
				sheep = clone;


				c = new NGCamera(D3DXVECTOR3(5.0, 5.0, 5.0),D3DXVECTOR3(0.00,2.00,0.00));
				c->CreateCamera(g_NG3d);
				c->Active();
				NGLight*	l = new NGLight();
				l->Initial(g_NG3d);
				NGLIGHT	light;
				D3DXVECTOR3	vDir;
				vDir =  *c->GetTarget()- *c->GetPosition() ;
				DWORD color	= 0xFFFFFFFF;
				DWORD color2 = 0x55555555;
				light.Directional(vDir, color, color, color2);
				l->Set(LightMask.Light0, light);

				device->SetRenderState(D3DRS_AMBIENT, 0xffffffff);
				device->SetRenderState(D3DRS_LIGHTING, TRUE);
				device->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE);
				device->SetRenderState(D3DRS_ALPHABLENDENABLE,TRUE);
				device->SetRenderState(D3DRS_SRCBLEND,D3DBLEND_SRCALPHA);
				device->SetRenderState(D3DRS_DESTBLEND,D3DBLEND_INVSRCALPHA);
				device->SetTexture(0,NULL);

				oldTime = GetFloatTime();*/
				/*device->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_SELECTARG1 );
				device->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_DIFFUSE );
				device->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );*/
				//device->SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);
				//device->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
			}
	/*		NGCREATEINFO	sCreateInfo;
			sCreateInfo.bCursor			= FALSE;
			sCreateInfo.bUseDepthBuffer	= TRUE;
			sCreateInfo.bWindow			= TRUE;
			sCreateInfo.dwMinDepthBits  = 16;
			sCreateInfo.dwMinStencilBits= 0;
			sCreateInfo.dwNumDepthBuffer= 2;
			sCreateInfo.dwAdapter		= 0;
			sCreateInfo.dwWidth			= 1024;
			sCreateInfo.dwHeight		= 768;	
			sCreateInfo.dwMode			= 32;
			sCreateInfo.hWnd			= hWnd;

	/*		game.InitGraphic(&sCreateInfo);
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
		case WM_KEYDOWN:
			{
				static float x = 0.0f;
				static float y = 0.0f;
				
				switch (wParam)
				{
					case VK_ESCAPE:
						PostQuitMessage(0);
						break;
					case VK_UP:
						test->GetMatrix()->m[3][0] -= 0.3f;
						if (!set)
						{
							test->Play(1,false,false, 0);
							test->Play(0,true,true, 0);
							set = TRUE;
						}
						/*c->GetTarget()->y+=1.0f;
						c->Active();*/

						
						//camera->Move(D3DXVECTOR3(5.0f,5.0f,5.0f), D3DXVECTOR3(0.0f,0.0f,0.0f));
						//camera->Pan(D3DXVECTOR3(0.0f,0.2f,0.0f));
						break;
					case VK_DOWN:
						/*c->GetTarget()->y-=1.0f;
						c->Active();*/
						//camera->Move(D3DXVECTOR3(-5.0f,-5.0f,-5.0f), D3DXVECTOR3(0.0f,0.0f,0.0f));
						//camera->Pan(D3DXVECTOR3(0.0f,-0.2f,0.0f));
						break;
					case VK_LEFT:
						/*c->GetTarget()->x+=1.0f;
						c->Active();*/
						//camera->Pan(D3DXVECTOR3(-0.2f,0.0f,0.0f));
						break;
					case VK_RIGHT:
						/*c->GetTarget()->x-=1.0f;
						c->Active();*/
						//camera->Pan(D3DXVECTOR3(0.2f,0.0f,0.0f));
						break;
					case VK_ADD:
						//scene->GetModel(0)->PlayAnime(1, TRUE, 8000, FALSE, TRUE);
						c->GetPosition()->y+=1.0f;
						c->Active();
						break;
					/*case VK_SUBTRACT:
						camera->Pan(D3DXVECTOR3(0.0f,0.0f,-0.2f));
						break;*/
				};
			}
			break;
		case WM_KEYUP:
			{
				static float x = 0.0f;
				static float y = 0.0f;
				switch (wParam)
				{
					case VK_ESCAPE:
						PostQuitMessage(0);
						break;
					case VK_UP:
						test->Play(0,false,false, 0);
						test->Play(1,true,true, 0);
						set	= false;
						/*c->GetTarget()->y+=1.0f;
						c->Active();*/

						
						//camera->Move(D3DXVECTOR3(5.0f,5.0f,5.0f), D3DXVECTOR3(0.0f,0.0f,0.0f));
						//camera->Pan(D3DXVECTOR3(0.0f,0.2f,0.0f));
						break;
					case VK_DOWN:
						c->GetTarget()->y-=1.0f;
						c->Active();
						//camera->Move(D3DXVECTOR3(-5.0f,-5.0f,-5.0f), D3DXVECTOR3(0.0f,0.0f,0.0f));
						//camera->Pan(D3DXVECTOR3(0.0f,-0.2f,0.0f));
						break;
					case VK_LEFT:
						c->GetTarget()->x+=1.0f;
						c->Active();
						//camera->Pan(D3DXVECTOR3(-0.2f,0.0f,0.0f));
						break;
					case VK_RIGHT:
						c->GetTarget()->x-=1.0f;
						c->Active();
						//camera->Pan(D3DXVECTOR3(0.2f,0.0f,0.0f));
						break;
					case VK_ADD:
						//scene->GetModel(0)->PlayAnime(1, TRUE, 8000, FALSE, TRUE);
						c->GetPosition()->y+=1.0f;
						c->Active();
						break;
					/*case VK_SUBTRACT:
						camera->Pan(D3DXVECTOR3(0.0f,0.0f,-0.2f));
						break;*/
				};
			}
			break;
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