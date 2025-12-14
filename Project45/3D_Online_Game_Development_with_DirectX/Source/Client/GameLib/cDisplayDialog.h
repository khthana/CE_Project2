#ifndef _CDISPLAYDIALOG_H_
#define _CDISPLAYDIALOG_H_

#include "Core_Global.h"

class cDisplayDialog
{
	private:
		HWND m_hWnd;
		HWND m_hWndParent;

		HBITMAP m_Background1;
		HBITMAP m_Background2;
		HBITMAP m_Button1;
		HBITMAP m_Button2;

		int m_Hp;
		int m_HpMax;
		int m_Mp;
		int m_MpMax;
		int m_Level;
		long m_Money;
		char m_Job[15];
		char m_Name[10];
		long m_Exp;
		
		BOOL m_FullDialog;
	public:
		cDisplayDialog();

		BOOL ShowDialog(HINSTANCE hInst, int IDD_DLG, HWND hWndParent);
		BOOL ChangeDialog();

		void SetAllValue(int Hp, int HpMax, int Mp, int MpMax, int Level, long Money, char *Job, char *Name);
		void SetExp(long Exp);
		void UpdateProgress(HDC hdc);
		void UpdateData();
		BOOL GetDialogStatus();
		
		char* GetName();
		char* GetJob();
		int GetHp();
		int GetHpMax();
		int GetMp();
		int GetMpMax();
		long GetMoney();
		int GetLevel();
		long GetExp();

		HBITMAP GetBackground();
		HBITMAP GetButton1();
		HBITMAP GetButton2();

		HWND GethWnd();
};

LRESULT CALLBACK DisplayDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);

#endif

