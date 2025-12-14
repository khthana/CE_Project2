// FootballBall.cpp: implementation of the CFootballBall class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballBall.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballBall,CObject,0)

CFootballBall::CFootballBall()
{
	m_Loc		= CLocation(HALF_GROUND_HEIGHT,HALF_GROUND_WIDTH);
	m_Speed		= 0;
	m_Height	= 0;
	m_AlphaV	= 0;
	m_AlphaH	= 0;
	m_KickTime	= 0;
	m_bBallMoves	= FALSE;
	m_pKicker		= NULL;
	m_pControlBallPlayer = NULL;

	m_pBallSurface	= NULL;
	m_pMatch		= NULL;
}

CFootballBall::CFootballBall(CFootballMatch* Match)
{
	m_Loc		= CLocation(HALF_GROUND_HEIGHT,HALF_GROUND_WIDTH);
	m_Speed		= 0;
	m_Height	= 0;
	m_AlphaV	= 0;
	m_AlphaH	= 0;
	m_KickTime	= 0;
	m_bBallMoves	= FALSE;
	m_pKicker		= NULL;
	m_pControlBallPlayer = NULL;

	m_pBallSurface	= NULL;
	m_pMatch		= Match;
}

CFootballBall::~CFootballBall()
{
}

//-----------------------------------------------------------------------------
// Name: CreateSurface()
//-----------------------------------------------------------------------------
HRESULT CFootballBall::CreateSurface(CDisplay *pDisplay)
{
	pDisplay->CreateSurfaceFromBitmap(&m_pBallSurface,"Resource\\Ball.bmp",0,0);
	m_pBallSurface->SetColorKey(RGB(255,255,255));
	return S_OK;
}

//-----------------------------------------------------------------------------
// Name: ReleaseSurface()
//-----------------------------------------------------------------------------
void CFootballBall::ReleaseSurface()
{
	SAFE_DELETE(m_pBallSurface);
}

void CFootballBall::Update(DWORD dwTickDiff)
{
	m_CurrTime += dwTickDiff;
}

HRESULT CFootballBall::Draw(CSurface *pSurface, POINT ptStart)
{
	HRESULT hr;
	DOUBLE Height = GetHeight();
	HDC hDC;
	LPDIRECTDRAWSURFACE7 pddsSurface = pSurface->GetDDrawSurface();
	if(FAILED(hr = pddsSurface->GetDC(&hDC)))	
		return hr;
	DOUBLE koef = Height/10.0+BALL_RADIUS*2;
	HPEN hPen = CreatePen(PS_SOLID,1,SHADOW_COLOR);
	HPEN hOldPen = (HPEN)SelectObject(hDC,hPen);
	HBRUSH hBrush = CreateSolidBrush(SHADOW_COLOR);
	HBRUSH hOldBrush = (HBRUSH)SelectObject(hDC,hBrush);

	CLocation Loc = GetLocation();

	Ellipse(hDC,ptStart.x+CFootballMatch::ConvX(Loc.x + koef/2.0 + Height-BALL_RADIUS*3/(1+Height*.2)),
				ptStart.y+CFootballMatch::ConvY(Loc.y - koef/2.0 - Height-BALL_RADIUS*3/(1+Height*.2)),
				ptStart.x+CFootballMatch::ConvX(Loc.x + koef/2.0 + Height+BALL_RADIUS*3/(1+Height*.2)),
				ptStart.y+CFootballMatch::ConvY(Loc.y - koef/2.0 - Height+BALL_RADIUS*3/(1+Height*.2)));

	SelectObject(hDC,hOldPen);
	SelectObject(hDC,hOldBrush);
	DeleteObject(hPen);
	DeleteObject(hBrush);
	if(FAILED(hr = pddsSurface->ReleaseDC(hDC)))	
		return hr;

	RECT rc;
	SetRect(&rc,ptStart.x+CFootballMatch::ConvX(Loc.x - koef/2.0-koef*1.5)+2,
				ptStart.y+CFootballMatch::ConvY(Loc.y - koef/2.0-koef*1.5)+2,
				ptStart.x+CFootballMatch::ConvX(Loc.x - koef/2.0+koef*1.5)+2,
				ptStart.y+CFootballMatch::ConvY(Loc.y - koef/2.0+koef*1.5)+2);
				
	pddsSurface->Blt(&rc,m_pBallSurface->GetDDrawSurface(),NULL,DDBLT_KEYSRC,NULL);

	return S_OK;
}

