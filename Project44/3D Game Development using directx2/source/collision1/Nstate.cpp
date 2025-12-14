#include "nstate.h"

// GAME STATE CLASS

//------ NSTATE
NSTATE::NSTATE()
{
	m_p3d		= NULL;
	m_device	= NULL;
	m_pData		= NULL;
	m_pMusic	= NULL;
	m_CurTime	= 0.0f;
	m_PrevTime	= 0.0f;
};

NSTATE::~NSTATE()
{

};

DWORD NSTATE::Create(HWND hWnd, NG3D* p3d, NIDEVICEOUTPUT* pInput, NMUSIC* pMusic)
{
	if ((hWnd==NULL)||(p3d==NULL)||(pInput==NULL)||(pMusic==NULL))
		return FALSE;

	m_hWnd		= hWnd;
	m_p3d		= p3d;
	m_pData		= pInput;
	m_pMusic	= pMusic;

	m_device	= m_p3d->GetDevice();

	DoCreateState();

	return TRUE;
}

DWORD NSTATE::DoCreateState()
{

	return TRUE;
}

DWORD NSTATE::DoDestroyState()
{

	return TRUE;
}

DWORD NSTATE::DoInitState(FLOAT)
{

	return TRUE;
}

DWORD NSTATE::DoState(FLOAT)
{

	return TRUE;
}

DWORD NSTATE::DoRender()
{

	return TRUE;
}

DWORD NSTATE::AdvanceTo(GAME_SUBSTATE state)
{
	m_queue.pop();
	m_queue.push(NGAME_QSTATE(cpost, m_qstate.state));
	m_queue.push(NGAME_QSTATE(cpre, state));
	m_queue.push(NGAME_QSTATE(cnormal, state));

	return TRUE;
}

DWORD NSTATE::StartFrom(GAME_SUBSTATE state)
{
	if (!m_queue.empty())
		m_queue.pop();
	m_queue.push(NGAME_QSTATE(cpre, state));
	m_queue.push(NGAME_QSTATE(cnormal, state));

	return TRUE;
}

DWORD NSTATE::WaitFor(GAME_SUBSTATE state)
{
	m_queue.pop();
	m_queue.push(NGAME_QSTATE(cpre, state));
	m_queue.push(NGAME_QSTATE(cnormal, state));
	m_queue.push(NGAME_QSTATE(cpost, state));
	m_queue.push(m_qstate);
	
	return TRUE;
}

//------ NSTATE_WORLD
NSTATE_WORLD::NSTATE_WORLD()
{
	
}

DWORD NSTATE_WORLD::DoCreateState()
{
	m_scene		= new NGSCENE();
	m_camera	= new NGCAMERA(D3DXVECTOR3(2.0, 1.5, 2.0),D3DXVECTOR3(0.00,0.00,0.00));
	m_camera->Initialize(m_device);

	m_scene->AddModelFile("char.mdl");
	m_scene->AddModelFile("col3.mdl");

	m_scene->AddObject(0);
	m_scene->AddObject(1);
	
	m_scene->Create(m_p3d);

	m_scene->AddMapper(1, "locator1");
	
	m_scene->GetModel(0)->m_matModel.m[3][0]	= m_scene->GetMapper(0)->m_matRender.m[3][0];
	m_scene->GetModel(0)->m_matModel.m[3][1]	= m_scene->GetMapper(0)->m_matRender.m[3][1];
	m_scene->GetModel(0)->m_matModel.m[3][2]	= m_scene->GetMapper(0)->m_matRender.m[3][2];	

	m_camera->Focus(m_scene->GetModel(0));

	NGMODEL* model	= m_scene->GetModel(0);
	NGMODEL* stage	= m_scene->GetModel(1);

	m_scene->AddCollide(model->GetCollideList()->at(0));
	m_scene->AddCollide(stage->GetCollideList()->at(0));

	m_scene->GetCollide(0)->Create(NGCT_LINE);
	m_scene->GetCollide(1)->Create(NGCT_PLANE);

	return TRUE;
}

DWORD NSTATE_WORLD::DoDestroyState()
{

	return TRUE;
}

