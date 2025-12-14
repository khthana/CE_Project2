// FootballGoalKeeper.h: interface for the CFootballGoalKeeper class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLGOALKEEPER_H__D6A91443_9460_4E83_A705_97D644A1757A__INCLUDED_)
#define AFX_FOOTBALLGOALKEEPER_H__D6A91443_9460_4E83_A705_97D644A1757A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "FootballPlayer.h"

class CFootballGoalKeeper : public CFootballPlayer  
{
public:
	CFootballGoalKeeper(TCHAR* szPlayerName = "",DWORD PlayerNo = 0,CFootballTeam* pTeam = NULL);
	virtual ~CFootballGoalKeeper();
	virtual BOOL CanTouch(CFootballBall* pBall);

};

#endif // !defined(AFX_FOOTBALLGOALKEEPER_H__D6A91443_9460_4E83_A705_97D644A1757A__INCLUDED_)
