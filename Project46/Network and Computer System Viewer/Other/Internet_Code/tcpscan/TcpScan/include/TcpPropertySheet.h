/*
	TcpPropertySheet.h
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPPROPERTYSHEET_H
#define _TCPPROPERTYSHEET_H 1

#include "window.h"
#include "CPropertySheetDialog.h"
#include "TcpScanConfig.h"

class CTcpScanPropertySheet : public CPropertySheetDialog
{
	DECLARE_DYNCREATE(CTcpScanPropertySheet)

public:
	CTcpScanPropertySheet(CWnd* = NULL,CPropertyPageList* = NULL);
	~CTcpScanPropertySheet();
	
	BOOL OnInitDialog(void);

private:
	CTcpScanConfig* m_pConfig;

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPPROPERTYSHEET_H