void CFootballBall::SetLocation(CLocation Loc)
{
	m_Loc = Loc;
	m_Speed = 0;
	m_Height = 0;
	m_AlphaH = 0;
	m_AlphaV = 0;
	m_KickTime = 0;
	m_bBallMoves	= FALSE;
	m_pKicker		= NULL;
	m_pControlBallPlayer = NULL;
}

CLocation CFootballBall::GetLocation()
{
	if(m_pControlBallPlayer != NULL && 
	  (m_pControlBallPlayer != m_pKicker || m_CurrTime - m_KickTime > MINIMUN_SHOOT_TIME))
		return m_pControlBallPlayer->GetLocation();
	else if(!m_bBallMoves)
		return m_Loc;
	else
	{
		DOUBLE t = m_CurrTime;
		DOUBLE x;
		if(m_AlphaV>MINIMUM_ANGLE)
			x = GetParabollicDistance((t-m_KickTime)/1000.0,m_Speed,m_AlphaV,m_Height);
		else 
			x = GetHorizontalDistance((t-m_KickTime)/1000.0,m_Speed);

		DOUBLE xLoc = m_Loc.x + x*cos(m_AlphaH);
		DOUBLE yLoc = m_Loc.y + x*sin(m_AlphaH);
		
		return CLocation(
			(xLoc>GROUND_HEIGHT+2)?GROUND_HEIGHT+2:(xLoc<0-2?0-2:xLoc),
			(yLoc>GROUND_WIDTH +2)?GROUND_WIDTH +2:(yLoc<0-2?0-2:yLoc));
	}
}
	
void CFootballBall::Shoot(CFootballPlayer* Player,DOUBLE Speed,DOUBLE Angle)
{
	m_Loc		= Player->GetLocation();
	m_Speed		= Speed;
	m_Height	= 0;
	m_AlphaV	= Angle;
	m_AlphaH	= Dir2Rad(Player->GetDirection());
	m_KickTime	= m_CurrTime;
	m_bBallMoves	= TRUE;
	m_pControlBallPlayer	= NULL;
	m_pKicker		= Player;
	m_pMatch->GetApp()->PlayKickSound();
	m_pMatch->GetScore()->DoShoot(Player);
	m_pMatch->GetScore()->WriteOut("Shoot!!!");
}

DOUBLE CFootballBall::GetHorizontalDistance(DOUBLE t, DOUBLE velocity)
{
	DOUBLE K = pow(velocity,2.0);
	DOUBLE t2 = pow(t,2.0);

	if(t2>=K)
	{
		DOUBLE x = K*22.0/7.0/4.0;
		m_Loc = CLocation(m_Loc.x + x*cos(m_AlphaH),m_Loc.y + x*sin(m_AlphaH));
		m_bBallMoves = FALSE;
		return 0;
	}
	return t/2*pow(K-t2, 0.5) + K/2*asin(t/velocity);
}

DOUBLE CFootballBall::GetParabollicDistance(DOUBLE t, DOUBLE velocity, DOUBLE angle, DOUBLE h0)
{
	if(velocity>MINIMUM_SPEED)
	{
		DOUBLE t0 = Solve(velocity,angle,h0);
		if (t<t0)
			return x(t ,velocity,angle,h0);
		else
			return x(t0,velocity,angle,h0) + GetParabollicDistance(t-t0,velocity*BOUNCE_SPEED_FACTOR,angle,h0);
	}
	else return 0;
	
}

