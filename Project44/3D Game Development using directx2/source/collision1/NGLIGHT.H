#ifndef _NGLIGHT_H
#define _NGLIGHT_H

#include <d3d8.h>

typedef D3DLIGHT8*	LPD3DLIGHT8;

struct NGLIGHT : public _D3DLIGHT8
{
	NGLIGHT()
	{
		// Do nothing;
	}

	static NGLIGHT Directional 
	(
		const D3DVECTOR&		vDir,
		const D3DCOLORVALUE&	cDiffuse,
		const D3DCOLORVALUE&	cSpecular,
		const D3DCOLORVALUE&	cAmbient
	)
	{
		NGLIGHT out;
		memset((void*)&out,0,sizeof(_D3DLIGHT8));
		out.Type		= D3DLIGHT_DIRECTIONAL;
		out.Direction	= *(D3DVECTOR*)&vDir;
		out.Diffuse		= *(D3DCOLORVALUE*)&cDiffuse;
		out.Specular	= *(D3DCOLORVALUE*)&cSpecular;
		out.Ambient		= *(D3DCOLORVALUE*)&cAmbient;
		return out;
	}

	static NGLIGHT Point
	(
		const D3DVECTOR&		vPos,
		const D3DCOLORVALUE&	cDiffuse,
		const D3DCOLORVALUE&	cSpecular,
		const D3DCOLORVALUE&	cAmbient
	)
	{
		NGLIGHT out;
		memset((void*)&out,0,sizeof(_D3DLIGHT8));
		out.Type		= D3DLIGHT_POINT;
		out.Range		= 1000.0f;
		out.Position	= *(D3DVECTOR*)&vPos;
		out.Diffuse		= *(D3DCOLORVALUE*)&cDiffuse;
		out.Specular	= *(D3DCOLORVALUE*)&cSpecular;
		out.Ambient		= *(D3DCOLORVALUE*)&cAmbient;
		out.Attenuation0	= 0.0f;
		out.Attenuation1	= 1.0f;
		out.Attenuation2	= 0.0f;
		return out;
	}

	static NGLIGHT Spot
	(
		const D3DVECTOR&		vDir,
		const D3DVECTOR&		vPos,
		float theta,
		float phi,
		const D3DCOLORVALUE&	cDiffuse,
		const D3DCOLORVALUE&	cSpecular,
		const D3DCOLORVALUE&	cAmbient
	)
	{
		NGLIGHT out;
		memset((void*)&out,0,sizeof(_D3DLIGHT8));
		out.Type		= D3DLIGHT_SPOT;
		out.Range		= 1000.0f;
		out.Direction	= *(D3DVECTOR*)&vDir;
		out.Position	= *(D3DVECTOR*)&vPos;
		out.Diffuse		= *(D3DCOLORVALUE*)&cDiffuse;
		out.Specular	= *(D3DCOLORVALUE*)&cSpecular;
		out.Ambient		= *(D3DCOLORVALUE*)&cAmbient;
		out.Attenuation0	= 0.0f;
		out.Attenuation1	= 1.0f;
		out.Attenuation2	= 0.0f;
		out.Theta			= theta;
		out.Phi				= phi;
		return out;
	}

	operator LPD3DLIGHT8()
	{
		return this;
	}

	operator const LPD3DLIGHT8() const
	{
		return (const LPD3DLIGHT8) this;
	}
};

/*
typedef struct _NGLIGHTDESC
{
	BOOL	bActive;
} NGLIGHTDESC;

class NGLIGHT
{
private:
	vector<D3DLIGHT8*>		m_Light;
	vector<NGLIGHTDESC*>	m_bActive;
	vector<DWORD>			m_Slot;

public:
	NGLIGHT() 
	{};
	~NGLIGHT()
	{};

	DWORD	CreateLight();
	DWORD	On(DWORD);
	DWORD	Off(DWORD);
}
*/
#endif