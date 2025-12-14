// FootballPlayer.cpp: implementation of the CFootballPlayer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballPlayer.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballPlayer,CObject,1)

CFootballPlayer::CFootballPlayer()
{
	strcpy(m_PlayerName,"Default");
	m_PlayerNo	= -1;
	m_Direction = NORTH;
	m_Speed		= 0;
	m_pTeam		= NULL;

	m_pNumSurface = NULL;
}

CFootballPlayer::CFootballPlayer(TCHAR* szPlayerName,DWORD PlayerNo,CFootballTeam* pTeam)
{
	strcpy(m_PlayerName,szPlayerName);
	m_PlayerNo	= PlayerNo;
	m_Direction = NORTH;
	m_Speed		= 0;
	m_pTeam		= pTeam;

	m_pNumSurface = NULL;
}

CFootballPlayer::~CFootballPlayer()
{
}

HRESULT CFootballPlayer::CreateSurface(CDisplay *pDisplay)
{
	HRESULT	hr;
	TCHAR	NumberStr[60];
	HFONT	hFont = CreateFont(13,0,0,400,FW_DONTCARE,FALSE,FALSE,FALSE,ANSI_CHARSET,
		OUT_CHARACTER_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"System");
/*#ifdef _DEBUG
	sprintf(NumberStr,"%d %2.1f:%2.1f",m_PlayerNo,99.99,99.99);
#else*/
	sprintf(NumberStr,"%d",m_PlayerNo);
/*#endif*/
	if(FAILED(hr = pDisplay->CreateSurfaceFromText(&m_pNumSurface,hFont,NumberStr,RGB(0,0,0),RGB(255,255,255))))
		return hr;
	if(FAILED(hr = m_pNumSurface->SetColorKey(RGB(0,0,0))))
		return hr;
	DeleteObject(hFont);
	return S_OK;
}

void CFootballPlayer::ReleaseSurface()
{
	SAFE_DELETE(m_pNumSurface);
}

void CFootballPlayer::Update(DWORD dwTickDiff)
{
	m_CurrTime += dwTickDiff;
}

HRESULT CFootballPlayer::Draw(CSurface *pSurface, POINT ptStart)
{
	HRESULT hr;
	static DWORD STEPS[] = {1,2,3,4,3,2};
	int Dir = DirectionNo(m_Direction);
	DWORD CurrentStep = ((DWORD)GetRunDistance())%6;
	CSurface* pPlayerSurface;
	if(m_Speed == 0)
		pPlayerSurface = m_pTeam->GetPlayerSurface(Dir,0);
	else
		pPlayerSurface = m_pTeam->GetPlayerSurface(Dir,STEPS[CurrentStep]);
	CLocation Loc = GetLocation();
	RECT rc;
	SetRect(&rc,ptStart.x+CFootballMatch::ConvX(Loc.x-PLAYER_RADIUS)	,ptStart.y+CFootballMatch::ConvY(Loc.y-PLAYER_RADIUS),
				ptStart.x+CFootballMatch::ConvX(Loc.x+PLAYER_RADIUS)	,ptStart.y+CFootballMatch::ConvY(Loc.y+PLAYER_RADIUS));
	LPDIRECTDRAWSURFACE7 pddsSurface = pSurface->GetDDrawSurface(); 
	if(FAILED(hr = pddsSurface->Blt(&rc,pPlayerSurface->GetDDrawSurface(),NULL,DDBLT_KEYSRC,NULL)))
		return hr;

/*#ifdef _DEBUG
	HDC hDC; 
	if(FAILED(hr = pddsSurface->GetDC(&hDC)))
		return hr;
	Ellipse(hDC,ptStart.x+CFootballMatch::ConvX(Loc.x)-2,ptStart.y+CFootballMatch::ConvY(Loc.y)-2,
			    ptStart.x+CFootballMatch::ConvX(Loc.x)+2,ptStart.y+CFootballMatch::ConvY(Loc.y)+2);
	if(FAILED(hr = pddsSurface->ReleaseDC(hDC)))
		return hr;

	TCHAR	NumberStr[10];
	HFONT	hFont = CreateFont(13,0,0,400,FW_DONTCARE,FALSE,FALSE,FALSE,ANSI_CHARSET,
		OUT_CHARACTER_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"System");
	sprintf(NumberStr,"%d %2.1f:%2.1f",m_PlayerNo,m_Loc.x,m_Loc.y);
	m_pNumSurface->DrawText(hFont,NumberStr,0,0,RGB(0,0,0),RGB(255,255,255));
	m_pNumSurface->SetColorKey(RGB(0,0,0));
	DeleteObject(hFont);
#endif
*/
	if(FAILED(pSurface->Blt(rc.left+20,rc.top+20,m_pNumSurface)))
		return hr;

	return S_OK;
}

