#include "zergling.h"
#include "Player.h"
#include "gameutil.h"

//begin--------------------- zergling -------------------------
zergling::zergling(long gid, int groupid)
:GameObject(gid, groupid, 1, 1)
{
	gtype = GTYPE_ZERG;
	sightrange = 6;
	attackrange = 1;
	setmaxlife(50);
	setlife(50);
	defense_strength = 4;

	_goanim = new zergling_animator(this);

	self_healing_fnc = new zergling_selfHealing(this);
	self_healing_fnc->setEnabled(true);

	motivation_fnc = new zergling_motivation(this);
	motivation_fnc->setEnabled(true);

	attacking_fnc = new zergling_attacking(this);
	attacking_fnc->setEnabled(true);

	idle_state = new zergling_idle_state(this);

	moveattack_state = new zergling_moveattack_state(this);

	gostrength_state = new zergling_gostrength_state(this);

	dead_state = new zergling_dead_state(this);

	_state = idle_state;

	setAction(ACT_STAND);
	setDirection(DIR_NORTH);

	can_attack = true;
	can_move = true;
	can_stop = true;
};

void zergling::recieveAcknowledgement(GameEvent *e, ACK ack)
{
	switch(e->type)
	{
		case e_move:
			motivation_fnc->recieveAcknowledgement(e, ack);
			break;
		case e_hit:
			break;
		case e_heal:
			break;
	}
};

void zergling::takeAChance()
{
	if(self_healing_fnc->isEnabled())
		self_healing_fnc->work();
	if(motivation_fnc->isEnabled())
		motivation_fnc->work();
	if(attacking_fnc->isEnabled())
		attacking_fnc->work();

	_state->takeAChance();
	_goanim->takeAChance();

	if(life<=0){
		to_dead_state();
	}
};

int 
zergling::getPossibleCommand(list<game_command_type> *cmdlist)
{
	cmdlist->clear();
	if(can_attack)
		cmdlist->push_back(cmd_attack);
	if(can_move)
		cmdlist->push_back(cmd_move);
	if(can_stop)
		cmdlist->push_back(cmd_stop);
	return cmdlist->size();
};

void 
zergling::stop()
{
	motivation_fnc->stop();
	attacking_fnc->stop();
};

void zergling::stopMove()
{
	motivation_fnc->stop();
};

void zergling::stopAttack()
{
	attacking_fnc->stop();
};

void zergling::setDestination(POINT *dest)
{
	motivation_fnc->setDestination(dest);
};

void 
zergling::attack(long target_id)
{
	attacking_fnc->attack(target_id);
};

void 
zergling::to_idle_state()
{
	stop();
	_state = idle_state;
	printf("to_idle_state OK\n");
	fflush(stdout);
};

void zergling::to_moveattack_state(POINT *p)
{
	stop();
	_state = moveattack_state;
	moveattack_state->killTillReach(p);
};

void zergling::to_gostrength_state(POINT *p)
{
	stop();
	_state = gostrength_state;
	gostrength_state->goStrengthTo(p);
	printf("to_go_strength_state OK\n");
	fflush(stdout);
};

void zergling::to_dead_state()
{
	stop();
	_state = dead_state;
	self_healing_fnc->setEnabled(false);
	motivation_fnc->setEnabled(false);
	attacking_fnc->setEnabled(false);
}
//begin------------------- self healing -----------------------
zergling_selfHealing::zergling_selfHealing(GameObject *GObj)
:GameObjectFunction(GObj)
{
	counter=0;
};

void zergling_selfHealing::recieveAcknowledgement(GameEvent *e, ACK ack)
{
};

void zergling_selfHealing::work()
{
	if(counter>=5){
		GObj->gethealed(1);
		counter = -1;
	}
	counter++;
};

//begin-------------------- motivation -------------------------
zergling_motivation::zergling_motivation(GameObject *GObj)
:GameObjectFunction(GObj)
{
	counter=0;
	state=0;
	pf_counter = 0;
	pf_state = 0;
	isNewDest = false;
};

