#pragma once


// CCCslider dialog

class CCCslider : public CSliderCtrl
{
	DECLARE_DYNAMIC(CCCslider)

public:
	CBrush m_brWhiteBrush;
	void SetPos( int nPos );
	CWnd* m_pBuddyWnd;
	void ReflectedScrollMessage();
	HWND SetBuddy( CWnd* pBuddyWnd );
	//CSliderCC();
	//virtual ~CSliderCC();

	CCCslider(CWnd* pParent = NULL);   // standard constructor
	virtual ~CCCslider();

// Dialog Data
	enum { IDD = IDD_CVISION_DIALOG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	DECLARE_MESSAGE_MAP()
public:
//	afx_msg void OnBnClickedStart();
//	afx_msg void OnBnClickedRefresh();
	afx_msg void OnBnClickedButton3();
	afx_msg void OnBnClickedLoadweight();
	afx_msg void OnBnClickedOk();
};
