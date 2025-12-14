#ifndef _GCmdQ_H_
#define _GCmdQ_H_

#include "GameCommand.h"

#include <queue>
using namespace std;

class GCmdQItem{
public:
	GCmdQItem(){};
	int gid;
	GameCommand *cmd;
};

class GCmdQ{
public:
	static GCmdQ *Instance();
	GCmdQItem *pop();
	bool isEmpty();
	void postCommand(GameCommand *cmd, int recvr_id);
protected:
	static GCmdQ *_instance;
	GCmdQ(){};
	queue<GCmdQItem *> _Q;
};

GameCommand createAttackCommand(long gid);
GameCommand createMoveCommand(POINT p);
GameCommand createXAttackCommand(POINT p);
GameCommand createStopCommand();

void postCommand(GameCommand *cmd, int recvr_id);

#endif _GCmdQ_H_