// FootballTeamLearning.h: interface for the CFootballTeamLearning class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLTEAMLEARNING_H__D7B62AD5_FA17_4E3B_AAD3_19989F2DD352__INCLUDED_)
#define AFX_FOOTBALLTEAMLEARNING_H__D7B62AD5_FA17_4E3B_AAD3_19989F2DD352__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "FootballTeamComputer.h"
#include "FootballScore.h"

class CFootballTeamLearning : public CFootballTeamComputer
{
public:
	int m_TotalCycle;
	double m_LearningRate;
	double m_ErrorTolerance;
	DWORD m_NeuralNo;
	BOOL m_bNeuralActive;
	CNetwork	m_Network;

public:
	CFootballTeamLearning();
	CFootballTeamLearning(TCHAR* strTeamName,CFootballTactic* pTactic);
	virtual ~CFootballTeamLearning();

	TCHAR* GetType();
	void InitialTeam();
	void DeinitialTeam();
	BOOL Shoot(CFootballPlayer* PlayerList[],CFootballPlayer* OppPlayerList[],
							 CFootballBall* Ball,CFootballTeam* Team);
	
	void LoadData(TCHAR* NeuralFilename);

public:	
	static void PreProcess(CTrainData &TrainData,const CKickData &KickData);
	static void PreTraining(PCArrayOfTrainData TrainList,PCArrayOfKickData KickList);
	static int GetZone(const CLocation& Loc);
};

#endif // !defined(AFX_FOOTBALLTEAMLEARNING_H__D7B62AD5_FA17_4E3B_AAD3_19989F2DD352__INCLUDED_)
