// FootballTactic.cpp: implementation of the CFootballTactic class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballTactic.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballTactic,CObject,0)

CFootballTactic::CFootballTactic()
{
	m_pTeam = NULL;
}

CFootballTactic::CFootballTactic(TCHAR* szFileName)
{
	m_pTeam = NULL;
	Load(szFileName);
}

CFootballTactic::~CFootballTactic()
{
}

//HRESULT CFootballTactic::Create(CDisplay *pDisplay)
//{
//	return S_OK;
//}

//void CFootballTactic::Update(DWORD dwTickDiff)
//{
//}

//HRESULT CFootballTactic::Draw(CSurface *pSurface, POINT ptStart)
//{
//	return S_OK;
//}

/*
//DEL void CFootballTactic::ReAction(CFootballManager* Football,CFootballPlayer* Player,CFootballBall* Ball,CFootballTeam* Team)
//DEL {
//DEL 	if(Player->GetBehaviour() == PB_DEFAULT_BEHAVIOUR)
//DEL 	{
//DEL 		CLocation ShouldPlayerGo = WhereShouldPlayerGo(Player,Ball,Team);
//DEL 		CLocation PlayerLoc = Player->GetLocation();
//DEL 		//DWORD Dir = Player->GetDirectionTo(ShouldPlayerGo,2.0);
//DEL 		DWORD Dir = NO_DIRECTION;
//DEL 
//DEL 		double Range = 2.0;
//DEL 
//DEL 		if (ShouldPlayerGo.x-PlayerLoc.x > Range)
//DEL 			Dir += EAST;
//DEL 		else if(PlayerLoc.x-ShouldPlayerGo.x > Range)
//DEL 			Dir += WEST;
//DEL 	
//DEL 		if (ShouldPlayerGo.y-PlayerLoc.y > Range)
//DEL 			Dir += SOUTH;
//DEL 		else if (PlayerLoc.y-ShouldPlayerGo.y > Range)
//DEL 			Dir += NORTH;
//DEL 
//DEL 		if (Dir==NO_DIRECTION)
//DEL 		{
//DEL 			Dir = Player->GetDirectionTo(Ball->GetLocation(),0.5);
//DEL 			Player->SetDirection(Dir);
//DEL 			Player->DoStops();
//DEL 		}
//DEL 		else
//DEL 		{
//DEL 			Player->SetDirection(Dir);
//DEL 			Player->DoRuns();
//DEL 		}
//DEL 	} else 
//DEL 		Player->ReAction(Football,Ball);
//DEL }

CLocation CFootballTactic::WhereShouldPlayerGo(CFootballPlayer* Player,CFootballBall* Ball,CFootballTeam* Team)
{
	DWORD BallArea = GetAreaNo(Ball->GetLocation(),Team->GetTeamSide());
	DWORD Side = (Ball->GetHaveBallPlayer()==NULL)?0:(Ball->GetHaveBallPlayer()->GetTeam()==Team)?1:0;
	CLocation ShouldPlayerGoRelative = m_pppGamePoint[BallArea][Player->GetPlayerNo()][Side];
	return (Team->GetTeamSide()==LEFTSIDE)?ShouldPlayerGoRelative:ShouldPlayerGoRelative.Reverse();
}
*/

DWORD CFootballTactic::GetAreaNo(CLocation Loc, DWORD TeamSide)
{
	// Col = XReal/GROUND_WIDTH *COLS_COUNT;
	// Row = YReal/GROUND_HEIGHT*ROWS_COUNT;
	DWORD Row = TRUNCATE(Loc.x*ROWS_COUNT/GROUND_HEIGHT);
	DWORD Col = TRUNCATE(Loc.y*COLS_COUNT/GROUND_WIDTH );
	Row = (Row<0)?0:(Row>=ROWS_COUNT)?ROWS_COUNT-1:Row;
	Col = (Col<0)?0:(Col>=COLS_COUNT)?COLS_COUNT-1:Col;
	DWORD AreaNo = Col*ROWS_COUNT+Row;
	return (TeamSide==LEFTSIDE)?AreaNo:COLS_COUNT*ROWS_COUNT-AreaNo-1;
}

