#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif

#include "stdafx.h"
#include "GameWorld.h"
#include "god.h"
#include "GameObject.h"
#include "GameCharacters.h"
#include "GameObjectMap.h"
#include "Gui.h"
#include "CmdButtonBar.h"
#include "MapViewer.h"
#include "MiniMapViewer.h"
#include "ActionInterpreter.h"
#include "GameCommandButton.h"
#include "GameConfig.h"
#include "GodOfRenderring.h"

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	MSG msg;

	GameWorld::initInstance();
	buildUpTheWorld("haha");

	God::Instance()->enlivenTheWorld();
	God::Instance()->takeControl();

	Gui::start(hInstance, nCmdShow);

	GodOfRenderring *GOR = GodOfRenderring::Instance();
	GOR->InitRenderringData();
	GOR->loadPlayerBMP (0, "blueset.bmp");
	GOR->loadPlayerBMP (1, "redset.bmp");
	GOR->loadPlayerBMP (NATURAL_GO_GROUP_ID, "tree.bmp");
	GOR->loadGroundBMP ("ground.bmp");

	GOR->mapGroundBMP(GRND_SAND, 0, 0, 0, 0, 20, 20);

	GORenderringID rid;
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_NORTH, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_SOUTH, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_EAST, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_WEST, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_NE, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_SE, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_NW, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_STAND, 0, DIR_SW, 0);
	GOR->mapGObjBMP(rid,   2, -12,   0,   0,  15,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_NORTH, 0);
	GOR->mapGObjBMP(rid,   0,   0, 125,   0, 140,  30);
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_SOUTH, 0);
	GOR->mapGObjBMP(rid,   3, -15, 125,   0, 140,  30);//ZERG ACT_MOVE SOUTH
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_EAST, 0);
	GOR->mapGObjBMP(rid, -15,   0,  85,   8, 120,  24);//ZERG ACT_MOVE EAST
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_WEST, 0);
	GOR->mapGObjBMP(rid,   0,   0,  85,   8, 120,  24);//ZERG ACT_MOVE WEST
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_NE, 0);
	GOR->mapGObjBMP(rid, -15,   0,  16,   0,  45,  30);//ZERG ACT_MOVE NE
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_SE, 0);
	GOR->mapGObjBMP(rid, -15, -15,  47,   0,  77,  30);//ZERG ACT_MOVE SE
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_NW, 0);
	GOR->mapGObjBMP(rid,   0,   0,  47,   0,  77,  30);//ZERG ACT_MOVE NW
	rid = createGORenderringID(GTYPE_ZERG, ACT_MOVE, 0, DIR_SW, 0);
	GOR->mapGObjBMP(rid,   0, -15,  16,   0,  45,  30);//ZERG ACT_MOVE SW
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_NORTH, 0);
	GOR->mapGObjBMP(rid,   0,   0, 141,   0, 155,  15);//ZERG ACT_ATTACK NORTH
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_SOUTH, 0);
	GOR->mapGObjBMP(rid,   0,   0, 141,  16, 155,  30);//ZERG ACT_ATTACK SOUTH
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_EAST, 0);
	GOR->mapGObjBMP(rid,   0,   0, 156,  16, 170,  30);//ZERG ACT_ATTACK EAST
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_WEST, 0);
	GOR->mapGObjBMP(rid,   0,   0, 156,   0, 170,  15);//ZERG ACT_ATTACK WEST
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_NE, 0);
	GOR->mapGObjBMP(rid,   0,   0, 188,  16, 204,  30);//ZERG ACT_ATTACK NE
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_SE, 0);
	GOR->mapGObjBMP(rid,   0,   0, 173,   0, 188,  15);//ZERG ACT_ATTACK SE
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_NW, 0);
	GOR->mapGObjBMP(rid,   0,   0, 188,   0, 204,  15);//ZERG ACT_ATTACK NW
	rid = createGORenderringID(GTYPE_ZERG, ACT_ATTACK, 0, DIR_SW, 0);
	GOR->mapGObjBMP(rid,   0,   0, 173,  16, 188,  30);//ZERG ACT_ATTACK SW

	rid = createGORenderringID(GTYPE_TREE, ACT_STAND, 0, DIR_NORTH, 0);
	GOR->mapGObjBMP(rid, -50,-128,   0,   0, 124, 147);

	rid = createGORenderringID(GTYPE_HOUSE1, ACT_STAND, 0, DIR_NORTH, 0);
	GOR->mapGObjBMP(rid,   0,-100,   0,   32, 188, 160);

	ActionInterpreter::initInterpretation();

	MapViewer *mv = MapViewer::Instance();
	mv->setPos(0,0);
	Gui::getDesktop()->add(mv);
	mv->setVisibility(true);

	MiniMapViewer *mini_mv = MiniMapViewer::Instance();
	mini_mv->setPos(0,400);
	Gui::getDesktop()->add(mini_mv);
	mini_mv->setVisibility(true);

	CmdButtonBar::Instance()->setPos(610, 360);
	Gui::getDesktop()->add(CmdButtonBar::Instance());
	CmdButtonBar::Instance()->setVisibility(true);	

    while (TRUE)
    {
        if (PeekMessage(&msg, NULL, 0, 0, PM_NOREMOVE))
        {
            if (!GetMessage(&msg, NULL, 0, 0))
                return msg.wParam;
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
        else
        {
            // Make sure we go to sleep if we have nothing else to do
            WaitMessage();
        }
    }

	return 0;
};