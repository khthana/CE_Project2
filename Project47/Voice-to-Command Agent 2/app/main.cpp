#pragma comment( lib, "comctl32.lib" )
#include <windows.h>
#include <commctrl.h>
#include <iostream>
#include <string.h>
#include <shlobj.h>
#include <sphelper.h>
#include "resource.h"
#include "grammar.h"

class MyTaskList
{
	HWND	hTaskDlg;
	int		nListBoxId;
public:
	MyTaskList(HWND hParent,int nID){
		hTaskDlg = hParent;
		nListBoxId = nID;
	}
	~MyTaskList(void){}
	void Add(HWND hWnd){}
	void Delete(HWND hWnd){}
};

#define GRAMMARID1		161			// Arbitrary grammar id
#define WM_RECOEVENT	WM_USER+190	// Arbitrary user defined message for reco callback
#define WM_SYSTRAY_NOTIFY WM_USER+100
#define VK_ENTER		13
#define VK_ALT			18

CComPtr<ISpRecoGrammar>	g_cpCmdGrammar;	// Pointer to our grammar object
CComPtr<ISpRecoContext>	g_cpRecoCtxt;	// Pointer to our recognition context
CComPtr<ISpRecognizer>	g_cpEngine;	// Pointer to our recognition engine instance

// SR engine properties's variables
CComPtr<ISpProperties>	g_cpProp;
LONG	lPropValue;
HRESULT g_hr;


HINSTANCE g_hInst;
HBITMAP hBmp;					// Splash
HWND hStrmDlg	= (HWND)NULL;
HWND hMainDlg	= (HWND)NULL;
HWND hTaskDlg	= (HWND)NULL;
HWND hMenuDlg	= (HWND)NULL;
HWND hButtonDlg	= (HWND)NULL;
HWND hCUseDlg	= (HWND)NULL;	// Current Use Dialog
HWND hCurrent	= (HWND)NULL;	// tree dlg
HWND hTarget2	= (HWND)NULL;	// text dlg
HWND hTarget3	= (HWND)NULL;	// task dlg

// Tray Icon
static HICON g_hIconTray[2];
static HMENU g_hPopupMenu = NULL;
NOTIFYICONDATA g_nid;

// Menu Tree Dialog's Variables
HWND hTreeCtrl = (HWND)NULL; // Make internal Resource Dialog
HTREEITEM hTreeNode[1024];
HANDLE nTreeNodeMN[1024];
int nNodeCount = 0;
HTREEITEM hTreeCurrent;
TV_INSERTSTRUCT tvs;
TV_ITEM tvi;

// Task List Dialog's Variables
HWND hTaskList[1024];
int nTaskCount = 0;

// Button List Dialog's Variables
HWND hButtonList[1024];
int nButtonCount = 0;
int bConfirm[12];

// SAPI's Functions
HRESULT InitSAPI( HWND hWnd );
void CleanupSAPI( void );
void ProcessRecoEvent( HWND hWnd );
void ExecuteCommand(ISpPhrase *pPhrase, HWND hWnd);
void BlindAllGrammarRule(void);
void ResetAllGrammarRule(void);

// Application's Functions
void InitAllDlg(void);
void UpdateExistedTaskList(void);
void RegenMenuTree(HWND);
void TaskListAdd(HWND);
void TaskListDel(HWND);
void RegenCmndList(HWND);
void SetCenter(HWND);
void SetOnTopMost(HWND);
void SetStretch(HWND);
void SetCurrentUse(HWND);
void ClearListBox(HWND,int);
void BringAllWindowToBottom(void);
void ShowError(void);
void ShowTrayMenu(HWND);
BOOL IsOwnDialog(HWND);

BOOL CALLBACK MainProc(HWND, UINT, WPARAM, LPARAM);
BOOL CALLBACK MenuProc(HWND, UINT, WPARAM, LPARAM);
BOOL CALLBACK TaskProc(HWND, UINT, WPARAM, LPARAM);
BOOL CALLBACK ButtonProc(HWND, UINT, WPARAM, LPARAM);
VOID CALLBACK HelperTimerProc(HWND, UINT, UINT_PTR,DWORD);

int main()
{
	MSG msg;

	// Get own HINSTANCE
	g_hInst=::GetModuleHandle(::__argv[0]);

	// Use Common Controls
	::InitCommonControls();
	
    if ( SUCCEEDED( CoInitialize( NULL ) ) )
    {
		std::cout<<"COM successfully initialized\n";

		// Initialize the application
		InitAllDlg();

		// Message loop
		while (GetMessage(&msg, NULL, 0, 0))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
		CoUninitialize();
	}
	return 0;
}

