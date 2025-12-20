// cvisionDlg.cpp : implementation file
//

#include "stdafx.h"
#include "cvision.h"
#include "cvisionDlg.h"
#include "cvapp.h"
#include "FImgProc.h"
#include "FImage.h"
#include "ImgProc1.h"
#include "Img.h"
#include ".\cvisiondlg.h"

#include "SnaperHelperLib.h"
#include "eztwain.h" //
#include "twain.h"   //

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CCvisionDlg dialog

CCvisionDlg::CCvisionDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CCvisionDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCvisionDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	hdib = NULL;
	linethreshold = -1;
}

void CCvisionDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCvisionDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
		DDX_Control(pDX, IDC_SLIDER1, m_slid1);
		DDX_Control(pDX, IDC_SLIDER2, m_slid2);
		DDX_Control(pDX, IDC_LIST1, m_list01);
		DDX_Control(pDX, IDC_LIST2, m_list02);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CCvisionDlg, CDialog)
	//{{AFX_MSG_MAP(CCvisionDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnOpen)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_BUTTON2, OnProcess)
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTON3, OnBnClickedButton3)
//	ON_BN_CLICKED(ID_OPEN, OnBnClickedOpen)
ON_NOTIFY(NM_CUSTOMDRAW, IDC_SLIDER1, OnNMCustomdrawSlider1)
ON_NOTIFY(NM_CUSTOMDRAW, IDC_SLIDER2, OnNMCustomdrawSlider2) 
ON_UPDATE_COMMAND_UI(IDC_Loadweight, OnUpdateButton1)
ON_BN_CLICKED(ID_SETTH, OnBnClickedSetth)
ON_BN_CLICKED(IDC_Loadweight, OnBnClickedLoadweight)
ON_BN_CLICKED(IDC_Saveweight, OnBnClickedSaveweight)
ON_BN_CLICKED(IDOK, OnBnClickedOk)
ON_BN_CLICKED(IDC_Adaptive, OnBnClickedAdaptive)
ON_BN_CLICKED(ID_REGCAP, OnBnClickedRegcap)
ON_BN_CLICKED(ID_SELECTSOURCE, OnBnClickedSelectsource)
ON_BN_CLICKED(ID_ACCUIRE, OnBnClickedAccuire)
ON_BN_CLICKED(ID_NOISERE, OnBnClickedNoisere)
ON_BN_CLICKED(IDC_BUTTON4, OnBnClickedButton4)
ON_BN_CLICKED(IDC_BUTTON5, OnBnClickedButton5)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCvisionDlg message handlers

BOOL CCvisionDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	//m_slid1.
	
	m_slid1.SetRange(0,255);
	m_slid1.SetRangeMin(0);
	m_slid1.SetRangeMax(255);

	m_slid1.SetPos(127);
	m_slid1.SetBuddy( GetDlgItem( ID_WSIZE ) );
	m_slid1.SetTicFreq( 5 );
	m_slid1.SetPageSize( 10 );

	m_slid2.SetRange(0,100);
	m_slid2.SetRangeMin(0);
	m_slid2.SetRangeMax(100);

	m_slid2.SetPos(0);
	m_slid2.SetBuddy( GetDlgItem( IDC_EDIT4 ) );
	m_slid2.SetTicFreq( 5 );
	m_slid2.SetPageSize( 10 );

	
	proc.initnn();

	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CCvisionDlg::OnPaint() 
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
HCURSOR CCvisionDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


void CCvisionDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	if ( pScrollBar )
	{
		CCCslider* pSlider = (CCCslider*)pScrollBar;
		pSlider->ReflectedScrollMessage();
	}
	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
}
	

void CCvisionDlg::OnOpen() 
{	
  CFileDialog dlg(TRUE, _T("*.bmp"), "", 
                  OFN_FILEMUSTEXIST|OFN_PATHMUSTEXIST|OFN_HIDEREADONLY,
                  "image files (*.bmp; *.jpg) |*.bmp;*.jpg|AVI files (*.avi) |*.avi|All Files (*.*)|*.*||",NULL);

  char title[] = "Open Image";
  dlg.m_ofn.lpstrTitle= title;

  if(dlg.DoModal() == IDOK)
  {
    CString path = dlg.GetPathName();

    //proc.setfilename(path);					
	proc.setfilename(path);
	proc.showImage();
  }
}

