// FootballMatch.cpp: implementation of the CFootballMatch class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "football.h"
#include "FootballMatch.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballMatch,CObject,1)

DOUBLE CFootballMatch::m_RatioX = 7.0;
DOUBLE CFootballMatch::m_RatioY = 7.0;
POINT  CFootballMatch::m_ptGroundBorder;

void CFootballMatch::Update(DWORD dwTickDiff)
{
	switch(m_MatchState)
	{
	case MS_NONE:
		break;
	case MS_CHANGINGROOM:
		{
			CFootballTeam* Team1 = GetTeamNo(TEAM1);
			CFootballTeam* Team2 = GetTeamNo(TEAM2);
			Team1->Update(dwTickDiff);
			Team2->Update(dwTickDiff);
			Team1->GetTactic()->MovetoKickoff();
			Team2->GetTactic()->MovetoKickoff();
			if(!Team1->IsMove() && !Team2->IsMove())
				SetMatchState(MS_FIRST_HALF);
		}
		break;
	case MS_FIRST_HALF:
		GetBall()->Update(dwTickDiff);
		GetTeamNo(TEAM1)->Update(dwTickDiff);
		GetTeamNo(TEAM2)->Update(dwTickDiff);
		GetScore()->Update(dwTickDiff);
		if(GetScore()->GetTime()<45*60)
			MatchAction();
		else 
			SetMatchState(MS_FULLTIME/*MS_HALF_TIME*/);
		break;
	case MS_HALF_TIME:
		if(!m_bWaitKick) 
			SetMatchState(MS_SECOND_HALF);
		break;
	case MS_SECOND_HALF:
		GetBall()->Update(dwTickDiff);
		GetTeamNo(TEAM1)->Update(dwTickDiff);
		GetTeamNo(TEAM2)->Update(dwTickDiff);
		GetScore()->Update(dwTickDiff);
		if(GetScore()->GetTime()<90*60)
			MatchAction();
		else 
			SetMatchState(MS_FULLTIME);
		break;
	case MS_FULLTIME:
		if(!m_bWaitKick)
			SetMatchState(MS_FIRST_HALF/*MS_CHANGINGROOM*/);
		break;
	}
}

void CFootballMatch::SetMatchState(DWORD MatchState)
{
	m_MatchState = MatchState;
	switch(m_MatchState)
	{
	case MS_NONE:
		break;
	case MS_CHANGINGROOM:
		SetChangingRoom();
		break;
	case MS_FIRST_HALF:
		InitGame();
		GetApp()->PlayWhitleSound();
		break;
	case MS_HALF_TIME:
		m_bWaitKick = TRUE;
		break;
	case MS_SECOND_HALF:
		GetApp()->PlayWhitleSound();
		SwapTeamSide();
		SetKickoff();
		break;
	case MS_FULLTIME:
		GetApp()->PlayWhitleSound();
		Sleep(100);
		GetApp()->PlayWhitleSound();
		DeinitGame();
		//NewGame();
		break;
	}
}

HRESULT CFootballMatch::Draw(CSurface *pSurface, POINT ptStart)
{
	HRESULT hr;
	if(FAILED(hr = DrawGround(pSurface,ptStart)))
		return hr;
	switch(m_MatchState)
	{
	case MS_NONE:
		break;
	case MS_CHANGINGROOM:
		if(FAILED(hr = GetBall()->Draw(pSurface,ptStart)))			return hr;
		if(FAILED(hr = GetTeamNo(TEAM1)->Draw(pSurface,ptStart)))	return hr;
		if(FAILED(hr = GetTeamNo(TEAM2)->Draw(pSurface,ptStart)))	return hr;
		break;
	case MS_FIRST_HALF:
	case MS_SECOND_HALF:
		if(GetControlTeam()!=NULL)
			((CFootballTeamControl*)GetControlTeam())->GetControlPlayer()->DrawShadow(pSurface,ptStart);
		if(GetBall()->GetHeight()<PLAYER_HEIGHT)
		{
			if(FAILED(hr = GetBall()->Draw(pSurface,ptStart)))			return hr;
			if(FAILED(hr = GetTeamNo(TEAM1)->Draw(pSurface,ptStart)))	return hr;
			if(FAILED(hr = GetTeamNo(TEAM2)->Draw(pSurface,ptStart)))	return hr;
		}
		else
		{
			if(FAILED(hr = GetTeamNo(TEAM1)->Draw(pSurface,ptStart)))	return hr;
			if(FAILED(hr = GetTeamNo(TEAM2)->Draw(pSurface,ptStart)))	return hr;
			if(FAILED(hr = GetBall()->Draw(pSurface,ptStart)))			return hr;
		}
		if(FAILED(hr = GetScore()->Draw(pSurface,ptStart)))				return hr;
		break;
	case MS_HALF_TIME:
		break;
	case MS_FULLTIME:
		if(FAILED(hr = GetScore()->DrawStatis(pSurface,ptStart)))		return hr;
		break;
	}
	return S_OK;
}

