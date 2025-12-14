#ifndef _GameObject_header_
#define _GameObject_header_

#include "eventproc.h"
#include "math.h"
#include "GodOfRenderring.h"
#include "GameConfig.h"
#include <list>
using namespace std;

#define NATURAL_GO_GROUP_ID MAXPLAYER //MAXPLAYER+1-1

#define GTYPE_ZERG	 0
#define GTYPE_TREE   1
#define GTYPE_HOUSE1 2

#define ACT_STAND	0
#define ACT_MOVE	1
#define ACT_ATTACK	2
#define ACT_DECAY   3

class GameObjectMap;

class GameObject;
class GameObjectFunction;
class GameObjectState;
typedef GameObject * GameObjectPtr;
class GameObjectAnimator;

class GameObject{
public:
	GameObject(long gid, int groupid, int szx, int szy);
	long getID();
	int getGroupID();
	void setGroupID(int id);
	virtual void setmaxlife(int lifepoint);
	virtual int getmaxlife();
	virtual void setlife(int lifepoint);
	virtual int getlife();
	virtual void lifeup(int lifepoint);
	virtual void lifedown(int lifepoint);
	virtual void setmaxenergy(int energypoint);
	virtual int getmaxenergy();
	virtual void setenergy(int energypoint);
	virtual int getenergy();
	virtual void energyup(int energypoint);
	virtual void energydown(int energypoint);
	virtual void gethurted(int hitpoint);
	virtual void gethealed(int healpoint);

	virtual int getPossibleCommand(list<game_command_type> *cmdlist){return 0;};

	virtual void setLocation(POINT *p, GameObjectMap *gom);
	virtual void getLocation(POINT *p, GameObjectMap * &gom);
	virtual void leaveLocation();

	virtual bool isPlaceable(int x, int y, GameObjectMap *gom);

	int getWidth()
	{
		return size_x;
	};
	int getHeight()
	{
		return size_y;
	};

	virtual bool isInAttackRange(GameObject *target);

	virtual GORenderringID getRenderringID(int x, int y);//x,y is position that you found this GObj
	void setAction(long action);
	void setDirection(long dir);
	long getAction();
	long getDirection();
	long getTypeId();
	int getSightRange();
	int getAttackRange();

	bool getSelected();
	void setSelected(bool bVal);

	virtual void recieveCommand(GameCommand *cmd);
	virtual void recieveEvent(GameEvent *e);
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance(){};

protected:
	int maxlife;
	int life;
	int	maxenergy;
	int energy;
	int defense_strength;
	int pain;
	POINT position;
	long gtype;
	long gid;
	int ggroupid;
	long dir;
	long action;
	int sightrange;
	int attackrange;

	int size_x;
	int size_y;

	boolean b_isSelected;

	GameObjectState *_state;
	GameCommand *cmd;
	GameObjectAnimator *_goanim;

	GameObjectMap *_current_location;
};

class GameObjectFunction{
public:
	GameObjectFunction(GameObject *GObj);
	void setEnabled(bool b_value);
	bool isEnabled();
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void work(){};
protected:
	bool b_isEnabled;
	GameObject *GObj;
};

class GameObjectState{
public:
	GameObjectState(GameObject *GObj);
	virtual void recieveCommand(GameCommand *cmd){};
	virtual void recieveEvent(GameEvent *e){};
	virtual void recieveAcknowledgement(GameEvent *e, ACK ack){};
	virtual void takeAChance(){};
protected:
	GameObject *GObj;
};

#endif _GameObject_header_