void zergling_motivation::recieveAcknowledgement(GameEvent *e, ACK ack)
{
	switch(e->type)
	{
		case e_move:
			if(ack == ACK_OK)
			{
				//change to that next position
				POINT from, to;
				GameObjectMap *gom;
				GObj->getLocation(&from, gom);
				to = e->position;
				GObj->setDirection(GameMap::Direction(from, to));
				GObj->setLocation(&to, gom);
				GObj->setAction (ACT_MOVE);
				path.pop_front ();
				state=1;
				counter=5;
			}
			break;
	}
};

void zergling_motivation::work()
{
	switch (state)
	{
		case -1:
			break;
		case 0:
			if (path.size () > 0)
			{
				if (GObj->getAction () == ACT_STAND)
				{
					//get next position
 					POINT p = path.front ();
					//if we can go there
					if (GObj->isPlaceable(p.x, p.y, NULL) == false)
					{
						path.clear ();
						isNewDest = true;
						return;
					}
					else
					{
						postEventRequest (createMoveEvent (GObj->getID (), p));
					}
				}
			}
			else if(isNewDest&&PathFinder::canServ())
			{
				constructPath();
				Path::iterator iter = path.end ();
				POINT goal = *(--iter);
				if(GameMap::DistEstimate(destination, goal)<5)
				{
					destination.x = goal.x;
					destination.y = goal.y;
					isNewDest = false;
				}
			}
			break;
		case 1:
			if(--counter==0)
			{
				GObj->setAction(ACT_STAND);
				state=2;
				counter=3;
			}
			break;
		case 2:
			if(--counter==0)
			{
				state=0;
			}
			break;
	}
};

void zergling_motivation::stop()
{
	POINT p;
	path.clear ();
	GameObjectMap *tmp;
	GObj->getLocation(&p, tmp);
	destination.x = p.x;
	destination.y = p.y;
	isNewDest = false;
	printf("motivation stop OK\n");
	fflush(stdout);
};

void zergling_motivation::setDestination(POINT *dest)
{
	path.clear ();
	destination.x = dest->x;
	destination.y = dest->y;
	isNewDest = true;
};

void zergling_motivation::constructPath()
{
	path.clear ();
	POINT currentPos;
	GameObjectMap *gom;
	GObj->getLocation(&currentPos, gom);
	pf->path(&path, &currentPos, &destination, GObj);
	if(path.size () > 0) 
		path.pop_front();//remove starting point, we are already here at starting point
};
//begin-------------------- attacking ------------------------
zergling_attacking::zergling_attacking(GameObject *GObj)
:GameObjectFunction(GObj)
{
	counter=0;
	state=0;
	target = next_target = 0xffffffff;
};

void zergling_attacking::recieveAcknowledgement(GameEvent *e, ACK ack)
{
};

void zergling_attacking::work()
{
	GameObject *go;
	switch(state)
	{
		case 0:
			//nothing to do when state==0
			break;
		case 1:
			go = getGameObject(target);
			if(go==NULL){
				state = 4;
				break;
			}
			if(GObj->getAction()==ACT_STAND)
			{
				GObj->setAction(ACT_ATTACK);
				POINT from, to;
				GameObjectMap *tmp;
				GObj->getLocation(&from, tmp);
				go->getLocation(&to, tmp);
				GObj->setDirection(GameMap::Direction(from, to));
				state=2;
				counter=4;
			}
			break;
		case 2:
			if(--counter==0)
			{
				postEventRequest(createHitEvent(GObj->getID(), 10, target));
				GObj->setAction(ACT_STAND);
				state = 3;
				counter=3;
			}
			break;
		case 3:
			if(--counter==0)
				state = 4;
			break;
		case 4://more target to attack?
			if(next_target!=0xffffffff)
			{
				target = next_target;
				next_target = 0xffffffff;
				state = 1;
			}
			else
			{
				target = 0xffffffff;
				state = 0;
			}
			break;
	}
};

