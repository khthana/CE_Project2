// FootballTeamControl.cpp: implementation of the CFootballTeamControlControl class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "football.h"
#include "FootballTeamControl.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballTeamControl,CObject,0)

CFootballTeamControl::CFootballTeamControl(TCHAR* strTeamName,CFootballTactic* pTactic)
: CFootballTeam(strTeamName,pTactic)
{
	m_pControlPlayer = NULL;
}

CFootballTeamControl::~CFootballTeamControl()
{
}

CLocation CFootballTeamControl::FindEmptyArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
						CLocation AssignLoc[],DWORD AssignLocCount,DWORD Dir)
{
	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	CLocation BallLoc = (BallPlayer)?BallPlayer->GetLocation():Ball->GetLocation();
	CFootballTactic* Tactic = GetTactic();
	for(int j=0;j<3;j++)
	{
		CLocation AreaLoc = GetAreaLoc(j*4+3);
		if(InAreaNo(BallLoc,3) || InAreaNo(BallLoc,7) || InAreaNo(BallLoc,11))
		{
			for(DWORD AssignNo=0;AssignNo<AssignLocCount;AssignNo++)
				if(InAreaNo(AssignLoc[AssignNo],j*4+3)) 
					break;
			if(AssignNo == AssignLocCount)
				return AreaLoc;
		}
	}
	for(int i=2;i>=0;i--)
	{
		for(int j=0;j<3;j++)
		{

			CLocation AreaLoc = GetAreaLoc(j*4+i+1);
			if(InAreaNo(BallLoc,0+i) || InAreaNo(BallLoc,4+i) || InAreaNo(BallLoc,8+i))
			{
				for(DWORD AssignNo=0;AssignNo<AssignLocCount;AssignNo++)
					if(InAreaNo(AssignLoc[AssignNo],j*4+(i+5)%4)) 
						break;
				if(AssignNo == AssignLocCount)
					return AreaLoc;
			}
		}
	}
	return CLocation(0,0);
}

