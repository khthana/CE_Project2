// TestDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Test.h"
#include "TestDlg.h"
#include "DlgProxy.h"
#include <stdlib.h>
#include <math.h>
#include "Show.h"

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
// CTestDlg dialog

IMPLEMENT_DYNAMIC(CTestDlg, CDialog);

CTestDlg::CTestDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTestDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTestDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	m_pAutoProxy = NULL;

}

CTestDlg::~CTestDlg()
{
	// If there is an automation proxy for this dialog, set
	//  its back pointer to this dialog to NULL, so it knows
	//  the dialog has been deleted.
	if (m_pAutoProxy != NULL)
		m_pAutoProxy->m_pDialog = NULL;
}

void CTestDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTestDlg)
	DDX_Control(pDX, IDC_PROGRESS1, m_progress1);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTestDlg, CDialog)
	//{{AFX_MSG_MAP(CTestDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_CLOSE()
	ON_COMMAND(ID_CREATE_NETWORK, OnCreateNetwork)
	ON_COMMAND(ID_SAVE_NETWORK, OnSaveNetwork)
	ON_COMMAND(ID_SAVE_RESULT, OnSaveResult)
	ON_COMMAND(ID_LOAD_NETWORK, OnLoadNetwork)
	ON_COMMAND(ID_LOAD_DATAFORTRAIN, OnLoadDatafortrain)
	ON_COMMAND(ID_RUN_TRAINING, OnRunTraining)
	ON_COMMAND(ID_RUN_TEST, OnRunTest)
	ON_BN_CLICKED(IDC_CREATENETWORK, OnCreatenetwork)
	ON_BN_CLICKED(IDC_FINDOBJ, OnFindobj)
	ON_COMMAND(ID_CREATE_DATA, OnCreateData)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestDlg message handlers

BOOL CTestDlg::OnInitDialog()
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

	sumloop=0;
	nlearn=0.1;
	seta=2;


	SetDlgItemText(IDC_EDIT1,"19");
	SetDlgItemText(IDC_EDIT2,"12");
	SetDlgItemText(IDC_EDIT3,"2");
	SetDlgItemText(IDC_EDIT4,"20");
	SetDlgItemText(IDC_EDIT5,"Null");
	SetDlgItemText(IDC_EDIT6,"Null");
	SetDlgItemText(IDC_EDIT7,"Null");
	SetDlgItemText(IDC_EDIT8,"Null");
	SetDlgItemText(IDC_EDIT9,"Null");
	SetDlgItemText(IDC_EDIT10,"Null");
	SetDlgItemText(IDC_EDIT11,"Null");
	SetDlgItemText(IDC_EDIT12,"Null");
	SetDlgItemText(IDC_EDIT13,"Null");
	SetDlgItemText(IDC_EDIT14,"Null");
	SetDlgItemText(IDC_EDIT15,"1000");

/*	m_progress1.SetRange(0,100);	//progress control
	m_progress1.SetStep(1);
	m_progress1.SetPos(0);

*/	
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTestDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CTestDlg::OnPaint() 
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
HCURSOR CTestDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

// Automation servers should not exit when a user closes the UI
//  if a controller still holds on to one of its objects.  These
//  message handlers make sure that if the proxy is still in use,
//  then the UI is hidden but the dialog remains around if it
//  is dismissed.

void CTestDlg::OnClose() 
{
	if (CanExit())
		CDialog::OnClose();
}

void CTestDlg::OnOK() 
{
	if (CanExit())
		CDialog::OnOK();
}

void CTestDlg::OnCancel() 
{
	if (CanExit())
		CDialog::OnCancel();
}

BOOL CTestDlg::CanExit()
{
	// If the proxy object is still around, then the automation
	//  controller is still holding on to this application.  Leave
	//  the dialog around, but hide its UI.
	if (m_pAutoProxy != NULL)
	{
		ShowWindow(SW_HIDE);
		return FALSE;
	}

	return TRUE;
}

void CTestDlg::OnCreateNetwork() 
{
	// TODO: Add your command handler code here
	


}