// Access Method 
CFootballTeam* CFootballMatch::GetTeamNo(DWORD TeamNo)
{
	ASSERT(TeamNo == TEAM1 || TeamNo == TEAM2 || TeamNo == NOTEAM);
	if(m_pTeam[0]->GetTeamNo() == TeamNo) return m_pTeam[0];
	if(m_pTeam[1]->GetTeamNo() == TeamNo) return m_pTeam[1];
	return NULL;
}

void CFootballMatch::SwapDefendSide()
{
	m_DefendSide = !m_DefendSide;
}

void CFootballMatch::SwapControlTeam()
{
	m_ControlTeam = (m_ControlTeam+1)%3;
	ASSERT(m_ControlTeam == TEAM1 || m_ControlTeam == TEAM2 || m_ControlTeam == NOTEAM);
	if(GetControlTeam())
		GetControlTeam()->SwapControlPlayer();
}

void CFootballMatch::SwapTeamSide()
{
	CFootballTeam* Team = m_pTeam[0];
	m_pTeam[0] = m_pTeam[1];
	m_pTeam[1] = Team;
}

void CFootballMatch::SetTeam(DWORD TeamNo,CFootballTeam* pTeam)
{
	ASSERT(TeamNo == TEAM1 || TeamNo == TEAM2);
	ASSERT(pTeam != NULL);
	DWORD TeamSide = TeamNo - TEAM1;
	SAFE_DELETE(m_pTeam[TeamSide]);
	m_pTeam[TeamSide] = pTeam;
	m_pTeam[TeamSide]->SetTeamNo(TeamNo);
	m_pTeam[TeamSide]->SetMatch(this);
}

void CFootballMatch::MatchAction()
{
	CheckHaveBallPlayer();
	CheckFootballRule();
	GetTeamSide(LEFTSIDE)->TeamAction();
	GetTeamSide(RIGHTSIDE)->TeamAction();
}

void CFootballMatch::DoKey(BYTE Diks[])
{
	static OldDiks[256];
	switch(m_MatchState)
	{
	case MS_NONE:
		break;
	case MS_CHANGINGROOM:
		if(KEYPRESS(Diks,OldDiks,DIK_F)) 				NULL;
		else if(KEYRELEASE(Diks,OldDiks,DIK_F))	
			m_bWaitKick = FALSE;
		break;
	case MS_FIRST_HALF:
	case MS_SECOND_HALF:
		{
//			if(KEYPRESS(Diks,OldDiks,DIK_W)) 			
//			{
//				GetScore()->WriteOut("Swap Control Team");
//				SwapControlTeam(); 
//			} else if(KEYRELEASE(Diks,OldDiks,DIK_W))		NULL;

			CFootballTeamControl* ControlTeam = (CFootballTeamControl*)GetControlTeam();
			if(ControlTeam != NULL)
			{
				static DWORD KeyDir = NO_DIRECTION;
				if(KEYPRESS(Diks,OldDiks,DIK_S)) 				
				{
					ControlTeam->SwapControlPlayer();		
					GetScore()->WriteOut("Swap Player");
				} else if(KEYRELEASE(Diks,OldDiks,DIK_S))			NULL;
				if(KEYPRESS(Diks,OldDiks,DIK_UPARROW)) 			KeyDir |= NORTH; 
				else if(KEYRELEASE(Diks,OldDiks,DIK_UPARROW))	KeyDir &= (~NORTH);
				if(KEYPRESS(Diks,OldDiks,DIK_DOWNARROW))		KeyDir |= SOUTH; 
				else if(KEYRELEASE(Diks,OldDiks,DIK_DOWNARROW))	KeyDir &= (~SOUTH);
				if(KEYPRESS(Diks,OldDiks,DIK_LEFTARROW)) 		KeyDir |= WEST; 
				else if(KEYRELEASE(Diks,OldDiks,DIK_LEFTARROW))	KeyDir &= (~WEST);
				if(KEYPRESS(Diks,OldDiks,DIK_RIGHTARROW)) 		KeyDir |= EAST; 
				else if(KEYRELEASE(Diks,OldDiks,DIK_RIGHTARROW))KeyDir &= (~EAST);

				CFootballPlayer* ControlPlayer = ControlTeam->GetControlPlayer();
				if(KEYPRESS(Diks,OldDiks,DIK_F)) 				NULL;
				else if(KEYRELEASE(Diks,OldDiks,DIK_F))	
				{
					if(ControlPlayer->CanTouch(GetBall()))
					{
						GetBall()->Shoot(ControlPlayer,SHOOTSPEED,SHOOTANGLE);
						if(GetControlTeam()!=NULL)
							GetControlTeam()->SetControlPlayer(NULL);
					}
				}

				if(KeyDir == NO_DIRECTION)
					ControlPlayer->DoStops();
				else
				{
					m_bWaitKick = TRUE;
					ControlPlayer->SetDirection(KeyDir);
					ControlPlayer->DoRuns();
				}
			} 
		}
		break;
	case MS_HALF_TIME:
		{
			CFootballTeam* ControlTeam = GetControlTeam();
			if(ControlTeam != NULL)
			{
				if(KEYPRESS(Diks,OldDiks,DIK_F)) 				NULL;
				else if(KEYRELEASE(Diks,OldDiks,DIK_F))	
				{
					m_bWaitKick = FALSE;
				}
			} else
				m_bWaitKick = FALSE;
		}
	case MS_FULLTIME:
		if(KEYPRESS(Diks,OldDiks,DIK_F)) 				NULL;
		else if(KEYRELEASE(Diks,OldDiks,DIK_F))	
			m_bWaitKick = FALSE;
		break;
	}
}