void CCvisionDlg::OnProcess() 
{
	int *b_blob = new int [1000];
	
	int **lll = new int* [30]; //we limit to 30 lines

	for(int i = 0;i < 30;i++)
	{
		lll[i] = new int [4];
	}

	char buf[256];	
	int number = 0;
	int number_2 = 0;


    proc.execute(b_blob,number,lll,number_2,linethreshold);


	m_list01.ResetContent();
	for(int i = 0;i < number;i++) 
	{
		sprintf(buf,"id:%d & is:%d", i , b_blob[i] );
		m_list01.AddString(buf);
	}
	m_list01.SetCurSel(m_list01.GetCount()-1);

	m_list02.ResetContent();
	for(int k = 0;k < number_2;k++)
	{
		//sprintf(buf,"Line %d", k + 1);
		//m_list02.AddString(buf);
		for(int j = 0;j < 4;j++)
		{
			sprintf(buf,"Lin %d Lev %d @ %d ", k + 1 , j , lll[k][j] );
			m_list02.AddString(buf);
		}
	}
	//m_list02.SetCurSel(m_list02.GetCount()-1);

	for(int k = 0;k < 30;k++)
		delete[] lll[k];

	delete[] lll;
	delete[] b_blob;
}
BOOL CCvisionDlg::convertfloat(int nID, float& floatval) 
{
	CString charval; 

	GetDlgItemText(nID, charval);

	floatval = atof(charval); 

	if(nID == IDlearnr)
	{
		if((floatval >= 0.1) && (floatval < 1.0))
			return TRUE;
		else
			return FALSE;
	}

	if(nID == IDerrorl)
	{
		if((floatval >= 0.0005) && (floatval < 1.0))
			return TRUE;
		else
			return FALSE;
	}

	if(nID == IDmomenv)
	{
		if((floatval >= 0.5) && (floatval < 1.5))
			return TRUE;
		else
			return FALSE;
	}
}
void CCvisionDlg::OnBnClickedButton3()
{
	CButton *butChk;
	CButton *bu;
	float p1,p2,p3;
	BOOL select,ok1,ok2,ok3;
	int nepochs;
	
	ok1 = convertfloat(IDlearnr,p1);
	ok2 = convertfloat(IDerrorl,p2);
	
	nepochs = GetDlgItemInt(IDEPOCHS);

	if(nepochs < 0)
	{
		//do something here

	}


	butChk = (CButton *)GetDlgItem(IDwithm);
	if(butChk->GetCheck() == 1)
	{
		ok3 = convertfloat(IDmomenv,p3);
	}
	else
	{
		ok3 = FALSE;
		p3 = 0.0;
	}

	if((ok1 == TRUE)&&(ok2 == TRUE))
		proc.setBPparameter(p1,p2);

	if(ok3 == TRUE)
		proc.setBPWMparameter(ok3,p3);
	//show user that the network wasn't train
	SetDlgItemText(IDC_STATUS_NN,"Please wait...");
	proc.trainNetwork(nepochs);

	bu = (CButton *)GetDlgItem(IDC_Saveweight);
	bu->EnableWindow(TRUE);
	
	bu = (CButton *)GetDlgItem(IDC_Adaptive);
	bu->EnableWindow(FALSE);

	SetDlgItemText(IDC_STATUS_NN,"Train finished");
	//show user that train complete
}
//void CCvisionDlg::OnBnClickedOpen()
//{}
void CCvisionDlg::OnNMCustomdrawSlider1(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMCUSTOMDRAW pNMCD = reinterpret_cast<LPNMCUSTOMDRAW>(pNMHDR);
	// TODO: Add your control notification handler code here
	*pResult = 0;
}
void CCvisionDlg::OnNMCustomdrawSlider2(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMCUSTOMDRAW pNMCD = reinterpret_cast<LPNMCUSTOMDRAW>(pNMHDR);
	// TODO: Add your control notification handler code here
	*pResult = 0;
}
void CCvisionDlg::OnBnClickedSetth()
{
	int m;

	m = GetDlgItemInt(ID_WSIZE, NULL, FALSE);
	
	if( (m%2) == 1 )
	{
		proc.windowSize = m;
		proc.adaptiveTH();
	}
	else		
		MessageBox("Please submit only odd number");
}

