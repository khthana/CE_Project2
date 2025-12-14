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

class NGSPHERE
{
private:
	D3DXVECTOR3	m_vCenter;
	FLOAT		r;
	FLOAT		r2;

public:

	DWORD		Create(D3DXVECTOR3*, FLOAT);
};

class NGLINE
{
private:
	D3DXVECTOR3	m_vStart;
	D3DXVECTOR3	m_vFactor;

public:
	NGLINE(){};
	NGLINE(D3DXVECTOR3, D3DXVECTOR3);

	DWORD			Create(D3DXVECTOR3*, D3DXVECTOR3*);
	
	D3DXVECTOR3*	GetStart()	{ return &m_vStart;};
	D3DXVECTOR3*	GetFactor()	{ return &m_vFactor;};
};

struct NGWALL
{
	D3DXPLANE	LineEq;		// line equation
	D3DXVECTOR2	Center;
	FLOAT		Radius;
	NGBOUND		Bound;

	DWORD		Create(D3DXVECTOR3&, D3DXVECTOR3&, D3DXVECTOR3&);
};
/*
struct NGGROUND
{
	D3DXPLANE	PlaneEq;

	D3DXPLANE	LineEq[3];
	BOOL		LineGe[3];

	NGBOUND		Bound;

	DWORD		Create(D3DXVECTOR3&, D3DXVECTOR3&, D3DXVECTOR3&);
};
*/
struct NGCYLINDER
{
	D3DXVECTOR3	RefPoint;
	FLOAT		Height;
	FLOAT		Radius;
	FLOAT		Radius2;

	NGCYLINDER() {};
	NGCYLINDER(D3DXVECTOR3&, FLOAT, FLOAT);
	DWORD		SetData(D3DXVECTOR3&, FLOAT, FLOAT);
};

enum NGCOLLIDETYPE
{
	NGCT_NONE	= 0,
	NGCT_PLANE	= 1,
	NGCT_LINE	= 2,
	NGCT_POINT	= 3,
	NGCT_WALL	= 4
};

class NGCOLLIDE;

class NGPLANE2
{
private:
	D3DXPLANE	m_Plane;
	NGBOUND		m_Box;
	D3DXVECTOR3	m_Center;

	D3DXPLANE	m_PlaneEq[3];
	BOOL		m_PlaneGe[3];

	D3DXVECTOR3 m_LineEq[3];
	BOOL		m_LineGe[3];

	VOID		CheckBound(D3DXVECTOR3*);

public:
	
	DWORD		Create(D3DXVECTOR3*, D3DXVECTOR3*, D3DXVECTOR3*);

	friend		DWORD	Projection(NGCOLLIDE*, D3DXVECTOR3*, FLOAT&);

	D3DXPLANE*	GetPlane()	{return &m_Plane;};
	NGBOUND*	GetBox()	{return &m_Box;};
};

class NGCOLLIDE
{
private:
	NGCOLLIDETYPE		m_Type;

	vector<NGPLANE2>	m_Plane;
	vector<NGLINE>		m_Line;
	vector<NGWALL>		m_Wall;
	NGBOUND				m_Box;
	D3DXMATRIX*			m_Parent;

	vector<D3DXVECTOR3>	m_Result;

	VOID		CheckBound(D3DXVECTOR3*);

public:
	// Input
	vector<D3DXVECTOR3>	m_Position;
	vector<NGFACE>		m_Face;
	DWORD				m_FrameID;

	NGCOLLIDE()
	{
		m_Type	= NGCT_NONE;
	};

	DWORD		Create(DWORD);
	DWORD		Update();

	friend		DWORD	Detect(NGCOLLIDE*, NGCOLLIDE*);
	friend		DWORD	Detect(NGCOLLIDE*, NGCYLINDER*, D3DXVECTOR3&);
	friend		DWORD	Projection(NGCOLLIDE*, D3DXVECTOR3*, FLOAT&);

	VOID		SetParent(D3DXMATRIX* p)	{ m_Parent = p;};
	D3DXMATRIX*	GetParent()					{ return m_Parent;};
	NGCOLLIDETYPE	GetType()				{ return m_Type;};

};

DWORD	Detect(NGCOLLIDE*, NGCOLLIDE*);

// Detect wall with cylinder
DWORD	Detect(NGCOLLIDE*, NGCYLINDER*, D3DXVECTOR3&);
// Detect cylinder with cylinder
DWORD	Detect(NGCYLINDER*, NGCYLINDER*, D3DXVECTOR3&, FLOAT&);

// Projection
DWORD	Projection(NGCOLLIDE*, D3DXVECTOR3*, FLOAT&);
DWORD	DetectBound(NGBOUND*, NGBOUND*);
DWORD	DetectBound(NGBOUND*, D3DXVECTOR3*);

#endif 