void CFootballTeamControl::DoOffend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTactic* Tactic)
{
	CFootballPlayer* UnAssignPlayerList[NUMBER_OF_PLAYERS];
	memcpy(UnAssignPlayerList,PlayerList,sizeof(UnAssignPlayerList));
	
	CLocation AssignLoc[NUMBER_OF_PLAYERS]; DWORD AssignLocCount = 0;
	CLocation ShouldToGoLoc[NUMBER_OF_PLAYERS];

	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	if(BallPlayer) // Offend with Ball
	{
		if(BallPlayer != GetControlPlayer()) 
			DoShoot(PlayerList,OppPlayerList,Ball,Tactic); // Calculate to Pass ball;
		DWORD BallPlayerNo = FindPlayer(PlayerList,BallPlayer);
		AssignLoc[AssignLocCount++] = BallPlayer->GetLocation();
		UnAssignPlayerList[BallPlayerNo] = NULL;
	} else
	{
		CLocation	BallLoc		= Ball->GetLocation();
		CLocation	BallDestLoc = Ball->GetDestLocation();
		DWORD		PlayerCloser = FindCloserPlayer(PlayerList,BallDestLoc);

		AssignLoc[AssignLocCount++] = BallLoc;
		ShouldToGoLoc[PlayerCloser]	= BallLoc;
		UnAssignPlayerList[PlayerCloser] = NULL;
	}

	for(int i=0;i<2;i++)
	{
		CLocation EmptyArea = FindEmptyArea(Ball,UnAssignPlayerList,OppPlayerList,AssignLoc,AssignLocCount,(GetTeamSide()?WEST:EAST));// Find Empty Area
		if(EmptyArea == CLocation(0,0))
			break;
		DWORD PlayerCloser = FindCloserPlayer(UnAssignPlayerList,EmptyArea);
		if(PlayerCloser == NUMBER_OF_PLAYERS)
			break;
		AssignLoc[AssignLocCount++] = EmptyArea;
		ShouldToGoLoc[PlayerCloser]	= EmptyArea;
		UnAssignPlayerList[PlayerCloser] = NULL;		
	}
	for(i=0;i<1;i++)
	{
		CLocation EmptyArea = FindEmptyArea(Ball,UnAssignPlayerList,OppPlayerList,AssignLoc,AssignLocCount,(!GetTeamSide()?WEST:EAST));// Find Empty Area
		DWORD PlayerCloser = FindCloserPlayer(UnAssignPlayerList,EmptyArea);
		if(PlayerCloser == NUMBER_OF_PLAYERS)
			break;
		AssignLoc[AssignLocCount++] = EmptyArea;
		ShouldToGoLoc[PlayerCloser]	= EmptyArea;
		UnAssignPlayerList[PlayerCloser] = NULL;		
	}

	for(i=0;i<1;i++)
	{
		DWORD OppPlayerNo  = FindCloserPlayer(OppPlayerList,GoalPoint[GetTeamSide()]);
		CLocation OppPlayerLoc = OppPlayerList[OppPlayerNo]->GetLocation();
		CLocation ShouldPlayerGo;
		if(OppPlayerNo == NUMBER_OF_PLAYERS) break;

		DWORD Ratio;
		if(Radius(OppPlayerLoc,GoalPoint[GetTeamSide()])<HALF_GROUND_HEIGHT/2)
		{
			Ratio = 20;
			ShouldPlayerGo.x = (OppPlayerLoc.x*Ratio + GoalPoint[GetTeamSide()].x)/(Ratio+1);
			ShouldPlayerGo.y = (OppPlayerLoc.y*Ratio + GoalPoint[GetTeamSide()].y)/(Ratio+1);
		}
		else if(Radius(OppPlayerLoc,GoalPoint[GetTeamSide()])<HALF_GROUND_HEIGHT)
		{
			Ratio = 5;
			ShouldPlayerGo.x = (OppPlayerLoc.x*Ratio + GoalPoint[GetTeamSide()].x)/(Ratio+1);
			ShouldPlayerGo.y = (OppPlayerLoc.y*Ratio + GoalPoint[GetTeamSide()].y)/(Ratio+1);
		}
		else 
		{
			Ratio = 3;
			ShouldPlayerGo.x = (OppPlayerLoc.x*Ratio + GoalPoint[GetTeamSide()].x)/(Ratio+1);
			ShouldPlayerGo.y = (OppPlayerLoc.y*Ratio + GoalPoint[GetTeamSide()].y)/(Ratio+1);
		}
		DWORD PlayerNo=FindCloserPlayer(UnAssignPlayerList,ShouldPlayerGo);
		if(PlayerNo == NUMBER_OF_PLAYERS) break;

		OppPlayerList[OppPlayerNo]=NULL;
		AssignLoc[AssignLocCount++] = ShouldPlayerGo;
		ShouldToGoLoc[PlayerNo]		= ShouldPlayerGo;
		UnAssignPlayerList[PlayerNo] = NULL;
	}

	for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		if(PlayerList[PlayerNo] == GetControlPlayer()) continue;
		if(PlayerList[PlayerNo] == BallPlayer)	continue;
		
		if(PlayerNo == 0) DoGoalKeeper(PlayerList,Ball);
		else if(UnAssignPlayerList[PlayerNo] == NULL && 
			Distance(PlayerList[PlayerNo]->GetLocation(),ShouldToGoLoc[PlayerNo])>1.0)
			PlayerList[PlayerNo]->DoRunsTo(ShouldToGoLoc[PlayerNo]);
		else 
			PlayerList[PlayerNo]->DoStops();
	}
}


CLocation CFootballTeamControl::FindPassArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
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

