#include "cDisplayDialog.h"

cDisplayDialog* g_DisplayDialog;

cDisplayDialog::cDisplayDialog()
{
	m_hWnd = NULL;
	m_hWndParent = NULL;

	strcpy(m_Job, "");
	strcpy(m_Name, "");

	m_FullDialog = TRUE;

	g_DisplayDialog = this;
}

BOOL cDisplayDialog::ShowDialog(HINSTANCE hInst, int IDD_DLG, HWND hWndParent)
{
	if (m_hWnd != NULL)
		return FALSE;

	m_hWnd = CreateDialog(hInst, MAKEINTRESOURCE(IDD_DLG), hWndParent, (DLGPROC)DisplayDlgProc);

	if (m_hWnd == NULL)
		return FALSE;
	
	if (!ChangeDialog())
		return FALSE;

	m_hWndParent = hWndParent;

	//MoveWindow(GetDlgItem(m_hWnd, IDC_CHANGE), 265, 3, 11, 11, TRUE);
	//MoveWindow(GetDlgItem(m_hWnd, IDC_SYSTEM), 4, 3, 11, 11, TRUE);
	//ShowWindow(GetDlgItem(m_hWnd, IDC_SYSTEM), SW_HIDE);
	//ShowWindow(GetDlgItem(m_hWnd, IDC_CHANGE), SW_HIDE);
	MoveWindow(m_hWnd, 0, 0, 280, 34, TRUE);
	
	ShowWindow(m_hWnd, SW_SHOW);
	UpdateWindow(m_hWnd);

	m_Background1 = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\basewin_bg1.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	m_Background2 = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\basewin_mini1.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	m_Button1 = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\sys_base_off.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
	m_Button2 = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\sys_mini_off.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);

	return TRUE;
}

BOOL cDisplayDialog::ChangeDialog()
{
	if (m_hWnd == NULL)
		return FALSE;

	RECT rect;
	GetWindowRect(m_hWnd, &rect);
	POINT Point;
	Point.x = rect.left;
	Point.y = rect.top;
	ScreenToClient(m_hWndParent, &Point);
	rect.left = Point.x;
	rect.top = Point.y;

	if (!m_FullDialog)
	{
		m_FullDialog = TRUE;
		MoveWindow(m_hWnd, rect.left, rect.top, 280, 120, FALSE);
		HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\basewin_bg.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
		HRGN rgn = CreateRegion(m_hWnd, Background, 280, 120, 255, 0, 255);
		SetWindowRgn(m_hWnd, rgn, TRUE);
		InvalidateRect(m_hWnd, NULL, FALSE);
		DeleteObject(Background);
		DeleteObject(rgn);
	}
	else
	{
		m_FullDialog = FALSE;
		MoveWindow(m_hWnd, rect.left, rect.top, 280, 34, FALSE);
		HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\basewin_mini.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE);
		HRGN rgn = CreateRegion(m_hWnd, Background, 280, 34, 255, 0, 255);
		SetWindowRgn(m_hWnd, rgn, TRUE);
		InvalidateRect(m_hWnd, NULL, FALSE);
		DeleteObject(Background);
		DeleteObject(rgn);
	}

	return TRUE;
}

void cDisplayDialog::SetAllValue(int Hp, int HpMax, int Mp, int MpMax, int Level, long Money, char *Job, char *Name)
{
	m_Hp = Hp;
	m_HpMax = HpMax;
	m_Mp = Mp;
	m_MpMax = MpMax;
	m_Level = Level;
	m_Money = Money;

	strcpy(m_Job, Job);
	strcpy(m_Name, Name);

	//InvalidateRect(m_hWnd, NULL, TRUE);
}

void cDisplayDialog::SetExp(long Exp)
{
	m_Exp = Exp;
}

long cDisplayDialog::GetExp()
{
	return m_Exp;
}

HBITMAP cDisplayDialog::GetBackground()
{
	return m_Background1;
}

HBITMAP cDisplayDialog::GetButton1()
{
	return m_Button1;
}

HBITMAP cDisplayDialog::GetButton2()
{
	return m_Button2;
}

