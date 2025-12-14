// FootballTeamComputer.cpp: implementation of the CFootballTeamComputer class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "football.h"
#include "FootballTeamComputer.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballTeamComputer,CObject,0)

CFootballTeamComputer::CFootballTeamComputer()
: CFootballTeam()
{
}

CFootballTeamComputer::CFootballTeamComputer(TCHAR* strTeamName,CFootballTactic* pTactic)
: CFootballTeam(strTeamName,pTactic)
{
}

CFootballTeamComputer::~CFootballTeamComputer()
{
}

CLocation CFootballTeamComputer::FindEmptyArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
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

void CFootballTeamComputer::DoOffend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTactic* Tactic)
{
	CFootballPlayer* UnAssignPlayerList[NUMBER_OF_PLAYERS];
	memcpy(UnAssignPlayerList,PlayerList,sizeof(UnAssignPlayerList));
	
	CLocation AssignLoc[NUMBER_OF_PLAYERS]; DWORD AssignLocCount = 0;
	CLocation ShouldToGoLoc[NUMBER_OF_PLAYERS];

	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	if(BallPlayer) // Offend with Ball
	{
		DWORD BallPlayerNo = FindPlayer(PlayerList,BallPlayer);
		Shoot(PlayerList,OppPlayerList,Ball,this); // Calculate to Pass ball;
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
		if(PlayerList[PlayerNo] == BallPlayer)	continue;
		
		if(PlayerNo == 0) DoGoalKeeper(PlayerList,Ball);
		else if(UnAssignPlayerList[PlayerNo] == NULL && 
			Distance(PlayerList[PlayerNo]->GetLocation(),ShouldToGoLoc[PlayerNo])>1.0)
			PlayerList[PlayerNo]->DoRunsTo(ShouldToGoLoc[PlayerNo]);
		else 
			PlayerList[PlayerNo]->DoStops();
	}
}


CLocation CFootballTeamComputer::FindPassArea(CFootballBall* Ball,CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
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

void CFootballTeamComputer::DoDefend(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
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
		if(PlayerNo == 0) DoGoalKeeper(PlayerList,Ball);
		else if(UnAssignPlayerList[PlayerNo] == NULL && 
			Distance(PlayerList[PlayerNo]->GetLocation(),ShouldToGoLoc[PlayerNo])>1.0)
			PlayerList[PlayerNo]->DoRunsTo(ShouldToGoLoc[PlayerNo]);
		else 
			PlayerList[PlayerNo]->DoStops();
	}		
}

void CFootballTeamComputer::TeamAction()
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

TCHAR* CFootballTeamComputer::GetType()
{
	return "Computer";
}

void CFootballTeamComputer::InitialTeam()
{

}

void CFootballTeamComputer::DeinitialTeam()
{

}

CLocation CFootballTeamComputer::GetAreaLoc(int AreaNo)
{
	if(GetTeamSide()==RIGHTSIDE) AreaNo = COLS_COUNT*ROWS_COUNT-AreaNo-1;
	DWORD Row = AreaNo%ROWS_COUNT;
	DWORD Col = AreaNo/ROWS_COUNT;
	return CLocation(
		(Row+0.5)*GROUND_HEIGHT/ROWS_COUNT,
		(Col+0.5)*GROUND_WIDTH /COLS_COUNT);

}

BOOL CFootballTeamComputer::InAreaNo(CLocation Loc,DWORD AreaCheck)
{
	DWORD Row = TRUNCATE(Loc.x*ROWS_COUNT/GROUND_HEIGHT);
	DWORD Col = TRUNCATE(Loc.y*COLS_COUNT/GROUND_WIDTH );
	Row = (Row<0)?0:(Row>=ROWS_COUNT)?ROWS_COUNT-1:Row;
	Col = (Col<0)?0:(Col>=COLS_COUNT)?COLS_COUNT-1:Col;
	DWORD AreaNo = Col*ROWS_COUNT+Row;
	return ((GetTeamSide()==LEFTSIDE)?AreaNo:COLS_COUNT*ROWS_COUNT-AreaNo-1) == AreaCheck;
}