void CFootballTeamControl::DoDefend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
				CFootballBall* Ball,CFootballTactic* Tactic)
{
	CLocation AssignLoc[NUMBER_OF_PLAYERS]; DWORD AssignLocCount = 0;
	CFootballPlayer* UnMarkPlayerList[NUMBER_OF_PLAYERS];
	CFootballPlayer* UnAssignPlayerList[NUMBER_OF_PLAYERS];
	memcpy(UnMarkPlayerList,OppPlayerList,sizeof(UnMarkPlayerList));
	memcpy(UnAssignPlayerList,PlayerList,sizeof(UnAssignPlayerList));

	CLocation ShouldToGoLoc[NUMBER_OF_PLAYERS];

	CLocation BallLoc = Ball->GetLocation();
	DWORD CloserPlayer = FindCloserPlayerSide(PlayerList,BallLoc,GetTeamSide());

	DWORD OppPlayer	= FindCloserPlayer(OppPlayerList,BallLoc);
	AssignLoc[AssignLocCount++] = BallLoc;
	ShouldToGoLoc[CloserPlayer]	= BallLoc;
	UnMarkPlayerList[OppPlayer] = NULL;
	UnAssignPlayerList[CloserPlayer] = NULL;
	DOUBLE Ratio = 1.0/3.0;

	for(int PlayerNo=0;PlayerNo<2;PlayerNo++)
	{
		DWORD OppCloserPlayer = FindCloserPlayer(UnMarkPlayerList,BallLoc);
		if(OppCloserPlayer == NUMBER_OF_PLAYERS) continue;
		CLocation OppLoc = OppPlayerList[OppCloserPlayer]->GetLocation();
		CLocation DestLoc = CLocation((OppLoc.x*Ratio + BallLoc.x)/(Ratio+1),
									  (OppLoc.y*Ratio + BallLoc.y)/(Ratio+1));
		DWORD CloserPlayer = FindCloserPlayer(UnAssignPlayerList,OppLoc);
		if(CloserPlayer == NUMBER_OF_PLAYERS) continue;
		AssignLoc[AssignLocCount++] = OppLoc;
		ShouldToGoLoc[CloserPlayer]	= OppLoc;
		UnAssignPlayerList[CloserPlayer] = NULL;
	}

	Ratio = 2;
	for(PlayerNo=0;PlayerNo<1;PlayerNo++)
	{
		DWORD OppCloserPlayer = FindCloserPlayer(UnMarkPlayerList,GoalPoint[GetTeamSide()]);
		if(OppCloserPlayer == NUMBER_OF_PLAYERS) continue;
		CLocation OppLoc = OppPlayerList[OppCloserPlayer]->GetLocation();
		CLocation DestLoc = CLocation((OppLoc.x*Ratio + BallLoc.x)/(Ratio+1),
									  (OppLoc.y*Ratio + BallLoc.y)/(Ratio+1));
		DWORD CloserPlayer = FindCloserPlayer(UnAssignPlayerList,OppLoc);
		if(CloserPlayer == NUMBER_OF_PLAYERS) continue;
		AssignLoc[AssignLocCount++] = OppLoc;
		ShouldToGoLoc[CloserPlayer]	= OppLoc;
		UnMarkPlayerList[OppCloserPlayer] = NULL;
		UnAssignPlayerList[CloserPlayer] = NULL;
	}

	/*
	for(DWORD Count=0;Count<5;Count++)
	{
		DWORD OppPlayerNo  = FindCloserPlayer(OppPlayerList,GoalPoint[GetTeamSide()]);
		CLocation OppPlayerLoc = OppPlayerList[OppPlayerNo]->GetLocation();
		CLocation ShouldPlayerGo;
		if(OppPlayerNo == NUMBER_OF_PLAYERS) break;

		DWORD Ratio;
		if(Radius(OppPlayerLoc,GoalPoint[GetTeamSide()])<HALF_GROUND_HEIGHT/2)
		{
			Ratio = 20;
			ShouldPlayerGo.x = (OppPlayerLoc.x*Ratio + GoalPoint[GetTeamSide()].x)/(Ratio+1);
			ShouldPlayerGo.y = (OppPlayerLoc.y*Ratio + GoalPoint[GetTeamSide()].y)/(Ratio+1);
		}
		else if(Radius(OppPlayerLoc,GoalPoint[GetTeamSide()])<HALF_GROUND_HEIGHT)
		{
			Ratio = 5;
			ShouldPlayerGo.x = (OppPlayerLoc.x*Ratio + GoalPoint[GetTeamSide()].x)/(Ratio+1);
			ShouldPlayerGo.y = (OppPlayerLoc.y*Ratio + GoalPoint[GetTeamSide()].y)/(Ratio+1);
		}
		else 
		{
			Ratio = 3;
			ShouldPlayerGo.x = (OppPlayerLoc.x*Ratio + GoalPoint[GetTeamSide()].x)/(Ratio+1);
			ShouldPlayerGo.y = (OppPlayerLoc.y*Ratio + GoalPoint[GetTeamSide()].y)/(Ratio+1);
		}
		int PlayerNo=FindCloserPlayer(UnAssignPlayerList,ShouldPlayerGo);
		if(PlayerNo == NUMBER_OF_PLAYERS) break;

		OppPlayerList[OppPlayerNo]=NULL;
		AssignLoc[AssignLocCount++] = ShouldPlayerGo;
		ShouldToGoLoc[PlayerNo]				= ShouldPlayerGo;
		UnAssignPlayerList[PlayerNo] = NULL;
	}	/**/

	for(PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		if(PlayerList[PlayerNo] == GetControlPlayer()) continue;
		if(PlayerNo == 0) DoGoalKeeper(PlayerList,Ball);
		else if(UnAssignPlayerList[PlayerNo] == NULL && 
			Distance(PlayerList[PlayerNo]->GetLocation(),ShouldToGoLoc[PlayerNo])>1.0)
			PlayerList[PlayerNo]->DoRunsTo(ShouldToGoLoc[PlayerNo]);
		else 
			PlayerList[PlayerNo]->DoStops();
	}		
}

