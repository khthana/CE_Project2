// YDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Y.h"

#include "PGM.h"
#include "HISTOGRAM.h"
#include "YDlg.h"
#include "Edge.h"
#include "math.h"


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
// CYDlg dialog

CYDlg::CYDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CYDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CYDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

}

void CYDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CYDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CYDlg, CDialog)
	//{{AFX_MSG_MAP(CYDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_COMMAND(ID_EDGE, OnEdge)
	ON_COMMAND(IDD_LEFT, OnLeft)
	ON_COMMAND(ID_Histogram, OnHistogram)
	ON_COMMAND(ID_EDGE_GRADIENT, OnEdgeGradient)
	ON_COMMAND(ID_SAVE_FILEDATA, OnSaveFiledata)
	ON_COMMAND(ID_FILE_OPEN3IMAGE, OnFileOpen3image)
	ON_COMMAND(ID_PGM_HIS, OnPgmHis)
	ON_COMMAND(ID_IMAGEPROCESSING_SHOWEDGE, OnImageprocessingShowedge)
	ON_WM_SIZE()
	ON_COMMAND(ID_IMAGEPROCESSING_SHOWEDGEOUT, OnImageprocessingShowedgeout)
	ON_COMMAND(ID_IMAGEPROCESSING_COLOROBJECTAREA, OnImageprocessingColorobjectarea)
	ON_COMMAND(ID_IMAGEPROCESSING_SHOWIMAGE, OnImageprocessingShowimage)
	ON_COMMAND(IDD_EDGE, OnEdge)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CYDlg message handlers

BOOL CYDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	theApp.D1 = NULL;
	theApp.D2 = NULL;
	theApp.D3 = NULL;
	WINID = 0;
	F1 = NULL;
	F2 = NULL;
	F3 = NULL;
	savepic = NULL;
	savepic2 = NULL;
	SavePicT = NULL;

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
	
	this -> ShowWindow(SW_SHOWMAXIMIZED);
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CYDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CYDlg::OnPaint() 
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
HCURSOR CYDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


void CYDlg::Group(int *input,int g)
{
	int hpic = 240,wpic = 320;
	int *k;
	int i,j;
	

	int value1;
	value1 = 6;
	k = input;
	
	// find threshold
	if(g == 1)
	{	

	int *newpic = edgeL ;
	for(j=1;j<=hpic;j++)
		{	
			for(i=1;i<=wpic;i++)
			{
				if(i!=1&&i!=wpic&&j!=1&&j!=hpic)
				{
					if(*(k+1) - *k  > value1 )*newpic = Direct0;
					else if(*k - *(k+1)  > value1 )	*newpic = Direct4;
					else if(*(k+wpic) - *k > value1 )*newpic = Direct6; 
					else if(*k - *(k+wpic) > value1 )*newpic = Direct2; 
					else *newpic = 255;
				}

				k++;
				newpic++;
			
			}
		}

	}


	
	if(g == 2)	
	{	


	int *newpic8 = edgeR ;
	for(j=1;j<=hpic;j++)
		{	
			for(i=1;i<=wpic;i++)
			{
				if(i!=1&&i!=wpic&&j!=1&&j!=hpic)
				{
					if(*(k+1) - *k  > value1 )*newpic8 = Direct0;
					else if(*k - *(k+1)  > value1 )	*newpic8 = Direct4;
					else if(*(k+wpic) - *k > value1 )*newpic8 = Direct6; 
					else if(*k - *(k+wpic) > value1 )*newpic8 = Direct2; 
					else *newpic8 = 255;
				}

				k++;
				newpic8++;
			
			}
		}

	}
	
}




