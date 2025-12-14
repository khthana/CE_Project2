// FootballScore.cpp: implementation of the CFootballScore class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballScore.h"

#include <direct.h>
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_SERIAL(CFootballScore,CObject,0)

const DWORD FONTHEIGHT		= 15;
const DWORD BACKCOLOR		= RGB(0,0,0);

CFootballScore::CFootballScore(CFootballMatch* Match)
{
	m_dwRatio = 30;
	m_bActive = FALSE;
	ClearScore();

	m_pMatch = Match;
	m_ScoreSurface = NULL;
	m_WriteOutSurface = NULL;

	m_KickList = new CArrayOfKickData;
	m_KickData = NULL;
}

void CFootballScore::ClearScore()
{
	memset(m_Score,0,sizeof(m_Score));
	memset(m_TeamTime,0,sizeof(m_TeamTime));
	memset(m_PassTotal,0,sizeof(m_PassTotal));
	memset(m_PassSuccess,0,sizeof(m_PassSuccess));
	m_dwTime = 0;
}

CFootballScore::~CFootballScore()
{
	SAFE_DELETE(m_KickData);
	for(int Pos=0;Pos<m_KickList->GetSize();Pos++)
		delete m_KickList->GetAt(Pos);
	SAFE_DELETE(m_KickList);
}

void CFootballScore::StartMatch()
{
	ClearScore();
	m_ShootTeam = NULL;
	m_bActive = TRUE;
}

void CFootballScore::EndMatch()
{
	if(m_bActive)
	{
		SaveScoreLog(SCORE_LOGFILE);
		SAFE_DELETE(m_KickData);
		PCArrayOfKickData OldKickList = new CArrayOfKickData();
		LoadKickData(DATA_FILE,OldKickList);
		for(int i=0;i<OldKickList->GetSize();i++)
		{
			CKickData *Data = OldKickList->GetAt(i);
			for(int j=0;j<m_KickList->GetSize();j++)
			{
				if(*Data == *m_KickList->GetAt(j))
					break;
			}
			if(j == m_KickList->GetSize())
			{
				OldKickList->SetAt(i,NULL);
				m_KickList->Add(Data);
			}
		}
		SaveDataLog(DATA_LOGFILE);
		SaveKickData(DATA_FILE,m_KickList);
		for(int Pos=0;Pos<OldKickList->GetSize();Pos++)
			delete OldKickList->GetAt(Pos);
		SAFE_DELETE(OldKickList);
		for(Pos=0;Pos<m_KickList->GetSize();Pos++)
			delete m_KickList->GetAt(Pos);
		SAFE_DELETE(m_KickList);
		
		m_KickList = new CArrayOfKickData();
		m_bActive = FALSE;
	}
}

HRESULT CFootballScore::CreateSurface(CDisplay *pDisplay)
{
	pDisplay->CreateSurface(&m_ScoreSurface,200,FONTHEIGHT*4);
	m_ScoreSurface->SetColorKey(BACKCOLOR);
	pDisplay->CreateSurface(&m_WriteOutSurface,400,FONTHEIGHT*10);
	m_WriteOutSurface->SetColorKey(BACKCOLOR);
	LPDIRECTDRAWSURFACE7 pddsWriteOutSurface = m_WriteOutSurface->GetDDrawSurface();

    DDBLTFX ddbltfx;
    ZeroMemory( &ddbltfx, sizeof(ddbltfx) );
    ddbltfx.dwSize      = sizeof(ddbltfx);
    ddbltfx.dwFillColor = BACKCOLOR;
    
	pddsWriteOutSurface->Blt( NULL, NULL, NULL, DDBLT_COLORFILL, &ddbltfx );
	return S_OK;
}

void CFootballScore::ReleaseSurface()
{
	SAFE_DELETE(m_ScoreSurface);
	SAFE_DELETE(m_WriteOutSurface);
}

void CFootballScore::Update(DWORD dwTickDiff)
{
	CFootballTeam* BallTeam = m_pMatch->GetBall()->GetBallTeam();
	if(BallTeam!=NULL)
		m_TeamTime[BallTeam->GetTeamNo()]+=dwTickDiff;
	m_dwTime += dwTickDiff;
}

