#include "stdafx.h"
#include "nglight.h"

NGLIGHT::NGLIGHT()
{
	ZeroMemory(&light, sizeof(D3DLIGHT8));
	bFocus	= false;
	bPos	= false;
}

VOID	NGLIGHT::DirectLight
(
	D3DVECTOR&		vDir,
	DWORD	cDiffuse,
	DWORD	cSpecular,
	DWORD	cAmbient
)
{
/*	memset((void*)this,0,sizeof(_D3DLIGHT8));
	light.Type		= D3DLIGHT_DIRECTIONAL;
	light.Direction	= *(D3DVECTOR*)&vDir;
	light.Diffuse	= *(D3DCOLORVALUE*)&cDiffuse;
	light.Specular	= *(D3DCOLORVALUE*)&cSpecular;
	light.Ambient	= *(D3DCOLORVALUE*)&cAmbient;**/
	D3DXCOLOR	d	= D3DXCOLOR(cDiffuse);
	D3DXCOLOR	s	= D3DXCOLOR(cSpecular);
	D3DXCOLOR	a	= D3DXCOLOR(cAmbient);
	Directional(vDir, d, s, a);
}

VOID	NGLIGHT::Directional 
(
	D3DVECTOR&		vDir,
	D3DCOLORVALUE&	cDiffuse,
	D3DCOLORVALUE&	cSpecular,
	D3DCOLORVALUE&	cAmbient
)
{
	memset((void*)this,0,sizeof(_D3DLIGHT8));
	light.Type		= D3DLIGHT_DIRECTIONAL;
	light.Direction	= *(D3DVECTOR*)&vDir;
	light.Diffuse	= *(D3DCOLORVALUE*)&cDiffuse;
	light.Specular	= *(D3DCOLORVALUE*)&cSpecular;
	light.Ambient	= *(D3DCOLORVALUE*)&cAmbient;
}

VOID	NGLIGHT::Point
(
	D3DVECTOR&		vPos,
	D3DCOLORVALUE&	cDiffuse,
	D3DCOLORVALUE&	cSpecular,
	D3DCOLORVALUE&	cAmbient
)
{
	memset((void*)this,0,sizeof(_D3DLIGHT8));
	light.Type		= D3DLIGHT_POINT;
	light.Range		= 1000.0f;
	light.Position	= *(D3DVECTOR*)&vPos;
	light.Diffuse	= *(D3DCOLORVALUE*)&cDiffuse;
	light.Specular	= *(D3DCOLORVALUE*)&cSpecular;
	light.Ambient		= *(D3DCOLORVALUE*)&cAmbient;
	light.Attenuation0	= 0.0f;
	light.Attenuation1	= 1.0f;
	light.Attenuation2	= 0.0f;
}

VOID	NGLIGHT::Spot
(	D3DVECTOR&		vDir,
	D3DVECTOR&		vPos,
	float			theta,
	float			phi,
	D3DCOLORVALUE&	cDiffuse,
	D3DCOLORVALUE&	cSpecular,
	D3DCOLORVALUE&	cAmbient
)
{
	memset((void*)this,0,sizeof(_D3DLIGHT8));
	light.Type			= D3DLIGHT_SPOT;
	light.Range			= 1000.0f;
	light.Direction		= *(D3DVECTOR*)&vDir;
	light.Position		= *(D3DVECTOR*)&vPos;
	light.Diffuse		= *(D3DCOLORVALUE*)&cDiffuse;
	light.Specular		= *(D3DCOLORVALUE*)&cSpecular;
	light.Ambient		= *(D3DCOLORVALUE*)&cAmbient;
	light.Attenuation0	= 0.0f;
	light.Attenuation1	= 1.0f;
	light.Attenuation2	= 0.0f;
	light.Theta			= theta;
	light.Phi			= phi;
}

NGLight::NGLight()
{
	for (int i=0; i<8; i++)
		light[i] = new NGLIGHT();
}

BOOL NGLight::Initial(NG3D* p3d)
{
	if (p3d==NULL)
	{
		throw NGException();
		return false;
	}

	if (p3d->GetDevice()==NULL)
	{
		throw NGException();
		return false;
	}

	m_p3d = p3d;
	m_pDevice = p3d->GetDevice();
	m_bReady = true;
	return true;
}

