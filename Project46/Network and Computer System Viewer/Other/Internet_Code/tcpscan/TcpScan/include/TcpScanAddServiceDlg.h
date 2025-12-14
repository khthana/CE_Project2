/*
	TcpScanAddServiceDlg.h
	Luca Piergentili, 06/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPSCANADDSERVICEDLG_H
#define _TCPSCANADDSERVICEDLG_H 1

#include "window.h"
#include "resource.h"

class CTcpScanAddServiceDlg : public CDialog
{
public:
	CTcpScanAddServiceDlg(CWnd*,CString&,UINT&,CString&,CString&);
	~CTcpScanAddServiceDlg() {}

	enum {IDD = IDD_DIALOG_ADDSERVICE};		// id # del dialogo

private:
	void		DoDataExchange(CDataExchange*);	// scambio dati
	BOOL		OnInitDialog(void);				// inizializzazione dialogo
	void		OnButtonAdd(void);				// IDOK
	void		OnButtonCancel(void);			// IDCANCEL

	HICON	m_hIcon;						// handle per l'icona del dialogo
	CString*	m_pstrServiceName;
	UINT*	m_pnPortNumber;
	CString*	m_pstrProtocolName;
	CString*	m_pstrComment;

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPSCANADDSERVICEDLG_H
