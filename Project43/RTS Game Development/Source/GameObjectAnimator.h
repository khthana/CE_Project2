#ifndef _GmeObjectAnimator_header_
#define _GmeObjectAnimator_header_

#include "GodOfRenderring.h"

class GameObject;

class GameObjectAnimator{
public:
	GameObjectAnimator(GameObject *GO);
	virtual void actionChanged(long action){};
	virtual void directionChanged(long dir){};
	virtual GORenderringID getRenderringID();
	virtual void takeAChance(){};
protected:
	long action;
	long dir;
	long actionstep;
	long specialstep;
	GameObject *GObj;
	long gtype;
	GORenderringID _rid;
};

#endif _GmeObjectAnimator_header_