void CYDlg::OnePixel(int *object,int Input)
{
	int co1;
	int *o1 = object;
	int *o2;
/////////////////

	o1 = object;
	
	
	if(Input == 0)
	{
		o1 = object;
	int k1;
	int count=0;
	int *TempO1,TempX1,TempY1,TempX2,TempY2;
	int A[10],PA=0,A1[10];	
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
		{
			PA = 0;
			if(*o1 == 1)
			if(SurroundPixel1(o1) != 0)
			{
				TempO1 = o1;
				count = 0;
				TempX1 = i;
				TempY1 = j;
				TempX2 = i;
				TempY2 = j;
				if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
				while(SurroundPixel1(TempO1) != 0)
				{
					if(SurroundPixel1(TempO1) == 1)
					{	*TempO1 = 200;
						TempO1 = TempO1 + 1;
						TempX2++;
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 2)
					{	*TempO1 = 200;
						TempO1 = TempO1 + 1 - wpic;
						TempX2++;TempY2--;
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 3)
					{	*TempO1 = 200;
						TempO1 = TempO1 - wpic;
						TempY2--;	
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 4)
					{	*TempO1 = 200;
						TempO1 = TempO1 - wpic - 1;
						TempX2--;TempY2--;	
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 5)
					{	*TempO1 = 200;
						TempO1 = TempO1 - 1;
						TempX2--;	
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 6)
					{	*TempO1 = 200;
						TempO1 = TempO1 + wpic - 1;
						TempX2--;TempY2++;	
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 7)
					{	*TempO1 = 200;
						TempO1 = TempO1 + wpic;
						TempY2++;	
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					else if(SurroundPixel1(TempO1) == 8)
					{	*TempO1 = 200;
						TempO1 = TempO1 + wpic + 1;
						TempX2++;TempY2++;	
						if(PA<10){A[PA] = TempX2;A1[PA] = TempY2;PA++;}
					}
					
					count++;
				} // while

								
				if(count < 3 && count > 0)
				{
					o2 = object;									
					for(k1=0;k1<PA;k1++)
						*(o2 + A[k1] + (A1[k1])*wpic) = 255;
				}// if
			}// if
			o1++;
		}// J

	o1 = object;
	for(j=1;j<=hpic;j++)
		for(i=1;i<=wpic;i++)
		{
			if(*o1 == 200)*o1 = 1;
			o1++;
		}

	o1 = object;
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			{
				co1 = 0;
				if(i!=0&&j!=0&&i!=wpic&&j!=hpic)
				if(*o1 != 255)
				{
					if( *(o1-wpic-1) != 255 ) co1++;
					if( *(o1-wpic-0) != 255 ) co1++;
					if( *(o1-wpic+1) != 255 ) co1++;
					if( *(o1-1) != 255 ) co1++;
					if( *(o1+1) != 255 ) co1++;
					if( *(o1+wpic-1) != 255 ) co1++;
					if( *(o1+wpic+0) != 255 ) co1++;
					if( *(o1+wpic+1) != 255 ) co1++;
				
					if(co1==0)*o1 = 255;
				} // for if
				o1++;
			} // for ij
	}// Input == 0

/////////////////
	if(Input == 5)
	{
	o1 = object;
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			{
				co1 = 0;
				if(i!=0&&j!=0&&i!=wpic&&j!=hpic)
				if(*o1 != 255)
				{
					if( *(o1-wpic-1) != 255 ) co1++;
					if( *(o1-wpic-0) != 255 ) co1++;
					if( *(o1-wpic+1) != 255 ) co1++;
					if( *(o1-1) != 255 ) co1++;
					if( *(o1+1) != 255 ) co1++;
					if( *(o1+wpic-1) != 255 ) co1++;
					if( *(o1+wpic+0) != 255 ) co1++;
					if( *(o1+wpic+1) != 255 ) co1++;
				
					if(co1==0)*o1 = 255;
				} // for if
				o1++;
			} // for ij
	}		
		
		
	if(Input == 1)
	{
		int temp[240];
		for(i=0;i<240;i++)temp[i] = 0;
	
		o1 = object;
		for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
		{
			if(*o1 == 0)if(temp[j]<i)temp[j] = i;
			*o1 = 255;
			o1++;
		}
		o1 = object;
		for(i=0;i<240;i++)
			if(temp[i] >0) *(o1 + temp[i] + i*wpic) = 0;
	}

	if(Input == 2)
	{
		int temp[240];
		for(i=0;i<240;i++)temp[i] = 320;
	
		o1 = object;
		for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
		{
			if(*o1 == 0)if(temp[j]>i)temp[j] = i;
			*o1 = 255;
			o1++;
		}
		o1 = object;
		for(i=0;i<240;i++)
			if(temp[i] <320) *(o1 + temp[i] + i*wpic) = 0;
	}

	if(Input == 3)
	{
		int temp[320];
		for(i=0;i<320;i++)temp[i] = 0;
	
		o1 = object;
		for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
		{
			if(*o1 == 0)if(temp[i]<j)temp[i] = j;
			*o1 = 255;
			o1++;
		}
		o1 = object;
		for(i=0;i<320;i++)
			if(temp[i] >0) *(o1 + temp[i]*wpic + i) = 0;
	}

	if(Input == 4)
	{
		int temp[320];
		for(i=0;i<320;i++)temp[i] = 240;
	
		o1 = object;
		for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
		{
			if(*o1 == 0)if(temp[i]>j)temp[i] = j;
			*o1 = 255;
			o1++;
		}
		o1 = object;
		for(i=0;i<320;i++)
			if(temp[i] < 240) *(o1 + temp[i]*wpic + i) = 0;
	}

}




int CYDlg::SurroundPixel1(int *object)
{
	int *o1 = object;	
			if(*o1 == 1)
			{
					if(*(o1+1) == 1 && *(o1+1+wpic)**(o1+wpic)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 1;
					}

					if(*(o1+1+wpic) == 1 && *(o1+1)**(o1+wpic)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 8;
					}

					if(*(o1+wpic) == 1 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 7;
					}

					if(*(o1-1+wpic) == 1 && *(o1+1+wpic)**(o1+1)**(o1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 6;
					}

					if(*(o1-1) == 1 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1+wpic)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 5;
					}

					if(*(o1-1-wpic) == 1 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1+wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 4;
					}

					if(*(o1-wpic) == 1 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1+wpic)**(o1+1-wpic) != 0)
					{
						return 3;
					}

					
					if(*(o1+1-wpic) == 1 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1+wpic)**(o1-wpic) != 0)
					{
						return 2;
					}

			}
			return 0;
}


int CYDlg::SurroundPixel(int *object)
{
	int *o1 = object;	
			if(*o1 == 0)
			{
					if(*(o1+1) == 0 && *(o1+1+wpic)**(o1+wpic)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 1;
					}

					if(*(o1+1+wpic) == 0 && *(o1+1)**(o1+wpic)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 8;
					}

					if(*(o1+wpic) == 0 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 7;
					}

					if(*(o1-1+wpic) == 0 && *(o1+1+wpic)**(o1+1)**(o1+wpic)**(o1-1)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 6;
					}

					if(*(o1-1) == 0 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1+wpic)**(o1-1-wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 5;
					}

					if(*(o1-1-wpic) == 0 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1+wpic)**(o1-wpic)**(o1+1-wpic) != 0)
					{
						return 4;
					}

					if(*(o1-wpic) == 0 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1+wpic)**(o1+1-wpic) != 0)
					{
						return 3;
					}

					
					if(*(o1+1-wpic) == 0 && *(o1+1+wpic)**(o1+1)**(o1-1+wpic)**(o1-1)**(o1-1-wpic)**(o1+wpic)**(o1-wpic) != 0)
					{
						return 2;
					}


			}
			return 0;
}


