// FirewallAgentDoc.h : interface of the CFirewallAgentDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIREWALLAGENTDOC_H__81E34677_4288_48B3_A5DC_7B58DF1257AF__INCLUDED_)
#define AFX_FIREWALLAGENTDOC_H__81E34677_4288_48B3_A5DC_7B58DF1257AF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CFirewallAgentDoc : public CDocument
{
protected: // create from serialization only
	CFirewallAgentDoc();
	DECLARE_DYNCREATE(CFirewallAgentDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallAgentDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CFirewallAgentDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CFirewallAgentDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLAGENTDOC_H__81E34677_4288_48B3_A5DC_7B58DF1257AF__INCLUDED_)