HRESULT CFootballScore::Draw(CSurface *pSurface, POINT ptStart)
{
	TCHAR TeamName[40];
	TCHAR Score[20];

	// Clear Score Surface
	LPDIRECTDRAWSURFACE7 pddsScoreSurface = m_ScoreSurface->GetDDrawSurface();

    DDBLTFX ddbltfx;
    ZeroMemory( &ddbltfx, sizeof(ddbltfx) );
    ddbltfx.dwSize      = sizeof(ddbltfx);
    ddbltfx.dwFillColor = BACKCOLOR;
    
	pddsScoreSurface->Blt( NULL, NULL, NULL, DDBLT_COLORFILL, &ddbltfx );
	
	// Draw Team Name & Score
	for(int TeamNo=TEAM1;TeamNo<=TEAM2;TeamNo++)
	{
		CFootballTeam* Team = m_pMatch->GetTeamNo(TeamNo);
		if(Team)
			strcpy(TeamName,Team->GetTeamName());
		else
			wsprintf(TeamName,"TEAM%d",TeamNo);
		wsprintf(Score,"%d",GetScore(TeamNo));
		m_ScoreSurface->DrawText(NULL,TeamName,0,FONTHEIGHT*(TeamNo-1),BACKCOLOR,RGB(0,0,255));
		m_ScoreSurface->DrawText(NULL,Score ,100,FONTHEIGHT*(TeamNo-1),BACKCOLOR,RGB(255,0,0));
	}

	// Draw Time
	TCHAR TimeStr[20];
	DWORD Time = GetTime();
	wsprintf(TimeStr,"%02d:%02d",Time/60,Time%60);
	m_ScoreSurface->DrawText(NULL,TimeStr,120,FONTHEIGHT/2,BACKCOLOR,RGB(255,0,0));

	RECT rcDest;
	RECT rcClient = g_App->GetAppClientRect();
	SetRect(&rcDest,ptStart.x+40,ptStart.y+40,
		ptStart.x+40+250,
		ptStart.y+40+100);
	LPDIRECTDRAWSURFACE7 pddsSurface = pSurface->GetDDrawSurface();
	pddsSurface->Blt(&rcDest,pddsScoreSurface,NULL,DDBLT_KEYSRC,NULL);

	pSurface->Blt(ptStart.x+20,ptStart.y+RECTHEIGHT(rcClient)-FONTHEIGHT*10-50, m_WriteOutSurface);
	return S_OK;
}

HRESULT CFootballScore::DrawStatis(CSurface *pSurface, POINT ptStart)
{
	// Clear Score Surface
	LPDIRECTDRAWSURFACE7 pddsScoreSurface = m_ScoreSurface->GetDDrawSurface();
    DDBLTFX ddbltfx;
    ZeroMemory( &ddbltfx, sizeof(ddbltfx) );
    ddbltfx.dwSize      = sizeof(ddbltfx);
    ddbltfx.dwFillColor = BACKCOLOR;
	pddsScoreSurface->Blt( NULL, NULL, NULL, DDBLT_COLORFILL, &ddbltfx );

	TCHAR TeamName[40];
	TCHAR Score[20];
	TCHAR TimeStr[20];
	m_ScoreSurface->DrawText(NULL,"TeamName",    0,0,BACKCOLOR,RGB(128,128,128));
	m_ScoreSurface->DrawText(NULL,"Score",      80,0,BACKCOLOR,RGB(128,128,128));
	m_ScoreSurface->DrawText(NULL,"%Pass",	   120,0,BACKCOLOR,RGB(128,128,128));
	for(int TeamNo=TEAM1;TeamNo<=TEAM2;TeamNo++)
	{
		CFootballTeam* Team = m_pMatch->GetTeamNo(TeamNo);
		if(Team)
			strcpy(TeamName,Team->GetTeamName());
		else
			wsprintf(TeamName,"TEAM%d",TEAM1);
		sprintf(Score,"%d",GetScore(TeamNo));
		sprintf(TimeStr,"%.0f%%%d/%d",GetPassRatio(TeamNo)*100,m_PassSuccess[TeamNo],m_PassTotal[TeamNo]);
		m_ScoreSurface->DrawText(NULL,TeamName,  0,FONTHEIGHT*TeamNo,BACKCOLOR,RGB(0,0,255));
		m_ScoreSurface->DrawText(NULL,Score   ,100,FONTHEIGHT*TeamNo,BACKCOLOR,RGB(255,0,0));
		m_ScoreSurface->DrawText(NULL,TimeStr ,120,FONTHEIGHT*TeamNo,BACKCOLOR,RGB(255,0,0));
	}
	TCHAR Result[20];
	CFootballTeam* Winner = GetWinner();
	if(Winner) wsprintf(Result,"%s Win!!!",Winner->GetTeamName());
	else wsprintf(Result,"Equal");
	m_ScoreSurface->DrawText(NULL,Result,0,FONTHEIGHT*3,RGB(0,255,0),RGB(255,0,0));

	RECT rcDest;
	SetRect(&rcDest,ptStart.x+150,ptStart.y+100,ptStart.x+600,ptStart.y+300);
	LPDIRECTDRAWSURFACE7 pddsSurface = pSurface->GetDDrawSurface();
	pddsSurface->Blt(&rcDest,pddsScoreSurface,NULL,DDBLT_KEYSRC,NULL);
	return S_OK;
}

