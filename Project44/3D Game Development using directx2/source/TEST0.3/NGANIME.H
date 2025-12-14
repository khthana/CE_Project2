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

using namespace std;

typedef struct _NGPLAYANIME
{
	DWORD			dwFactor;			// Multiply factor
	FLOAT			fTime;				// Ellepsed playing time
	BOOL			bLoop;
	BOOL			bPlay;
	BOOL			bReset;

	_NGPLAYANIME(BOOL play = FALSE, DWORD factor=100,	BOOL reset = FALSE, 
				 FLOAT time=0.0f,	BOOL  loop=FALSE)
	{
		dwFactor	= factor;
		fTime		= time;
		bLoop		= loop;
		bPlay		= play;
		bReset		= reset;
	};
} NGPLAYANIME;


typedef struct _NGANIMATION
{
	std::string		strFrame;			// Associated Frame Name
	vector<NGKEY3>	keyTran;
	vector<NGKEY4>	keyRot;
	vector<NGKEY3>	keyScale;
	vector<NGKEY16>	keyMat;
	NGFRAME*		frame;

	_NGANIMATION()
	{
		frame		= NULL;
	};
} NGANIMATION;

class NGANIME
{
protected:
	
	vector<NGANIMATION*>	m_Anim;
	DWORD					m_dwLength;

public:
	std::string				m_strName;	// Name of this set
	NGPLAYANIME*			m_playAnime;
	NGANIME()
	{
		m_strName	= "Untitled";
		m_dwLength	= 0;
	}

	BOOL	AddAnimation(NGANIMATION*);
	DWORD	FindLength();
	DWORD	Update(FLOAT);

	DWORD	GetLength()	{ return m_dwLength;};
	vector<NGANIMATION*>*	GetAnimList()	{ return &m_Anim;};

};


#endif