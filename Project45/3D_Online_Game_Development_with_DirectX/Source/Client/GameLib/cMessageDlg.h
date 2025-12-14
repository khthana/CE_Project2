#ifndef _CMESSAGEDLG_H_
#define _CMESSAGEDLG_H_

class cMessageDlg
{
	private:
		HWND m_hWnd;
		HWND m_hWndParent;
		char m_Message[80];

	public:
		cMessageDlg();

		BOOL ShowDialog(HINSTANCE hInst, int IDD_DIALOG, HWND hWndParent);
		BOOL Close();

		BOOL Show();
		BOOL Hide();

		char* GetMessage();
		void SetMessage(int ID_STATIC, char *Msg);

		HWND GethWnd();
		HWND GethWndParent();
};

LRESULT CALLBACK MessageDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);

#endif