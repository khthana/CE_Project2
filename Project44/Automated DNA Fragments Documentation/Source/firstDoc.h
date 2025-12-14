// firstDoc.h : interface of the CFirstDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIRSTDOC_H__1F94C5EC_7B54_11D4_9031_97D250F96D68__INCLUDED_)
#define AFX_FIRSTDOC_H__1F94C5EC_7B54_11D4_9031_97D250F96D68__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CFirstDoc : public CDocument
{
protected: // create from serialization only
	CFirstDoc();
	DECLARE_DYNCREATE(CFirstDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirstDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	//}}AFX_VIRTUAL

// Implementation
public:
	int bmHeight;
	int bmWidth;
	BOOL select;
	CSize doc_size;
	CPoint start_point;
	CPoint end_point;
	int hist[256];
	int new_color[256];
	CString file_name;
	HGLOBAL hDIB;
	CPalette* pPalDIB;
	//BOOL LoadBMP( LPCTSTR sBMPFile, HGLOBAL *phDIB, CPalette *pPal );
	virtual ~CFirstDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CFirstDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIRSTDOC_H__1F94C5EC_7B54_11D4_9031_97D250F96D68__INCLUDED_)
