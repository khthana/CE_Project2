#ifndef _GameMap_header_
#define _GameMap_header_

#include <windows.h>
#include "Map.h"

#define DIR_NORTH	0
#define DIR_SOUTH	1
#define DIR_EAST	2
#define DIR_WEST	3
#define DIR_NE		4
#define DIR_SE		5
#define DIR_NW		6
#define DIR_SW		7

enum GROUNDTYPE
{
	GRND_SAND = 0
};

class GameMap:public Map
{
public:
	GameMap();
	bool loadMapData(const char *mapfilename);
	void setPassability(int x, int y, bool bval);
	bool getPassability(int x, int y);
	void setGroundType(int x, int y, GROUNDTYPE gtype);
	GROUNDTYPE getGroundType(int x, int y);
	static int DistEstimate(const POINT &from, const POINT &to);
	static int Direction(const POINT &from, const POINT &to);
protected:
	bool *passability;
	unsigned char *grndtype;
};

#endif _GameMap_header_