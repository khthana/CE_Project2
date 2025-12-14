// FootballMatch.h: interface for the CFootballMatch class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLMATCH_H__71C73C6E_A697_48D7_B48B_895978A835D7__INCLUDED_)
#define AFX_FOOTBALLMATCH_H__71C73C6E_A697_48D7_B48B_895978A835D7__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

enum {NOTEAM,TEAM1,TEAM2};
enum {MS_NONE,MS_CHANGINGROOM,MS_FIRST_HALF,MS_HALF_TIME,MS_SECOND_HALF,MS_FULLTIME};
enum {TSS_DEFEND,TSS_OFFEND,TSS_NONE};

class CFootballMatch : public CDrawable
{
	DECLARE_SERIAL(CFootballMatch)
public:
	CFootballMatch(CFootballApp* App = NULL);
	virtual ~CFootballMatch();

private:
	DWORD				m_MatchState;
	DWORD				m_ControlTeam;  // TS_LEFT or TS_RIGHT or TS_NONE
	DWORD				m_DefendSide;	// TS_LEFT or TS_RIGHT
	BOOL				m_bWaitKick;

	CFootballApp*		m_pApp;
	CFootballBall*		m_pBall;
	CFootballTeam*		m_pTeam[2];
	CFootballScore*		m_pScore;

	CSurface*			m_pGroundSurface;
	RECT				m_rcGroundRect;
	// Reference Variables
	CDisplay*			m_pDisplay;
public: // Access Method
	inline CFootballApp*	GetApp()	{ ASSERT(m_pApp);	return m_pApp; };
	inline CFootballBall*	GetBall()	{ ASSERT(m_pBall);	return m_pBall;	};
	inline CFootballScore*	GetScore()	{ ASSERT(m_pScore);	return m_pScore; };
	inline CFootballTeam*	GetTeam(DWORD Team)				{ ASSERT(m_pTeam[Team]);		return m_pTeam[Team]; };
	inline CFootballTeam*	GetTeamSide(DWORD TeamSide)		{ ASSERT(m_pTeam[TeamSide]);	return m_pTeam[TeamSide]; };

	CFootballTeam*		GetTeamNo(DWORD TeamNo);
	CFootballTeam*		GetOffendTeam();
	CFootballTeam*		GetDefendTeam();
	CFootballTeamControl*		GetControlTeam();
	CFootballTeam*		GetOppositTeam(CFootballTeam* Team);

	DWORD				GetDefendSide();

	void				SetTeam(DWORD TeamSide,CFootballTeam* pTeam);
	void				SetMatchState(DWORD MatchState);
	void				SetDefendSide(DWORD TeamSide);
	void				SetControlTeam(DWORD ControlSide);

public:
	HRESULT				CreateSurface(CDisplay* pDisplay);
	void				ReleaseSurface();
	HRESULT				Draw(CSurface* pSurface,POINT ptStart);

	void				Update(DWORD dwTickDiff);
	void				SwapTeamSide();
	void				SwapControlTeam();
	void				SwapDefendSide();
	void				DoKey(BYTE Diks[]);
	void				CheckHaveBallPlayer();
	void				CheckFootballRule();
	void				MatchAction();

	void				Serialize( CArchive& ar );

	BOOL m_bActive;
	void DeinitGame();
	void InitGame();

	CLocation GetCornerLoc(DWORD Pos);
	void SetFreeKick(DWORD CornerNo);
	void SetCorner(DWORD CornerNo);
	void SetChangingRoom();
	void SetKickoff();

public:
	void MakePassData(CKickData* pKickdata);
	HRESULT				CreateGroundSurface(CDisplay* pDisplay);
	HRESULT				DrawGround(CSurface* pSurface,POINT ptStart);
	static inline DWORD		ConvX(DOUBLE X) { return int(X*m_RatioX+m_ptGroundBorder.x); };
	static inline DWORD		ConvY(DOUBLE Y) { return int(Y*m_RatioY+m_ptGroundBorder.y); };
	static DOUBLE			m_RatioX;
	static DOUBLE			m_RatioY;
	static POINT			m_ptGroundBorder;
};

#endif // !defined(AFX_FOOTBALLMATCH_H__71C73C6E_A697_48D7_B48B_895978A835D7__INCLUDED_)