void CTestDlg::OnSaveNetwork() 
{
	// TODO: Add your command handler code here
	

	int i,j,k,l;


	CFileDialog save1(FALSE,NULL,NULL,OFN_OVERWRITEPROMPT,"Neural File (*.neu)|*.neu|Text File (*.txt)|*.txt||");
	save1.DoModal();

	CStdioFile saveneural(save1.GetPathName(),CFile::modeCreate|CFile::modeWrite);

	char	tmp2[10];
	CString tmp1;
	
	tmp1="";
	sprintf(tmp2,"%i",numdata);
	for (l=0; l<5; l++)
	{
		tmp1=tmp1+tmp2[l];
	}
	saveneural.WriteString(tmp1);
	saveneural.WriteString("\n");

	tmp1="";
	sprintf(tmp2,"%i",numop);
	for ( l=0; l<5; l++)
	{
		tmp1=tmp1+tmp2[l];
	}
	saveneural.WriteString(tmp1);
	saveneural.WriteString("\n");
	
	tmp1="";
	sprintf(tmp2,"%i",numlayer);
	for ( l=0; l<5; l++)
	{
		tmp1=tmp1+tmp2[l];
	}
	saveneural.WriteString(tmp1);
	saveneural.WriteString("\n");

	tmp1="";
	sprintf(tmp2,"%i",numnode);
	for ( l=0; l<5; l++)
	{
		tmp1=tmp1+tmp2[l];
	}
	saveneural.WriteString(tmp1);
	saveneural.WriteString("\n");

	tmp1="";
	sprintf(tmp2,"%i",sumloop);
	for ( l=0; l<5; l++)
	{
		tmp1=tmp1+tmp2[l];
	}
	saveneural.WriteString(tmp1);
	saveneural.WriteString("\n");

	tmp1="";
	sprintf(tmp2,"%0.7f",serror);
	for ( l=0; l<7; l++)
	{
		tmp1=tmp1+tmp2[l];
	}
	saveneural.WriteString(tmp1);
	saveneural.WriteString("\n");



	for (k=0; k<10; k++)				//write weight
	{	for (j=0; j<30; j++)
		{	for (i=0; i<30; i++)
			{
				tmp1="";
				sprintf(tmp2,"%0.8f",weightpt[(k*900)+(j*30)+i]);
				for (l=0; l<10; l++)
				{
					tmp1=tmp1+tmp2[l];
				}

				saveneural.WriteString(tmp1+" ");
			}
			saveneural.WriteString("\n");
		}
		//saveneural.WriteString("\n" );
	}

}

void CTestDlg::OnSaveResult() 
{
	// TODO: Add your command handler code here

	int i,j;	

	char tmp3[10];
	CFileDialog s1(FALSE,NULL,NULL,OFN_OVERWRITEPROMPT,"Text File (*.txt)|*.txt||");
	s1.DoModal();
	CStdioFile s2(s1.GetPathName(),CFile::modeCreate|CFile::modeWrite);
	for (i=0; i<10; i++)
	{	for (j=0; j<30; j++)
		{
			
			sprintf(tmp3,"%0.7f",resultpt[(i*30)+j]);
			s2.WriteString(tmp3);
			s2.WriteString(" ");
		}
		s2.WriteString("\n");
	}
	sprintf(tmp3,"%0.7f",serror);
	s2.WriteString(tmp3);
/*	s2.WriteString("\n");
	sprintf(tmp3,"%i",numip);
	s2.WriteString(tmp3);
*/	



}

void CTestDlg::OnLoadNetwork() 
{
	// TODO: Add your command handler code here
	
	
	double *weight2 = new double[10*30*30];			//layer*node*data
	weightpt = weight2;
	
	CString tmp1,tmp2;
	int i,j,k,l;

	
	CFileDialog load1(TRUE,NULL,NULL,NULL,"Neural File (*.neu)|*.neu|Text File (*.txt)|*.txt||");
	load1.DoModal();

	CStdioFile loadneural(load1.GetPathName(),CFile::modeRead);
	
	loadneural.ReadString(tmp1);
	numdata=atoi(tmp1);
	SetDlgItemText(IDC_EDIT7,tmp1);

	loadneural.ReadString(tmp1);
	numop=atoi(tmp1);
	SetDlgItemText(IDC_EDIT8,tmp1);

	loadneural.ReadString(tmp1);
	numlayer=atoi(tmp1);
	SetDlgItemText(IDC_EDIT9,tmp1);

	loadneural.ReadString(tmp1);
	numnode=atoi(tmp1);
	SetDlgItemText(IDC_EDIT10,tmp1);

	loadneural.ReadString(tmp1);
	sumloop=atoi(tmp1);
	SetDlgItemText(IDC_EDIT6,tmp1);

	loadneural.ReadString(tmp1);
	serror=atof(tmp1);
	SetDlgItemText(IDC_EDIT5,tmp1);

	
		for (k=0; k<numlayer; k++)
		{
			for (j=0; j<30; j++)
			{
				loadneural.ReadString(tmp1);				

				//if (tmp1.GetLength()>4)
				//{

				tmp2="";
				l=0;

				for (i=0 ; i<30; i++)
				{	
					//if ((tmp1.GetLength()-l)>3) 
					//{

					while (tmp1[l]!=' ')
					{
						tmp2=tmp2+tmp1[l];	
						l++;
					}
					while (tmp1[l]==' ')
					{	l++;}
				

					weight2[(k*900)+(j*30)+i]=atof(tmp2);
		
					tmp2="";					

					//}else i=30;
				
				}
				
				//}else j=30;
			}
		}	


}

