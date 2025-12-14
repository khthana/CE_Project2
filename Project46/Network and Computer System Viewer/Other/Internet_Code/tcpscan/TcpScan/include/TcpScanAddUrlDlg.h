/*
	TcpScanAddUrlDlg.h
	Luca Piergentili, 06/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPSCANADDURLDLG_H
#define _TCPSCANADDURLDLG_H 1

#include "window.h"
#include "resource.h"

class CTcpScanAddUrlDlg : public CDialog
{
public:
	CTcpScanAddUrlDlg(CWnd*,CString&,int,CString&,int);
	~CTcpScanAddUrlDlg() {}

	enum {IDD = IDD_DIALOG_ADDURL};			// id # del dialogo

private:
	void		DoDataExchange(CDataExchange*);	// scambio dati
	BOOL		OnInitDialog(void);				// inizializzazione dialogo
	void		OnButtonAdd(void);				// IDOK
	void		OnButtonCancel(void);			// IDCANCEL

	HICON	m_hIcon;						// handle per l'icona del dialogo
	CString*	m_pstrURL;
	int		m_nMaxURL;
	CString*	m_pstrComment;
	int		m_nMaxComment;

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPSCANADDURLDLG_H
