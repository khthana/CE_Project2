// HangmanTutor.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "HangmanTutor.h"
#include "HangResult.h"

#include "stdlib.h"
#include "stdio.h"
#include "fstream.h"
#include "io.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CHangmanTutor dialog


CHangmanTutor::CHangmanTutor(CWnd* pParent /*=NULL*/)
	: CDialog(CHangmanTutor::IDD, pParent)
{
	//{{AFX_DATA_INIT(CHangmanTutor)
	m_stimes = _T("");
	m_svocab = _T("");
	//}}AFX_DATA_INIT
}

void CHangmanTutor::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CHangmanTutor)
	DDX_Control(pDX, IDC_VOCAB, m_cvocab);
	DDX_Control(pDX, IDC_MEAN, m_cmean);
	DDX_Control(pDX, IDC_TIMES, m_ctimes);
	DDX_Text(pDX, IDC_TIMES, m_stimes);
	DDX_Control(pDX, IDC_PICT, m_picture);
	DDX_Text(pDX, IDC_VOCAB, m_svocab);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CHangmanTutor, CDialog)
	//{{AFX_MSG_MAP(CHangmanTutor)
	ON_WM_CHAR()
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CHangmanTutor message handlers

BOOL CHangmanTutor::OnInitDialog()
{
	CDialog::OnInitDialog();

	histfile = "HistoryFile.txt";	// history file
	win = 0;
	lose = 0;
	exit = FALSE;
	ReadFile();						// read history file
	item = 0;
	srand((unsigned)1);
	InitGame();
	return TRUE;
}
	
void CHangmanTutor::ReadFile()
{
	ifstream file;
	file.open(histfile);	// open history file
	TCHAR s[1000] = "";
	CString line = "";
	int c = 1;
	int i = 0;
	
	while (!file.eof())
	{
		file.getline(s, 500);
		line = s;
		if (c == 1)
			list[i].vocab = line;
		else if (c == 2)
			list[i].time  = line;
		else if (c == 3)
			list[i].tmean = line;
		else if (c == 4)
			list[i].emean = line;
		else if (c == 5)
		{	i += 1;
			c = 0;
		}
		c += 1;
	}
	number = i;
	file.close();
}

void CHangmanTutor::InitGame()
{
	item = (int)(rand());
	while (item > number)
		item = (int)(rand());
	vocab = list[item].vocab;			// first vocab
	tmean = list[item].tmean;			// first thai meaning
	emean = list[item].emean;			// first english meaning
	guess = SetBlank(vocab);
	done = FALSE;
	turn = 9;							// turn for play
	m_svocab = SetString(guess);
	m_stimes = SetTimes(turn);
	InitUsed();

	m_ctimes.SetWindowText(m_stimes);
	m_cvocab.SetWindowText(m_svocab);
	m_cmean.SetWindowText(emean+"\r\n"+tmean);
	if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG09),_T("GIF")))
		m_picture.Draw();
}

CString CHangmanTutor::SetBlank(CString vocab)
{
	CString temp = "";
	int l = vocab.GetLength();
	for (int i=0; i<l; i++)
		temp += "_";
	return temp;
}

CString CHangmanTutor::SetString(CString vocab)
{
	CString newvocab = "";
	int l = vocab.GetLength();
	int i=0;
	for(i=0; i<l; i++)
		newvocab = newvocab + vocab[i] + ' ';
	newvocab.Delete(newvocab.GetLength()-1,1);

	return newvocab;
}

CString CHangmanTutor::SetTimes(int turn)
{
	CString temp = "";
	temp.Format("%d",turn);
	return temp;
}

void CHangmanTutor::InitUsed()
{
	for (int i=0; i<26; i++)
		used.ch[i] = ' ';
	used.i = 0;
}

void CHangmanTutor::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	if (((nChar >= 'a')&&(nChar <= 'z'))||((nChar >= 'A')&&(nChar <= 'Z')))
	{
		char ch = CHAR(nChar);
		if (used.ch[used.i-1] != ch)
			PlayGame(ch);
	}
	
	CDialog::OnChar(nChar, nRepCnt, nFlags);
}