DOUBLE CFootballBall::x(DOUBLE t, DOUBLE velocity, DOUBLE angle, DOUBLE h0)
{
	return (M_K*velocity*cos(angle))*(1-exp(-K_M*t));
}

DOUBLE CFootballBall::z(DOUBLE t, DOUBLE velocity, DOUBLE angle, DOUBLE h0)
{
	return M_K*(velocity*sin(angle)+MG_K)*(1-exp(-t*K_M)) - MG_K*t;
}

DOUBLE CFootballBall::Solve(DOUBLE velocity, DOUBLE angle, DOUBLE h0)
{
	for(DOUBLE t=0;t<10;t+=0.1) 
		if(z(t,velocity,angle,h0)<0) 
			return t;
	return 10.0;
}

DOUBLE CFootballBall::GetHeight()
{
	if (!m_bBallMoves)
		return 0.0;
	else
		return GetAltitude((m_CurrTime-m_KickTime)/1000.0,m_Speed,m_AlphaV,m_Height);
}

DOUBLE CFootballBall::GetAltitude(DOUBLE t, DOUBLE velocity, DOUBLE angle, DOUBLE h0)
{
	if(angle<MINIMUM_ANGLE)
		return 0.0;
	DOUBLE t0 = Solve(velocity,angle,h0);
	if (t<t0)
		return z(t,velocity,angle,h0);
	else
		return GetAltitude(t-t0,velocity*BOUNCE_SPEED_FACTOR,angle,h0);
}


DWORD CFootballBall::GetKickTime()
{
	return  m_CurrTime - m_KickTime;
}
/*
DWORD CFootballBall::GetBallTeamSide()
{
	if(M_Kicker!=NULL)
		return M_Kicker->GetTeamSide();
	if(m_HaveBallPlayer!=NULL)
		return m_HaveBallPlayer->GetTeamSide();
	return TS_NONE;
}


DWORD CFootballBall::GetHaveBallTeamSide()
{
	if(m_HaveBallPlayer!=NULL)
		return m_HaveBallPlayer->GetTeamSide();
	return TS_NONE;
}
*/

const DWORD NULLPOINTER	 = -1;

void CFootballBall::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		m_Loc.Serialize(ar);
		ar << m_AlphaH << m_AlphaV << m_bBallMoves << m_Height << m_Speed 
			<< m_CurrTime << m_KickTime;
		if(m_pControlBallPlayer)
			ar << m_pControlBallPlayer->GetTeam()->GetTeamNo() 
				<< m_pControlBallPlayer->GetPlayerNo();
		else
			ar << NULLPOINTER << NULLPOINTER;

		if(m_pKicker)
			ar << m_pKicker->GetTeam()->GetTeamNo() 
				<< m_pKicker->GetPlayerNo();
		else 
			ar << NULLPOINTER<< NULLPOINTER;
	}
	else
	{
		m_Loc.Serialize(ar);
		ar >> m_AlphaH >> m_AlphaV >> m_bBallMoves >> m_Height >> m_Speed 
			>> m_CurrTime >> m_KickTime;
		DWORD TeamNo,PlayerNo;
		ar >> TeamNo >> PlayerNo;
		if(TeamNo != NULLPOINTER)
			m_pControlBallPlayer	= m_pMatch->GetTeamNo(TeamNo)->GetPlayer(PlayerNo);
		else 
			m_pControlBallPlayer	= NULL;
		ar >> TeamNo >> PlayerNo;
		if(TeamNo != NULLPOINTER)
			m_pKicker				= m_pMatch->GetTeamNo(TeamNo)->GetPlayer(PlayerNo);
		else
			m_pKicker				= NULL;
	}
}
/*
void CFootballBall::Load(CDFile &file)
{
	m_Loc.Load(file);
	m_Speed		= file.ReadDOUBLE();
	m_Height	= file.ReadDOUBLE();
	m_AlphaH	= file.ReadDOUBLE();
	m_AlphaV	= file.ReadDOUBLE();
	int Time	= file.ReadDWORD();
	m_KickTime	= m_CurrTime - Time;
	m_bBallMoves = file.ReadDWORD();
//	CFootballPlayer*	M_Kicker;
//	CFootballPlayer*	m_HaveBallPlayer;
//	CSurface*	m_BallSurface;
}

void CFootballBall::Save(CDFile &file)
{
	m_Loc.Save(file);
	file.WriteDOUBLE(m_Speed);
	file.WriteDOUBLE(m_Height);
	file.WriteDOUBLE(m_AlphaH);
	file.WriteDOUBLE(m_AlphaV);
	file.WriteDWORD(m_CurrTime - m_KickTime);
	file.WriteDWORD(m_bBallMoves);
//	CFootballPlayer*	M_Kicker;
//	CFootballPlayer*	m_HaveBallPlayer;
//	CSurface*	m_BallSurface;
}

*/

