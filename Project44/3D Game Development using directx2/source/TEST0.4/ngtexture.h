#pragma warning(disable:4786)
#ifndef __NGTEXTURE_H
#define __NGTEXTURE_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include <ddraw.h>
#include "ngfile.h"

#include <vector>
#include <string>
#include <queue>
#include <deque>
#include <list>
#include <map>

using namespace std;

/*
DDS file format

	DWORD dwMagic (0x20534444, or "DDS ")
    DDSURFACEDESC2 ddsd (this provides information about the surface format)
    BYTE bData1[] (this is the surface data for the main surface)
    [BYTE bData2[]...] (surface data for attached surfaces, if any, follow)
*/
/*
class NGDDSFILE
{
private:
	NGFILE			m_File;
	DWORD			m_dwMagic;
	DDSURFACEDESC2	m_ddsd;
	vector<BYTE*>	m_ppData;
	
	WORD			GetBits(DWORD dwMask);

public:

	NGDDSFILE()
	{
		m_dwMagic	= 0x20534444;
	}
	
	LPDIRECT3DTEXTURE8	LoadFile(char* pathname);
};

class NGTEXTURE
{
private:
	vector<LPDIRECT3DTEXTURE8>	m_Texture;
	DWORD		m_dwCurrTex;
	DWORD		m_dwNumTex;
	
	FLOAT		m_fTime;
	FLOAT		m_fOld;
	FLOAT		m_fFactor;

public:
	NGTEXTURE() 
	{
		m_dwCurrTex	= 0;
		m_dwNumTex	= 0;
		m_fTime		= 0;
		m_fOld		= 0;
		m_fFactor	= 500;
	};

	~NGTEXTURE()	{};

	DWORD				AddTexture(LPDIRECT3DTEXTURE8);
	DWORD				SetTexture(DWORD);
	DWORD				Update(FLOAT);
	LPDIRECT3DTEXTURE8	GetTexture();
};

class NGTEXTURESET
{
private:
	BOOL						m_bReady;
	string						m_strName;
	vector<string>				m_strTexture;
	vector<LPDIRECT3DTEXTURE8>	m_pTexture;

public:
	DWORD	AddTexture(string*);
	DWORD	Create();
	DWORD	IsName(string*,DWORD&);
	VOID	SetName(string*);
	DWORD	GetTexture(LPDIRECT3DTEXTURE8&,DWORD);
};
*/

struct NGIMAGE
{
	string			name;
	DDSURFACEDESC2	surdesc;
	INT				size;		// in byte
	byte*			data;
};

struct NGDATA2D
{
	string				name;
	string				defImage;
	INT					defIndex;
	INT					frame;
	ArrayList<string>	image;
	ArrayList<INT>		index;
};

class NGRes2d
{
private:
	NG3D*							m_p3d;
	LPDIRECT3DDEVICE8				m_pDevice;
	ArrayList<NGIMAGE*>				m_Images;
	ArrayList<LPDIRECT3DTEXTURE8>	m_Textures;
	ArrayList<NGDATA2D*>			m_Data2d;

	map<string, INT> m_ImagesMap;
	map<string, INT> m_Data2dMap;

	BOOL	CreateTexture();

public:
	NGRes2d(){};

	BOOL	Add(ArrayList<NGIMAGE*>,NGDATA2D*);
	BOOL	Add(NGIMAGE*);
	NGDATA2D* GetData2d(DWORD i) { return m_Data2d[i];};
	INT		FindData2d(string);
	INT		FindImage(string);
	BOOL	CreateTexture(NG3D*);
	INT		CountTexture()	{ return m_Textures.Length();};
	BOOL	UpdateTexture(DWORD id);

	LPDIRECT3DTEXTURE8	GetTexture(DWORD id);
};

#endif