void CYDlg::Slope(int *Object)
{
	int *o1 = Object;
	int count=0;
	int *TempO1,TempX1,TempY1,TempX2,TempY2;
	
	int *Buffer = new int[2000];
	int *Start,*End;
	double m;

	
	for(j=1;j<=hpic;j++)
		for(i=1;i<=wpic;i++)
		{

			if(*o1 == 0)
			if(SurroundPixel(o1) != 0)
			{
				TempO1 = o1;
				count = 0;
				TempX1 = i;
				TempY1 = j;
				TempX2 = i;
				TempY2 = j;
				Start = Buffer;
				End = Buffer;
				*End = i;
				*(End+1) = j;
				End = End +2;
				while(SurroundPixel(TempO1) != 0)
				{
					if(SurroundPixel(TempO1) == 1)
					{	*TempO1 = 255;
						TempO1 = TempO1 + 1;
						TempX2++;	}
					else if(SurroundPixel(TempO1) == 2)
					{	*TempO1 = 255;
						TempO1 = TempO1 + 1 - wpic;
						TempX2++;TempY2--;	}
					else if(SurroundPixel(TempO1) == 3)
					{	*TempO1 = 255;
						TempO1 = TempO1 - wpic;
						TempY2--;	}
					else if(SurroundPixel(TempO1) == 4)
					{	*TempO1 = 255;
						TempO1 = TempO1 - wpic - 1;
						TempX2--;TempY2--;	}
					else if(SurroundPixel(TempO1) == 5)
					{	*TempO1 = 255;
						TempO1 = TempO1 - 1;
						TempX2--;	}
					else if(SurroundPixel(TempO1) == 6)
					{	*TempO1 = 255;
						TempO1 = TempO1 + wpic - 1;
						TempX2--;TempY2++;	}
					else if(SurroundPixel(TempO1) == 7)
					{	*TempO1 = 255;
						TempO1 = TempO1 + wpic;
						TempY2++;	}
					else if(SurroundPixel(TempO1) == 8)
					{	*TempO1 = 255;
						TempO1 = TempO1 + wpic + 1;
						TempX2++;TempY2++;	}
					
					*(End) = TempX2; // X
					*(End + 1) = TempY2; // Y
					End = End + 2 ;

					count++;
				if(count > 3)  // Window Slope == 5
				{
					if(TempY2 - *(Start+1) != 0 && TempX2 - *Start != 0)
					{
						m = fabs( ((double)TempY2 - (double)*(Start+1))/((double)TempX2 - (double)*Start) );
					}
					else m = 0;
					
					if(m == 0)
					{
						if(TempY2 - *(Start+1) == 0)MST[1]++;
						if(TempX2 - *Start == 0)MST[9]++;
					}
					else 
					{
						if(m > 0    && m <= 0.25) MST[2]++;
						if(m > 0.25 && m <= 0.50) MST[3]++;
						if(m > 0.5  && m <= 0.75) MST[4]++;
						if(m > 0.75 && m <= 1.00) MST[5]++;
						if(m > 1    && m <= 1.34) MST[6]++;
						if(m > 1.34 && m <= 2.00) MST[7]++;
						if(m > 2    && m <= 4.00) MST[8]++;
					}
					MST[0]++;

					Start = Start + 2;

				}// if
			
				} // while
								
			}// if
			o1++;
		}// i


		free(Buffer);
}

int CYDlg::Threshold(int *Object)
{
	
	int i,j;
	int Count=0;
	int *k = Object;
	
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
		{
			if(*k<128)Count++;
			k++;
		}		 
	if(Count>2000)return 1;
	else return 2;
}