void zergling_attacking::attack(long target_id)
{
	printf("#%d attack %d\n", GObj->getID(), target_id);
	fflush(stdout);
	((zergling *)GObj)->stopMove();
	if(state==0)
	{
		target=target_id;
		state=1;
	}
	else
	{
		next_target=target_id;
	}
};

void zergling_attacking::stop()
{
	next_target=0xffffffff;
};

//begin-------------------- idle state------------------------
zergling_idle_state::zergling_idle_state(GameObject *GObj)
:GameObjectState(GObj)
{
	currentTarget = 0xffffffff;
	steppingIn=0;
};

void zergling_idle_state::recieveCommand(GameCommand *cmd)
{
	switch(cmd->type)
	{
		case cmd_move:
			((zergling *)GObj)->to_gostrength_state(&cmd->position);
			break;
		case cmd_xattack:
			((zergling *)GObj)->to_moveattack_state(&cmd->position);		
			break;
		case cmd_stop:
			((zergling*)GObj)->to_idle_state();
			break;
	}
};

void zergling_idle_state::recieveEvent(GameEvent *e)
{
	switch(e->type)
	{
		case e_hit:
			GObj->gethurted(e->param1);
			break;
		case e_heal:
			GObj->gethealed(e->param1);
			break;
	}
};

void zergling_idle_state::recieveAcknowledgement(GameEvent *e, ACK ack)
{
};

void zergling_idle_state::takeAChance()
{
	GameObject *go = getGameObject(currentTarget);
	GameObjectMap *gom;
	if(go!=NULL)
	{
		if(GObj->isInAttackRange(go)==true)
		{
			((zergling *)GObj)->attack(currentTarget);
			return;
		}
	}

	POINT p;
	GObj->getLocation(&p, gom);
	getGObjInRange(GObj, gom, &GObjIDList, &p, 1, GObj->getAttackRange(), POLICY_ENEMY);
	if(GObjIDList.size()>0)
	{
		currentTarget = GObjIDList.front();
		GObjIDList.pop_front();
		((zergling *)GObj)->attack(currentTarget);
		steppingIn = 0;
		printf (" %d:#%d First SEE\n", GObj->getGroupID(), GObj->getID());
	}
	else
	{
		if(steppingIn==0)
		{
			getGObjInRange(GObj, gom, &GObjIDList, &p, GObj->getAttackRange()+1, GObj->getSightRange(), POLICY_ENEMY);
			if(GObjIDList.size()>0)
			{
				POINT p;
				getGameObject(GObjIDList.front())->getLocation(&p,gom);
				GObjIDList.pop_front();
				((zergling *)GObj)->setDestination(&p);
				steppingIn = 30;
			}
		}
		else
		{
			steppingIn--;
		}
	}
};

//begin-------------------- moveattack state------------------------
zergling_moveattack_state::zergling_moveattack_state(GameObject *GObj)
:GameObjectState(GObj)
{
	currentTarget = 0xffffffff;
	steppingIn=0;
};

void zergling_moveattack_state::recieveCommand(GameCommand *cmd)
{
	POINT p;
	GameObjectMap *tmp;
	switch(cmd->type)
	{
		case cmd_move:
			((zergling *)GObj)->to_gostrength_state(&cmd->position);
			break;
		case cmd_xattack:
			((zergling *)GObj)->to_moveattack_state(&cmd->position);		
			break;
		case cmd_stop:
			GObj->getLocation(&p, tmp);
			((zergling*)GObj)->setDestination(&p);
			((zergling*)GObj)->to_idle_state();
			break;
	}
};

void zergling_moveattack_state::recieveEvent(GameEvent *e)
{
	switch(e->type)
	{
		case e_hit:
			GObj->gethurted(e->param1);
			break;
		case e_heal:
			GObj->gethealed(e->param1);
			break;
	}
};

void zergling_moveattack_state::recieveAcknowledgement(GameEvent *e, ACK ack)
{
};

