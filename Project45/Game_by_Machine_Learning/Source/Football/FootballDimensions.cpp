// FootballDimensions.cpp: implementation of the CFootballDimensions class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballDimensions.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

const double HALF_GROUND_WIDTH		= 45.0;
const double HALF_GROUND_HEIGHT		= 67.5;
const double CIRCLE					= 9.15;
const double PENALTY_POINT_Y		= 16.5;
const double PENALTY_BOX_WIDTH		= 46.5;
const double PENALTY_BOX_HEIGHT		= 24.75;
const double HALF_BOX_WIDTH			= 10.5;
const double GOAL_BOX_WIDTH			= 2*HALF_BOX_WIDTH;
const double GOAL_BOX_HEIGHT		= 8.25;
const double GROUND_WIDTH			= 2*HALF_GROUND_WIDTH;
const double GROUND_HEIGHT			= 2*HALF_GROUND_HEIGHT;
const double BALL_RADIUS			= 0.4;
const double CORNER_RADIUS			= 3;
const double PLAYER_RADIUS			= 3;
const double PENALTY_RADIUS			= 12.15;
const double CONTROL_PLAYER			= 15.0;

const double PI = 22.0/7.0;
const double G = 9.81;
const double M = 0.5;
const double K = 0.05;
const double BOUNCE_SPEED_FACTOR = 0.6;
const double MINIMUM_ANGLE = PI/20.0;
const double MINIMUM_SPEED = .3;
const double M_K = M/K;
const double K_M = K/M;
const double MG_K = M*G/K;
const COLORREF SHADOW_COLOR = RGB(0,104,0);

const double SHOOTSPEED = 30;
const double SHOOTANGLE = PI/18.0;