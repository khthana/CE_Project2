// Msg.h: interface for the CMsg class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_MSG_H__BBB88930_6DD0_4984_A854_7E4D4C64FFF6__INCLUDED_)
#define AFX_MSG_H__BBB88930_6DD0_4984_A854_7E4D4C64FFF6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CMsg : public CObject 
{
protected:
	DECLARE_DYNCREATE(CMsg)
public:
	CMsg();
	virtual ~CMsg();

// Implementation
public:
	CObject* m_pData;
	void Init();
	CString m_command;
	virtual void Serialize(CArchive& ar); // overidden for document i/o

};

#endif // !defined(AFX_MSG_H__BBB88930_6DD0_4984_A854_7E4D4C64FFF6__INCLUDED_)