void CFootballScore::SetMatch(CFootballMatch* pMatch)
{
	m_pMatch = pMatch;
}

DWORD CFootballScore::GetScore(DWORD TeamNo)
{
	ASSERT(TeamNo==TEAM1||TeamNo==TEAM2);
	return m_Score[TeamNo];
}

DOUBLE CFootballScore::GetProsRatio(DWORD TeamNo)
{
	ASSERT(TeamNo==TEAM1||TeamNo==TEAM2);
	return (double)m_TeamTime[TeamNo]/m_dwTime;
}

void CFootballScore::AddScore(DWORD TeamNo)
{
	ASSERT(TeamNo==TEAM1||TeamNo==TEAM2);
	m_Score[TeamNo]++;
}

DWORD CFootballScore::GetTime()
{
	return m_dwTime/m_dwRatio;
}

double CFootballScore::GetPassRatio(DWORD TeamNo)
{
	ASSERT(TeamNo==TEAM1||TeamNo==TEAM2);
	return (m_PassTotal[TeamNo]==0)?0:(double)m_PassSuccess[TeamNo]/m_PassTotal[TeamNo];
}

void CFootballScore::Serialize(CArchive &ar)
{
	CObject::Serialize(ar);	
	if (ar.IsStoring())
	{
		ar << m_dwTime << m_Score[0] << m_Score[1] << m_dwRatio;
		m_KickList->Serialize(ar);
	}
	else
	{
		ar >> m_dwTime >> m_Score[0] >> m_Score[1] >> m_dwRatio;
		m_KickList->Serialize(ar);
	}
}

void CFootballScore::SaveScoreLog(LPSTR ScoreFilename)
{
	FILE* ScoreFile;
	if(ScoreFile = fopen(ScoreFilename,"a"))
	{
		CFootballTeam* Team1 = m_pMatch->GetTeamNo(TEAM1);
		CFootballTeam* Team2 = m_pMatch->GetTeamNo(TEAM2);
		SYSTEMTIME	st;
		GetSystemTime(&st);
		fprintf(ScoreFile,
			"Team %s : %d(%0.2f,%0.2f)%s Team %s : %d(%0.2f,%0.2f)%s "
			"[%02d/%02d/%04d %02d:%02d]\n",
			Team1->GetTeamName(),GetScore(TEAM1),GetProsRatio(TEAM1),GetPassRatio(TEAM1),Team1->GetType(),
			Team2->GetTeamName(),GetScore(TEAM2),GetProsRatio(TEAM2),GetPassRatio(TEAM2),Team2->GetType(),
			st.wDay,st.wMonth,st.wYear,st.wHour,st.wMinute);
		fclose(ScoreFile);
	}
}
/*
void CFootballScore::Load(CDFile &file)
{
	m_Ready			  = file.ReadDWORD();	
	m_EnableTimer	  = file.ReadDWORD();
	m_TimerTime		  = file.ReadDWORD();
	m_Score[TS_LEFT ] = file.ReadDWORD();
	m_Score[TS_RIGHT] = file.ReadDWORD();
}

void CFootballScore::Save(CDFile &file)
{
	file.WriteDWORD(m_Ready);
	file.WriteDWORD(m_EnableTimer);
	file.WriteDWORD(m_TimerTime);
	file.WriteDWORD(m_Score[TS_LEFT ]);
	file.WriteDWORD(m_Score[TS_RIGHT]);
}*/

CFootballTeam* CFootballScore::GetWinner()
{
	if(m_Score[TEAM1]>m_Score[TEAM2])
		return m_pMatch->GetTeamNo(TEAM1);
	else if(m_Score[TEAM1]<m_Score[TEAM2])
		return m_pMatch->GetTeamNo(TEAM2);
	else
		return NULL;
}

CFootballTeam*		m_pKickTeam	= NULL;
CFootballTeam*		m_pOppTeam	= NULL;

