#if !defined(AFX_LISTENINGSOCKET_H__E5E838F3_77AA_4BDA_BA7B_BAD748E21F8A__INCLUDED_)
#define AFX_LISTENINGSOCKET_H__E5E838F3_77AA_4BDA_BA7B_BAD748E21F8A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ListeningSocket.h : header file
//

class CAgent;

/////////////////////////////////////////////////////////////////////////////
// CListeningSocket command target

class CListeningSocket : public CSocket
{
	DECLARE_DYNAMIC(CListeningSocket);
// Attributes
public:

// Operations
public:
	//CListeningSocket();
	CListeningSocket(CAgent* pAgent);
	virtual ~CListeningSocket();

// Overrides
public:
	
	CAgent* m_pAgent;
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CListeningSocket)
	public:
	virtual void OnAccept(int nErrorCode);
	//}}AFX_VIRTUAL

	// Generated message map functions
	//{{AFX_MSG(CListeningSocket)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

// Implementation
protected:
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LISTENINGSOCKET_H__E5E838F3_77AA_4BDA_BA7B_BAD748E21F8A__INCLUDED_)