void zergling_moveattack_state::takeAChance()
{
	GameObject *go = getGameObject(currentTarget);
	GameObjectMap *gom;
	if(go!=NULL)
	{
		if(GObj->isInAttackRange(go)==true)
		{
			((zergling *)GObj)->attack(currentTarget);
			return;
		}
	}

	POINT p;
	GObj->getLocation(&p, gom);
	getGObjInRange(GObj, gom, &GObjIDList, &p, 1, GObj->getAttackRange(), POLICY_ENEMY);
	if(GObjIDList.size()>0)
	{
		currentTarget = GObjIDList.front();
		GObjIDList.pop_front();
		((zergling *)GObj)->attack(currentTarget);
		steppingIn = 0;
	}
	else
	{
		if(steppingIn==0)
		{
			getGObjInRange(GObj, gom, &GObjIDList, &p, GObj->getAttackRange()+1, GObj->getSightRange(), POLICY_ENEMY);
			if(GObjIDList.size()>0)
			{
				POINT p;
				getGameObject(GObjIDList.front())->getLocation(&p, gom);
				GObjIDList.pop_front();
				((zergling *)GObj)->setDestination(&p);
			}
			else
			{
				((zergling *)GObj)->setDestination(&destination);
			}
			steppingIn = 30;
		}
		else
		{
			steppingIn--;
		}
	}
};

void zergling_moveattack_state::killTillReach(POINT *p)
{
	printf("kill till reach\n");
	this->destination.x = p->x;
	this->destination.y = p->y;
};

//begin------------------- dead state --------------------
zergling_dead_state::zergling_dead_state(GameObject *GObj)
:GameObjectState(GObj)
{
	state = 0;
	counter = 30;
};

void zergling_dead_state::recieveAcknowledgement(GameEvent *e, ACK ack)
{
};

void zergling_dead_state::takeAChance()
{
	POINT p;
	switch(state){
	case 0:
		//GObj->setGroupID(8);
		//GObj->setAction(ACT_DECAY);
		state = 1;
		break;
	case 1:
		if(--counter<0){
			GObj->leaveLocation();
			enqueueForRemoval(GObj);
			state = -1;
		}
		break;
	}
};

//begin------------------- gostrength state --------------------
zergling_gostrength_state::zergling_gostrength_state(GameObject *GObj)
:GameObjectState(GObj)
{
};

void zergling_gostrength_state::recieveCommand(GameCommand *cmd)
{
	switch(cmd->type){
	case cmd_move:
		goStrengthTo(&cmd->position);
		break;
	case cmd_xattack:
		((zergling *)GObj)->to_moveattack_state(&cmd->position);		
		break;
	case cmd_stop:
		((zergling*)GObj)->to_idle_state();
		break;
	}
};

void zergling_gostrength_state::recieveEvent(GameEvent *e)
{
	switch(e->type){
	case e_hit:
		GObj->gethurted(e->param1);
		break;
	case e_heal:
		GObj->gethealed(e->param1);
		break;
	}
};

void zergling_gostrength_state::recieveAcknowledgement(GameEvent *e, ACK ack)
{
};

void zergling_gostrength_state::takeAChance()
{
	POINT p;
	GameObjectMap *tmp;
	GObj->getLocation(&p, tmp);
	if(p.x==destination.x && p.y==destination.y)
		((zergling *)GObj)->to_idle_state();
};

void zergling_gostrength_state::goStrengthTo(POINT *p)
{
	destination.x = p->x;
	destination.y = p->y;
	((zergling *)GObj)->setDestination(p);
};
//begin------------------- zergling animator --------------------

zergling_animator::zergling_animator(GameObject *GO)
:GameObjectAnimator(GO)
{
	specialstep = 0;
	actionstep=0;
};
void zergling_animator::actionChanged(long action)
{
	this->action = action;
	actionstep = 0;
};
void zergling_animator::directionChanged(long dir)
{
	this->dir = dir;
	actionstep = 0;
};
void zergling_animator::takeAChance()
{
	_rid=(gtype<<20)|(action<<16)|(specialstep<<8)|(dir<<4)|actionstep;
};