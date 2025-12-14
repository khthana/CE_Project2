#include "eventproc.h"

EventList * EventList::_instance=0;
EventList * EventList::Instance()
{
	if(!_instance)
		_instance = new EventList();
	return _instance;
};
void EventList::postEventRequest(GameEvent *e)
{
	ereq_list.push_back(e);
};
GameEvent *EventList::getEventRequestRandom()
{
	//this code is not use random yet
	GameEvent *e = ereq_list.front();
	ereq_list.pop_front();
	return e;
};
int EventList::getEventRequestCount()
{
	return ereq_list.size();
};

//--------wanna use EventList, call functions below--------

int getEventRequestCount(){
	return EventList::Instance()->getEventRequestCount();
};
void postEventRequest(GameEvent *e){
	EventList::Instance()->postEventRequest(e);
};
GameEvent *getEventRequestRandom(){
	return EventList::Instance()->getEventRequestRandom();
};