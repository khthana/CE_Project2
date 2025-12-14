#if !defined(AFX_SELECTADAPTER_H__057C2D3D_E443_4025_A18A_DAC8169FD4D7__INCLUDED_)
#define AFX_SELECTADAPTER_H__057C2D3D_E443_4025_A18A_DAC8169FD4D7__INCLUDED_

#include "DeviceList.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SelectAdapter.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSelectAdapter dialog

class CSelectAdapter : public CDialog
{
// Construction
public:
	int GetNumAdapSelect();
	CSelectAdapter(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSelectAdapter)
	enum { IDD = IDD_SELECT_ADAP };
	CListCtrl	m_List_Adapter;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSelectAdapter)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	int NumberAdapter;
	void ShowAdapterList();
	CDeviceList Device;
	virtual BOOL OnInitDialog();

	// Generated message map functions
	//{{AFX_MSG(CSelectAdapter)
	virtual void OnCancel();
	virtual void OnOK();
	afx_msg void OnDblclkListAdap(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SELECTADAPTER_H__057C2D3D_E443_4025_A18A_DAC8169FD4D7__INCLUDED_)
