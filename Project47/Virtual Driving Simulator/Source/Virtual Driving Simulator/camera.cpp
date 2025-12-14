//////////////////////////////////////////////////////////////////////////////////////////////////
// 
// File: camera.cpp
// 
// Author: Frank Luna (C) All Rights Reserved
//
// System: AMD Athlon 1800+ XP, 512 DDR, Geforce 3, Windows XP, MSVC++ 7.0 
//
// Desc: Defines a camera's position and orientation.
//         
//////////////////////////////////////////////////////////////////////////////////////////////////

#include "camera.h"

CCamera::CCamera()
{
	m_vPos   = D3DXVECTOR3(0.0f, 5.0f, 0.0f);
	m_vRight = D3DXVECTOR3(1.0f, 0.0f, 0.0f);
	m_vUp    = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
	m_vLook  = D3DXVECTOR3(0.0f, 0.0f, 1.0f);
}

CCamera::~CCamera()
{

}

void CCamera::getPosition(D3DXVECTOR3* pos)
{
	*pos = m_vPos;
}

void CCamera::setPosition(D3DXVECTOR3* pos)
{
	m_vPos = *pos;
}

void CCamera::getRight(D3DXVECTOR3* right)
{
	*right = m_vRight;
}

void CCamera::getUp(D3DXVECTOR3* up)
{
	*up = m_vUp;
}

void CCamera::getLook(D3DXVECTOR3* look)
{
	*look = m_vLook;
}

void CCamera::walk(float units)
{
	m_vPos += D3DXVECTOR3(m_vLook.x, 0.0f, m_vLook.z) * units;
}

void CCamera::strafe(float units)
{
	m_vPos += D3DXVECTOR3(m_vRight.x, 0.0f, m_vRight.z) * units;
}

void CCamera::fly(float units)
{
	m_vPos.y += units;
}

void CCamera::pitch(float angle)
{
	D3DXMATRIX T;
	D3DXMatrixRotationAxis(&T, &m_vRight, angle);

	// rotate _up and _look around _right vector
	D3DXVec3TransformCoord(&m_vUp,&m_vUp, &T);
	D3DXVec3TransformCoord(&m_vLook,&m_vLook, &T);
}

void CCamera::yaw(float angle)
{
	D3DXMATRIX T;

	// rotate around world y (0, 1, 0) always for land object
	D3DXMatrixRotationY(&T, angle);
	
	// rotate _right and _look around _up or y-axis
	D3DXVec3TransformCoord(&m_vRight,&m_vRight, &T);
	D3DXVec3TransformCoord(&m_vLook,&m_vLook, &T);
}

void CCamera::roll(float angle)
{
	D3DXMATRIX T;
	D3DXMatrixRotationAxis(&T, &m_vLook, angle);

	// rotate _up and _right around _look vector
	D3DXVec3TransformCoord(&m_vRight,&m_vRight, &T);
	D3DXVec3TransformCoord(&m_vUp,&m_vUp, &T);
}

void CCamera::getViewMatrix(D3DXMATRIX* V)
{
	// Keep camera's axes orthogonal to eachother
	D3DXVec3Normalize(&m_vLook, &m_vLook);

	D3DXVec3Cross(&m_vUp, &m_vLook, &m_vRight);
	D3DXVec3Normalize(&m_vUp, &m_vUp);

	D3DXVec3Cross(&m_vRight, &m_vUp, &m_vLook);
	D3DXVec3Normalize(&m_vRight, &m_vRight);

	// Build the view matrix:
	float x = -D3DXVec3Dot(&m_vRight, &m_vPos);
	float y = -D3DXVec3Dot(&m_vUp, &m_vPos);
	float z = -D3DXVec3Dot(&m_vLook, &m_vPos);

	(*V)(0,0) = m_vRight.x; (*V)(0, 1) = m_vUp.x; (*V)(0, 2) = m_vLook.x; (*V)(0, 3) = 0.0f;
	(*V)(1,0) = m_vRight.y; (*V)(1, 1) = m_vUp.y; (*V)(1, 2) = m_vLook.y; (*V)(1, 3) = 0.0f;
	(*V)(2,0) = m_vRight.z; (*V)(2, 1) = m_vUp.z; (*V)(2, 2) = m_vLook.z; (*V)(2, 3) = 0.0f;
	(*V)(3,0) = x;        (*V)(3, 1) = y;     (*V)(3, 2) = z;       (*V)(3, 3) = 1.0f;
}

