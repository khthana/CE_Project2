// stdafx.cpp : source file that includes just the standard includes
//	Football.pch will be the pre-comPIled header
//	stdafx.obj will contain the pre-comPIled type information

#include "stdafx.h"

#ifdef _DEBUG
	int DebugValue[256];
	void Debug(const char * fmt, ...)
	{
		char	Buffer[256];
		va_list	va;
		va_start(va, fmt);

		lstrcpy(Buffer, "");
		vsprintf(&Buffer[lstrlen(Buffer)], fmt, va);
		OutputDebugString(Buffer);
	}
#else
	void Debug(const char* fmt, ...) {}
#endif


int DirectionNo(int d)
{
	switch(d)
	{
		case NORTH:			return 0;
		case NORTH_EAST:	return 1;
		case EAST:			return 2;
		case SOUTH_EAST:	return 3;
		case SOUTH:			return 4;
		case SOUTH_WEST:	return 5;
		case WEST:			return 6;
		case NORTH_WEST:	return 7;
		default:			return 0;
	}
}

int DirNo2Dir(int d)
{
	switch(d)
	{
	case 0:return NORTH;
	case 1:return NORTH_EAST;
	case 2:return EAST;
	case 3:return SOUTH_EAST;
	case 4:return SOUTH;
	case 5:return SOUTH_WEST;
	case 6:return WEST;
	case 7:return NORTH_WEST;
	default: return NORTH;
	}
}

double Dir2Rad(int d)
{
	switch(d)
	{
	default:
	case NORTH:			return PI/-2.0;
	case NORTH_EAST:	return PI/-4.0;
	case EAST:			return 0.0;
	case SOUTH_EAST:	return PI/4.0;
	case SOUTH:			return PI/2.0;
	case SOUTH_WEST:	return 3*PI/4.0;
	case WEST:			return PI;
	case NORTH_WEST:	return 3*PI/-4.0;
	}
}

DWORD FindPlayer(CFootballPlayer** PlayerList,CFootballPlayer* Player,DWORD MaxNumber)
{
	for(DWORD PlayerNo=0;PlayerNo<MaxNumber;PlayerNo++)
		if(PlayerList[PlayerNo] == Player)
			return PlayerNo;
	return MaxNumber;
}

BOOL InPlayerList(CFootballPlayer** PlayerList,CFootballPlayer* Player,DWORD MaxNumber)
{
	return FindPlayer(PlayerList,Player,MaxNumber) != MaxNumber;
}

DOUBLE Radius(CLocation Loc1,CLocation Loc2)
{
	return sqrt(POW2(Loc1.x - Loc2.x)+POW2(Loc1.y - Loc2.y));
}

double Distance(CLocation SLoc,CLocation DLoc)
{
	return sqrt(POW2(SLoc.x-DLoc.x)+POW2(SLoc.y-DLoc.y));
}

int CounterClockWise(CLocation p0,CLocation p1,CLocation p2)
{
	double dx1 = p1.x-p0.x;
	double dy1 = p1.y-p0.y;
	double dx2 = p2.x-p0.x;
	double dy2 = p2.y-p0.y;
	if(dx1*dy2>dy1*dx2) return 1;
	else if(dx1*dy2<dy1*dx2) return -1;
	else 
	{
		if(dx1*dx2<0 || dy1*dy2<0) return -1;
		if(dx1*dx1+dy1*dy1>=dx2*dx2*dy2*dy2) return 0;
		else return 1;
	}
}

bool LineIntersect(CLocation s1,CLocation e1,CLocation s2,CLocation e2)
{
	return (CounterClockWise(s1,e1,s2)*CounterClockWise(s1,e1,e2)<=0 && 
		    CounterClockWise(s2,e2,s1)*CounterClockWise(s2,e2,e1)<=0);
}

double DistanceLinePoint(CLocation Start,CLocation End,CLocation Point)
{
	double dx = End.y - Start.y;
	double dy = End.x - Start.x;
	return fabs(dy*Point.y - dx*Point.x + dx*Start.x - dy*Start.y)/sqrt(dx*dx+dy*dy);
}

double Theta(CLocation p1,CLocation p2)
{
	double dx,dy,ax,ay;
	double t;
	dx = p2.x - p1.x;	ax = fabs(dx);
	dy = p2.y - p1.y;	ay = fabs(dy);
	if(dx==0 && dy==0) 
		t = 0;
	else 
		t = (double)dy/(ax+ay);
	if(dx<0)  t = 2-t;
	else if(dy<0) t = 4+t;
	return t*90*PI/180;
}

