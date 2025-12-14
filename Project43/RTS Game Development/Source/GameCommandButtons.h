#ifndef GameCommandButtons_header
#define GameCommandButtons_header

#include "GameCommandButton.h"
#include <map>
using namespace std;

typedef map<game_command_type, GameCommandButton *, less<game_command_type> > GCmdBtTable;

class GameCommandButtons{
public:
	static GameCommandButtons *Instance();
	void Init();
	GameCommandButton *getGCmdButton(game_command_type cmd);
protected:
	GameCommandButtons();
	static GameCommandButtons *_instance;
	GCmdBtTable _table;
};

#endif GameCommandButtons_header