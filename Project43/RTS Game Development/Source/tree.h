#ifndef _gtree_h_
#define _gtree_h_

#include "GameObject.h"
#include "GameObjectAnimator.h"
#include "AI.h"

class tree;
class tree_alive_state;
class tree_dead_state;

class tree:public GameObject{
public:
	tree(long gid);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance();
	virtual int getPossibleCommand(list<game_command_type> *cmdlist)
	{
		return 0;
	};
	void to_dead_state();
protected:
	tree_alive_state *alive_state;
	tree_dead_state *dead_state;
};

//begin---------------------alive state----------------------
class tree_alive_state:public GameObjectState{
public:
	tree_alive_state(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance(){};
protected:
	int counter;
	int state;
};
//begin---------------------dead state----------------------
class tree_dead_state:public GameObjectState{
public:
	tree_dead_state(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance(){};
protected:
	int counter;
	int state;
};
//begin----------------- zergling animator-------------------
class tree_animator:public GameObjectAnimator{
public:
	tree_animator(GameObject *GO);
	virtual void actionChanged(long action){};
	virtual void directionChanged(long dir){};
	virtual void takeAChance(){};
};

#endif _gtree_h