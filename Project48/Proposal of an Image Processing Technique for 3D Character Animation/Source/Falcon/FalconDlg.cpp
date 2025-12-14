// FalconDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Falcon.h"
#include "FalconDlg.h"
#include "FImgProc.h"
#include "FImgDraw.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFalconDlg dialog

CFalconDlg::CFalconDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CFalconDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CFalconDlg)
	m_preview = FALSE;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CFalconDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CFalconDlg)
	DDX_Control(pDX, IDC_LIST02, m_list02);
	DDX_Control(pDX, IDC_LIST01, m_list01);
	DDX_Control(pDX, IDC_VDOOCX, m_vdoocx);
	DDX_Check(pDX, IDC_PREVIEW, m_preview);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CFalconDlg, CDialog)
	//{{AFX_MSG_MAP(CFalconDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_PREVIEW, OnPreview)
	ON_BN_CLICKED(IDC_PROCESS01, OnProcess01)
	ON_BN_CLICKED(IDC_CLOSE, OnCloseVDOOCX)
	ON_BN_CLICKED(IDC_INIT, OnInitVDOOCX)
	ON_BN_CLICKED(IDC_ORIGINAL, OnOriginal)
	ON_BN_CLICKED(IDC_APROCESS, OnThreshold)
	ON_BN_CLICKED(IDC_PROCESS2, OnProcess02)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFalconDlg message handlers

BOOL CFalconDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	OnInitVDOOCX();
	CButton *OrgBut = (CButton*)GetDlgItem(IDC_ORIGINAL);
	OrgBut->SetCheck(1);
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CFalconDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CFalconDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CFalconDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CFalconDlg::OnPreview() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	//m_vdoocx.SetPreview(m_preview);
}

void CFalconDlg::OnProcess01() 
{
	// TODO: Add your control notification handler code here
	LARGE_INTEGER freq, t1, t2, t3;
	double time1, time2;
	char buf[256];
	FImgProc falcon;
	int thr, blob;

	::QueryPerformanceFrequency(&freq);

	FImage img01((F_PIXEL*)m_vdoocx.GetDataPointer(m_himg01), m_vdoocx.GetWidth(), m_vdoocx.GetHeight());
	FImage img02((F_PIXEL*)m_vdoocx.GetDataPointer(m_himg02), m_vdoocx.GetWidth(), m_vdoocx.GetHeight());
	F_RGBRANGE rgb;
	F_HSVRANGE hsv;

	rgb.red_min = 200;
	rgb.red_max = 255;
	rgb.green_min = 200;
	rgb.green_max = 255;
	rgb.blue_min = 200;
	rgb.blue_max = 255;

	hsv.hue_min = 60;
	hsv.hue_max = 120;
	hsv.sat_min = 100;
	hsv.sat_max = 255;
	hsv.val_min = 100;
	hsv.val_max = 255;

	// Capture
	m_vdoocx.Capture(m_himg01);

	// Process
	::QueryPerformanceCounter(&t1);
	//thr = falcon.Threshold(img01, img02, rgb);
	thr = falcon.Threshold(img01, img02, hsv, 90);
	::QueryPerformanceCounter(&t2);
	falcon.PutFloodfillBorder(img02);
	F_BLOB *blobs;
	blobs = new F_BLOB[thr];
	blob = falcon.AnalyseBlob(img02, blobs, thr);
	::QueryPerformanceCounter(&t3);

	// Draw blob mask
	F_PIXEL color;
	F_BLOB tmpblob;
	falcon.SetBlobData(blobs, blob);
	falcon.BlobMoveFirst();
	int ind = falcon.BlobGetData(tmpblob, 10,999999, 0, m_vdoocx.GetHeight() - 0 - 1);
	if (ind >= 0)  {
		//color.red = 255;
		//color.green = 0;
		//color.blue = 255;
		//falcon.DrawBlobMask(img01, ind, color);
		color.blue = 0;
		color.green = 0;
		color.red = 255;
		FImgDraw::DrawCrosshair(img01, (tmpblob.xmin + tmpblob.xmax) / 2, 
			((tmpblob.ymin + tmpblob.ymax) / 2), 5, color);
	}

	// Show image
	CButton *OrgBut = (CButton*)GetDlgItem(IDC_ORIGINAL);
	if (OrgBut->GetCheck() != 0)
		m_vdoocx.Show(m_himg01);
	else
		m_vdoocx.Show(m_himg02);

	// Add info
	time1 = (double)(t2.QuadPart - t1.QuadPart) / (double)freq.QuadPart * 1000;
	time2 = (double)(t3.QuadPart - t2.QuadPart) / (double)freq.QuadPart * 1000;
	sprintf(buf, "%fms @ %d - %fms @ %d", time1, thr, time2, blob);
	m_list01.AddString(buf);
	m_list01.SetCurSel(m_list01.GetCount()-1);
	m_list02.ResetContent();
	falcon.BlobMoveFirst();

	while (falcon.BlobGetNext(tmpblob) >= 0)
	{
		sprintf(buf, "(%d, %d) @ %d", (tmpblob.xmin + tmpblob.xmax) / 2, 
			m_vdoocx.GetHeight() - ((tmpblob.ymin + tmpblob.ymax) / 2) - 1, tmpblob.size);
		m_list02.AddString(buf);

	}
	m_list02.SetCurSel(m_list02.GetCount()-1);

	falcon.UnsetBlobData();
	delete[] blobs;
}

