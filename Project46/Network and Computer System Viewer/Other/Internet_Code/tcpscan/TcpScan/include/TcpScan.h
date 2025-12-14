/*
	TcpScan.h
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPSCAN_H
#define _TCPSCAN_H 1

#include "window.h"

class CTcpScanApp : public CWinApp
{
	DECLARE_DYNCREATE(CTcpScanApp)

public:
	BOOL InitInstance(void);

	DECLARE_MESSAGE_MAP()
};

class CMainWindow : public CFrameWnd
{
	DECLARE_DYNCREATE(CMainWindow)

public:
	CMainWindow() {}
	~CMainWindow() {}

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPSCAN_H
