#include "CmdButtonBar.h"
#include "GameCommandButtons.h"
#include "GameObject.h"
#include "GameWorld.h"
#include <list>
using namespace std;

CmdButtonBar *CmdButtonBar::_instance = NULL;
CmdButtonBar *CmdButtonBar::Instance(){
	if(_instance==NULL){
		_instance = new CmdButtonBar(189, 240);
	}
	return _instance;
};

CmdButtonBar::CmdButtonBar(int x, int y)
:Fansy_Window("cmdButtonBar.bmp", x, y)
{
	Update();
};

void CmdButtonBar::Update()
{
	while(isRefreshing()){}
	subComponents.clear();
	m_CmdList.clear();
	ActionInterpreter::getCurrentInterpreter()->getPossibleCommand(&m_CmdList);
	list<game_command_type>::iterator it_current = m_CmdList.begin();
	list<game_command_type>::iterator it_last = m_CmdList.end();
//	printf("there are %d possible command\n", m_CmdList.size());
	while(it_current!=it_last){
		printf("possible command\n");
		game_command_type cmd = *it_current++;
		GameCommandButton *cmdBt = GameCommandButtons::Instance()->getGCmdButton(cmd);
		if(cmdBt!=NULL){
			this->add(cmdBt);
		}
	}
};