void CFootballScore::DoShoot(CFootballPlayer* BallShooter)
{
	CLocation			Loc;
	m_pKickTeam	= BallShooter->GetTeam();
	m_PassTotal[m_pKickTeam->GetTeamNo()]++;
	if(m_KickData == NULL)
	{
		m_KickData = new CKickData();
	}
	m_pMatch->MakePassData(m_KickData);
}

void CFootballScore::DoResult(CFootballPlayer* ControlBall)
{
	CFootballTeam* ReceiveTeam	= ControlBall->GetTeam();
	if(m_KickData)
	{
		DWORD TeamSide = ReceiveTeam->GetTeamSide();
		if(m_pKickTeam == ReceiveTeam) 
		{
			m_PassSuccess[m_pKickTeam->GetTeamNo()]++;
			m_KickData->Result = TRUE;
		} else m_KickData->Result = FALSE;
		m_KickList->Add(m_KickData);
		m_KickData = NULL;
	}
}

BOOL CFootballScore::LoadKickData(LPSTR KickDataFilename,PCArrayOfKickData KickList)
{
	CFile KickFile;
	CKickData*	pKickData;
	if(KickFile.Open(KickDataFilename,CFile::modeReadWrite))
	{
		pKickData = new CKickData();
		while(pKickData->Load(KickFile))
		{
			KickList->Add(pKickData);
			pKickData = new CKickData();
		}
		SAFE_DELETE(pKickData);
		KickFile.Close();
	}
	return TRUE;
}

BOOL CFootballScore::SaveKickData(LPSTR KickDataFilename,PCArrayOfKickData KickList)
{
	CFile KickFile;
	CKickData* KickData;
	if(KickFile.Open(KickDataFilename,CFile::modeCreate | CFile::modeWrite))
	{
		int Size = KickList->GetSize();
		for(int i=0;i<Size;i++)
		{
			KickData = KickList->GetAt(i);
			KickData->Save(KickFile);
		}
		KickFile.Close();
	}
	
#ifdef _DEBUG
	PCArrayOfKickData	KickDebug = new CArrayOfKickData();
	CFootballScore::LoadKickData(KickDataFilename,KickDebug);
	ASSERT(KickList->GetSize() == KickDebug->GetSize());
	for(int i=0;i<KickList->GetSize();i++)
		ASSERT(*(KickList->GetAt(i)) == *(KickDebug->GetAt(i)));
	for(int j=0;i<KickDebug->GetSize();i++)
		delete KickDebug->GetAt(i);
	KickDebug->RemoveAll();
	delete KickDebug;
#endif 
	return TRUE;
}


void CFootballScore::WriteOut(const char * fmt, ...)
{
	static char	Buffer[10][256];
	char Buff[256];
	va_list	va;
	va_start(va, fmt);
	
	lstrcpy(Buff, "");
	vsprintf(&Buff[lstrlen(Buff)], fmt, va);
	// Clear Score Surface
	LPDIRECTDRAWSURFACE7 pddsWriteSurface = m_WriteOutSurface->GetDDrawSurface();

	DDBLTFX ddbltfx;
	ZeroMemory( &ddbltfx, sizeof(ddbltfx) );
	ddbltfx.dwSize      = sizeof(ddbltfx);
	ddbltfx.dwFillColor = BACKCOLOR;
	pddsWriteSurface->Blt( NULL, NULL, NULL, DDBLT_COLORFILL, &ddbltfx );
	for(int j=0;j<9;j++)
		strcpy(Buffer[j],Buffer[j+1]);
	strcpy(Buffer[9],Buff);
	for(int i=0;i<10;i++)
	{
		m_WriteOutSurface->DrawText(NULL,Buffer[i],0,FONTHEIGHT*i,BACKCOLOR,RGB(255,0,0));
	}
	va_end(va);
}

void CFootballScore::SaveDataLog(LPCSTR szFilename)
{
	FILE* LogFile;
	if(LogFile = fopen(szFilename,"a"))
	{
		CFootballTeam* Team1 = m_pMatch->GetTeamNo(TEAM1);
		CFootballTeam* Team2 = m_pMatch->GetTeamNo(TEAM2);
		SYSTEMTIME	st;
		GetSystemTime(&st);
		fprintf(LogFile,
			"Team %s(%s) Team %s(%s) Data %d"
			"[%02d/%02d/%04d %02d:%02d]\n",
			Team1->GetTeamName(),Team1->GetType(),
			Team2->GetTeamName(),Team2->GetType(),
			m_KickList->GetSize(),
			st.wDay,st.wMonth,st.wYear,st.wHour,st.wMinute);
		fclose(LogFile);
	}
}
