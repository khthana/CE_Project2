#ifndef _God_header_
#define _God_header_

#include "GameEvent.h"

class God{
public:
	static God *Instance(){
		if(_instance==NULL)
			_instance=new God();
		return _instance;
	};
	void enlivenTheWorld();
	void takeControl();
	void driveTheWorld();
	void detroyTheWorld();
protected:
	static God *_instance;
	God(){};
	void handleEventRequest(GameEvent *e);
	void handleEventRequests();
};

#endif _God_header_