void CFootballMatch::SetChangingRoom()
{
	GetTeamNo(TEAM1)->GetTactic()->SetChanging();
	GetTeamNo(TEAM2)->GetTactic()->SetChanging();
	GetBall()->SetLocation(CLocation(HALF_GROUND_HEIGHT,HALF_GROUND_WIDTH));
}

void CFootballMatch::SetKickoff()
{
	CLocation BallLoc = CLocation(HALF_GROUND_HEIGHT,HALF_GROUND_WIDTH);
	GetTeamNo(TEAM1)->GetTactic()->SetKickoff();
	GetTeamNo(TEAM2)->GetTactic()->SetKickoff();
	
	GetBall()->SetLocation(BallLoc);
	GetOffendTeam()->GetCloserPlayer(BallLoc)->SetLocation(BallLoc);
}

void CFootballMatch::SetCorner(DWORD CornerNo)
{
	CLocation Corner[] = { 
		CLocation(0+0.1				,0+0.1),
		CLocation(0+0.1				,GROUND_WIDTH-0.1),
		CLocation(GROUND_HEIGHT-0.1	,0+0.1),
		CLocation(GROUND_HEIGHT-0.1	,GROUND_WIDTH-0.1) 
	};
	
	CLocation BallLoc = Corner[CornerNo];
	//GetTeamSide(LEFTSIDE )->GetTactic()->SetCorner(CornerNo);
	//GetTeamSide(RIGHTSIDE)->GetTactic()->SetCorner(CornerNo);

	GetBall()->SetLocation(BallLoc);
	GetOffendTeam()->GetCloserPlayer(BallLoc)->SetLocation(BallLoc);
}

void CFootballMatch::SetFreeKick(DWORD CornerNo)
{
	CLocation FreeKick[] = {
		CLocation(GOAL_BOX_HEIGHT,HALF_GROUND_WIDTH-HALF_BOX_WIDTH),
		CLocation(GOAL_BOX_HEIGHT,HALF_GROUND_WIDTH+HALF_BOX_WIDTH),
		CLocation(GROUND_HEIGHT-GOAL_BOX_HEIGHT,HALF_GROUND_WIDTH-HALF_BOX_WIDTH),
		CLocation(GROUND_HEIGHT-GOAL_BOX_HEIGHT,HALF_GROUND_WIDTH+HALF_BOX_WIDTH)
	};

	CLocation BallLoc = FreeKick[CornerNo];
	//GetTeamSide(LEFTSIDE )->GetTactic()->SetFreeKick(BallLoc);
	//GetTeamSide(RIGHTSIDE)->GetTactic()->SetFreeKick(BallLoc);

	GetBall()->SetLocation(BallLoc);
	GetOffendTeam()->GetCloserPlayer(BallLoc)->SetLocation(BallLoc);
}