void CYDlg::Group2(int Number,int *Edge,int *Picture)
{

	int *pp1 = new int[wpic*hpic];
	int *p1 = pp1;

	int *pp2 = new int[wpic*hpic];
	int *p2 = pp2;

	int *pp3 = new int[wpic*hpic];
	int *p3 = pp3;

	int *pp4 = new int[wpic*hpic];
	int *p4 = pp4;

	int *k;
//	int *o1 = new int[hpic*wpic];
//	Edge = o1;
	int *o1;
	
	NumberThreshold = Threshold(savepic);

	if(NumberThreshold == 1)	// For Black Object Threshold 
	{
	int value1 = 4;
	int value2 = 4;
	int value3 = 8;
	int value4 = 8;
	int Gx,Gy,Gxy;

	k = Picture;
	
	
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			{
				if(i!=0&&i<wpic-1&&j!=0&&j<hpic-1)
				{
					if(*(k+1) - *k  > value1||*k - *(k+1)  > value2)//*p1=255;else*p1=*k;
//					if(*k - *(k+1)  > value2 )//*p2=255;else*p2=*k;
					{
					Gx = *(k-wpic-1)*(-1) + *(k-wpic)*(-2) + * (k-wpic+1)*(-1)		
						+ *(k+wpic-1)*(1) + *(k+wpic)*(2) + * (k+wpic+1)*(1);
					Gy = *(k-wpic-1)*(-1) + *(k-1)*(-2) + * (k+wpic-1)*(-1)		
						+ *(k-wpic+1)*(1) + *(k+1)*(2) + * (k+wpic+1)*(1);
					Gxy = abs(Gx) + abs(Gy);				
					if(Gxy>60){*p1 = 255;*p2 = 255;}
					else{ *p1 = *k;*p2 = *k;}
//					*o1 = 0;				
					}
					if(*k - *(k+wpic) > value4)
					{*p4 = 255;}
					else *p4=*k;

					if( *(k+wpic) - *k > value3)
					{
					Gx = *(k-wpic-1)*(-1) + *(k-wpic)*(-2) + * (k-wpic+1)*(-1)		
						+ *(k+wpic-1)*(1) + *(k+wpic)*(2) + * (k+wpic+1)*(1);
					Gy = *(k-wpic-1)*(-1) + *(k-1)*(-2) + * (k+wpic-1)*(-1)		
						+ *(k-wpic+1)*(1) + *(k+1)*(2) + * (k+wpic+1)*(1);
					Gxy = abs(Gx) + abs(Gy);				
					if(Gxy>120)*p3 = 255;
					else *p3 = *k;
					}
					
				}
				k++;
				p1++;
				p2++;
				p3++;
				p4++;

			}
	
	}//NumberThreshold == 1

	if(NumberThreshold == 2)   // For White Object Threshold 
	{
	p1 = pp1;
	p2 = pp2;
	p3 = pp3;
	p4 = pp4;
	int value1 = 3;
	int value2 = 3;
	int value3 = 20;
	int value4 = 3;
	int Gx,Gy,Gxy;

	k = Picture;
	
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			{
				if(i!=0&&i<wpic-5&&j!=0&&j!=hpic-1)
				{
					if(*(k+1) - *k  > value1)*p1=255;else*p1=*k;
					if(*k - *(k+1)  > value2)*p2=255;else*p2=*k;
					if(*k - *(k+wpic) > value4)
					{*p4 = 255;}
					else *p4=*k;

					if( *(k+wpic) - *k > value3)
					{
					Gx = *(k-wpic-1)*(-1) + *(k-wpic)*(-2) + * (k-wpic+1)*(-1)		
						+ *(k+wpic-1)*(1) + *(k+wpic)*(2) + * (k+wpic+1)*(1);
					Gy = *(k-wpic-1)*(-1) + *(k-1)*(-2) + * (k+wpic-1)*(-1)		
						+ *(k-wpic+1)*(1) + *(k+1)*(2) + * (k+wpic+1)*(1);
					Gxy = abs(Gx) + abs(Gy);				
					if(Gxy>60)*p3 = 255;
					else *p3 = *k;
					}
					
				}
				k++;
				p1++;
				p2++;
				p3++;
				p4++;

			}
	
	}//NumberThreshold == 2

	{	
	p1 = pp1;
	p2 = pp2;
	p3 = pp3;
	p4 = pp4;
	k = savepic;

	int *pp6 = new int[hpic*wpic];
	int *pp7 = new int[hpic*wpic];
	int *pp8 = new int[hpic*wpic];
	int *pp9 = new int[hpic*wpic];
	int *p6 = pp6;
	int *p7 = pp7;
	int *p8 = pp8;
	int *p9 = pp9;

	for(j=1;j<=hpic;j++)
		for(i=1;i<=wpic;i++)
		{
			if(i!=1&&i!=wpic&&j!=1&&j!=hpic)
			{
				if(*p1 ==255 && *(p1+1) != 255 )*p6 = 0;
				if(*p2 ==255 && *(p2-1) != 255 )*p7 = 0;
				if(*p3 ==255 && *(p3+wpic) != 255 )*(p8+wpic) = 0;
				if(*p4 ==255 && *(p4-wpic) != 255 )*p9 = 0;
			}
			if(*p6 != 0) *p6 = 255;
			if(*p7 != 0) *p7 = 255;
			if(*p8 != 0) *p8 = 255;
			if(*p9 != 0) *p9 = 255;

			p1++;
			p2++;
			p3++;
			p4++;
			p6++;
			p7++;
			p8++;
			p9++;

			k++;

		}
	if(Number != 50)
	{
	OnePixel(pp6,1);
	OnePixel(pp7,2);
	OnePixel(pp8,3);
	OnePixel(pp9,4);
	}

	if(Number == 50)
	{
	int *o5 = EdgeOut;	
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			*(o5+i+j*wpic)=255;
	o5 = EdgeOut;
	o1 = pp6;
	int *o2 = pp7;
	int *o3 = pp8;
	int *o4 = pp9;
	
	int max = 0,min = 320;
	for(j=0;j<hpic;j++)
	{
		for(i=0;i<wpic;i++)
		{
			if((*o1 == 0)||(*o2 == 0)||(*o3 == 0)||(*o4 == 0))
			*o5 = 0;
				o1++;o2++;o3++;o4++;o5++;
		}

	}

	}
	else
	{


	int *o5 = EdgeOut;	
	for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			*(o5+i+j*wpic)=255;
	o5 = EdgeOut;
	o1 = pp6;
	int *o2 = pp7;
	int *o3 = pp8;
	int *o4 = pp9;
	
	int max = 0,min = 320;
	for(j=0;j<hpic;j++)
	{
		min = 320;
		max = 0;
		for(i=0;i<wpic;i++)
		{
			if((*o1 == 0)||(*o2 == 0)||(*o3 == 0)||(*o4 == 0))
			{
				if(min>i) min = i;
				if(max<i) max = i;

			}
				o1++;o2++;o3++;o4++;
		}// i
		if(min != 320 && max != 0)
		if(max != min)
		{
			*(o5 + min) = 0;
			*(o5 + max) = 0;
		}
		o5 = o5 + 320;
	}// j
	if(Number != 6)OnePixel(EdgeOut,5);
	
/////////////////// Y ////////////////////
	if(Number != 6)
	{

	o5 = EdgeOut;
	o1 = pp6;
	o2 = pp7;
	o3 = pp8;
	o4 = pp9;
	

	for(i=0;i<wpic;i++)
	{
		min = 240;
		max = 0;
		for(j=0;j<hpic;j++)
		{
			if((*(o1+wpic*j) == 0)||(*(o2+wpic*j) == 0)||(*(o3+wpic*j) == 0)||(*(o4+wpic*j) == 0))
			{
				if(min>j) min = j;
				if(max<j) max = j;
			}

		}// j
		if(min != 240 && max != 0)
		if(max != min)
		{
			*(o5 + min*wpic) = 1;
			*(o5 + max*wpic) = 1;
		}
		o1++;
		o2++;
		o3++;
		o4++;
		o5 = o5 + 1;
	}// i

	if(Number !=6)OnePixel(EdgeOut,0);
	}

	

/////////////////////////////////////////////////////////

	if(Number == 100)
	{
		MST[0] = 0;
		MST[1] = 0;
		MST[2] = 0;
		MST[3] = 0;
		MST[4] = 0;
		MST[5] = 0;
		MST[6] = 0;
		MST[7] = 0;
		MST[8] = 0;
		MST[9] = 0;
	
		Slope(pp6);
		Slope(pp7);
		Slope(pp8);
		Slope(pp9);

	MST[1] = MST[1] / MST[0];
	MST[2] = MST[2] / MST[0];
	MST[3] = MST[3] / MST[0];
	MST[4] = MST[4] / MST[0];
	MST[5] = MST[5] / MST[0];
	MST[6] = MST[6] / MST[0];
	MST[7] = MST[7] / MST[0];
	MST[8] = MST[8] / MST[0];
	MST[9] = MST[9] / MST[0];

	}

	}// else
	free(pp1);
	free(pp2);
	free(pp3);
	free(pp4);
	free(pp6);
	free(pp7);
	free(pp8);
	free(pp9);

//	free(o1);


	}// 1	
}

