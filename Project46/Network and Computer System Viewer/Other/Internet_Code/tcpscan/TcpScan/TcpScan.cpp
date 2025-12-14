/*
	TcpScan.cpp
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "window.h"
#include "TcpPropertySheet.h"
#include "TcpScanPage.h"
#include "TcpConnectPage.h"
#include "TcpServicesPage.h"
#include "TcpScan.h"

CTcpScanApp myApp;

IMPLEMENT_DYNCREATE(CTcpScanApp,CWinApp)

BEGIN_MESSAGE_MAP(CTcpScanApp,CWinApp)
END_MESSAGE_MAP()

/*
	InitInstance()
*/
BOOL CTcpScanApp::InitInstance(void)
{
	CScanPage ScanPage;
	CConnectPage ConnectPage;
	CServicesPage ServicesPage;
	CPropertyPageList* pPropertyPageList = new CPropertyPageList();

	if(pPropertyPageList)
	{
		PROPERTYPAGE* p;

		p = new PROPERTYPAGE(IDD_PAGE_SCAN,&ScanPage,RUNTIME_CLASS(CScanPage));
		pPropertyPageList->Add(p);

		p = new PROPERTYPAGE(IDD_PAGE_CONNECT,&ConnectPage,RUNTIME_CLASS(CConnectPage));
		pPropertyPageList->Add(p);
		
		p = new PROPERTYPAGE(IDD_PAGE_SERVICES,&ServicesPage,RUNTIME_CLASS(CServicesPage));
		pPropertyPageList->Add(p);

		CTcpScanPropertySheet* pPropertySheetDialog = new CTcpScanPropertySheet(NULL,pPropertyPageList);
		if(pPropertySheetDialog)
		{
			if(pPropertySheetDialog->Create())
			{
				m_pMainWnd = pPropertySheetDialog;
				pPropertySheetDialog->DoModal();
			}

			delete pPropertySheetDialog;
		}

		delete pPropertyPageList;
	}

	return(FALSE);
}

IMPLEMENT_DYNCREATE(CMainWindow,CFrameWnd)

BEGIN_MESSAGE_MAP(CMainWindow,CFrameWnd)
END_MESSAGE_MAP()
