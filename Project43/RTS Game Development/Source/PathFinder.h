#ifndef _PathFinder_header_
#define _PathFinder_header_

#include "GameWorld.h"

#include <stdio.h>
#include <list>

using namespace std;

typedef list<POINT> Path;

class GameObject;

class PathFinder
{
public:
	static bool path(Path *result, const POINT *start, const POINT *goal, GameObject *traveller);
	static void startCount();
	static void setMaxService(int max);
	static bool canServ();
protected:
	static int _serviceCount;
	static int _maxService;
};

#endif _PathFinder_header_