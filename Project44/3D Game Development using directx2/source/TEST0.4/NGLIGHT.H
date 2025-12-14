#ifndef _NGLIGHT_H
#define _NGLIGHT_H

#include <d3d8.h>
#include "ngtypes.h"
#include "ngmisc.h"
#include "ng3d.h"
/*
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

*/

typedef struct _NGLIGHT
{
	D3DLIGHT8	light;
	BOOL		bFocus;
	BOOL		bPos;

	ArrayList<D3DXMATRIX*> focus;
	ArrayList<D3DXMATRIX*> pos;

	NGLIGHT();

	VOID DirectLight
	(
		D3DVECTOR&		vDir,
		DWORD	cDiffuse,
		DWORD	cSpecular,
		DWORD	cAmbient
	);

	VOID Directional 
	(
		D3DVECTOR&		vDir,
		D3DCOLORVALUE&	cDiffuse,
		D3DCOLORVALUE&	cSpecular,
		D3DCOLORVALUE&	cAmbient
	);

	VOID Point
	(
		D3DVECTOR&		vPos,
		D3DCOLORVALUE&	cDiffuse,
		D3DCOLORVALUE&	cSpecular,
		D3DCOLORVALUE&	cAmbient
	);

	VOID	Spot
	(	D3DVECTOR&		vDir,
		D3DVECTOR&		vPos,
		float			theta,
		float			phi,
		D3DCOLORVALUE&	cDiffuse,
		D3DCOLORVALUE&	cSpecular,
		D3DCOLORVALUE&	cAmbient
	);

	VOID	MoveX(FLOAT);
	VOID	MoveY(FLOAT);
	VOID	MoveZ(FLOAT);
	VOID	MoveFR(FLOAT);
	VOID	MoveRL(FLOAT);
	VOID	MoveUD(FLOAT);
} NGLIGHT;

typedef enum LIGHTMASK
{
	LIGHT0	= 0x0000000F,
	LIGHT1	= 0x000000F0,
	LIGHT2  = 0x00000F00,
	LIGHT3	= 0x0000F000,
	LIGHT4	= 0x000F0000,
	LIGHT5	= 0x00F00000,
	LIGHT6	= 0x0F000000,
	LIGHT7	= 0xF0000000,
	ALL		= 0xFFFFFFFF,
	NONE	= 0x00000000
};

struct NGLIGHTMASK
{
	LIGHTMASK	Light0;
	LIGHTMASK	Light1;
	LIGHTMASK	Light2;
	LIGHTMASK	Light3;
	LIGHTMASK	Light4;
	LIGHTMASK	Light5;
	LIGHTMASK	Light6;
	LIGHTMASK	Light7;
	LIGHTMASK	All;
	LIGHTMASK	None;

	NGLIGHTMASK()
	{
		Light0	= LIGHT0;
		Light1	= LIGHT1;
		Light2	= LIGHT2;
		Light3	= LIGHT3;
		Light4	= LIGHT4;
		Light5	= LIGHT5;
		Light6	= LIGHT6;
		Light7	= LIGHT7;
		All		= ALL;
		None	= NONE;
	}
};

const NGLIGHTMASK LightMask;

class NGLight : public NGObject
{
private:
	union
	{
		struct
		{
			NGLIGHT*	light0;
			NGLIGHT*	light1;
			NGLIGHT*	light2;
			NGLIGHT*	light3;
			NGLIGHT*	light4;
			NGLIGHT*	light5;
			NGLIGHT*	light6;
			NGLIGHT*	light7;
		};
		NGLIGHT*	light[8];
	};

	NG3D*				m_p3d;
	LPDIRECT3DDEVICE8	m_pDevice;
	LIGHTMASK			m_lightMask;

	BOOL				m_bReady;

public:
	NGLight();
	BOOL		Set(LIGHTMASK, NGLIGHT&, BOOL enable=true);
	BOOL		Initial(NG3D*);
	BOOL		Enable(LIGHTMASK);
	BOOL		Disable(LIGHTMASK);
	BOOL		Update();
	NGLIGHT*	GetLight(LIGHTMASK);
};
#endif