void cDisplayDialog::UpdateData()
{
	HDC hdc = GetDC(m_hWnd);
	if (hdc == NULL)
		return;
	HDC BackBuffer = CreateCompatibleDC(hdc);
	if (BackBuffer == NULL)
		return;
	if (m_FullDialog)
	{
		HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\basewin_bg1.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		if (Background == NULL)
		{
			HBITMAP Background = m_Background1;
			if (Background == NULL)
				return;
		}
		SelectObject(BackBuffer, Background);
		UpdateProgress(BackBuffer);
		char St[30];
		HFONT Font = CreateFont(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
			VARIABLE_PITCH | FF_SWISS, "MS Sans Serif");
		if (Font == NULL)
			return;
		SelectObject(BackBuffer, Font);
		SetBkMode(BackBuffer, TRANSPARENT);
		sprintf(St, "ข้อมูลพื้นฐาน");
		TextOut(BackBuffer, 17, 1, St, strlen(St));
		sprintf(St, "%s", m_Name);
		TextOut(BackBuffer, 10, 20, St, strlen(St));
		sprintf(St, "%s", m_Job);
		TextOut(BackBuffer, 10, 35, St, strlen(St));
		sprintf(St, "HP");
		TextOut(BackBuffer, 90, 30, St, strlen(St));
		sprintf(St, "%d / %d", m_Hp, m_HpMax);
		TextOut(BackBuffer, 130, 30, St, strlen(St));
		sprintf(St, "MP");
		TextOut(BackBuffer, 90, 52, St, strlen(St));
		sprintf(St, "%d / %d", m_Mp, m_MpMax);
		TextOut(BackBuffer, 130, 52, St, strlen(St));
		sprintf(St, "Base Lv. %d", m_Level);
		TextOut(BackBuffer, 15, 72, St, strlen(St));
		sprintf(St, "Job Lv. %d", m_Level);
		TextOut(BackBuffer, 15, 84, St, strlen(St));
		SelectObject(BackBuffer, (HBRUSH)GetStockObject(WHITE_BRUSH));
		SelectObject(BackBuffer, CreatePen(PS_SOLID, 1, RGB(150,150,200)));
		Rectangle(BackBuffer, 75, 77, 190, 83);
		Rectangle(BackBuffer, 75, 88, 190, 94);
		SelectObject(BackBuffer, CreateSolidBrush(RGB(180,180,230)));
		Rectangle(BackBuffer, 75, 77, 75+((190-75)*(m_Exp)/100), 83);
		Rectangle(BackBuffer, 75, 88, 75+((190-75)*50/100), 94);
		sprintf(St, "Weight : 1338 / 2730  Zeny : %ld", m_Money);
		TextOut(BackBuffer, 8, 103, St, strlen(St));
		if (BitBlt(hdc, 0, 0, 280, 120, BackBuffer, 0, 0, SRCCOPY) == 0)
			return;
		DeleteObject(Background);
		DeleteObject(Font);
	}
	else
	{
		HBITMAP Background = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\basewin_mini1.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		if (Background == NULL)
		{
			HBITMAP Background = m_Background2;
			if (Background == NULL)
				return;
		}
		SelectObject(BackBuffer, Background);
		char St[30];
		strcpy(St, m_Name);
		HFONT Font = CreateFont(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
			VARIABLE_PITCH | FF_SWISS, "MS Sans Serif");
		if (Font == NULL)
			return;
		SelectObject(BackBuffer, Font);
		SetBkMode(BackBuffer, TRANSPARENT);
		TextOut(BackBuffer, 17, 1, St, strlen(St));
		SetTextAlign(BackBuffer, TA_RIGHT);
		sprintf(St, "Lv. %d / %s / Lv. 1 / Exp. 50 %%", m_Level,
				m_Job
				);
		TextOut(BackBuffer, 260, 2, St, strlen(St));
		sprintf(St, "HP  %d / %d  |  MP  %d / %d  |  %ld  Z", m_Hp, 
			m_HpMax, m_Mp, 
			m_MpMax, m_Money);
		TextOut(BackBuffer, 276, 19, St, strlen(St));
		if (BitBlt(hdc, 0, 0, 280, 34, BackBuffer, 0, 0, SRCCOPY) == 0)
			return;
		DeleteObject(Background);
		DeleteObject(Font);
	}
//	ReleaseDC(m_hWnd, BackBuffer);
	DeleteDC(BackBuffer);
//	DeleteObject(BackBuffer);
	ReleaseDC(m_hWnd, hdc);
}

