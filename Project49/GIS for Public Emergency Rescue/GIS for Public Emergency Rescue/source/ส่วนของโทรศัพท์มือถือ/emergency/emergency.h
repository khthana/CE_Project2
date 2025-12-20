/*===========================================================================

FILE: header emergency.h
===========================================================================*/

/*===============================================================================
INCLUDES AND VARIABLE DEFINITIONS
=============================================================================== */
#include "AEEModGen.h"          // Module interface definitions
#include "AEEAppGen.h"          // Applet interface definitions
#include "AEEShell.h"           // Shell interface definitions
#include "AEEMenu.h"			// Menu interaface definitions
#include "AEENet.h"				// Socket interface definitions
#include "AEEStdLib.h"
#include "AEEPosDet.h"
#include "AEEWeb.h"
#include "AEEFile.h"




#include "emergency.bid"		// File ID
#include "emergency_res.h"		// File resource

/*===========================================================================*/


/*===========================================================================*/
/*-------------------------------------------------------------------
Data definitions
-------------------------------------------------------------------*/
#define MAIN_URL			"http://www.natur.in.th/xml/serv.py/requestsfrommobile?"
#define AMBULANCE			"00000001"
#define POLICE				"00000002"
#define FIRER				"00000003"

#define CX_PROG_DISPLAY		85
#define CY_PROG_DISPLAY		85
#define	LOGO_HIGH			15
#define	LOGO_LONG			120

#define IMAGE_LOGO			0
#define IMAGE_AMBULANCE		1
#define IMAGE_POLICE		2
#define IMAGE_FIRER			3
#define MENU_AMBULANCE		4
#define MENU_POLICE			5
#define MENU_FIRER			6
#define MENU_QUICKCALL		7
#define MENU_CANCELCALL		8
#define PHONE_ANI			9
#define NET_ANI				10
#define ARROW_ANI			11
#define POS_ANI				12
#define MAX_IMAGE			13

#define MAIN_MENU			0
#define AMBU_MENU			1
#define POLI_MENU			2
#define FIRE_MENU			3
#define CANCEL_MENU			4
#define SUCCESS_MENU		5
#define ERROR_MENU			6
#define MAX_MENU			7


/*===========================================================================*/
typedef enum _eAppState 
{ 
	MYAPP_START, 
	MYAPP_END 
} eAppState;

typedef enum _callQuickType 
{
	AMBULANCE_CALL_QUICK,
	POLICE_CALL_QUICK,
	FIRER_CALL_QUICK
} callQuickType;
/*===========================================================================*/
/*-------------------------------------------------------------------
Structure definitions
-------------------------------------------------------------------*/
typedef struct _myProject 
{
	AEEApplet		App;
	AEEDeviceInfo	DeviceInfo;
	AEERect			LogoFrame;
	AEERect			MainFrame;
	AEERect			ProgFrame;
	AEERect			rScreenRect;

	AECHAR			szBuff[100];
	AECHAR			strBuffer[5000];
	char			url[200];
	AECHAR			id[10];

	IShell			*pIShell;
	IDisplay		*pIDisplay;
	IMenuCtl		*pIMenu[MAX_MENU];
	IImage			*pIImage[MAX_IMAGE];
	IFile			*pIFile;
	IFileMgr		*pIFileMgr;
	boolean			chk;

	// GET GPS
	IPosDet			*pIPosDet;
	AEECallback		CallbackGPS;
	AEEGPSInfo		GPSInfo;
	callQuickType	callType;

	// WEB
    IWeb            *pIWeb;            // IWeb interface
    IWebResp        *pIWebResponse;    // Iweb response
	WebRespInfo     *pWebResponseInfo;
	AEECallback		CallbackWEB;
    IStatic         *pIStatic;
	eAppState       AppState;
	char            stWebsiteAndPath[100];           // hold website path
    char            stFullUrl[200];                  // hold full url with website and path
    AEECallback     OpenWebConnectionCallbackStruct; // callback struct

	uint16			m_cxScreen;
	uint16			m_cyScreen;

} myProject;
/*===========================================================================*/

/*===========================================================================*/
/*-------------------------------------------------------------------
Function Prototypes
-------------------------------------------------------------------*/
static	boolean	emergency_HandleEvent(IApplet * pi, AEEEvent eCode, 
									 uint16 wParam, uint32 dwParam);
static	void	emergency_FreeAppData(myProject * pFree);
static	boolean	emergency_InitAppData(myProject * pInit);
		void	emergency_CleanUp(myProject* pMe);
static	void	showMainMenu(myProject* pMe);
static	void	showAmbulanceMenu(myProject* pMe);
static	void	showPoliceMenu(myProject* pMe);
static	void	showFirerMenu(myProject* pMe);
static	void	drawStartAmbulanceLogo(myProject * pMe);
static	void	drawStartPoliceLogo(myProject * pMe);
static	void	drawStartFirerLogo(myProject * pMe);
static	void	cancelCall(myProject * pMe);
// last
static	void	callQuickChkType(myProject * pMe);
static	int		GetGPSInfo(myProject * pMe);
static	void	emergency_GPSCB(void * pMe);
static	void	GPSCleanUp(myProject * pMe);
static	void	ConnectToWeb(myProject * pMe);
// WEB
static	void	OpenConnectionCB(myProject *pMe);
static	int		OpenConnectionToWebsite(myProject *pMe, char *stWebsiteAndPath);
static	boolean DisplayMessage(myProject *pMe);
static	void	WebCleanup(myProject *pMe);
static	void	applenPath(myProject *pMe);
static	void	TRIMNUMERIC(char* inputstr,uint16 size);

static	void	StartProgressDisplay(myProject *pApp);
static	void	SuccessCall(myProject* pMe);
static	void	ErrorCall(myProject* pMe);






