BOOL NGLight::Set(LIGHTMASK lm, NGLIGHT& l, BOOL en)
{
	DWORD	mask;
	if (lm==LightMask.All)
	{
		for (int i=0; i<8; i++)
			*light[i] = l;	
	}

	if (lm==LightMask.None)
		return true;

	mask	= lm&LightMask.Light0;
	if (mask==LightMask.Light0)
		*light0 = l;
	
	mask	= lm&LightMask.Light1;
	if (mask==LightMask.Light1)
		*light1 = l;

	mask	= lm&LightMask.Light2;
	if (mask==LightMask.Light2)
		*light2 = l;

	mask	= lm&LightMask.Light3;
	if (mask==LightMask.Light3)
		*light3 = l;

	mask	= lm&LightMask.Light4;
	if (mask==LightMask.Light4)
		*light4 = l;

	mask	= lm&LightMask.Light5;
	if (mask==LightMask.Light5)
		*light5 = l;

	mask	= lm&LightMask.Light6;
	if (mask==LightMask.Light6)
		*light6 = l;

	mask	= lm&LightMask.Light7;
	if (mask==LightMask.Light7)
		*light7 = l;

	if (en==m_bReady)
		Enable(lm);
	return true;
}

BOOL NGLight::Enable(LIGHTMASK lm)
{
	if (!m_bReady)
		return false;

	if (lm==LightMask.None)
		return true;

	DWORD	mask;
	
	mask	= lm&LightMask.Light0;
	if (mask==LightMask.Light0)
	{
		m_pDevice->LightEnable(0, true);
		m_pDevice->SetLight(0, &light0->light);
	}

	mask	= lm&LightMask.Light1;
	if (mask==LightMask.Light1)
	{
		m_pDevice->LightEnable(1, true);
		m_pDevice->SetLight(1, &light1->light);
	}

	mask	= lm&LightMask.Light2;
	if (mask==LightMask.Light2)
	{
		m_pDevice->LightEnable(2, true);
		m_pDevice->SetLight(2, &light2->light);
	}
	
	mask	= lm&LightMask.Light3;
	if (mask==LightMask.Light3)
	{
		m_pDevice->LightEnable(3, true);
		m_pDevice->SetLight(3, &light3->light);
	}

	mask	= lm&LightMask.Light4;
	if (mask==LightMask.Light4)
	{
		m_pDevice->LightEnable(4, true);
		m_pDevice->SetLight(4, &light4->light);
	}

	mask	= lm&LightMask.Light5;
	if (mask==LightMask.Light5)
	{
		m_pDevice->LightEnable(5, true);
		m_pDevice->SetLight(5, &light5->light);
	}

	mask	= lm&LightMask.Light6;
	if (mask==LightMask.Light6)
	{
		m_pDevice->LightEnable(6, true);
		m_pDevice->SetLight(6, &light6->light);
	}

	mask	= lm&LightMask.Light7;
	if (mask==LightMask.Light7)
	{
		m_pDevice->LightEnable(7, true);
		m_pDevice->SetLight(7, &light7->light);
	}	
	return true;
}

BOOL NGLight::Disable(LIGHTMASK lm)
{
	if (!m_bReady)
		return false;

	if (lm==LightMask.None)
		return true;
	
	DWORD	mask;

	mask	= lm&LightMask.Light0;
	if (mask==LightMask.Light0)
		m_pDevice->LightEnable(0, false);

	mask	= lm&LightMask.Light1;
	if (mask==LightMask.Light1)
		m_pDevice->LightEnable(1, false);

	mask	= lm&LightMask.Light2;
	if (mask==LightMask.Light2)
		m_pDevice->LightEnable(2, false);
	
	mask	= lm&LightMask.Light3;
	if (mask==LightMask.Light3)
		m_pDevice->LightEnable(3, false);

	mask	= lm&LightMask.Light4;
	if (mask==LightMask.Light4)
		m_pDevice->LightEnable(4, false);

	mask	= lm&LightMask.Light5;
	if (mask==LightMask.Light5)
		m_pDevice->LightEnable(5, false);

	mask	= lm&LightMask.Light6;
	if (mask==LightMask.Light6)
		m_pDevice->LightEnable(6, false);
	
	mask	= lm&LightMask.Light7;
	if (mask==LightMask.Light7)
		m_pDevice->LightEnable(7, false);
	
	return true;
}

NGLIGHT* NGLight::GetLight(LIGHTMASK lm)
{
	switch (lm)
	{
	case LIGHT0:
		return light0;
	case LIGHT1:
		return light1;
	case LIGHT2:
		return light2;
	case LIGHT3:
		return light3;
	case LIGHT4:
		return light4;
	case LIGHT5:
		return light5;
	case LIGHT6:
		return light6;
	case LIGHT7:
		return light7;
	default:
		return NULL;
	}
}

BOOL NGLight::Update()
{
	update = true;
	return true;
}