BOOL CFootballTeamComputer::Shoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTeam* Team)
{
	CFootballPlayer* BallPlayer = Ball->GetControlBallPlayer();
	CLocation BallLoc = BallPlayer->GetLocation();
	DWORD TeamSide = Team->GetTeamSide();	
	for(int i=0;i<8;i++)
	{
		DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
		CLocation DestLoc = CLocation(BallLoc.x + 20*cos(Angle),
									  BallLoc.y + 20*sin(Angle));
		if(LineIntersect(BallLoc,DestLoc,GoalPos[0][!TeamSide],GoalPos[1][!TeamSide]) && 
			IsCanPass(BallLoc,DestLoc,OppPlayerList,2.0))
			break;
	}
	if(i!=8) {
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
			CLocation ShouldToGoLoc = PlayerList[PlayerNo]->GetLocation();
			if(DistanceLinePoint(BallLoc,DestLoc,ShouldToGoLoc) < 0.5 && 
				IsCanPass(BallLoc,DestLoc,OppPlayerList,1.0) && 
				BallPlayer->GetDirectionTo(ShouldToGoLoc,2.0) & ((TeamSide)?WEST:EAST))
				ForwardPass[ForwardPassCount++] = PlayerList[PlayerNo];
		}
	}
	if(ForwardPassCount) {
		DWORD ReceiveBallPlayerNo = rand()%ForwardPassCount;
		DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
		BallPlayer->SetDirection(BallPlayer->GetDirectionTo(ForwardPass[ReceiveBallPlayerNo]->GetLocation(),2.0));
		BallPlayer->DoStops();
		Ball->Shoot(BallPlayer, SHOOTSPEED,SHOOTANGLE);
		return TRUE;
	}
	DWORD Dir,SourceDir = BallPlayer->GetDirectionTo(GoalPoint[!TeamSide],2.0);
	int s=(TeamSide)?-1:1;
	for(i=0;i<8;)
	{
		if(s<0) s=1; else { s=-1; i++; }
		Dir = DirNo2Dir((DirectionNo(SourceDir)+8+i*s)%8);
		DOUBLE Angle = Dir2Rad(Dir);
		for(DWORD OppPlayerNo=0;OppPlayerNo<NUMBER_OF_PLAYERS;OppPlayerNo++)
		{
			CLocation OppLoc = OppPlayerList[OppPlayerNo]->GetLocation();
			CLocation DestLoc = CLocation(BallLoc.x + 5*cos(Angle),
										  BallLoc.y + 5*sin(Angle));
			DWORD OppDir = BallPlayer->GetDirectionTo(OppLoc,2.0);
			DOUBLE DistPlayer2Opp = Distance(BallPlayer->GetLocation(),OppLoc);
			if(Distance(DestLoc,OppLoc)<5) break;
			//if(DistPlayer2Opp<10 && Dir == OppDir) break;
			if(DestLoc.x<0 || DestLoc.x>GROUND_HEIGHT || DestLoc.y<0 || DestLoc.y>GROUND_WIDTH) 
				break;
		}
		if(OppPlayerNo == NUMBER_OF_PLAYERS) break;
	}
	if(i<4) {
		BallPlayer->SetDirection(Dir);
		BallPlayer->DoRuns();
		return TRUE;	
	}
	CFootballPlayer* BackwardPass[NUMBER_OF_PLAYERS]; DWORD BackwardPassCount = 0;
	for(i=0;i<8;i++)
	{
		DOUBLE Angle = Dir2Rad(DirNo2Dir(i));
		CLocation DestLoc = CLocation(BallLoc.x + CAN_PASS_RANGE*cos(Angle),
									  BallLoc.y + CAN_PASS_RANGE*sin(Angle));
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			CLocation ShouldToGoLoc = PlayerList[PlayerNo]->GetLocation();
			if(DistanceLinePoint(BallLoc,DestLoc,ShouldToGoLoc) < 0.5 && 
				IsCanPass(BallLoc,DestLoc,OppPlayerList,1.0) && 
				BallPlayer->GetDirectionTo(ShouldToGoLoc,2.0) & ((!TeamSide)?WEST:EAST))
				BackwardPass[BackwardPassCount++] = PlayerList[PlayerNo];
		}
	}
	if(BackwardPassCount) {
		DWORD ReceiveBallPlayerNo = rand()%BackwardPassCount;
		BallPlayer->SetDirection(BallPlayer->GetDirectionTo(BackwardPass[ReceiveBallPlayerNo]->GetLocation(),2.0));
		BallPlayer->DoStops();
		Ball->Shoot(BallPlayer, SHOOTSPEED,SHOOTANGLE);
		return TRUE;
	}
	return FALSE;
}
