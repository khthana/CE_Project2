#include "stdafx.h"
#include "ngcamera.h"

NGCAMERA::NGCAMERA()
{
	m_vCamera	= D3DXVECTOR3(0.00,0.00,1.00);
	m_vTarget	= D3DXVECTOR3(0.00,0.00,0.00);
	m_pMatModel	= NULL;
	m_pDevice	= NULL;
}

NGCAMERA::~NGCAMERA()
{
}

NGCAMERA::NGCAMERA(D3DXVECTOR3 vCoord,D3DXVECTOR3 vTarget)
{
	m_vCamera	= vCoord;
	m_vTarget	= vTarget;
	m_fFOV		= D3DX_PI/4;
	m_fRatio	= 1.5f;
	m_fFront	= 0.1f;
	m_fRear		= 2000.0f;
	m_pMatModel	= NULL;
	m_pDevice	= NULL;
}

HRESULT NGCAMERA::Initialize(LPDIRECT3DDEVICE8 lpDevice)
{
	if (lpDevice==NULL)
		return E_FAIL;
	m_pDevice = lpDevice;
	NGCAMERA::Active();
	return S_OK;
}

HRESULT NGCAMERA::Focus(NGMODEL* model)
{
	if (model==NULL)
		return E_FAIL;

	m_pMatModel	= &model->m_matModel;

	return S_OK;
}

HRESULT NGCAMERA::Focus(D3DXMATRIX* mat)
{
	if (mat==NULL)
		return E_FAIL;

	m_pMatModel	= mat;

	return S_OK;
}

HRESULT NGCAMERA::Update()
{
	if (m_pMatModel==NULL)
	{
		Active();
		return TRUE;
	}

	D3DXVECTOR3	vTemp	= m_vCamera - m_vTarget;
	D3DXVECTOR3	vModel	= D3DXVECTOR3(	m_pMatModel->m[3][0], 
										m_pMatModel->m[3][1],
										m_pMatModel->m[3][2]);

	m_vTarget	= vModel;
	m_vCamera	= m_vTarget + vTemp;

	Active();

	return TRUE;
}	

HRESULT NGCAMERA::Active()
{
	D3DXMatrixLookAtLH(&m_MatView,&m_vCamera,&m_vTarget,&D3DXVECTOR3(0.0f,1.0f,0.0f));
	D3DXMatrixPerspectiveFovLH(&m_MatProj,m_fFOV,m_fRatio,m_fFront,m_fRear);
	if (m_pDevice==NULL)
		return CheckError(E_FAIL,"Device NULL");
	m_pDevice->SetTransform(D3DTS_VIEW,&m_MatView);
	m_pDevice->SetTransform(D3DTS_PROJECTION,&m_MatProj);
	return S_OK;
}

HRESULT NGCAMERA::Move(D3DXVECTOR3 vCamera,D3DXVECTOR3 vTarget)
{
	m_vCamera	+= vCamera;
	m_vTarget	+= vTarget;
	NGCAMERA::Active();
	return S_OK;
}

HRESULT NGCAMERA::MoveTo(D3DXVECTOR3 vCamera,D3DXVECTOR3 vTarget)
{
	m_vCamera	= vCamera;
	m_vTarget	= vTarget;
	NGCAMERA::Active();
	return S_OK;
}

HRESULT NGCAMERA::Rotate(D3DXQUATERNION qCamera)
{

	return S_OK;
}

HRESULT NGCAMERA::RotateTo(D3DXQUATERNION qCamera)
{

	return S_OK;
}

HRESULT NGCAMERA::Pan(D3DXVECTOR3 vCamera)
{
	m_vCamera	+= vCamera;
	m_vTarget	+= vCamera;
	NGCAMERA::Active();
	return S_OK;
}

HRESULT NGCAMERA::Orbit(FLOAT fHoriz,FLOAT fVert)
{
/*	D3DXMATRIX mat;
	D3DXMATRIX matHoriz,matVert;
	D3DXVECTOR3 axis;

	D3DXMatrixIdentity(&matHoriz);
	D3DXMatrixIdentity(&matVert);

	if (fHoriz!=0.0f)
	{
		axis = D3DXVECTOR3(0.0f,1.0f,0.0f);
		D3DXMatrixRotationAxis(&matHoriz,&axis,fHoriz);	
	}
	if (fVert!=0.0f)
	{
		axis = D3DXVECTOR3(1.0f,0.0f,0.0f);
		D3DXMatrixRotationAxis(&matVert,&axis,fVert);
	}
	D3DXMatrixMultiply(&mat,&matHoriz,&matVert);
	D3DXVec3TransformCoord(&m_vCamera,&m_vCamera,&mat);
*/
	D3DXMATRIX mat;
	D3DXVECTOR3 axis;
	
	axis = D3DXVECTOR3(0.0f,1.0f,0.0f);
	RotateAxis(mat,axis,fHoriz);
	D3DXVec3TransformCoord(&m_vCamera,&m_vCamera,&mat);

	axis = D3DXVECTOR3(1.0f,0.0f,0.0f);
	RotateAxis(mat,axis,fVert);
	D3DXVec3TransformCoord(&m_vCamera,&m_vCamera,&mat);

/*	D3DXVECTOR3	vec;
	FLOAT		phi,theta;
	FLOAT		cp,sp,ct,st;
	FLOAT		r,rx,ry;

	vec	= m_vTarget - m_vCamera;
	r	= D3DXVec3Length(&vec);
	//D3DXVec3Normalize(&vec,&vec);

	if (fVert!=0.0f)
	{
		phi	= atan(vec.z/vec.y) + fVert;
		ry	= sqrt((vec.y*vec.y)+(vec.z*vec.z));
		cp	= cos(phi);
		sp	= sin(phi);

		vec.y	= ry*cp;
		vec.z	= ry*sp;
		vec.x	= sqrt((r*r)-(ry*ry));
	}
	else 
	if (fHoriz!=0.0f)
	{
		theta = atan(vec.x/vec.z) + fHoriz;
		rx	= sqrt((vec.x*vec.x)+(vec.z*vec.z));
		ct	= cos(theta);
		st	= sin(theta);

		vec.x	= rx*st;
		vec.z	= rx*ct;
		vec.y	= sqrt((r*r)-(rx*rx));
	}*/
	
	//m_vCamera	= m_vTarget - vec;

	NGCAMERA::Active();
	return S_OK;
}

void NGCAMERA::RotateAxis(D3DXMATRIX& mat,const D3DXVECTOR3& vec,float fAngle)
{
	D3DXVECTOR3 v;
	D3DXVec3Normalize(&v,&vec);
	float s = (float)sin(fAngle);
	float c = (float)cos(fAngle);
	float x = v.x;
	float y = v.y;
	float z = v.z;

	mat._11 = x*x*(1-c)+c;
	mat._12 = x*y*(1-c)-(z*s);
	mat._13 = x*z*(1-c)+(y*s);
	mat._14 = 0;

	mat._21 = y*x*(1-c)+(z*s);
	mat._22 = y*y*(1-c)+c;
	mat._23 = y*z*(1-c)-(x*s);
	mat._24 = 0;

	mat._31 = z*x*(1-c)-(y*s);
	mat._32 = z*y*(1-c)+(x*s);
	mat._33 = z*z*(1-c)+c;
	mat._34 = 0;

	mat._41 = 0;
	mat._42 = 0;
	mat._43 = 0;
	mat._44 = 1;
}