bool IsPlayerCanTouchPath(CLocation SourceLoc,CLocation DestLoc,CFootballPlayer* PlayerList[],DOUBLE Range)
{
	for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		CLocation Loc = PlayerList[PlayerNo]->GetLocation();
		DOUBLE Distance = DistanceLinePoint(SourceLoc,DestLoc,Loc);
		if(Distance<Range)
			return true;
	}
	return false;
}

bool IsCanPass(CLocation SourceLoc,CLocation DestLoc,CFootballPlayer* OppPlayerList[],DOUBLE Range)
{
	DOUBLE Dist = Distance(SourceLoc,DestLoc);
	if(Dist>CAN_PASS_RANGE) 
		return false;
	for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		CLocation Loc = OppPlayerList[PlayerNo]->GetLocation();
		Dist = DistanceLinePoint(SourceLoc,DestLoc,Loc);
		double Angle1 = Theta(SourceLoc,DestLoc) - Theta(SourceLoc,Loc);
		double Angle2 = Theta(DestLoc,SourceLoc) - Theta(DestLoc,Loc);
		if(Dist<Range && (Angle1<90*PI/180 && Angle2<90*PI/180))
			return false;
	}
	return true;
}

DWORD CountPlayer(CFootballPlayer* Player,CFootballPlayer* OppPlayerList[],DOUBLE Range,DWORD Dir)
{
	DWORD Count = 0;
	CLocation PlayerLoc = Player->GetLocation();
	for(DWORD PlayerNo=0;PlayerNo<NUMBER_OF_PLAYERS;PlayerNo++)
	{
		CLocation Loc = OppPlayerList[PlayerNo]->GetLocation();
		if(Player->GetDirectionTo(Loc,2.0) & Dir
			&& Distance(PlayerLoc,Loc) < Range)
			Count++;
	}
	return Count;
}

DWORD FindCloserLocation(CLocation** PointList,CLocation DestLoc,DWORD Defence,DWORD MaxItem)
{
	DWORD CloserLoc = MaxItem;
	DOUBLE Distance,MaxDistance = DBL_MAX;
	for(DWORD Point=0;Point<MaxItem;Point++)
	{
		if(PointList[Defence*11+Point]!=NULL)
		{
			Distance = POW2(PointList[Defence*11+Point]->x-DestLoc.x)+
					   POW2(PointList[Defence*11+Point]->y-DestLoc.y);
			if(Distance<MaxDistance)
			{
				MaxDistance = Distance;
				CloserLoc = Point;
			}
		}
	}
	return CloserLoc;
}

DWORD FindCloserLocation(CLocation** LocList,CLocation Loc)
{
	DWORD CloserLoc = NUMBER_OF_PLAYERS;
	DOUBLE Distance,MaxDistance = DBL_MAX;
	for(DWORD Point=0;Point<NUMBER_OF_PLAYERS;Point++)
	{
		if(LocList[Point]!=NULL)
		{
			Distance = POW2(LocList[Point]->x-Loc.x)+
					   POW2(LocList[Point]->y-Loc.y);
			if(Distance<MaxDistance)
			{
				MaxDistance = Distance;
				CloserLoc = Point;
			}
		}
	}
	return CloserLoc;
}

DWORD FindCloserPlayer(CFootballPlayer** PlayerList,CLocation DestLoc,DWORD MaxNumber)
{
	CLocation PlayerLoc;
	DWORD CloserPlayerNo = MaxNumber;
	DOUBLE Distance,MaxDistance = DBL_MAX;
	for(DWORD PlayerNo=0;PlayerNo<MaxNumber;PlayerNo++)
		if(PlayerList[PlayerNo]!=NULL)
		{
			PlayerLoc = PlayerList[PlayerNo]->GetLocation();
			Distance = POW2(PlayerLoc.x-DestLoc.x)+POW2(PlayerLoc.y-DestLoc.y);
			if(Distance<MaxDistance)
			{
				MaxDistance = Distance;
				CloserPlayerNo = PlayerNo;
			}
		}
	return CloserPlayerNo;
}

DWORD FindCloserPlayerSide(CFootballPlayer** PlayerList,CLocation DestLoc,DWORD Dir,DWORD MaxNumber)
{
	CLocation PlayerLoc;
	DWORD CloserPlayerNo = MaxNumber;
	DOUBLE Distance,MaxDistance = DBL_MAX;
	for(DWORD PlayerNo=0;PlayerNo<MaxNumber;PlayerNo++)
		if(PlayerList[PlayerNo]!=NULL)
		{
			PlayerLoc = PlayerList[PlayerNo]->GetLocation();
			
			Distance = POW2(PlayerLoc.x-DestLoc.x)+POW2(PlayerLoc.y-DestLoc.y);
			if(Distance<MaxDistance )
			{
				MaxDistance = Distance;
				CloserPlayerNo = PlayerNo;
			}
		}
	return CloserPlayerNo;
}

