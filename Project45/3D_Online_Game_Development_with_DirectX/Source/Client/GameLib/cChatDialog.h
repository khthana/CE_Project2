#ifndef _CCHATDIALOG_H_
#define _CCHATDIALOG_H_

class cChatDialog
{
	private:
		HWND m_hWndChat;
		HWND m_hWndChatMessage;
		HWND m_hWndParent;
	public:
		cChatDialog();

		BOOL ShowDialog(HINSTANCE hInst, int IDD_DLG1, int IDD_DLG2, HWND hWndParent);

		void AddMessage(char *Message);
		char* GetMessage();

		HWND GethWndChat();
		HWND GethWndChatMsgDlg();
};

LRESULT CALLBACK ChatDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);
LRESULT CALLBACK ChatMessageDlgProc(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);

#endif

