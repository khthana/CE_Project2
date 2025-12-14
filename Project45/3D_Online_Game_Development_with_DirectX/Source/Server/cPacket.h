#ifndef _CPACKET_H_
#define _CPACKET_H_

#define MSG_LOGIN					101
#define MSG_PLAYER					102
#define MSG_USERINVALID				103
#define MSG_PASSWORDINVALID			104
#define MSG_INITCOMPLETE			105
#define MSG_CREATEMONSTERCOMPLETE	106
#define MSG_REQUESTMOVE				107
#define MSG_UPDATEPLAYER			108
#define MSG_CREATESPAWNPLAYER		109
#define MSG_UPDATESPAWNPLAYER		110
#define MSG_REMOVESPAWNPLAYER		111
#define MSG_PLAYERDIED				112
#define MSG_CREATEMONSTER			113
#define MSG_UPDATEMONSTER			114
#define MSG_REMOVEMONSTER			115
#define MSG_REBORNMONSTER			116
#define MSG_CHAT					117
#define MSG_CHATBROADCAST			118
#define MSG_REQUESTNAME				119
#define MSG_NAME					120
#define MSG_ATTACK					121
#define MSG_UPDATEPLAYERATTACK		122
#define MSG_UPDATEPVP				123
#define MSG_UPDATEMONSTERATTACK		124
#define MSG_RETURNTOLASTSAVEPOINT	125

class cPacket
{	public :
		long	dwType;
		long	dwSize;
};

class PacketLogin : public cPacket
{	public : 
		char name[16];
		char pass[16];
};

class PacketPlayer : public cPacket
{	public :
		char name[16];
		DPNID ID;
		int HP;
		int HPMAX;
		int MP;
		int MPMAX;
		int EXP;
		long Money;
		int Level;
		int STR;
		int AGI;
		int VIT;
		int INT;
		int DEX;
		int LUK;
		int X;
		int Z;
		int head;
		int body;
		char mapname[16];
};

class PacketUserInvalid : public cPacket
{	

};

class PacketPasswordInvalid : public cPacket
{
	
};

class PacketInitComplete : public cPacket
{

};

class PacketCreateMonsterComplete : public cPacket
{

};
class PacketRequestMove : public cPacket
{	public :
		int x;
		int z;

};

class PacketUpdatePlayer : public cPacket
{	public :
		int HP;
		int MP;
		int EXP;
		long Money;
		int x;
		int z;
		STATE State;

};

class PacketCreateSpawnPlayer : public cPacket
{	public :
		DPNID id;
		int x;
		int z;
		int State;
		int head,body;
};

class PacketUpdateSpawnPlayer : public cPacket
{	public :
		DPNID id;
		int x;
		int z;
		int State;
		int head,body;
};

class PacketPlayerDied : public cPacket
{	public :
		DPNID id;
};

class PacketRemoveSpawnPlayer : public cPacket
{	public :
		DPNID id;
};

class PacketCreateMonster : public cPacket
{	public :
		int number;
		struct Monster
		{		
			int id;
			int x;
			int z;
			int State;
			int type;
		} monster[30];
};

class PacketUpdateMonster : public cPacket
{	public :
		int id;
		int x;
		int z;
		int State;

};

class PacketRemoveMonster : public cPacket
{	public :
		int id;
};

class PacketRebornMonster : public cPacket
{	public :
		int id;
		int x;
		int z;
		int State;
};

class PacketChat : public cPacket
{	public :
		char chat[128];
};

class PacketChatBroadCast : public cPacket
{	public :
		DPNID id;
		char name[16];
		char chat[128];
};

class PacketRequestName : public cPacket
{	public :
		DPNID id;	
};

class PacketName : public cPacket
{	public :
		DPNID id;
		char name[16];
};

class PacketAttack : public cPacket
{	public :
		int monid;
		DPNID pid;
		AttackType mode;
		bool IsMonster;
};

class PacketUpdatePlayerAttack : public cPacket
{	public :
		DPNID idAttacker;
		int idDefender;
		int damage;

};

class PacketUpdatePVP : public cPacket
{	public :
		DPNID idAttacker;
		DPNID idDefender;
		int damage;
};

class PacketUpdateMonsterAttack : public cPacket
{	public :
		int idAttacker;
		DPNID idDefender;
		int damage;
};

class PacketReturnToLastSavePoint : public cPacket
{

};

#endif