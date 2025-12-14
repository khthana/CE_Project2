#include "Global_Func.h"
#include "cMessageDlg.h"

cMessageDlg::cMessageDlg()
{
	m_hWnd = NULL;
	strcpy(m_Message, "");
}

BOOL cMessageDlg::ShowDialog(HINSTANCE hInst, int IDD_DIALOG, HWND hWndParent)
{

	if (m_hWnd != NULL)
		return FALSE;

	m_hWnd = CreateDialog(hInst, MAKEINTRESOURCE(IDD_DIALOG), hWndParent, (DLGPROC)MessageDlgProc);

	if (m_hWnd == NULL)
		return FALSE;

	RECT rect;
	GetClientRect(hWndParent, &rect);
	int XPos = ((rect.right - rect.left) - 280)/2;
	int YPos = ((rect.bottom - rect.top) - 120)/2;		
	SetWindowPos(m_hWnd, HWND_TOP, XPos, YPos, 280, 120, SWP_SHOWWINDOW);
	HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\win_msgbox.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	HRGN rgn = CreateRegion(m_hWnd, Background, 280, 120, 255, 0, 255);
	SetWindowRgn(m_hWnd, rgn, TRUE);
	m_hWndParent = hWndParent;

	ShowWindow(m_hWnd, SW_SHOW);
	UpdateWindow(m_hWnd);

	return TRUE;
}

BOOL cMessageDlg::Show()
{
	ShowWindow(m_hWnd, SW_SHOW);
	UpdateWindow(m_hWnd);

	return TRUE;
}

BOOL cMessageDlg::Hide()
{
	ShowWindow(m_hWnd, SW_HIDE);
	UpdateWindow(m_hWnd);

	return TRUE;
}

BOOL cMessageDlg::Close()
{
	if (m_hWnd != NULL)
		EndDialog(m_hWnd, 0);

	return TRUE;
}

void cMessageDlg::SetMessage(int ID_STATIC, char *Msg)
{
	strcpy(m_Message, Msg);
	SetDlgItemText(m_hWnd, ID_STATIC, m_Message);
}

char* cMessageDlg::GetMessage()
{
	return m_Message;
}

HWND cMessageDlg::GethWnd()
{
	return m_hWnd;
}

HWND cMessageDlg::GethWndParent()
{
	return m_hWnd;
}

LRESULT CALLBACK MessageDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		case WM_INITDIALOG:
		{
			//Set Window Cursor
			HCURSOR Normal_Cursor = LoadCursorFromFile(".\\Cursor\\Normal_Select.ani");
			SetClassLong(hDlg, GCL_HCURSOR, (LONG) Normal_Cursor);
		} break;
		case WM_LBUTTONDOWN:
		{
			int YPos = HIWORD(lParam);

			if ((YPos >= 0)&&(YPos <= 17))
			{
				SendMessage(hDlg, WM_NCLBUTTONDOWN, HTCAPTION,NULL);
			}
		} break;
		case WM_CTLCOLORSTATIC:
		{
			HDC hdc = (HDC)wParam;
			SetBkColor(hdc, RGB(255,255,255));
			SetTextColor(hdc, RGB(0,0,0));
			return (long)CreateSolidBrush(RGB(255,255,255));
		} break;
		case WM_PAINT:
		{
			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hDlg, &ps);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\win_msgbox.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			HDC backdc = CreateCompatibleDC(hdc);
			SelectObject(backdc, Background);
			BitBlt(hdc, ps.rcPaint.left,ps.rcPaint.top, ps.rcPaint.right-ps.rcPaint.left,ps.rcPaint.bottom-ps.rcPaint.top, backdc,ps.rcPaint.left,ps.rcPaint.top,SRCCOPY);
			EndPaint(hDlg, &ps);
		} break;
	}

	return FALSE;
}