void CCvisionDlg::OnBnClickedLoadweight()
{
	bool a;
	CButton *defbuf;
	// TODO: Add your control notification handler code here
	a = proc.loadw();
	if(a == true) 
	{
		defbuf = (CButton *)GetDlgItem(IDC_Loadweight);
		defbuf->EnableWindow(FALSE);
	}
	defbuf = (CButton *)GetDlgItem(IDC_Saveweight);
	defbuf->EnableWindow(TRUE);
}

void CCvisionDlg::OnBnClickedSaveweight()
{
	bool b;
	CButton *buf;
	// TODO: Add your control notification handler code here
	b = proc.savew();
	if(b == true)
	{
		buf = (CButton *)GetDlgItem(IDC_Saveweight);
		buf->EnableWindow(FALSE);
	}
	buf = (CButton *)GetDlgItem(IDC_Loadweight);
	buf->EnableWindow(TRUE);
}
void CCvisionDlg::OnUpdateButton1(CCmdUI* pCmdUI)
{
    pCmdUI->Enable( FALSE );
}
//void CCvisionDlg::show_error(double err)
//{
//	char display[80];
//	sprintf(display,"%.5f",err);
//	SetDlgItemText(ID_ERROR_NUM,display);
//}
void CCvisionDlg::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
	proc.releasehebrain();
	OnOK();
}

void CCvisionDlg::OnBnClickedAdaptive()
{
	// TODO: Add your control notification handler code here
	int pp;
	CButton *sche1;
	CButton *sche2;
	CButton *sche3;
	CButton *temp;

	sche1 = (CButton *)GetDlgItem(IDC_RADIO1);
	sche2 = (CButton *)GetDlgItem(IDC_RADIO2);
	sche3 = (CButton *)GetDlgItem(IDC_RADIO3);

	if(sche1->GetCheck() == 1)
		pp = 1;
	else if(sche2->GetCheck() == 1)
		pp = 2;
	else if(sche3->GetCheck() == 1)
		pp = 3;
	else
		pp = 0;
	
	proc.setscheme(pp);

	temp = (CButton *)GetDlgItem(IDC_Adaptive);
	temp->EnableWindow(FALSE);
}

int xX = -1,yY = -1;
//CSize Size;

void on_mouse( int event, int x, int y, int flags, void* param )
{
	char temp[15];
	sprintf(temp , "%d %d" , x , y );
	xX = x;
	yY = y;

	switch( event )
	{
		case CV_EVENT_LBUTTONDOWN:
        {
			CSize Size;
			//MessageBox(NULL , "Jitkasem" , "Lin" , MB_OK);
			FImage Images; //[2]
			FImgProc fal;
			int www,remind,hhh;
			IplImage *img = NULL;
			IplImage *imgcl = NULL;
			unsigned char *_data = NULL;
			HBITMAP hImage = GetRegionImage(&Size);
			fal.initial();

			IplImage* image;
			image = cvLoadImage( "thresholdimg.bmp" , 1 ); 
		
			www = image->width;
			hhh = image->height;

			if( (www%4) > 0 )
			{
    			remind = www%4;

				if(remind == 1) //this is only one
				{
					www = www - 1;
				}
				else			//this mean more than 1 ( 2, 3)
				{
					www = www + (4 - remind);
				}
				imgcl = cvCloneImage( image );
				img = cvCreateImage( cvSize(www, hhh), 8, 3 );
				cvResize( imgcl , img , CV_INTER_CUBIC );
				_data = reinterpret_cast<unsigned char *>(img->imageData);
			}
		    else
			{
				img = cvCloneImage( image );
				_data  = reinterpret_cast<unsigned char *>(img->imageData);
			}
			Images.Create((F_PIXEL*)_data, img->width , img->height );

			if(( (xX + Size.cx) >= img->width ) || ( (yY + Size.cy) >= img->height ))
				return;

			fal.PutFloodfillRegion( Images , xX , yY , xX + Size.cx , yY + Size.cy );						//(int)Size.cy,xX,yY);
						
		    unsigned char *data__1 = reinterpret_cast<unsigned char *>(Images.m_data); //dst.m_pImgDat
			IplImage *test = cvCreateImage( cvSize( Images.m_width , Images.m_height ) , 8 , 3);
			test->imageData = (char *)data__1;

			sprintf(temp, "thresholdimg.bmp" );
			cvSaveImage( temp , test );

			cvNamedWindow( "AdaptiveTH" , CV_WINDOW_AUTOSIZE );
			cvShowImage( "AdaptiveTH", test );
			fal.cleanmem();

			break;
		}
	}
}

