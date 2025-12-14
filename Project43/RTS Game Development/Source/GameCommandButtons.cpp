#include "GameCommandButtons.h"

GameCommandButtons *GameCommandButtons::_instance=NULL;

GameCommandButtons::GameCommandButtons(){};

GameCommandButtons *GameCommandButtons::Instance()
{
	if(_instance==NULL){
		_instance = new GameCommandButtons();
		_instance->Init();
	}
	return _instance;
};
void GameCommandButtons::Init()
{
	GameCommandButton *cmdBt;

	cmdBt = new GameCommandButton(cmd_move, "cmdBtMove.bmp");
	cmdBt->setPos(20, 92);
	cmdBt->setVisibility(true);
	_table.insert(GCmdBtTable::value_type(cmd_move, cmdBt));

	cmdBt = new GameCommandButton(cmd_attack, "cmdBtAttack.bmp");
	cmdBt->setPos(78, 95);
	cmdBt->setVisibility(true);
	_table.insert(GCmdBtTable::value_type(cmd_attack, cmdBt));

	cmdBt = new GameCommandButton(cmd_stop, "cmdBtStop.bmp");
	cmdBt->setPos(136, 95);
	cmdBt->setVisibility(true);
	_table.insert(GCmdBtTable::value_type(cmd_stop, cmdBt));

	cmdBt = new GameCommandButton(cmd_cancel, "cmdBtCancel.bmp");
	cmdBt->setPos(136, 150);
	cmdBt->setVisibility(true);
	_table.insert(GCmdBtTable::value_type(cmd_cancel, cmdBt));
};
GameCommandButton *GameCommandButtons::getGCmdButton(game_command_type cmd)
{
	GCmdBtTable::iterator it = _table.find(cmd);
	if(it==_table.end())
		return NULL;
	else
		return (*it).second;
};
