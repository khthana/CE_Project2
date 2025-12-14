#ifndef GameCommandButton_header_
#define GameCommandButton_header_

#include <windows.h>
#include "Fansy_Button.h"
#include "ActionInterpreter.h"

class GameCommandButton:public Fansy_Button{
public:
	GameCommandButton(game_command_type cmd, const char *bmpname);
	virtual void onLeftButtonDown(POINT mPos, UINT KeyFlags);
protected:
	game_command_type cmd;
};
#endif GameCommandButton_header_