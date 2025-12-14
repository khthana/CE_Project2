#ifndef __NGSCENE_H
#define __NGSCENE_H


#include "nggraphics.h"
#include "ngresource.h"
#include "nglight.h"
#include "ngcamera.h"
#include "ngrender.h"
#include "ngpanel.h"
#include "ngmodel.h"

#include "ngtexfile.h"
#include "ngmdlfile.h"

#include <vector>
#include <string>
#include <queue>
;
using namespace std;

/*

class NGSCENE
{
private:
	// Direct3D + Device object
	NG3D*					m_p3d;
	NGIBTYPE				m_typeIB;
	
	// resource...
	vector<NGMODEL*>		m_Model;		// declaration use
	vector<NGMODEL*>		m_Object;		// real use
	vector<NGPANEL*>		m_Panel;
	vector<NGLIGHT*>		m_Light;
	vector<NGCAMERA*>		m_Camera;
	vector<NGTEXTURE*>		m_Texture;
	vector<NGTEXT*>			m_Text;
	vector<NGMATERIAL*>		m_Mtrl;
	vector<NGCOLLIDE*>		m_Collide;

	// mapper
	vector<NGFRAME*>		m_Mapper;
	
	// file loading...
	vector<string>			m_ddsName;
	NGDDSFILE				m_ddsFile;
	NGMDLFILE				m_mdlFile;

	// Vertex buffer for PNT1 FVF
	NGRENDERBUFFER*			m_PNT1;
	NGFRAMEBUFFER*			m_FB1;

	// Vertex buffer for PNT1B4 FVF
	NGRENDERBUFFER*			m_PNT1B4;
	NGFRAMEBUFFER*			m_FB2;

	// Vertex buffer for Panel FVF
	NGRENDERBUFFER*			m_2DVERTEX;

	DWORD	CreateBuffer(NG3D*);

public:

	vector<string>			m_mdlName;
	
	NGSCENE()
	{
		m_typeIB = INDEX16;
	};
	~NGSCENE()
	{};

	DWORD	AddModelFile(char*);
	DWORD	AddObject(DWORD);
	DWORD	AddMapper(DWORD, char*);
	DWORD	AddCollide(NGCOLLIDE*);

	DWORD	Create(NG3D*);
	DWORD	Render(FLOAT fTime = 0.0f);

	NGMODEL*	GetModel(DWORD i=0); 
	NGFRAME*	GetMapper(DWORD);
	NGCOLLIDE*	GetCollide(DWORD);
};
*/

class NGScene
{
private:
	NGMD2File		m_md2File;
	NGTX2File		m_tx2File;

	NGRenderBuffer*	m_renderBuffer;
	NGRes2d*		m_res2d;
	NGRes3d*		m_res3d;
	NGPanel*		m_desktop;
	NGLight*		m_light;
	NGCamera*		m_camera;

public:
	NGScene();
	~NGScene();

	INT	LoadMDL(string);
	INT	LoadMDL(string, string);
	INT	LoadTEX(string);

	INT	Add(NGPANELCREATE* ,NGPanel*&);
	INT	Add(NGPANELCREATE* ,NGTextureBox*&);
	INT	Add(NGPANELCREATE* ,NGText*&);

//	INT	Create(NGWindow*&, NGPANELCREATE*, DWORD, DWORD, DWORD, DWORD);

	INT	Clone(string, NGClone*&);
	INT	Clone(DWORD, NGClone*&);

	BOOL Initial();
	BOOL Activate();
	BOOL Detect();
	BOOL Render(FLOAT time = 0.0f);
	
	NGLight*	GetLight()	{ return m_light;};
	NGCamera*	GetCamera()	{ return m_camera;};
};

DWORD Swap(NGScene* src, NGScene* dest);
DWORD SwapDestroy(NGScene* src,NGScene* dest);
#endif //__NGSCENE_H