void InitAllDlg(void)
{
	RECT rect;
	int w = 232, h = 226;	// window size of helper dialogs
	
	// Adjust Stream Window(for check responding of recognition)
	hStrmDlg = ::GetForegroundWindow();	
	::GetClientRect(::GetDesktopWindow(),&rect);
	::MoveWindow(hStrmDlg,0,0,450,rect.bottom - 16,TRUE);
	
	// *** none-display responding...
//	::ShowWindow(hStrmDlg,SW_HIDE);

	// Init RESOURCE
	hBmp = LoadBitmap(g_hInst,MAKEINTRESOURCE(BMP_SPLASH));
	g_hIconTray[0] = ::LoadIcon(g_hInst,MAKEINTRESOURCE(IDI_ICON1));
	g_hIconTray[1] = ::LoadIcon(g_hInst,MAKEINTRESOURCE(IDI_ICON2));
	g_hPopupMenu = ::LoadMenu(g_hInst, MAKEINTRESOURCE(IDR_TRAY_MENU));

	// Create Main Dialog(splash window)
	hMainDlg = ::CreateDialog(g_hInst, MAKEINTRESOURCE(DLG_MAIN), 0, MainProc);
	::SetCenter(hMainDlg);
	::ShowWindow(hMainDlg,SW_SHOW);
	::SetTimer(hMainDlg,1,1300,NULL); // Splash Dialog's Show-Time

	// start filling the icon data
	::ZeroMemory(&g_nid,sizeof(g_nid));
	g_nid.cbSize = sizeof(g_nid);	// size of struct
	g_nid.hWnd = hMainDlg;		// window to get messages
	g_nid.uCallbackMessage = WM_SYSTRAY_NOTIFY;	// message ID from icon
	g_nid.hIcon = g_hIconTray[0];	// icon to place in the tray
	g_nid.uID = 1;				// ID of icon(when more than 1 icon show in task)	
	sprintf(g_nid.szTip,"Voice to Command Agent 2.0");	// tip
	g_nid.uFlags = NIF_ICON|NIF_TIP|NIF_MESSAGE;	// valid fields
	Shell_NotifyIcon(NIM_ADD,&g_nid);

	// Create Task List Dialog
	hTaskDlg = ::CreateDialog(NULL, MAKEINTRESOURCE(DLG_TASK), 0, TaskProc);
	::MoveWindow(hTaskDlg,
		rect.right - w,0,
		w,h,TRUE);
	UpdateExistedTaskList();

	// Create Menu Tree Dialog
	hMenuDlg = ::CreateDialog(NULL, MAKEINTRESOURCE(DLG_MENU), 0, MenuProc);
	::MoveWindow(hMenuDlg,
		rect.right - w,h,
		w,h,TRUE);

	// Create Button List Dialog
	hButtonDlg = ::CreateDialog(NULL, MAKEINTRESOURCE(DLG_BUTTON), 0, ButtonProc);
	::MoveWindow(hButtonDlg,
		rect.right - w,h*2,
		w,h,TRUE);

	// Initial Agent status
	hCUseDlg=hTaskDlg;
	::ResetAllGrammarRule();
}

BOOL CALLBACK MainProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	// Swap Icon in System Tray	
	static int nSwapIcon = 1;

	// DC for Splash image
	HDC hDC;
	HDC hMemDC;

    switch (message)
    {
		case WM_INITDIALOG:
			
			// re-paint
			::SendMessage(hMainDlg,WM_PAINT,0,0);

			std::cout<<"Try to initialize SAPI... ";
            // Try to initialize sapi COM, quit with error message if we can't
            if ( FAILED( InitSAPI( hWnd ) ) )
            {
				std::cout<<"SAPI failed to initialize.\n";
				DestroyWindow (hWnd);
                return TRUE;
            }
			std::cout<<"Finished!\n";
			std::cout<<"+++++++Property+++++++\n";
			g_cpProp = g_cpEngine;

			g_hr=g_cpProp->GetPropertyNum(SPPROP_RESOURCE_USAGE,&lPropValue);
			std::cout<<"ResourceUsage : "<<lPropValue<<"\n";

			g_hr=g_cpProp->GetPropertyNum(SPPROP_HIGH_CONFIDENCE_THRESHOLD,&lPropValue);
			std::cout<<"HighConfidenceThreshold : "<<lPropValue<<"\n";

			g_hr=g_cpProp->GetPropertyNum(SPPROP_NORMAL_CONFIDENCE_THRESHOLD,&lPropValue);
			std::cout<<"NormalConfidenceThreshold : "<<lPropValue<<"\n";

			g_hr=g_cpProp->GetPropertyNum(SPPROP_LOW_CONFIDENCE_THRESHOLD,&lPropValue);
			std::cout<<"LowConfidenceThreshold : "<<lPropValue<<"\n";

			g_hr=g_cpProp->GetPropertyNum(SPPROP_RESPONSE_SPEED,&lPropValue);
			std::cout<<"ResponseSpeed : "<<lPropValue<<"\n";

			g_hr=g_cpProp->GetPropertyNum(SPPROP_COMPLEX_RESPONSE_SPEED,&lPropValue);
			std::cout<<"ComplexResponseSpeed : "<<lPropValue<<"\n";

			g_hr=g_cpProp->GetPropertyNum(SPPROP_ADAPTATION_ON,&lPropValue);
			std::cout<<"AdaptationOn : "<<lPropValue<<"\n";

			std::cout<<"++++++++++++++++++++++\n";
			break;

		case WM_PAINT:
			hDC = ::GetDC(hWnd);
			hMemDC = ::CreateCompatibleDC(hDC);
			SelectObject(hMemDC,hBmp);

			// Draw Image
			BitBlt(hDC,0,0,401,130,hMemDC,0,0,SRCCOPY);

			// Clear DC
			ReleaseDC(hWnd,hDC);
			DeleteDC(hMemDC);
			break;

		case WM_RECOEVENT:
			// Microphone Respond
			std::cout<<"Recognize...\n";
			ProcessRecoEvent(hWnd);
			break;

		case WM_TIMER:
			switch(wParam){
				case 1:
					::ShowWindow(hMainDlg,SW_HIDE);
					::ShowWindow(hMenuDlg,SW_SHOW);
					::ShowWindow(hButtonDlg,SW_SHOW);
					::ShowWindow(hTaskDlg,SW_SHOW);
					
					//hCUseDlg=hTaskDlg;

					::KillTimer(hWnd,1);
					::SetTimer(hWnd,2,300,NULL); // Swap SysTray Icon
					
					// Timer for update Helper Dialogs
					::SetTimer(NULL,NULL,100,(TIMERPROC)HelperTimerProc);
					break;

				case 2:
					g_nid.uID = 1;
					g_nid.hIcon = g_hIconTray[nSwapIcon];
					Shell_NotifyIcon(NIM_MODIFY,&g_nid);
					if(nSwapIcon) nSwapIcon = 0;
					else nSwapIcon = 1;
			}
			return TRUE;

		case WM_SYSTRAY_NOTIFY:

			switch(lParam){
				case WM_RBUTTONUP:
					ShowTrayMenu(hWnd);
					break;

				case WM_LBUTTONDBLCLK:
					//Show All Dialog
					break;
			}
		
			break;

		case WM_COMMAND:

			switch(LOWORD(wParam)){
				case MN_TRAY_EXIT:
					Shell_NotifyIcon(NIM_DELETE,&g_nid);
					::PostMessage(hWnd,WM_CLOSE,0,0);
					break;

				case MN_TRAY_MICSETUP:
					g_cpEngine->DisplayUI(hWnd, NULL,
						SPDUI_MicTraining, NULL, NULL);
					break;

				case MN_TRAY_TRAIN:
					g_cpEngine->DisplayUI(hWnd, NULL,
						SPDUI_UserTraining, NULL, NULL);
					break;
			}			
			break;

		case WM_CLOSE:
			std::cout<<"close\n";

			DestroyWindow (hWnd);
			return TRUE;

		case WM_DESTROY:
			std::cout<<"destroy\n";
			Shell_NotifyIcon(NIM_DELETE,&g_nid);
			::ShowWindow(hStrmDlg,SW_HIDE);

			PostQuitMessage(0);
			return TRUE;
	}

    return FALSE;
}

