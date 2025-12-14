#ifndef _NGCAMERA_H
#define _NGCAMERA_H

#include "ngtypes.h"
#include "ngmisc.h"
#include "ngmodel.h"
#include <vector>
#include <string>
#include <queue>

using namespace std;

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

#endif