HRESULT CFootballPlayer::DrawShadow(CSurface* pSurface,POINT ptStart)
{
	HDC hDC;
	HRESULT hr;
	CLocation Loc = GetLocation();
	LPDIRECTDRAWSURFACE7 pddsSurface = pSurface->GetDDrawSurface(); 
	if(FAILED(hr = pddsSurface->GetDC(&hDC)))	return hr;

	HPEN hPen = CreatePen(PS_SOLID,1,SHADOW_COLOR);
	HPEN hOldPen = (HPEN)SelectObject(hDC,hPen);
	HBRUSH hBrush = CreateSolidBrush(SHADOW_COLOR);
	HBRUSH hOldBrush = (HBRUSH)SelectObject(hDC,hBrush);
	Ellipse(hDC,ptStart.x+CFootballMatch::ConvX(Loc.x-PLAYER_RADIUS/2),
				ptStart.y+CFootballMatch::ConvY(Loc.y-PLAYER_RADIUS/2),
				ptStart.x+CFootballMatch::ConvX(Loc.x+PLAYER_RADIUS/2),
				ptStart.y+CFootballMatch::ConvY(Loc.y+PLAYER_RADIUS/2));
	
	HPEN hPlayerPen = CreatePen(PS_SOLID,3,RGB(255,10,0));
	HBRUSH hHallowBrush = (HBRUSH)GetStockObject(HOLLOW_BRUSH);
	SelectObject(hDC,hPlayerPen);
	SelectObject(hDC,hHallowBrush);
	Ellipse(hDC,ptStart.x+CFootballMatch::ConvX(Loc.x-PLAYER_RADIUS),
				ptStart.y+CFootballMatch::ConvY(Loc.y-PLAYER_RADIUS),
				ptStart.x+CFootballMatch::ConvX(Loc.x+PLAYER_RADIUS),
				ptStart.y+CFootballMatch::ConvY(Loc.y+PLAYER_RADIUS));
	SelectObject(hDC,hOldPen);
	SelectObject(hDC,hOldBrush);
	DeleteObject(hPen);
	DeleteObject(hBrush);

	if(FAILED(hr = pddsSurface->ReleaseDC(hDC)))	return hr;
	return S_OK;
}

DOUBLE CFootballPlayer::GetRunDistance ()
{
	return (m_CurrTime-m_RunningTime)/1000.0 * m_Speed;
}


void CFootballPlayer::DoRuns()
{
	if(m_Speed == 0)
	{
		m_RunningTime	= m_CurrTime;
		m_Speed			= 6.0*1.0*2.5;
	}
}

void CFootballPlayer::DoRunsTo(CLocation DestLoc)
{
	DWORD Dir = GetDirectionTo(DestLoc,0.2);
	CLocation  SrcLoc = GetLocation();
	if(CloserLoc(DestLoc, 0.7))
	{
		SetLocation(CLocation((DestLoc.x + SrcLoc.x)/2,(DestLoc.y + SrcLoc.y)/2));
		DoStops();
	} else
	{
		SetDirection(Dir);
		DoRuns();
	}

}

BOOL CFootballPlayer::CloserLoc(CLocation Loc, DOUBLE Range)
{
	CLocation thisLoc = GetLocation();
	return (
		fabs(thisLoc.x - Loc.x) < Range &&
		fabs(thisLoc.y - Loc.y) < Range );

}

void CFootballPlayer::DoStops()
{
	if(m_Speed != 0)
	{
		m_Loc = GetLocation();
		m_Speed = 0.0;
	}
}

DWORD CFootballPlayer::GetPlayerNo()
{
	return m_PlayerNo;
}

void CFootballPlayer::SetPlayerNo(DWORD PlayerNo)
{
	m_PlayerNo = PlayerNo;
}

DWORD CFootballPlayer::GetDirection()
{
	return m_Direction;
}

void CFootballPlayer::SetDirection(DWORD Direction)
{
	if(m_Direction != Direction)
	{
		m_Loc = GetLocation();
		m_RunningTime = m_CurrTime;
		m_Direction = Direction;
	}
}

DOUBLE CFootballPlayer::GetSpeed()
{
	return m_Speed;
}

void CFootballPlayer::SetSpeed(DOUBLE Speed)
{
	m_Speed = Speed;
}

BOOL CFootballPlayer::CanTouch (CFootballBall* pBall)
{
	CLocation Loc = GetLocation();
	return (
		fabs(Loc.x - pBall->GetLocation().x) < CANTOUCH_RANGE &&// < 0.5 && 
		fabs(Loc.y - pBall->GetLocation().y) < CANTOUCH_RANGE //< 0.5
		&& pBall->GetHeight() < PLAYER_HEIGHT
		);
}

