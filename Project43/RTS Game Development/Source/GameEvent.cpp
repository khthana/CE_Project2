#include "GameEvent.h"

GameEvent::GameEvent(game_event_type type,
					 long actor_id, long actee_id,
					 int param1, int param2,
					 const POINT *position)
{
	this->type = type;
	this->actor_id = actor_id;
	this->actee_id = actee_id;
	this->param1 = param1;
	this->param2 = param2;
	if(position!=NULL){
		this->position.x = position->x;
		this->position.y = position->y;
	}else{
		this->position.x = 0;
		this->position.y = 0;
	}
};

GameEvent * createHitEvent(long actor_id, int hitpoint, long actee_id)
{
	GameEvent *e = new GameEvent(e_hit, actor_id, actee_id, hitpoint, 0, NULL);
	return e;
};

GameEvent * createHealEvent(long actor_id, int hitpoint, long actee_id)
{
	GameEvent *e = new GameEvent(e_heal, actor_id, actee_id, hitpoint, 0, NULL);
	return e;
};

GameEvent * createMoveEvent(long actor_id, const POINT &point)
{
	GameEvent *e = new GameEvent(e_move, actor_id, 0, 0, 0, &point);
	return e;
};