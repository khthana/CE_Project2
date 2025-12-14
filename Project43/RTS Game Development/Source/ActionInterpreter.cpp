#include "ActionInterpreter.h"
#include "GameWorld.h"
#include "MapViewer.h"
#include "GameObject.h"
#include "CmdButtonBar.h"
#include "GameCommandQueue.h"

ActionInterpreter* ActionInterpreter::currentInterpreter=NULL;
ActionInterpreter* ActionInterpreter::menuPage1=NULL;
ActionInterpreter* ActionInterpreter::menuPage2=NULL;
ActionInterpreter* ActionInterpreter::menuPage3=NULL;
ActionInterpreter* ActionInterpreter::cmdInterp_attack=NULL;
ActionInterpreter* ActionInterpreter::cmdInterp_move=NULL;

/*--------------------------------------------------------------*
 *							MenuPage1 start						*
 *--------------------------------------------------------------*/

void MenuPage1::leftClickOnMap(POINT p, UINT keyFlags)
{
	GroundLayerMap *grnd1;
	grnd1 = (GroundLayerMap *)getGameObjectMap(GRND_LYR_METRICS1);
	GameObject *go = grnd1->get(p.x, p.y);
	if(go!=NULL)
	{
		if((keyFlags & MK_SHIFT)!=0)
		{
			printf("keyFlags = %ld MK_SHIFT = %ld\n", keyFlags, MK_SHIFT);
			SelectGObj(go, false);
		}
		else
		{
			SelectGObj(go, true);
		}
	}
};
void MenuPage1::rightClickOnMap(POINT p, UINT keyFlags)
{
	vector<GameObject *> *goList = getSelectedGObj();
	vector<GameObject *>::iterator it_current = goList->begin();
	vector<GameObject *>::iterator it_last = goList->end();
	GameObject *go;
	while(it_current!=it_last){
		go = *it_current++;
		GameCommand *cmd = new GameCommand();
		*cmd = createMoveCommand(p);
		postCommand(cmd, go->getID());
	}
	printf("rightClickOnMap OK\n");
	fflush(stdout);
};
void MenuPage1::leftClickOnMiniMap(POINT p, UINT keyFlags)
{
	p.x -= MAX_VISIBLE_TILE_X/2;
	p.y -= MAX_VISIBLE_TILE_Y/2;
	setViewPos(&p);
};
void MenuPage1::rightClickOnMiniMap(POINT p, UINT keyFlags)
{
	vector<GameObject *> *goList = getSelectedGObj();
	vector<GameObject *>::iterator it_current = goList->begin();
	vector<GameObject *>::iterator it_last = goList->end();
	GameObject *go;
	while(it_current!=it_last){
		go = *it_current++;
		GameCommand *cmd = new GameCommand();
		*cmd = createMoveCommand(p);
		postCommand(cmd, go->getID());
	}
};
void MenuPage1::cmdButtonClick(game_command_type cmd)
{
	switch(cmd){
	case cmd_move:
		ActionInterpreter::forwardTo(cmdInterp_move);
		break;
	case cmd_attack:
		ActionInterpreter::forwardTo(cmdInterp_attack);
		break;
	case cmd_stop:
		vector<GameObject *> *goList = getSelectedGObj();
		vector<GameObject *>::iterator it_current = goList->begin();
		vector<GameObject *>::iterator it_last = goList->end();
		GameObject *go;
		while(it_current!=it_last){
			go = *it_current++;
			GameCommand *cmd = new GameCommand();
			*cmd = createStopCommand();
			postCommand(cmd, go->getID());
		}
		break;
	}
};
void MenuPage1::resetState()
{
	state = 0;
};
void MenuPage1::getPossibleCommand(list<game_command_type> *cmdList)
{
	GameObject *go;
	switch(state){
	case 0:
		vector<GameObject *> *goList = getSelectedGObj();
		GameObject *go = NULL;
		if(goList->size()>0){
			go = *(goList->begin());
		}
		if(go!=NULL){
			go->getPossibleCommand(cmdList);
		}
		break;
	}
};

/*--------------------------------------------------------------*
 *							MenuPage2 start						*
 *--------------------------------------------------------------*/

void MenuPage2::leftClickOnMap(POINT p, UINT keyFlags){};
void MenuPage2::rightClickOnMap(POINT p, UINT keyFlags){};
void MenuPage2::leftClickOnMiniMap(POINT p, UINT keyFlags){};
void MenuPage2::rightClickOnMiniMap(POINT p, UINT keyFlags){};
void MenuPage2::cmdButtonClick(game_command_type cmd){};
void MenuPage2::resetState()
{
	state = 0;
};
void MenuPage2::getPossibleCommand(list<game_command_type> *cmdList){};

/*--------------------------------------------------------------*
 *							MenuPage3 start						*
 *--------------------------------------------------------------*/

