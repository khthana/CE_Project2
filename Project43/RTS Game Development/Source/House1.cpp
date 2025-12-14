#include "House1.h"

House1::House1(long gid, long groupid)
:GameObject(gid, groupid, 9, 4)
{
	gtype = GTYPE_HOUSE1;
	action = ACT_STAND;
	dir = DIR_NORTH;

	setmaxlife(500);
	setlife(500);
	defense_strength = 6;

	_goanim = new House1_animator(this);
	normal_state = new House1_normal_state(this);
	destroyed_state = new House1_destroyed_state(this);
	_state = normal_state;
};

void House1::takeAChance()
{
	_state->takeAChance();

	if (getlife()<=0)
		to_destroyed_state();
};

void House1::to_destroyed_state()
{
	_state = destroyed_state;
};

int House1::getPossibleCommand(list<game_command_type> *cmdlist)
{
	return 0;
};

House1_normal_state::House1_normal_state(GameObject *GObj)
:GameObjectState(GObj)
{
};

void House1_normal_state::recieveEvent(GameEvent *e)
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

House1_destroyed_state::House1_destroyed_state(GameObject *GObj)
:GameObjectState(GObj)
{
	state = 0;
	counter = 30;
};

void House1_destroyed_state::takeAChance()
{
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


House1_animator::House1_animator(GameObject *GO)
:GameObjectAnimator(GO)
{
	_rid = createGORenderringID(GTYPE_HOUSE1, ACT_STAND, 0, DIR_NORTH, 0);
}