void CYDlg::OnEdge() 
{
	// TODO: Add your command handler code here

	Edge *tpgm1 = new Edge(this);
	
	if(WINID == 1)
	{
		if(theApp.D1 != NULL)theApp.D1->DestroyWindow();
		if(F1 != NULL)free(F1);
		theApp.D1 = tpgm1;	
	}
	if(WINID == 2)
	{
		if(theApp.D2 != NULL)theApp.D2->DestroyWindow();
		theApp.D2 = tpgm1;	
		if(F2 != NULL)free(F2);
	}
	if(WINID == 3)
	{
		if(theApp.D3 != NULL)theApp.D3->DestroyWindow();
		if(F3 != NULL)free(F3);
		theApp.D3 = tpgm1;	
	}

	tpgm1 ->newpic1 = Show;
	tpgm1 ->wpic = wpic;
	tpgm1 ->hpic = hpic;
	tpgm1 ->Create(IDD_DIALOG4,this);
	tpgm1 ->SetWindowText(Caption);
	tpgm1 ->SetWindowPos(&wndTop , Bx, By, Sx, Sy,SWP_SHOWWINDOW );
	tpgm1 ->ShowWindow(SW_SHOW);

}

void CYDlg::OnLeft() 
{
	// TODO: Add your command handler code here
	
	PGM *tpgm1 = new PGM(this);

	if(WINID == 1)
	{
		if(theApp.D1 != NULL)theApp.D1->DestroyWindow();
		theApp.D1 = tpgm1;	
	}
	if(WINID == 2)
	{
		if(theApp.D2 != NULL)theApp.D2->DestroyWindow();
		theApp.D2 = tpgm1;	
	}
	if(WINID == 3)
	{
		if(theApp.D3 != NULL)theApp.D3->DestroyWindow();
		theApp.D3 = tpgm1;	
	}

		tpgm1 ->k1 = Show;
		tpgm1 ->wpic = wpic;
		tpgm1 ->hpic = hpic;
		tpgm1 ->Create(IDD_DIALOG4,this);
		tpgm1 ->SetWindowText(Caption);
		tpgm1 ->SetWindowPos(&wndTop , Bx, By, Sx, Sy,SWP_SHOWWINDOW );
		tpgm1 ->ShowWindow(SW_SHOW);
}



void CYDlg::OnHistogram() 
{
	// TODO: Add your command handler code here


	CHISTOGRAM *tpgm1 = new CHISTOGRAM(this);
	if(WINID == 1)
	{
		if(theApp.D1 != NULL)theApp.D1->DestroyWindow();
		theApp.D1 = tpgm1;	
	}
	if(WINID == 2)
	{
		if(theApp.D2 != NULL)theApp.D2->DestroyWindow();
		theApp.D2 = tpgm1;	
	}
	if(WINID == 3)
	{
		if(theApp.D3 != NULL)theApp.D3->DestroyWindow();
		theApp.D3 = tpgm1;	
	}



	
	tpgm1 ->k1 = Show;
	tpgm1 ->wpic = wpic;
	tpgm1 ->hpic = hpic;
	tpgm1 ->Create(IDD_DIALOG7,this);
	tpgm1 ->SetWindowText(Caption);
	tpgm1 ->SetWindowPos(&wndTop , Bx, By, Sx, Sy,SWP_SHOWWINDOW );
	tpgm1 ->ShowWindow(SW_SHOW);
		
}

void CYDlg::OnEdgeGradient() 
{
	// TODO: Add your command handler code here

	int *o1 = Show;
	int *k = Image1;
	int value1 = 5;
	int value2 = 5;
	int value3 = 7;
	int value4 = 6;
	int Gx,Gy,Gxy;
		for(j=0;j<hpic;j++)
		for(i=0;i<wpic;i++)
			{
				if(i!=0&&i!=wpic-1&&j!=0&&j!=hpic-1)
				{
					if(*(k+1) - *k  > value1||*k - *(k+1)  > value2 )
//					else if(*k - *(k+1)  > value2 )*o1=0;
					{
					Gx = *(k-wpic-1)*(-1) + *(k-wpic)*(-2) + * (k-wpic+1)*(-1)		
						+ *(k+wpic-1)*(1) + *(k+wpic)*(2) + * (k+wpic+1)*(1);
					Gy = *(k-wpic-1)*(-1) + *(k-1)*(-2) + * (k+wpic-1)*(-1)		
						+ *(k-wpic+1)*(1) + *(k+1)*(2) + * (k+wpic+1)*(1);
					Gxy = abs(Gx) + abs(Gy);				
					if(Gxy>60)*o1 = 0;
					else *o1 = 255;
//					*o1 = 0;				
					}
					else if(*k - *(k+wpic) > value4)
					{
					*o1 = 0;
					}

					else if( *(k+wpic) - *k > value3)
					{
					Gx = *(k-wpic-1)*(-1) + *(k-wpic)*(-2) + * (k-wpic+1)*(-1)		
						+ *(k+wpic-1)*(1) + *(k+wpic)*(2) + * (k+wpic+1)*(1);
					Gy = *(k-wpic-1)*(-1) + *(k-1)*(-2) + * (k+wpic-1)*(-1)		
						+ *(k-wpic+1)*(1) + *(k+1)*(2) + * (k+wpic+1)*(1);
					Gxy = abs(Gx) + abs(Gy);				
					if(Gxy>120)*o1 = 0;
					else *o1 = 255;
				
					}
					else *o1 = 255;
				}
				o1++;
				k++;

			}
	
	

	
}

