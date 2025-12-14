#include "GroundLayerMap.h"
#include "GameMap.h"
#include "GameWorld.h"

GroundLayerMap::GroundLayerMap(int w, int h)
:GameObjectMap(w,h)
{
	int sz = w*h;
	for(int i=0; i<sz; i++){
		_map.push_back((GameObject *)NULL);
	}
};

bool GroundLayerMap::add(GameObject *GObj, int x, int y)
{
	if(canAdd(x, y, GObj)){
		_map[y*width+x] = GObj;
		return true;
	}else{
		return false;
	}
};

void GroundLayerMap::remove(GameObject *GObj, int x, int y)
{
	if(_map[y*width+x]==GObj){
		_map[y*width+x] = NULL;
	}
};

GameObject * GroundLayerMap::get(int x, int y)
{
	if(!pointExist(x, y))
		return NULL;
	return _map[y*width+x];
};

bool GroundLayerMap::canAdd(int x, int y, GameObject *GObj)
{
	GameMap *gm = getWorldMap();
	if (gm->getPassability(x, y) == false)
		return false;

	GameObject *resident = (GameObject *)_map[y*width+x];
	if (resident == NULL || resident == GObj)
		return true;
	else
		return false;
};