VOID CALLBACK HelperTimerProc(HWND hWnd,	// handle to window
						UINT uMsg,			// WM_TIMER message
						UINT_PTR idEvent,	// timer identifier
						DWORD dwTime)		// current system time
{
	static HWND _hFGWnd;
	HWND hFGWnd = ::GetForegroundWindow();

	// Foreground has changed!!!
	if(hFGWnd != _hFGWnd)
	{
		std::cout<<"hFGWnd has CHANGED!!!\n";
		UpdateExistedTaskList();
		RegenMenuTree(hFGWnd);
		if(!::IsOwnDialog(hFGWnd)) RegenCmndList(hFGWnd);
	}

	_hFGWnd = hFGWnd;
}

/******************************************************************************
* InitSAPI *
*----------*
*   Description:
*       Called once to get SAPI started.
*
******************************************************************************/
HRESULT InitSAPI( HWND hWnd ){
    HRESULT hr = S_OK;
    //CComPtr<ISpAudio> cpAudio;

    while ( 1 ){
        // create a recognition engine
        hr = g_cpEngine.CoCreateInstance(CLSID_SpSharedRecognizer);
        if ( FAILED( hr ) ) break;

        // create the command recognition context
		//Creates a recognition context for this instance of an SR engine.
        hr = g_cpEngine->CreateRecoContext( &g_cpRecoCtxt );
        if ( FAILED( hr ) ) break;

        // Let SR know that window we want it to send event information to, and using
        // what message
        hr = g_cpRecoCtxt->SetNotifyWindowMessage( hWnd, WM_RECOEVENT, 0, 0 );
        if ( FAILED( hr ) ) break;

	    // Tell SR what types of events interest us.  Here we only care about command
        // recognition.
        hr = g_cpRecoCtxt->SetInterest( SPFEI(SPEI_RECOGNITION),//****
					SPFEI(SPEI_RECOGNITION) );
        if ( FAILED( hr ) ) break;

        // Load our grammar, which is the compiled form of simple.xml bound into
        //  this executable as a user defined ("SRGRAMMAR") resource type.
        hr = g_cpRecoCtxt->CreateGrammar(GRAMMARID1, &g_cpCmdGrammar);
        if (FAILED(hr)) break;

		hr = g_cpCmdGrammar->LoadCmdFromResource(NULL, MAKEINTRESOURCEW(IDR_CMD_CFG),
					L"SRGRAMMAR", MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL),
					SPLO_DYNAMIC);					
        if ( FAILED( hr ) ) break;

        // Set rules to active, we are now listening for commands
        hr = g_cpCmdGrammar->SetRuleState(NULL, NULL, SPRS_ACTIVE );
        if ( FAILED( hr ) ) break;

        break;
    }

    // if we failed and have a partially setup SAPI, close it all down
    if ( FAILED( hr ) ) CleanupSAPI();

    return ( hr );
}

/******************************************************************************
* CleanupSAPI *
*----------------*
*   Description:
*       Called to close down SAPI COM objects we have stored away.
*
******************************************************************************/
void CleanupSAPI( void ){
    // Release grammar, if loaded
    if ( g_cpCmdGrammar ) g_cpCmdGrammar.Release();

    // Release recognition context, if created
    if ( g_cpRecoCtxt ){
        g_cpRecoCtxt->SetNotifySink(NULL);
        g_cpRecoCtxt.Release();
    }

    // Release recognition engine instance, if created
	if ( g_cpEngine ) g_cpEngine.Release();
}

/******************************************************************************
* ProcessRecoEvent *
*------------------*
*   Description:
*       Called to when reco event message is sent to main window procedure.
*       In the case of a recognition, it extracts result and calls ExecuteCommand.
*
******************************************************************************/
void ProcessRecoEvent( HWND hWnd )
{
    CSpEvent event;  // Event helper class

    // Loop processing events while there are any in the queue
    while (event.GetFrom(g_cpRecoCtxt) == S_OK)
    {		
        // Look at recognition event only
        switch (event.eEventId)
        {
            case SPEI_RECOGNITION:
                ExecuteCommand(event.RecoResult(), hWnd);
                break;
			default: std::cout<<"event.eEventId::Default\n";

        }
    }
}