void CTestDlg::OnLoadDatafortrain() 
{
	// TODO: Add your command handler code here
	

	double *in = new double[200*20];				//numin*data
	double *target = new double[200*20];			//target = numip*numop
	inputpt=in;
	targetpt=target;
	

	CString tmp1,tmp2;
	int i,j,k,l;
	
	CFileDialog load2(TRUE,NULL,NULL,NULL,"File For Train (*.dft)|*.dft|Text File (*.txt)|*.txt||");
	load2.DoModal();

	CStdioFile loaddata1(load2.GetPathName(),CFile::modeRead);

	loaddata1.ReadString(tmp1);
	numip=atoi(tmp1);

	loaddata1.ReadString(tmp1);
	numop=atoi(tmp1);
	
	loaddata1.ReadString(tmp1);
	numdata=atoi(tmp1);


	j=0;
	for (k=0; k<numip; k++)
	{
		loaddata1.ReadString(tmp1);
		l=0;
		
		for (i=0; i<numdata; i++)
		{	
			while (tmp1[l]!=' ')
			{
				tmp2=tmp2+tmp1[l];	
				l++;
			}
			while (tmp1[l]==' ')
			{	l++;}

			inputpt[(j*20)+i]=atof(tmp2);
			tmp2="";
		}

		for (i=0; i<20; i++)
		{	
			while (tmp1[l]!=' ')
			{
				tmp2=tmp2+tmp1[l];	
				l++;
			}
			while (tmp1[l]==' ')
			{	l++;}

			targetpt[(j*20)+i]=atof(tmp2);
	
			tmp2="";
		}
		j++;
	}


}

