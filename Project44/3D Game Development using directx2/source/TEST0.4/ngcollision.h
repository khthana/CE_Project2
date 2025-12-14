#ifndef __NGCOLLISION_H
#define __NGCOLLISION_H

#include <d3dx8math.h>
#include <math.h>
#include <string>
#include <vector>

#include "ngrender.h"
#include "ngtypes.h"
#include "ngframe.h"

;using namespace std;
/*
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

class NGCollide;

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

	friend		DWORD	Projection(NGCollide*, D3DXVECTOR3*, FLOAT&);

	D3DXPLANE*	GetPlane()	{return &m_Plane;};
	NGBOUND*	GetBox()	{return &m_Box;};
};

class NGCollide
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

	NGCollide()
	{
		m_Type	= NGCT_NONE;
	};

	DWORD		Create(DWORD);
	DWORD		Update();

	friend		DWORD	Detect(NGCollide*, NGCollide*);
	friend		DWORD	Detect(NGCollide*, NGCYLINDER*, D3DXVECTOR3&);
	friend		DWORD	Projection(NGCollide*, D3DXVECTOR3*, FLOAT&);

	VOID		SetParent(D3DXMATRIX* p)	{ m_Parent = p;};
	D3DXMATRIX*	GetParent()					{ return m_Parent;};
	NGCOLLIDETYPE	GetType()				{ return m_Type;};

};

DWORD	Detect(NGCollide*, NGCollide*);

// Detect wall with cylinder
DWORD	Detect(NGCollide*, NGCollide*, D3DXVECTOR3&);
// Detect cylinder with cylinder
DWORD	Detect(NGCYLINDER*, NGCYLINDER*, D3DXVECTOR3&, FLOAT&);

// Projection
DWORD	Projection(NGCollide*, D3DXVECTOR3*, FLOAT&);
DWORD	DetectBound(NGBOUND*, NGBOUND*);
DWORD	DetectBound(NGBOUND*, D3DXVECTOR3*);

*/
struct NGCOLLIDE
{	
	string		name;
	string		parent;
	INT			parentID;
	INT			type;
	FLOAT		radius;
	FLOAT		height;
	D3DXMATRIX*	matrix;
	ArrayList<D3DXVECTOR3>	pos;
	ArrayList<NGFACE>		index;

	NGCOLLIDE()
	{
		parentID = -1;
		type	 = 0;
	}
};

typedef enum COLLIDETYPE
{
	NGCT_UNKNOWN	= 0,
	NGCT_WALL		= 1,
	NGCT_GROUND		= 2,
	NGCT_CYLINDER	= 3,
	NGCT_SPHERE		= 4
};

struct NGCOLLIDETYPE
{
	COLLIDETYPE	unknown;
	COLLIDETYPE	wall;
	COLLIDETYPE	ground;
	COLLIDETYPE cylinder;
	COLLIDETYPE sphere;

	NGCOLLIDETYPE()
	{
		unknown	= NGCT_UNKNOWN;
		wall	= NGCT_WALL;
		ground	= NGCT_GROUND;
		cylinder= NGCT_CYLINDER;
		sphere	= NGCT_SPHERE;
	}
};

const NGCOLLIDETYPE CollideType;


struct LINE2D
{
	// ax + by + c = 0;
	float a, b, c;
};

struct LINE3D
{
	// x = a0 + at
	float	a0, a;
	
	// y = b0 + bt
	float	b0, b;

	// z = c0 + ct
	float	c0, c;
};

class NGSphere
{
private:
	string			m_name;
	LPVOID			m_param;
	D3DXMATRIX*		m_matrix;

	D3DXVECTOR3		m_locate;
	
	FLOAT			m_radius;
	FLOAT			m_r2;

public:
	NGSphere();
	~NGSphere();

	BOOL	Create(NGCOLLIDE*, D3DXMATRIX*, LPVOID param = NULL);
	void	Update();
};

struct GROUNDRESULT
{
	ArrayList<FLOAT>	height;
	LPVOID				param;
};

class NGGround;

class NGCylinder
{
private:
	string			m_name;
	LPVOID			m_param;
	D3DXMATRIX*		m_matrix;

	D3DXVECTOR3		m_locate;

	FLOAT			m_radius;
	FLOAT			m_height;
	FLOAT			m_r2;

	FLOAT			m_factor[7];
	FLOAT			m_real[7]; // r2 + factor

	friend GROUNDRESULT* DetectGC(NGCylinder*, NGGround*);

public:
	NGCylinder();
	~NGCylinder();

	BOOL	Create(NGCOLLIDE*, D3DXMATRIX*, LPVOID param = NULL);
	void	Update();
};

class NGGround
{
private:
	struct GROUNDFACE
	{
		D3DXVECTOR3	line[3];
		BOOL		lineGeq[3];
		D3DXPLANE	plane;

		void	Create(D3DXVECTOR3&, D3DXVECTOR3&, D3DXVECTOR3&);
	};

	LPVOID		m_param;
	GROUNDFACE*	m_detect;
	DWORD		m_size;

	FLOAT		m_radius;
	FLOAT		m_r2;

	D3DXMATRIX*	m_matrix;

	friend GROUNDRESULT* DetectGC(NGCylinder*, NGGround*);
	
public:

	NGGround();
	~NGGround();

	void	Update();
	BOOL	Create(NGCOLLIDE*, D3DXMATRIX*, LPVOID param = NULL);
};

struct WALLRESULT
{
	ArrayList<D3DXVECTOR3>	normal;
	LPVOID					param;
};

class NGWall
{
private:
	struct WALLFACE
	{
		NGCylinder	bound;
		LINE2D		line;
	};

	LPVOID		m_param;
	WALLFACE*	m_face;
	DWORD		m_size;
	NGCylinder	m_bound;

	D3DXMATRIX*	m_matrix;

public:
	NGWall();
	~NGWall();

	BOOL	Create(NGCOLLIDE*, D3DXMATRIX*, LPVOID param = NULL);
};

class NGDetector
{
private:
	ArrayList<NGSphere*>	m_Sphere;
	ArrayList<NGCylinder*>	m_Cylinder;
	ArrayList<NGGround*>	m_Ground;
	ArrayList<NGWall*>		m_Wall;

	LPVOID					m_clone;

	ArrayList<GROUNDRESULT*>	m_gRes;
	ArrayList<WALLRESULT*>		m_wRes;

	friend void DetectCollision(NGDetector*, NGDetector*);

public:
	NGDetector();
	~NGDetector();

	BOOL	Add(NGCOLLIDE*, D3DXMATRIX*, LPVOID param = NULL);

	ArrayList<GROUNDRESULT*>*	GetGround()	{ return &m_gRes;};
	ArrayList<WALLRESULT*>*		GetWall()	{ return &m_wRes;};
};

void DetectCollision(NGDetector*, NGDetector*);
GROUNDRESULT* DetectGC(NGCylinder*, NGGround*);

#endif 