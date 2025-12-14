#include "Gui.h"
#include "gameutil.h"

Gui_Container *Gui::desktop=NULL;

DWORD GUIRefresh_thread(LPVOID theGUI);

LRESULT CALLBACK WindowProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);

static HWND hWnd;
static char CLASSNAME[]="RTS game";
static char WINNAME[]="RTS game";

int Gui::start(HINSTANCE hInstance, int nCmdShow)
{
	WNDCLASSEX wc;
	DWORD Tid;

	wc.cbClsExtra=0;
	wc.cbWndExtra=0;
	wc.hbrBackground=(HBRUSH)GetStockObject(BLACK_BRUSH);
	wc.hCursor=LoadCursor(NULL, IDC_ARROW);
	wc.hIcon=LoadIcon(NULL, IDI_APPLICATION);
	wc.hInstance=hInstance;
	wc.lpfnWndProc=WindowProc;
	wc.lpszClassName=CLASSNAME;
	wc.lpszMenuName=NULL;
	wc.style=CS_VREDRAW| CS_HREDRAW;
	wc.hIconSm=LoadIcon(NULL, IDI_APPLICATION);	
	wc.cbSize=sizeof(WNDCLASSEX);

	if(!RegisterClassEx(&wc))
		return -1;

	hWnd = CreateWindowEx(WS_EX_TOPMOST,
						CLASSNAME, WINNAME,
						WS_POPUP,
						0,0,
						GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN),
						NULL,
						NULL,
						hInstance,
						NULL);

	if(!hWnd)
		return -1;

	ShowWindow(hWnd, nCmdShow);
	UpdateWindow(hWnd);
	SetFocus(hWnd);

	GFXManager::createInstance(hWnd);
	GFXManager::Init();

	desktop=new Gui_Container(GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN));
	desktop->setPos(0,0);
	desktop->setVisibility(true);

	CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)GUIRefresh_thread,
		(LPVOID)NULL, 0, &Tid);

	return 0;
}

void Gui::refresh(){
	desktop->refresh();
	GFXManager::ShowScreen(desktop->getGraphics()->getSurface());
}

void Gui::ReleaseAllObject(){
	KillTimer(hWnd, 100L);
	desktop->ReleaseAllObject();
}

bool wantStop=false;
DWORD GUIRefresh_thread(LPVOID theGUI)
{
	while(!wantStop)
	{
		Gui::refresh();
		Sleep(10);
	}
	return 0L;
}


LRESULT CALLBACK WindowProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	POINT mPos;

	switch (message)
    {
        case WM_ACTIVATE:
            // Pause if minimized
			//g_bActive = !((BOOL)HIWORD(wParam));
            return 0L;

        case WM_DESTROY:
            // Clean up and close the app
			GFXManager::ReleaseAllObjects();
            PostQuitMessage(0);
            return 0L;

        case WM_SETCURSOR:
            // Turn off the cursor since this is a full-screen app
            //SetCursor(NULL);
            return TRUE;
		case WM_TIMER:
			Gui::refresh();
			SetTimer(hWnd, 100L, 10, NULL);
			return TRUE;
//---------------------------------------------------------
//			BEGIN Gui Message
//---------------------------------------------------------
		case WM_LBUTTONDOWN:
			mPos.x=LOWORD(lParam);
			mPos.y=HIWORD(lParam);
			Gui::getDesktop()->_onLeftButtonDown(mPos, wParam);
			return TRUE;
		case WM_LBUTTONUP:
			mPos.x=LOWORD(lParam);
			mPos.y=HIWORD(lParam);
			Gui::getDesktop()->_onLeftButtonUp(mPos, wParam);
			return TRUE;
		case WM_RBUTTONDOWN:
			mPos.x=LOWORD(lParam);
			mPos.y=HIWORD(lParam);
			Gui::getDesktop()->_onRightButtonDown(mPos, wParam);
			return TRUE;
		case WM_RBUTTONUP:
			mPos.x=LOWORD(lParam);
			mPos.y=HIWORD(lParam);
			Gui::getDesktop()->_onRightButtonUp(mPos, wParam);
			return TRUE;
		case WM_MOUSEMOVE:
			Gui::getDesktop()->_onMouseMove(wParam, lParam);
			return TRUE;
		case WM_KEYDOWN:
			switch((int)wParam){
			case VK_ESCAPE:
				wantStop=true;
				while(Gui::getDesktop()->isRefreshing())
				{
//					Sleep(10);
				}
				ExitGame();
				Gui::ReleaseAllObject();
				GFXManager::ReleaseAllObjects();
				PostQuitMessage(0);
				break;
			default:
				Gui::getDesktop()->_onKeyDown(wParam, lParam);
			}
			return TRUE;
		case WM_KEYUP:
			Gui::getDesktop()->_onKeyUp(wParam, lParam);
			return TRUE;
	}
//---------------------------------------------------------
//			BEGIN Gui Message
//---------------------------------------------------------

    return DefWindowProc(hWnd, message, wParam, lParam);
}