void CTestDlg::OnRunTraining() 
{
	// TODO: Add your command handler code here
	

	char tmp1[10];

	GetDlgItemText(IDC_EDIT15,tmp1,8);
	loopcount1=atoi(tmp1);

	m_progress1.SetRange(0,loopcount1);	//progress control
	m_progress1.SetStep(1);
	m_progress1.SetPos(0);


	if (sumloop==0)
	{
		double *weight = new double[10*30*30];			//layer*node*data
		weightpt = weight;
	}/*else
	{	double *weight;
		weight=weightpt;
	}*/

	
	double *result1 = new double[10*30];			//layer*node
	double *opk = new double[10*30];				//Opk = numlayer*numop(node)
	double *result2;//,*kkk;
	double kk,net,netopk,diff;
	double weighttest[10][30][30];
	double resulttest[10][20];
	double outtest[20];
	double opktest[10][20];
	int i,j,k,h;
	
	
	double *in,*target;
	in=inputpt;
	target=targetpt;



	resultpt=result1;
	result2=result1;
	opkpt=opk;
	srand( time( NULL ) );



	if (sumloop==0)
	{
									//random weight for first layer
		k=0;
		for (j=0; j<numnode; j++)
		{	
			for (i=0 ; i<numdata; i++)
			{	kk=rand();
				if (kk<5000 && kk>-5000) kk=kk*10;
				kk=kk/60000;				
				weightpt[(k*900)+(j*30)+i]=kk;

				weighttest[k][j][i]=weightpt[(k*900)+(j*30)+i];
			}
		}	
		k++;

	
	if (numlayer>2){
	for (k=1; k<numlayer; k++)				//random weight for hidden layer(numlayer>2)
	{	
		for (j=0; j<numnode; j++)
		{
			for (i=0 ; i<numnode; i++)
			{	kk=rand();
				if (kk<5000 && kk>-5000) kk=kk*10;
				kk=kk/60000;				
				weightpt[(k*900)+(j*30)+i]=kk;
				weighttest[k][j][i]=weightpt[(k*900)+(j*30)+i];
			}
		}	
	}}
	
	if (k=numlayer-1){
		for (j=0; j<numop; j++)
		{
			for (i=0 ; i<numnode; i++)
			{	kk=rand();
				if (kk<5000 && kk>-5000) kk=kk*10;
				kk=kk/60000;				
				weightpt[(k*900)+(j*30)+i]=kk;

				weighttest[k][j][i]=weightpt[(k*900)+(j*30)+i];
			}
		}	
	}else AfxMessageBox("weight error");


	}		//end if sumloop==0

/**********************Forward**************/


	in=inputpt;
	target=targetpt;
	
	for (loopcount2=0; loopcount2<loopcount1; loopcount2++)		//Loop for training
	{
		
		
		m_progress1.StepIt();

	/*	kk2=(double)loopcount2;
		kk2=kk2/500;
		kk1=modf(kk2,kkk);
		if (kk1==0)
		{

		
			sprintf(tmp1,"%0.7f",serror);
			SetDlgItemText(IDC_EDIT5,tmp1);		

			sprintf(tmp1,"%i",loopcount2);
			SetDlgItemText(IDC_EDIT6,tmp1);
			UpdateData();
		}
*/
		serror=0;
	
	for (inputth=0; inputth<numip; inputth++)
	{


	net=0;
	k=0;
	//weight=weightpt;
	for (j=0; j<numnode; j++)		//first net from input to the first result(0)
	{	
		for (i=0 ; i<numdata; i++)		
		{		
			net=net+(weightpt[(k*900)+(j*30)+i]*inputpt[(inputth*20)+i]);
		}
	
		
		net=1+(exp(-1*(net/seta)));
		net=1/net;
		resultpt[(k*30)+j]=net;
		net=0;
		
		resulttest[k][j]=result1[(k*30)+j];
	}

	k=k+1;
	if (numlayer>2) {
	net=0;
	for (k=1; k<numlayer-1; k++)				//for hidden layer if layer>2
	{	
		result2=resultpt+(k*30);
		result1=result2-30;	
		for (j=0; j<numnode; j++)
		{	
			for (i=0 ; i<numnode; i++)
			{			
				net=net+(weightpt[(k*900)+(j*30)+i]*result1[i]);
			}

		net=1+(exp(-1*(net/seta)));
		net=1/net;
		result2[j]=net;
		net=0;

		resulttest[k][j]=result2[j];
		}	
	}	
	}
	
	
	if (k==numlayer-1){
	net=0;								//for output layer
	result2=resultpt+(k*30);		
	result1=result2-30;				
	for (j=0; j<numop; j++)
	{				
		for (i=0 ; i<numnode; i++)
		{
			net=net+(weightpt[(k*900)+(j*30)+i]*result1[i]);
		}
	net=1+(exp(-1*(net/seta)));
	net=1/net;	
	result2[j]=net;
	net=0;

	resulttest[k][j]=result2[j];
	}	
	} else  AfxMessageBox("Error at Output");
	
	for (i=0; i<numop; i++)
	{	
		outtest[i]=resultpt[((numlayer-1)*30)+i];
	}

	
////////////////////////revers/////////////////////////////
	
//	weight=weightpt;
	in=inputpt;
	result1=resultpt;
	result2=result1;	
	target=targetpt;
	opkpt=opk;

	k=numlayer-1;
	kk=0;
	for (i=0; i<numop; i++)			//find opk
	{	
		diff=targetpt[(inputth*20)+i]-resultpt[((numlayer-1)*30)+i];
		kk=resultpt[((numlayer-1)*30)+i]*(1-resultpt[((numlayer-1)*30)+i])*diff;
		opk[(k*30)+i]=kk;
		opktest[k][i]=kk;
		kk=0;
	}
	
	k=numlayer-2;	
	for (j=0; j<numnode; j++)
	{		
		netopk=0;
		for (h=0; h<numop; h++)
		{
			kk=opk[((k+1)*30)+h]*weightpt[((k+1)*900)+(j*30)+h];
			netopk=netopk+kk;
		}
		kk=resultpt[(k*30)+j]*(1-resultpt[(k*30)+j])*netopk;
		opk[(k*30)+j]=kk;
		opktest[k][j]=kk;
		kk=0;
	}
	k--;
	
	
	while (k>=0)
	{
		for (j=0; j<numnode; j++)
		{		
			netopk=0;
			for (h=0; h<numnode; h++)
			{
				kk=opk[((k+1)*30)+h]*weightpt[((k+1)*900)+(j*30)+h];
				netopk=netopk+kk;
			}
			kk=resultpt[(k*30)+j]*(1-resultpt[(k*30)+j])*netopk;
			opk[(k*30)+j]=kk;				
			opktest[k][j]=kk;
			kk=0;
		}
		k--;
	}

	if (k!=-1) {AfxMessageBox("Find Opk Error");}


	
	k=0;							//find new weight for layer0 (numlayer=2) 
	netopk=0;
	kk=0;
	for (i=0; i<numnode; i++)
	{	for (j=0; j<numdata; j++)
		{
		
		kk=inputpt[(inputth*20)+j]*opk[(k*30)+i];						//*********
		kk=nlearn*kk;
		kk=weightpt[(k*900)+(i*30)+j]+kk;
		weightpt[(k*900)+(i*30)+j]=kk;

		weighttest[k][i][j]=weightpt[(k*900)+(i*30)+j];
		kk=0;
		}
	}
	

	for (k=1; k<(numlayer-1); k++)
	{
								//find new weight for numlayer>2 		
		kk=0;
		for (i=0; i<numnode; i++)
		{	for (j=0; j<numnode; j++)
			{
				kk=resultpt[((k-1)*30)+j]*opk[(k*30)+i];
				kk=nlearn*kk;
				kk=weightpt[(k*900)+(i*30)+j]+kk;
				weightpt[(k*900)+(i*30)+j]=kk;

				weighttest[k][i][j]=weightpt[(k*900)+(i*30)+j];
				netopk=0;
				kk=0;
			}
		}

	}
	if (k!=(numlayer-1)) {AfxMessageBox("New Weight Error");}


	kk=0;
	k=numlayer-1;					//revers for weight to output
	for (i=0; i<numop; i++)
	{	for (j=0; j<numnode; j++)
		{

			kk=resultpt[((k-1)*30)+j]*opk[(k*30)+i];
			kk=nlearn*kk;
			kk=weightpt[(k*900)+(i*30)+j]+kk;
			weightpt[(k*900)+(i*30)+j]=kk;

			weighttest[k][i][j]=weightpt[(k*900)+(i*30)+j];
			kk=0;
		}
	}


	
	for (i=0; i<numop; i++)				//find sum serror
	{
		kk=targetpt[(inputth*20)+i]-resultpt[((numlayer-1)*30)+i];
		serror=serror+(kk*kk);

	}

	
	}							//end loop for inputth
	serror=serror/numip;
	

	}							//end of loopcount

	AfxMessageBox("end Training ");

	sumloop=sumloop+loopcount1;

	sprintf(tmp1,"%0.7f",serror);
	SetDlgItemText(IDC_EDIT5,tmp1);		
	sprintf(tmp1,"%i",sumloop);
	SetDlgItemText(IDC_EDIT6,tmp1);
	UpdateData();




/*******************************End Train********************/
/*
	char tmp3[10];
	CFileDialog s1(FALSE,NULL,NULL,OFN_OVERWRITEPROMPT,"Text File (*.txt)|*.txt||");
	s1.DoModal();
	CStdioFile s2(s1.GetPathName(),CFile::modeCreate|CFile::modeWrite);
	for (i=0; i<10; i++)
	{	for (j=0; j<30; j++)
		{
			
			sprintf(tmp3,"%0.7f",resultpt[(i*30)+j]);
			s2.WriteString(tmp3);
			s2.WriteString(" ");
		}
		s2.WriteString("\n");
	}
	sprintf(tmp3,"%0.7f",serror);
	s2.WriteString(tmp3);
	
*/
	/*delete weightpt;				//if delete Save Neural will error
	delete inputpt;
	delete resultpt;	
	delete targetpt;
	delete opkpt;*/
	



}

