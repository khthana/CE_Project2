#include "stdafx.h"
#include "ngscene.h"

NGScene::NGScene()
{
	m_renderBuffer	= new NGRenderBuffer();
	m_res2d			= new NGRes2d();
	m_res3d			= new NGRes3d();
	m_desktop		= new NGPanel(PanelControl()->GetDesktop()->GetDesc());
	m_light			= new NGLight();		
	m_camera		= new NGCamera();	
}

NGScene::~NGScene()
{
	delete	m_renderBuffer;
	delete	m_res2d;
	delete	m_res3d;
	delete	m_desktop;
	delete	m_light;
	delete	m_camera;
}

INT NGScene::LoadMDL(string fname)
{
	NGModel*	mdl = m_md2File.LoadMD2(fname);
	m_res3d->AddModel(mdl, mdl->GetName());
	m_renderBuffer->Add(mdl);
	return 0;
}

INT NGScene::LoadMDL(string fname, string name)
{
	NGModel*	mdl = m_md2File.LoadMD2(fname);
	m_res3d->AddModel(mdl, name);
	m_renderBuffer->Add(mdl);
	return 0;
}

INT NGScene::LoadTEX(string name)
{
	m_tx2File.LoadTX2(name, m_res2d);
	return 0;
}

INT NGScene::Add(NGPANELCREATE* pc,NGPanel*& pnl)
{
	if (pc->pParent==NULL)
		pc->pParent	= m_desktop;

	if (pnl)
		delete pnl;

	pnl	= new NGPanel(pc);

	return 0;
}

INT NGScene::Add(NGPANELCREATE* pc,NGTextureBox*& box)
{
	if (pc->pParent==NULL)
		pc->pParent	= m_desktop;

	if (box)
		delete box;

	box	= new NGTextureBox(pc);
	box->SetColor(0xffffffff);
	m_renderBuffer->Add2d(box);
	return 0;
}

INT NGScene::Add(NGPANELCREATE* pc,NGText*& text)
{
	if (pc->pParent==NULL)
		pc->pParent	= m_desktop;

	if (text)
		delete text;

	text = new NGText(pc->pParent, pc->px, pc->py);

	text->AddToBuffer(m_renderBuffer);
	text->Create(m_res2d);

	//text = new NGText(pc);

	//m_renderBuffer->Add2d(

	return 0;
}
/*
INT NGScene::Create(NGWindow*& window, NGPANELCREATE* pc, DWORD l, DWORD r, DWORD t, DWORD b)
{
	if (window)
		delete window;
	window	= new NGWindow();
	window->Create(pc, l, r, t, b);
	return 0;
}
*/
INT NGScene::Clone(DWORD ix, NGClone*& clone)
{
	m_res3d->CreateClone(ix, clone);
	clone->Link();
	return 0;
}

INT NGScene::Clone(string name, NGClone*& clone)
{

	return 0;
}

BOOL NGScene::Initial()
{
	m_renderBuffer->CreateBuffer(Graphics());
	
	m_res2d->CreateTexture(Graphics());
	m_res3d->Link(m_res2d);
	return TRUE;
}

BOOL NGScene::Activate()
{
	Renderer()->SetRes2d(m_res2d);
	PanelControl()->SetDesktop(m_desktop);
	return TRUE;
}

BOOL NGScene::Detect()
{
	m_res3d->Detect();

	return TRUE;
}

BOOL NGScene::Render(FLOAT time)
{
	m_res3d->Render(time);

	return TRUE;
}
