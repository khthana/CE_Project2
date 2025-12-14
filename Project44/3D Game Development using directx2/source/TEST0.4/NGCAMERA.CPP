#include "ngcamera.h"

NGCamera::NGCamera()
{
	m_vLocate	= D3DXVECTOR3(0.00,0.00,1.00);
	m_vTarget	= D3DXVECTOR3(0.00,0.00,0.00);
	m_lens.fFOV		= D3DX_PI/4;
	m_lens.fRatio	= 1.5f;
	m_lens.fFront	= 0.1f;
	m_lens.fRear	= 2000.0f;
	m_p3d		= NULL;
	m_pDevice	= NULL;
}

NGCamera::NGCamera(D3DXVECTOR3 vCoord,D3DXVECTOR3 vTarget)
{
	m_vLocate	= vCoord;
	m_vTarget	= vTarget;
	m_lens.fFOV		= D3DX_PI/4;
	m_lens.fRatio	= 1.5f;
	m_lens.fFront	= 0.1f;
	m_lens.fRear	= 2000.0f;
	m_p3d		= NULL;
	m_pDevice	= NULL;
}

NGCamera::NGCamera(D3DXVECTOR3 vec)
{
	m_vLocate	= vec;
	m_vTarget	= D3DXVECTOR3(0.00,0.00,0.00);
	m_lens.fFOV		= D3DX_PI/4;
	m_lens.fRatio	= 1.5f;
	m_lens.fFront	= 0.1f;
	m_lens.fRear	= 2000.0f;
	m_p3d		= NULL;
	m_pDevice	= NULL;
}

BOOL NGCamera::SetFrom(D3DXVECTOR3 from)
{
	m_vLocate	= from;
	return TRUE;
}

BOOL NGCamera::SetTo(D3DXVECTOR3 to)
{
	m_vTarget	= to;
	return TRUE;
}

BOOL NGCamera::Update()
{
	D3DXVECTOR3	v = m_vLocate - m_vTarget;
	if (m_Focus.Length()>0)
	{
		D3DXVECTOR3	v1 = D3DXVECTOR3(0.0f,0.0f,0.0f);
		for (int i=0; i<m_Focus.Length(); i++)
		{
			if (!m_Focus[i]->Ready())
				m_Focus[i]->Update();
			D3DXMATRIX* mat	= m_Focus[i]->GetMatrix();
			v1.x += mat->m[3][0];
			v1.y += mat->m[3][1];
			v1.z += mat->m[3][2];
		}
		m_vTarget = v1;
	}

	if (m_Position.Length()>0)
	{
		D3DXVECTOR3	v1 = D3DXVECTOR3(0.0f,0.0f,0.0f);
		for (int i=0; i<m_Focus.Length(); i++)
		{
			if (!m_Focus[i]->Ready())
				m_Focus[i]->Update();
			D3DXMATRIX* mat	= m_Focus[i]->GetMatrix();
			v1.x+=mat->m[3][0];
			v1.y+=mat->m[3][1];
			v1.z+=mat->m[3][2];
		}
		m_vLocate = v1;
	}
	else
		m_vLocate = v+m_vTarget;

	Active();

	update = true;
	return true;
}

BOOL NGCamera::CreateCamera(NG3D* p3d)
{
	if (p3d==NULL)
		throw NGException();

	if (p3d->GetDevice()==NULL)
		throw NGException();

	m_p3d = p3d;
	m_pDevice = p3d->GetDevice();

	return true;
}

BOOL NGCamera::Active()
{
	D3DXMatrixLookAtLH(&m_MatView,&m_vLocate,&m_vTarget,&D3DXVECTOR3(0.0f,1.0f,0.0f));
	D3DXMatrixPerspectiveFovLH(&m_MatProj,m_lens.fFOV,m_lens.fRatio,m_lens.fFront,m_lens.fRear);

	D3DXMatrixTranslation(&matrix,m_vLocate.x,m_vLocate.y,m_vLocate.z);

	if (m_pDevice==NULL)
		throw NGException();
	HRESULT hr;
	hr = m_pDevice->SetTransform(D3DTS_VIEW,&m_MatView);
	hr |= m_pDevice->SetTransform(D3DTS_PROJECTION,&m_MatProj);

	if (FAILED(hr))
		throw NGException();
	return true;
}