DWORD NSTATE_WORLD::DoInitState(FLOAT)
{
	switch (m_state)
	{

	case wstart:
		{
			//m_pMusic->SwapSourceFilter("world2.mp3");
		}
		break;

	case wstate:
		{
			
		}
		break;

	default:
		DestroyWindow(m_hWnd);
	}

	return TRUE;
}

DWORD NSTATE_WORLD::DoState(FLOAT fTime)
{
	static char buffer[100];

	m_PrevTime	= m_CurTime;
	m_CurTime	+= fTime;

	if (m_CurTime < m_PrevTime)
		m_PrevTime	= m_CurTime;

	// Input
	
	FLOAT	x	= m_scene->GetModel(0)->m_matModel.m[3][0];
	FLOAT	y	= m_scene->GetModel(0)->m_matModel.m[3][1];
	FLOAT	z	= m_scene->GetModel(0)->m_matModel.m[3][2];

	FLOAT	tx	= m_scene->GetModel(0)->m_matModel.m[3][0];
	FLOAT	ty	= m_scene->GetModel(0)->m_matModel.m[3][1];
	FLOAT	tz	= m_scene->GetModel(0)->m_matModel.m[3][2];

	FLOAT	a	= 0.0f;

	if (m_pData->right)
	{
		x	-= 0.005f;
		//a	= FLOAT(-PI/2);
	}

	if (m_pData->left)
	{
		x	+= 0.005f;
		//a	= FLOAT(PI/2);
	}

	if (m_pData->up)
	{
		z	-= 0.005f;
		//a	= FLOAT(PI);
		
		/*if (m_pData->right)
			//a	= FLOAT(5*PI/4);

		if (m_pData->left)
			//a	= FLOAT(3*PI/4);*/
	}

	if (m_pData->down)
	{
		z	+= 0.005f;
		//a	= 0.0f;

		/*if (m_pData->right)
			//a	= -FLOAT(PI/4);

		if (m_pData->left)
			//a	= FLOAT(PI/4);*/
	}

	// update
	if ((!m_pData->up && !m_pData->down) && (!m_pData->right && !m_pData->left))
	{
		// idle
		m_scene->GetModel(0)->PlayAnime(1, FALSE);
		m_scene->GetModel(0)->Reset();
		m_scene->GetModel(0)->PlayAnime(0, TRUE, 500, FALSE, TRUE);
	}
	else
	{
		// move
		m_scene->GetModel(0)->PlayAnime(0, FALSE);
		m_scene->GetModel(0)->Reset();
		D3DXMatrixRotationY(&m_scene->GetModel(0)->m_matModel, a);
		m_scene->GetModel(0)->m_matModel.m[3][0]	= x;
		m_scene->GetModel(0)->m_matModel.m[3][1]	= y;
		m_scene->GetModel(0)->m_matModel.m[3][2]	= z;
		m_scene->GetModel(0)->PlayAnime(1, TRUE, 12000, FALSE, TRUE);
	}

	// detect collision
	DWORD bModel	= FALSE;
	NGCOLLIDE*	model	= m_scene->GetCollide(0);
	NGCOLLIDE*	stage	= m_scene->GetCollide(1);

	model->Update();

	if (m_pData->start)
	{
		bModel = TRUE;
	}

	NGMODEL*		m	= m_scene->GetModel(0);
	D3DXVECTOR3		ref	= m->GetRefPoint();
	FLOAT			tempy;

	if (Projection(stage, &ref, tempy))
		m_scene->GetModel(0)->m_matModel.m[3][1]	= tempy;
	else
	{
		m_scene->GetModel(0)->m_matModel.m[3][0]	= tx;
		m_scene->GetModel(0)->m_matModel.m[3][1]	= ty;
		m_scene->GetModel(0)->m_matModel.m[3][2]	= tz;
	}

	

	/*if (Detect(model,stage))
	{
		m_scene->GetModel(0)->m_matModel.m[3][0]	= tx;
		m_scene->GetModel(0)->m_matModel.m[3][1]	= ty;
		m_scene->GetModel(0)->m_matModel.m[3][2]	= tz;
	}*/

	

	if (m_camera!=NULL)
		m_camera->Update();


	return TRUE;
}

DWORD NSTATE_WORLD::DoRender()
{
	if (m_scene!=NULL)
		m_scene->Render(m_CurTime-m_PrevTime);

	return TRUE;
}

