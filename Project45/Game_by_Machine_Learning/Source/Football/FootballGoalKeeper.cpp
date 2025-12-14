// FootballGoalKeeper.cpp: implementation of the CFootballGoalKeeper class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "football.h"
#include "FootballGoalKeeper.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CFootballGoalKeeper::CFootballGoalKeeper(TCHAR* szPlayerName,DWORD PlayerNo,CFootballTeam* pTeam)
: CFootballPlayer(szPlayerName,PlayerNo,pTeam)
{

}

CFootballGoalKeeper::~CFootballGoalKeeper()
{

}

BOOL CFootballGoalKeeper::CanTouch(CFootballBall* pBall)
{
	CLocation Loc = GetLocation();
	return (
		fabs(Loc.x - pBall->GetLocation().x) < CANTOUCH_RANGE+0.5 &&// < 0.5 && 
		fabs(Loc.y - pBall->GetLocation().y) < CANTOUCH_RANGE+0.5 //< 0.5
		&& pBall->GetHeight() < PLAYER_HEIGHT
		);
}
