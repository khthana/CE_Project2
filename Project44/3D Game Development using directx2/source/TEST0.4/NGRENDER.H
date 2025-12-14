#pragma warning(disable:4786)
#ifndef __NGRENDER_H
#define __NGRENDER_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngframe.h"
#include "ngbuffer.h"
#include "ngtexture.h"
//#include "ngresource.h"

#include <stdlib.h>
#include <vector>
#include <string>
#include <queue>

;using namespace std;

class NGRenderer
{
private:
	NGRENDERDESC*		m_rdesc[1024];
	NGRENDERDESC*		m_tbdesc[1024];
	INT					m_index;
	INT					m_index2;
	NG3D*				m_p3d;
	LPDIRECT3DDEVICE8	m_pDevice;

	NGBuffer*			m_curBuffer;
	INT					m_curTex0;
	INT					m_curTex1;
	DWORD				m_dwFVF;

	NGRes2d*			m_res2d;
	INT					m_Size2d;

	NGRenderer*	Initial(NG3D*);

	static	NGRenderer*	m_this;

public:
	NGRenderer()
	{
		m_index = 0;
		m_index2= 0;
		m_p3d	= NULL;
		m_res2d	= NULL;
		m_pDevice	= NULL;
		m_curBuffer = NULL;
		m_curTex0	= -1;
		m_curTex1	= -1;
		m_Size2d	= 0;
		m_this		= this;
	};

	BOOL	Clear();
	BOOL	Add(NGRENDERDESC*);
	BOOL	Sort();
	BOOL	Render();
	
	INT				Length() {return m_index;};
	NGRENDERDESC**	GetRenderDesc() {return &m_rdesc[0];};
	VOID			SetRes2d(NGRes2d*);

	static NGRenderer*	CreateRenderer(NG3D*);
	static NGRenderer*	GetRenderer()	{ return m_this;};
};

inline NGRenderer* CreateRenderer(NG3D* p3d)
{
	return NGRenderer::CreateRenderer(p3d);
};

inline NGRenderer* Renderer()
{
	return NGRenderer::GetRenderer();
};

class NGPostRenderer
{

};

#endif