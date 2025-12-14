// FootballTeam.cpp: implementation of the CFootballTeam class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballTeam.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CLocation CFootballTeam::GoalPos[][2] = {
	{	CLocation(0,HALF_GROUND_WIDTH+HALF_BOX_WIDTH),	
		CLocation(GROUND_HEIGHT,HALF_GROUND_WIDTH+HALF_BOX_WIDTH)},
	{	CLocation(0,HALF_GROUND_WIDTH-HALF_BOX_WIDTH),
		CLocation(GROUND_HEIGHT,HALF_GROUND_WIDTH-HALF_BOX_WIDTH)},
};

CLocation CFootballTeam::GoalPoint[] = {
		CLocation(0,HALF_GROUND_WIDTH),
		CLocation(GROUND_HEIGHT,HALF_GROUND_WIDTH)
};

CFootballTeam::CFootballTeam(TCHAR* strTeamName,CFootballTactic* pTactic)
{
	m_TeamNo = 0;
	strcpy(m_TeamName,strTeamName);
	m_pMatch = NULL;
	m_pTactic = pTactic;
	m_pTactic->SetTeam(this);
	CreateDefaultTeam();
	ZeroMemory(m_pPlayerSurface,sizeof(m_pPlayerSurface));
}

CFootballTeam::~CFootballTeam()
{
	ReleaseSurface();
	DestroyTeam();
	SAFE_DELETE(m_pTactic);
}

HRESULT CFootballTeam::CreateSurface(CDisplay *pDisplay)
{
	ASSERT(m_TeamNo == TEAM1 || m_TeamNo == TEAM2);
	HRESULT hr;
	char szFormat[128];
	char szFileName[128];
	char Dir[][10] = {"north","northeast","east","southeast",
					  "south","southwest","west","northwest"};
	if(m_TeamNo == TEAM1) 
		strcpy(szFormat,"Resource\\player_%s%d.bmp");
	else if(m_TeamNo == TEAM2)
		strcpy(szFormat,"Resource\\player2%s%d.bmp");
	for(int d=0;d<8;d++)	
		for(int i=0;i<5;i++)
		{
			wsprintf(szFileName,szFormat,Dir[d],i);
			if(FAILED(hr = pDisplay->CreateSurfaceFromBitmap(&m_pPlayerSurface[d][i],szFileName,0,0)))
				return hr;
			m_pPlayerSurface[d][i]->SetColorKey(RGB(192,192,192));
		}
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
		m_pPlayer[i]->CreateSurface(pDisplay);
	return S_OK;
}

void CFootballTeam::ReleaseSurface()
{
	for(int d=0;d<8;d++)
		for(int i=0;i<5;i++)
			SAFE_DELETE(m_pPlayerSurface[d][i]);
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
		m_pPlayer[i]->ReleaseSurface();
}

void CFootballTeam::Update(DWORD dwTickDiff)
{
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
		if(m_pPlayer[i]) m_pPlayer[i]->Update(dwTickDiff);
}

HRESULT CFootballTeam::Draw(CSurface *pSurface, POINT ptStart)
{
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
		if(m_pPlayer[i]) m_pPlayer[i]->Draw(pSurface, ptStart);
	return S_OK;
}

void CFootballTeam::CreateDefaultTeam()
{
	CFootballPlayer* Player;
	TCHAR szPlayerName[20];
	for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		switch (PlayerNo)
		{
		case 0:  
			strcpy(szPlayerName,"Goal");
			Player = new CFootballGoalKeeper(szPlayerName,PlayerNo,this);
			break;
		default: 
			wsprintf(szPlayerName,"Player%d",PlayerNo);
			Player = new CFootballPlayer(szPlayerName,PlayerNo,this);
			break;
		}
		SetPlayer(Player,PlayerNo);
	}
}

void CFootballTeam::DestroyTeam()
{
	for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		SAFE_DELETE(m_pPlayer[PlayerNo]);
}

