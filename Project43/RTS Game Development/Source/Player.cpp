#include "Player.h"
#include "GameObject.h"
#include "GameWorld.h"
#include <math.h>
#include <list>
using namespace std;

PlayerList *Player::_players=new PlayerList();

Player::Player(int pid)
{
	this->pid = pid;
	for(int i=0; i<MAXPLAYER; i++){
		_policy[i]=POLICY_ENEMY;
	}
	_policy[pid]=POLICY_ALLY;
};
void Player::initPlayerList()
{
	for(int i=0; i<MAXPLAYER; i++)
		_players->push_back(NULL);
};
void Player::newPlayer(int pid)
{
	PlayerList::iterator current=_players->begin();
	for(int i=0; i<pid; i++)
		current++;
	Player *p = new Player(pid);
	_players->insert(current, p);
	_players->erase(current);
};
Player *Player::number(int pid)
{
	PlayerList::iterator current=_players->begin();
	for(int i=0; i<pid; i++)
		current++;
	return *current;
};
policy Player::getPolicy(int pid)
{
	if(pid>=0&&pid<MAXPLAYER)
		return _policy[pid];
	else
		return POLICY_UNRELATE;
};
void Player::setPolicy(int pid, policy p)
{
	if(this->pid==pid)
		return;
	if(pid>=0&&pid<MAXPLAYER)
		_policy[pid]=p;
};
policy getPolicy(int pid1, int pid2)
{
	return Player::number(pid1)->getPolicy(pid2);
};
void setPolicy(int pid1, int pid2, policy p)
{
	Player::number(pid1)->setPolicy(pid2, p);
};