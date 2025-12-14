// ResultDlg.cpp : implementation file
//

#include "stdafx.h"
#include "diblook.h"
#include "ResultDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CResultDlg dialog


CResultDlg::CResultDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CResultDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CResultDlg)
	m_name1 = _T("");
	m_name2 = _T("");
	m_name3 = _T("");
	m_name4 = _T("");
	m_name5 = _T("");
	m_matching1 = _T("");
	m_matching2 = _T("");
	m_matching3 = _T("");
	m_matching4 = _T("");
	m_matching5 = _T("");
	m_data1 = _T("");
	m_data2 = _T("");
	m_data3 = _T("");
	m_data4 = _T("");
	m_data5 = _T("");
	//}}AFX_DATA_INIT

	no = 0;
}


void CResultDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CResultDlg)
	DDX_Text(pDX, IDC_name1, m_name1);
	DDX_Text(pDX, IDC_name2, m_name2);
	DDX_Text(pDX, IDC_name3, m_name3);
	DDX_Text(pDX, IDC_name4, m_name4);
	DDX_Text(pDX, IDC_name5, m_name5);
	DDX_Text(pDX, IDC_SIMVALUE1, m_matching1);
	DDX_Text(pDX, IDC_SIMVALUE2, m_matching2);
	DDX_Text(pDX, IDC_SIMVALUE3, m_matching3);
	DDX_Text(pDX, IDC_SIMVALUE4, m_matching4);
	DDX_Text(pDX, IDC_SIMVALUE5, m_matching5);
	DDX_Text(pDX, IDC_DATA, m_data1);
	DDX_Text(pDX, IDC_DATA2, m_data2);
	DDX_Text(pDX, IDC_DATA3, m_data3);
	DDX_Text(pDX, IDC_DATA4, m_data4);
	DDX_Text(pDX, IDC_DATA5, m_data5);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CResultDlg, CDialog)
	//{{AFX_MSG_MAP(CResultDlg)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CResultDlg message handlers

void CResultDlg::OnPaint() 
{

	// device context for painting
	CPaintDC dc(this); 

	if (no > 0)
	{
		// define image rectangle
		LPSTR lpDIB1 = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB1);
		int cxDIB = (int) ::DIBWidth(lpDIB1);         
		int cyDIB = (int) ::DIBHeight(lpDIB1);        
		::GlobalUnlock((HGLOBAL) m_hDIB1);
		CRect rcDIB1;
		rcDIB1.top = rcDIB1.left = 0;
		rcDIB1.right = cxDIB;
		rcDIB1.bottom = cyDIB;

		// define display area rectangle
		CRect rcDest1;
		rcDest1.top = rcDest1.left = 5;
		rcDest1.right = 90;
		rcDest1.bottom = 100;

		// paint image to defined area
		::PaintDIB(dc, &rcDest1, m_hDIB1,
		&rcDIB1, m_palDIB1);
	}

	if (no > 1)
	{
		// define image rectangle
		LPSTR lpDIB2 = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB2);
		int cxDIB = (int) ::DIBWidth(lpDIB2);         
		int cyDIB = (int) ::DIBHeight(lpDIB2);        
		::GlobalUnlock((HGLOBAL) m_hDIB2);
		CRect rcDIB2;
		rcDIB2.top = rcDIB2.left = 0;
		rcDIB2.right = cxDIB;
		rcDIB2.bottom = cyDIB;

		// define display area rectangle
		CRect rcDest2;
		rcDest2.top = 120;
		rcDest2.left = 5;
		rcDest2.right = 90;
		rcDest2.bottom = 215;

		// paint image to defined area
		::PaintDIB(dc, &rcDest2, m_hDIB2,
		&rcDIB2, m_palDIB2);

	}
		
	if (no > 2)
	{
		// define image rectangle
		LPSTR lpDIB3 = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB3);
		int cxDIB = (int) ::DIBWidth(lpDIB3);         
		int cyDIB = (int) ::DIBHeight(lpDIB3);        
		::GlobalUnlock((HGLOBAL) m_hDIB3);
		CRect rcDIB3;
		rcDIB3.top = rcDIB3.left = 0;
		rcDIB3.right = cxDIB;
		rcDIB3.bottom = cyDIB;

		// define display area rectangle
		CRect rcDest3;
		rcDest3.top = 235;
		rcDest3.left = 5;
		rcDest3.right = 90;
		rcDest3.bottom = 330;

		// paint image to defined area
		::PaintDIB(dc, &rcDest3, m_hDIB3,
		&rcDIB3, m_palDIB3);
	}

	if (no > 3)
	{
		// define image rectangle
		LPSTR lpDIB4 = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB4);
		int cxDIB = (int) ::DIBWidth(lpDIB4);         
		int cyDIB = (int) ::DIBHeight(lpDIB4);        
		::GlobalUnlock((HGLOBAL) m_hDIB4);
		CRect rcDIB4;
		rcDIB4.top = rcDIB4.left = 0;
		rcDIB4.right = cxDIB;
		rcDIB4.bottom = cyDIB;

		// define display area rectangle
		CRect rcDest4;
		rcDest4.top = 350;
		rcDest4.left = 5;
		rcDest4.right = 90;
		rcDest4.bottom = 445;

		// paint image to defined area
		::PaintDIB(dc, &rcDest4, m_hDIB4,
		&rcDIB4, m_palDIB4);
	}

	if (no > 4)
	{
		// define image rectangle
		LPSTR lpDIB5 = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB5);
		int cxDIB = (int) ::DIBWidth(lpDIB5);         
		int cyDIB = (int) ::DIBHeight(lpDIB5);        
		::GlobalUnlock((HGLOBAL) m_hDIB5);
		CRect rcDIB5;
		rcDIB5.top = rcDIB5.left = 0;
		rcDIB5.right = cxDIB;
		rcDIB5.bottom = cyDIB;
	
		// define display area rectangle
		CRect rcDest5;
		rcDest5.top = 465;
		rcDest5.left = 5;
		rcDest5.right = 90;
		rcDest5.bottom = 560;

		// paint image to defined area
		::PaintDIB(dc, &rcDest5, m_hDIB5,
		&rcDIB5, m_palDIB5);
	}
}