//----- NSTATE_MENU
NSTATE_MENU::NSTATE_MENU()
{
	m_pointer	= NULL;
	m_panel1	= NULL;
	m_panel2	= NULL;
	m_panel3	= NULL;
	m_panel4	= NULL;
	m_panel5	= NULL;
	m_panel6	= NULL;
	m_panel7	= NULL;
	m_panel8	= NULL;
	m_bg		= NULL;

	m_dwPos		= 0;
}

NSTATE_MENU::~NSTATE_MENU()
{
	
}

DWORD NSTATE_MENU::DoCreateState()
{
	NGDDSFILE	dds;
	RECT	rc;
	GetWindowRect(m_hWnd, &rc);

	LPDIRECT3DSURFACE8	surface;
	m_device->GetRenderTarget(&surface);

	m_location.push_back(NGPOINT(740,30));
	m_location.push_back(NGPOINT(740,95));
	m_location.push_back(NGPOINT(740,160));
	m_location.push_back(NGPOINT(740,230));
	m_location.push_back(NGPOINT(740,305));
	m_location.push_back(NGPOINT(740,375));
	m_location.push_back(NGPOINT(740,445));
	m_location.push_back(NGPOINT(740,510));
	// m_panel1 = picture

	char	buffer[100];

	m_panel1	= new NGPANEL();
	//NGRECTEX	rcex	= NGRECTEX(-800, 0, 720, 240);
	NGRECTEX	rcex	= NGRECTEX(0, 0, 720, 240);
	NGCOLOR4 color	= {0x00000055,0xffffffff, 0xffffffff, 0xffffffff};
	m_panel1->CreateEx(&rcex, &color);
	m_panel1->Prepare(m_p3d);
	m_panel1->SetBackground(dds.LoadFile("Image/sieg_panel.dds"));

	// text
	RECT	rc1;
	rc1.left	= 250;
	rc1.top		= 80;
	rc1.right	= rc1.left	+ 200;
	rc1.bottom	= rc1.top	+ 50;
	m_txLev1	= new NGTEXT();
	m_txLev1->Create(rc1);
	m_txLev1->Prepare(surface, "Angsana New", 40,10);
	m_txLev1->SetText("LEVEL          1");

	rc1.left	= 250;
	rc1.top		= 110;
	rc1.right	= rc1.left	+ 200;
	rc1.bottom	= rc1.top	+ 50;
	m_txHP1	= new NGTEXT();
	m_txHP1->Create(rc1);
	m_txHP1->Prepare(surface, "Angsana New", 40,10);
	m_txHP1->SetText("HP       270/270");

	rc1.left	= 250;
	rc1.top		= 140;
	rc1.right	= rc1.left	+ 200;
	rc1.bottom	= rc1.top	+ 50;
	m_txMP1	= new NGTEXT();
	m_txMP1->Create(rc1);
	m_txMP1->Prepare(surface, "Angsana New", 40,10);
	m_txMP1->SetText("MP         30/30");

	rc1.left	= 250;
	rc1.top		= 170;
	rc1.right	= rc1.left	+ 400;
	rc1.bottom	= rc1.top	+ 50;
	m_txEXP1	= new NGTEXT();
	m_txEXP1->Create(rc1);
	m_txEXP1->Prepare(surface, "Angsana New", 40,10);
	m_txEXP1->SetText("EXP            0    NEXT         100");

	m_pack1	= new NGPACKAGE();
	m_pack1->AddPanel(m_panel1);
	m_pack1->AddText(m_txLev1);
	m_pack1->AddText(m_txHP1);
	m_pack1->AddText(m_txMP1);
	m_pack1->AddText(m_txEXP1);

	m_pack1->MoveTo(-800,0);

	// pointer
	m_pointer	= new NGPANEL();
	rcex	= NGRECTEX(m_location.at(0).x, m_location.at(0).y,60,60);
	color.c1	= 0x00000055;
	color.c2	= 0xffffffff;
	color.c3	= 0xffffffff;
	color.c4	= 0xffffffff;
	m_pointer->CreateEx(&rcex, &color);
	m_pointer->Prepare(m_p3d);
	m_pointer->SetBackground(dds.LoadFile("Image/pointer.dds"));

	// panel2

	m_panel2	= new NGPANEL();
	rcex.x	= 0;
	rcex.y	= 240;
	rcex.sx	= 720;
	rcex.sy	= 240;
	color.c1	= 0x00000055;
	color.c2	= 0xffffffff;
	color.c3	= 0xffffffff;
	color.c4	= 0xffffffff;
	m_panel2->CreateEx(&rcex, &color);
	m_panel2->Prepare(m_p3d);
	m_panel2->SetBackground(dds.LoadFile("Image/orfina_panel.dds"));

	// text
	rc1.left	= 250;
	rc1.top		= 80 + 240;
	rc1.right	= rc1.left	+ 200;
	rc1.bottom	= rc1.top	+ 50;
	m_txLev2	= new NGTEXT();
	m_txLev2->Create(rc1);
	m_txLev2->Prepare(surface, "Angsana New", 40,10);
	m_txLev2->SetText("LEVEL          1");

	rc1.left	= 250;
	rc1.top		= 110 + 240;
	rc1.right	= rc1.left	+ 200;
	rc1.bottom	= rc1.top	+ 50;
	m_txHP2	= new NGTEXT();
	m_txHP2->Create(rc1);
	m_txHP2->Prepare(surface, "Angsana New", 40,10);
	m_txHP2->SetText("HP       270/270");

	rc1.left	= 250;
	rc1.top		= 140 + 240;
	rc1.right	= rc1.left	+ 200;
	rc1.bottom	= rc1.top	+ 50;
	m_txMP2	= new NGTEXT();
	m_txMP2->Create(rc1);
	m_txMP2->Prepare(surface, "Angsana New", 40,10);
	m_txMP2->SetText("MP         30/30");

	rc1.left	= 250;
	rc1.top		= 170 + 240;
	rc1.right	= rc1.left	+ 400;
	rc1.bottom	= rc1.top	+ 50;
	m_txEXP2	= new NGTEXT();
	m_txEXP2->Create(rc1);
	m_txEXP2->Prepare(surface, "Angsana New", 40,10);
	m_txEXP2->SetText("EXP            0    NEXT         100");

	m_pack2	= new NGPACKAGE();
	m_pack2->AddPanel(m_panel2);
	m_pack2->AddText(m_txLev2);
	m_pack2->AddText(m_txHP2);
	m_pack2->AddText(m_txMP2);
	m_pack2->AddText(m_txEXP2);

	m_pack2->MoveTo(-1000,0);

	// panel 3

	m_panel3	= new NGPANEL();
	rcex.x	= -1200;
	rcex.y	= 480;
	rcex.sx	= 720;
	rcex.sy	= 240;
	color.c1	= 0x00000055;
	color.c2	= 0xffffffff;
	color.c3	= 0xffffffff;
	color.c4	= 0xffffffff;
	m_panel3->CreateEx(&rcex, &color);
	m_panel3->Prepare(m_p3d);
	m_panel3->SetBackground(dds.LoadFile("Image/empty_panel.dds"));

	m_panel4	= new NGPANEL();
	//rcex.x	= 723;
	rcex.x	= 1100;
	rcex.y	= 5;
	rcex.sx	= 280;
	rcex.sy	= 600;
	color.c1	= 0x00000055;
	color.c2	= 0xffffffff;
	color.c3	= 0xffffffff;
	color.c4	= 0xffffffff;
	m_panel4->CreateEx(&rcex, &color);
	m_panel4->Prepare(m_p3d);
	m_panel4->SetBackground(dds.LoadFile("Image/menu.dds"));

	// m_bg
	m_bg		= new NGPANEL();
	rcex.x	= 0;
	rcex.y	= 0;
	rcex.sx	= rc.right-rc.left;
	rcex.sy	= rc.bottom-rc.top;
	color.c1	= 0x00000055;
	color.c2	= 0xffffffff;
	color.c3	= 0xffffffff;
	color.c4	= 0xffffffff;
	m_bg->CreateEx(&rcex, &color, 0.0f);
	m_bg->Prepare(m_p3d);
	m_bg->SetBackground(dds.LoadFile("Image/bk2.dds"));

	m_queue.push(NGAME_QSTATE());

	return TRUE;
}