void CTestDlg::OnRunTest() 
{
	// TODO: Add your command handler code here
	

	double *result1 = new double[10*30];			//layer*node
	double *result2,*result3;

	double *test = new double[20];
	CString tmp1,tmp2;
	int i,j,k,l,h,m;
	double net;

	testpt=test;
	result2=result1;
	result3=result1;

	CFileDialog l1(TRUE,NULL,NULL,NULL,"Test File (*.tst)|*.tst|Text File (*.txt)|*.txt||");
	l1.DoModal();
	CStdioFile ltest(l1.GetPathName(),CFile::modeRead);
	

	char tmp3[10];
	CFileDialog s1(FALSE,NULL,NULL,OFN_OVERWRITEPROMPT,"Text(Result) File (*.txt)|*.txt||");
	s1.DoModal();
	CStdioFile s2(s1.GetPathName(),CFile::modeCreate|CFile::modeWrite);	
	
	ltest.ReadString(tmp1);
	m=atoi(tmp1);

	for (h=0; h<m; h++)
	{
	
	
	ltest.ReadString(tmp1);
	
	l=0;
	for (i=0; i<numdata; i++)
	{	
		while (tmp1[l]!=' ')
		{
			tmp2=tmp2+tmp1[l];	
			l++;
		}
		while (tmp1[l]==' ')
		{	l++;}
		testpt[i]=atof(tmp2);
		tmp2="";
	}
	


	net=0;
	k=0;
	
	for (j=0; j<numnode; j++)		//first net from input to the first result(0)
	{
		for (i=0 ; i<numdata; i++)		
		{	
			net=net+(weightpt[(k*900)+(j*30)+i]*testpt[i]);	//change ip for test here
		}
	
		
		net=1+(exp(-1*(net/seta)));
		net=1/net;
		result1[(k*30)+j]=net;
		net=0;
	}

	k=k+1;
	if (numlayer>2) {
	net=0;
	for (k=1; k<numlayer-1; k++)				//for hidden layer if layer>2
	{	
		result3=result1+(k*30);
		result2=result3-30;		
		for (j=0; j<numnode; j++)
		{	
			for (i=0 ; i<numnode; i++)
			{			
				net=net+(weightpt[(k*900)+(j*30)+i]*result2[i]);
			}

		net=1+(exp(-1*(net/seta)));
		net=1/net;
		result3[j]=net;
		net=0;
		
		}	
	}	
	}
	
	
	if (k==numlayer-1){
	net=0;								//for output layer
	
	result3=result1+(k*30);		
	result2=result3-30;				
	for (j=0; j<numop; j++)
	{	
		for (i=0 ; i<numnode; i++)
		{		
			net=net+(weightpt[(k*900)+(j*30)+i]*result2[i]);
		}
	net=1+(exp(-1*(net/seta)));
	net=1/net;	
	result3[j]=net;
	net=0;

	
	}	
	}


	for (j=0; j<30; j++)		//write result file
		{
			
			sprintf(tmp3,"%0.7f",result1[((numlayer-1)*30)+j]);
			s2.WriteString(tmp3);
			s2.WriteString(" ");
		}
		s2.WriteString("\n");
	
	s2.WriteString("********************************** \n");
	

	}   //end loop for test input


}

