#if !defined(AFX_HANGMANTUTOR_H__0BBC3E9B_F402_41A6_BF74_C6577B061461__INCLUDED_)
#define AFX_HANGMANTUTOR_H__0BBC3E9B_F402_41A6_BF74_C6577B061461__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// HangmanTutor.h : header file
//

#include "PictureEx.h"

/////////////////////////////////////////////////////////////////////////////
// CHangmanTutor dialog

class CHangmanTutor : public CDialog
{
// Construction
public:
	CHangmanTutor(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CHangmanTutor)
	enum { IDD = IDD_GAME_DIALOG };
	CStatic	m_cvocab;
	CEdit	m_cmean;
	CStatic	m_ctimes;
	CString	m_stimes;
	CString	m_svocab;
	CPictureEx	m_picture;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CHangmanTutor)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

public:
	int GetNumber();

private:
	// data member
	char* histfile;		// history file name
	struct word
	{
		CString vocab;
		CString time;
		CString tmean;
		CString emean;
	};
	word list[2000];	// vocab in history file
	int  item;			

	struct input
	{
		char ch[26];
		int i;
	};
	input used;		// used input

	int win;		// number of win
	int lose;		// number of lose

	int number;		// number of vocabulary in history file
	int turn;
	bool done;		// end game
	bool exit;		// want to exit game
	CString vocab;	// for vocabulary
	CString tmean;	// for thai meaning
	CString emean;	// for english meaning
	CString guess;	// for guess vocabulary
	
	// function
	void ReadFile();			// read history file to data memeber
	void InitUsed();			// initialize used (input)
	void InitGame();			// initialize data member in game
	void DrawHangman(int turn);	// draw picture (hangman) up to turn
	void PlayGame(char ch);	
	bool UsedChar(char ch);		// check input
	bool CheckVocab(char ch);	// check input in vocab
	CString SetString(CString vocab);	// set string to display
	CString SetTimes(int turn);			// change int to cstring
	CString SetBlank(CString vocab);	// set string to display
	
// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CHangmanTutor)
	virtual BOOL OnInitDialog();
	afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnClose();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_HANGMANTUTOR_H__0BBC3E9B_F402_41A6_BF74_C6577B061461__INCLUDED_)
