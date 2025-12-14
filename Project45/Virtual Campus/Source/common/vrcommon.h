

////////////////////////////////////////////////////////////////////////////////
// Define : Actor
////////////////////////////////////////////////////////////////////////////////
#define AC_STAND			1
#define AC_SIT				2
#define AC_WALK				3


#define MAX_PLAYER_NAME		12
#define MAX_CHAR			12


#define SAFE_DELETE(p)       { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_DELETE_ARRAY(p) { if(p) { delete[] (p);   (p)=NULL; } }
#define SAFE_RELEASE(p)      { if(p) { (p)->Release(); (p)=NULL; } }
#define SAFE_UNACQUIRE(p)    { if(p) { (p)->Unacquire();         } }

#define GETAPPPART			 { char lpFilename[255];memset(lpFilename,0,255);GetModuleFileName( AfxGetInstanceHandle(),lpFilename,MAX_PATH);return lpFilename;}



////////////////////////////////////////////////////////////////////////////////
// Prototype : Common Functions
////////////////////////////////////////////////////////////////////////////////

// centers a window on the screen
extern void cfnCenterWindow(HWND hwnd); 

// gets the last error and converts it to a string.
extern void cfnConvertLastErrorToString(LPSTR szDest, int nMaxStrLen);



////////////////////////////////////////////////////////////////////////////////
// Class : CVRMultilineText
////////////////////////////////////////////////////////////////////////////////
class CVRMultilineText
{
public :
	CVRMultilineText(int nNumLine, int nNumCharPerLine);
	virtual ~CVRMultilineText();

	void	AddString(char*);
	char*	Retrieve();

	char	**m_aszMessageLog;
	char	*m_szMessageLog;
	int		m_nCountLine;
	int		m_nIndexStart;
	int		m_nIndexStop;
	int		m_nMaxLine;
	int		m_nMaxCharPerLine;
};


////////////////////////////////////////////////////////////////////////////////
// Class : CVRLayerWnd
////////////////////////////////////////////////////////////////////////////////
#ifndef _LAYEREDWINDOWHELPERST_H_
#define _LAYEREDWINDOWHELPERST_H_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef WS_EX_LAYERED
#define WS_EX_LAYERED           0x00080000
#define LWA_COLORKEY            0x00000001
#define LWA_ALPHA               0x00000002
#endif



class CVRLayerWnd  
{
public:
	CVRLayerWnd();
	virtual ~CVRLayerWnd();

	LONG AddLayeredStyle(HWND hWnd);
	BOOL SetLayeredWindowAttributes(HWND hWnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
	BOOL SetTransparentPercentage(HWND hWnd, BYTE byPercentage);

private:
	typedef BOOL (WINAPI* lpfnSetLayeredWindowAttributes)(HWND hWnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
	HMODULE		m_hDll;
};

#endif




struct MAIL_INFO
{
	char szFromName[12];
	char szFromMail[30];
	char szToMail[30];
	char szSubject[30];
	char szBody[512];
};


struct DB_PLAYER_INFO
{
	char szUsername[12];
	char szPassword[12];
	char szEmail[30];
	char szFirstname[50];
	char szLastname[50];
	char szAddress[120];
	char szTelephone[10];
	char szBirthdate[10];
	UINT nMapcode;
	int  nPosX;
	int  nPosY;
};