void CCvisionDlg::OnBnClickedRegcap()
{
	// TODO: Add your control notification handler code here
	CString resul;

	CSize Size,sss;
	BITMAP bmpX;
	DWORD dwValue1;//,dwValue2;	
	char buf[20];

	resul = proc.getfilename();

	if(resul == "NO")
		return;

	//CDC memdcX,memdcY;
	//memdcX.CreateCompatibleDC(pDC);//map these CDC objects to your window DC
	//memdcY.CreateCompatibleDC(pDC);

	HBITMAP hImage = GetRegionImage(&Size);
	CBitmap *bmp = CBitmap::FromHandle(hImage);
	bmp->GetBitmap(&bmpX);
	BYTE* bmpBuffer = (BYTE*)GlobalAlloc(GPTR,bmpX.bmWidthBytes * bmpX.bmHeight);
	dwValue1 = bmp->GetBitmapBits(bmpX.bmWidthBytes * bmpX.bmHeight,bmpBuffer);

	int nPixels = bmpX.bmWidth * bmpX.bmHeight;

//	BYTE* pBits32 = new BYTE[4*nPixels];
	BYTE* pBits24 = new BYTE[3*nPixels]; 

	for(int i = 0,nAlphaCounter = 0;i < 4*nPixels;i++)
	{ 
		if( (i+1)%4 == 0)
		{
			nAlphaCounter++; 
		}
		else
		{ 
			pBits24[i-nAlphaCounter] = bmpBuffer[i];
		}
	}

//	IplImage *only = cvCreateImage( cvSize(bmpX.bmWidth , bmpX.bmHeight));
//	sss = bmp->GetBitmapDimension();
//	bmp->get
//	UpdateImage(hImage, Size);	  	 
//	mybmp.GetBitmap(&bmpX);//Get bitmap dimensions into BITMAP structure.
//	BYTE* bmpBuffer=(BYTE*)GlobalAlloc(GPTR,bmpX.bmWidthBytes*bmpX.bmHeight);//allocate memory for image byte buffer
//	dwValue=mybmp.GetBitmapBits(bmpX.bmWidthBytes*bmpX.bmHeight,bmpBuffer);//Get the bitmap bits int a structure
	
	// find the number of padding bytes
	unsigned char *paddedImage = NULL,*paddedImagePtr,*imagePtr;
	unsigned int bytesize,extrabytes;
	int row,column;

	int width = bmpX.bmWidth;
	int height = bmpX.bmHeight;
	extrabytes = (4 - (width * 3) % 4) % 4;
	bytesize = (width * 3 + extrabytes) * height;

	paddedImage = (unsigned char *)calloc(sizeof(unsigned char),bytesize);
	if(paddedImage == NULL)
	{
		return;
	}

	for(row = 0;row < height;row++)
	{
		imagePtr = pBits24 + (row * width * 3);				 //height - 1 - 
		paddedImagePtr = paddedImage + row * (width * 3 + extrabytes);
		for (column = 0; column < width; column++) 
		{
			*paddedImagePtr = *(imagePtr);
			*(paddedImagePtr + 1) = *(imagePtr + 1);
			*(paddedImagePtr + 2) = *(imagePtr + 2);
			imagePtr += 3;
			paddedImagePtr += 3;
		}
	}

	IplImage *only = cvCreateImage( cvSize(width , height) , 8 , 3);
	only->imageData = (char *)paddedImage;

	sprintf(buf,"temp.bmp");
	cvSaveImage(buf,only);

	proc.setfilename(buf);

	cvNamedWindow( "After_region" , CV_WINDOW_AUTOSIZE );
	cvShowImage( "After_region" , only );

//////	cvSetMouseCallback( "After" , on_mouse , 0 );

}

