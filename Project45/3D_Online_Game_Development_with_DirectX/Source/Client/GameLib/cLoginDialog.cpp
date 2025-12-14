#include "Core_Global.h"
#include "resource.h"

BOOL g_LoginPress;

cLoginDialog::cLoginDialog()
{
	m_hWnd = NULL;
	m_hWndParent = NULL;
}

BOOL cLoginDialog::Create(HINSTANCE hInst, int IDD_DIALOG, HWND hWndParent)
{
	if (m_hWnd != NULL)
		m_hWnd = NULL;
		//return FALSE;

	m_hWnd = CreateDialog(hInst, MAKEINTRESOURCE(IDD_DIALOG), hWndParent, (DLGPROC)LoginDlgProc);

	if (m_hWnd == NULL)
		return FALSE;

	RECT rect;
	GetClientRect(hWndParent, &rect);
	int XPos, YPos;
	XPos = (rect.right-rect.left-313)/2;
	YPos = (rect.bottom-rect.top)*56/100;

	SetWindowPos(m_hWnd, HWND_TOP, XPos, YPos, 313, 166, SWP_SHOWWINDOW);
	HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Picture\\LogWindow.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	HRGN rgn = CreateRegion(m_hWnd, Background, 313, 166, 255, 0, 255);
	SetWindowRgn(m_hWnd, rgn, TRUE);
	m_hWndParent = hWndParent;

	g_LoginPress = FALSE;

	ShowWindow(m_hWnd, SW_SHOW);
	UpdateWindow(m_hWnd);

	return TRUE;
}

BOOL cLoginDialog::Close()
{
	g_LoginPress = FALSE;

	return EndDialog(m_hWnd, 0);
}

HWND cLoginDialog::GethWnd()
{
	return m_hWnd;
}

BOOL cLoginDialog::LoginButtonPress()
{
	return g_LoginPress;
}

LRESULT CALLBACK LoginDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		case WM_INITDIALOG:
		{
			//Set Window Cursor
			HCURSOR Normal_Cursor = LoadCursorFromFile(".\\Cursor\\Normal_Select.ani");
			SetClassLong(hDlg, GCL_HCURSOR, (LONG) Normal_Cursor);
			MoveWindow(GetDlgItem(hDlg, IDC_IP), 98, 39, 85, 15, TRUE);
			MoveWindow(GetDlgItem(hDlg, IDC_PORT), 230, 39, 50, 15, TRUE);
			MoveWindow(GetDlgItem(hDlg, IDC_USER), 98, 72, 124, 15, TRUE);
			MoveWindow(GetDlgItem(hDlg, IDC_PASS), 98, 104, 124, 15, TRUE);
			MoveWindow(GetDlgItem(hDlg, IDC_LOGIN), 222, 142, 42, 20, TRUE);
			MoveWindow(GetDlgItem(hDlg, IDC_EXIT), 266, 142, 42, 20, TRUE);
			// Test
			SetDlgItemText(hDlg, IDC_IP, "161.246.6.110");
			SetDlgItemText(hDlg, IDC_PORT, "6000");
		} break;
		case WM_LBUTTONDOWN:
		{
			int YPos = HIWORD(lParam);

			if ((YPos >= 0)&&(YPos <= 17))
			{
				SendMessage(hDlg, WM_NCLBUTTONDOWN, HTCAPTION,NULL);
			}
		} break;
		case WM_CTLCOLOREDIT:
		{
			HDC hdc = (HDC)wParam;
			SetBkColor(hdc, RGB(240,240,240));
			SetTextColor(hdc, RGB(0,0,0));
			return (long)CreateSolidBrush(RGB(240,240,240));
		} break;
        case WM_DRAWITEM: 
		{			
			LPDRAWITEMSTRUCT lpdis = (LPDRAWITEMSTRUCT) lParam; 
			if (lpdis->CtlType == ODT_BUTTON)
			{
				HDC hdcMem = CreateCompatibleDC(lpdis->hDC);

				if (lpdis->CtlID == IDC_LOGIN)
				{
					HBITMAP Button1 = (HBITMAP)LoadImage(NULL, ".\\Picture\\LoginButton1.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					HBITMAP Button2 = (HBITMAP)LoadImage(NULL, ".\\Picture\\LoginButton2.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					if (lpdis->itemState & ODS_SELECTED)
						TransBlt(lpdis->hDC, 0, 0, 42, 20, Button2, 255, 0, 255);
					else
						TransBlt(lpdis->hDC, 0, 0, 42, 20, Button1, 255, 0, 255);
				}
				else
				if (lpdis->CtlID == IDC_EXIT)
				{
					HBITMAP Button1 = (HBITMAP)LoadImage(NULL, ".\\Picture\\ExitButton1.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					HBITMAP Button2 = (HBITMAP)LoadImage(NULL, ".\\Picture\\ExitButton2.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					if (lpdis->itemState & ODS_SELECTED)
						TransBlt(lpdis->hDC, 0, 0, 42, 20, Button2, 255, 0, 255);
					else
						TransBlt(lpdis->hDC, 0, 0, 42, 20, Button1, 255, 0, 255);
				}
				
				DeleteDC(hdcMem); 
			}

			return TRUE; 
		}
		case WM_COMMAND:
		{
			switch (LOWORD(wParam))
			{
				case IDC_LOGIN:
				{
					g_LoginPress = TRUE;
					//MessageBox(hDlg, "Login", "Login", MB_OK);
				} break;
				case IDC_EXIT:
				{
					EndDialog(hDlg, 0);
					PostQuitMessage(0);
				} break;
			}
		} break;
/*		case WM_LBUTTONDOWN:
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
*/		case WM_PAINT:
		{
			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hDlg, &ps);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Picture\\LogWindow.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			HDC backdc = CreateCompatibleDC(hdc);
			SelectObject(backdc, Background);
			BitBlt(hdc, ps.rcPaint.left,ps.rcPaint.top, ps.rcPaint.right-ps.rcPaint.left,ps.rcPaint.bottom-ps.rcPaint.top, backdc,ps.rcPaint.left,ps.rcPaint.top,SRCCOPY);
			EndPaint(hDlg, &ps);
/*			HDC hdc = GetDC(hDlg);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\LogWindow.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			HDC backdc = CreateCompatibleDC(hdc);
			SelectObject(backdc, Background);
			BitBlt(hdc, 0, 0, 313, 166, backdc, 0, 0, SRCCOPY);
			ReleaseDC(hDlg, hdc);*/
		} break;
	}

	return FALSE;
}
