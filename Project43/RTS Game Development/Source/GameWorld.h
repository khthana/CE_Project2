#ifndef _GameWorld_header_
#define _GameWorld_header_

#include "GameMap.h"
#include "GameObject.h"
#include "GroundLayerMap.h"
#include "GameConfig.h"
#include <map>
using namespace std;

typedef map<long, GameObject *, less<long> > GameObjectTable;

#define GRND_LYR_METRICS1 1

class GameWorld{
public:
	static void initInstance();
	static GameWorld *_getInstance();
	int buildUpTheWorld(const char *mapfile);
	GameMap * getWorldMap();
	GameObjectTable * getAllGObjInTheWorld();
	GameObjectMap * getGameObjectMap(int whichmap);
	GameObject * getGameObject(long id);
	bool addGameObject(GameObject *go);
	void removeGameObject(GameObject *go);
	void enqueueForRemoval(GameObject *go);
	int removeEnqueued();
	long getNextID();
	long getIDUsed();
	vector<GameObject *> *getSelectedGObj();
	void SelectGObj(GameObject *GObj, bool isRemoveOld);
	void UnselectGObj(GameObject *GObj);
	void setViewPos(POINT *p);
	POINT getViewPos();
protected:
	GameWorld();
	long nextID;
	static GameWorld * _instance;
	GameMap * _worldMap;
	GroundLayerMap * _grndl1Map;
	GameObjectTable _allGObj;
	queue<GameObject *> _removalQueue;
	vector<GameObject *> _selectedGObj;
	POINT _viewPos;
	POINT _viewPos_max;
};

int buildUpTheWorld(const char *mapfile);
GameMap *getWorldMap();
GameObjectTable * getAllGObjInTheWorld();
GameObjectMap * getGameObjectMap(int whichmap);
GameObject * getGameObject(long id);
bool addGameObject(GameObject *go);
void removeGameObject(GameObject *go);
void enqueueForRemoval(GameObject *go);
long getNextID();
long getIDUsed();
vector<GameObject *> *getSelectedGObj();
void SelectGObj(GameObject *GObj, bool isRemoveOld);
void UnselectGObj(GameObject *GObj);
void setViewPos(POINT *p);
POINT getViewPos();

#endif _GameWorld_header_
