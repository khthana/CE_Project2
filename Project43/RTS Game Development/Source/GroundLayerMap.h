#ifndef _GroundLayerMap_header_
#define _GroundLayerMap_header_

#include "GameObjectMap.h"
#include <vector>

using namespace std;

class GroundLayerMap:public GameObjectMap
{
public:
	GroundLayerMap(int w, int h);
	virtual bool add(GameObject *GObj, int x, int y);
	virtual void remove(GameObject *GObj, int x, int y);
	virtual GameObject * get(int x, int y);
	virtual bool canAdd(int x, int y, GameObject *GObj);
protected:
	vector<GameObject *> _map;
};



#endif _GroundLayerMap_header_