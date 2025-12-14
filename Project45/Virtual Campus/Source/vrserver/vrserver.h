
//-----------------------------------------------------------------------------
// Defines, and constants
//-----------------------------------------------------------------------------
#define WM_APP_UPDATE_STATS    (WM_APP + 0)
#define WM_APP_DISPLAY_WAVE    (WM_APP + 1)

// This GUID allows DirectPlay to find other instances of the same game on
// the network.  So it must be unique for every game, and the same for 
// every instance of that game.  // {EDE9493E-6AC8-4f15-8D01-8B163200B966}
GUID g_guidApp = { 0xede9493e, 0x6ac8, 0x4f15, { 0x8d, 0x1, 0x8b, 0x16, 0x32, 0x0, 0xb9, 0x66 } };




//-----------------------------------------------------------------------------
// App specific DirectPlay messages and structures 
//-----------------------------------------------------------------------------
#define GAME_MSGID_WAVE             1
#define GAME_MSGID_CREATE_PLAYER    2
#define GAME_MSGID_DESTROY_PLAYER   3
#define GAME_MSGID_SET_ID           4

// Change compiler pack alignment to be BYTE aligned, and pop the current value
#pragma pack( push, 1 )

struct GAMEMSG_GENERIC
{
    DWORD dwType;
};

struct GAMEMSG_WAVE : public GAMEMSG_GENERIC
{
    DWORD dpnidPlayer;                 // dpnid of the player created
};



struct CMap
{
	UINT	nMapCode;
	char	szMapName[12];
};


struct CWrap
{
	UINT	nSrcMapCode;
	int		nSrcX;
	int		nSrcY;
	UINT	nDestMapCode;
	int		nDestX;
	int		nDestY;
};


struct CNpc
{
	int		nID;
	UINT	nMapCode;
	int		x;
	int		y;
	int		nBmpID;
	int		nFuncID;
	char	szGreeting00[256];
	char	szGreeting01[256];
	char	szGreeting02[256];
};



// Pop the old pack alignment
#pragma pack( pop )