CLocation CFootballTactic::GetAreaLoc(DWORD AreaNo,DWORD TeamSide)
{
	if(TeamSide==RIGHTSIDE) AreaNo = COLS_COUNT*ROWS_COUNT-AreaNo-1;
	DWORD Row = AreaNo%ROWS_COUNT;
	DWORD Col = AreaNo/ROWS_COUNT;
	return CLocation(
		(Row+0.5)*GROUND_HEIGHT/ROWS_COUNT,
		(Col+0.5)*GROUND_WIDTH /COLS_COUNT);
}

void CFootballTactic::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		ar.Write(m_ppChangingPoint,sizeof(m_ppChangingPoint));
		ar.Write(m_ppKickoffPoint ,sizeof(m_ppKickoffPoint));
		ar.Write(m_pppGamePoint	  ,sizeof(m_pppGamePoint));
		ar.Write(m_ppCornerPoint  ,sizeof(m_ppCornerPoint));
	}
	else
	{
		ar.Read(m_ppChangingPoint,sizeof(m_ppChangingPoint));
		ar.Read(m_ppKickoffPoint ,sizeof(m_ppKickoffPoint));
		ar.Read(m_pppGamePoint	 ,sizeof(m_pppGamePoint));
		ar.Read(m_ppCornerPoint  ,sizeof(m_ppCornerPoint));
	}
}


void CFootballTactic::Load(LPSTR szFileName)
{
	CFile file;
	if(file.Open(szFileName,CFile::modeRead))
	{
		DWORD Rows;
		file.Read(&Rows,sizeof(DWORD));
		DWORD Cols;
		file.Read(&Cols,sizeof(DWORD));

		CLocation Loc;
		DWORD i,j,k;
		for(j=0;j<11;j++)
			for(k=0;k<2;k++)
			{
				file.Read(&Loc.x,sizeof(DOUBLE));
				file.Read(&Loc.y,sizeof(DOUBLE));
				m_ppKickoffPoint[k][j] = Loc;
			}

		for(i=0;i<4;i++)
			for(j=0;j<11;j++)
				for(k=0;k<2;k++)
				{
					file.Read(&Loc.x,sizeof(DOUBLE));
					file.Read(&Loc.y,sizeof(DOUBLE));
					m_ppCornerPoint[i][k][j] = Loc;
				}

		for(i=0;i<ROWS_COUNT*COLS_COUNT;i++)
			for(j=0;j<11;j++)
				for(k=0;k<2;k++)
				{
					file.Read(&Loc.x,sizeof(DOUBLE));
					file.Read(&Loc.y,sizeof(DOUBLE));
					m_pppGamePoint[i][k][j] = Loc;
				}

		for(j=0;j<11;j++)
			for(k=0;k<2;k++)
			{
				file.Read(&Loc.x,sizeof(DOUBLE));
				file.Read(&Loc.y,sizeof(DOUBLE));
				m_ppChangingPoint[k][j] = Loc;
			}

		file.Close();
	}
}

