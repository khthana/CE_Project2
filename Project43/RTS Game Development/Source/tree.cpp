#include "tree.h"

tree::tree(long gid)
:GameObject(gid, NATURAL_GO_GROUP_ID, 2, 2)
{
	gtype = GTYPE_TREE;
	action = ACT_STAND;
	dir = DIR_NORTH;

	setmaxlife(100);
	setlife(100);
	defense_strength = 3;

	_goanim = new tree_animator(this);
	alive_state = new tree_alive_state(this);
	dead_state = new tree_dead_state(this);
	_state = alive_state;
};

void tree::takeAChance()
{
	if(life<=0){
		to_dead_state();
	}
};

void tree::to_dead_state()
{
	_state = dead_state;
};

tree_alive_state::tree_alive_state(GameObject *GObj)
:GameObjectState(GObj)
{
};

tree_dead_state::tree_dead_state(GameObject *GObj)
:GameObjectState(GObj)
{
};

tree_animator::tree_animator(GameObject *GO)
:GameObjectAnimator(GO)
{
	_rid = createGORenderringID(GTYPE_TREE, ACT_STAND, 0, DIR_NORTH, 0);
}