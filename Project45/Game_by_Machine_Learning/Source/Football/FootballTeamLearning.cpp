// FootballTeamLearning.cpp: implementation of the CFootballTeamLearning class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "football.h"
#include "FootballTeamLearning.h"

#include <direct.h>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CFootballTeamLearning::CFootballTeamLearning()
{
}

CFootballTeamLearning::CFootballTeamLearning(TCHAR* strTeamName,CFootballTactic* pTactic)
: CFootballTeamComputer(strTeamName,pTactic)
{
	m_NeuralNo = 0;
	m_bNeuralActive = FALSE;
	if(m_Network.LoadNetwork(NEURAL_FILE))
		m_bNeuralActive = TRUE;
}

CFootballTeamLearning::~CFootballTeamLearning()
{
}

void CFootballTeamLearning::InitialTeam()
{
}

void CFootballTeamLearning::DeinitialTeam()
{
}

TCHAR* CFootballTeamLearning::GetType()
{
	return "Learning";
}

void CFootballTeamLearning::PreTraining(PCArrayOfTrainData TrainList,PCArrayOfKickData KickList)
{
	CKickData				*KickData;
	CTrainData				*TrainData;
	DWORD KickSize = KickList->GetSize();
	for(DWORD i=0;i<KickSize;i++)
	{
		KickData = KickList->GetAt(i);
		TrainData	= new CTrainData();
		PreProcess(*TrainData,*KickData);
		TrainList->Add(TrainData);
	}
}

BOOL CFootballTeamLearning::Shoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTeam* Team)
{
	CFootballPlayer *Player,*BallPlayer = Ball->GetControlBallPlayer();
	CFootballTeam* OppTeam = GetMatch()->GetOppositTeam(this);
	CLocation Loc,BallLoc = BallPlayer->GetLocation();
	DWORD TeamSide = Team->GetTeamSide();	
	if(m_bNeuralActive && BallPlayer)
	{
		CKickData KickData;
		KickData.KickerNo = BallPlayer->GetPlayerNo();
		KickData.KickerDir = DirectionNo(BallPlayer->GetDirection());
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			Player	= this->GetPlayer(PlayerNo);
			Loc		= Player->GetLocation();
			KickData.KickerTeamLoc[PlayerNo].x	=	ROUND(Loc.x);
			KickData.KickerTeamLoc[PlayerNo].y	=	ROUND(Loc.y);
		}
		for(PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			Player	= OppTeam->GetPlayer(PlayerNo);
			Loc		= Player->GetLocation();
			KickData.OppTeamLoc[PlayerNo].x	=	ROUND(Loc.x);
			KickData.OppTeamLoc[PlayerNo].y	=	ROUND(Loc.y);
		}

		CTrainData TrainData;
		PreProcess(TrainData,KickData);

		double Input[2*NUMBER_OF_PLAYERS/**2*/+1];
		double Output[1];

		for(int j=0;j<2;j++)
			for(int i=0;i<NUMBER_OF_PLAYERS;i++)
			{
				//Input[j*10+i*2+0] = TrainData.Loc[j][i][0]/GROUND_HEIGHT;
				//Input[j*10+i*2+1] = TrainData.Loc[j][i][1]/GROUND_WIDTH;
				Input[j*NUMBER_OF_PLAYERS+i] = TrainData.ZoneLoc[j][i]*1.0/(ZONE_COL*ZONE_ROW);
			}

		for(DWORD Dir=0;Dir<8;Dir++)
		{
			Input[2*NUMBER_OF_PLAYERS/**2*/] = Dir/7;
			m_Network.SetInput(Input);
			m_Network.ForwardProp();
			m_Network.GetOutput(Output);
			if(Output[0]>0.7)
			{
				BallPlayer->SetDirection(DirNo2Dir(Dir));
				Ball->Shoot(BallPlayer,SHOOTSPEED,SHOOTANGLE);
				return TRUE;
			}
		}
	}
	DWORD Dir,SourceDir = BallPlayer->GetDirectionTo(GoalPoint[!TeamSide],2.0);
	int s=(TeamSide)?-1:1;
	for(int i=0;i<4;)
	{
		if(s<0) s=1; else { s=-1; i++; }
		Dir = DirNo2Dir((DirectionNo(SourceDir)+8+i*s)%8);
		double Angle = Dir2Rad(Dir);
		for(DWORD OppPlayerNo=0;OppPlayerNo<NUMBER_OF_PLAYERS;OppPlayerNo++)
		{
			CLocation OppLoc = OppPlayerList[OppPlayerNo]->GetLocation();
			CLocation DestLoc = CLocation(BallLoc.x + 5*cos(Angle),
										  BallLoc.y + 5*sin(Angle));
			DWORD OppDir = BallPlayer->GetDirectionTo(OppLoc,2.0);
			double DistPlayer2Opp = Distance(BallPlayer->GetLocation(),OppLoc);
			if(Distance(DestLoc,OppLoc)<5) break;
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
	return FALSE;
}

void CFootballTeamLearning::PreProcess(CTrainData &TrainData,const CKickData &KickData)
{
	DWORD KickNo = KickData.KickerNo;
	TrainData.Loc[0][0][0]	= KickData.KickerTeamLoc[KickNo].x;
	TrainData.Loc[0][0][1]	= KickData.KickerTeamLoc[KickNo].y;
	TrainData.ZoneLoc[0][0]	= GetZone(KickData.KickerTeamLoc[KickNo]);
	TrainData.ShootDir		= KickData.KickerDir;
	for(DWORD PlayerNo=0,No=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		if(PlayerNo == KickNo) continue;
		No++;
		TrainData.Loc[0][No][0]		= KickData.KickerTeamLoc[PlayerNo].x;
		TrainData.Loc[0][No][1]		= KickData.KickerTeamLoc[PlayerNo].y;
		TrainData.ZoneLoc[0][No]	= GetZone(KickData.KickerTeamLoc[PlayerNo]);
	}
	for(PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		TrainData.Loc[1][PlayerNo][0]	= KickData.OppTeamLoc[PlayerNo].x;
		TrainData.Loc[1][PlayerNo][1]	= KickData.OppTeamLoc[PlayerNo].y;
		TrainData.ZoneLoc[1][PlayerNo]	= GetZone(KickData.OppTeamLoc[PlayerNo]);
	}	
	TrainData.Result	= KickData.Result;
}

void CFootballTeamLearning::LoadData(TCHAR* NeuralFilename)
{
	m_Network.LoadNetwork(NeuralFilename);
}

int CFootballTeamLearning::GetZone(const CLocation &Loc)
{
	int x = Loc.x*ZONE_ROW/GROUND_HEIGHT;
	int y = Loc.y*ZONE_COL/GROUND_WIDTH;
	ASSERT(x*ZONE_COL+y<ZONE_ROW*ZONE_COL);
	return x*ZONE_COL+y;
}
