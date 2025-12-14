// FootballTeam.h: interface for the CFootballTeam class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLTEAM_H__20EA397C_F63F_4638_98ED_BC23440E9756__INCLUDED_)
#define AFX_FOOTBALLTEAM_H__20EA397C_F63F_4638_98ED_BC23440E9756__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CFootballTeam : public CDrawable
{
protected:
	DWORD				m_TeamNo;
	TCHAR				m_TeamName[MAXSTRINGNAME];
	CFootballPlayer*	m_pPlayer[NUMBER_OF_PLAYERS];
	CFootballTactic*	m_pTactic;
	CSurface*			m_pPlayerSurface[8][5];

	// Reference Variable
	CFootballMatch*		m_pMatch;
public:
	CFootballTeam(TCHAR* TeamName = "", CFootballTactic* pTactic = NULL);
	virtual ~CFootballTeam();

	HRESULT CreateSurface(CDisplay* pDisplay);
	VOID	ReleaseSurface();
	VOID	Update(DWORD dwTickDiff);
	HRESULT Draw(CSurface* pSurface,POINT ptStart);
	
	VOID				CreateDefaultTeam();
	VOID				DestroyTeam();

	inline DWORD				GetTeamNo()	{ return m_TeamNo; };
	inline VOID					SetTeamNo(DWORD TeamNo)	{ m_TeamNo = TeamNo;};

	inline TCHAR*				GetTeamName() { return m_TeamName; };
	inline VOID					SetTeamName(TCHAR* TeamName) { strcpy(m_TeamName,TeamName); };

	BOOL					IsLeftTeam();
	inline DWORD				GetTeamSide() { return IsLeftTeam()?LEFTSIDE:RIGHTSIDE; };
	
	inline CFootballMatch*		GetMatch() { return m_pMatch; };
	inline VOID					SetMatch(CFootballMatch* pMatch) { m_pMatch = pMatch; };

	inline CFootballTactic*		GetTactic()	{ return m_pTactic; };
	inline VOID					SetTactic(CFootballTactic* pTactic);

	inline CFootballPlayer*		GetPlayer(DWORD PlayerNo);
	inline VOID					SetPlayer(CFootballPlayer* pPlayer,DWORD PlayerNo);

	inline CFootballPlayer**	GetPlayerList() { return m_pPlayer; };


	CSurface*					GetPlayerSurface(DWORD Dir,DWORD Frame);
	CFootballPlayer*			GetCloserPlayer(CLocation Loc);
		
	VOID						Serialize(CArchive& ar);
public:
	BOOL IsDefend();
	BOOL IsMove();

	void DoGoalKeeper(CFootballPlayer* PlayerList[],CFootballBall* Ball);
	static CLocation GoalPos[][2];
	static CLocation GoalPoint[];
public:
	virtual BOOL Shoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
					CFootballBall* Ball,CFootballTeam* Team);
	virtual void DoDefend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
					CFootballBall* Ball,CFootballTactic* Tactic) = 0;
	virtual void DoOffend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
					CFootballBall* Ball,CFootballTactic* Tactic) = 0;
	virtual void TeamAction() = 0;
	virtual void DeinitialTeam();
	virtual void InitialTeam();
	virtual TCHAR* GetType();
	virtual CLocation FindPassArea(CFootballBall* Ball,
				CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
				CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir);
	virtual CLocation FindEmptyArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],
			CFootballPlayer* OppPlayerList[], 
			CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir);
};

#endif // !defined(AFX_FOOTBALLTEAM_H__20EA397C_F63F_4638_98ED_BC23440E9756__INCLUDED_)
