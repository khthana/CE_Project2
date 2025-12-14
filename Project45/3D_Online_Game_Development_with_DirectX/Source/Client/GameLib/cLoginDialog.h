#ifndef _CLOGINDIALOG_H_
#define _CLOGINDIALOG_H_

class cLoginDialog
{
	private:
		HWND m_hWnd;
		HWND m_hWndParent;

	public:
		cLoginDialog();

		BOOL Create(HINSTANCE hInst, int IDD_DIALOG, HWND hWndParent);
		BOOL Close();

		HWND GethWnd();

		BOOL LoginButtonPress();
};

LRESULT CALLBACK LoginDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);

#endif
