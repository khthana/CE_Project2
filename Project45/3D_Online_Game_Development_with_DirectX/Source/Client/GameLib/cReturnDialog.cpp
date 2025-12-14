#include "cReturnDialog.h"

cReturnDialog* g_ReturnDialog;

cReturnDialog::cReturnDialog()
{
	m_hWnd			= NULL;
	m_hWndParent	= NULL;

	m_IsClickReturn	= FALSE;

	g_ReturnDialog	= this;
}

BOOL cReturnDialog::Create(HINSTANCE hInst, int IDD_DIALOG, HWND hWndParent)
{
	if (m_hWnd != NULL)
		return FALSE;

	m_hWnd = CreateDialog(hInst, MAKEINTRESOURCE(IDD_DIALOG), hWndParent, (DLGPROC)ReturnDlgProc);

	if (m_hWnd == NULL)
		return FALSE;

	RECT rect;
	GetClientRect(hWndParent, &rect);
	int XPos, YPos;
	XPos = (rect.right-rect.left-280)/2;
	YPos = (rect.bottom-rect.top)*60/100;

	SetWindowPos(m_hWnd, HWND_TOP, XPos, YPos, 280, 120, SWP_HIDEWINDOW);
	HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\win_msgbox.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	HRGN rgn = CreateRegion(m_hWnd, Background, 280, 120, 255, 0, 255);
	SetWindowRgn(m_hWnd, rgn, TRUE);
	m_hWndParent = hWndParent;

//	ShowWindow(m_hWnd, SW_SHOW);
//	UpdateWindow(m_hWnd);

	return TRUE;
}

void cReturnDialog::Show()
{
	RECT rect;
	GetClientRect(m_hWndParent, &rect);
	int XPos, YPos;
	XPos = (rect.right-rect.left-280)/2;
	YPos = (rect.bottom-rect.top)*60/100;

	SetWindowPos(m_hWnd, HWND_TOP, XPos, YPos, 280, 120, SWP_SHOWWINDOW);
	//ShowWindow(m_hWnd, SW_SHOWNORMAL);

	m_IsClickReturn = FALSE;
}

void cReturnDialog::Hide()
{
	ShowWindow(m_hWnd, SW_HIDE);
	m_IsClickReturn = FALSE;
}

LRESULT CALLBACK ReturnDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		case WM_INITDIALOG:
		{
			//Set Window Cursor
			HCURSOR Normal_Cursor = LoadCursorFromFile(".\\Cursor\\Normal_Select.ani");
			SetClassLong(hDlg, GCL_HCURSOR, (LONG) Normal_Cursor);
			MoveWindow(GetDlgItem(hDlg, IDC_RETURN), 30, 31, 221, 20, TRUE);
			MoveWindow(GetDlgItem(hDlg, IDC_EXIT), 30, 61, 221, 20, TRUE);
		} break;
		case WM_LBUTTONDOWN:
		{
			int YPos = HIWORD(lParam);

			if ((YPos >= 0)&&(YPos <= 17))
			{
				SendMessage(hDlg, WM_NCLBUTTONDOWN, HTCAPTION,NULL);
			}
		} break;
        case WM_DRAWITEM: 
		{			
			LPDRAWITEMSTRUCT lpdis = (LPDRAWITEMSTRUCT) lParam; 
			if (lpdis->CtlType == ODT_BUTTON)
			{
				HDC hdcMem = CreateCompatibleDC(lpdis->hDC);

				if (lpdis->CtlID == IDC_RETURN)
				{
					HBITMAP Button1 = (HBITMAP)LoadImage(NULL, ".\\Skin\\esc_04a.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					HBITMAP Button2 = (HBITMAP)LoadImage(NULL, ".\\Skin\\esc_04c.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					if (lpdis->itemState & ODS_SELECTED)
						TransBlt(lpdis->hDC, 0, 0, 221, 20, Button2, 255, 0, 255);
					else
						TransBlt(lpdis->hDC, 0, 0, 221, 20, Button1, 255, 0, 255);
				}
				else
				if (lpdis->CtlID == IDC_EXIT)
				{
					HBITMAP Button1 = (HBITMAP)LoadImage(NULL, ".\\Skin\\esc_03a.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					HBITMAP Button2 = (HBITMAP)LoadImage(NULL, ".\\Skin\\esc_03c.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
					if (lpdis->itemState & ODS_SELECTED)
						TransBlt(lpdis->hDC, 0, 0, 221, 20, Button2, 255, 0, 255);
					else
						TransBlt(lpdis->hDC, 0, 0, 221, 20, Button1, 255, 0, 255);
				}
				
				DeleteDC(hdcMem); 
			}

			return TRUE; 
		}
		case WM_COMMAND:
		{
			switch (LOWORD(wParam))
			{
				case IDC_RETURN:
				{
					g_ReturnDialog->SetIsClickReturn(TRUE);
				} break;
				case IDC_EXIT:
				{
					PostQuitMessage(0);
				} break;
			}
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