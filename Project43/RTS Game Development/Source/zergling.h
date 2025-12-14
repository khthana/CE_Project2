#ifndef _zergling_header_
#define _zergling_header_

#include "GameObject.h"
#include "GameObjectAnimator.h"
#include "AI.h"

class zergling;
class zergling_selfHealing;
class zergling_motivation;
class zergling_attacking;
class zergling_idle_state;
class zergling_moveattack_state;
class zergling_gostrength_state;
class zergling_dead_state;

class zergling:public GameObject{
public:
	zergling(long gid, int groupid);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void takeAChance();
	virtual int getPossibleCommand(list<game_command_type> *cmdlist);
	void setDestination(POINT *dest);
	void attack(long target_id);
	void stopAttack();
	void stopMove();
	void stop();
	void to_idle_state();
	void to_gostrength_state(POINT *p);
	void to_dead_state();
	void to_moveattack_state(POINT *p);
protected:
	zergling_selfHealing *self_healing_fnc;
	zergling_motivation *motivation_fnc;
	zergling_attacking *attacking_fnc;
	zergling_idle_state *idle_state;
	zergling_moveattack_state *moveattack_state;
	zergling_gostrength_state *gostrength_state;
	zergling_dead_state *dead_state;
	bool can_move;
	bool can_attack;
	bool can_stop;
};

//begin--------------------self healing---------------------
class zergling_selfHealing:public GameObjectFunction{
public:
	zergling_selfHealing(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void work();
protected:
	int counter;
};

//begin---------------------motivation----------------------
class zergling_motivation:public GameObjectFunction{
public:
	zergling_motivation(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void work();
	void stop();
	void setDestination(POINT *dest);
protected:
	void constructPath();
	POINT destination;
	Path path;
	PathFinder *pf;
	GameObjectMap *grnd1;
	int counter;
	int state;
	int pf_counter;
	int pf_state;
	bool isNewDest;
};

//begin--------------------attacking---------------------
class zergling_attacking:public GameObjectFunction{
public:
	zergling_attacking(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void work();
	void attack(long target_id);
	void stop();
protected:
	int counter;
	int state;
	long target, next_target;
};

//begin---------------------idle state----------------------
class zergling_idle_state:public GameObjectState{
public:
	zergling_idle_state(GameObject *GObj);
	virtual void recieveCommand(GameCommand *cmd);
	virtual void recieveEvent(GameEvent *e);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void takeAChance();
protected:
	long currentTarget;
	long steppingIn;
	list<long> GObjIDList;

};
//begin---------------------moveattack state----------------------
class zergling_moveattack_state:public GameObjectState{
public:
	zergling_moveattack_state(GameObject *GObj);
	virtual void recieveCommand(GameCommand *cmd);
	virtual void recieveEvent(GameEvent *e);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void takeAChance();
	void killTillReach(POINT *p);
protected:
	long currentTarget;
	long steppingIn;
	list<long> GObjIDList;
	POINT destination;
};
//begin---------------------gostrength state----------------------
class zergling_gostrength_state:public GameObjectState{
public:
	zergling_gostrength_state(GameObject *GObj);
	virtual void recieveCommand(GameCommand *cmd);
	virtual void recieveEvent(GameEvent *e);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void takeAChance();
	void goStrengthTo(POINT *p);
protected:
	POINT destination;
};
//begin---------------------dead state----------------------
class zergling_dead_state:public GameObjectState{
public:
	zergling_dead_state(GameObject *GObj);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack);
	virtual void takeAChance();
protected:
	int counter;
	int state;
};
//begin----------------- zergling animator-------------------
class zergling_animator:public GameObjectAnimator{
public:
	zergling_animator(GameObject *GO);
	virtual void actionChanged(long action);
	virtual void directionChanged(long dir);
	virtual void takeAChance();
};

#endif _zergling_header_
