// Football.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "Football.h"

#pragma comment(lib,"ddraw.lib")
#pragma comment(lib,"dxguid.lib")
#pragma comment(lib,"dsound.lib")
#pragma comment(lib,"dinput8.lib")
#pragma comment(lib,"dxerr8.lib")
#pragma comment(lib,"winmm.lib")

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// The one and only application object

int APIENTRY WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPSTR lpCmdLine,int nCmdShow)
{
	CLOGCLEAR();
	CFootballApp App;
	if(FAILED(App.Create(hInstance)))
	    return FALSE;
	return App.Run();
}