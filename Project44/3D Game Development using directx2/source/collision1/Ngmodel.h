#pragma warning(disable:4786)
#ifndef __NGMODEL_H
#define __NGMODEL_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"

#include "ngframe.h"
#include "nganime.h"
#include "ngcollision.h"
#include "ngrender.h"

#include <vector>
#include <string>
#include <queue>

using namespace std;

class NGMODEL
{
protected:
	NGFRAME*			m_pRoot;

	vector<NGFRAME*>	m_pFrame;
	vector<NGANIME*>	m_pAnime;
	vector<NGCOLLIDE*>	m_pCollide;

	D3DXVECTOR3			m_RefPoint;
	NGCYLINDER			m_Cylinder;

	// function
	BOOL		Traverse(NGFRAME*);
	DWORD		UpdateAnime(FLOAT);
	DWORD		UpdateMatrix(NGFRAME*);
	DWORD		ResetMatrix(NGFRAME*);
	DWORD		CopyFrame(NGFRAME*);
	NGANIME*	CopyAnime();

public:
	BOOL				m_bVisible;
	D3DXMATRIX			m_matModel;

	NGMODEL()
	{
		m_bVisible	= TRUE;
		m_RefPoint	= D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	}

	BOOL		Create(NGFRAME* frame,NGANIME* anime = NULL);
	BOOL		Prepare(NGIBTYPE);
	NGMODEL*	Cone();

	DWORD		PlayAnime(	DWORD, BOOL play = TRUE, DWORD factor = 1000,
							BOOL reset = TRUE, BOOL loop = FALSE, FLOAT time = 0.0f);
/*	DWORD		PlayAnime( char* , BOOL play = TRUE, DWORD factor = 1000,
							BOOL reset = TRUE, BOOL loop = FALSE, FLOAT time = 0.0f);*/

	DWORD		Reset();
	DWORD		Update(FLOAT fTime=0.0f);
	DWORD		AddAnime(NGANIME*);
	DWORD		AddCollide(NGCOLLIDE*);
	DWORD		SetModelPos(D3DXVECTOR3);
	DWORD		Visible(BOOL);

	VOID		SetCylinder(D3DXVECTOR3, FLOAT, FLOAT);
	VOID		SetRefPoint(D3DXVECTOR3);

	BOOL		IsPlaying();

	D3DXVECTOR3			GetRefPoint();
	NGCYLINDER			GetCylinder();
	vector<NGFRAME*>*	GetFrameList()	{ return &m_pFrame;};
	vector<NGANIME*>*	GetAnimeList()	{ return &m_pAnime;};
	vector<NGCOLLIDE*>*	GetCollideList(){ return &m_pCollide;};
};

#endif