void CTestDlg::OnCreatenetwork() 
{
	// TODO: Add your control notification handler code here

	
	char tmp1[3];

	GetDlgItemText(IDC_EDIT1,tmp1,3);
	numdata=atoi(tmp1);
	SetDlgItemText(IDC_EDIT7,tmp1);

	GetDlgItemText(IDC_EDIT2,tmp1,3);
	numop=atoi(tmp1);
	SetDlgItemText(IDC_EDIT8,tmp1);

	GetDlgItemText(IDC_EDIT3,tmp1,3);
	numlayer=atoi(tmp1);
	SetDlgItemText(IDC_EDIT9,tmp1);

	GetDlgItemText(IDC_EDIT4,tmp1,3);
	numnode=atoi(tmp1);
	SetDlgItemText(IDC_EDIT10,tmp1);


	SetDlgItemText(IDC_EDIT1,"Null");
	SetDlgItemText(IDC_EDIT2,"Null");
	SetDlgItemText(IDC_EDIT3,"Null");
	SetDlgItemText(IDC_EDIT4,"Null");

	sumloop=0;
}




void CTestDlg::GetFile(CString Name,int *PointerImage)
{
	int i,j;
	int wpic = 320;
	int hpic = 240;
	int threshold,*k;
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





void CTestDlg::OnFindobj() 
{
	// TODO: Add your control notification handler code here
	


	char tmp4[10];
	CString tmp1,tmp2,picname;
	int i,j,l,obj1,obj2;
	double val1,val2,tmp3;

	CFileDialog result1(TRUE,NULL,NULL,NULL,"Text File (*.txt)|*.txt||");
	result1.DoModal();

	CStdioFile r1(result1.GetPathName(),CFile::modeRead);

	
	
	//for (i=0; i<23; i++)
	i=0;
	while (!feof(r1.m_pStream))
	{


		r1.ReadString(tmp1);

		
		if (tmp1[1]!='*')
		{

		numip=atoi(tmp1);
		l=0;
		i++;
		
		val1=0;
		val2=0;
		obj1=0;
		obj2=0;
		

		for (j=1; j<=12; j++)
		{
			
			while (tmp1[l]!=' ')
			{
				tmp2=tmp2+tmp1[l];	
				l++;
			}
			while (tmp1[l]==' ')
			{	l++;
				//objth++;
			}

			tmp3=atof(tmp2);
			tmp2="";

			if (tmp3>val1)
			{	val1=tmp3;
				obj1=j;
			} else 
			{	if (tmp3>val2)
				{	val2=tmp3;
					obj2=j;
				}
			}


		}  //end each row
		r1.ReadString(tmp1);

		if ((val1>0.7) && (val1-val2))
		{
		sprintf(tmp4,"%i",obj1);		
		SetDlgItemText(IDC_EDIT11,tmp4);
		
		sprintf(tmp4,"%i",obj2);
		SetDlgItemText(IDC_EDIT12,tmp4);
		
		sprintf(tmp4,"%0.7f",val1);
		SetDlgItemText(IDC_EDIT13,tmp4);
		
		sprintf(tmp4,"%0.7f",val2);
		SetDlgItemText(IDC_EDIT14,tmp4);




		/********************if change drive change this*******/
		if (obj1==1) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Basket.pgm";}
		if (obj1==2) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/BasketBall.pgm";}
		if (obj1==3) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Beer.pgm";}
		if (obj1==4) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Box.pgm";}
		if (obj1==5) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Cup.pgm ";}
		if (obj1==6) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Fab.pgm";}
		if (obj1==7) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Radio.pgm";}
		if (obj1==8) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/ShoseBox.pgm";}
		if (obj1==9) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Thing.pgm";}
		if (obj1==10) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Spey.pgm";}
		if (obj1==11) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Tv.pgm";}
		if (obj1==12) {picname="D:/WINDOWS/Desktop/Presentation/Yan/Showpic/Wisky.pgm";}
		



		int *Image = new int[320*240];
		GetFile(picname,Image);
	

	Show *tpgm1 = new Show(this);
	tpgm1 ->k1 = Image;
	tpgm1 ->wpic = 320;
	tpgm1 ->hpic = 240;
	tpgm1 ->Create(IDD_DIALOG1,this);
	tpgm1 ->SetWindowText("Result");
	tpgm1 ->SetWindowPos(&wndTop , 100, 100, 320, 250,SWP_SHOWWINDOW );
	tpgm1 ->ShowWindow(SW_SHOW);



		sprintf(tmp4,"%i",i);
		AfxMessageBox(tmp4);


	tpgm1 ->DestroyWindow();

		}	//end if val1
	

	}	//end if tmp[1]==*

	}


}

void CTestDlg::OnCreateData() 
{
	// TODO: Add your command handler code here
	
	CString fname1,tmp1,tmp2;
	int i,k;

	CFileDialog load4(TRUE,NULL,NULL,NULL,"Data for test (*.tst)|*.tst|Data for Train (*.dft)|*.dft|Text File (*.txt)|*.txt||");	
	load4.DoModal();
	CStdioFile createdata2(load4.GetPathName(),CFile::modeCreate||CFile::modeWrite);

	for (k=0; k<20; k++)
{
	CFileDialog load3(TRUE,NULL,NULL,NULL,"Data File (*.kit)|*.kit|Text File (*.txt)|*.txt||");
	load3.DoModal();
	CStdioFile createdata1(load3.GetPathName(),CFile::modeRead);
	
	
	createdata2.SeekToEnd();
	//createdata2.WriteString("\n");
	
	tmp2="";
	for (i=0; i<19; i++)
	{
		createdata1.ReadString(tmp1);	
		tmp2=tmp2+tmp1+" ";
	}
	createdata2.WriteString(tmp2);
	createdata2.WriteString("\n");

}



}
