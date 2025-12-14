#if !defined(AFX_CLIENTSOCKET_H__BEB372BF_8D1E_4626_9EEE_8D1DB6499644__INCLUDED_)
#define AFX_CLIENTSOCKET_H__BEB372BF_8D1E_4626_9EEE_8D1DB6499644__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ClientSocket.h : header file
//

class CMsg;
class CAgent;

/////////////////////////////////////////////////////////////////////////////
// CClientSocket command target

class CClientSocket : public CSocket
{
	DECLARE_DYNAMIC(CClientSocket);
// Attributes
public:

// Operations
public:
	virtual ~CClientSocket();

// Overrides
public:
	BOOL IsAborted();
	void ReceiveMsg(CMsg* pMsg);
	void SendMsg(CMsg* pMsg);
	void Abort();
	void Init();
	CArchive* m_pArchiveOut;
	CArchive* m_pArchiveIn;
	CSocketFile* m_pFile;
	CClientSocket(CAgent* pAgent);
	CAgent* m_pAgent;
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CClientSocket)
	//}}AFX_VIRTUAL

	// Generated message map functions
	//{{AFX_MSG(CClientSocket)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

// Implementation
protected:
	virtual void OnReceive(int nErrorCode);
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CLIENTSOCKET_H__BEB372BF_8D1E_4626_9EEE_8D1DB6499644__INCLUDED_)