DWORD NSTATE_MENU::DoDestroyState()
{

	return TRUE;
}

DWORD NSTATE_MENU::DoInitState(FLOAT)
{

	return TRUE;
}

DWORD NSTATE_MENU::DoState(FLOAT fTime)
{
	m_fTime	= fTime;

	if (m_queue.empty())
		return TRUE;

	m_qstate	= m_queue.front();

	switch (m_qstate.control)
	{
	case cpre:
		DoPreState(m_qstate.state);
		return TRUE;
	case cnormal:
		DoStated(m_qstate.state);
		return TRUE;
	case cpost:
		DoPostState(m_qstate.state);
		return TRUE;
	}

	return TRUE;
}

DWORD NSTATE_MENU::DoPreState(GAME_SUBSTATE state)
{
	NGRECTEX	rc;
	static	FLOAT delay	= 0.0f;
	static	FLOAT delay2= 0.0f;
	INT		slice,slice2;

	switch (state)
	{
	case wstart:
		/*m_queue.push(NGAME_QSTATE(cnormal,state));
		m_queue.pop();*/
		m_dwPos		= 0;
		m_dwNext	= 0;
		delay		= 0.0f;
		delay2		= 0.0f;
		m_queue.pop();
		
		break;

	case wmmain:
		delay+=m_fTime;

		slice	= (INT)(delay*1500);

		if (slice!=0)
			delay	= 0.0f;
		else
			break;


		if (m_panel4->GetClient().x>723)
			m_panel4->Move(-slice,0);

		if (m_pack1->GetPos()->x<0)
			m_pack1->Move(slice,0);

		if (m_pack2->GetPos()->x<0)
			m_pack2->Move(slice,0);

		m_panel3->Move(slice,0);
		rc	= m_panel3->GetClient();
		if (rc.x>=0)
		{
			m_panel3->MoveTo(0,480);
			delay	= 0.0f;
			m_queue.pop();
		}

		if (m_pack1->GetPos()->x>0)
			m_pack1->MoveTo(0,0);
		
		if (m_pack2->GetPos()->x>0)
			m_pack2->MoveTo(0,0);

		if (m_panel4->GetClient().x<723)
			m_panel4->MoveTo(723,5);

		break;
	case wmmove:

		delay+=m_fTime;
		m_pointer->MoveTo(m_location.at(m_dwNext).x,m_location.at(m_dwNext).y);
		m_queue.pop();
			
/*		delay2+=m_fTime;

		slice	= (INT)(delay*2000);

		if (m_dwNext>m_location.size())
		{
			delay	= 0.0f;
			delay2	= 0.0f;
			m_queue.pop();
			break;
		}

		if ( (m_location.at(m_dwPos).y == m_location.at(m_dwNext).y) &&
			 (m_location.at(m_dwPos).x == m_location.at(m_dwNext).x) )
		{
			//m_pointer->MoveTo(m_location.at(m_dwNext).x,m_location.at(m_dwNext).y);
			m_dwPos	= m_dwNext;
		}

		if (m_dwNext==m_dwPos)
		{
			delay	= 0.0f;
			delay2	= 0.0f;
			m_queue.pop();
			break;
		}

		if (slice!=0)
			delay	= 0.0f;

		if (abs(m_pointer->GetClient().y - m_location.at(m_dwNext).y) > 20)
			m_pointer->Move(0,slice);
		else
			m_pointer->MoveTo(m_pointer->GetClient().x, m_location.at(m_dwNext).y);
		
		if (abs(m_pointer->GetClient().x - m_location.at(m_dwNext).x) > 20)
			m_pointer->Move(slice,0);
		else
			m_pointer->MoveTo(m_location.at(m_dwNext).x, m_pointer->GetClient().y);
*/
		break;
	}
	
	return TRUE;
}

