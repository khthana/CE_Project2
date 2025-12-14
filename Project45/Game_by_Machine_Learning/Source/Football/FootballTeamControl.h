// FootballTeamControl.h: interface for the CFootballTeamControlControl class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLTEAMCONTROL_H__2EA23D47_6077_4D13_B46A_7B22190D7183__INCLUDED_)
#define AFX_FOOTBALLTEAMCONTROL_H__2EA23D47_6077_4D13_B46A_7B22190D7183__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "FootballTeam.h"

class CFootballTeamControl : public CFootballTeam  
{
	DECLARE_SERIAL(CFootballTeamControl)
private:
	CFootballPlayer*	m_pControlPlayer;
public:
	CFootballTeamControl(TCHAR* TeamName = "", CFootballTactic* pTactic = NULL);
	virtual ~CFootballTeamControl();

	virtual void TeamAction();

public:
	CFootballPlayer*	GetControlPlayer();
	void				SetControlPlayer(CFootballPlayer* pPlayer); 
	void				SwapControlPlayer();

	virtual void DoDefend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
		CFootballBall* Ball,CFootballTactic* Tactic);
	virtual void DoOffend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
		CFootballBall* Ball,CFootballTactic* Tactic);
public:
	BOOL InAreaNo(CLocation Loc,DWORD AreaNo);
	CLocation GetAreaLoc(int AreaNo);
	DWORD m_Counst;
	void DoShoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayer[],CFootballBall* Ball,CFootballTactic* Tactic);
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

#endif // !defined(AFX_FOOTBALLTEAMCONTROL_H__2EA23D47_6077_4D13_B46A_7B22190D7183__INCLUDED_)
