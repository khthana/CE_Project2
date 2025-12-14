#ifndef CmdButtonBar_header
#define CmdButtonBar_header

#include "Fansy_Window.h"
#include <list>
using namespace std;

class CmdButtonBar:public Fansy_Window{
public:
	static CmdButtonBar *Instance();
	void Update();
protected:
	CmdButtonBar(int x, int y);
	static CmdButtonBar *_instance;
	list<game_command_type> m_CmdList;
};

#endif CmdButtonBar_header