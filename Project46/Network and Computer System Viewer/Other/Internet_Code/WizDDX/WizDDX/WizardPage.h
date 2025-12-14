
#if !defined(AFX_WIZ_PROP_PAGE_H__89F88756_F90E_4597_AAAA_092872D7A8D3__INCLUDED_)
#define AFX_WIZ_PROP_PAGE_H__89F88756_F90E_4597_AAAA_092872D7A8D3__INCLUDED_


class CWizardSheet;

class CWizardPage : public CPropertyPageEx
{
	DECLARE_DYNAMIC(CWizardPage)
public:
	CWizardPage();
	CWizardPage(UINT nIDTemplate, UINT nIDCaption = 0,
		             UINT nIDHeaderTitle = 0, UINT nIDHeaderSubTitle = 0);
	CWizardPage(LPCTSTR lpszTemplateName, UINT nIDCaption = 0,
		             UINT nIDHeaderTitle = 0, UINT nIDHeaderSubTitle = 0);
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPage1)
	virtual BOOL OnSetActive();
	virtual LRESULT OnWizardNext();
	virtual LRESULT OnWizardBack();
    virtual BOOL OnWizardFinish();
	virtual BOOL OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult);
	//}}AFX_VIRTUAL
protected:
	CWizardSheet *m_pps;

	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

	friend class CWizardSheet;

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizardPage)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWizardPage();

	// Generated message map functions
protected:
	//{{AFX_MSG(CWizardPage)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

#endif