BEGIN_EVENTSINK_MAP(CFalconDlg, CDialog)
    //{{AFX_EVENTSINK_MAP(CFalconDlg)
	ON_EVENT(CFalconDlg, IDC_VDOOCX, -606 /* MouseMove */, OnMouseMoveVDOOCX, VTS_I2 VTS_I2 VTS_I4 VTS_I4)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

void CFalconDlg::OnMouseMoveVDOOCX(short Button, short Shift, long x, long y) 
{
	// TODO: Add your control notification handler code here
	char str[20];
	sprintf(str, "(%d, %d)", x, y);
	SetDlgItemText(IDC_COOR, str);
}

void CFalconDlg::OnCloseVDOOCX() 
{
	// TODO: Add your control notification handler code here
	m_vdoocx.Stop();
	
	// Deallocate images
	m_vdoocx.ReleaseImageHandle(m_himg02);
	m_vdoocx.ReleaseImageHandle(m_himg01);

	m_vdoocx.Close();
}

void CFalconDlg::OnInitVDOOCX() 
{
	// TODO: Add your control notification handler code here

	// ----- Init from camera -----
	m_vdoocx.Init();
	// ------------------------------

	// ----- Init from AVI -----
	//m_vdoocx.SetMode(1);
	//m_vdoocx.InitFromFile("C:\\sam_NEW.avi");
	// ------------------------------

	// Allocate images
	m_himg01 = m_vdoocx.GetColorImageHandle();
	m_himg02 = m_vdoocx.GetColorImageHandle();

	m_vdoocx.Start();	
}

void CFalconDlg::OnOriginal() 
{
	// TODO: Add your control notification handler code here
	m_vdoocx.Show(m_himg01);
}

void CFalconDlg::OnThreshold() 
{
	// TODO: Add your control notification handler code here
	m_vdoocx.Show(m_himg02);
}


void CFalconDlg::OnProcess02()	// Simple image processing
{
	// TODO: Add your control notification handler code here
	LARGE_INTEGER freq, t1, t2;
	double time1;
	char buf[256];
	FImgProc falcon;

	::QueryPerformanceFrequency(&freq);

	FImage img01((F_PIXEL*)m_vdoocx.GetDataPointer(m_himg01), m_vdoocx.GetWidth(), m_vdoocx.GetHeight());

	// Capture
	m_vdoocx.Capture(m_himg01);

	// Process
	::QueryPerformanceCounter(&t1);
	BYTE *img1data = (BYTE*)m_vdoocx.GetDataPointer(m_himg01);
	BYTE *img2data = (BYTE*)m_vdoocx.GetDataPointer(m_himg02);
	int bytecount = m_vdoocx.GetWidth() * m_vdoocx.GetHeight() * 3; // 3 byte per pixel (BGR)
	for (int i=0; i<bytecount; i+=3)	// Iterate each pixel (3 bytes)
	{
		// Convert to gray scale
		double r, g, b;
		b = img1data[i];
		g = img1data[i+1];
		r = img1data[i+2];

		double gray = (b + g + r) / 3;
		img2data[i+2] = img2data[i+1] = img2data[i] = (int)gray;
	}
	::QueryPerformanceCounter(&t2);

	// Show image
	CButton *OrgBut = (CButton*)GetDlgItem(IDC_ORIGINAL);
	if (OrgBut->GetCheck() != 0)
		m_vdoocx.Show(m_himg01);
	else
		m_vdoocx.Show(m_himg02);

	// Add info
	time1 = (double)(t2.QuadPart - t1.QuadPart) / (double)freq.QuadPart * 1000;
	sprintf(buf, "%f ms", time1);
	m_list01.AddString(buf);
	m_list01.SetCurSel(m_list01.GetCount()-1);	
}
