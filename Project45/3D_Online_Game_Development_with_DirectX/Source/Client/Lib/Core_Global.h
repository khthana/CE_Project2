/**************************************************
WinMain.cpp
GameCore Component

Programming Role-Playing Games with DirectX
by Jim Adams (01 Jan 2002)
**************************************************/

#ifndef _CORE_GLOBAL_H_
#define _CORE_GLOBAL_H_

// Windows includes
#include <windows.h>

// Standard ANSI-C includes
#include <stdio.h>

// DirectX includes
#include "d3d8.h"
#include "d3dx8.h"
#include "dplay8.h"
#include "dpaddr.h"
#include "dinput.h"

// Core includes
#include "Core_System.h"
#include "Core_Graphics.h"
#include "Core_Input.h"
#include "Core_Network.h"

//Game includes
#include "resource.h"
#include "Global_Func.h"
#include "Tile.h"

//-----------------------------------------------------------------------------
// Miscellaneous helper functions
//-----------------------------------------------------------------------------
#define SAFE_DELETE(p)       { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_DELETE_ARRAY(p) { if(p) { delete[] (p);   (p)=NULL; } }
#define SAFE_RELEASE(p)      { if(p) { (p)->Release(); (p)=NULL; } }

//-----------------------------------------------------------------------------
// Enum Type
//-----------------------------------------------------------------------------
enum AttackType { NOT_ATTACK, ATTACK_ONCE, ATTACK_CONTINUE };
enum STATE { NO_STATE, STAND, WALK, ATTACK, ATTACK_WAIT, DIE };


#endif
