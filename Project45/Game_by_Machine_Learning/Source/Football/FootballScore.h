// FootballScore.h: interface for the CFootballScore class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLSCORE_H__6321C3DD_CFBD_4EDE_952C_6FAABDB6A54C__INCLUDED_)
#define AFX_FOOTBALLSCORE_H__6321C3DD_CFBD_4EDE_952C_6FAABDB6A54C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CFootballScore : public CDrawable 
{
	DECLARE_SERIAL(CFootballScore)
private:
	DWORD				m_dwTime;
	DWORD				m_dwRatio;
	DWORD				m_Score[3];
	DWORD				m_TeamTime[3];
	DWORD				m_PassTotal[3];
	DWORD				m_PassSuccess[3];
	BOOL				m_bActive;
	CFootballTeam*		m_ShootTeam;

	CKickData*			m_KickData;
	PCArrayOfKickData	m_KickList;

	CSurface*			m_ScoreSurface;
	CFootballMatch*		m_pMatch;
private:
	void	ClearScore();
public:
	void SaveDataLog(LPCSTR szFilename);
	CSurface* m_WriteOutSurface;
	void WriteOut(const char * fmt, ...);
	double GetPassRatio(DWORD TeamNo);
	void DoResult(CFootballPlayer* Player);
	void DoShoot(CFootballPlayer* Player);
	CFootballTeam* GetWinner();

	CFootballScore(CFootballMatch* Match = NULL);
	virtual ~CFootballScore();

	void	StartMatch();
	void	EndMatch();
	
	HRESULT CreateSurface(CDisplay* pDisplay);
	void	ReleaseSurface();
	void	Update(DWORD dwTickDiff);
	HRESULT Draw(CSurface* pSurface,POINT ptStart);
	HRESULT DrawStatis(CSurface* pSurface, POINT ptStart);

	void	SetMatch(CFootballMatch* pMatch);
	DWORD	GetScore(DWORD TeamNo);
	DOUBLE	GetProsRatio(DWORD TeamNo);
	void	AddScore(DWORD TeamNo);
	void	SaveScoreLog(LPSTR ScoreFilename);
	DWORD	GetTime();

	void	Serialize( CArchive& ar );

	static BOOL LoadKickData(LPSTR KickDataFilename,PCArrayOfKickData KickList);
	static BOOL SaveKickData(LPSTR KickDataFilename,PCArrayOfKickData KickList);

};

#endif // !defined(AFX_FOOTBALLSCORE_H__6321C3DD_CFBD_4EDE_952C_6FAABDB6A54C__INCLUDED_)
