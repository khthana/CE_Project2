#ifndef Player_header
#define Player_header

#include <windows.h>
#include "GameWorld.h"
#include <list>
using namespace std;

class GameObject;
class Player;

typedef list<Player *> PlayerList;
enum policy{POLICY_ENEMY=1, POLICY_ALLY=2, POLICY_UNRELATE=4};

class Player{
public:
	static void initPlayerList();
	static void newPlayer(int pid);
	static Player *number(int pid);
	policy getPolicy(int pid);
	void setPolicy(int pid, policy p);
protected:
	Player(int pid);
	int pid;
	policy _policy[MAXPLAYER];
	static PlayerList *_players;
};

policy getPolicy(int pid1, int pid2);
void setPolicy(int pid1, int pid2, policy p);

#endif Player_header