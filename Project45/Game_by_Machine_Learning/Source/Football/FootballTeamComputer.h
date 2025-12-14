// FootballTeamComputer.h: interface for the CFootballTeamComputer class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLTEAMCOMPUTER_H__9B377829_A3DB_42F6_9D37_99E7D70F6BBB__INCLUDED_)
#define AFX_FOOTBALLTEAMCOMPUTER_H__9B377829_A3DB_42F6_9D37_99E7D70F6BBB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "FootballTeam.h"

class CFootballTeamComputer : public CFootballTeam  
{
	DECLARE_SERIAL(CFootballTeamComputer)
public:
	CFootballTeamComputer();
	CFootballTeamComputer(TCHAR* TeamName, CFootballTactic* pTactic);
	virtual ~CFootballTeamComputer();

public:
	void DoDefend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
		CFootballBall* Ball,CFootballTactic* Tactic);
	void DoOffend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
		CFootballBall* Ball,CFootballTactic* Tactic);
	BOOL Shoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTeam* Team);
public:
	BOOL InAreaNo(CLocation Loc,DWORD AreaNo);
	CLocation GetAreaLoc(int AreaNo);
	virtual void TeamAction();
	virtual void DeinitialTeam();
	virtual void InitialTeam();
	virtual TCHAR* GetType();
	CFootballPlayer* m_FindBallPlayer;
	CLocation FindPassArea(CFootballBall* Ball,
				CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
				CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir);
	CLocation FindEmptyArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],
			CFootballPlayer* OppPlayerList[], 
			CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir);

};

#endif // !defined(AFX_FOOTBALLTEAMCOMPUTER_H__9B377829_A3DB_42F6_9D37_99E7D70F6BBB__INCLUDED_)
