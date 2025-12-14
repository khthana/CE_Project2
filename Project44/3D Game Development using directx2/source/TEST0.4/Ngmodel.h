#pragma warning(disable:4786)
#ifndef __NGMODEL_H
#define __NGMODEL_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"

#include "ngframe.h"
#include "nganime.h"
#include "ngmtrl.h"
#include "ngcollision.h"
#include "ngrender.h"
#include "ngbuffer.h"
#include "ngtexture.h"

#include <vector>
#include <string>
#include <queue>
#include <list>
#include <map>

using namespace std;
/*
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
*/


typedef enum NGANIMATIONTYPE
{
	ANIME_MTRL	= 0x00000001,
	ANIME_TEX0	= 0x00000002,
	ANIME_TEX1	= 0x00000004,
	ANIME_ANIM	= 0x00000008,
	ANIME_ASET	= 0x0000000F
};

typedef struct _NGANIMETYPE
{
	NGANIMATIONTYPE mtrl;
	NGANIMATIONTYPE tex0;
	NGANIMATIONTYPE tex1;
	NGANIMATIONTYPE anim;
	NGANIMATIONTYPE	animSet;

	_NGANIMETYPE()
	{
		mtrl	= ANIME_MTRL;
		tex0	= ANIME_TEX0;
		tex1	= ANIME_TEX1;
		anim	= ANIME_ANIM;
		animSet = ANIME_ASET;
	}
} NGANIMETYPE;



static NGANIMETYPE AnimeType;

struct NGPLAYANIME
{
	NGANIMATIONTYPE	type;
	string			name;
	BOOL			play;			// is playing?
	BOOL			loop;			// play in loop?
	BOOL			reset;			// reset after end?
	float			time;			// current time;
	float			prev;			// prev time;
	float			length;			// length of animation
	INT				ID;				// ID of the mtrl / anim
	INT				SetID;			// ID of set in mtrl / anim
	string			playName;
	string			playSetName;

	NGPLAYANIME()
	{
		type	= AnimeType.mtrl;
		name	= "Default";
		length	= 0;
		ID		= -1;
		SetID	= -1;
		time	= 0;
		prev	= 0;
		playName	= "Unknown";
		playSetName	= "Unknown";
	}

	void	MtrlByID(INT nID, INT nSetID)
	{
		type	= AnimeType.mtrl;
		ID		= nID;
		SetID	= nSetID;
	}

	void	MtrlByName(string strName, string setName)
	{
		type		= AnimeType.mtrl;
		playName	= strName;
		playSetName	= setName;
	}

	void	AnimeByID(INT nID)
	{
		type	= AnimeType.anim;
		ID		= nID;
		SetID	= -1;
		play	= FALSE;
		loop	= FALSE;
		reset	= FALSE;
	}

	void	AnimeByName(string strName)
	{
		type		= AnimeType.mtrl;
		playName	= strName;
		SetID		= -1;
	}

	void	AnimeSetByID(INT nID, INT setID)
	{
		type	= AnimeType.anim;
		ID		= nID;
		SetID	= setID;
	}

	void	AnimeSetByName(string strName, string setName)
	{
		type		= AnimeType.mtrl;
		playName	= strName;
		playSetName	= setName;
	}
};

class NGModel;
class NGRes3d;

class NGClone : public NGObject
{
private:
	ArrayList<NGFRAMEX*>	m_root;
	ArrayList<NGFRAMEX*>	m_frame;
	ArrayList<NGMTRLS*>*	m_pMtrls;
	ArrayList<NGANIME*>*	m_pAnime;
	//ArrayList<NGDetector*>	m_collide;
	NGDetector*				m_collide;

	ArrayList<D3DMATERIAL8*>	m_mtrls;
	ArrayList<D3DXMATRIX*>		m_anime;
	
	D3DXMATRIX				m_matModel;
	D3DXMATRIX				m_matRender;
	NGObject*				m_Parent;

