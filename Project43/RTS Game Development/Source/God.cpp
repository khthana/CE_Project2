#include "God.h"

#include <windows.h>
#include <mmsystem.h>
#include "eventproc.h"
#include "GameObject.h"
#include "GameCharacters.h"
#include "GameMap.h"
#include "GameWorld.h"
#include "Player.h"
#include "GameCommandQueue.h"

#include <list>

using namespace std;


DWORD driveTheWorld_thread(LPVOID param);
DWORD Tid;
HANDLE hThread;

God * God::_instance=0;

void God::takeControl()
{
	hThread = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)driveTheWorld_thread,
		(LPVOID)NULL, 0, &Tid);

};

void God::detroyTheWorld(){
	TerminateThread(hThread, 0);
};

void God::driveTheWorld()
{
	while (GCmdQ::Instance()->isEmpty()==false)
	{
		GCmdQItem *qi = GCmdQ::Instance()->pop();
		GameObject *go = getGameObject(qi->gid);
		if (go != NULL)
			go->recieveCommand(qi->cmd);
	}

	PathFinder::startCount();
	long max=getIDUsed();
	GameObjectTable *all = getAllGObjInTheWorld();
	GameObjectTable::iterator current = all->begin();
	GameObjectTable::iterator last = all->end();
	while(current!=last){
		GameObject *GObj = (*current).second;
		GObj->takeAChance();
		current++;
	}
	handleEventRequests();
	GameWorld::_getInstance()->removeEnqueued();
};

inline int sendAcknowledgement(GameObject *go, GameEvent *e, ACK ack)
{
	if (go != NULL)
	{
		go->recieveAcknowledgement(e, ack);
		return 0;
	}
	else
		return -1;
};

inline int sendEvent(GameObject *go, GameEvent *e)
{
	if (go != NULL)
	{
		go->recieveEvent (e);
		return 0;
	}
	else
		return -1;
}

void God::handleEventRequests ()
{
	while (getEventRequestCount () > 0)
	{
		GameEvent *e = getEventRequestRandom ();
		handleEventRequest(e);
	}
};

void God::handleEventRequest(GameEvent *e)
{
	GameObject *actor, *actee;
	GameObjectMap *gom;
	switch (e->type)
	{
		case e_move:
			actor = getGameObject (e->actor_id);
			POINT tmpP;
			actor->getLocation(&tmpP, gom);
			POINT p = e->position;
			if (actor->isPlaceable(p.x, p.y, gom))
				(void) sendAcknowledgement (actor, e, ACK_OK);
			else
				(void) sendAcknowledgement (actor, e, ACK_NOT_OK);
			break;
		default:
			actor = getGameObject (e->actor_id);
			actee = getGameObject (e->actee_id);
			(void) sendAcknowledgement ( actor, e, ACK_OK);
			(void) sendEvent(actee, e);
	}
};

DWORD driveTheWorld_thread (LPVOID param)
{
	DWORD before, after, diff;
	while(true){
		before = GetTickCount();
		God::Instance()->driveTheWorld();
		after = GetTickCount();
		diff = after-before;
		if(diff<30){
			Sleep(30-diff);
		}
	}
};

void addGO(GameObject *go, POINT &point, GameObjectMap *gom)
{
	for (int i = 0; i < 10; i++)
	{
		for ( int j = 0; j <10; j++)
		{
			if (go->isPlaceable(point.x + i, point.y + j, gom))
			{
				go->setLocation(&point,gom);
				addGameObject(go);
				break;
			}
		}
	}
};

void God::enlivenTheWorld()
{
	GameObjectMap *grnd1 = getGameObjectMap(GRND_LYR_METRICS1);
	Player::initPlayerList();
	Player::newPlayer(0);
	Player::newPlayer(1);
	POINT p;

	p.x = 10; p.y = 10;
	addGO(new tree(getNextID()), p, grnd1);
	p.x = 13; p.y = 10;
	addGO(new tree(getNextID()), p, grnd1);
	p.x = 16; p.y = 8;
	addGO(new tree(getNextID()), p, grnd1);
	p.x = 22; p.y = 14;
	addGO(new tree(getNextID()), p, grnd1);

	p.x = 0; p.y = 10;
	addGO(new House1(getNextID(), 0), p, grnd1);
	p.x = 27; p.y = 12;
	addGO(new House1(getNextID(), 0), p, grnd1);
	p.x = 13; p.y = 15;
	addGO(new House1(getNextID(), 0), p, grnd1);

	p.x = 15; p.y = 15;
	addGO(new zergling(getNextID(), 0), p, grnd1);

	p.x = 16; p.y = 35;
	addGO(new zergling(getNextID(), 0), p, grnd1);	

	p.x = 17; p.y = 35;
	addGO(new zergling(getNextID(), 0), p, grnd1);


	p.x = 35; p.y = 35;
	addGO(new zergling(getNextID(), 0), p, grnd1);

	p.x = 35; p.y = 15;
	addGO(new zergling(getNextID(), 1), p, grnd1);

	p.x = 16; p.y = 20;
	addGO(new zergling(getNextID(), 1), p, grnd1);	

	p.x = 17; p.y = 20;
	addGO(new zergling(getNextID(), 1), p, grnd1);

	p.x = 18; p.y = 20;
	addGO(new zergling(getNextID(), 0), p, grnd1);

	p.x = 28; p.y = 20;
	addGO(new zergling(getNextID(), 1), p, grnd1);
};