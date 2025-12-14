#include "cLayerWindow.h"

typedef BOOL (WINAPI *lpfnSetLayeredWindowAttributes)(HWND hWnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);

lpfnSetLayeredWindowAttributes m_pSetLayeredWindowAttributes=NULL;

cWindowLayer::cWindowLayer()
{
	if (m_pSetLayeredWindowAttributes == NULL)
	{
		HMODULE hUser32 = GetModuleHandle("USER32.DLL");
		m_pSetLayeredWindowAttributes = (lpfnSetLayeredWindowAttributes)GetProcAddress(hUser32, "SetLayeredWindowAttributes");
	}
}

BOOL cWindowLayer::CheckWindowVersion()
{
	OSVERSIONINFO os = { sizeof(os) };
	GetVersionEx(&os);

	BOOL bWin2K = ( VER_PLATFORM_WIN32_NT == os.dwPlatformId && os.dwMajorVersion >= 5 );

	return bWin2K;
}


BOOL cWindowLayer::AddWindowLayer(HWND hWnd)
{
	if (m_pSetLayeredWindowAttributes == NULL)
		return FALSE;
	
	m_hWnd = hWnd;

	SetWindowLong(m_hWnd, GWL_EXSTYLE, GetWindowLong (m_hWnd, GWL_EXSTYLE)|WS_EX_LAYERED);

	return TRUE;
}

BOOL cWindowLayer::SetWindowTranparent(COLORREF Color)
{
	if (m_pSetLayeredWindowAttributes == NULL)
		return FALSE;

	m_pSetLayeredWindowAttributes(m_hWnd, Color, 255, LWA_COLORKEY);

	return TRUE;
}

BOOL cWindowLayer::SetWindowAlpha(BYTE Alpha)
{
	if (m_pSetLayeredWindowAttributes == NULL)
		return FALSE;

	m_pSetLayeredWindowAttributes(m_hWnd, RGB(255,0,255), Alpha, LWA_ALPHA);

	return TRUE;
}

BOOL cWindowLayer::SetWindowLayer(COLORREF Color, BYTE Alpha)
{
	if (m_pSetLayeredWindowAttributes == NULL)
		return FALSE;

	m_pSetLayeredWindowAttributes(m_hWnd, Color, Alpha, LWA_COLORKEY|LWA_ALPHA);

	return TRUE;
}
