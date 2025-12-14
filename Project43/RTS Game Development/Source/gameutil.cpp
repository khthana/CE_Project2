#include "gameutil.h"
#include "God.h"
#include <iostream>

int getGObjInRange(GameObject *caller, GameObjectMap *gom, list<long> *GObjIDList, POINT *p, int range_min, int range_max, int selected_policy)
{
	if(range_max<0||range_min<0||range_max<range_min)
		return -1;
	GObjIDList->clear();
	int caller_group = caller->getGroupID();
	int x = p->x;
	int y = p->y;
	int szx = caller->getWidth();
	int szy = caller->getHeight();

	int i, j;
	for(i = -range_max; i <= -range_min; i++){
		for(j = -range_max - szy; j <= range_max; j++){
			GameObject *go = gom->get(x+i, y+j);
			if(go != NULL && go != caller)
			{
				if((getPolicy(caller_group, go->getGroupID())&selected_policy)!=0){
					GObjIDList->push_back(go->getID());
				}
			}
		}
	}
	for(i = range_min + szx - 1; i <= range_max; i++){
		for(j = -range_max - szy; j <= range_max; j++){
			GameObject *go = gom->get(x+i, y+j);
			if(go != NULL && go != caller)
			{
				if((getPolicy(caller_group, go->getGroupID())&selected_policy)!=0){
					GObjIDList->push_back(go->getID());
				}
			}
		}
	}
	for(i = -range_min + 1; i <= range_min + szx -2 ; i++){
		for(j = -range_max - szy; j <= -range_min - szy; j++){
			GameObject *go = gom->get(x+i, y+j);
			if(go != NULL && go != caller)
			{
				if((getPolicy(caller_group, go->getGroupID())&selected_policy)!=0){
					GObjIDList->push_back(go->getID());
				}
			}
		}
	}
	for(i = -range_min + 1; i <= range_min + szx -2 ; i++){
		for(j = range_min; j <= range_max; j++){
			GameObject *go = gom->get(x+i, y+j);
			if(go != NULL && go != caller)
			{
				if((getPolicy(caller_group, go->getGroupID())&selected_policy)!=0){
					GObjIDList->push_back(go->getID());
				}
			}
		}
	}
	return GObjIDList->size();
};

void ExitGame()
{
	God::Instance()->detroyTheWorld();
};