/*
	TcpPropertySheet.cpp
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <ctype.h>
#include <string.h>
#include "strcpyn.h"
#include "window.h"
#include "CPropertySheetDialog.h"
#include "CPropertyPageDialog.h"
#include "TcpScanConfig.h"
#include "TcpScanVersion.h"
#include "TcpPropertySheet.h"
#include "TcpScanPage.h"
#include "TcpConnectPage.h"
#include "TcpServicesPage.h"
#include "resource.h"

IMPLEMENT_DYNCREATE(CTcpScanPropertySheet,CPropertySheetDialog)

BEGIN_MESSAGE_MAP(CTcpScanPropertySheet,CPropertySheetDialog)
END_MESSAGE_MAP()

/*
	CTcpScanPropertySheet()
*/
CTcpScanPropertySheet::CTcpScanPropertySheet(CWnd* pParentWnd,CPropertyPageList* pagearray) : CPropertySheetDialog(pParentWnd,pagearray)
{
	// carica la configurazione dal registro
	if((m_pConfig = new CTcpScanConfig())==NULL)
	{
		AfxMessageBox("Unable to load the configuration from the registry.",MB_ICONWARNING);
		return;
	}

	// passa il puntatore alla configurazione alle pagine dello sheet
	ITERATOR iter;
	PROPERTYPAGE* p;
	if((iter = pagearray->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			p = (PROPERTYPAGE*)iter->data;
			
			if(p->idd > 0)
				if(p->page)
				{
					CPropertyPageDialog* page = (CPropertyPageDialog*)p->page;

					if(p->runtimeclass==RUNTIME_CLASS(CScanPage))
						((CScanPage*)page)->GetPropertySheetConfig(m_pConfig);
					if(p->runtimeclass==RUNTIME_CLASS(CConnectPage))
						((CConnectPage*)page)->GetPropertySheetConfig(m_pConfig);
					if(p->runtimeclass==RUNTIME_CLASS(CServicesPage))
						((CServicesPage*)page)->GetPropertySheetConfig(m_pConfig);
				}

			iter = pagearray->Next(iter);
		}
}

/*
	~CTcpScanPropertySheet()
	
	Distruttore.
*/
CTcpScanPropertySheet::~CTcpScanPropertySheet()
{
	if(m_pConfig)
		delete m_pConfig,m_pConfig = NULL;
}

/*
	OnInitDialog()

	Inizializza il property sheet.
	Rimappa la funzione base per modificare lo stile del dialogo.
*/
BOOL CTcpScanPropertySheet::OnInitDialog(void)
{
	// notare che la CPropertySheet::OnInitDialog() chiama la OnInitDialog() e la OnSetActive()
	// della pagina di default (la prima ad essere aggiunta con AddPage())
	CPropertySheetDialog::OnInitDialog();

	// icone
	SetIcon(AfxGetApp()->LoadIcon(IDI_TCPSCAN),FALSE);
	SetIcon(AfxGetApp()->LoadIcon(IDI_TCPSCAN),TRUE);

	// titolo
	CPropertySheetDialog::SetTitle(PROGRAM_NAME);

	return(TRUE);
}