void CYDlg::GetFile(CString Name,int *PointerImage)
{
	int i,j;
	CStdioFile s(Name,CFile::typeBinary | CFile::modeRead);
	 CString m;
	 char p,p1;
	 char width[3],height[3];
	 int pcount;
	 int length1,pl;
	 wpic = 320;
	 hpic = 240; 
	 s.ReadString(m);
	 p=m.GetAt(0); 
	 p1=m.GetAt(1); 
	 if((p='P')&&(p1='5')){
	 }
	 s.ReadString(m);
	 length1=m.GetLength();
	 pcount=0;
	 
	 p=m.GetAt(0); 
	 i=0; 	
	 while(p!=' '){
		 
		width[i++]=p;
		
		pcount++;
		p=m.GetAt(pcount); 
	 }
	 pcount++;
	 pl=length1-pcount;
	 p=m.GetAt(pcount); 
	 i=0;
	 while((pl>=1)){
		
		height[i++]=p;
		pcount++;
		pl--;
		if(pl>0)(p=m.GetAt(pcount)); 
	 }
	int width1=atoi(width);
	int height1=atoi(height);
	 
	unsigned char b[1];
	 
	 s.Read(b,1);
	 while(b[0]!=' '){
		 s.Read(b,1);
	 }
	 
	 threshold =0;
	 
	 k = PointerImage ;
		for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				s.Read(b,1);
				*k = b[0];
				threshold=threshold+ b[0];		
				k++;
			}		 
		
		}	

}





void CYDlg::XYZ(double X,double D)
{
  double Z,zo;

		Size = 0;	
		if(D != 0)
		{
			Z =(9.33*10*28.346*28.346)/D;
	        zo=((9.33*28.346 - Z));
			Size =(((X/(9.33*28.346))*(9.33*28.346-zo)));
		}
}

void CYDlg::MaxMin4(int *E1,int *E2,int *E3)  // OutPut X1 Y1 X2 Y2 X3 Y3 X4 Y4//
{
	int *o1 = E1;
	int *o2 = E2;
	int D11,D12,D21,D22;
	int Pass = 0,SumD1 = 0,SumD2 = 0,Count = 0,SD1 = 0,SD2 = 0;

	double M1[5],M2[5],TM;
	for(i=0;i<4;i++)
	{
		M1[i] = 0 ; M2[i]=0;
	}

	for(j=1;j<=hpic;j++)
	{
		D11 = 0;D12 = 0;D21 = 0;D22 = 0;
		for(i=1;i<=wpic;i++)
		{
			if(*o2 == 0  || *o2 == 1 && i != 320)
			{
				if(D11 == 0 )D11 = i;			
				else D12 = i;
			}
			if(*o1 ==0 && i != 320)
			{
				if(D21 == 0)D21 = i;			
				else D22 = i;
			}

			o1++;
			o2++;
		}// i
		if(D11 != 0 && D12 != 0 && D21 != 0 && D22 != 0)
		{

			SD1 = D11;							
			SD2 = D12;
			SumD1 = D11-D21;
			SumD2 = D12-D22;

			Count++;

		
	XYZ((double)SD1,(double)SumD1);
	SizeX = Size ;
	XYZ((double)SD2,(double)SumD2);
	SizeX = SizeX - Size;
	SizeX = SizeX / (28.346*100);


	if(SizeX>M1[4])
	{
		M1[4] = SizeX;
		if(M1[4]>M1[3])
		{
			TM = M1[3];
			M1[3] = M1[4];
			M1[4] = TM;
			if(M1[3]>M1[2])
			{
				TM = M1[2];
				M1[2] = M1[3];
				M1[3] = TM;
						if(M1[2]>M1[1])
						{
							TM = M1[1];
							M1[1] = M1[2];
							M1[2] = TM;
						}
							if(M1[1]>M1[0])
							{
								TM = M1[0];
								M1[0] = M1[1];
								M1[1] = TM;
							}

			}
		}
	}
		
		}
	}// j


	if(M1[4] != 0)SizeX = M1[4];
	else if(M1[3] != 0)SizeX = M1[3];
	else if(M1[2] != 0)SizeX = M1[2];
	else if(M1[1] != 0)SizeX = M1[1];
	else SizeX = M1[0];

	if(SizeX < 0 ) SizeX = 0;

////////////////////////// Y /////////////////////
	o1 = E2;
	o2 = E3;
	
	Pass = 0,SumD1 = 0,SumD2 = 0,Count = 0,SD1 = 0,SD2 = 0;
	int Error = 1;
	for(i=0;i<wpic;i++)
	{
		D11 = 0;D12 = 0;D21 = 0;D22 = 0;
		for(j=0;j<hpic;j++)
		{
			if(*(o2+wpic*j) == 1 && j != 240)
			{
				if(D11 == 0)D11 = j;			
				else D12 = j;
			}
			if(*(o1+wpic*j) == 1 ||*(o1+wpic*j) == 0 && j != 240)
			{
				if(D21 == 0)D21 = j;			
				else D22 = j;
			}
			
		}// i
		o1++;
		o2++;
		if(D11 != 0 && D12 != 0 && D21 != 0 && D22 != 0)
		{
	
			SD1 = D11;							
			SD2 = D12 ;
			SumD1 = D11-D21 ;
			SumD2 = D12-D22 + Error;

			Count++;


	XYZ((double)SD2,(double)SumD2);
	SizeY = Size ;
	XYZ((double)SD1,(double)SumD1);
	SizeY = SizeY - Size;
	SizeY = SizeY / (28.346*100);


	if(SizeY>M2[4])
	{
		M2[4] = SizeY;
		if(M2[4]>M2[3])
		{
			TM = M2[3];
			M2[3] = M2[4];
			M2[4] = TM;
			if(M2[3]>M2[2])
			{
				TM = M2[2];
				M2[2] = M2[3];
				M2[3] = TM;
						if(M2[2]>M2[1])
						{
							TM = M2[1];
							M2[1] = M2[2];
							M2[2] = TM;
						}
							if(M2[1]>M2[0])
							{
								TM = M2[0];
								M2[0] = M2[1];
								M2[1] = TM;
							}

			}
		}
	}
		}
	}// j


	if(M2[4] != 0)SizeY = M2[4];
	else if(M2[3] != 0)SizeY = M2[3];
	else if(M2[2] != 0)SizeY = M2[2];
	else if(M2[1] != 0)SizeY = M2[1];
	else SizeY = M2[0];


	if(SizeY < 0 ) SizeY = 0;
}