/******************************************************************************
* ExecuteCommand *
*----------------*
*   Description:
*       Called to Execute commands that have been identified by the speech engine.
*
******************************************************************************/
void ExecuteCommand(ISpPhrase *pPhrase, HWND hWnd)
{
	SPPHRASE *pElements;

    // Get the phrase elements, one of which is the rule id we specified in
    // the grammar.  Switch on it to figure out which command was recognized.
    if (SUCCEEDED(pPhrase->GetPhrase(&pElements)))
    {
		HWND hFGWnd=::GetForegroundWindow();
		WPARAM wParam=0;
		LPARAM lParam=0;
		int i,nChoose;
		switch(pElements->Rule.ulId)
		{
			case VID_Exit:
				std::cout<<"Exit\n";
				//PostMessage(hMainDlg,WM_QUIT,0,0);
				::DestroyWindow(hMainDlg);
				break;
			case VID_Window:
				switch(pElements->pProperties->vValue.ulVal)
				{
					case VID_Close:
						if(!IsOwnDialog(hFGWnd)){
							lParam=-1;
							lParam<<=16;	//shift left 16 bits(to high-order word)
											// fake using a system accelerator
							::PostMessage(hFGWnd,WM_SYSCOMMAND,SC_CLOSE,lParam);
							TaskListDel(hFGWnd);							
						}
						break;
					case VID_Minimize:
						if(!IsOwnDialog(hFGWnd)){
							::ShowWindow(hFGWnd,SW_MINIMIZE);
						}
						break;
					case VID_Maximize:
						if(!IsOwnDialog(hFGWnd)){
							::ShowWindow(hFGWnd,SW_MAXIMIZE);
						}
						break;
					case VID_Restore:
						if(!IsOwnDialog(hFGWnd)){
							::ShowWindow(hFGWnd,SW_RESTORE);
						}
						break;
					case VID_Stretch:
						if(!IsOwnDialog(hFGWnd)){
							::ShowWindow(hFGWnd,SW_RESTORE);
							SetStretch(hFGWnd);
						}
						break;
					case VID_Next:
						std::cout<<"Window: Next\n";						
						break;
				}
				break;
			case VID_HelperHIDE:
				g_cpCmdGrammar->SetRuleIdState(VID_HelperSHOW, SPRS_ACTIVE );
				g_cpCmdGrammar->SetRuleIdState(VID_HelperHIDE, SPRS_INACTIVE );
				g_cpCmdGrammar->SetRuleIdState(VID_Use, SPRS_INACTIVE );
				::ShowWindow(hMenuDlg,SW_HIDE);
				::ShowWindow(hTaskDlg,SW_HIDE);
				::ShowWindow(hButtonDlg,SW_HIDE);
				
				::ShowWindow(hCurrent,SW_MAXIMIZE);
				break;
			case VID_HelperSHOW:
				g_cpCmdGrammar->SetRuleIdState(VID_HelperSHOW, SPRS_INACTIVE );
				g_cpCmdGrammar->SetRuleIdState(VID_HelperHIDE, SPRS_ACTIVE );
				g_cpCmdGrammar->SetRuleIdState(VID_Use, SPRS_ACTIVE );
				::ShowWindow(hMenuDlg,SW_SHOWNA);
				::ShowWindow(hTaskDlg,SW_SHOWNA);
				::ShowWindow(hButtonDlg,SW_SHOWNA);
				
				::ShowWindow(hCurrent,SW_RESTORE);
				SetStretch(hCurrent);
				break;
			case VID_Use:
				//BringAllWindowToBottom();
				switch(pElements->pProperties->vValue.ulVal)
				{
					case VID_MenuDlg:
						std::cout<<"Use: Menu Tree\n";
						SetCurrentUse(hMenuDlg);
						g_cpCmdGrammar->SetRuleIdState(VID_Cursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_SCursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_HCursor, SPRS_ACTIVE );
						break;
					case VID_TaskDlg:
						std::cout<<"Use: Task List\n";
						SetCurrentUse(hTaskDlg);						
						g_cpCmdGrammar->SetRuleIdState(VID_Cursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_SCursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_HCursor, SPRS_ACTIVE );
						break;
					case VID_CmndDlg:
						std::cout<<"Use: Button List\n";
						SetCurrentUse(hButtonDlg);
						g_cpCmdGrammar->SetRuleIdState(VID_Cursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_SCursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_HCursor, SPRS_ACTIVE );
						break;
					case VID_StartProg:
						std::cout<<"Use: Start Menu\n";
						lParam=-1;
						lParam<<=16;	//shift left 16 bits(to high-order word)
										// fake using a system accelerator
						::PostMessage(hFGWnd,WM_SYSCOMMAND,SC_TASKLIST,lParam);
						g_cpCmdGrammar->SetRuleIdState(VID_HCursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_Cursor, SPRS_ACTIVE );
						//g_cpCmdGrammar->SetRuleIdState(VID_SCursor, SPRS_ACTIVE );
						break;
					case VID_Menu:
						std::cout<<"Use: Menu\n";						
//						wParam=MF_POPUP|MF_HILITE|MF_MOUSESELECT;
//						wParam<<=16;
//						lParam=(LPARAM)::GetMenu(hFGWnd);
//						::PostMessage(hFGWnd,WM_MENUSELECT,wParam,lParam);
						::PostMessage(hFGWnd,WM_SYSCOMMAND,SC_KEYMENU,0);
						::PostMessage(hFGWnd,WM_KEYDOWN,VK_DOWN,0);
						::PostMessage(hFGWnd,WM_KEYUP,VK_DOWN,0);
						g_cpCmdGrammar->SetRuleIdState(VID_Cursor, SPRS_ACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_SCursor, SPRS_INACTIVE );
						g_cpCmdGrammar->SetRuleIdState(VID_HCursor, SPRS_INACTIVE );
						//::PostMessage(hFGWnd,WM_INITMENU,(WPARAM)::GetMenu(hFGWnd),0);
						break;
				}
				break;
			case VID_HCursor:
				switch(pElements->pProperties->vValue.ulVal)
				{
					case VID_Up:
						std::cout<<"HCursor: Up\n";
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYDOWN,VK_UP,0);
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYUP,VK_UP,0);
						break;
					case VID_Down:
						std::cout<<"HCursor: Down\n";
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYDOWN,VK_DOWN,0);
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYUP,VK_DOWN,0);
						break;
					case VID_Left:
						std::cout<<"HCursor: Left\n";
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYDOWN,VK_LEFT,0);
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYUP,VK_LEFT,0);
						break;
					case VID_Right:
						std::cout<<"HCursor: Right\n";
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYDOWN,VK_RIGHT,0);
						::PostMessage(::GetWindow(hCUseDlg,GW_CHILD),WM_KEYUP,VK_RIGHT,0);
						break;
					case VID_Choose:
						std::cout<<"HCursor: Choose\n";
						for(i=1000;i<1010;i++)
						{
							if(::GetDlgItem(hCUseDlg,i)!=NULL)	// only one control per loop
							{
								std::cout<<i<<"\n";
								switch(i)
								{
									case IDC_MENUTREE:
										//::PostMessage(hCUseDlg,WM_COMMAND,nSelectNode,NULL);
										break;
									
									case IDC_TASKLIST:

										nChoose=::SendMessage(GetDlgItem(hCUseDlg, i),
											LB_GETCURSEL, 0, 0);
										
										std::cout<<nChoose<<"\n";

										if(hTaskList[nChoose]!=::GetForegroundWindow())
										{
											::SetWindowPos(::GetForegroundWindow(),
												HWND_BOTTOM,0,0,0,0,SWP_NOMOVE|SWP_NOSIZE);

											::SetForegroundWindow(hTaskList[nChoose]);
											::ShowWindow(hTaskList[nChoose],SW_HIDE);
											::ShowWindow(hTaskList[nChoose],SW_RESTORE);

											::SetWindowPos(hTaskDlg,
												HWND_TOPMOST,0,0,0,0,SWP_NOMOVE|SWP_NOSIZE);
											g_cpCmdGrammar->SetRuleIdState(VID_Cursor,
												SPRS_ACTIVE );
											g_cpCmdGrammar->SetRuleIdState(VID_SCursor,
												SPRS_INACTIVE );
											g_cpCmdGrammar->SetRuleIdState(VID_HCursor,
												SPRS_INACTIVE );
										}
										break;
									
									case IDC_BUTTONLIST:
										break;
								}
							}
						}
						break;
				}
				break;

				case VID_Cursor:
					switch(pElements->pProperties->vValue.ulVal)
					{
						case VID_Up:
							std::cout<<"Cursor: Up\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_UP,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_UP,0);
							break;
						case VID_Down:
							std::cout<<"Cursor: Down\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_DOWN,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_DOWN,0);
							break;
						case VID_Left:
							std::cout<<"Cursor: Left\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_LEFT,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_LEFT,0);
							break;
						case VID_Right:
							std::cout<<"Cursor: Right\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_RIGHT,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_RIGHT,0);
							break;
						case VID_Choose:
							std::cout<<"Cursor: Choose\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_ENTER,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_ENTER,0);
							break;
						case VID_Escape:
							std::cout<<"Cursor: Escape\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_ESCAPE,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_ESCAPE,0);
							break;
						case VID_Tab:
							std::cout<<"Cursor: Tab\n";
							::PostMessage(hFGWnd,WM_KEYDOWN,VK_TAB,0);
							::PostMessage(hFGWnd,WM_KEYUP,VK_TAB,0);
							break;
					}
					break;
					case VID_Confirm:
					switch(pElements->pProperties->vValue.ulVal)
					{
						case VID_Yes:
							if(bConfirm[0]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[0],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_No:
							if(bConfirm[1]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[1],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_OK:
							if(bConfirm[2]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[2],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Cancel:
							if(bConfirm[3]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[3],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Close:
							if(bConfirm[4]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[4],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Open:
							if(bConfirm[5]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[5],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Yes_TH:
							if(bConfirm[6]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[6],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_No_TH:
							if(bConfirm[7]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[7],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_OK_TH:
							if(bConfirm[8]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[8],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Cancel_TH:
							if(bConfirm[9]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[9],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Close_TH:
							if(bConfirm[10]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[10],NULL);
								::ResetAllGrammarRule();
							}
							break;
						case VID_Open_TH:
							if(bConfirm[11]!=0){
								::PostMessage(hFGWnd,WM_COMMAND,bConfirm[11],NULL);
								::ResetAllGrammarRule();
							}
							break;
					}
					break;
		}
		
        // Free the pElements memory which was allocated for us
        ::CoTaskMemFree(pElements);
    }
	std::cout<<"---------\n";
}

BOOL CALLBACK TaskProc (HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
		case WM_INITDIALOG:
			std::cout<<"Task Dialog Created!\n";
            break;
		case WM_CLOSE:
			::ShowWindow(hWnd,SW_HIDE);
			return TRUE;
		case WM_DESTROY:
			::ShowWindow(hWnd,SW_HIDE);
			return TRUE;
		case 0x0020:
			break;
		case 0x0084:
			break;
		case 0x0200:
			break;
		case 0x00A0:
			break;
		case 0x0134:
			break;
		/*
		default:
			std::cout<<(HWND)message<<"\t";
			std::cout<<"(WPARAM)"<<wParam<<"\t";
			std::cout<<"(LPARAM)"<<lParam<<"\n";
		*/
	}

    return FALSE;
}

BOOL CALLBACK MenuProc (HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	NMHDR *nmptr;

    switch (message)
    {
		case WM_INITDIALOG:
			std::cout<<"Menu Dialog Created!\n";
			hTreeCtrl = GetDlgItem(hWnd,IDC_MENUTREE);
            break;
		case WM_NOTIFY:
			nmptr = (LPNMHDR) lParam;
			if(nmptr->code == TVN_SELCHANGED) // precess a tree change
			{
				/*
				NM_TREEVIEW
				hTreeCurrent = ((LPNM_TREEVIEW)nmptr)->itemNew.hItem; //TV_ITEM itemNew
				std::cout<<"db:"<<nmptr->idFrom<<":";
				std::cout<<::((LPNM_TREEVIEW)nmptr)->itemNew.pszText;
				std::cout<<"\n";
				*/
			}
			break;
		case WM_CLOSE:
			::ShowWindow(hWnd,SW_HIDE);
			return TRUE;
		case WM_DESTROY:
			::ShowWindow(hWnd,SW_HIDE);
			return TRUE;
	}

    return FALSE;
}

BOOL CALLBACK ButtonProc (HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{	
    switch (message)
    {
		case WM_INITDIALOG:
			std::cout<<"Text Dialog Created!\n";
            break;
		case WM_CLOSE:
			::ShowWindow(hWnd,SW_HIDE);
			return TRUE;
		case WM_DESTROY:
			::ShowWindow(hWnd,SW_HIDE);
			return TRUE;
	}

    return FALSE;
}

void SetCenter(HWND hWnd)
{
	RECT rectA,rectB;
	LONG w,h;
	::GetWindowRect(::GetDesktopWindow(),&rectA);
	::GetWindowRect(hWnd,&rectB);
	w =::abs(rectB.left-rectB.right);
	h =::abs(rectB.top-rectB.bottom);
	::MoveWindow(hWnd,
		(rectA.right/2) - (w/2),
		(rectA.bottom/2)- (h/2),
		w, h, TRUE);
}

void SetOnTopMost(HWND hWnd)
{
	std::cout<<"on\n";
	if(!::SetWindowPos(hWnd,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE | SWP_NOSIZE))
		ShowError();
	std::cout<<"top most\n";
}

void SetStretch(HWND hWnd)
{
	RECT rectA,rectB;
	LONG w,h;
	::GetWindowRect(::GetDesktopWindow(),&rectA);
	::GetClientRect(hMenuDlg,&rectB);
	w =::abs(rectA.right - rectB.right - 6);
	h =::abs(rectA.bottom) - 30;
	::MoveWindow(hWnd,
		0, 0,
		w, h, TRUE);
}

void BringAllWindowToBottom(void)
{
	HWND hTemp1,hTemp2;
	int i;
	char* buff;
	buff=new char[128];
	hTemp1=::FindWindow("Progman",NULL);	
	/*
	std::cout<<"-::display::----\n";
	while((hTemp2=::GetWindow(hTemp1,GW_HWNDPREV))!=NULL)
	{
		hTemp1=hTemp2;
		if(::IsWindowEnabled(hTemp1)&&::IsWindowVisible(hTemp1))
		{
			::GetWindowText(hTemp1,buff,128);
			std::cout<<buff<<"\n";
		}
	}
	*/
	i=0;
	while((hTemp2=::GetWindow(hTemp1,GW_HWNDPREV))!=NULL)
	{
		hTemp1=hTemp2;
		if(::IsWindowEnabled(hTemp1)&&::IsWindowVisible(hTemp1)&&(!::IsOwnDialog(hTemp1)))
		{
			::GetWindowText(hTemp1,buff,128);

			if(strlen(buff)!=0)
			{
				::SetWindowPos(hTemp1,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE|SWP_NOSIZE);
				std::cout<<i<<") "<<buff<<"\n";
			}
			i++;
		}
	}
	
	delete[] buff;
}

void ShowWndText(HWND hWnd)
{
	char* buff;
	buff = new char[128];
	::GetWindowText(hWnd,buff,128);
	std::cout<<"Window : ["<<hWnd<<"]";
	std::cout<<buff<<"\n";
	delete[] buff;
}

void SetCurrentUse(HWND hWnd)
{
//	DWORD	dwTemp;
//	WPARAM	wParam;
//	LPARAM	lParam;
//	HWND hFGWnd=::GetForegroundWindow();
	::SetForegroundWindow(hWnd);
	//::SetActiveWindow(hWnd);

//	wParam=(WPARAM)WA_INACTIVE;
//	lParam=(LPARAM)hWnd;
//	::PostMessage(hWnd,WM_ACTIVATE,wParam,lParam);

//	wParam=(WPARAM)WA_CLICKACTIVE;
//	lParam=(LPARAM)hFGWnd;
//	::PostMessage(hFGWnd,WM_ACTIVATE,wParam,lParam);
	
	hCUseDlg=hWnd;
}

void MenuWordTrim(char* buff)
{
	int j=0;
	char* buff1=::_strdup(buff);
	for(int i=0;i<strlen(buff1);i++)
	{
		if(buff1[i]=='/')
		{
			buff[j++]=' ';
			buff[j++]='o';
			buff[j++]='r';
			buff[j++]=' ';
		}
		else if(buff1[i]=='&');
		else if(buff1[i]==' ')buff[j++]=buff1[i];
		else if(buff1[i]==VK_TAB)break;	
		else
		{
			buff[j++]=buff1[i];
		}
	}
	buff[j]='\0';
	free(buff1);	
}

int MenuTreeGetSub(HMENU hMenu,int i,int k)
{
	char*  buff;
	buff=new char[80];

	int p=k;
	HMENU hSubMenu=::GetSubMenu(hMenu,i);
	int m=::GetMenuItemCount(hSubMenu);
	for(int j=0;j<m;j++)
	{
		if( // NOT Line AND NOT Disabled
			(::GetMenuString(hSubMenu,j,buff,80,MF_BYPOSITION) > 0)		&&
			!(::GetMenuState(hSubMenu,j,MF_BYPOSITION) & MF_DISABLED)	)
		{
			k++;
			std::cout<<k<<": "<<buff<<"\n";

			MenuWordTrim(buff);
			tvi.pszText = buff;
			tvs.hParent = hTreeNode[p];
			tvs.item = tvi;
			// #insert item
			hTreeNode[k] = TreeView_InsertItem(hTreeCtrl,&tvs);
			nTreeNodeMN[k]=hSubMenu;
		}
		k = MenuTreeGetSub(hSubMenu,j,k);
	}
	delete[] buff;
	return k;
}

void RegenMenuTree(HWND hWnd)
{
	if(hWnd==NULL) return;
	else if(IsOwnDialog(hWnd)) return;
	else if(hWnd!=hCurrent)
	{
		hCurrent = hWnd;
		
		//std::cout<<"- RegenMenuTree() -\n";		
		HMENU hMenu		= ::GetMenu(hWnd);
		int	  n			= ::GetMenuItemCount(hMenu);
		int	  k=0;		// hTreeNode Array Index
		char* buff;
		char* tarTitle;
		char* newTitle;

		buff=new char[80];
		tarTitle=new char[256];
		newTitle=new char[256];

		// Update Menu Tree Dialog's title bar with new target window
		::GetWindowText(hCurrent,tarTitle,256);
		sprintf(newTitle,"Menu Tree - %s",tarTitle);
		SendMessage((HWND) hMenuDlg, WM_SETTEXT,
			(WPARAM) 0, (LPARAM) newTitle );
		
		// Initialize TreeView
		tvs.hInsertAfter = TVI_LAST;
		tvi.mask = TVIF_TEXT;
		TreeView_DeleteAllItems(hTreeCtrl);

		for(int i=0;i<n;i++)
		{
			::GetMenuString(hMenu,i,buff,80,MF_BYPOSITION);
			std::cout<<k<<": "<<buff<<"\n";

			MenuWordTrim(buff); // Cut suffix (HotKey Infomation)
			tvi.pszText = buff;
			tvs.hParent = TVI_ROOT;
			tvs.item = tvi;
			// #insert item
			hTreeNode[k] = TreeView_InsertItem(hTreeCtrl,&tvs);
			nTreeNodeMN[k]=hMenu;

			k = MenuTreeGetSub(hMenu,i,k);
			k++;
		}
		
		hTreeCurrent = hTreeNode[0];

		nNodeCount=k;

		delete[] buff;
		delete[] tarTitle;
		delete[] newTitle;
		std::cout<<"- RegenMenuTree; -\n";
	}
}

void TaskListAdd(HWND hWnd)
{
	char* buff;
	BOOL bFound=false;

	// Allocate String Buffer
	buff = new char[128];

	// Ignore own Dialog
	if(::IsOwnDialog(hWnd)) return;
	else if(hWnd==hTarget3) return;
	else if(hWnd==NULL) return;
	else if(hWnd==::FindWindow(NULL,"Start Menu")) return;
	else
	{
		::GetClassName(hWnd,buff,128);
		if(strcmp(buff,"#32770")==0) return;  // Ignore child dialog box
	}
	std::cout<<"- TaskListAdd() -\n";
	hTarget3=hWnd;

	// Find exist HWND in hTaskList[]
	for(int i=0;i<nTaskCount;i++){
		if(hWnd==hTaskList[i])
		{
			bFound=true;
			::GetWindowText(hWnd,buff,128);

			/*
			// update text
			if(LB_ERR==SendDlgItemMessage(hTaskDlg, IDC_TASKLIST,
				LB_SETITEMDATA, (WPARAM)i, //index
				(LPARAM)buff)
				)std::cout<<"LB_ERR\n";	
			*/
			
			// then select it
			if(LB_ERR==SendDlgItemMessage(hTaskDlg, IDC_TASKLIST,
				LB_SETCURSEL, (WPARAM)i, //index
				(LPARAM)0)
				)std::cout<<"LB_ERR\n";			
		}
	}

	// Add new HWND if not exist
	if(!bFound && (::GetWindowText(hWnd,buff,128)>0))
	{
		std::cout<<"- Add New TaskList -\n";
		//sprintf(buff,"%s",buff);
		SendDlgItemMessage(hTaskDlg, IDC_TASKLIST,
			LB_ADDSTRING, 0,
			(LPARAM)buff);
		hTaskList[nTaskCount++]=hWnd;

		// Then Select it...
		if(LB_ERR==SendDlgItemMessage(hTaskDlg, IDC_TASKLIST,
				LB_SETCURSEL, (WPARAM)(nTaskCount-1), //index
				(LPARAM)0)
				)std::cout<<"LB_ERR\n";	
	}
	std::cout<<"- TaskListAdd; -\n";
	delete[] buff;
}

void TaskListDel(HWND hWnd)
{
	int i;
	for(i=0;i<1024;i++)
	{
		if(hWnd==hTaskList[i])
		{
			std::cout<<"del:"<<i<<"\n";

			// Del item in list box
			SendDlgItemMessage(hTaskDlg, IDC_TASKLIST,
				LB_DELETESTRING, (WPARAM)i,
				(LPARAM)0); // not used; must be zero

			// Roll list
			for(int j=i;j<nTaskCount;j++)
			{
				hTaskList[j]=hTaskList[j+1];
			}
			nTaskCount--;

			// Then Select it...
			if(LB_ERR==SendDlgItemMessage(hTaskDlg, IDC_TASKLIST,
				LB_SETCURSEL, (WPARAM)i, //index
				(LPARAM)0)
				)std::cout<<"LB_ERR\n";	
		}
	}
}

void ClearListBox(HWND hDlg,int nListBoxId)
{
	int i;
	for(i=0;i<nButtonCount;i++)
	{
		std::cout<<"#Del button ";
		std::cout<<i<<"\n";
		SendDlgItemMessage(hDlg, nListBoxId,
			LB_DELETESTRING, (WPARAM)0,
			(LPARAM)0); // not used; must be zero
	}
	nButtonCount=0;
}

void KnownButton(HWND hWnd,int nID,char* szText)
{
	char* buff;
	buff=new char[128];
	::GetClassName(hWnd,buff,128);
	std::cout<<" WC:"<<buff<<" ";
	std::cout<<"[know bt]:"<<nID<<" : "<<szText<<"\n";

	SendDlgItemMessage(hButtonDlg, IDC_BUTTONLIST,
			LB_ADDSTRING, 0,
			(LPARAM)szText);
	nButtonCount++;
	delete[] buff;
}

void _RegenCmndList(HWND hWnd){}
void RegenCmndList(HWND hWnd)
{	
	HWND hItem;
	int i;
	bool bConfirmDlg;
//	RECT rect;
	char* tarTitle;
	char* newTitle;
	char* buff;

	// Clear old list
	ClearListBox(hButtonDlg,IDC_BUTTONLIST);
	newTitle=new char[12];
	sprintf(newTitle,"Button List");
	::SendMessage((HWND) hButtonDlg, WM_SETTEXT,
		(WPARAM) 0, (LPARAM) newTitle );
	delete[] newTitle;
	newTitle=NULL;

	if(hWnd==NULL) return;
	// Ignore current hWnd
	else if(hWnd==hTarget2) return;	
	
	hTarget2=hWnd;

	// Ignore own Dialog	
	if(::IsOwnDialog(hWnd)) return;
	std::cout<<"- RegenCmndList() -\n";
	
	// Update Text Command Dialog's title bar with new target window
	tarTitle=new char[256];
	newTitle=new char[256];
	::GetWindowText(hWnd,tarTitle,256);
	sprintf(newTitle,"Button List - %s",tarTitle);
	::SendMessage((HWND) hButtonDlg, WM_SETTEXT,
		(WPARAM) 0, (LPARAM) newTitle );	
	
	buff=new char[256];

	// Initialize Button Confirm Array and Variable
	for(i=0;i<12;i++) bConfirm[i]=0;
	bConfirmDlg=false;

	for(i=0;i<1000000;i++)
	{
		hItem=::GetDlgItem(hWnd,i);
		if(hItem != NULL)
		{
			/*
			std::cout<<"\thItem:"<<hItem<<" ID "<<i<<" : ";
			// Get position of control
			::GetWindowRect(hItem,&rect);
			std::cout<<"left:"<<rect.left<<", top:"<<rect.top<<" ";
			*/

			if(::GetDlgItemText(hWnd,i,buff,255) != 0) // It have Text
			{
				// ignore '&' symbol
				MenuWordTrim(buff);

				std::cout<<"text="<<buff<<" ";
				if(true)
				{
					if(strcmp(buff,"Yes")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[0]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"No")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[1]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"OK")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[2]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"Cancel")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[3]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"Close")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[4]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"Open")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[5]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"ใช่")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[6]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"ไม่ใช่")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[7]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"ตกลง")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[8]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"ยกเลิก")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[9]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"ปิด")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[10]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"เปิด")==0){
						KnownButton(hWnd,i,buff);
						bConfirm[11]=i;
						bConfirmDlg=true;
					}
					else if(strcmp(buff,"Start")==0){
						KnownButton(hWnd,i,buff);
					}
					else std::cout<<"\n";
				}
			}			

			// Test some function
			
		}
	}

	if(bConfirmDlg)
	{
		::BlindAllGrammarRule();
		g_cpCmdGrammar->SetRuleIdState(VID_Confirm, SPRS_ACTIVE );
	}

	delete[] newTitle;
	delete[] tarTitle;

	std::cout<<"- RegenCmndList; -\n";
}

