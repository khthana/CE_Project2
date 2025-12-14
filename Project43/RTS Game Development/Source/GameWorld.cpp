#include "GameWorld.h"
#include "CmdButtonBar.h"
#include "ActionInterpreter.h"
#include "MapViewer.h"
#include "gameutil.h"
#include <vector>

using namespace std;

GameWorld * GameWorld::_instance=NULL;
GameWorld::GameWorld()
{
	nextID = 0;
	_worldMap=NULL;
	_grndl1Map=NULL;
};
void GameWorld::initInstance()
{
	_getInstance();
};
GameWorld *GameWorld::_getInstance()
{
	if(_instance==NULL)
		_instance = new GameWorld();
	return _instance;
};

int GameWorld::buildUpTheWorld(const char *mapfile)
{
	_worldMap = new GameMap();
	_worldMap->loadMapData("haha");
	if(_grndl1Map!=NULL)
		delete _grndl1Map;

	_grndl1Map = new GroundLayerMap(_worldMap->getWidth(), _worldMap->getHeight());

	_viewPos_max.x = _worldMap->getWidth() - MAX_VISIBLE_TILE_X;
	_viewPos_max.y = _worldMap->getHeight() - MAX_VISIBLE_TILE_Y;
	if(_viewPos_max.x<0)
		_viewPos_max.x = 0;
	if(_viewPos_max.y<0)
		_viewPos_max.y = 0;
	
	_viewPos.x = 0;
	_viewPos.y = 0;

	printf("vp.x = %d vp.y = %d\n", _viewPos.x, _viewPos.y);
	printf("vp_max.x = %d vp_max.y = %d\n", _viewPos_max.x, _viewPos_max.y);

	return 0;

};
GameMap * GameWorld::getWorldMap()
{
	return _worldMap;
};
GameObjectTable * GameWorld::getAllGObjInTheWorld()
{
	return &_allGObj;
};
GameObjectMap * GameWorld::getGameObjectMap(int whichmap)
{
	switch(whichmap)
	{
	case GRND_LYR_METRICS1:
		return _grndl1Map;
	}
	return NULL;
};
GameObject * GameWorld::getGameObject(long id)
{
	GameObjectTable::iterator it = _allGObj.find(id);
	if(it==_allGObj.end())
		return NULL;
	else
		return (*it).second;
};
bool GameWorld::addGameObject(GameObject *go)
{
	_allGObj.insert(GameObjectTable::value_type(go->getID(), go));
	return true;
};
void GameWorld::removeGameObject(GameObject *go)
{
	if(go!=NULL){
		if(go->getSelected()){
			UnselectGObj(go);
		}
	}
	GameObjectTable::iterator it = _allGObj.find(go->getID());
	if(it!=_allGObj.end())
		_allGObj.erase(it);
};
void GameWorld::enqueueForRemoval(GameObject *go)
{
	_removalQueue.push(go);
};
int GameWorld::removeEnqueued()
{
	int res = _removalQueue.size();
	while(_removalQueue.size()>0){
		GameObject *go = _removalQueue.front();
		removeGameObject(go);
		_removalQueue.pop();
	}
	return res;
};
long GameWorld::getNextID()
{
	return nextID++;
};
long GameWorld::getIDUsed()
{
	return nextID;
};
vector<GameObject *> *GameWorld::getSelectedGObj()
{
	return &_selectedGObj;
};
void GameWorld::SelectGObj(GameObject *GObj, bool isRemoveOld)
{
	while(Gui::getDesktop()->isRefreshing()){}
	vector<GameObject *>::iterator it_current, it_last;
	if(isRemoveOld==true){
		while(_selectedGObj.size()>0){
			it_current = _selectedGObj.begin();
			GameObject *go = *it_current;
			_selectedGObj.erase(it_current);
			go->setSelected(false);
		}
	}
	it_current = _selectedGObj.begin();
	it_last = _selectedGObj.end();
	while(it_current!=it_last){
		if(GObj==*it_current++)//it is already selected
			return;
	}
	if(GObj!=NULL)
		GObj->setSelected(true);
	_selectedGObj.push_back(GObj);

	ActionInterpreter::getCurrentInterpreter()->resetInterpretation();
};

void GameWorld::UnselectGObj(GameObject *GObj)
{
	vector<GameObject *>::iterator it_current, it_last;
	it_current = _selectedGObj.begin();
	it_last = _selectedGObj.end();
	while(it_current!=it_last){
		if(GObj==*it_current){
			GObj->setSelected(false);
 			_selectedGObj.erase(it_current);
			break;
		}else{
			it_current++;
		}
	}
	CmdButtonBar::Instance()->Update();
};

void GameWorld::setViewPos(POINT *p)
{
	_viewPos.x = p->x;
	_viewPos.y = p->y;
	if(_viewPos.x<0)
		_viewPos.x = 0;
	else if(_viewPos.x>_viewPos_max.x)
		_viewPos.x = _viewPos_max.x;
	if(_viewPos.y<0)
		_viewPos.y = 0;
	else if(_viewPos.y>_viewPos_max.y)
		_viewPos.y = _viewPos_max.y;
};
POINT GameWorld::getViewPos()
{
	return _viewPos;
};
//-----------------------non-class-member function-------
int buildUpTheWorld(const char *mapfile)
{
	return GameWorld::_getInstance()->buildUpTheWorld(mapfile);
};
GameMap *getWorldMap()
{
	return GameWorld::_getInstance()->getWorldMap();
};
GameObjectTable * getAllGObjInTheWorld()
{
	return GameWorld::_getInstance()->getAllGObjInTheWorld();
};
GameObjectMap * getGameObjectMap(int whichmap)
{
	return GameWorld::_getInstance()->getGameObjectMap(whichmap);
};
GameObject * getGameObject(long id)
{
	return GameWorld::_getInstance()->getGameObject(id);
};
bool addGameObject(GameObject *go)
{
	return GameWorld::_getInstance()->addGameObject(go);
};
void removeGameObject(GameObject *go)
{
	GameWorld::_getInstance()->removeGameObject(go);
};
void enqueueForRemoval(GameObject *go)
{
	GameWorld::_getInstance()->enqueueForRemoval(go);
};
long getNextID()
{
	return GameWorld::_getInstance()->getNextID();
};
long getIDUsed()
{
	return GameWorld::_getInstance()->getIDUsed();
};
vector<GameObject *> *getSelectedGObj()
{
	return GameWorld::_getInstance()->getSelectedGObj();
};
void SelectGObj(GameObject *GObj, bool isRemoveOld)
{
	GameWorld::_getInstance()->SelectGObj(GObj, isRemoveOld);
};
void UnselectedGObj(GameObject *GObj)
{
	GameWorld::_getInstance()->UnselectGObj(GObj);
};
void setViewPos(POINT *p)
{
	GameWorld::_getInstance()->setViewPos(p);
};
POINT getViewPos()
{
	return GameWorld::_getInstance()->getViewPos();
};