// FootballPlayer.h: interface for the CFootballPlayer class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLPLAYER_H__621F9CCC_2638_423D_9253_6314019B7267__INCLUDED_)
#define AFX_FOOTBALLPLAYER_H__621F9CCC_2638_423D_9253_6314019B7267__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CFootballPlayer : public CDrawable
{
	DECLARE_SERIAL(CFootballPlayer)
public:
	CFootballPlayer();
	CFootballPlayer(TCHAR* szPlayerName,DWORD PlayerNo,CFootballTeam* pTeam);
	virtual ~CFootballPlayer();
	
	HRESULT CreateSurface(CDisplay* pDisplay);
	void	ReleaseSurface();
	void	Update(DWORD dwTickDiff);
	HRESULT Draw(CSurface* pSurface,POINT ptStart);
	HRESULT DrawShadow(CSurface* pSurface,POINT ptStart);

public: // Access Method
	CLocation		GetLocation();
	void			SetLocation(CLocation Loc);

private:
	CLocation		m_Loc;
	DOUBLE			m_Speed;
	DWORD			m_Direction;
	DWORD			m_PlayerNo;
	TCHAR			m_PlayerName[20];
	DWORD			m_CurrTime;
	DWORD			m_RunningTime;

	CSurface*		m_pNumSurface;
	// Reference Variable;
	CFootballTeam*	m_pTeam;
public:
	// Access Methods
	inline CFootballTeam*	GetTeam() { return m_pTeam; };
	inline void				SetTeam(CFootballTeam* Team) { m_pTeam = Team; };

	TCHAR*			GetName()	{ return m_PlayerName; };
	DOUBLE			GetSpeed();
	DWORD			GetPlayerNo();
	DWORD			GetDirection();

	void			SetName(TCHAR* PlayerName);
	void			SetSpeed(DOUBLE Speed);
	void			SetPlayerNo(DWORD PlayerNo);
	void			SetDirection(DWORD Dir);
public:
	void			DoStops();
	void			DoRuns();
	void			DoRunsTo(CLocation Loc);
	BOOL			CloserLoc(CLocation Loc,DOUBLE Range);
	virtual BOOL	CanTouch(CFootballBall* pBall);
	DWORD			GetDirectionTo(CLocation Dest,DOUBLE Range);
	DOUBLE			GetRunDistance();

	void			Serialize( CArchive& ar );

};

typedef CFootballPlayer *PCFootballPlayer;
typedef CFootballPlayer **PPCFootballPlayer;
typedef CFootballPlayer ***PPPCFootballPlayer;

#endif // !defined(AFX_FOOTBALLPLAYER_H__621F9CCC_2638_423D_9253_6314019B7267__INCLUDED_)
