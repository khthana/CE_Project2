// FootballTactic.h: interface for the CFootballTactic class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLTACTIC_H__05460A84_E52F_410B_B944_ABDCA3DE3E34__INCLUDED_)
#define AFX_FOOTBALLTACTIC_H__05460A84_E52F_410B_B944_ABDCA3DE3E34__INCLUDED_

#include "Point.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define ROWS_COUNT 4
#define COLS_COUNT 3

class CFootballTactic : public CObject
{
	DECLARE_SERIAL(CFootballTactic)

public:
	CFootballTactic();
	CFootballTactic(TCHAR* szFileName);
	virtual ~CFootballTactic();

	void Serialize(CArchive& ar);

private:
	CLocation	m_ppChangingPoint[2][11];//[NUMBER_OF_PLAYERS];
	CLocation	m_ppKickoffPoint[2][11];//[NUMBER_OF_PLAYERS];
	CLocation	m_pppGamePoint[ROWS_COUNT*COLS_COUNT][2][11];//[NUMBER_OF_PLAYERS];
	CLocation	m_ppCornerPoint[4][2][11];//[NUMBER_OF_PLAYERS];

	// Reference Variables
	CFootballTeam* m_pTeam;
public:
	static DWORD GetAreaNo(CLocation Loc,DWORD TeamSide);
	static CLocation GetAreaLoc(DWORD AreaNo,DWORD TeamSide);

public:
	void			MovetoKickoff();
	void			SetChanging();
	void			SetKickoff();
	void			SetThrowIn(CLocation Pos);
	void			SetCorner(DWORD CornerNo);
	void			SetFreeKick(CLocation Pos);
	void			SetTeam(CFootballTeam* pTeam);
	CFootballTeam*	GetTeam();

	//CFootballTeam*	GetTeam();
	CLocation		WhereShouldPlayerGo(CFootballPlayer* pPlayer,CFootballBall* Ball,CFootballTeam* Team);
	
	void Load(LPSTR szFileName);
};

#endif // !defined(AFX_FOOTBALLTACTIC_H__05460A84_E52F_410B_B944_ABDCA3DE3E34__INCLUDED_)