void CFootballTeamControl::TeamAction()
{	
	CFootballBall* Ball = GetMatch()->GetBall();
	CFootballTeam* OppTeam = GetMatch()->GetOppositTeam(this);
	CFootballTactic* Tactic = GetTactic();

	// Retrive AllPlayer
	CFootballPlayer* PlayerList[NUMBER_OF_PLAYERS];
	CFootballPlayer* OppPlayerList[NUMBER_OF_PLAYERS];
	memcpy(PlayerList,GetPlayerList(),sizeof(PlayerList));
	memcpy(OppPlayerList,OppTeam->GetPlayerList(),sizeof(OppPlayerList));

	CFootballTeam* BallTeam = Ball->GetBallTeam();
	DWORD TeamState = (BallTeam == this)?TSS_OFFEND:TSS_DEFEND;
	switch(TeamState)
	{
	case TSS_OFFEND:
		 DoOffend(PlayerList,OppPlayerList,Ball,Tactic);
		 break;
	case TSS_DEFEND:
		 DoDefend(PlayerList,OppPlayerList,Ball,Tactic);
		 break;			
	}
}

TCHAR* CFootballTeamControl::GetType()
{
	return "Control";
}

void CFootballTeamControl::InitialTeam()
{

}

void CFootballTeamControl::DeinitialTeam()
{

}