void CFootballTeam::SetPlayer(CFootballPlayer* pPlayer,DWORD PlayerNo)
{
	ASSERT(pPlayer != NULL && PlayerNo>=0 && PlayerNo<NUMBER_OF_PLAYERS);
	m_pPlayer[PlayerNo] = pPlayer;
}

CFootballPlayer* CFootballTeam::GetCloserPlayer(CLocation Loc)
{
	CFootballPlayer* CloserPlayer = NULL;
	DOUBLE Distance,MaxDistance = DBL_MAX;
	for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		if(m_pPlayer[PlayerNo]!=NULL)
		{
			CLocation PlayerLoc = m_pPlayer[PlayerNo]->GetLocation();
			Distance = POW2(PlayerLoc.x-Loc.x)+
					   POW2(PlayerLoc.y-Loc.y);
			if(Distance<MaxDistance)
			{
				MaxDistance = Distance;
				CloserPlayer = m_pPlayer[PlayerNo];
			}
		}
	}
	return CloserPlayer;
}

BOOL CFootballTeam::Shoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTeam* Team)
{
	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	CLocation BallLoc = BallPlayer->GetLocation();
	DWORD TeamSide = Team->GetTeamSide();	
	for(int i=0;i<8;i++)
	{
		DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
		CLocation DestLoc = CLocation(BallLoc.x + CAN_PASS_RANGE*cos(Angle),
									  BallLoc.y + CAN_PASS_RANGE*sin(Angle));
		if(LineIntersect(BallLoc,DestLoc,GoalPos[0][!TeamSide],GoalPos[1][!TeamSide]) && 
			!IsPlayerCanTouchPath(BallLoc,DestLoc,OppPlayerList,2.0))
			break;
	}
	if(i!=8)
	{
		BallPlayer->SetDirection(DirNo2Dir(i));
		Ball->Shoot(BallPlayer,SHOOTSPEED,SHOOTANGLE);
		return FALSE;
	}

	CFootballPlayer* ForwardPass[NUMBER_OF_PLAYERS]; DWORD ForwardPassCount = 0;
	for(i=0;i<8;i++)
	{
		DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
		CLocation DestLoc = CLocation(BallLoc.x + CAN_PASS_RANGE*cos(Angle),
									  BallLoc.y + CAN_PASS_RANGE*sin(Angle));
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			CLocation Loc = PlayerList[PlayerNo]->GetLocation();
			if(DistanceLinePoint(BallLoc,DestLoc,Loc) < 0.5 && 
				!IsPlayerCanTouchPath(BallLoc,DestLoc,OppPlayerList,1.0) && 
				BallPlayer->GetDirectionTo(Loc,2.0) & ((TeamSide)?WEST:EAST))
				ForwardPass[ForwardPassCount++] = PlayerList[PlayerNo];
		}
	}

	if(ForwardPassCount)
	{
		DWORD ReceiveBallPlayerNo = rand()%ForwardPassCount;
		DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
		Ball->Shoot(BallPlayer, SHOOTSPEED,SHOOTANGLE);
		BallPlayer->DoStops();
		return TRUE;
	}
	if(CountPlayer(BallPlayer,OppPlayerList,8,(TeamSide)?WEST:EAST)>1)
	{
		CFootballPlayer* BackwardPass[NUMBER_OF_PLAYERS]; DWORD BackwardPassCount = 0;
		for(i=0;i<8;i++)
		{
			DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
			CLocation DestLoc = CLocation(BallLoc.x + CAN_PASS_RANGE*cos(Angle),
										  BallLoc.y + CAN_PASS_RANGE*sin(Angle));
			for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
			{
				CLocation Loc = PlayerList[PlayerNo]->GetLocation();
				if(DistanceLinePoint(BallLoc,DestLoc,Loc) < 0.5 && 
					!IsPlayerCanTouchPath(BallLoc,DestLoc,OppPlayerList,1.0) && 
					BallPlayer->GetDirectionTo(Loc,2.0) & ((!TeamSide)?WEST:EAST))
					BackwardPass[BackwardPassCount++] = PlayerList[PlayerNo];
			}
		}
		if(BackwardPassCount)
		{
			DWORD ReceiveBallPlayerNo = rand()%BackwardPassCount;
			DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
			Ball->Shoot(BallPlayer, SHOOTSPEED,SHOOTANGLE);
			BallPlayer->DoStops();
			return TRUE;
		}
	}
	return FALSE;
}

