#ifndef _GameEvent_header_
#define _GameEvent_header_

#include <windows.h>

typedef enum enum_game_event_type 
	{	e_hit, e_heal,
		e_move
	} game_event_type;

typedef enum enum_acknowledge
	{	ACK_UNRECOGINIZED,
		ACK_OK,
		ACK_NOT_OK,
		ACK_TARGET_NOT_FOUND
	} ACK;


class GameEvent{
public:
	GameEvent(game_event_type type,
			long actor_id, long actee_id,
			int param1, int param2,
			const POINT *position);
	game_event_type type;
	long actor_id;
	long actee_id;
	int param1;
	int param2;
	POINT position;
};

GameEvent * createHitEvent(long actor_id, int hitpoint, long actee_id);
GameEvent * createHealEvent(long actor_id, int hitpoint, long actee_id);
GameEvent * createMoveEvent(long actor_id, const POINT &point);

#endif _GameEvent_header_