void CHangmanTutor::PlayGame(char ch)
{
	if (!UsedChar(ch))
	{
		if (!CheckVocab(ch))
		{
			turn -= 1;
			m_stimes = SetTimes(turn);
			m_ctimes.SetWindowText(m_stimes);
			DrawHangman(turn);
		}
		else
		{
			m_svocab = SetString(guess);
			m_cvocab.SetWindowText(m_svocab);
		}
		used.ch[used.i] = ch;
		used.i += 1;
	}
	else
		MessageBox("Used Character","Hangman",MB_OK);

	if (guess.Find('_') == -1)	// win or lose
	{
		if (m_picture.Load(MAKEINTRESOURCE(IDR_WIN),_T("GIF")))
			m_picture.Draw();
		MessageBox("You win!!!","Hangman",MB_OK);
		win += 1;
		done = TRUE;
	}
	else if (turn == 0)
	{
		m_svocab = vocab;
		m_cvocab.SetWindowText(m_svocab);
		if (m_picture.Load(MAKEINTRESOURCE(IDR_LOSE),_T("GIF")))
			m_picture.Draw();
		MessageBox("You lose!!!","Hangman",MB_OK);
		lose += 1;
		done = TRUE;
	}

	if (done)	
	{
		if (MessageBox("Do you want to play again?","Hangman",MB_YESNO) == IDYES)
			InitGame();
		else
		{
			OnClose();
			exit = TRUE;
		}
	}
}

bool CHangmanTutor::UsedChar(char ch)	// get char in array
{
	for (int i=0; i<used.i; i++)
		if (used.ch[i] == ch)
			return TRUE;
	return FALSE;
}

bool CHangmanTutor::CheckVocab(char ch)	
{								// check input in vocab 
	bool Found = FALSE;	
	CString temp = ch;
	temp.MakeLower();
	ch = temp[0];
	int l = vocab.GetLength();
	for (int i=0; i<l; i++)
		if (guess[i] == '_')
			if (vocab[i] == ch)
			{
				guess.Delete(i);
				guess.Insert(i,ch);
				Found = TRUE;
			}
	return Found;
}

void CHangmanTutor::DrawHangman(int turn)
{
	switch (turn)
	{
		case 0: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG00),_T("GIF")))
				m_picture.Draw();
			break;
		case 1: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG01),_T("GIF")))
				m_picture.Draw();
			break;
		case 2: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG02),_T("GIF")))
				m_picture.Draw();
			break;
		case 3: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG03),_T("GIF")))
				m_picture.Draw();
			break;
		case 4: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG04),_T("GIF")))
				m_picture.Draw();
			break;
		case 5: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG05),_T("GIF")))
				m_picture.Draw();
			break;
		case 6: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG06),_T("GIF")))
				m_picture.Draw();
			break;
		case 7: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG07),_T("GIF")))
				m_picture.Draw();
			break;
		case 8: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG08),_T("GIF")))
				m_picture.Draw();
			break;
		case 9: 
			if (m_picture.Load(MAKEINTRESOURCE(IDR_HANG09),_T("GIF")))
				m_picture.Draw();
			break;
	}
}

void CHangmanTutor::OnOK() 
{
}

void CHangmanTutor::OnCancel() 
{
}

void CHangmanTutor::OnClose() 
{
	CHangResult Result(win, lose);
	Result.DoModal();
	CDialog::OnOK();
}

BOOL CHangmanTutor::PreTranslateMessage(MSG* pMsg) 
{
	if (pMsg->message == WM_KEYDOWN)	// if keydown
	{
		if (TranslateMessage(pMsg)!=0)	// translate WM_CHAR
			WindowProc(WM_CHAR,pMsg->wParam,pMsg->lParam);
	}

	if (!exit)
		return CDialog::PreTranslateMessage(pMsg);

	return TRUE;
}

int CHangmanTutor::GetNumber()
{
	return number;
}