void CFootballTeamControl::DoShoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],CFootballBall* Ball,CFootballTactic* Tactic)
{
	DWORD PlayerNo,OppPlayerNo,Dir;
	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	CLocation PlayerLoc,OppPlayerLoc,BallLoc = Ball->GetLocation();
	PlayerList[FindPlayer(PlayerList,BallPlayer)] = NULL;

	CLocation GoalPos[][2] = {
		{	CLocation(0,HALF_GROUND_WIDTH),
			CLocation(GROUND_HEIGHT,HALF_GROUND_WIDTH)},
		{	CLocation(0,HALF_GROUND_WIDTH+HALF_BOX_WIDTH),
			CLocation(GROUND_HEIGHT,HALF_GROUND_WIDTH-HALF_BOX_WIDTH)},
	};

	PCFootballPlayer ForwardPass[NUMBER_OF_PLAYERS];  DWORD ForwardPassCounter = 0;
	PCFootballPlayer BackwardPass[NUMBER_OF_PLAYERS]; DWORD BackwardPassCounter = 0;
	for(PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		if(PlayerList[PlayerNo] != NULL && 
			IsCanPass(BallLoc,PlayerList[PlayerNo]->GetLocation(),OppPlayerList,2.0))
		{
			Dir = BallPlayer->GetDirectionTo(PlayerList[PlayerNo]->GetLocation(),2.0);
			if(Dir & ((GetTeamSide())?EAST:WEST))
				BackwardPass[BackwardPassCounter++] = PlayerList[PlayerNo];
			else
				ForwardPass[ForwardPassCounter++] = PlayerList[PlayerNo];
		}
		// If Can Shoot Goal 
		DWORD Section = 5;
		for(OppPlayerNo=0;OppPlayerNo<Section+1;OppPlayerNo++)
		{
			if(IsCanPass(BallLoc,
				CLocation(GoalPos[0][!GetTeamSide()].x*(OppPlayerNo+1.0/Section),
						  GoalPos[1][!GetTeamSide()].y),OppPlayerList,3.0))
				break;
		}

		if(OppPlayerNo<4)
		{
			BallPlayer->SetDirection(BallPlayer->GetDirectionTo(GoalPos[OppPlayerNo][!GetTeamSide()],2.0));
			Ball->Shoot(BallPlayer,SHOOTSPEED,SHOOTANGLE);
			BallPlayer->DoStops();
		} else if(ForwardPassCounter>0)
		{
			PlayerNo = rand()%ForwardPassCounter;
			BallPlayer->SetDirection(BallPlayer->GetDirectionTo(ForwardPass[PlayerNo]->GetLocation(),2.0));
			ASSERT(ForwardPass[PlayerNo] != NULL);
			m_FindBallPlayer = ForwardPass[PlayerNo];
 			Ball->Shoot(BallPlayer, SHOOTSPEED,SHOOTANGLE);
			BallPlayer->DoStops();
		} else if(BackwardPassCounter>0)
		{
			if(TRUE)
			{
				PlayerNo = rand()%BackwardPassCounter;
				BallPlayer->SetDirection(BallPlayer->GetDirectionTo(BackwardPass[PlayerNo]->GetLocation(),2.0));
 				Ball->Shoot(BallPlayer, SHOOTSPEED,SHOOTANGLE);
				m_FindBallPlayer = ForwardPass[PlayerNo];
				BallPlayer->DoStops();
			} else {
				BallPlayer->SetDirection(BallPlayer->GetDirectionTo(GoalPoint[!GetTeamSide()],2.0));
				BallPlayer->DoRuns();
			}

		}
		else
		{
			//Debug("Control Walk");
			BallPlayer->SetDirection(BallPlayer->GetDirectionTo(GoalPoint[!GetTeamSide()],2.0));
			BallPlayer->DoRuns();
		} 
}

CLocation CFootballTeamControl::GetAreaLoc(int AreaNo)
{
	if(GetTeamSide()==RIGHTSIDE) AreaNo = COLS_COUNT*ROWS_COUNT-AreaNo-1;
	DWORD Row = AreaNo%ROWS_COUNT;
	DWORD Col = AreaNo/ROWS_COUNT;
	return CLocation(
		(Row+0.5)*GROUND_HEIGHT/ROWS_COUNT,
		(Col+0.5)*GROUND_WIDTH /COLS_COUNT);

}

BOOL CFootballTeamControl::InAreaNo(CLocation Loc,DWORD AreaCheck)
{
	DWORD Row = TRUNCATE(Loc.x*ROWS_COUNT/GROUND_HEIGHT);
	DWORD Col = TRUNCATE(Loc.y*COLS_COUNT/GROUND_WIDTH );
	Row = (Row<0)?0:(Row>=ROWS_COUNT)?ROWS_COUNT-1:Row;
	Col = (Col<0)?0:(Col>=COLS_COUNT)?COLS_COUNT-1:Col;
	DWORD AreaNo = Col*ROWS_COUNT+Row;
	return ((GetTeamSide()==LEFTSIDE)?AreaNo:COLS_COUNT*ROWS_COUNT-AreaNo-1) == AreaCheck;
}


CFootballPlayer* CFootballTeamControl::GetControlPlayer()
{ 
	if(GetMatch()->GetControlTeam() != this)
		return NULL;
	if(m_pControlPlayer == NULL)
		SwapControlPlayer();
	return m_pControlPlayer;
	return NULL;
}

void CFootballTeamControl::SwapControlPlayer()
{
	static CFootballPlayer* SwapedPlayer[NUMBER_OF_PLAYERS];
	static DWORD SwappedNum = 0;

	// Retrive All position
	CFootballPlayer* PlayerList[NUMBER_OF_PLAYERS];
	memcpy(PlayerList,GetPlayerList(),sizeof(PlayerList));

	CLocation BallLoc = GetMatch()->GetBall()->GetLocation();
	DWORD PlayerNo = FindCloserPlayer(PlayerList,BallLoc);
	CFootballPlayer* Player = PlayerList[PlayerNo];
	if(SwappedNum>0 && SwappedNum<NUMBER_OF_PLAYERS && SwapedPlayer[0] == Player)
	{
		while(InPlayerList(SwapedPlayer,PlayerList[PlayerNo],SwappedNum))
		{
			PlayerList[PlayerNo] = NULL;
			PlayerNo = FindCloserPlayer(PlayerList,BallLoc);
		}
		Player = PlayerList[PlayerNo];
		SwapedPlayer[SwappedNum++] = Player;
	}
	else 
	{
		SwappedNum = 0;
		SwapedPlayer[SwappedNum++] = Player;
	}
	if (m_pControlPlayer && m_pControlPlayer!=Player)
		m_pControlPlayer->DoStops();
	SetControlPlayer(Player);
}

void CFootballTeamControl::SetControlPlayer(CFootballPlayer* Player)		
{ 
	m_pControlPlayer = Player; 
}


