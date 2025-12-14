#ifndef _CLAYERWINDOW_H_
#define _CLAYERWINDOW_H_

#include <windows.h>
#include <windowsx.h>

#ifndef WS_EX_LAYERED
#define WS_EX_LAYERED           0x00080000
#define LWA_COLORKEY            0x00000001
#define LWA_ALPHA               0x00000002
#endif

class cWindowLayer
{
	private:
		HWND m_hWnd;
	public:
		cWindowLayer();
		
		BOOL CheckWindowVersion();
		BOOL AddWindowLayer(HWND hWnd);
		BOOL SetWindowTranparent(COLORREF Color);
		BOOL SetWindowAlpha(BYTE Alpha);
		BOOL SetWindowLayer(COLORREF Color, BYTE Alpha);
};

#endif
