// ProjectDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Project.h"
#include "ProjectDlg.h"
#include "ezusbsys.h"
#include <winioctl.h>		//TPM for CTL_CODE

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

BOOLEAN
bOpenDriver (HANDLE * phDeviceHandle, PCHAR devname);

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg dialog

CProjectDlg::CProjectDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CProjectDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CProjectDlg)
	m_edit1 = _T("0000");
	m_count = _T("00001");
	m_output = _T("");
	m_addr = _T("00");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CProjectDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CProjectDlg)
	DDX_Text(pDX, IDC_EDIT1, m_edit1);
	DDV_MaxChars(pDX, m_edit1, 4);
	DDX_Text(pDX, IDC_COUNT, m_count);
	DDV_MaxChars(pDX, m_count, 5);
	DDX_Text(pDX, IDC_OUTPUT, m_output);
	DDX_Text(pDX, IDC_ADDR, m_addr);
	DDV_MaxChars(pDX, m_addr, 2);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CProjectDlg, CDialog)
	//{{AFX_MSG_MAP(CProjectDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDCANCEL, OnClose)
	ON_BN_CLICKED(IDC_BUTTON1, OnWrite)
	ON_BN_CLICKED(IDC_CLEAR, OnClear)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg message handlers

BOOL CProjectDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
//	str = "";
		
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CProjectDlg::OnPaint() 
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
HCURSOR CProjectDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