void CCvisionDlg::OnBnClickedSelectsource()
{
	// TODO: Add your control notification handler code here
	TWAIN_SelectImageSource(NULL);
	//TWAIN_SelectImageSource(NULL);
}
//--------------------------------------------------------------------------

void CCvisionDlg::DiscardImage(void)
// delete/free global palette, and dib, as necessary.
{
//	if (hpal) 
//	{
//		DeleteObject(hpal);
//		hpal = NULL;
//	}
	if(hdib) 
	{
		TWAIN_FreeNative(hdib);
		hdib = NULL;
	}
} // DiscardImage

void CCvisionDlg::OnBnClickedAccuire()
{
	// TODO: Add your control notification handler code here
	
	// TODO: Add your control notification handler code here
	DiscardImage();
	//InvalidateRect(hwnd, NULL, TRUE);
	TWAIN_SetHideUI(TRUE);
	if (TWAIN_OpenDefaultSource()) 
	{
         TWAIN_SetCurrentUnits(TWUN_INCHES);
         TWAIN_SetCurrentPixelType(TWPT_RGB);
         TWAIN_SetBitDepth(24);
         TWAIN_SetCurrentResolution(300.0);
         //hdib = TWAIN_AcquireNative(hwnd, 0);
		   hdib = TWAIN_AcquireNative(NULL, 0);
    }
	if(hdib)
	{
		int result = TWAIN_WriteNativeToFilename(hdib, "scaned.bmp");
		//	-1	user cancelled File Save dialog
		//	-2	could not create or open file for writing
		//	-3	(weird) unable to access DIB
		//	-4	writing to .BMP failed, maybe output device is full?
		if (result < -1) 
		{
			//LoadString(hInst, IDS_ERR_WRITE, szMessage, sizeof szMessage);
			MessageBox("Error", "Error", MB_ICONINFORMATION | MB_OK);
			//MessageBox(
		}
		else
		{
			proc.setfilename("scaned.bmp");
			proc.showImage();
		}
	}
}

void CCvisionDlg::OnBnClickedNoisere()
{
	// TODO: Add your control notification handler code here
	cvSetMouseCallback( "AdaptiveTH" , on_mouse , 0 );
	
//	while( (xX == -1) && (yY == -1) )
//	{

//	}
	//on_mouse;
//	cvSetMouseCallback( "Original Image" , on_mouse , 0 );
//	cvSetMouseCallback( "Original Image" , on_mouse , 0 );
}

//void CCvisionDlg::OnBnClickedNoisere()
//{
	// TODO: Add your control notification handler code here
//}

void CCvisionDlg::OnBnClickedButton4()
{
	// TODO: Add your control notification handler code here
	linethreshold = GetDlgItemInt(IDC_EDIT4 , NULL , FALSE);
	MessageBox("Notice", "Please click on Recognition agains", MB_ICONINFORMATION | MB_OK);
}

void CCvisionDlg::OnBnClickedButton5()
{
	// TODO: Add your control notification handler code here
	//CString mini;
	char *result = new char [150];
	int i;
	CString temp;
	temp = proc.getfilename();

	//temp = (char *)mini;

	int len = strlen(temp);
	int index = len - 1;

	while(temp[index] != '\\')
		index--;

	for(i = 0;i <= index;i++)
		result[i] = temp[i];

	//temp[index+1] = 34;result
    result[index+1] = 'r';
	result[index+2] = 'e';
	result[index+3] = 's';
	result[index+4] = 'u';
	result[index+5] = 'l';
	result[index+6] = 't';
	result[index+7] = '.';
	result[index+8] = 't';
	result[index+9] = 'x';
	result[index+10] = 't';
	result[index+11] = '\0';

	temp = result;

	HINSTANCE HINSsd = ShellExecute(NULL,"open",temp,NULL,NULL,SW_SHOWNORMAL);
	delete [] result;
}
