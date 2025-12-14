#include "GameCommandButton.h"

GameCommandButton::GameCommandButton(game_command_type cmd, const char *bmpname)
:Fansy_Button(bmpname, 35, 36)
{
	this->cmd = cmd;
};

void GameCommandButton::onLeftButtonDown(POINT mPos, UINT KeyFlags)
{
	ActionInterpreter::getCurrentInterpreter()->cmdButtonClick(this->cmd);
};