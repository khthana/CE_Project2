#include "GameObjectAnimator.h"
#include "GameObject.h"

GameObjectAnimator::GameObjectAnimator(GameObject *GO)
{
	GObj = GO;
	gtype = GObj->getTypeId();
	_rid = 0;
};

GORenderringID GameObjectAnimator::getRenderringID()
{
	return _rid;
};