void CFootballPlayer::SetLocation(CLocation Loc)
{
	m_Loc = Loc;
	m_Speed = 0;
}

CLocation CFootballPlayer::GetLocation()
{
	int Speed = (GetTeam()->GetMatch()->GetBall()->GetControlBallPlayer() == this)?
		((m_Speed)?m_Speed - 2:0):m_Speed;
	long Delta = m_CurrTime - m_RunningTime;
	switch(m_Direction)
	{
	case NORTH:
		return CLocation(m_Loc.x, m_Loc.y - Speed*Delta/1000.0);
	case SOUTH:
		return CLocation(m_Loc.x, m_Loc.y + Speed*Delta/1000.0);
	case WEST:
		return CLocation(m_Loc.x - Speed*Delta/1000.0, m_Loc.y);
	case EAST:
		return CLocation(m_Loc.x + Speed*Delta/1000.0, m_Loc.y);
	case NORTH_EAST:
		return CLocation(m_Loc.x + Speed*Delta/1000.0*cos(PI/4.0),
					  m_Loc.y - Speed*Delta/1000.0*cos(PI/4.0));
	case SOUTH_EAST:
		return CLocation(m_Loc.x + Speed*Delta/1000.0*cos(PI/4.0),
					  m_Loc.y + Speed*Delta/1000.0*cos(PI/4.0));
	case NORTH_WEST:
		return CLocation(m_Loc.x - Speed*Delta/1000.0*cos(PI/4.0),
					  m_Loc.y - Speed*Delta/1000.0*cos(PI/4.0));
	case SOUTH_WEST:
		return CLocation(m_Loc.x - Speed*Delta/1000.0*cos(PI/4.0),
					  m_Loc.y + Speed*Delta/1000.0*cos(PI/4.0));
	default:
		return m_Loc;
	}
}

/*
DWORD CFootballPlayer::GetTeamSide()
{
	return m_Team->GetTeamSide();
}
*/

DWORD CFootballPlayer::GetDirectionTo(CLocation DestLoc,DOUBLE Range)
{
	DWORD Direction = NO_DIRECTION;
	CLocation Loc = GetLocation();

	if (DestLoc.x - Loc.x > Range)
		Direction += EAST;
	else if(Loc.x - DestLoc.x > Range)
		Direction += WEST;
	
	if (DestLoc.y - Loc.y > Range)
		Direction += SOUTH;
	else if (Loc.y - DestLoc.y > Range)
		Direction += NORTH;
	
	return Direction;
}

void CFootballPlayer::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		ar.Write(m_PlayerName,sizeof(m_PlayerName));
		ar << m_Direction << m_PlayerNo << m_RunningTime 
			<< m_CurrTime << m_Speed;
		m_Loc.Serialize(ar);
	}
	else
	{
		ar.Read(m_PlayerName,sizeof(m_PlayerName));
		ar >> m_Direction >> m_PlayerNo >> m_RunningTime 
			>> m_CurrTime >> m_Speed;
		m_Loc.Serialize(ar);
	}
}
/*
void CFootballPlayer::SetPlayerName(TCHAR* PlayerName)
{ 
	SAFE_DELETE(m_PlayerName);
	m_PlayerName = strdup(PlayerName); 
}

void CFootballPlayer::Load(CDFile &file)
{
	DWORD Len;
	TCHAR Str[100];
	
	Len = file.ReadDWORD();
	file.Read(Str,Len+1);
	SetPlayerName(Str);
	m_Speed		= file.ReadDOUBLE();
	m_Health	= file.ReadDOUBLE();
	m_Direction	= file.ReadDWORD();
	m_Behaviour	= file.ReadDWORD();
	m_PlayerNo	= file.ReadDWORD();
	int Time	= file.ReadDWORD();
	m_RunningTime = g_App->GetLastTick() - Time;
	m_Loc.Load(file);
}

void CFootballPlayer::Save(CDFile &file)
{
	DWORD Len;

	Len = strlen(GetPlayerName());
	file.WriteDWORD(Len);
	file.Write(GetPlayerName(),Len+1);
	file.WriteDOUBLE(m_Speed);
	file.WriteDOUBLE(m_Health);
	file.WriteDWORD(m_Direction);
	file.WriteDWORD(m_Behaviour);
	file.WriteDWORD(m_PlayerNo);
	file.WriteDWORD(m_RunningTime-g_App->GetLastTick());
	m_Loc.Save(file);
	//CFootballTeam* m_Team;
}
*/
