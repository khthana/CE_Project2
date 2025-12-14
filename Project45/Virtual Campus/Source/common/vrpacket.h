//-----------------------------------------------------------------------------
// App specific messages and structures 
//-----------------------------------------------------------------------------
#define MAX_CHAR				12

#define PK_ID_RESPONSE_LOGIN	1
#define PK_ID_LOGOUT			2
#define PK_ID_SET_ID			3
#define PK_ID_CREATE_PLAYER		4
#define PK_ID_DESTROY_PLAYER	5
#define PK_ID_PLAYER_WALK		6
#define PK_ID_PLAYER_CHAT		7

#define PK_ID_REQUEST_MAP		11
#define PK_ID_RESPONSE_MAP		12
#define PK_ID_RESPONSE_WRAP		14
#define PK_ID_RESPONSE_NPC		16
#define	PK_ID_REQUEST_NPCTALK	17
#define	PK_ID_RESPONSE_NPCTALK	18


#define	PK_ID_MAIL_STEP1		19
#define	PK_ID_MAIL_STEP2		20

#define PK_ID_REQUEST_PLAYERINFO	21
#define PK_ID_RESPONSE_PLAYERINFO	22




// Change compiler pack alignment to be BYTE aligned, and pop the current value
#pragma pack( push, 1 )


struct PK_GENERIC
{
    WORD wID;
};

struct PK_RESPONSE_LOGIN : public PK_GENERIC
{
    int		nReturn;
};

struct PK_SET_ID : public PK_GENERIC
{
    DWORD	dpnidPlayer;
	UINT	nMapcode;
	CHAR	szMapname[MAX_CHAR];
	INT		xPos;
	INT		yPos;
	INT		nSuit;
};


struct PK_CREATE_PLAYER : public PK_GENERIC
{
    DWORD	dpnidPlayer;
	CHAR	szUsername[MAX_CHAR];
	UINT	nMapcode;
	INT		xPos;
	INT		yPos;
	INT		nSuit;
};

struct PK_DESTROY_PLAYER : public PK_GENERIC
{
    DWORD	dpnidPlayer;
};


struct PK_PLAYER_WALK : public PK_GENERIC
{
	DWORD	dpnidPlayer;
	INT		nFrameAngle;
	INT	xPos;
	INT	yPos;
	INT	xDes;
	INT	yDes;
};

struct PK_PLAYER_CHAT : public PK_GENERIC
{
	DWORD	dpnidPlayer;
	CHAR	szChatMessage[MAX_PATH];
	CHAR	szReceiveName[MAX_CHAR];
	UINT	nMapcode;
};




struct PK_REQUEST_MAP : public PK_GENERIC
{
    UINT nMapcode;
	int nPosX;
	int nPosY;
};

struct PK_RESPONSE_MAP : public PK_GENERIC
{
    CHAR	szMapname[MAX_CHAR];
	int nPosX;
	int nPosY;
};


struct PK_RESPONSE_WRAP : public PK_GENERIC
{
    UINT nSrcMapCode;
	int	 nSrcX;
	int	 nSrcY;
	UINT nDestMapCode;
	int	 nDestX;
	int	 nDestY;
};

struct PK_RESPONSE_NPC : public PK_GENERIC
{
	int		nNpcID;
	UINT	nMapCode;
	int		x;
	int		y;
	int		nBmpID;
	int		nFuncID;
	char	szGreeting00[256];
	char	szGreeting01[256];
	char	szGreeting02[256];
};


struct PK_REQUEST_NPCTALK : public PK_GENERIC
{
	int		nNpcID;
	int		nTalkID;
	int		nCaseID;
	int		nStateID;
};

struct PK_RESPONSE_NPCTALK : public PK_GENERIC
{
	int		nNpcID;
	int		nNextStateID;
	char	szGreeting[256];
	char	szCase[256];
};


struct PK_MAIL_STEP1 : public PK_GENERIC
{
	char	szToMail[30];
};

struct PK_MAIL_STEP2 : public PK_GENERIC
{
	char	szToMail[30];
	char	szSubject[30];
	char	szBody[512];
};


struct PK_REQUEST_PLAYERINFO : public PK_GENERIC
{
	char	szUsername[12];
};

struct PK_RESPONSE_PLAYERINFO : public PK_GENERIC
{
	DB_PLAYER_INFO	dbPlayerInfo;
};


// Pop the old pack alignment
#pragma pack( pop )



/*
//-----------------------------------------------------------------------------
// App specific messages and structures 
//-----------------------------------------------------------------------------
#define PK_CM_LOGIN			1
#define PK_CM_LOGOUT		2
#define PK_CM_REQUEST_MAP	3
#define PK_CM_RESPONSE_MAP	4
#define PK_CM_CREATE_PLAYER	5
#define PK_CM_DELETE_PLAYER	6
#define PK_CM_PLAYER_WALK	7


// Change compiler pack alignment to be BYTE aligned, and pop the current value
#pragma pack( push, 1 )


struct PK_GENERIC
{
    WORD command;
};


struct PK_LOGIN : public PK_GENERIC
{
    TCHAR username[12];
	TCHAR password[12];
};


struct PK_LOGOUT : public PK_GENERIC
{
    TCHAR username[12];
	TCHAR password[12];
};


struct PK_REQUEST_MAP : public PK_GENERIC
{
    BYTE mapcode;
};

struct PK_RESPONSE_MAP : public PK_GENERIC
{
    TCHAR mapname[12];
};



struct PK_CREATE_PLAYER : public PK_GENERIC
{	UINT	nID;
	DWORD	dwAction;
	INT		nPosX;
	INT		nPosY;
	INT		nVelX;
	INT		nVelY;
};


struct PK_DELETE_PLAYER : public PK_GENERIC
{	UINT	nID;
};


struct PK_PLAYER_WALK : public PK_GENERIC
{	UINT	nID;
	DWORD	dwAction;
	INT		nPosX;
	INT		nPosY;
	INT		nVelX;
	INT		nVelY;
};

// Pop the old pack alignment
#pragma pack( pop )

*/


