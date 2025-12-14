#ifndef _GameObjectMap_header_
#define _GameObjectMap_header_

#include "Map.h"

class GameObject;

class GameObjectMap:public Map{
public:
	GameObjectMap();
	GameObjectMap(int w, int h);
	virtual bool add(GameObject *GObj, int x, int y);
	virtual void remove(GameObject *GObj, int x, int y);
	virtual GameObject * get(int x, int y);
	virtual bool canAdd(int x, int y, GameObject *GObj);
};

#endif _GameObjectMap_header_