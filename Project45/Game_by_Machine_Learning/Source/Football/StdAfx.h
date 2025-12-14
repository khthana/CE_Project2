// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__A9DB83DB_A9FD_11D0_BFD1_444553540000__INCLUDED_)
#define AFX_STDAFX_H__A9DB83DB_A9FD_11D0_BFD1_444553540000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers

#include <afx.h>
#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// MFC support for Windows Common Controls
#include <afxtempl.h>
#endif // _AFX_NO_AFXCMN_SUPPORT

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers

#include <windows.h>
#include <windowsx.h>
#include <mmsystem.h>
#include <tchar.h>
#include <math.h>
#include <stdio.h>
#include <ddraw.h>
#include <dsound.h>
#include <dinput.h>
#include <dxerr8.h>
#include "Common\DDutil.h"
#include "Common\DSUtil.h"
#include "Common\DXUtil.h"

//-----------------------------------------------------------------------------
// Defines, constants, and macros
//-----------------------------------------------------------------------------
#define SAFE_DELETE(p)  { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_DELETE_ARRAY(p)	{ if(p) { delete[] (p);   (p)=NULL; } }
#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }
#define RECTWIDTH(rc)	(rc).right - (rc).left
#define RECTHEIGHT(rc)  (rc).bottom - (rc).top
#define KEYPRESS(d,o,k)		((d)[(k)] & 0x80 && !(o)[(k)] && ((o)[(k)] = true))
#define KEYRELEASE(d,o,k)	(!((d)[(k)] & 0x80) && (o)[(k)] && !((o)[(k)] = false))
#define KEYDOWN(d,k)		((d)[(k)] & 0x80)

#include "FootballDimensions.h"
#include "Football.h"


#include "Logfile.h"
//#include "UniformRand.h"
#include "Layer.h"
#include "InputLayer.h"
#include "OutputLayer.h"
#include "MiddleLayer.h"
#include "Network.h"

class CFootballApp;
class CFootballMatch;
class CFootballTeam;
class CFootballTactic;
class CFootballBall;

#include "Point.h"
#include "KickData.h"
#include "TrainData.h"
#include "Drawable.h"
#include "FootballDimensions.h"
#include "FootballPlayer.h"
#include "FootballGoalKeeper.h"
#include "FootballBall.h"
#include "FootballTeam.h"
#include "FootballTeamControl.h"
#include "FootballTeamComputer.h"
#include "FootballTeamLearning.h"
#include "FootballTactic.h"
#include "FootballScore.h"
#include "FootballMatch.h"
#include "FootballApp.h"

#ifdef _DEBUG
	extern int DebugValue[256];
	void Debug(const char * fmt, ...);
	void Loc(int Level,const char * fmt, ...);
#else
	void Debug(const char *fmt, ...);
	void Loc(int Level,const char * fmt, ...);
#endif

int DirectionNo(int d);
int DirNo2Dir(int d);
double Dir2Rad(int d);

DWORD	FindPlayer  (CFootballPlayer** PlayerList,CFootballPlayer* Player,DWORD MaxNumber = NUMBER_OF_PLAYERS);
BOOL	InPlayerList(CFootballPlayer** PlayerList,CFootballPlayer* Player,DWORD MaxNumber = NUMBER_OF_PLAYERS);
DOUBLE	Radius(CLocation Loc1,CLocation Loc2);

#ifndef ASSERT
#define ASSERT(x)				assert((x))
#endif


#define SET_POINT(pt,_x,_y)		{ (pt).x = (_x); (pt).y = (_y); }
#define ROUND(x)				((int)(x+0.5))
#define TRUNCATE(x)				((int)(x))
#define POW2(x)					(x)*(x)
#define BETWEEN(x,y,z)			((x)>=(y) && (x)<=(z))

double Distance(CLocation SLoc,CLocation DLoc);
int CounterClockWise(CLocation p0,CLocation p1,CLocation p2);
bool LineIntersect(CLocation s1,CLocation e1,CLocation s2,CLocation e2);
double DistanceLinePoint(CLocation Start,CLocation End,CLocation Point);
double Theta(CLocation p1,CLocation p2);

bool IsPlayerCanTouchPath(CLocation SourceLoc,CLocation DestLoc,CFootballPlayer* PlayerList[],DOUBLE Range);
bool IsCanPass(CLocation SourceLoc,CLocation DestLoc,CFootballPlayer* OppPlayerList[],DOUBLE Range);
DWORD CountPlayer(CFootballPlayer* Player,CFootballPlayer* OppPlayerList[],DOUBLE Range,DWORD Dir);

DWORD FindCloserLocation(CLocation** PointList,CLocation DestLoc,DWORD Defence,DWORD MaxItem=NUMBER_OF_PLAYERS);
DWORD FindCloserLocation(CLocation** LocList,CLocation Loc);
DWORD FindCloserPlayer(CFootballPlayer** PlayerList,CLocation DestLoc,DWORD MaxNumber = NUMBER_OF_PLAYERS);
DWORD FindCloserPlayerSide(CFootballPlayer** PlayerList,CLocation DestLoc,DWORD Dir,DWORD MaxNumber = NUMBER_OF_PLAYERS);

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__A9DB83DB_A9FD_11D0_BFD1_444553540000__INCLUDED_)