	NGModel*				m_pTemplate;

	ArrayList<NGPLAYANIME*>	m_playList;
	ArrayList<NGRENDERDESC*> m_rdesc;

	NGRes2d*				m_res2d;

	friend class NGModel;
	friend class NGRes3d;

public:

	NGClone();
	~NGClone(){};
	
	INT		FindFrame(string);
	INT		FindMtrl(string);
	INT		FindAnime(string);
	INT		FindCollide(string);

	BOOL	Play(INT,BOOL,BOOL,FLOAT);
	BOOL	Pause(INT);
	BOOL	Reset(INT);
	BOOL	AddPlayAnim(NGPLAYANIME);

	BOOL	Link();

	BOOL	UpdateMtrl(FLOAT);
	BOOL	UpdateTexture(FLOAT);
	BOOL	UpdateAnime(FLOAT);
	BOOL	UpdateMatrix();
	BOOL	Update(FLOAT);
	BOOL	Render();

	BOOL	SetParent(NGObject*);
	
	D3DXMATRIX*				GetMatrix()		{ return &m_matModel;};
	NGModel*				GetTemplate()	{ return m_pTemplate;};
	ArrayList<NGFRAMEX*>*	Roots()			{ return &m_root;};
	ArrayList<NGFRAMEX*>*	Frame()			{ return &m_frame;};
	ArrayList<NGANIME*>*	Anime()			{ return m_pAnime;};
	ArrayList<NGMTRLS*>*	Mtrls()			{ return m_pMtrls;};
	NGDetector*				Detector()		{ return m_collide;};
};

class NGModel
{
private:
	string				m_filename;

	ArrayList<NGFRAME*>	m_root;
	ArrayList<NGFRAME*>	m_frame;
	ArrayList<NGMTRLS*>	m_mtrls;
	ArrayList<NGANIME*>	m_anime;
	ArrayList<NGCOLLIDE*> m_collide;

	map<string,INT>		m_frameMap;
	map<string,INT>		m_mtrlsMap;
	map<string,INT>		m_animeMap;
	map<string,INT>		m_collideMap;
	NGRes2d*			m_res2d;

public:

	NGModel(){};
	~NGModel(){};

	VOID	Add(NGFRAME*);
	VOID	Add(NGMTRLS*);
	VOID	Add(NGANIME*);
	VOID	Add(NGCOLLIDE*);

	INT		FindFrame(string);
	INT		FindMtrl(string);
	INT		FindAnime(string);
	INT		FindCollide(string);

	BOOL	Link(NGRes2d*);

	//D3DXMATRIX*				GetMatrix() { return &m_matModel;};

	ArrayList<NGFRAME*>*	Roots()	{return &m_root;};
	ArrayList<NGFRAME*>*	Frame()	{return &m_frame;};
	ArrayList<NGANIME*>*	Anime()	{return &m_anime;};
	ArrayList<NGMTRLS*>*	Mtrls() {return &m_mtrls;};

	string		GetName()			{ return m_filename;};
	void		SetName(string n)	{ m_filename = n;};
	NGClone*	Clone();
};

typedef pair <string, NGModel*> Model_Pair;

class NGRes3d
{
private:
	ArrayList<NGModel*>		m_model;
	NGClone*				m_clone[1024];
	DWORD					m_numClone;
	map<string, NGModel*>	m_mapModel;

	NGRenderBuffer*			m_RenderBuffer;
	

public:
	NGRes3d();

	BOOL		Link(NGRes2d*);
	BOOL		AddModel(NGModel*, string);
	BOOL		CreateClone(string, NGClone*&);
	BOOL		CreateClone(INT, NGClone*&);
	BOOL		DestroyClone(NGClone*);
	BOOL		UpdateMatrix();
	BOOL		Detect();
	BOOL		Render(FLOAT time = 0.0f);

	NGModel*	Find(string);
	NGModel*	GetModel(DWORD);
};

#endif