DWORD NSTATE_MENU::DoStated(GAME_SUBSTATE state)
{
	static FLOAT delay	= 0.0f;
	switch (state)
	{
	case wstart:
		delay	= 0.0f;
		AdvanceTo(wmmain);
		break;
	case wmmain:
		{
			if (m_pData->left)
			{
				//WaitFor(wmmove);
			}
	
			if (m_pData->right)
			{
	
			}
	
			if (m_pData->up)
			{
				m_dwNext--;

				if (m_dwNext>=m_location.size())
					m_dwNext	= m_location.size()-1;
				
				WaitFor(wmmove);
			}
	
			if (m_pData->down)
			{
				m_dwNext++;

				if (m_dwNext>=m_location.size())
					m_dwNext	= 0;
				
				WaitFor(wmmove);
			}
	
			if (m_pData->start)
			{
				//m_queue.pop();
				//m_queue.push(NGAME_QSTATE(cpost,wstart));
				AdvanceTo(wstart);
			}
	
			break;
		}
	case wmmove:
		{
			delay+=m_fTime;
			if (delay>0.1f)
			{
				m_queue.pop();
				delay	=0.0f;
			}
			break;
		}
	}
	
	return TRUE;
}

DWORD NSTATE_MENU::DoPostState(GAME_SUBSTATE state)
{
	NGRECTEX	rc;
	static	FLOAT delay	= 0.0f;
	INT	slice;

	switch (state)
	{
	case wstart:
		m_queue.pop();
		break;

	case wmmain:
		{
			delay+=m_fTime;
	
			slice	= (INT)(delay*5000);
	
			if (slice!=0)
				delay	= 0.0f;
			else
				break;

			if (m_panel4->GetClient().x<1100)
				m_panel4->Move(slice,0);
	
			if (m_pack1->GetPos()->x<-800)
				m_pack1->Move(-slice,0);
			else
			{
				m_pack1->MoveTo(-800,0);
			}
	
			if (m_pack2->GetPos()->x<-1000)
				m_pack2->Move(-slice,0);
			else
			{
				m_pack2->MoveTo(-1000,0);
			}
	
			m_panel3->Move(-slice,0);
			rc	= m_panel3->GetClient();
			if (rc.x<=-1200)
			{
				m_panel3->MoveTo(-1200,0);
				delay	= 0.0f;
				m_queue.pop();
			}
	
			if (m_panel4->GetClient().x<723)
				m_panel4->MoveTo(723,5);
			/*
			if (m_panel1->GetClient().x>-800)
				m_panel1->Move(-slice,0);
			if (m_panel2->GetClient().x>-1000)
				m_panel2->Move(-slice,0);
			if (m_panel4->GetClient().x<1100)
				m_panel4->Move(slice,0);
			m_panel3->Move(-slice,0);
			rc	= m_panel3->GetClient();
			if (rc.x<=-1200)
			{
				m_panel1->MoveTo(-800,0);
				m_panel2->MoveTo(-1000,240);
				m_panel3->MoveTo(-1200,480);
				m_panel4->MoveTo(1100,5);
				//m_queue.push(NGAME_QSTATE(cpre, state));
				m_queue.pop();
			}
			*/
		}
	case wmmove:
		{
			m_queue.pop();
			break;
		}
	}
		
	return TRUE;
}

