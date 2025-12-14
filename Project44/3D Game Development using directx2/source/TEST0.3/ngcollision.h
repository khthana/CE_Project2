#ifndef __NGCOLLISION_H
#define __NGCOLLISION_H

#include <d3dx8math.h>
#include <math.h>
#include <string>
#include <vector>

#include "ngrender.h"
#include "ngtypes.h"
#include "ngframe.h"

using namespace std;

typedef struct _NGBOUND
{
	FLOAT		x_max;
	FLOAT		x_min;
	FLOAT		y_max;
	FLOAT		y_min;
	FLOAT		z_max;
	FLOAT		z_min;

	_NGBOUND()
	{
		x_max = y_max = z_max = FLT_MIN;
		x_min = y_min = z_min = FLT_MAX;
	};
} NGBOUND;

class NGPLANE
{
private:
	D3DXPLANE	m_Plane;
	NGBOUND		m_BBox;
	D3DXPLANE	m_Bound[3];
	NGBOUND		m_Box[3];
	vector<D3DXVECTOR3>	m_Point;

	
	DWORD		FindBox(D3DXVECTOR3, D3DXVECTOR3, DWORD);
	DWORD		InBox(D3DXVECTOR3, DWORD);
	FLOAT		DET(D3DXPLANE, D3DXPLANE, D3DXPLANE);
	FLOAT		DETi(D3DXPLANE, D3DXPLANE, D3DXPLANE, DWORD);
	DWORD		Coplanar(D3DXPLANE, D3DXPLANE);
	DWORD		DetectBBox(NGBOUND*);

public:
	
	DWORD		Prepare(vector<D3DXVECTOR3>*, NGFACE*);
	DWORD		Detect(NGPLANE*);
	BOOL		GetDetect();
	NGBOUND*	GetBBox() {return &m_BBox;};
};

class NGCOLLIDE
{
private:
	//vector<NGPLANE>		m_Plane;
	NGFRAME*			m_Parent;

public:
	// Input
	vector<D3DXVECTOR3>	m_Position;
	vector<NGFACE>		m_Face;
	DWORD				m_FrameID;

	VOID		SetParent(NGFRAME* p)	{ m_Parent = p;};
	NGFRAME*	GetParent()				{ return m_Parent;};
};


#endif 