// *******************************************************************
// InitPath function
// -----------------
// This fuction must operated before call dlg.DoModal()
// because it will initiate texts and picture in display dialog.
//
// filepath : path of image file 
// name	:	  name of image file
// match :	  matching value of image

void CResultDlg::InitPath(CString filepath,CString name, float match, CString detail, BOOL reset)
{
	BOOL clear;
	clear = reset;
	if (clear == TRUE)
		no = 0;

	no += 1;

	if (no == 1)
	{
	// initial value
		m_hDIB2 = NULL;		m_hDIB3 = NULL;		m_hDIB4 = NULL;
		m_hDIB5 = NULL;

		m_palDIB2 = NULL;	m_palDIB3 = NULL;	m_palDIB4 = NULL;
		m_palDIB5 = NULL;

	// read file and copy handle
	CFile fileshow(filepath,CFile::modeRead);
		m_hDIB1 = ::ReadDIBFile(fileshow);
	fileshow.Close();
		m_palDIB1 = new CPalette;
		::CreateDIBPalette(m_hDIB1, m_palDIB1);

		m_matching1 = Convert(match);
		m_name1 = name;
		m_data1 = detail;
	}

	if (no == 2)
	{
	// read file and copy handle
	CFile fileshow(filepath,CFile::modeRead);
		m_hDIB2 = ::ReadDIBFile(fileshow);
	fileshow.Close();
		m_palDIB2 = new CPalette;
		::CreateDIBPalette(m_hDIB2, m_palDIB2);
		m_matching2 = Convert(match);
		m_name2 = name;
		m_data2 = detail;
	}
	
	if (no == 3)
	{
	// read file and copy handle
	CFile fileshow(filepath,CFile::modeRead);
		m_hDIB3 = ::ReadDIBFile(fileshow);
	fileshow.Close();
		m_palDIB3 = new CPalette;
		::CreateDIBPalette(m_hDIB3, m_palDIB3);

		m_matching3 = Convert(match);
		m_name3 = name;
		m_data3 = detail;
	}
	
	if (no == 4)
	{
	// read file and copy handle
	CFile fileshow(filepath,CFile::modeRead);
		m_hDIB4 = ::ReadDIBFile(fileshow);
	fileshow.Close();
		m_palDIB4 = new CPalette;
		::CreateDIBPalette(m_hDIB4, m_palDIB4);

		m_matching4 = Convert(match);
		m_name4 = name;
		m_data4 = detail;
	}
	
	if (no == 5)
	{
	// read file and copy handle
	CFile fileshow(filepath,CFile::modeRead);
		m_hDIB5 = ::ReadDIBFile(fileshow);
	fileshow.Close();
		m_palDIB5 = new CPalette;
		::CreateDIBPalette(m_hDIB5, m_palDIB5);
	
		m_matching5 = Convert(match);
		m_name5 = name;
		m_data5 = detail;
	}
	
}

CString CResultDlg::Convert(float match)
{

	// change matching value to string for display
	int  decimal, sign;
	CString m_matching;
	m_matching = _fcvt( (double)match, 7, &decimal, &sign );
	
	// decimal is a dot's position, because when convert it not kept "." in string
	// so we have to insert it
	
	// matching >= 1.0
	if (decimal == 1)
		m_matching.Insert(1,".");

	// 0.9 >= matching >= 0.1
	if (decimal == 0)
		m_matching.Insert(0,"0.");

	// matching < 0.1
	// when convert float to string in not contain the earlier '0'
	// example 0.0023 convert to "23"  decimal = -2
	if (decimal < 0)
	{
		decimal = abs(decimal);
		for (int i=0; i < decimal; ++i)
			m_matching.Insert(0,"0");
		m_matching.Insert(0,"0.");
	}
	
	return m_matching;
}



BOOL CResultDlg::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext) 
{

	return CDialog::Create(IDD, pParentWnd);
}

BOOL CResultDlg::DestroyWindow() 
{
	if (m_hDIB1 != NULL)
		::GlobalFree(m_hDIB1);
	if (m_palDIB1 != NULL)
		delete m_palDIB1;

	if (m_hDIB2 != NULL)
		::GlobalFree(m_hDIB2);
	if (m_palDIB2 != NULL)
		delete m_palDIB2;

	if (m_hDIB3 != NULL)
		::GlobalFree(m_hDIB3);
	if (m_palDIB3 != NULL)
		delete m_palDIB3;

	if (m_hDIB4 != NULL)
		::GlobalFree(m_hDIB4);
	if (m_palDIB4 != NULL)
		delete m_palDIB4;

	if (m_hDIB5 != NULL)
		::GlobalFree(m_hDIB5);
	if (m_palDIB5 != NULL)
		delete m_palDIB5;
	m_name1 = "";	m_matching1 = "";	m_data1 = "";
	
	m_name2 = "";	m_matching2 = "";	m_data2 = "";
	
	m_name3 = "";	m_matching3 = "";	m_data3 = "";
	
	m_name4 = "";	m_matching4 = "";	m_data4 = "";
	
	m_name5 = "";	m_matching5 = "";	m_data5 = "";
	
	return CDialog::DestroyWindow();
}

void CResultDlg::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}
