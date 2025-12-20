// cvisionDlg.h : header file
//
#include "cvapp.h"
#include "CCslider.h"

#if !defined(AFX_CVISIONDLG_H__2C793B38_8792_4A21_94D3_6E0F1FA51F54__INCLUDED_)
#define AFX_CVISIONDLG_H__2C793B38_8792_4A21_94D3_6E0F1FA51F54__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CCvisionDlg dialog

class CCvisionDlg : public CDialog
{
// Construction
public:
	CCvisionDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CCvisionDlg)
	enum { IDD = IDD_CVISION_DIALOG };
	CListBox	m_list01;
	CListBox    m_list02;
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCvisionDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	int linethreshold;
	HICON m_hIcon;
	HANDLE hdib;				//hdib
	ImageProcessor proc; 
	    //ImageProcessor proc; 
	// Generated message map functions
	//{{AFX_MSG(CCvisionDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnOpen();
	afx_msg void OnProcess();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButton3();
	BOOL convertfloat(int nID, float& floatval); 
	void DiscardImage(void);
	//afx_msg void OnBnClickedOpen();
private:
	CCCslider m_slid1;
	CCCslider m_slid2;
public:
	afx_msg void OnNMCustomdrawSlider1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnNMCustomdrawSlider2(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnBnClickedSetth();
	afx_msg void OnBnClickedLoadweight();
	afx_msg void OnBnClickedSaveweight();
	afx_msg void OnUpdateButton1(CCmdUI* pCmdUI);
//private:
//	void show_error(double err);					
	afx_msg void OnBnClickedOk();
	afx_msg void OnBnClickedAdaptive();
	afx_msg void OnBnClickedRegcap();
	afx_msg void OnBnClickedSelectsource();
	afx_msg void OnBnClickedAccuire();
	afx_msg void OnBnClickedNoisere();
	afx_msg void OnBnClickedButton4();
	afx_msg void OnBnClickedButton5();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CVISIONDLG_H__2C793B38_8792_4A21_94D3_6E0F1FA51F54__INCLUDED_)