void ShowTrayMenu(HWND hwnd)
{
	// load the top-level menu and fetch the first
	// submenu, then destroy it
	static HMENU hnmenu = ::GetSubMenu(g_hPopupMenu,0);	

	// make sure the Quit pick is highlighted as the
	// default
	::SetMenuDefaultItem(
		hnmenu,		 // menu to affect
		MN_TRAY_EXIT, // ID to make default
		FALSE);		 // not by position, by ID

	// make current window foreground, required to fix
	// Q135788 from MSDN
	::SetForegroundWindow(hwnd);

	// grab the point of right-click and pop up the menu
	POINT pt;
	::GetCursorPos(&pt);
	if(::TrackPopupMenu(
		hnmenu,			// menu to pop up
		TPM_RIGHTALIGN,	// align the popup
		pt.x,pt.y,		// point to popup menu from
		0,				// must be 0
		hwnd,			// owner
		NULL))			// ignored
	{
		// force task switch to owner application, from Q135788
		::PostMessage(hwnd,WM_USER,0,0);
	}
}

BOOL IsOwnDialog(HWND hWnd)
{
	if(hWnd==hStrmDlg) return TRUE;
	else if(hWnd==hMainDlg)		return TRUE;
	else if(hWnd==hMenuDlg)		return TRUE;
	else if(hWnd==hTaskDlg)		return TRUE;
	else if(hWnd==hButtonDlg)	return TRUE;
	else return FALSE;
}

