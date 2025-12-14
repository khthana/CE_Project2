#ifndef _GameCommand_header_
#define _GameCommand_header_

#include <windows.h>

typedef enum enum_game_command_type 
	{	cmd_attack, cmd_move,
		cmd_xattack, cmd_stop,
		cmd_cancel
	} game_command_type;

class GameCommand{
public:
	game_command_type type;
	long gid;
	int param1;
	int param2;
	POINT position;
};
#endif _GameCommand_header_