#ifndef ActionInterpreter_header_
#define ActionInterpreter_header_
#include <windows.h>
#include "GameCommand.h"
#include <list>
using namespace std;

class ActionInterpreter;

class ActionInterpreter{
public:
	virtual void leftClickOnMap(POINT p, UINT keyFlags){};
	virtual void rightClickOnMap(POINT p, UINT keyFlags){};
	virtual void leftClickOnMiniMap(POINT p, UINT keyFlags){};
	virtual void rightClickOnMiniMap(POINT p, UINT keyFlags){};
	virtual void cmdButtonClick(game_command_type cmd){};
	virtual void resetState(){};
	virtual void getPossibleCommand(list<game_command_type> *cmdList){};
	static ActionInterpreter *getCurrentInterpreter();
	static void initInterpretation();
	static void resetInterpretation();
	static void interpreterChanged();
protected:
	ActionInterpreter* previous;
	static ActionInterpreter *currentInterpreter;
	static void forwardTo(ActionInterpreter *AInterp);
	static void retrace();
	static ActionInterpreter *menuPage1, *menuPage2, *menuPage3,
			*cmdInterp_attack, *cmdInterp_move;
};

class MenuPage1:ActionInterpreter{
public:
	virtual void leftClickOnMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMap(POINT p, UINT keyFlags);
	virtual void leftClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void cmdButtonClick(game_command_type cmd);
	virtual void resetState();
	virtual void getPossibleCommand(list<game_command_type> *cmdList);
protected:
	int state;
};

class MenuPage2:ActionInterpreter{
public:
	virtual void leftClickOnMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMap(POINT p, UINT keyFlags);
	virtual void leftClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void cmdButtonClick(game_command_type cmd);
	virtual void resetState();
	virtual void getPossibleCommand(list<game_command_type> *cmdList);
protected:
	int state;
};

class MenuPage3:ActionInterpreter{
public:
	virtual void leftClickOnMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMap(POINT p, UINT keyFlags);
	virtual void leftClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void cmdButtonClick(game_command_type cmd);
	virtual void resetState();
	virtual void getPossibleCommand(list<game_command_type> *cmdList);
protected:
	int state;
};

class CmdInterp_move:ActionInterpreter{
public:
	virtual void leftClickOnMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMap(POINT p, UINT keyFlags);
	virtual void leftClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void cmdButtonClick(game_command_type cmd);
	virtual void resetState();
	virtual void getPossibleCommand(list<game_command_type> *cmdList);
protected:
	int state;
};

class CmdInterp_attack:ActionInterpreter{
public:
	virtual void leftClickOnMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMap(POINT p, UINT keyFlags);
	virtual void leftClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void rightClickOnMiniMap(POINT p, UINT keyFlags);
	virtual void cmdButtonClick(game_command_type cmd);
	virtual void resetState();
	virtual void getPossibleCommand(list<game_command_type> *cmdList);
protected:
	int state;
};
#endif ActionInterpreter_header_