DWORD NSTATE_MENU::DoRender()
{
	if (m_bg!=NULL)
		m_bg->Render();

	if (m_panel1!=NULL)
		m_panel1->Render();

	if (m_panel2!=NULL)
		m_panel2->Render();

	if (m_panel3!=NULL)
		m_panel3->Render();

	if (m_panel4!=NULL)
		m_panel4->Render();

	if (m_panel5!=NULL)
		m_panel5->Render();

	if (m_panel6!=NULL)
		m_panel6->Render();

	if (m_panel7!=NULL)
		m_panel7->Render();

	if (m_panel8!=NULL)
		m_panel8->Render();

	if (m_pointer!=NULL)
		m_pointer->Render();
	
	return TRUE;
}

DWORD NSTATE_MENU::DoPostRender(LPDIRECT3DSURFACE8	surface)
{
	if (m_txLev1!=NULL)
		m_txLev1->Render(surface);

	if (m_txHP1!=NULL)
		m_txHP1->Render(surface);

	if (m_txMP1!=NULL)
		m_txMP1->Render(surface);

	if (m_txEXP1!=NULL)
		m_txEXP1->Render(surface);

	if (m_txLev2!=NULL)
		m_txLev2->Render(surface);

	if (m_txHP2!=NULL)
		m_txHP2->Render(surface);

	if (m_txMP2!=NULL)
		m_txMP2->Render(surface);

	if (m_txEXP2!=NULL)
		m_txEXP2->Render(surface);
	
	return TRUE;
}