void CFootballMatch::CheckFootballRule()
{
	CFootballBall*	Ball		= GetBall();
	CFootballTeam*	BallTeam	= Ball->GetBallTeam();
	CLocation		BallLoc		= Ball->GetLocation();

	if(BallLoc.x<0)
	{
		if(BETWEEN(BallLoc.y,HALF_GROUND_WIDTH-HALF_BOX_WIDTH,HALF_GROUND_WIDTH+HALF_BOX_WIDTH))
		{
			GetScore()->AddScore(GetTeamSide(RIGHTSIDE)->GetTeamNo()); //Score Left
			SetDefendSide(RIGHTSIDE);
			GetApp()->PlayGoalSound();
			GetScore()->WriteOut("Score!!!!");
			SetKickoff();
		}
		else
		{
			DWORD CornerSide = (BallLoc.y<HALF_GROUND_WIDTH)?SC_TOPLEFT:SC_BOTTOMLEFT;
			SetDefendSide(BallTeam->GetTeamSide());
			if(BallTeam == GetTeamSide(LEFTSIDE))
			{
				GetScore()->WriteOut("Corner");
				SetCorner(CornerSide);
			}
			else 
			{
				GetScore()->WriteOut("FreeKick");
				SetFreeKick(CornerSide);
			}
			GetApp()->PlayWhitleSound();
		}
	}
	else if(BallLoc.x>GROUND_HEIGHT)
	{
		if(BETWEEN(BallLoc.y,HALF_GROUND_WIDTH-HALF_BOX_WIDTH,HALF_GROUND_WIDTH + HALF_BOX_WIDTH))
		{
			GetScore()->AddScore(GetTeamSide(LEFTSIDE)->GetTeamNo()); //Score Right
			SetDefendSide(LEFTSIDE );
			GetApp()->PlayGoalSound();
			GetScore()->WriteOut("Score!!!!");
			SetKickoff();
		}
		else
		{
			DWORD CornerSide = (BallLoc.y<HALF_GROUND_WIDTH)?SC_TOPRIGHT:SC_BOTTOMRIGHT;
			SetDefendSide(BallTeam->GetTeamSide());
			if(BallTeam == GetTeamSide(RIGHTSIDE))
			{
				GetScore()->WriteOut("Corner");
				SetCorner(CornerSide);
			}
			else 
			{
				GetScore()->WriteOut("FreeKick");
				SetFreeKick(CornerSide);
			}
			GetApp()->PlayWhitleSound();
		}
	}
	else if(BallLoc.y<0 || BallLoc.y>GROUND_WIDTH)
	{
		BallLoc.y = (BallLoc.y<0)?0.1:(BallLoc.y>GROUND_WIDTH)?GROUND_WIDTH-0.1:BallLoc.y;
		SetDefendSide(BallTeam->GetTeamSide());

		//GetTeamSide(LEFTSIDE )->GetTactic()->SetThrowIn(BallLoc);
		//GetTeamSide(RIGHTSIDE)->GetTactic()->SetThrowIn(BallLoc);
		GetScore()->WriteOut("Throw In..");
		
		Ball->SetLocation(BallLoc);
		CFootballPlayer* CloserPlayer = GetOffendTeam()->GetCloserPlayer(BallLoc);
		CloserPlayer->SetLocation(BallLoc);

		GetApp()->PlayWhitleSound();
	}
}

CFootballTeam* CFootballMatch::GetOffendTeam()
{
	ASSERT(m_DefendSide == LEFTSIDE || m_DefendSide == RIGHTSIDE);
	ASSERT(LEFTSIDE+1 == RIGHTSIDE);
	return m_pTeam[(m_DefendSide-LEFTSIDE+1)%2];
}

CFootballTeam* CFootballMatch::GetDefendTeam()
{
	ASSERT(m_DefendSide == LEFTSIDE || m_DefendSide == RIGHTSIDE);
	ASSERT(LEFTSIDE+1 == RIGHTSIDE);
	return m_pTeam[m_DefendSide-LEFTSIDE];
}

DWORD CFootballMatch::GetDefendSide()
{
	return m_DefendSide; 
}

void CFootballMatch::SetDefendSide(DWORD TeamSide)
{
	ASSERT(TeamSide == LEFTSIDE || TeamSide == RIGHTSIDE);
	m_DefendSide = TeamSide; 
	//Debug("Set Defend %s",(TeamSide==LEFTSIDE)?"Left":"Right");
}

void CFootballMatch::SetControlTeam(DWORD TeamSide)
{
	ASSERT(TeamSide == TEAM1 || TeamSide == TEAM2 || TeamSide == NOTEAM);
	// Reset Control Player
	if(m_ControlTeam != NOTEAM) 
		GetControlTeam()->SetControlPlayer(NULL);

	m_ControlTeam = TeamSide;

	// Set Control Player
	if(TeamSide != NOTEAM)
		GetControlTeam()->SwapControlPlayer();
}

CFootballTeamControl* CFootballMatch::GetControlTeam() 
{
	ASSERT(m_ControlTeam == TEAM1 || m_ControlTeam == TEAM2 || m_ControlTeam == NOTEAM);
	return (CFootballTeamControl*)GetTeamNo(m_ControlTeam);
}