void ShowError(void)
{
	DWORD MsgID = GetLastError();
	LPVOID lpMsgBuf;
	FormatMessage(
		FORMAT_MESSAGE_ALLOCATE_BUFFER | 
		FORMAT_MESSAGE_FROM_SYSTEM | 
		FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL, MsgID, 
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
		(LPTSTR) &lpMsgBuf,	0, NULL);

	if(MsgID != 0) std::cout<<"Error!!! : ";
	else std::cout<<"Successed!!! : ";
	std::cout<<(char*)lpMsgBuf<<"\n";
	LocalFree( lpMsgBuf );
}

void UpdateExistedTaskList(void)
{
	HWND hTemp1,hTemp2;

	// Find Program-Manager window
	// It is lowest window in z-order
	hTemp1=::FindWindow("Progman",NULL);	
	
	// Retrieve all window above it
	while((hTemp2=::GetWindow(hTemp1,GW_HWNDPREV))!=NULL)
	{
		hTemp1=hTemp2;
		if(::IsWindowEnabled(hTemp1)&&::IsWindowVisible(hTemp1))
		{
			// add them to own task-list dialog
			::TaskListAdd(hTemp1);			
		}
	}
}

void BlindAllGrammarRule(void)
{
	g_cpCmdGrammar->SetRuleIdState(0, SPRS_INACTIVE );
}

void ResetAllGrammarRule(void)
{
	BlindAllGrammarRule();
	g_cpCmdGrammar->SetRuleIdState(VID_Window, SPRS_ACTIVE );	
	g_cpCmdGrammar->SetRuleIdState(VID_Exit, SPRS_ACTIVE );
	g_cpCmdGrammar->SetRuleIdState(VID_Use, SPRS_ACTIVE );
	g_cpCmdGrammar->SetRuleIdState(VID_HCursor, SPRS_ACTIVE );
	g_cpCmdGrammar->SetRuleIdState(VID_HelperHIDE, SPRS_ACTIVE );
	
	g_cpCmdGrammar->SetRuleIdState(VID_HelperSHOW, SPRS_INACTIVE );
	g_cpCmdGrammar->SetRuleIdState(VID_Cursor, SPRS_INACTIVE );
	g_cpCmdGrammar->SetRuleIdState(VID_Confirm, SPRS_INACTIVE );
}