void cDisplayDialog::UpdateProgress(HDC hdc)
{
	//HP
	int Ratio = (m_Hp*100) / m_HpMax;
	int FullPixel = 85 * Ratio / 100;
	int Pixel = 0;
	HBITMAP ProgressLeft, ProgressMid, ProgressRight;
	if (Ratio > 30)
	{
		ProgressLeft = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzeblue_left.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		TransBlt(hdc, 110, 22, 4, 8, ProgressLeft, 255, 0, 255);
		Pixel += 4;
		ProgressMid = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzeblue_mid.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		while (FullPixel-Pixel > 4)
		{
			if (FullPixel-Pixel - 1 >= 4)
			{
				TransBlt(hdc, 110+Pixel, 22, 1, 8, ProgressMid, 255, 0, 255);
				Pixel += 1;
			}
		}
		ProgressRight = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzeblue_right.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		TransBlt(hdc, 110+Pixel, 22, 4, 8, ProgressRight, 255, 0, 255);
	}
	else if ((Ratio <= 30) && ( Ratio > 0))
	{
		ProgressLeft = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzered_left.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		ProgressMid = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzered_mid.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		ProgressRight = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzered_right.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		if (FullPixel <= 8)
		{
			TransBlt(hdc, 110, 22, 4, 8, ProgressLeft, 255, 0, 255);
			TransBlt(hdc, 110+4, 22, 4, 8, ProgressRight, 255, 0, 255);
		}
		else
		{
			TransBlt(hdc, 110, 22, 4, 8, ProgressLeft, 255, 0, 255);
			Pixel += 4;
			while (FullPixel-Pixel > 4)
			{
				if (FullPixel-Pixel - 1 >= 4)
				{
					TransBlt(hdc, 110+Pixel, 22, 1, 8, ProgressMid, 255, 0, 255);
					Pixel += 1;
				}
			}
			TransBlt(hdc, 110+Pixel, 22, 4, 8, ProgressRight, 255, 0, 255);
		}
		
	}
	DeleteObject(ProgressLeft);
	DeleteObject(ProgressMid);
	DeleteObject(ProgressRight);
	//MP
	Ratio = (m_Mp*100) / m_MpMax;
	FullPixel = 85 * Ratio / 100;
	Pixel = 0;
	if (Ratio > 30)
	{
		ProgressLeft = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzeblue_left.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		TransBlt(hdc, 110, 43, 4, 8, ProgressLeft, 255, 0, 255);
		Pixel += 4;
		ProgressMid = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzeblue_mid.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		while (FullPixel-Pixel > 4)
		{
			if (FullPixel-Pixel - 1 >= 4)
			{
				TransBlt(hdc, 110+Pixel, 43, 1, 8, ProgressMid, 255, 0, 255);
				Pixel += 1;
			}
		}
		ProgressRight = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzeblue_right.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		TransBlt(hdc, 110+Pixel, 43, 4, 8, ProgressRight, 255, 0, 255);
	}
	else if ((Ratio <= 30) && ( Ratio > 0))
	{
		ProgressLeft = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzered_left.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		ProgressMid = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzered_mid.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		ProgressRight = (HBITMAP)LoadImage(NULL, ".\\Skin\\basic_interface\\gzered_right.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE|LR_CREATEDIBSECTION|LR_DEFAULTSIZE|LR_SHARED);
		if (FullPixel <= 8)
		{
			TransBlt(hdc, 110, 43, 4, 8, ProgressLeft, 255, 0, 255);
			TransBlt(hdc, 110+4, 43, 4, 8, ProgressRight, 255, 0, 255);
		}
		else
		{
			TransBlt(hdc, 110, 43, 4, 8, ProgressLeft, 255, 0, 255);
			Pixel += 4;
			while (FullPixel-Pixel > 4)
			{
				if (FullPixel-Pixel - 1 >= 4)
				{
					TransBlt(hdc, 110+Pixel, 43, 1, 8, ProgressMid, 255, 0, 255);
					Pixel += 1;
				}
			}
			TransBlt(hdc, 110+Pixel, 43, 4, 8, ProgressRight, 255, 0, 255);
		}
		
	}
	DeleteObject(ProgressLeft);
	DeleteObject(ProgressMid);
	DeleteObject(ProgressRight);
}

BOOL cDisplayDialog::GetDialogStatus()
{
	return m_FullDialog;
}

char* cDisplayDialog::GetName()
{
	return m_Name;
}

char* cDisplayDialog::GetJob()
{
	return m_Job;
}

int cDisplayDialog::GetHp()
{
	return m_Hp;
}

int cDisplayDialog::GetHpMax()
{
	return m_HpMax;
}

int cDisplayDialog::GetMp()
{
	return m_Mp;
}

int cDisplayDialog::GetMpMax()
{
	return m_MpMax;
}

long cDisplayDialog::GetMoney()
{
	return m_Money;
}

int cDisplayDialog::GetLevel()
{
	return m_Level;
}

HWND cDisplayDialog::GethWnd()
{
	return m_hWnd;
}

LRESULT CALLBACK DisplayDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
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
			int XPos = LOWORD(lParam);
			int YPos = HIWORD(lParam);

			if (((XPos <= 265+11)&&(XPos >= 265))&&((YPos <= 3+11)&&(YPos >= 3)))
				g_DisplayDialog->ChangeDialog();
			else
				SendMessage(hDlg, WM_NCLBUTTONDOWN, HTCAPTION,NULL);
		} break;
		case WM_CTLCOLORSTATIC:
		{
			HDC hdc = (HDC)wParam;
			SetBkColor(hdc, RGB(255,255,255));
			SetTextColor(hdc, RGB(0,0,0));
			return (long)GetStockObject(NULL_BRUSH);//CreateSolidBrush(RGB(255,255,255));
		} break;
	}

	return FALSE;
}