CLocation CFootballMatch::GetCornerLoc(DWORD Pos)
{
	CLocation CornerLoc[] = { 
		CLocation(0,0),
		CLocation(0,GROUND_WIDTH),
		CLocation(GROUND_HEIGHT,0),
		CLocation(GROUND_HEIGHT,GROUND_WIDTH) };

	ASSERT(Pos == SC_TOPLEFT || Pos == SC_BOTTOMLEFT || Pos == SC_TOPRIGHT || Pos == SC_BOTTOMRIGHT);
	ASSERT(SC_TOPLEFT == 0 && SC_BOTTOMLEFT == 1 && SC_TOPRIGHT == 2 && SC_BOTTOMRIGHT == 3);
	return CornerLoc[Pos];
}
/*

#define ENDOFFILE 0xfffff

void CFootballManager::Load(CDFile &file)
{
	m_ControlSide	= file.ReadDWORD();
	m_DefenceSide	= file.ReadDWORD();
	m_MatchState	= file.ReadDWORD();
	m_WaitKick		= file.ReadDWORD();
	m_Ball->Load(file);
	m_Score->Load(file);
	m_Team[LEFTSIDE ]->Load(file);
	m_Team[RIGHTSIDE]->Load(file);
	ASSERT(ENDOFFILE == file.ReadDWORD());
}

void CFootballManager::Save(CDFile &file)
{
	file.WriteDWORD(m_ControlSide);
	file.WriteDWORD(m_DefenceSide);
	file.WriteDWORD(m_MatchState);
	file.WriteDWORD(m_WaitKick);
	m_Ball->Save(file);
	m_Score->Save(file);
	m_Team[LEFTSIDE ]->Save(file);
	m_Team[RIGHTSIDE]->Save(file);
	ASSERT(file.WriteDWORD(ENDOFFILE));
}
*/

void CFootballMatch::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		ar << m_MatchState << m_ControlTeam << m_DefendSide;
		m_pBall->Serialize(ar);
		m_pTeam[LEFTSIDE]->Serialize(ar);
		m_pTeam[RIGHTSIDE]->Serialize(ar);
		m_pScore->Serialize(ar);
	}
	else
	{
		ar >> m_MatchState >> m_ControlTeam >> m_DefendSide;
		m_pBall->Serialize(ar);
		m_pTeam[LEFTSIDE]->Serialize(ar);
		m_pTeam[RIGHTSIDE]->Serialize(ar);
		m_pScore->Serialize(ar);
	}
}

void CFootballMatch::CheckHaveBallPlayer()
{
	CFootballBall*		Ball = GetBall();
	PCFootballPlayer	PlayerList[2*NUMBER_OF_PLAYERS];
	DWORD Count = 0;
	// Find All Closer Ball Player
	for(DWORD TeamNo=TEAM1;TeamNo<=TEAM2;TeamNo++)
	{
		CFootballTeam* Team = GetTeamNo(TeamNo);
		for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)

		{
			CFootballPlayer* Player = Team->GetPlayer(PlayerNo);
			if(Player->CanTouch(Ball))
				PlayerList[Count++]=Player;
		}
	}
	// Remove Kicker that just shoot ball
	DWORD KickerPos = FindPlayer(PlayerList,Ball->GetKicker(),Count);
	if(KickerPos < Count && Ball->GetKickTime()<1000)
		PlayerList[KickerPos] = PlayerList[--Count];

	DWORD PlayerNo;
	if(Count>0)
	{
		CFootballPlayer* ControlBallPlayer = Ball->GetControlBallPlayer();
		if(ControlBallPlayer != NULL && Count > 1)
		{
			// Remove ControlBallPlayer
			PlayerList[FindPlayer(PlayerList,ControlBallPlayer,Count)] = PlayerList[--Count];

			PlayerNo = rand()%Count;
			DWORD BallDir = DirectionNo(ControlBallPlayer->GetDirection());
			DWORD PlayerDir = DirectionNo(PlayerList[PlayerNo]->GetDirection());
			while  (Count>0 && PlayerList[PlayerNo] && abs(PlayerDir - BallDir) < 2)
			{
				PlayerList[PlayerNo] = PlayerList[--Count];
				if(Count==0)
					return ;
				PlayerNo = rand()%Count;
				PlayerDir = DirectionNo(PlayerList[PlayerNo]->GetDirection());
			}
		}
		else 
			PlayerNo = rand()%Count;
		
		// If Player in same team not pass 
		if(ControlBallPlayer == NULL || 
			ControlBallPlayer->GetTeam() != PlayerList[PlayerNo]->GetTeam())
		{
			static DWORD ChangePlayerTime = -1;
			if(timeGetTime() - ChangePlayerTime < 100) 
				return;
			ChangePlayerTime = timeGetTime();

			const static Buffer = 2;
			static CFootballPlayer* OldPlayer[3];
			for(int i=0;i<Buffer-1;i++)
				OldPlayer[i] = OldPlayer[i+1];
			for(i=0;i<Buffer-1;i++)
				if(PlayerList[PlayerNo]==OldPlayer[i]) 
					return;
			OldPlayer[Buffer-1] = PlayerList[PlayerNo];

			Ball->SetControlBallPlayer(PlayerList[PlayerNo]);
			
			// Set Control Player
			if(GetControlTeam() == PlayerList[PlayerNo]->GetTeam() && 
				GetControlTeam()->GetControlPlayer() != PlayerList[PlayerNo])
			{
				GetControlTeam()->SetControlPlayer(PlayerList[PlayerNo]);
			}
		}
	}
}

