// FootballBall.h: interface for the CFootballBall class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLBALL_H__3920BE79_F801_407C_A0BD_7112F86A059D__INCLUDED_)
#define AFX_FOOTBALLBALL_H__3920BE79_F801_407C_A0BD_7112F86A059D__INCLUDED_

#include "Point.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CFootballBall : public CDrawable 
{
	DECLARE_SERIAL(CFootballBall)
private:
	CLocation			m_Loc;
	DOUBLE				m_Speed;
	DOUBLE				m_Height;
	DOUBLE				m_AlphaH;
	DOUBLE				m_AlphaV;
	DWORD				m_CurrTime;
	DWORD				m_KickTime;
	BOOL				m_bBallMoves;
	CFootballPlayer*	m_pKicker;
	CFootballPlayer*	m_pControlBallPlayer;
	
	CSurface*			m_pBallSurface;
	SoundObject*		m_pKickSound;

	// Reference Variables
	CFootballMatch*		m_pMatch;
public:
	CFootballBall();
	CFootballBall(CFootballMatch* Match);
	virtual ~CFootballBall();
	
	HRESULT CreateSurface(CDisplay* pDisplay);
	void	ReleaseSurface();
	void	Update(DWORD dwTickDiff);
	HRESULT Draw(CSurface* pSurface,POINT ptStart);

	void				Serialize( CArchive& ar );
	void				Shoot(CFootballPlayer* pPlayer,DOUBLE speed,DOUBLE angle);
	DOUBLE				GetHeight();
public:
	BOOL				IsBallMove();
	DWORD				GetDirection();
	CLocation			GetDestLocation();
	CFootballTeam*		GetBallTeam();
	CLocation			GetLocation();
	CFootballPlayer*	GetControlBallPlayer();
	CFootballPlayer*	GetKicker();
	DWORD				GetKickTime();

	void				SetLocation(CLocation Loc);
	void				SetControlBallPlayer(CFootballPlayer* pPlayer);


private:
	DOUBLE GetParabollicDistance(DOUBLE t,DOUBLE velocity,DOUBLE angle,DOUBLE h0);
	DOUBLE GetHorizontalDistance(DOUBLE t, DOUBLE velocity);
	DOUBLE z(DOUBLE t,DOUBLE velocity,DOUBLE angle,DOUBLE h0);
	DOUBLE x(DOUBLE t,DOUBLE velocity,DOUBLE angle,DOUBLE h0);
	DOUBLE Solve(DOUBLE velocity,DOUBLE angle,DOUBLE h0);
	DOUBLE GetAltitude(DOUBLE t,DOUBLE velocity,DOUBLE angle, DOUBLE h0);
};

#endif // !defined(AFX_FOOTBALLBALL_H__3920BE79_F801_407C_A0BD_7112F86A059D__INCLUDED_)
