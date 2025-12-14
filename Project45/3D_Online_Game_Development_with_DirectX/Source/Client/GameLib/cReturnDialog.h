#ifndef _CRETURNDIALOG_H_
#define _CRETURNDIALOG_H_

#include "Core_Global.h"

class cReturnDialog
{
	private:
		HWND	m_hWnd;
		HWND	m_hWndParent;

		BOOL	m_IsClickReturn;
	public:
		cReturnDialog();

		BOOL Create(HINSTANCE hInst, int IDD_DIALOG, HWND hWndParent);
		
		void Hide();
		void Show();

		void SetIsClickReturn(BOOL flag)	{m_IsClickReturn = flag;}
		BOOL GetIsClickReturn()				{return m_IsClickReturn;}
};

LRESULT CALLBACK ReturnDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);

#endif


