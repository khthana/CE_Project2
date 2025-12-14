#include "GameObject.h"
#include "GameObjectAnimator.h"
#include "GameWorld.h"

GameObject::GameObject(long gid, int groupid, int szx, int szy)
{
	this->gid = gid;
	ggroupid = groupid;
	pain = 0;
	b_isSelected = false;
	size_x = szx;
	size_y = szy;
	_current_location = NULL;
};
long GameObject::getID()
{
	return gid;
};
int GameObject::getGroupID()
{
  	return ggroupid;
};
void GameObject::setGroupID(int id)
{
	ggroupid = id;
};
void GameObject::setmaxlife(int lifepoint)
{
	maxlife = lifepoint;
};
int GameObject::getmaxlife()
{
	return maxlife;
};
void GameObject::setlife(int lifepoint)
{
	life = lifepoint;
};
int GameObject::getlife()
{
	return life;
};
void GameObject::lifeup(int lifepoint)
{
	life+=lifepoint;
	if(life>maxlife)
		life = maxlife;
};
void GameObject::lifedown(int lifepoint)
{
	life-=lifepoint;
	if(life<0)
		life = 0;
};
void GameObject::setmaxenergy(int energypoint)
{
	maxenergy = energypoint;
};
int GameObject::getmaxenergy()
{
	return maxenergy;
};
void GameObject::setenergy(int energypoint)
{
	energy = energypoint;
};
int GameObject::getenergy()
{
	return energy;
};
void GameObject::energyup(int energypoint)
{
	energy+=energypoint;
	if(energy>maxenergy)
		energy = maxenergy;
};
void GameObject::energydown(int energypoint)
{
	energy-=energypoint;
	if(energy<0)
		energy = 0;
};
void GameObject::gethurted(int hitpoint){
	pain += hitpoint;
	int down = floor(pain/defense_strength);
	lifedown(down);
	pain = pain%defense_strength;
};
void GameObject::gethealed(int healpoint){
	if(life==maxlife&&pain==0) return;
	if(healpoint<=pain){
		pain-=healpoint;
		return;
	}else{
		healpoint-=pain;
	}
	int i = ceil((double)healpoint/defense_strength);
	lifeup(i);
	i = healpoint%defense_strength;
	pain = (i==0)? 0:defense_strength-i;
};
void GameObject::getLocation(POINT *p, GameObjectMap * &gom)
{
	p->x = position.x;
	p->y = position.y;
	gom = _current_location;
};

void GameObject::setLocation(POINT *p, GameObjectMap *gom)
{
	int i, j;
	int x, y;

	leaveLocation();//get out of current location

	for (i = 0; i < size_x; i++)
	{
		for (j = 0; j < size_y; j++)
		{
			x = p->x + i;
			y = p->y - j;
			gom->add (this, x, y);
		}
	}
	_current_location = gom;
	position.x = p->x;
	position.y = p->y;
};
void GameObject::leaveLocation()
{
	int i, j;
	int x, y;

	if (_current_location == NULL)//haven't located anywhere
		return;

	for (i = 0; i< size_x; i++)
	{
		for ( j = 0; j < size_y; j++)
		{
			x = position.x + i;
			y = position.y - j;
			_current_location->remove (this, x, y);
		}
	}

	_current_location = NULL;
};
bool GameObject::isPlaceable(int x, int y, GameObjectMap *gom)
{
	GameMap *gm = getWorldMap();

	if (gom == NULL)
		gom = _current_location;
		
	int i, j;
	int _x, _y;
	for(i = 0; i < size_x; i++)
	{
		for(j = 0; j < size_y; j++)
		{
			_x = x + i;
			_y = y - j;
			if (gm->pointExist (_x, _y))
			{
				if (gom->canAdd(_x, _y, this) == false)
					return false;
			}else
				return false;
		}
	}
	return true;
};
bool GameObject::isInAttackRange(GameObject *target)
{
	POINT p1, p2;
	GameObjectMap *tmp;
	this->getLocation(&p1, tmp);
	target->getLocation(&p2, tmp);

	//test for x axis
	if (p1.x > p2.x)
	{
		if(p1.x - (p2.x+target->getWidth()-1) > this->getAttackRange())
			return false;
	}
	else if (p1.x < p2.x)
	{
		if(p2.x - (p1.x+this->getWidth()-1) > this->getAttackRange())
			return false;
	}
	//test for y axis
	if (p1.y > p2.y)
	{
		if((p1.y-this->getHeight()+1) - p2.y > this->getAttackRange())
			return false;
	}
	else if (p1.y < p2.y)
	{
		if((p2.y-target->getHeight()+1) - p1.y > this->getAttackRange())
			return false;
	}

	return true;
};
void GameObject::recieveCommand(GameCommand *cmd)
{
	_state->recieveCommand(cmd);
};
void GameObject::recieveEvent(GameEvent *e)
{
	_state->recieveEvent(e);
};
GORenderringID GameObject::getRenderringID(int x, int y)
{
	if (x == position.x && y == position.y)
		return _goanim->getRenderringID();
	else
		return 0XFFFFFFFF;
};
int GameObject::getSightRange()
{
	return sightrange;
};
int GameObject::getAttackRange()
{
	return attackrange;
};
void GameObject::setAction(long action)
{
	this->action = action;
	_goanim->actionChanged(action);
};
void GameObject::setDirection(long dir)
{
	this->dir = dir;
	_goanim->directionChanged(dir);
};
long GameObject::getAction()
{
	return action;
};
long GameObject::getDirection()
{
	return dir;
};
long GameObject::getTypeId()
{
	return gtype;
};
bool GameObject::getSelected()
{
	return b_isSelected;
};
void GameObject::setSelected(bool bVal)
{
	b_isSelected = bVal;
};

//GameFunction's Method
GameObjectFunction::GameObjectFunction(GameObject *GObj)
{
	this->b_isEnabled = false;
	this->GObj = GObj;	
};

void GameObjectFunction::setEnabled(bool b_value)
{
	b_isEnabled = b_value;
};

bool GameObjectFunction::isEnabled()
{
	return b_isEnabled;
};

//GameObjectState's Method
GameObjectState::GameObjectState(GameObject *GObj)
{
	this->GObj = GObj;
};