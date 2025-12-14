// TestDlg.h : header file
//

#if !defined(AFX_TESTDLG_H__B9F15E1E_1E07_4779_BA33_A562E9CCD754__INCLUDED_)
#define AFX_TESTDLG_H__B9F15E1E_1E07_4779_BA33_A562E9CCD754__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CTestDlgAutoProxy;

/////////////////////////////////////////////////////////////////////////////
// CTestDlg dialog

class CTestDlg : public CDialog
{
	DECLARE_DYNAMIC(CTestDlg);
	friend class CTestDlgAutoProxy;

// Construction
public:

	void GetFile(CString Name,int *PointerImage);

	double *weightpt,*inputpt,*resultpt;	//point at weight and input table
	double *targetpt,*opkpt,*testpt;
	double nlearn,serror;				// learning ratio
	int numip,numdata,numop,seta;		//number of input(row) ,data(collumn),output(number of object)
	int numlayer,numnode,inputth;		//number of hidden layer and node in layer
	long int loopcount1,loopcount2,sumloop;




	CTestDlg(CWnd* pParent = NULL);	// standard constructor
	virtual ~CTestDlg();

// Dialog Data
	//{{AFX_DATA(CTestDlg)
	enum { IDD = IDD_TEST_DIALOG };
	CProgressCtrl	m_progress1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTestDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CTestDlgAutoProxy* m_pAutoProxy;
	HICON m_hIcon;

	BOOL CanExit();

	// Generated message map functions
	//{{AFX_MSG(CTestDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnClose();
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnCreateNetwork();
	afx_msg void OnSaveNetwork();
	afx_msg void OnSaveResult();
	afx_msg void OnLoadNetwork();
	afx_msg void OnLoadDatafortrain();
	afx_msg void OnRunTraining();
	afx_msg void OnRunTest();
	afx_msg void OnCreatenetwork();
	afx_msg void OnFindobj();
	afx_msg void OnCreateData();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TESTDLG_H__B9F15E1E_1E07_4779_BA33_A562E9CCD754__INCLUDED_)
