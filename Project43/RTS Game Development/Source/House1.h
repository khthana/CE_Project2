#ifndef _House1_H_
#define _House1_H_

#include "GameObject.h"
#include "GameObjectAnimator.h"
#include "AI.h"

class House1;
class House1_normal_state;
class House1_destroyed_state;

class House1:public GameObject{
public:
	House1(long gid, long groupid);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance();
	virtual int getPossibleCommand(list<game_command_type> *cmdlist);
	void to_destroyed_state();
protected:
	House1_normal_state *normal_state;
	House1_destroyed_state *destroyed_state;
};

//begin---------------------alive state----------------------
class House1_normal_state:public GameObjectState{
public:
	House1_normal_state(GameObject *GObj);
	virtual void recieveEvent(GameEvent *e);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance(){};
};
//begin---------------------dead state----------------------
class House1_destroyed_state:public GameObjectState{
public:
	House1_destroyed_state(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance();
protected:
	int counter;
	int state;
};
//begin----------------- zergling animator-------------------
class House1_animator:public GameObjectAnimator{
public:
	House1_animator(GameObject *GO);
	virtual void actionChanged(long action){};
	virtual void directionChanged(long dir){};
	virtual void takeAChance(){};
};

#endif _House1_H_