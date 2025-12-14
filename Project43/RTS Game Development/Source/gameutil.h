#ifndef _gameutil_header_
#define _gameutil_header_

#include "GameWorld.h"
#include "Player.h"

int getGObjInRange(GameObject *caller, GameObjectMap *gom, list<long> *GObjIDList, POINT *p, int range_min, int range_max, int selected_policy);
void ExitGame();

#endif _gameutil_header_