void CYDlg::Color(int *object,int *E)
{
	int *o1 = object;
	int *o2 = E;
	bool put = false;
	C1 = 0;C2 = 0;C3 = 0;C4 = 0;C5 = 0;C6 = 0; C7 = 0;C8 = 0;
	double CT = 0;
	for(j=1;j<=hpic;j++)
	{	put = false;
		for(i=1;i<=wpic;i++)
			{
				if(i!=1&&i!=wpic&&j!=1&&j!=hpic)
				{
					if(*o2 == 0 && put == false)put = true;
					else if(*o2 == 0 && put == true)put = false;	
					if(put == true)
					{
						if(*o1>=0 && *o1<31)C1++;
						if(*o1>=32 && *o1<63)C2++;
						if(*o1>=64 && *o1<95)C3++;
						if(*o1>=96 && *o1<127)C4++;
						if(*o1>=128 && *o1<159)C5++;
						if(*o1>=160 && *o1<191)C6++;
						if(*o1>=192 && *o1<223)C7++;
						if(*o1>=224 && *o1<255)C8++;
					}
				}
				o1++;
				o2++;
			}
	}


	CT = C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8;
	C1 = C1 / CT;
	C2 = C2 / CT;
	C3 = C3 / CT;
	C4 = C4 / CT;
	C5 = C5 / CT;
	C6 = C6 / CT;
	C7 = C7 / CT;
	C8 = C8 / CT;

}

void CYDlg::SaveInput()
{
	CStdioFile S( Index,CFile::modeWrite); 
	S.SeekToEnd();	
	S.WriteString(NameReal);	
	S.WriteString("\n");
	

	CStdioFile s( Name, CFile::modeCreate | CFile::modeWrite); 
	


		char *buffer1=new char[10];
	////////////// X Y ////////////
		sprintf(buffer1,"%0.5f",SizeX);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",SizeY);
		s.WriteString(buffer1);
		s.WriteString("\n");

	////////////// C //////////////	
		sprintf(buffer1,"%0.5f",C1);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C2);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C3);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C4);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C5);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C6);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C7);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",C8);
		s.WriteString(buffer1);
		s.WriteString("\n");

	///////// Slope /////////
		sprintf(buffer1,"%0.5f",MST[1]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[2]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[3]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[4]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[5]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[6]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[7]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[8]);
		s.WriteString(buffer1);
		s.WriteString("\n");
		sprintf(buffer1,"%0.5f",MST[9]);
		s.WriteString(buffer1);
		s.WriteString("\n");


	free(buffer1);
}

void CYDlg::OnSaveFiledata() 
{
	// TODO: Add your command handler code here

	SizeX = 0;
	SizeY = 0;

	///////////////////

	int *E3 = new int[320*240];
	EdgeOut = E3;
	EdgeT = E3;
	NumberThreshold = 1;
	Group2(1,edgeT,SavePicT);/// output == edgeT

	int *E2 = new int[320*240];
	EdgeOut = E2;
	EdgeR = E2;
	NumberThreshold = 1;
	Group2(1,edgeR,savepic2);/// output == edgeR

	int *E1 = new int[320*240];
	
	
	EdgeOut = E1;
	EdgeL = E1;
	NumberThreshold = 1;
	Group2(6,edgeL,savepic);/// output == edgeL
	
	
	Color(savepic,E1); // OutPut to File C1 C2 C3 C4 C5 C6 C7 C8 //

	EdgeOut = E1;
	EdgeL = E1;
	Group2(100,edgeL,savepic);/// output == edgeL
	

	// OutPut to File MST[1] MST[2] MST[3] MST[4] 
	//         MST[5] MST[6] MST[7] MST[8] MST[9]

	MaxMin4(E1,E2,E3); // OutPut to File SizeX SizeY :: Width High


	SaveInput();

	
	free(E1);
	free(E2);
	free(E3);
	AfxMessageBox("Complete Save File");
}


void CYDlg::OnFileOpen3image() 
{
	// TODO: Add your command handler code here
	free(savepic);
	free(savepic2);
	free(SavePicT);
	CFileDialog fd(TRUE,NULL,NULL,NULL,"*.txt|*.txt|All File|*.*||");
	fd.DoModal();

	CString s1;
	CString s2;
	
	///////////////////////////////
	s1 = fd.GetPathName();
	s2 = fd.GetFileName();
	s2.Replace(".txt","_L.pgm");
	s1.Replace(fd.GetFileName(),s2);
    int *L =new int[320*240];	
	savepic = L;
	GetFile(s1,savepic);
	///////////////////////////////
	s1 = fd.GetPathName();
	s2 = fd.GetFileName();
	s2.Replace(".txt","_R.pgm");
	s1.Replace(fd.GetFileName(),s2);
    int *R =new int[320*240];	
	savepic2 = R;
	GetFile(s1,savepic2);
	///////////////////////////////
	s1 = fd.GetPathName();
	s2 = fd.GetFileName();
	s2.Replace(".txt","_T.pgm");
	s1.Replace(fd.GetFileName(),s2);
    int *T =new int[320*240];	
	SavePicT = T;
	GetFile(s1,SavePicT);
	///////////// Name //////////////////
	Name = fd.GetPathName();
	NameReal = fd.GetFileName();
	NameReal.Replace(".txt",".kit");
	Name.Replace(fd.GetFileName(),NameReal);

	//////////// Index /////////////////
	Index = fd.GetPathName();
	s2 = fd.GetFileName();
	Index.Replace(fd.GetFileName(),"Index.ind");
	CStdioFile s;
	if( !s.Open( Index,  CFile::modeWrite ) )
		s.Open(Index,CFile::modeCreate  );

/////////////////////////////
	Caption = "Left";
	Bx=90;By=310;Sx=320;Sy=270;
	Show = savepic;
	WINID = 1;
	OnLeft();
//////////////////////////////
	Caption = "Right";
	Bx=410;By=310;Sx=320;Sy=270;
	Show = savepic2;
	WINID = 2;
	OnLeft();
/////////////////////////////
	Caption = "Top";
	Bx=410;By=40;Sx=320;Sy=270;
	Show = SavePicT;
	WINID = 3;
	OnLeft();
	
}


