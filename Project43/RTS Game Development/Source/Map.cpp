#include "Map.h"

Map::Map()
{
	width=0;
	height=0;
};
Map::Map(int w, int h)
{
	width=w;
	height=h;
};
bool Map::pointExist(int x, int y)
{
	if(x<0||x>=width||y<0||y>=height)
		return false;
	return true;
};
int Map::getWidth(){
	return width;
};

int Map::getHeight(){
	return height;
};