CFootballTeam* CFootballMatch::GetOppositTeam(CFootballTeam *pTeam)
{
	if(pTeam == GetTeamNo(TEAM1)) return GetTeamNo(TEAM2);
	else if(pTeam == GetTeamNo(TEAM2)) return GetTeamNo(TEAM1);
	else return NULL;
}

//-----------------------------------------------------------------------------
// Name: CFootballMatch()
//-----------------------------------------------------------------------------
CFootballMatch::CFootballMatch(CFootballApp* App)
{
	m_MatchState	= MS_NONE;
	m_ControlTeam	= NOTEAM;
	m_DefendSide	= LEFTSIDE;

	m_pBall		= NULL;
	m_pTeam[0]	= NULL;
	m_pTeam[1]	= NULL;
	m_pScore	= NULL;
	m_pDisplay	= NULL;
	m_pApp		= App;

	m_ptGroundBorder.x		= 10;
	m_ptGroundBorder.y		= 10;
	m_pGroundSurface		= NULL;
	
	m_pBall			= new CFootballBall(this);
	m_pScore		= new CFootballScore(this);
	m_pGroundSurface = NULL;
	m_bActive = FALSE;
}

//-----------------------------------------------------------------------------
// Name: CreateSurface()
//-----------------------------------------------------------------------------
HRESULT CFootballMatch::CreateSurface(CDisplay *pDisplay)
{
	HRESULT hr;
	m_pDisplay = pDisplay;
	if(FAILED(hr = CreateGroundSurface(m_pDisplay)))		return hr;
	if(FAILED(hr = m_pBall->CreateSurface(m_pDisplay)))		return hr;
	if(FAILED(hr = m_pScore->CreateSurface(m_pDisplay)))	return hr;
	if(m_pTeam[0]) if(FAILED(hr = m_pTeam[0]->CreateSurface(m_pDisplay)))	return hr;
	if(m_pTeam[1]) if(FAILED(hr = m_pTeam[1]->CreateSurface(m_pDisplay)))	return hr;
	return S_OK;
}

//-----------------------------------------------------------------------------
// Name: ReleaseSurface()
//-----------------------------------------------------------------------------
void CFootballMatch::ReleaseSurface()
{
 	SAFE_DELETE(m_pGroundSurface);
	m_pBall->ReleaseSurface();
	m_pScore->ReleaseSurface();
	if(m_pTeam[0]) m_pTeam[0]->ReleaseSurface();
	if(m_pTeam[1]) m_pTeam[1]->ReleaseSurface();
}

//-----------------------------------------------------------------------------
// Name: ~CFootballMatch()
//-----------------------------------------------------------------------------
CFootballMatch::~CFootballMatch()
{
	SAFE_DELETE(m_pBall);
	SAFE_DELETE(m_pScore);
	SAFE_DELETE(m_pTeam[0]);
	SAFE_DELETE(m_pTeam[1]);
}

//-----------------------------------------------------------------------------
// Name: InitGame()
//-----------------------------------------------------------------------------
void CFootballMatch::InitGame()
{
	m_pTeam[0]->CreateSurface(m_pDisplay);
	m_pTeam[1]->CreateSurface(m_pDisplay);
	
	GetScore()->StartMatch();
//	m_pTeam[0]->InitialTeam();
//	m_pTeam[1]->InitialTeam();
	SetKickoff();
	m_bActive = TRUE;
}

//-----------------------------------------------------------------------------
// Name: DeinitGame()
//-----------------------------------------------------------------------------
void CFootballMatch::DeinitGame()
{
	if(m_bActive)
	{
		m_pTeam[0]->ReleaseSurface();
		m_pTeam[1]->ReleaseSurface();
		GetScore()->EndMatch();
//		m_pTeam[0]->DeinitialTeam();
//		m_pTeam[1]->DeinitialTeam();
		m_bActive = FALSE;
	}
}

