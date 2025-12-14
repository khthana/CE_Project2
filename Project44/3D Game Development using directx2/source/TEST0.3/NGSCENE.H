#ifndef __NGSCENE_H
#define __NGSCENE_H

#include "ngrender.h"
#include "ngmodel.h"
#include "nglight.h"
#include "ngcamera.h"
#include "ngtexture.h"
#include "ngpanel.h"
#include "ngfile.h"
#include "ngmdlfile.h"
#include "ngmtrl.h"

#include <vector>
#include <string>
#include <queue>

using namespace std;

//typedef vector<NGFRAME*>	NGFRAMEBUFFER;

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

	DWORD	Create(NG3D*);
	DWORD	Render(FLOAT fTime = 0.0f);

	NGMODEL*	GetModel(DWORD i=0); 
	NGFRAME*	GetMapper(DWORD);
};

#endif //__NGSCENE_H