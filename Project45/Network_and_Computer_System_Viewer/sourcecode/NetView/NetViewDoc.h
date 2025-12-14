// NetViewDoc.h : interface of the CNetViewDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_NETVIEWDOC_H__5B807D30_566D_461A_B036_763494C8345E__INCLUDED_)
#define AFX_NETVIEWDOC_H__5B807D30_566D_461A_B036_763494C8345E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


//##ModelId=3E9ABEEB01D2
class CNetViewDoc : public CDocument
{
protected: // create from serialization only
	//##ModelId=3E9ABEEB01F3
	CNetViewDoc();
	DECLARE_DYNCREATE(CNetViewDoc)

// Attributes
public:
	//##ModelId=3E9ABEEB01E0
	CObList all_host;
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNetViewDoc)
	public:
	//##ModelId=3E9ABEEB01F2
	virtual BOOL OnNewDocument();
	//##ModelId=3E9ABEEB01F0
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:

	//##ModelId=3E9ABEEB01EA
	CSize GetViewDocSize()
	{ 
		return m_sizeViewDoc; 
	}

	//##ModelId=3E9ABEEB01E9
	virtual ~CNetViewDoc();
	//##ModelId=3E9ABEEB01DD
	CSize m_sizeViewDoc;

#ifdef _DEBUG
	//##ModelId=3E9ABEEB01E8
	virtual void AssertValid() const;
	//##ModelId=3E9ABEEB01E6
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CNetViewDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NETVIEWDOC_H__5B807D30_566D_461A_B036_763494C8345E__INCLUDED_)
