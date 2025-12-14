#include "Global_Func.h"
#include "cLayerWindow.h"
#include "cChatDialog.h"
#include "resource.h"

HWND g_hWndChatMsg=NULL;

cChatDialog::cChatDialog()
{
	m_hWndChat = NULL;
	m_hWndChatMessage = NULL;
	m_hWndParent = NULL;
}

cChatDialog::ShowDialog(HINSTANCE hInst, int IDD_DLG1, int IDD_DLG2, HWND hWndParent)
{
	if (m_hWndChat != NULL)
		return FALSE;
	if (m_hWndChatMessage != NULL)
		return FALSE;

	m_hWndChat = CreateDialog(hInst, MAKEINTRESOURCE(IDD_DLG1), hWndParent, (DLGPROC)ChatDlgProc);
	m_hWndChatMessage = CreateDialog(hInst, MAKEINTRESOURCE(IDD_DLG2), hWndParent, (DLGPROC)ChatMessageDlgProc);

	if (m_hWndChat == NULL)
		return FALSE;
	if (m_hWndChatMessage == NULL)
		return FALSE;
	
	cWindowLayer WinLayer;
	WinLayer.AddWindowLayer(m_hWndChatMessage);
	WinLayer.SetWindowAlpha(200);
	g_hWndChatMsg = m_hWndChatMessage;
	SetWindowPos(GetDlgItem(g_hWndChatMsg, IDC_LISTMESSAGE), HWND_TOP, 0, 0, 600, 100, SWP_SHOWWINDOW);

	RECT rect;
	GetWindowRect(hWndParent, &rect);
	int XPos = rect.left + 5; //((rect.right - rect.left) - 600);
	int YPos = rect.bottom - 128; //((rect.bottom - rect.top) - 24)/2;		
	SetWindowPos(m_hWndChat, HWND_TOP, XPos, YPos+100, 600, 24, SWP_SHOWWINDOW);
	SetWindowPos(m_hWndChatMessage, HWND_TOP, XPos, YPos, 600, 100, SWP_SHOWWINDOW);
	HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\dialog_bg.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	HRGN rgn = CreateRegion(m_hWndChat, Background, 600, 24, 255, 0, 255);
	SetWindowRgn(m_hWndChat, rgn, TRUE);
	m_hWndParent = hWndParent;
	SendMessage(GetDlgItem(m_hWndChat,IDC_EDITMESSAGE),EM_LIMITTEXT,128,0);
	ShowWindow(m_hWndChat, SW_SHOW);
	UpdateWindow(m_hWndChat);
	ShowWindow(m_hWndChatMessage, SW_SHOW);
	UpdateWindow(m_hWndChatMessage);

	return TRUE;
}

void cChatDialog::AddMessage(char *Message)
{
	ListBox_InsertString(GetDlgItem(m_hWndChatMessage, IDC_LISTMESSAGE), -1, Message);
	int Sel = ListBox_GetCount(GetDlgItem(m_hWndChatMessage, IDC_LISTMESSAGE));
	SendMessage(GetDlgItem(m_hWndChatMessage, IDC_LISTMESSAGE), LB_SETCURSEL, Sel-1, 0); 
}
HWND cChatDialog::GethWndChat()
{
	return m_hWndChat;
}

HWND cChatDialog::GethWndChatMsgDlg()
{
	return m_hWndChatMessage;
}

char* cChatDialog::GetMessage()
{
	char* Str = NULL;
	Edit_GetText(GetDlgItem(m_hWndChat, IDC_EDITMESSAGE), Str, 128);
	return Str;
}

LRESULT CALLBACK ChatDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
		case WM_INITDIALOG:
		{
			//Set Window Cursor
			HCURSOR Normal_Cursor = LoadCursorFromFile(".\\Cursor\\Normal_Select.ani");
			SetClassLong(hDlg, GCL_HCURSOR, (LONG) Normal_Cursor);
			MoveWindow(GetDlgItem(hDlg, IDC_EDITMESSAGE), 108, 4, 461, 16, TRUE);
		} break;
		case WM_MOVE:
		{
			int XPos = (int)(short)LOWORD(lParam);
			int YPos = (int)(short)HIWORD(lParam);
			MoveWindow(g_hWndChatMsg, XPos, YPos-100, 600, 100, TRUE);
		} break;
/*		case WM_COMMAND:
		{
			switch (LOWORD(wParam))
			{
				case IDM_ENTERTEXT:
				{
					MessageBox(hDlg, "FDHFH", "FHF", MB_OK);
					char St[50];
					GetDlgItemText(hDlg, IDC_EDITMESSAGE, St, 50);
					if (strcmp(St, "") != 0)
					{
						ListBox_InsertString(GetDlgItem(g_hWndChatMsg, IDC_LISTMESSAGE), 0, St);
						SetDlgItemText(hDlg, IDC_EDITMESSAGE, "");
					}
				} break;
			}
		} break;
*/		case WM_LBUTTONDOWN:
		{
			int YPos = HIWORD(lParam);

			SendMessage(hDlg, WM_NCLBUTTONDOWN, HTCAPTION,NULL);
		} break;
		case WM_CTLCOLOREDIT:
		{
			HDC hdc = (HDC)wParam;
			SetBkColor(hdc, RGB(240,240,240));
			SetTextColor(hdc, RGB(0,0,0));
			return (long)CreateSolidBrush(RGB(240,240,240));
		} break;
		case WM_PAINT:
		{
			HDC hdc = GetDC(hDlg);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\dialog_bg.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			TransBlt(hdc, 0, 0, 600, 24, Background, 255, 0, 255);
			ReleaseDC(hDlg, hdc);
/*			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hDlg, &ps);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\dialog_bg.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			HDC backdc = CreateCompatibleDC(hdc);
			SelectObject(backdc, Background);
			//BitBlt(hdc, ps.rcPaint.left,ps.rcPaint.top, ps.rcPaint.right-ps.rcPaint.left,ps.rcPaint.bottom-ps.rcPaint.top, backdc,ps.rcPaint.left,ps.rcPaint.top,SRCCOPY);
			EndPaint(hDlg, &ps);
*/		} break;
	}

	return FALSE;
}

LRESULT CALLBACK ChatMessageDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
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

			SendMessage(hDlg, WM_NCLBUTTONDOWN, HTCAPTION,NULL);
		} break;
/*		case WM_CTLCOLORSTATIC:
		{
			HDC hdc = (HDC)wParam;
			SetBkColor(hdc, RGB(255,255,255));
			SetTextColor(hdc, RGB(0,0,0));
			return (long)CreateSolidBrush(RGB(255,255,255));
		} break;
*/		case WM_PAINT:
		{
/*			HDC hdc = GetDC(hDlg);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\dialog_bg.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			TransBlt(hdc, 0, 0, 600, 24, Background, 255, 0, 255);
			ReleaseDC(hDlg, hdc);
/*			PAINTSTRUCT ps;
			HDC hdc = BeginPaint(hDlg, &ps);
			HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\dialog_bg.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
			HDC backdc = CreateCompatibleDC(hdc);
			SelectObject(backdc, Background);
			//BitBlt(hdc, ps.rcPaint.left,ps.rcPaint.top, ps.rcPaint.right-ps.rcPaint.left,ps.rcPaint.bottom-ps.rcPaint.top, backdc,ps.rcPaint.left,ps.rcPaint.top,SRCCOPY);
			EndPaint(hDlg, &ps);
*/		} break;
	}

	return FALSE;
}