// NGSTATE_BATTLE

NSTATE_BATTLE::NSTATE_BATTLE()
{

}

NSTATE_BATTLE::~NSTATE_BATTLE()
{
	
}

DWORD NSTATE_BATTLE::DoCreateState()
{
	m_scene		= new NGSCENE();
	m_camera	= new NGCAMERA(D3DXVECTOR3(40.0, 10.0, 0.0),D3DXVECTOR3(0.00,0.00,0.00));
	m_camera->Initialize(m_device);
	m_camera->Update();

	m_scene->AddModelFile("battle1.mdl");
	m_scene->AddModelFile("sieg_fight.mdl");
	m_scene->AddModelFile("demon.mdl");
	m_scene->AddModelFile("demon.mdl");

	m_scene->AddObject(0);
	m_scene->AddObject(1);
	m_scene->AddObject(2);
	m_scene->AddObject(3);

	m_scene->Create(m_p3d);

	m_scene->AddMapper(0, "locator1");
	m_scene->AddMapper(0, "locator2");
	m_scene->AddMapper(0, "locator3");
	m_scene->AddMapper(0, "locator4");
	m_scene->AddMapper(0, "locator5");

	NGDDSFILE	dds;
	m_tcom	= dds.LoadFile("Image/command.dds");
	m_tatt1	= dds.LoadFile("Image/attack1.dds");
	m_tatt2	= dds.LoadFile("Image/attack2.dds");
	m_tmag1	= dds.LoadFile("Image/magic1.dds");
	m_tmag2	= dds.LoadFile("Image/magic2.dds");
	m_titem1= dds.LoadFile("Image/item1.dds");
	m_titem2= dds.LoadFile("Image/item2.dds");
	
	m_command	= new NGPANEL();
	NGRECTEX	rcex	= NGRECTEX(10, 500, 200, 200);
	NGCOLOR4	color;
	color.c1	= 0x00000055;
	color.c2	= 0xffffffff;
	color.c3	= 0xffffffff;
	color.c4	= 0xffffffff;
	
	m_command->CreateEx(&rcex, &color);
	m_command->Prepare(m_p3d);
	m_command->SetBackground(m_tcom);
	
	m_attack	= new NGPANEL();
	rcex	= NGRECTEX(0, 535, 250, 150);
	m_attack->CreateEx(&rcex, &color);
	m_attack->Prepare(m_p3d);
	m_attack->SetBackground(m_tatt1);

	m_magic	= new NGPANEL();
	rcex	= NGRECTEX(0, 580, 250, 150);
	m_magic->CreateEx(&rcex, &color);
	m_magic->Prepare(m_p3d);
	m_magic->SetBackground(m_tmag1);

	m_item	= new NGPANEL();
	rcex	= NGRECTEX(0, 625, 250, 150);
	m_item->CreateEx(&rcex, &color);
	m_item->Prepare(m_p3d);
	m_item->SetBackground(m_titem1);

	return TRUE;
}

DWORD NSTATE_BATTLE::DoDestroyState()
{

	return TRUE;
}

DWORD NSTATE_BATTLE::DoInitState(FLOAT)
{

	return TRUE;
}

DWORD NSTATE_BATTLE::DoState(FLOAT fTime)
{
	m_PrevTime	= m_CurTime;
	m_CurTime	+= fTime;

	if (m_CurTime < m_PrevTime)
		m_PrevTime	= m_CurTime;

	m_fTime	= fTime;

	if (m_queue.empty())
		return TRUE;

	m_qstate	= m_queue.front();

	switch (m_qstate.control)
	{
	case cpre:
		DoPreState(m_qstate.state);
		return TRUE;
	case cnormal:
		DoStated(m_qstate.state);
		return TRUE;
	case cpost:
		DoPostState(m_qstate.state);
		return TRUE;
	}

	return TRUE;
}

