#include "GameCommandQueue.h"

GCmdQ *GCmdQ::_instance = NULL;
GCmdQ *GCmdQ::Instance()
{
	if (_instance==NULL)
		_instance = new GCmdQ();
	return _instance;
};

bool GCmdQ::isEmpty()
{
	if (_Q.size() > 0)
		return false;
	else
		return true;
};

GCmdQItem *GCmdQ::pop()
{
	GCmdQItem *iret = _Q.front();
	_Q.pop();
	return iret;
};

void GCmdQ::postCommand(GameCommand *cmd, int recvr_id)
{
	GCmdQItem *i = new GCmdQItem;//(GCmdQItem *)calloc (1, sizeof(GCmdQItem));
	i->cmd = cmd;
	i->gid = recvr_id;
	_Q.push(i);
};

//provide this function, so we can use it easier
void postCommand(GameCommand *cmd, int recvr_id)
{
	GCmdQ::Instance()->postCommand(cmd, recvr_id);
};
