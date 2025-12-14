// TrainData.h: interface for the CTrainData class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_TRAINDATA_H__3FA2B776_44E4_4518_9208_F455A772CF10__INCLUDED_)
#define AFX_TRAINDATA_H__3FA2B776_44E4_4518_9208_F455A772CF10__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CTrainData  
{
public:
	CTrainData();
	virtual ~CTrainData();
public:
	double	Loc[2][NUMBER_OF_PLAYERS][2];
	DWORD	ZoneLoc[2][NUMBER_OF_PLAYERS];
	DWORD	ShootDir;
	BOOL	Result;
};

typedef CArray<CTrainData*,CTrainData*>		CArrayOfTrainData;
typedef CArrayOfTrainData*					PCArrayOfTrainData;

#endif // !defined(AFX_TRAINDATA_H__3FA2B776_44E4_4518_9208_F455A772CF10__INCLUDED_)
