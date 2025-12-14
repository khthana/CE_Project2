#include "GameObjectMap.h"
#include "GameObject.h"

GameObjectMap::GameObjectMap():Map(){};
GameObjectMap::GameObjectMap(int w, int h):Map(w, h){};
bool GameObjectMap::add(GameObject *GObj, int x, int y){ return true;};
void GameObjectMap::remove(GameObject *GObj, int x, int y){};
GameObject * GameObjectMap::get(int x, int y){return NULL;};
bool GameObjectMap::canAdd(int x, int y, GameObject *GObj){return true;};