void CYDlg::OnPgmHis() 
{
	// TODO: Add your command handler code here

	Caption = "Left";
	Bx=90;By=310;Sx=320;Sy=270;
	WINID = 1;
	Show = savepic;			
	OnHistogram() ;
/////////////////////////////
	Caption = "Right";
	Bx=410;By=310;Sx=320;Sy=270;
	WINID = 2;
	Show = savepic2;
	OnHistogram() ;
/////////////////////////////
	Caption = "Top";
	Bx=410;By=40;Sx=320;Sy=270;
	WINID = 3;
	Show = SavePicT;
	OnHistogram() ;
}



void CYDlg::OnImageprocessingShowedge() 
{
	// TODO: Add your command handler code here
	int *EE1 = new int[hpic*wpic];
	Show = EE1;
	Image1 = savepic;
	OnEdgeGradient() ;
	Caption = "Left";
	Bx=90;By=310;Sx=320;Sy=270;
	WINID = 1;
	OnEdge();
	
	int *EE2 = new int[hpic*wpic];
	Show = EE2;
	Image1 = savepic2;
	OnEdgeGradient() ;
	Bx=410;By=310;Sx=320;Sy=270;
	Caption = "Right";
	WINID = 2;
	OnEdge();
	
	int *EE3 = new int[hpic*wpic];
	Show = EE3;
	Image1 = SavePicT;
	OnEdgeGradient() ;
	Caption = "Top";
	Bx=410;By=40;Sx=320;Sy=270;
	WINID = 3;
	OnEdge();	

	F1 = EE1;
	F2 = EE2;
	F3 = EE3;
}

void CYDlg::OnSize(UINT nType, int cx, int cy) 
{
	CDialog::OnSize(nType, cx, cy);
	
	// TODO: Add your message handler code here
}

void CYDlg::OnImageprocessingShowedgeout() 
{
	// TODO: Add your command handler code here

	int *E3 = new int[320*240];
	EdgeOut = E3;
	EdgeT = E3;
	Group2(1,edgeT,SavePicT);/// output == edgeT

	int *E2 = new int[320*240];
	EdgeOut = E2;
	EdgeR = E2;
	Group2(1,edgeR,savepic2);/// output == edgeR

	int *E1 = new int[320*240];
	EdgeOut = E1;
	EdgeL = E1;
	Group2(100,edgeL,savepic);/// output == edgeL
	

	Caption = "Edge Left";
	Bx=90;By=310;Sx=320;Sy=270;
	WINID = 1;
	Show = EdgeL;
	OnEdge();

	Caption = "Edge Right";
	Show = EdgeR;
	Bx=410;By=310;Sx=320;Sy=270;
	WINID = 2;
	OnEdge();

	Caption = "Edge Top";
	Show = EdgeT;
	Bx=410;By=40;Sx=320;Sy=270;
	WINID = 3;
	OnEdge();

	WINID = 0;

	F1 = E1;
	F2 = E2;
	F3 = E3;


}


void CYDlg::Color1(int *Object1,int *Object2,int *Object3)
{
	int *o1 = Object1;//savepic
	int *o2 = Object2;//E1
	int *o3 = Object3;//Area
	bool put = false;

	for(j=1;j<=hpic;j++)
	{	put = false;
		for(i=1;i<=wpic;i++)
			{
				if(i!=1&&i!=wpic&&j!=1&&j!=hpic)
				{
					if(*o2 == 0  && put == false)put = true;
					else if(*o2 == 0  && put == true)put = false;	
					if(put == true)
					{*o3 = *o1;}else *o3 = 210;
				}
				o1++;
				o2++;
				o3++; 
			}
	}

}

void CYDlg::OnImageprocessingColorobjectarea() 
{
	// TODO: Add your command handler code here
	
	int *E1 = new int[320*240];
	EdgeOut = E1;
	EdgeL = E1;
	Group2(6,edgeL,savepic);/// output == edgeL
	int *Area1 = new int[320*240];
	Color1(savepic,E1,Area1);
	
	Caption = "Left Color Area";
	Show = Area1;
	Bx=90;By=310;Sx=320;Sy=270;
	WINID = 1;
	OnLeft();
/////////////////////////////////////////////////
	int *E2 = new int[320*240];
	EdgeOut = E2;
	EdgeL = E2;
	Group2(6,edgeL,savepic2);/// output == edgeL
	int *Area2 = new int[320*240];
	Color1(savepic2,E2,Area2);

	Caption = "Right Color Area";
	Show = Area2;
	Bx=410;By=310;Sx=320;Sy=270;
	WINID = 2;
	OnLeft();
////////////////////////////////////////////////
	int *E3 = new int[320*240];
	EdgeOut = E3;
	EdgeL = E3;
	Group2(6,edgeL,SavePicT);/// output == edgeL

	int *Area3 = new int[320*240];
	Color1(SavePicT,E3,Area3);
	Caption = "Top Color Area";
	Show = Area3;
	Bx=410;By=40;Sx=320;Sy=270;
	WINID = 3;
	OnLeft();
///////////////////////////////////////////////
	WINID = 0;



}




void CYDlg::OnImageprocessingShowimage() 
{
	// TODO: Add your command handler code here
	/////////////////////////////
	Caption = "Left";
	Bx=90;By=310;Sx=320;Sy=270;
	Show = savepic;
	WINID = 1;
	OnLeft();
//////////////////////////////
	Caption = "Right";
	Bx=410;By=310;Sx=320;Sy=270;
	Show = savepic2;
	WINID = 2;
	OnLeft();
/////////////////////////////
	Caption = "Top";
	Bx=410;By=40;Sx=320;Sy=270;
	Show = SavePicT;
	WINID = 3;
	OnLeft();

}
