// MouseHook.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#define _COMPILING_44E531B1_14D3_11d5_A025_006067718D04
#define _COMPILING_44E531B1_14D3_11d5_A025_006067718D05
#include "MouseHook.h"

#pragma data_seg(".POND")
HWND hWndServer = NULL;
#pragma data_seg()
#pragma comment(linker, "/section:.POND,rws")

HINSTANCE hInst;
UINT UWM_MOUSEMOVE;
UINT UWM_LDBLCLK;
HHOOK hook;
static LRESULT CALLBACK msghook(UINT nCode, WPARAM wParam, LPARAM lParam);

BOOL APIENTRY DllMain( HINSTANCE hInstance, 
                       DWORD  Reason, 
                       LPVOID Reserved
					 )
{
 switch(Reason)
    { /* reason */
	/*Indicates that the DLL is being loaded into the virtual address space of the current 
	process as a result of the process starting up or as a result of a call to LoadLibrary. 
	DLLs can use this opportunity to initialize any instance data or to use the TlsAlloc 
	function to allocate a thread local storage (TLS) index.*/
     case DLL_PROCESS_ATTACH:
		hInst = hInstance;
		UWM_LDBLCLK = RegisterWindowMessage(UWM_LDBLCLK_MSG);
		return TRUE;
	/*Indicates that the DLL is being unloaded from the virtual address space of the calling 
	process as a result of either a process exit or a call to FreeLibrary. The DLL can use this 
	opportunity to call the TlsFree function to free any TLS indices allocated by using TlsAlloc
	and to free any thread local data.*/
     case DLL_PROCESS_DETACH:
		if(hWndServer != NULL)
			clearMyHook1(hWndServer);
		return TRUE;
    } /* reason */
    return TRUE;
}


/****************************************************************************
*                                 setMyHook
* Inputs:
*       HWND hWnd: Window to notify
* Result: BOOL
*       TRUE if successful
*		FALSE if error
* Effect: 
*       Sets the hook
****************************************************************************/

__declspec(dllexport) BOOL setMyHook1(HWND hWnd)
    {
     if(hWndServer != NULL)
	return FALSE; // already hooked!
     hook = SetWindowsHookEx(WH_GETMESSAGE,
			    (HOOKPROC)msghook,
			    hInst,
			    0);
     if(hook != NULL)
	{ /* success */
	 hWndServer = hWnd;
	 return TRUE;
	} /* success */
     return FALSE; // failed to set hook
    } // setMyHook

/****************************************************************************
*                                 clearMyHook
* Inputs:
*       HWND hWnd: Window hook
* Result: BOOL
*       TRUE if successful
*	FALSE if error
* Effect: 
*       Removes the hook that has been set
****************************************************************************/

__declspec(dllexport) BOOL clearMyHook1(HWND hWnd)
    {
     if(hWnd != hWndServer || hWnd == NULL)
	return FALSE;
     BOOL unhooked = UnhookWindowsHookEx(hook);
     if(unhooked)
	hWndServer = NULL;
     return unhooked;
    } // clearMyHook

/****************************************************************************
*                                   msghook
* Inputs:
*       int nCode: Code value
*	WPARAM wParam:
*	LPARAM lParam:
* Result: LRESULT
*       Either 0 or the result of CallNextHookEx
* Effect: 
*       Hook processing function. If the message is a mouse-move message,
*	posts the coordinates to the parent window
****************************************************************************/

static LRESULT CALLBACK msghook(UINT nCode, WPARAM wParam, LPARAM lParam)
    {
		if(nCode < 0)
		{ /* pass it on */
			CallNextHookEx(hook, nCode, wParam, lParam);
			 return 0;
		} /* pass it on */
		LPMSG msg = (LPMSG)lParam;
		if(msg->message == WM_LBUTTONDBLCLK ||msg->message == WM_NCLBUTTONDBLCLK)
			PostMessage(hWndServer, UWM_LDBLCLK, 0, 0);
		
		return CallNextHookEx(hook, nCode, wParam, lParam);
    } // msghook