CLocation CFootballTeam::FindEmptyArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
						CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir)
{
	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	CLocation BallLoc = (BallPlayer)?BallPlayer->GetLocation():Ball->GetLocation();
	DOUBLE Angle = Dir2Rad(Dir);
	DOUBLE Scan  = 0;
	DOUBLE Sign  = -1;
	DOUBLE Range = 20;
	while(Range>3)
	{
		while(Scan < 90*PI/180)
		{
			if(Sign == +1)  Sign = -1; else 
			{
				Sign = 1;
				Scan += PI/180;
			}
			CLocation DestLoc = CLocation(BallLoc.x + Range*cos(Angle+Scan*Sign),
										  BallLoc.y + Range*sin(Angle+Scan*Sign));
			if(DestLoc.x<0 || DestLoc.x>GROUND_HEIGHT) continue;
			if(DestLoc.y<0 || DestLoc.y>GROUND_WIDTH) continue;
			for(DWORD OppPlayerNo=0;OppPlayerNo<NUMBER_OF_PLAYERS;OppPlayerNo++)
			{
				if(Distance(DestLoc,OppPlayerList[OppPlayerNo]->GetLocation())<20)
					break;
			}
			if(OppPlayerNo != NUMBER_OF_PLAYERS) continue;
			for(DWORD AssignNo=0;AssignNo<AssignLocCount;AssignNo++)
			{
				if(Distance(DestLoc,AssignLoc[AssignNo])<40)
					break;
			}
			if(AssignNo != AssignLocCount) continue;
			return DestLoc;
		}
		Range -= 1;
	}
	return BallLoc;
}

CLocation CFootballTeam::FindPassArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
					   CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir)
{
	DWORD BallPlayer = FindPlayer(OppPlayerList,Ball->GetControlBallPlayer());
	CLocation BallLoc = Ball->GetLocation();
	CFootballPlayer* PassPlayer[NUMBER_OF_PLAYERS]; DWORD PassPlayerCount = 0;	
	for(DWORD OppPlayerNo=0;OppPlayerNo<NUMBER_OF_PLAYERS;OppPlayerNo++)
	{
		if(OppPlayerList[OppPlayerNo]->GetDirectionTo(BallLoc,2.0) & Dir)
			PassPlayer[PassPlayerCount++] = OppPlayerList[OppPlayerNo];
	}

	if(PassPlayerCount)
	{
		for(DWORD PassPlayerNo=0;PassPlayerNo<PassPlayerCount;PassPlayerNo++)
		{
			CLocation DestLoc = PassPlayer[PassPlayerNo]->GetLocation();
			for(DWORD AssignNo=0;AssignNo<AssignLocCount;AssignNo++)
			{
				if(Distance(DestLoc,AssignLoc[AssignNo])<15)
					break;
			}
			if(AssignNo == AssignLocCount) return DestLoc;
		}
	}
	return CLocation(0,0);
}