BOOLEAN
bOpenDriver (HANDLE * phDeviceHandle, PCHAR devname)
{
    char completeDeviceName[64] = "";
    char pcMsg[64] = "";

    strcat (completeDeviceName,
            "\\\\.\\"
            );

    strcat (completeDeviceName,
		    devname
		    );

    *phDeviceHandle = CreateFile(   completeDeviceName,
		                            GENERIC_WRITE,
		                            FILE_SHARE_WRITE,
		                            NULL,
		                            OPEN_EXISTING,
		                            0,
		                            NULL);

    if (*phDeviceHandle == INVALID_HANDLE_VALUE) {
        return (FALSE);
    } else {
        return (TRUE);
    } /*else*/


}

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg OnClose()
// result : Close Program
/////////////////////////////////////////////////////////////////////////////
void CProjectDlg::OnClose() 
{
	CDialog::OnCancel();
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg OnWrite()
// result : write data to Ezy board
/////////////////////////////////////////////////////////////////////////////
void CProjectDlg::OnWrite() 
{
	UpdateData(TRUE);
	HANDLE  hDevice = NULL;
	char *pcDriverName = {"Ezusb-0"};
//	WCHAR buffer;
    BULK_TRANSFER_CONTROL bulkControl;
	DWORD ioctl_val = IOCTL_EZUSB_BULK_WRITE;
    int nBytes = 0;
	int bResult;
	int err = 0;
	char ch[5];
	for(int i=0;i<4;i++)
	{
		ch[i] = NULL;
	}

	char ch2[5];
	for(i=0;i<2;i++)
	{
		ch2[i] = NULL;
	}


//------------------------------------------------
	char command[5];
	GetDlgItemText(IDC_ADDR,ch2,3);
	invert(ch2,2);
	int addr = convertHexToInt2(ch2);

	GetDlgItemText(IDC_EDIT1,ch,5);
	invert(ch,4);
	int data = convertHexToInt4(ch);
	ULONG length = 2*atoi( m_count);

	int count = atoi(m_count);
//------------------------------------------------

	while(count > 0)
	{
		command[0] = '0';
		command[1] = (char)addr;
		command[2] = (char)atoi( "87" );
		command[3] = '0';
		command[4] = '0';
    
		bulkControl.pipeNum = 6;

		if (bOpenDriver (&hDevice, pcDriverName) != TRUE)
		{
			hDevice = NULL;
		}

		if (hDevice == NULL)
		{
			m_output += "PC didn't connect board\x0d\x0a";
		}

		if (hDevice != NULL)
		{
			bResult = DeviceIoControl(hDevice,
						ioctl_val,
						&bulkControl,
						sizeof (BULK_TRANSFER_CONTROL),
						command,
						5,
						(unsigned long *)&nBytes,
						NULL);

			bulkControl.pipeNum = 4;
    
			bResult = DeviceIoControl(hDevice,
						ioctl_val,
						&bulkControl,
						sizeof (BULK_TRANSFER_CONTROL),
						command,
						5,
						(unsigned long *)&nBytes,
						NULL);

//-----------------------------------------------
//			buffer = (char)data;

			bulkControl.pipeNum = 2;

			bResult = DeviceIoControl(hDevice,
						ioctl_val,
						&bulkControl,
						sizeof (BULK_TRANSFER_CONTROL),
						&data,
						length,
//						2,
						(unsigned long *)&nBytes,
						NULL);

			for(i=0;i<4;i++){
				if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				   ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9' || \
				   ch[i]=='A' || ch[i]=='B' || ch[i]=='C' || ch[i]=='D' || ch[i]=='E' || \
				   ch[i]=='F')
				{
					
				}else
				{
					err = 1;
				}
			}

			for(i=0;i<2;i++){
				if(ch2[i]=='0' || ch2[i]=='1' || ch2[i]=='2' || ch2[i]=='3' || \
				   ch2[i]=='4' || ch2[i]=='5' || ch2[i]=='6' || ch2[i]=='7' || ch2[i]=='8' || \
				   ch2[i]=='9' || ch2[i]=='A' || ch2[i]=='B' || ch2[i]=='C' || ch2[i]=='D' || \
				   ch2[i]=='E' || ch2[i]=='F')
				{
					
				}else
				{
					err = 2;
				}
			}

			if(err==1)	
				MessageBox("Please enter data word [0-F]","Data Error",MB_ICONSTOP);
			else if(err==2)
				MessageBox("Please enter address word [0-F]","Address Error",MB_ICONSTOP);
			else
			{
				char sAddr = (char)addr;
				m_output += "\x0d\x0aWRITE:\x0d\x0a";
				m_output += "** ";
				for(int k=0;k<2;k++)
					m_output += ch2[k];
				m_output += " **  ";
				for(int l=0;l<4;l++)
					m_output += ch[l];
				m_output += "\x0d\x0a";
			}
		}
		count--;
		addr++;
		//if()
	}
	CloseHandle (hDevice);
	UpdateData(FALSE);
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg OnClear()
// result : Clear screen Output
/////////////////////////////////////////////////////////////////////////////
void CProjectDlg::OnClear() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	m_output = "";
	UpdateData(FALSE);
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg OnClear()
// result : arrange data into array to bcd-8421
/////////////////////////////////////////////////////////////////////////////
void CProjectDlg::invert(char* ch,int num)
{
	char* temp = new char[num];
	int count=0;
	for(int i=0;i<num;i++)
	{
		temp[i] = '0';
	}
	for(int j=0;j<num;j++)
	{
		if(ch[j]==NULL)
			count++;
	}
	for(j=0;j<count;j++)
	{
		for(int i=num-1;i>0;i--)
		{
			if(ch[i]==NULL)
			{
				temp[i]=ch[i];
				ch[i]=ch[i-1];
				ch[i-1]=temp[i];
			}
		}
	}
	for(i=0;i<num;i++)
	{
		if(ch[i]==NULL)
			ch[i] = '0';
	}
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg convertHexToInt2()
// result : convert hexadecimal number to decimal number 2 bit
// return : decimal number type Integer
/////////////////////////////////////////////////////////////////////////////
int CProjectDlg::convertHexToInt2(char* ch)
{
	int val,temp;
	CString convert;
	val = 0;
	temp = 0;
	for(int i=0;i<2;i++)
	{
		convert = "";
		if((i==0) && (ch[i]!='0') && (ch[i]!=NULL))
		{
			if(ch[i] == 'a')
			{
				ch[i] = 'A';
				val += 10*(16);
			}
			else if(ch[i] == 'b')
			{
				ch[i] = 'B';
				val += 11*(16);
			}
			else if(ch[i] == 'c')
			{
				ch[i] = 'C';
				val += 12*(16);
			}
			else if(ch[i] == 'd')
			{
				ch[i] = 'D';
				val += 13*(16);
			}
			else if(ch[i] == 'e')
			{
				ch[i] = 'E';
				val += 14*(16);
			}
			else if(ch[i] == 'f')
			{
				ch[i] = 'F';
				val += 15*(16);
			}
			else if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9')
			{
				convert += ch[i];
				temp = atoi(convert);
				val += temp*(16);
			}

		}else if((i==1) && (ch[i]!='0') && (ch[i]!=NULL))
		{
			if(ch[i] == 'a')
			{
				ch[i] = 'A';
				val += 10;
			}
			else if(ch[i] == 'b')
			{
				ch[i] = 'B';
				val += 11;
			}
			else if(ch[i] == 'c')
			{
				ch[i] = 'C';
				val += 12;
			}
			else if(ch[i] == 'd')
			{
				ch[i] = 'D';
				val += 13;
			}
			else if(ch[i] == 'e')
			{
				ch[i] = 'E';
				val += 14;
			}
			else if(ch[i] == 'f')
			{
				ch[i] = 'F';
				val += 15;
			}
			else if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9')
			{
				convert += ch[i];
				temp = atoi(convert);
				val += temp;
			}
		}
	}
	return val;
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg convertHexToInt4()
// result : convert hexadecimal number to decimal number 4 bit
// return : decimal number type Integer
/////////////////////////////////////////////////////////////////////////////
int CProjectDlg::convertHexToInt4(char* ch)
{
	int val,temp;
	CString convert;
	val = 0;
	temp = 0;
	for(int i=0;i<4;i++)
	{
		convert = "";
		if((i==0) && (ch[i]!='0') && (ch[i]!=NULL))
		{
			if(ch[i] == 'a')
			{
				ch[i] = 'A';
				val += 10*(16*16*16);
			}
			else if(ch[i] == 'b')
			{
				ch[i] = 'B';
				val += 11*(16*16*16);
			}
			else if(ch[i] == 'c')
			{
				ch[i] = 'C';
				val += 12*(16*16*16);
			}
			else if(ch[i] == 'd')
			{
				ch[i] = 'D';
				val += 13*(16*16*16);
			}
			else if(ch[i] == 'e')
			{
				ch[i] = 'E';
				val += 14*(16*16*16);
			}
			else if(ch[i] == 'f')
			{
				ch[i] = 'F';
				val += 15*(16*16*16);
			}
			else if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9')
			{
				convert += ch[i];
				temp = atoi(convert);
				val += temp*(16*16*16);
			}

		}else if((i==1) && (ch[i]!='0') && (ch[i]!=NULL))
		{
			if(ch[i] == 'a')
			{
				ch[i] = 'A';
				val += 10*(16*16);
			}
			else if(ch[i] == 'b')
			{
				ch[i] = 'B';
				val += 11*(16*16);
			}
			else if(ch[i] == 'c')
			{
				ch[i] = 'C';
				val += 12*(16*16);
			}
			else if(ch[i] == 'd')
			{
				ch[i] = 'D';
				val += 13*(16*16);
			}
			else if(ch[i] == 'e')
			{
				ch[i] = 'E';
				val += 14*(16*16);
			}
			else if(ch[i] == 'f')
			{
				ch[i] = 'F';
				val += 15*(16*16);
			}
			else if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9')
			{
				convert += ch[i];
				temp = atoi(convert);
				val += temp*(16*16);
			}

		}else if((i==2) && (ch[i]!='0') && (ch[i]!=NULL))
		{
			if(ch[i] == 'a')
			{
				ch[i] = 'A';
				val += 10*(16);
			}
			else if(ch[i] == 'b')
			{
				ch[i] = 'B';
				val += 11*(16);
			}
			else if(ch[i] == 'c')
			{
				ch[i] = 'C';
				val += 12*(16);
			}
			else if(ch[i] == 'd')
			{
				ch[i] = 'D';
				val += 13*(16);
			}
			else if(ch[i] == 'e')
			{
				ch[i] = 'E';
				val += 14*(16);
			}
			else if(ch[i] == 'f')
			{
				ch[i] = 'F';
				val += 15*(16);
			}
			else if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9')
			{
				convert += ch[i];
				temp = atoi(convert);
				val += temp*(16);
			}

		}else if((i==3) && (ch[i]!='0') && (ch[i]!=NULL))
		{
			if(ch[i] == 'a')
			{
				ch[i] = 'A';
				val += 10;
			}
			else if(ch[i] == 'b')
			{
				ch[i] = 'B';
				val += 11;
			}
			else if(ch[i] == 'c')
			{
				ch[i] = 'C';
				val += 12;
			}
			else if(ch[i] == 'd')
			{
				ch[i] = 'D';
				val += 13;
			}
			else if(ch[i] == 'e')
			{
				ch[i] = 'E';
				val += 14;
			}
			else if(ch[i] == 'f')
			{
				ch[i] = 'F';
				val += 15;
			}
			else if(ch[i]=='0' || ch[i]=='1' || ch[i]=='2' || ch[i]=='3' || ch[i]=='4' || \
				ch[i]=='5' || ch[i]=='6' || ch[i]=='7' || ch[i]=='8' || ch[i]=='9')
			{
				convert += ch[i];
				temp = atoi(convert);
				val += temp;
			}
		}
	}
	return val;
}
