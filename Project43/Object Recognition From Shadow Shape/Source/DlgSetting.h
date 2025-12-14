#if !defined(AFX_DLGSETTING_H__182B15C1_03AD_11D5_B914_DE72055ECD30__INCLUDED_)
#define AFX_DLGSETTING_H__182B15C1_03AD_11D5_B914_DE72055ECD30__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgSetting.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgSetting dialog

class CDlgSetting : public CDialog
{
// Construction
public:
	CDlgSetting(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgSetting)
	enum { IDD = IDD_DIALOG_SETTING };
	CEdit	m_Edit;
	CSliderCtrl	m_Slider;
	double	m_value;
	int		m_slidervalue;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgSetting)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgSetting)
	virtual BOOL OnInitDialog();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGSETTING_H__182B15C1_03AD_11D5_B914_DE72055ECD30__INCLUDED_)
