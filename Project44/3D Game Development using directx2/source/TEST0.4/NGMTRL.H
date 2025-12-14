#pragma warning(disable:4786)
#ifndef __NGMTRL_H
#define __NGMTRL_H

#include <d3d8.h>
#include <vector>
#include <queue>
#include <string>

#include "ngtypes.h"

;using namespace std;

struct NGCOLOR4
{
	FLOAT r;
	FLOAT g;
	FLOAT b;
	FLOAT a;
};

struct NGCOLOR3
{
	FLOAT r;
	FLOAT g;
	FLOAT b;
};

typedef struct _NGFILEMTRL
{
	NGCOLOR4	d;
	FLOAT		p;
	NGCOLOR3	s;
	NGCOLOR3	e;

	D3DMATERIAL8 ToMtrl()
	{
		D3DMATERIAL8 mat;
		mat.Diffuse.a = d.a; mat.Diffuse.b = d.b; mat.Diffuse.g = d.g;
		mat.Diffuse.r = d.r; 
		mat.Ambient.a = d.a; mat.Ambient.b = d.b; mat.Ambient.g = d.g; 
		mat.Ambient.r = d.r; 
		mat.Power = p;
		mat.Specular.a = 0.0f; mat.Specular.b = s.b; mat.Specular.g = s.g;
		mat.Specular.r = s.r;
		mat.Emissive.a = 0.0f; mat.Emissive.b = e.b; mat.Emissive.g = e.g;
		mat.Emissive.r = e.r;
		return mat;
	}
} NGFILEMTRL;

typedef struct _NGMATERIAL
{
	D3DMATERIAL8	mtrlD3D;
	INT				key;

	_NGMATERIAL()
	{
		key = 0;
	}
} NGMATERIAL;

typedef struct _NGMTRLSET
{
	string				name;
	ArrayList<NGMATERIAL>	mtrlKey;
	string					tex0;
	string					tex1;
	INT						texID0;
	INT						texID1;
	INT						image0;
	INT						image1;

	_NGMTRLSET()
	{
		texID0 = -1;
		texID1 = -1;
		image0 = -1;
		image1 = -1;
	}
} NGMTRLSET;

struct NGMTRLS
{
	string				strName;
	
	NGMATERIAL			mtrlDef;
	string				tex0;
	string				tex1;
	INT					texID0;
	INT					texID1;
	INT					image0;
	INT					image1;
	
	ArrayList<NGMTRLSET>	mtrlSet;

	NGMTRLS()
	{
		strName = "Default";
		ZeroMemory(&mtrlDef, sizeof(D3DMATERIAL8));
		texID0 = -1;
		texID1 = -1;
		image0 = -1;
		image1 = -1;
	}
};

#endif