void CFootballTeam::DoGoalKeeper(CFootballPlayer* PlayerList[],CFootballBall* Ball)
{
	CFootballPlayer* OppPlayerList[NUMBER_OF_PLAYERS];
	memcpy(OppPlayerList,GetMatch()->GetOppositTeam(this)->GetPlayerList(),sizeof(OppPlayerList));
	CLocation GoalPoint[] = {
		CLocation(2,HALF_GROUND_WIDTH),
		CLocation(GROUND_HEIGHT-2,HALF_GROUND_WIDTH)
	};

	DWORD Dir;
	CLocation GoalLoc = GetPlayer(0)->GetLocation();
	CLocation BallLoc = Ball->GetLocation();
	if(GetPlayer(0) == Ball->GetControlBallPlayer())
	{
		Shoot(PlayerList,OppPlayerList,Ball,this);
	} else if(GetTeamSide() == LEFTSIDE && BallLoc.x<PENALTY_BOX_HEIGHT && 
		BallLoc.y>HALF_GROUND_WIDTH-PENALTY_BOX_HEIGHT && 
		BallLoc.y<HALF_GROUND_WIDTH+PENALTY_BOX_HEIGHT)
	{
		Dir = GetPlayer(0)->GetDirectionTo(BallLoc,1.0);
		if(Dir != NO_DIRECTION)
		{
			GetPlayer(0)->SetDirection(Dir);
			GetPlayer(0)->DoRuns();
		} else
		{
			//Ball->SetControlBallPlayer(GetPlayer(0));
			GetPlayer(0)->DoStops();
		}
	}
	else if(GetTeamSide() && 
			BallLoc.x>GROUND_HEIGHT-PENALTY_BOX_HEIGHT && 
			BallLoc.y>HALF_GROUND_WIDTH-PENALTY_BOX_HEIGHT && 
			BallLoc.y<HALF_GROUND_WIDTH+PENALTY_BOX_HEIGHT)
	{
		Dir = GetPlayer(0)->GetDirectionTo(BallLoc,1.0);
		if(Dir != NO_DIRECTION)
		{
			GetPlayer(0)->SetDirection(Dir);
			GetPlayer(0)->DoRuns();
		}
		else
		{
			//Ball->SetControlBallPlayer(GetPlayer(0));
			GetPlayer(0)->DoStops();
		}
	}
	else if(!GetPlayer(0)->CloserLoc(GoalPoint[GetTeamSide()],0.2))
	{
		GetPlayer(0)->DoRunsTo(GoalPoint[GetTeamSide()]);
	} 
	else 
	{
		GetPlayer(0)->DoStops();
		GetPlayer(0)->SetDirection(GetTeamSide()?WEST:EAST);
	}
}

void CFootballTeam::SetTactic(CFootballTactic* pTactic)
{
	SAFE_DELETE(m_pTactic);
	m_pTactic = pTactic;
	m_pTactic->SetTeam(this);
}

BOOL CFootballTeam::IsMove()
{
	for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		if(m_pPlayer[PlayerNo] && m_pPlayer[PlayerNo]->GetSpeed()!=0)
			return TRUE;
	return FALSE;
}

void CFootballTeam::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		ar.Write(m_TeamName,sizeof(m_TeamName));
		ar << m_TeamNo;
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
			m_pPlayer[PlayerNo]->Serialize(ar);
		m_pTactic->Serialize(ar);
	}
	else
	{
		ar.Read(m_TeamName,sizeof(m_TeamName));
		ar >> m_TeamNo;
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			m_pPlayer[PlayerNo]->Serialize(ar);
			m_pPlayer[PlayerNo]->SetTeam(this);
		}
		m_pTactic->Serialize(ar);
		m_pTactic->SetTeam(this);
	}
}

CFootballPlayer* CFootballTeam::GetPlayer(DWORD PlayerNo)
{
	ASSERT(PlayerNo>=0 && PlayerNo<=NUMBER_OF_PLAYERS);
	return m_pPlayer[PlayerNo];
}

CSurface* CFootballTeam::GetPlayerSurface(DWORD Dir, DWORD Frame)
{
	ASSERT(Dir>=0 && Dir<8 && Frame>=0 && Frame<5);
	return m_pPlayerSurface[Dir][Frame];
}

BOOL CFootballTeam::IsDefend()
{
	return GetMatch()->GetDefendTeam() == this;
}

BOOL CFootballTeam::IsLeftTeam()
{
	return GetMatch()->GetTeamSide(LEFTSIDE) == this;
}

TCHAR* CFootballTeam::GetType()
{
	return "Default";
}

void CFootballTeam::InitialTeam()
{

}

void CFootballTeam::DeinitialTeam()
{

}