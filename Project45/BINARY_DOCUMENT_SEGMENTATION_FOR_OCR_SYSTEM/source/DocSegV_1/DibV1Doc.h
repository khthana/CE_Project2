// DibV1Doc.h : interface of the CDibV1Doc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_DIBV1DOC_H__B5C5AB50_5263_4F98_BBFE_FBED724A6AF7__INCLUDED_)
#define AFX_DIBV1DOC_H__B5C5AB50_5263_4F98_BBFE_FBED724A6AF7__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CDibV1Doc : public CDocument
{
protected: // create from serialization only
	CDibV1Doc();
	DECLARE_DYNCREATE(CDibV1Doc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDibV1Doc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	BOOLEAN NewPic;
	BOOLEAN ST_PictureIN;
	BITMAPINFOHEADER bmInfoHeader;
	BITMAPFILEHEADER bmFileHeader;
	BITMAPINFO* bmInfo;
	BYTE* bmPixel;
	long Pixelsize;
	

	virtual ~CDibV1Doc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CDibV1Doc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIBV1DOC_H__B5C5AB50_5263_4F98_BBFE_FBED724A6AF7__INCLUDED_)
