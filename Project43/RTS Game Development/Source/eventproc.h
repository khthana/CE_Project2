#ifndef _EVENT_PROCESSING_
#define _EVENT_PROCESSING_

#include "GameCommand.h"
#include "GameEvent.h"
#include <list>
#include <queue>

using namespace std;

class EventList{
public:
	static EventList * Instance();
	void postEventRequest(GameEvent *e);
	GameEvent *getEventRequestRandom();
	int getEventRequestCount();
private:
	static EventList * _instance;
	list<GameEvent *> ereq_list;
};

int getEventRequestCount();
void postEventRequest(GameEvent *e);
GameEvent *getEventRequestRandom();

#endif _EVENT_PROCESSING_