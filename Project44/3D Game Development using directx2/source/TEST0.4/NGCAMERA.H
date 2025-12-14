#ifndef _NGCAMERA_H
#define _NGCAMERA_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngmodel.h"
#include "ngframe.h"
#include <vector>
#include <string>
#include <queue>

using namespace std;

/*
class NGCAMERA
{
private:
	D3DXVECTOR3		m_vCamera;
	D3DXVECTOR3		m_vTarget;

	float			m_fFOV;
	float			m_fRatio;
	float			m_fFront;
	float			m_fRear;

	D3DXMATRIX		m_MatView;
	D3DXMATRIX		m_MatProj;

	D3DXMATRIX*		m_pMatModel;

	LPDIRECT3DDEVICE8 m_pDevice;
	HRESULT			Active();
	void			RotateAxis(D3DXMATRIX& mat,const D3DXVECTOR3&,float fAngle);

public:
	NGCAMERA();
	NGCAMERA(D3DXVECTOR3,D3DXVECTOR3);
	~NGCAMERA();

	HRESULT	Initialize(LPDIRECT3DDEVICE8);

	HRESULT	Update();
	HRESULT	Focus(NGMODEL*);
	HRESULT Focus(D3DXMATRIX*);

	HRESULT Move(D3DXVECTOR3 vCamera,D3DXVECTOR3 vTarget);
	HRESULT MoveTo(D3DXVECTOR3 vCamera,D3DXVECTOR3 vTarget);
	HRESULT Rotate(D3DXQUATERNION qCamera);
	HRESULT RotateTo(D3DXQUATERNION qCamera);

	HRESULT Pan(D3DXVECTOR3 vCamera);
	// Pitch - x axis, Yaw - y axis, Roll - z axis
	HRESULT Orbit(FLOAT fHoriz,FLOAT fVert = 0.0f);
};
*/

struct NGLENS
{
	float		fFOV;
	float		fRatio;
	float		fFront;
	float		fRear;
};

class NGCamera : public NGObject
{
private:
	D3DXVECTOR3		m_vLocate;
	D3DXVECTOR3		m_vTarget;

	NGLENS			m_lens;

	D3DXMATRIX		m_MatView;
	D3DXMATRIX		m_MatProj;

	ArrayList<NGObject*> m_Focus;
	ArrayList<NGObject*> m_Position;

	float				m_Pitch;
	float				m_Yaw;
	float				m_Roll;
	float				m_Radius;

	D3DXVECTOR3			m_axis;

	NG3D*				m_p3d;
	LPDIRECT3DDEVICE8	m_pDevice;

public:
	
	NGCamera();
	NGCamera(D3DXVECTOR3 from, D3DXVECTOR3 to);
	NGCamera(D3DXVECTOR3 length);

	BOOL	Update();

	BOOL	MoveX(float);
	BOOL	MoveY(float);
	BOOL	MoveZ(float);

	BOOL	Zoom(float);

	BOOL	SetFrom(D3DXVECTOR3 from);
	BOOL	SetTo(D3DXVECTOR3 to);
/*
	BOOL	RotateXAxis(D3DXVECTOR3);
	BOOL	RotateYAxis(D3DXVECTOR3);
	BOOL	RotateZAxis(D3DXVECTOR3);
	BOOL	RotateAxis(D3DXVECTOR3);
*/
	BOOL	OrbitHoz(FLOAT);
	BOOL	OrbitVert(FLOAT);

	BOOL	CreateCamera(NG3D*);
	BOOL	Active();

	D3DXVECTOR3*	GetPosition()	{ return &m_vLocate;};
	D3DXVECTOR3*	GetTarget()		{ return &m_vTarget;};
};


#endif