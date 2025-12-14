#pragma warning(disable:4786)
#ifndef __NGANIME_H
#define __NGANIME_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngframe.h"

#include <vector>
#include <string>
#include <queue>

;using namespace std;

struct ANIMEKEY3
{
	DWORD  time;
	D3DXVECTOR3 key;
	

	ANIMEKEY3(FLOAT ax, FLOAT ay, FLOAT az, DWORD atime)
	{
		key.x = ax;
		key.y = ay;
		key.z = az;
		time = atime;
	}

	ANIMEKEY3()
	{
		key.x = 0.0f;
		key.y = 0.0f;
		key.z = 0.0f;
		time = 0;
	}
};

struct ANIMEKEY4
{
	DWORD time;
	D3DXQUATERNION key;
	

	ANIMEKEY4(FLOAT ax, FLOAT ay, FLOAT az, FLOAT aw, DWORD atime)
	{
		key.x = ax;
		key.y = ay;
		key.z = az;
		key.w = aw;
		time = atime;
	}

	ANIMEKEY4()
	{
		key.x = 0.0f;
		key.y = 0.0f;
		key.z = 0.0f;
		key.w = 0.0f;
		time = 0;
	}
};

struct ANIMESET
{
	string	name;
	INT		frameID;

	DWORD	keyTime;

	// translation
	ArrayList<ANIMEKEY3> tranKeys;

	// rotation
	ArrayList<ANIMEKEY4> rotKeys;

	// scale
	ArrayList<ANIMEKEY3> scaleKeys;

	ANIMESET()
	{
		frameID = -1;
		keyTime = 0;
	}

	DWORD	FindKeyTime();
	DWORD	GetKeyTime()	{ return keyTime;};
};


struct NGANIME
{
	string					m_strName;
	ArrayList<ANIMESET*>	m_Sets;

	FLOAT					m_factor;
	FLOAT					m_multer;

	DWORD					m_keyTime;

	D3DXMATRIX	PlaySet(DWORD ID, FLOAT Time);

	VOID	Initialize();

	NGANIME()
	{
		m_multer	= 1000.0f;
		m_factor	= 1/m_multer;
	}
};

#endif