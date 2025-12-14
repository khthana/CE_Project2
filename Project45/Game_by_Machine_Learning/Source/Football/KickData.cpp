// KickData.cpp: implementation of the CKickData class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "football.h"
#include "KickData.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CKickData::CKickData()
{

}

CKickData::~CKickData()
{

}

BOOL CKickData::operator ==(const CKickData &rhs)
{
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
	{
		if(KickerTeamLoc[i].x != rhs.KickerTeamLoc[i].x) return FALSE;
		if(KickerTeamLoc[i].y != rhs.KickerTeamLoc[i].y) return FALSE;
		if(OppTeamLoc[i].x != rhs.OppTeamLoc[i].x) return FALSE;
		if(OppTeamLoc[i].y != rhs.OppTeamLoc[i].y) return FALSE;
	}
	if(KickerTeamLoc[KickerNo].x != rhs.KickerTeamLoc[rhs.KickerNo].x) return FALSE;
	if(KickerTeamLoc[KickerNo].y != rhs.KickerTeamLoc[rhs.KickerNo].y) return FALSE;
	if(Result != rhs.Result) return FALSE;
	return TRUE;
}

BOOL CKickData::Load(CFile &File)
{
	if(File.Read(&KickerNo,sizeof(KickerNo)) != sizeof(KickerNo)) return FALSE;
	if(File.Read(&KickerDir,sizeof(KickerDir)) != sizeof(KickerDir)) return FALSE;
	if(KickerNo>NUMBER_OF_PLAYERS) return FALSE;
	if(KickerDir>8 || KickerDir <0)	return FALSE;
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
	{
		if(File.Read(&KickerTeamLoc[i].x,sizeof(KickerTeamLoc[i].x))!= sizeof(KickerTeamLoc[i].x)) return FALSE;
		if(File.Read(&KickerTeamLoc[i].y,sizeof(KickerTeamLoc[i].y))!= sizeof(KickerTeamLoc[i].y)) return FALSE;
		if(File.Read(&OppTeamLoc[i].x,sizeof(OppTeamLoc[i].x))!= sizeof(OppTeamLoc[i].x)) return FALSE;
		if(File.Read(&OppTeamLoc[i].y,sizeof(OppTeamLoc[i].y))!= sizeof(OppTeamLoc[i].y)) return FALSE;
	}
	if(File.Read(&Result,sizeof(Result))!= sizeof(Result)) return FALSE;
	return TRUE;
}

BOOL CKickData::Save(CFile &File)
{
	if(KickerNo>NUMBER_OF_PLAYERS) return FALSE;
	if(KickerDir>8 || KickerDir <0)	return FALSE;
	File.Write(&KickerNo,sizeof(KickerNo));
	File.Write(&KickerDir,sizeof(KickerDir));
	for(int i=0;i<NUMBER_OF_PLAYERS;i++)
	{
		File.Write(&KickerTeamLoc[i].x,sizeof(KickerTeamLoc[i].x));
		File.Write(&KickerTeamLoc[i].y,sizeof(KickerTeamLoc[i].y));
		File.Write(&OppTeamLoc[i].x,sizeof(OppTeamLoc[i].x));
		File.Write(&OppTeamLoc[i].y,sizeof(OppTeamLoc[i].y));
	}
	File.Write(&Result,sizeof(Result));
	return TRUE;
}