CFootballPlayer* CFootballBall::GetKicker()
{
	return m_pKicker;
}

CFootballPlayer* CFootballBall::GetControlBallPlayer()
{
	return m_pControlBallPlayer;
}

void CFootballBall::SetControlBallPlayer(CFootballPlayer *Player)
{
	//Player->SetSpeed(Player->GetSpeed()-CONTROLBALL_DELAY_SPEED);
	m_Loc = Player->GetLocation();
	m_Speed = Player->GetSpeed();
	m_Height = 0;
	m_AlphaV = 0;
	m_AlphaH = Dir2Rad(Player->GetDirection());
	m_bBallMoves	= FALSE;
	m_pKicker		= NULL;
	//if(m_pControlBallPlayer)
	//	m_pControlBallPlayer->SetSpeed(m_pControlBallPlayer->GetSpeed()+CONTROLBALL_DELAY_SPEED);
	m_pControlBallPlayer	= Player;
	m_pMatch->GetScore()->DoResult(Player);
}

CFootballTeam* CFootballBall::GetBallTeam()
{
	if(m_pControlBallPlayer) return m_pControlBallPlayer->GetTeam();
	else if(m_pKicker) return m_pKicker->GetTeam();
	else return NULL;
}

CLocation CFootballBall::GetDestLocation()
{
	if(m_pControlBallPlayer != NULL && 
	  (m_pControlBallPlayer != m_pKicker || m_CurrTime - m_KickTime > MINIMUN_SHOOT_TIME))
		return m_pControlBallPlayer->GetLocation();
	else if(!m_bBallMoves)
		return m_Loc;
	else
	{
		DOUBLE x;
		if(m_AlphaV>MINIMUM_ANGLE)
			x = GetParabollicDistance(1000.0,m_Speed,m_AlphaV,m_Height);
		else 
			x = GetHorizontalDistance(1000.0,m_Speed);

		DOUBLE xLoc = m_Loc.x + x*cos(m_AlphaH);
		DOUBLE yLoc = m_Loc.y + x*sin(m_AlphaH);
		
		return CLocation(
			(xLoc>GROUND_HEIGHT+2)?GROUND_HEIGHT+2:(xLoc<0-2?0-2:xLoc),
			(yLoc>GROUND_WIDTH +2)?GROUND_WIDTH +2:(yLoc<0-2?0-2:yLoc));
	}
}

DWORD CFootballBall::GetDirection()
{
	for(int i=0;i<8;i++)
	{
		if(Dir2Rad(DirNo2Dir(i)) == m_AlphaH)
			return DirNo2Dir(i);
	}
	return DirNo2Dir(0);
}

BOOL CFootballBall::IsBallMove()
{
	return (m_pControlBallPlayer) || m_bBallMoves;
}
