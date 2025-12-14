#include <malloc.h>
#include <windows.h>

#include "GameMap.h"
#include "gameutil.h"

GameMap::GameMap()
{
	passability = NULL;
	grndtype = NULL;
};

#define MAPHEIGHT 128
#define MAPWIDTH 96
bool GameMap::loadMapData(const char *mapfilemap)
{
	width=MAPWIDTH;
	height=MAPHEIGHT;
	passability = (bool *)calloc(MAPWIDTH*MAPHEIGHT, sizeof(bool));
	if(passability == NULL)
		ExitGame();
	grndtype = (unsigned char *)calloc(MAPWIDTH*MAPHEIGHT, sizeof(unsigned char));
	if(grndtype == NULL)
		ExitGame();
	for(int j=0; j<height; j++)
		for(int i=0; i<width; i++)
		{
			setPassability(i, j, true);
			setGroundType(i, j, GRND_SAND);
		}
	return true;
};

void GameMap::setPassability(int x, int y, bool bval)
{
	int offset = ((y * width) + x) * sizeof(bool);
	*(passability + offset) = bval;
};

bool GameMap::getPassability(int x, int y)
{
	int offset = ((y * width) + x) * sizeof(bool);
	return *(passability + offset);
};

void GameMap::setGroundType(int x, int y, GROUNDTYPE gtype)
{
	int offset = ((y * width) + x) * sizeof(unsigned char);
	*(grndtype + offset) = (unsigned char) gtype;
};

GROUNDTYPE GameMap::getGroundType(int x, int y)
{
	GROUNDTYPE gtype = (GROUNDTYPE) 0;
	int offset = ((y * width) + x) * sizeof(unsigned char);
	return (GROUNDTYPE) (gtype + *(grndtype + offset));
};

int GameMap::DistEstimate(const POINT &from, const POINT &to)
{
	int maxX = to.x-from.x;
	if(maxX<0)
		maxX=-maxX;
	int maxY = to.y-from.y;
	if(maxY<0)
		maxY=-maxY;
	return max(maxX, maxY);
};

int GameMap::Direction(const POINT &from, const POINT &to)
{
	const float SINE60 = 1.732;
	const float SINE30 = 0.577;
	int diffX = to.x - from.x;
	int diffY = -(to.y - from.y);

	float sineValue = 0.0;

	if (diffX != 0)
	{
		sineValue = (float)diffY/diffX;
	}

	if (diffX > 0)
	{
		if (diffY > 0)
		{
			if (sineValue > SINE60)
				return DIR_NORTH;
			else if (sineValue > SINE30)
				return DIR_NE;
			else
				return DIR_EAST;
		}
		else if(diffY < 0)
		{
			if (sineValue < -SINE60)
				return DIR_SOUTH;
			else if (sineValue < -SINE30)
				return DIR_SE;
			else
				return DIR_EAST;
		}
		else//diffY == 0
			return DIR_EAST;
	}
	else if(diffX < 0)
	{
		if (diffY > 0)
		{
			if (sineValue < -SINE60)
				return DIR_NORTH;
			else if (sineValue < -SINE30)
				return DIR_NW;
			else
				return DIR_WEST;
		}
		else if(diffY < 0)
		{
			if (sineValue > SINE60)
				return DIR_SOUTH;
			else if (sineValue > SINE30)
				return DIR_SW;
			else
				return DIR_WEST;
		}
		else//diffY == 0
			return DIR_WEST;
	}
	else//diffX == 0
	{
		if (diffY > 0)
			return DIR_NORTH;
		else if (diffY < 0)
			return DIR_SOUTH;
		else//diffY == 0 can't occur
			return 0XFFFFFFFF;						
	}
};