DWORD NSTATE_BATTLE::DoPreState(GAME_SUBSTATE state)
{
	switch (state)
	{
	case wstart:
		{
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

			m_pMusic->SwapSourceFilter("battle.mp3");
			D3DXMatrixIdentity(&m_scene->GetModel(1)->m_matModel);
			D3DXMatrixRotationY(&m_scene->GetModel(1)->m_matModel, 45);
			m_scene->GetModel(1)->m_matModel.m[3][0]	= m_scene->GetMapper(4)->m_matRender.m[3][0] + 0.0f;
			m_scene->GetModel(1)->m_matModel.m[3][1]	= m_scene->GetMapper(4)->m_matRender.m[3][1] + 7.5f;
			m_scene->GetModel(1)->m_matModel.m[3][2]	= -m_scene->GetMapper(4)->m_matRender.m[3][2] + 0.0f;
		
			m_matCamera	= m_scene->GetModel(1)->m_matModel;
			m_matCamera.m[3][2]	-= 15.0f;
			m_camera->Focus(&m_matCamera);
		
			D3DXMatrixIdentity(&m_scene->GetModel(2)->m_matModel);
			m_scene->GetModel(2)->m_matModel.m[3][0]	= m_scene->GetMapper(0)->m_matRender.m[3][0];
			m_scene->GetModel(2)->m_matModel.m[3][1]	= m_scene->GetMapper(0)->m_matRender.m[3][1];
			m_scene->GetModel(2)->m_matModel.m[3][2]	= -m_scene->GetMapper(0)->m_matRender.m[3][2];
		
			m_scene->GetModel(2)->m_matModel.m[0][0]	*=	3;
			m_scene->GetModel(2)->m_matModel.m[1][1]	*=	3;
			m_scene->GetModel(2)->m_matModel.m[2][2]	*=	3;
		
			D3DXMatrixIdentity(&m_scene->GetModel(3)->m_matModel);
			m_scene->GetModel(3)->m_matModel.m[3][0]	= m_scene->GetMapper(2)->m_matRender.m[3][0];
			m_scene->GetModel(3)->m_matModel.m[3][1]	= m_scene->GetMapper(2)->m_matRender.m[3][1];
			m_scene->GetModel(3)->m_matModel.m[3][2]	= -m_scene->GetMapper(2)->m_matRender.m[3][2];
		
			m_scene->GetModel(3)->m_matModel.m[0][0]	*=	3;
			m_scene->GetModel(3)->m_matModel.m[1][1]	*=	3;
			m_scene->GetModel(3)->m_matModel.m[2][2]	*=	3;

			m_queue.pop();
		}
		break;
	case wbcommand:
		break;
	case wbrun:
		break;
	case wbattack:
		break;
	case wbwait:
		break;
	}
	
	return TRUE;
}

DWORD NSTATE_BATTLE::DoStated(GAME_SUBSTATE state)
{
	switch (state)
	{
	case wstart:
		{
			m_scene->GetModel(1)->PlayAnime(2, TRUE, 12000, FALSE, TRUE);
			m_scene->GetModel(2)->PlayAnime(0, TRUE, 2000, FALSE, TRUE);
			m_scene->GetModel(3)->PlayAnime(0, TRUE, 2000, FALSE, TRUE);
		}
		break;
	case wbcommand:
		break;
	case wbrun:
		break;
	case wbattack:
		break;
	case wbwait:
		break;
	}
	return TRUE;
}

DWORD NSTATE_BATTLE::DoPostState(GAME_SUBSTATE state)
{
	switch (state)
	{
	case wstart:
		{

		}
		break;
	case wbcommand:
		break;
	case wbrun:
		break;
	case wbattack:
		break;
	case wbwait:
		break;
	}
		
	return TRUE;
}

DWORD NSTATE_BATTLE::DoRender()
{
	if (m_camera!=NULL)
		m_camera->Update();
	if (m_scene!=NULL)
		m_scene->Render(m_CurTime-m_PrevTime);

	if (m_command!=NULL)
		m_command->Render();
	if (m_attack!=NULL)
		m_attack->Render();
	if (m_magic!=NULL)
		m_magic->Render();
	if (m_item!=NULL)
		m_item->Render();
	
	return TRUE;
}

DWORD NSTATE_BATTLE::DoPostRender(LPDIRECT3DSURFACE8	surface)
{

	
	return TRUE;
}