HRESULT	CFootballMatch::CreateGroundSurface(CDisplay* pDisplay)
{
	HRESULT hr;
	HDC hDC;
	CSurface* pGrassSurface;
	
	m_rcGroundRect = GetApp()->GetAppClientRect();
	DWORD dwWidth  = RECTWIDTH(m_rcGroundRect)  + 90;
	DWORD dwHeight = RECTHEIGHT(m_rcGroundRect) + 90;

	if(FAILED(hr = pDisplay->CreateSurfaceFromBitmap(&pGrassSurface,"Resource\\Grass.bmp",90,90)))
		return hr;
	if(FAILED(hr = pDisplay->CreateSurface(&m_pGroundSurface,dwWidth,dwHeight)))
		return hr;

	for(DWORD x=0;x<dwWidth;x+=90)
	   for(DWORD y=0;y<dwHeight;y+=90)
			m_pGroundSurface->Blt(x,y,pGrassSurface);

	SAFE_DELETE(pGrassSurface);

	if(FAILED(hr = m_pGroundSurface->GetDDrawSurface()->GetDC(&hDC)))
		return hr;

	HPEN	hOutLinePen		= CreatePen(PS_SOLID,5,RGB(255,255,255));
	HPEN	hLinePen		= CreatePen(PS_SOLID,4,RGB(255,255,255));
	HPEN	hCornerPen		= CreatePen(PS_SOLID,3,RGB(250,250,250));

	HBRUSH	hNullBrush		= (HBRUSH)GetStockObject(NULL_BRUSH);
	HBRUSH	hFillBrush		= (HBRUSH)CreateSolidBrush(RGB(255,255,255));

	HPEN	hOldPen			= (HPEN)SelectObject(hDC,hLinePen);
	HBRUSH	hOldBrush		= (HBRUSH)SelectObject(hDC,hNullBrush);

	m_RatioX = (RECTWIDTH(m_rcGroundRect) -2*m_ptGroundBorder.x)/GROUND_HEIGHT;
	m_RatioY = (RECTHEIGHT(m_rcGroundRect)-2*m_ptGroundBorder.y)/GROUND_WIDTH;

	SelectObject(hDC,hOutLinePen);
	Rectangle(hDC,ConvX(0),ConvY(0),ConvX(GROUND_HEIGHT),ConvY(GROUND_WIDTH));

	SelectObject(hDC,hLinePen);
	MoveToEx(hDC,ConvX(HALF_GROUND_HEIGHT),ConvY(0),NULL);
	LineTo  (hDC,ConvX(HALF_GROUND_HEIGHT),ConvY(GROUND_WIDTH));

	Ellipse(hDC,ConvX(HALF_GROUND_HEIGHT-CIRCLE),ConvY(HALF_GROUND_WIDTH-CIRCLE),
				ConvX(HALF_GROUND_HEIGHT+CIRCLE),ConvY(HALF_GROUND_WIDTH+CIRCLE));

	SelectObject(hDC,hCornerPen);
	Arc(hDC,ConvX(0-CORNER_RADIUS),ConvY(0-CORNER_RADIUS),
			ConvX(0+CORNER_RADIUS),ConvY(0+CORNER_RADIUS),
			ConvX(0)			  ,ConvY(0+CORNER_RADIUS),
			ConvX(0+CORNER_RADIUS),ConvY(0));

	Arc(hDC,ConvX(0-CORNER_RADIUS),ConvY(GROUND_WIDTH-CORNER_RADIUS),
			ConvX(0+CORNER_RADIUS),ConvY(GROUND_WIDTH+CORNER_RADIUS),
			ConvX(0+CORNER_RADIUS),ConvY(GROUND_WIDTH),
			ConvX(0)			  ,ConvY(GROUND_WIDTH-CORNER_RADIUS));

	Arc(hDC,ConvX(GROUND_HEIGHT-CORNER_RADIUS),ConvY(GROUND_WIDTH-CORNER_RADIUS),
			ConvX(GROUND_HEIGHT+CORNER_RADIUS),ConvY(GROUND_WIDTH+CORNER_RADIUS),
			ConvX(GROUND_HEIGHT) 			  ,ConvY(GROUND_WIDTH-CORNER_RADIUS),
			ConvX(GROUND_HEIGHT-CORNER_RADIUS),ConvY(GROUND_WIDTH));

	Arc(hDC,ConvX(GROUND_HEIGHT-CORNER_RADIUS),ConvY(0-CORNER_RADIUS),
			ConvX(GROUND_HEIGHT+CORNER_RADIUS),ConvY(0+CORNER_RADIUS),
			ConvX(GROUND_HEIGHT-CORNER_RADIUS),ConvY(0),
			ConvX(GROUND_HEIGHT)		 	  ,ConvY(0+CORNER_RADIUS));
	
	SelectObject(hDC,hLinePen);
	Rectangle(hDC,ConvX(0)					,ConvY(HALF_GROUND_WIDTH-PENALTY_BOX_WIDTH/2),
				  ConvX(PENALTY_BOX_HEIGHT)	,ConvY(HALF_GROUND_WIDTH+PENALTY_BOX_WIDTH/2));
	Rectangle(hDC,ConvX(GROUND_HEIGHT-PENALTY_BOX_HEIGHT)	,ConvY(HALF_GROUND_WIDTH-PENALTY_BOX_WIDTH/2),
				  ConvX(GROUND_HEIGHT)						,ConvY(HALF_GROUND_WIDTH+PENALTY_BOX_WIDTH/2));

	Arc(hDC,ConvX(PENALTY_POINT_Y-PENALTY_RADIUS),ConvY(HALF_GROUND_WIDTH-PENALTY_RADIUS),
			ConvX(PENALTY_POINT_Y+PENALTY_RADIUS),ConvY(HALF_GROUND_WIDTH+PENALTY_RADIUS),
			ConvX(PENALTY_BOX_HEIGHT)			 ,ConvY(HALF_GROUND_WIDTH+GOAL_BOX_HEIGHT),
			ConvX(PENALTY_BOX_HEIGHT)			 ,ConvY(HALF_GROUND_WIDTH-GOAL_BOX_HEIGHT));

	Arc(hDC,ConvX(GROUND_HEIGHT-PENALTY_POINT_Y-PENALTY_RADIUS),ConvY(HALF_GROUND_WIDTH-PENALTY_RADIUS),
			ConvX(GROUND_HEIGHT-PENALTY_POINT_Y+PENALTY_RADIUS),ConvY(HALF_GROUND_WIDTH+PENALTY_RADIUS),
			ConvX(GROUND_HEIGHT-PENALTY_BOX_HEIGHT)			   ,ConvY(HALF_GROUND_WIDTH-GOAL_BOX_HEIGHT),
			ConvX(GROUND_HEIGHT-PENALTY_BOX_HEIGHT)			   ,ConvY(HALF_GROUND_WIDTH+GOAL_BOX_HEIGHT));

	SelectObject(hDC,hOutLinePen);
	Rectangle(hDC,ConvX(0)					,ConvY(HALF_GROUND_WIDTH-GOAL_BOX_WIDTH/2),
				  ConvX(GOAL_BOX_HEIGHT)	,ConvY(HALF_GROUND_WIDTH+GOAL_BOX_WIDTH/2));
	Rectangle(hDC,ConvX(GROUND_HEIGHT-GOAL_BOX_HEIGHT)	,ConvY(HALF_GROUND_WIDTH-GOAL_BOX_WIDTH/2),
				  ConvX(GROUND_HEIGHT)					,ConvY(HALF_GROUND_WIDTH+GOAL_BOX_WIDTH/2));

	SelectObject(hDC,hFillBrush);
	Ellipse(hDC,ConvX(PENALTY_POINT_Y-0.15),ConvY(HALF_GROUND_WIDTH-0.15),
				ConvX(PENALTY_POINT_Y+0.15),ConvY(HALF_GROUND_WIDTH+0.15));

	Ellipse(hDC,ConvX(GROUND_HEIGHT-PENALTY_POINT_Y-0.15),ConvY(HALF_GROUND_WIDTH-0.15),
				ConvX(GROUND_HEIGHT-PENALTY_POINT_Y+0.15),ConvY(HALF_GROUND_WIDTH+0.15));
	
	Ellipse(hDC,ConvX(HALF_GROUND_HEIGHT-0.5)+1,ConvY(HALF_GROUND_WIDTH-0.5),
				ConvX(HALF_GROUND_HEIGHT+0.5)+1,ConvY(HALF_GROUND_WIDTH+0.5));

	SelectObject(hDC,hOldPen);
	SelectObject(hDC,hOldBrush);
	DeleteObject(hLinePen);
	DeleteObject(hOutLinePen);
	DeleteObject(hFillBrush);
	DeleteObject(hCornerPen);
	return m_pGroundSurface->GetDDrawSurface()->ReleaseDC(hDC);
}

HRESULT	CFootballMatch::DrawGround(CSurface* pSurface,POINT ptStart)
{
	return pSurface->Blt(ptStart.x,ptStart.y,m_pGroundSurface,&m_rcGroundRect);
}

void CFootballMatch::MakePassData(CKickData *pKickdata)
{
	CLocation			Loc;
	CFootballPlayer*	Player = GetBall()->GetKicker(); 
	CFootballTeam*		Team = Player->GetTeam();
	pKickdata->KickerNo = Player->GetPlayerNo();
	pKickdata->KickerDir = DirectionNo(Player->GetDirection());

	for(int PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		Player	= Team->GetPlayer(PlayerNo);
		Loc		= Player->GetLocation();
		pKickdata->KickerTeamLoc[PlayerNo].x	=	ROUND(Loc.x);
		pKickdata->KickerTeamLoc[PlayerNo].y	=	ROUND(Loc.y);
	}
	Team = GetOppositTeam(Team);
	for(PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		Player	= Team->GetPlayer(PlayerNo);
		Loc		= Player->GetLocation();
		pKickdata->OppTeamLoc[PlayerNo].x	=	ROUND(Loc.x);
		pKickdata->OppTeamLoc[PlayerNo].y	=	ROUND(Loc.y);
	}
}