//DEL void CFootballTactic::Save(LPSTR szFileName)
//DEL {
//DEL 	CFile file;
//DEL 	if(file.Open(szFileName,CFile::modeCreate | CFile::modeReadWrite))
//DEL 	{
//DEL 		DWORD Rows;
//DEL 		file.Write(&Rows,sizeof(DWORD));
//DEL 		DWORD Cols;
//DEL 		file.Write(&Cols,sizeof(DWORD));
//DEL 		
//DEL 		CLocation Loc;
//DEL 		DWORD i,j,k;
//DEL 		for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 			for(k=0;k<2;k++)
//DEL 			{
//DEL 				Loc = m_ppKickoffPoint[k][j];
//DEL 				file.Write(&Loc.x,sizeof(DOUBLE));
//DEL 				file.Write(&Loc.y,sizeof(DOUBLE));
//DEL 			}
//DEL 
//DEL 		for(i=0;i<4;i++)
//DEL 			for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 				for(k=0;k<2;k++)
//DEL 				{
//DEL 					Loc = m_ppCornerPoint[i][j];
//DEL 					file.Write(&Loc.x,sizeof(DOUBLE));
//DEL 					file.Write(&Loc.y,sizeof(DOUBLE));
//DEL 				}
//DEL 
//DEL 		for(i=0;i<ROWS_COUNT*COLS_COUNT;i++)
//DEL 			for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 				for(k=0;k<2;k++)
//DEL 				{
//DEL 					Loc = m_pppGamePoint[i][k][j];
//DEL 					file.Write(&Loc.x,sizeof(DOUBLE));
//DEL 					file.Write(&Loc.y,sizeof(DOUBLE));
//DEL 				}
//DEL 
//DEL 		for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 			for(k=0;k<2;k++)
//DEL 			{
//DEL 				Loc = m_ppChangingPoint[k][j];
//DEL 				file.Write(&Loc.x,sizeof(DOUBLE));
//DEL 				file.Write(&Loc.y,sizeof(DOUBLE));
//DEL 			}
//DEL 		file.Close();
//DEL 	}
//DEL }

//DEL void CFootballTactic::GetChangingPoint(CLocation*** ppDestLoc)
//DEL {
//DEL 	int j,k;
//DEL 	for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 		for(k=0;k<2;k++)
//DEL 		{
//DEL 			(*ppDestLoc)[k][j].x = m_ppChangingPoint[k][j].x;
//DEL 			(*ppDestLoc)[k][j].y = m_ppChangingPoint[k][j].y;
//DEL 		}
//DEL }

//DEL void	CFootballTactic::GetKickOffPoint(CLocation*** ppDestLoc)
//DEL {
//DEL 	int j,k;
//DEL 	for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 		for(k=0;k<2;k++)
//DEL 		{
//DEL 			(*ppDestLoc)[k][j] = new CLocation(m_ppKickoffPoint[k][j]);
//DEL 		}
//DEL }

//DEL void	CFootballTactic::GetCornerPoint(CLocation*** ppDestLoc)
//DEL {
//DEL 	int j,k;
//DEL 	for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 		for(k=0;k<2;k++)
//DEL 		{
//DEL 			(*ppDestLoc)[k][j].x = m_ppCornerPoint[k][j].x;
//DEL 			(*ppDestLoc)[k][j].y = m_ppCornerPoint[k][j].y;
//DEL 		}
//DEL }

//DEL void CFootballTactic::GetGamePoint(CLocation*** ppDestLoc,DWORD Num)
//DEL {
//DEL 	int j,k;
//DEL 	for(j=0;j<NUMBER_OF_PLAYERS;j++)
//DEL 		for(k=0;k<2;k++)
//DEL 		{
//DEL 			(*ppDestLoc)[k][j].x = m_pppGamePoint[Num][k][j].x;
//DEL 			(*ppDestLoc)[k][j].y = m_pppGamePoint[Num][k][j].y;
//DEL 		}
//DEL }

//DEL CLocation** CFootballTactic::CopyGamePoint(int GameArea)
//DEL {
//DEL 	PPCLocation GamePoint = new PCLocation[2*11];
//DEL 	for(int i=0;i<2;i++)
//DEL 	{
//DEL 		for(int j=0;j<11;j++)
//DEL 			GamePoint[i*11+j] = new CLocation(m_pppGamePoint[GameArea][i][j]);
//DEL 	}
//DEL 	return GamePoint;
//DEL }

//DEL void CFootballTactic::DeleteGamePoint(CLocation** GamePoint)
//DEL {
//DEL 	for(int i=0;i<2;i++)
//DEL 	{	
//DEL 		for(int j=0;j<11;j++)
//DEL 			SAFE_DELETE(GamePoint[i*11+j]);
//DEL 	}
//DEL 	SAFE_DELETE_ARRAY(GamePoint);
//DEL }

void CFootballTactic::SetTeam(CFootballTeam *pTeam)
{
	m_pTeam = pTeam;
}

CFootballTeam* CFootballTactic::GetTeam()
{
	ASSERT(m_pTeam != NULL);
	return m_pTeam;
}