void MenuPage3::leftClickOnMap(POINT p, UINT keyFlags){};
void MenuPage3::rightClickOnMap(POINT p, UINT keyFlags){};
void MenuPage3::leftClickOnMiniMap(POINT p, UINT keyFlags){};
void MenuPage3::rightClickOnMiniMap(POINT p, UINT keyFlags){};
void MenuPage3::cmdButtonClick(game_command_type cmd){};
void MenuPage3::resetState()
{
	state = 0;
};
void MenuPage3::getPossibleCommand(list<game_command_type> *cmdList){};

/*--------------------------------------------------------------*
 *					CmdInterp_attack start						*
 *--------------------------------------------------------------*/

void CmdInterp_attack::leftClickOnMap(POINT p, UINT keyFlags){
	vector<GameObject *> *goList = getSelectedGObj();
	vector<GameObject *>::iterator it_current = goList->begin();
	vector<GameObject *>::iterator it_last = goList->end();
	GameObject *go;
	while(it_current!=it_last){
		go = *it_current++;
		GameCommand *cmd = new GameCommand();
		*cmd = createXAttackCommand(p);
		postCommand(cmd, go->getID());
	}
	retrace();
};
void CmdInterp_attack::rightClickOnMap(POINT p, UINT keyFlags){};
void CmdInterp_attack::leftClickOnMiniMap(POINT p, UINT keyFlags)
{
	vector<GameObject *> *goList = getSelectedGObj();
	vector<GameObject *>::iterator it_current = goList->begin();
	vector<GameObject *>::iterator it_last = goList->end();
	GameObject *go;
	while(it_current!=it_last){
		go = *it_current++;
		GameCommand *cmd = new GameCommand();
		*cmd = createXAttackCommand(p);
		postCommand(cmd, go->getID());
	}
	retrace();
};
void CmdInterp_attack::rightClickOnMiniMap(POINT p, UINT keyFlags){};
void CmdInterp_attack::cmdButtonClick(game_command_type cmd)
{
	switch(cmd){
	case cmd_cancel:
		retrace();
		break;
	};
};

void CmdInterp_attack::resetState()
{
	state = 0;
};
void CmdInterp_attack::getPossibleCommand(list<game_command_type> *cmdList)
{
	cmdList->push_back(cmd_cancel);
};

/*--------------------------------------------------------------*
 *					CmdInterp_move start						*
 *--------------------------------------------------------------*/

void CmdInterp_move::leftClickOnMap(POINT p, UINT keyFlags)
{
	vector<GameObject *> *goList = getSelectedGObj();
	vector<GameObject *>::iterator it_current = goList->begin();
	vector<GameObject *>::iterator it_last = goList->end();
	GameObject *go;
	while(it_current!=it_last){
		go = *it_current++;
		GameCommand *cmd = new GameCommand();
		*cmd = createMoveCommand(p);
		postCommand(cmd, go->getID());
	}
	retrace();
};
void CmdInterp_move::rightClickOnMap(POINT p, UINT keyFlags){};
void CmdInterp_move::leftClickOnMiniMap(POINT p, UINT keyFlags)
{
	vector<GameObject *> *goList = getSelectedGObj();
	vector<GameObject *>::iterator it_current = goList->begin();
	vector<GameObject *>::iterator it_last = goList->end();
	GameObject *go;
	while(it_current!=it_last){
		go = *it_current++;
		GameCommand *cmd = new GameCommand();
		*cmd = createMoveCommand(p);
		postCommand(cmd, go->getID());
	}
	retrace();
};
void CmdInterp_move::rightClickOnMiniMap(POINT p, UINT keyFlags){};
void CmdInterp_move::cmdButtonClick(game_command_type cmd)
{
	switch(cmd){
	case cmd_cancel:
		retrace();
		break;
	};
};
void CmdInterp_move::resetState()
{
	state = 0;
};
void CmdInterp_move::getPossibleCommand(list<game_command_type> *cmdList)
{
	cmdList->push_back(cmd_cancel);
};
//-------------------------------static method----------------
void ActionInterpreter::initInterpretation()
{
	menuPage1 = new MenuPage1;
	menuPage2 = new MenuPage2;
	menuPage3 = new MenuPage3;
	cmdInterp_attack = new CmdInterp_attack;
	cmdInterp_move = new CmdInterp_move;
	resetInterpretation();
};

void ActionInterpreter::resetInterpretation()
{
	currentInterpreter = menuPage1;
	interpreterChanged();
};

ActionInterpreter *ActionInterpreter::getCurrentInterpreter()
{
	return currentInterpreter;
};
void ActionInterpreter::forwardTo(ActionInterpreter *AInterp)
{
	AInterp->previous = currentInterpreter;
	currentInterpreter = AInterp;
	interpreterChanged();
};
void ActionInterpreter::retrace()
{
	if(currentInterpreter->previous!=NULL){
		currentInterpreter = currentInterpreter->previous;
		interpreterChanged();
	}
};
void ActionInterpreter::interpreterChanged()
{
	currentInterpreter->resetState();
	CmdButtonBar::Instance()->Update();
};