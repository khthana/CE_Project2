// FootballDimensions.h: interface for the CFootballDimensions class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLDIMENSIONS_H__3C17141C_7D2C_4BDB_BC42_2E0CE8AB7F5D__INCLUDED_)
#define AFX_FOOTBALLDIMENSIONS_H__3C17141C_7D2C_4BDB_BC42_2E0CE8AB7F5D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define NO_DIRECTION	0
#define NORTH			1
#define EAST			2
#define SOUTH			4
#define WEST			8

#define NORTH_EAST		NORTH|EAST
#define SOUTH_EAST		SOUTH|EAST
#define SOUTH_WEST		SOUTH|WEST
#define NORTH_WEST		NORTH|WEST

#define MINIMUN_SHOOT_TIME		10
#define CONTROLBALL_DELAY_SPEED 1

#define PLAYER_HEIGHT		1.8
#define	CANTOUCH_RANGE      1.0  // 0.5

extern const double HALF_GROUND_WIDTH;
extern const double HALF_GROUND_HEIGHT;
extern const double CIRCLE;
extern const double PENALTY_POINT_Y;
extern const double PENALTY_BOX_WIDTH;
extern const double PENALTY_BOX_HEIGHT;
extern const double HALF_BOX_WIDTH;
extern const double GOAL_BOX_WIDTH;
extern const double GOAL_BOX_HEIGHT;
extern const double GROUND_WIDTH;
extern const double GROUND_HEIGHT;
extern const double BALL_RADIUS;
extern const double CORNER_RADIUS;
extern const double PLAYER_RADIUS;
extern const double PENALTY_RADIUS;
extern const double PIXELS_PER_METER;

extern const double PI;
extern const double G;
extern const double M;
extern const double K;
extern const double BOUNCE_SPEED_FACTOR;
extern const double MINIMUM_ANGLE;
extern const double MINIMUM_SPEED;
extern const double M_K;
extern const double K_M;
extern const double MG_K;
extern const COLORREF SHADOW_COLOR;

extern const double SHOOTSPEED;
extern const double SHOOTANGLE;

#endif // !defined(AFX_FOOTBALLDIMENSIONS_H__3C17141C_7D2C_4BDB_BC42_2E0CE8AB7F5D__INCLUDED_)
