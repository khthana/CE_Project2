#include "GameCommand.h"

GameCommand createAttackCommand(long gid)
{
	GameCommand cmd;
	cmd.type = cmd_attack;
	cmd.gid = gid;
	return cmd;
};

GameCommand createMoveCommand(POINT p)
{
	GameCommand cmd;
	cmd.type = cmd_move;
	cmd.position.x = p.x;
	cmd.position.y = p.y;
	return cmd;
};

GameCommand createXAttackCommand(POINT p)
{
	GameCommand cmd;
	cmd.type = cmd_xattack;
	cmd.position.x = p.x;
	cmd.position.y = p.y;
	return cmd;
};

GameCommand createStopCommand()
{
	GameCommand cmd;
	cmd.type = cmd_stop;
	return cmd;
};