void CFootballTactic::SetChanging()
{
	CFootballPlayer** PlayerList = GetTeam()->GetPlayerList();
	BOOL Defend = GetTeam()->IsDefend();
	if(GetTeam()->GetTeamSide() == LEFTSIDE)
	{
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_ppChangingPoint[Defend][PlayerNo]);
			PlayerList[PlayerNo]->SetDirection(EAST);
		}
	} else
	{
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_ppChangingPoint[Defend][PlayerNo].Reverse());
			PlayerList[PlayerNo]->SetDirection(WEST);
		}
	}
}
void CFootballTactic::SetKickoff()
{
	CFootballPlayer** PlayerList = GetTeam()->GetPlayerList();
	BOOL Defend = GetTeam()->IsDefend();
	if(GetTeam()->GetTeamSide() == LEFTSIDE)
	{
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_ppKickoffPoint[Defend][PlayerNo]);
			PlayerList[PlayerNo]->SetDirection(EAST);
		}
	} else
	{
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_ppKickoffPoint[Defend][PlayerNo].Reverse());
			PlayerList[PlayerNo]->SetDirection(WEST);
		}
	}
}

void CFootballTactic::SetThrowIn(CLocation Pos)
{
	CFootballPlayer** PlayerList = GetTeam()->GetPlayerList();
	DWORD TeamSide = GetTeam()->GetTeamSide();
	DWORD AreaNo = GetAreaNo(Pos,TeamSide);
	BOOL Defend = GetTeam()->IsDefend();
	if(TeamSide == LEFTSIDE)
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_pppGamePoint[AreaNo][Defend][PlayerNo]);
			PlayerList[PlayerNo]->SetDirection(
				PlayerList[PlayerNo]->GetDirectionTo(Pos,2.0));
		}
	else
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_pppGamePoint[AreaNo][Defend][PlayerNo].Reverse());
			PlayerList[PlayerNo]->SetDirection(
				PlayerList[PlayerNo]->GetDirectionTo(Pos,2.0));
		}
}

void CFootballTactic::SetCorner(DWORD CornerNo)
{
	CFootballPlayer** PlayerList = GetTeam()->GetPlayerList();
	BOOL Defend = GetTeam()->IsDefend();
	if(GetTeam()->GetTeamSide() == LEFTSIDE)
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_ppCornerPoint[CornerNo][Defend][PlayerNo]);
		}
	else
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_ppCornerPoint[CornerNo][Defend][PlayerNo].Reverse());
		}
}

void CFootballTactic::SetFreeKick(CLocation Pos)
{
	CFootballPlayer** PlayerList = GetTeam()->GetPlayerList();
	DWORD Defence = GetTeam()->IsDefend(); 
	DWORD TeamSide = GetTeam()->GetTeamSide();
	DWORD AreaNo = GetAreaNo(Pos,TeamSide);
	if(TeamSide == LEFTSIDE)
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_pppGamePoint[AreaNo][Defence][PlayerNo]);
			PlayerList[PlayerNo]->SetDirection(
				PlayerList[PlayerNo]->GetDirectionTo(Pos,2.0));
		}
	else
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->SetLocation(m_pppGamePoint[AreaNo][Defence][PlayerNo].Reverse());
			PlayerList[PlayerNo]->SetDirection(
				PlayerList[PlayerNo]->GetDirectionTo(Pos,2.0));
		}
}

void CFootballTactic::MovetoKickoff()
{
	CFootballPlayer** PlayerList = GetTeam()->GetPlayerList();
	CLocation BallLoc = GetTeam()->GetMatch()->GetBall()->GetLocation();
	BOOL Defend = GetTeam()->IsDefend();
	if(GetTeam()->GetTeamSide() == LEFTSIDE)
	{
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->DoRunsTo(m_ppKickoffPoint[Defend][PlayerNo]);
		}
	} else
	{
		for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
		{
			PlayerList[PlayerNo]->DoRunsTo(m_ppKickoffPoint[Defend][PlayerNo].Reverse());
		}
	}
}

