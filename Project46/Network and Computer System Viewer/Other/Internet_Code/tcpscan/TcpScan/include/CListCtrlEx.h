/*
	CListCtrlEx.h
	Classe derivata per la gestione di CListCtrl con menu a comparsa (MFC).
	Luca Piergentili, 06/07/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CLISTCTRLMENU_H
#define _CLISTCTRLMENU_H

#include "window.h"
#include <stdio.h>
#include <stdlib.h>
#include "CNodeList.h"

#define MINCOLWIDTH			10		// dimensione minima per la colonna (in pixels)
#define MAX_CTRLITEM_SIZE	_MAX_PATH	// dimensione max del campo della colonna
#define MAX_CTRLROW_SIZE		2048		// dimensione max della riga

/*
	ITEM_SKIP
	valori per MoveItem()
*/
enum ITEM_SKIP {
	PREVIOUS_ITEM = -1,
	NEXT_ITEM = +1
};

/*
	CTRL_COL
	struttura per la colonna
*/
struct CTRL_COL {
	char* item;	// intestazione
	char type;	// tipo dati per ordinamento (C=carattere, N=numerico)
	BOOL order;	// flag per ordinamento (TRUE=ascendente, FALSE=discendente)
};

/*
	CColList
	classe derivata per la lista delle colonne
*/
class CColList : public CNodeList
{
public:
	CColList() {}
	virtual ~CColList() {CNodeList::DeleteAll();}
	BOOL PreDelete(ITERATOR iter)
	{
		if((CTRL_COL*)iter->data)
		{
			if(((CTRL_COL*)iter->data)->item)
			{
				delete [] ((CTRL_COL*)iter->data)->item;
				((CTRL_COL*)iter->data)->item = NULL;
			}
			delete ((CTRL_COL*)iter->data);
			iter->data = (CTRL_COL*)NULL;
		}
		return(TRUE);
	}
	int Size(void) {return(sizeof(CTRL_COL));}
#ifdef _DEBUG
	const char* Signature(void) {return("CColList");}
#endif
};

/*
	CTRL_ROW
	struttura per l'elemento (riga)
*/
struct CTRL_ROW {
	int	ico;						// indice (base 0) nella lista delle immagini per l'icona
	char* item;					// testo della riga (separare i campi delle colonne con ;)
	int	menu;					// id risorsa del menu (carica i sottomenu 0 e 1, -1 se non prevede menu)
	BOOL	selected;					// flag per elemento selezionato
	int	index;					// indice interno
};

/*
	CRowList
	classe derivata per la lista delle righe
*/
class CRowList : public CNodeList
{
public:
	CRowList() {}
	virtual ~CRowList() {CNodeList::DeleteAll();}
	BOOL PreDelete(ITERATOR iter)
	{
		if((CTRL_ROW*)iter->data)
		{
			if(((CTRL_ROW*)iter->data)->item)
			{
				delete [] ((CTRL_ROW*)iter->data)->item;
				((CTRL_ROW*)iter->data)->item = NULL;
			}
			delete ((CTRL_ROW*)iter->data);
			iter->data = (CTRL_ROW*)NULL;
		}
		return(TRUE);
	}
	int Size(void) {return(sizeof(CTRL_ROW));}
#ifdef _DEBUG
	const char* Signature(void) {return("CRowList");}
#endif
};

/*
	CTRL_IMG
	struttura per l'icona
*/
struct CTRL_IMG {
	int img;	// id risorsa icona
};

/*
	MOUSECLICK
	struttura per le coordinate del click del mouse
*/
struct MOUSECLICK {
	POINT point;
	UINT flags;
};

/*
	CListCtrlEx
*/
class CListCtrlEx : public CListCtrl
{
public:
	// costruttore/distruttore
	CListCtrlEx();
	virtual ~CListCtrlEx();

	// creazione
	BOOL			Create				(CWnd* = AfxGetMainWnd(),CWinApp* = AfxGetApp());
	inline void	SetStyle				(UINT nFlags) {ListView_SetExtendedListViewStyle(this->m_hWnd,nFlags);}

	// flag per selezione elemento con click destro del mouse
	inline void	RightClickSelects		(BOOL bSelect) {m_bRightClickSelects = bSelect;}

	// messaggi da inviare per click sull'elemento
	inline void	SetMenuMessage			(UINT nMenuMessage)			{m_nMenuMessage = nMenuMessage;}
	inline void	SetLButtonDownMessage	(UINT nLButtonDownMessage)	{m_nLButtonDownMessage = nLButtonDownMessage;}
	inline void	SetLButtonUpMessage		(UINT nLButtonUpMessage)		{m_nLButtonUpMessage = nLButtonUpMessage;}
	inline void	SetRButtonDownMessage	(UINT nRButtonDownMessage)	{m_nRButtonDownMessage = nRButtonDownMessage;}
	inline void	SetRButtonUpMessage		(UINT nRButtonUpMessage)		{m_nRButtonUpMessage = nRButtonUpMessage;}
	inline void	SetLDoubleClickMessage	(UINT nLButtonDblClkMessage)	{m_nLButtonDblClkMessage = nLButtonDblClkMessage;}
	inline void	SetRDoubleClickMessage	(UINT nRButtonDblClkMessage)	{m_nRButtonDblClkMessage = nRButtonDblClkMessage;}

	// imposta il menu popup di default
	inline void	SetDefaultMenu			(int nMenu) {m_NullRow.menu = nMenu;}

	inline void	SetIlcColor			(int nIlcColor) {m_IlcColor = nIlcColor;}

	void			SetRedraw				(BOOL bRedraw);
	void			AutoSizeColumns		(int nCol = -1,int nWidth = 0) ;
	int			GetColumnCount			(void);

	// elementi
	int			AddCol				(LPCSTR lpcszColumnText,char cDataType = 'C',int nWidth = -1,BOOL bDescend = FALSE);
	int			AddItem				(LPCSTR lpcszItemText,int nIconIndex = 0,int nMenuIndex = -1);
	BOOL			UpdateItem			(int nItem,LPCSTR lpcszItemText,int nIconIndex = 0,int nMenuIndex = -1);
	BOOL			DeleteItem			(int nItem);
	BOOL			DeleteAllItems			(void);
	int			FindItem				(LPCSTR lpcszText);
	int			FindItem				(LPCSTR lpcszItemText,LPCSTR lpcszColumnText,UINT nCol);
	inline int	MoveItemUp			(int nItem) {return(MoveItem(nItem,PREVIOUS_ITEM));}
	inline int	MoveItemDown			(int nItem) {return(MoveItem(nItem,NEXT_ITEM));}
	int			AddIcon				(int nIcon);
	int			AddIcon				(HICON hIcon);
	void			RemoveIcon			(int nIcon);
	void			RemoveAllIcons			(void);

	// conteggi/dimensioni
	inline int	GetItemCount			(void)	{return(CListCtrl::GetItemCount());}
	inline int	GetColCount			(void)	{return(m_nTotColumns);}
	inline int	GetColWidth			(int nCol){return(m_nTotColumns <= 0 ? -1 : CListCtrl::GetColumnWidth(nCol));}
	
	// selezione elementi
	int			SelectItem			(int nItem);
	int			SetCurrentItem			(int nItem);
	int			GetCurrentItem			(void);

	// elementi selezionati
	BOOL			SetItemSelection		(int nItem,BOOL bSelected);
	BOOL			GetItemSelection		(int nItem);

	// ordinamento
	void			Sort					(int nCol = 0);

	inline void	SetMultipleSelection	(BOOL bMultipleSelection) {m_bMultipleSelection = bMultipleSelection;}

private:
	// membri
	void			Initialize			(void);
	void			Destroy				(void);
	CTRL_ROW*		GetRowByItem			(int nItem);
	CTRL_COL*		GetColByItem			(int nItem);
	void			ResetItemsSelection		(void);
	int			MoveItem				(int nItem,ITEM_SKIP skip);
	void			PopUpMenu				(const CPoint& point);

	// gestori
	void			OnColumnClick			(NMHDR*,LRESULT*);
	void			OnLButtonDown			(UINT,CPoint);
	void			OnLButtonUp			(UINT,CPoint);
	void			OnRButtonDown			(UINT,CPoint);
	void			OnRButtonUp			(UINT,CPoint);
	void			OnLButtonDblClk		(UINT,CPoint);
	void			OnRButtonDblClk		(UINT,CPoint);

	// variabili
	int			m_nRedrawCount;		// flag per refresh
	int			m_nCurrentItem;		// indice (interno) per la riga corrente
	CRowList		m_RowList;			// lista per le righe
	CColList		m_ColList;			// lista per le colonne
	int			m_nTotColumns;			// totale delle colonne
	int			m_IlcColor;			// flag per visualizzazione icona
	CImageList	m_ImageList;			// lista immagini
	CImageList	m_ImageListSmall;		// lista immagini
	CWnd*		m_pWnd;				// puntatore alla finestra principale per l'invio dei messaggi
	CWinApp*		m_pWinApp;			// puntatore all'applicazione principale per gli id delle icone
	POINT		m_Point;				// coordinate per i click del mouse sugli elementi del controllo
	MOUSECLICK	m_MouseClick;			// coordinate per i click del mouse sugli elementi del controllo
	UINT			m_nMenuMessage;		// messaggio per il menu popup
	UINT			m_nLButtonDownMessage;	// messaggio da inviare per click bottone sinistro
	UINT			m_nLButtonUpMessage;	// messaggio da inviare per rilascio bottone sinistro
	UINT			m_nRButtonDownMessage;	// messaggio da inviare per click bottone destro
	UINT			m_nRButtonUpMessage;	// messaggio da inviare per rilascio bottone destro
	UINT			m_nLButtonDblClkMessage;	// messaggio da inviare per doppio click bottone sinistro
	UINT			m_nRButtonDblClkMessage;	// messaggio da inviare per doppio click bottone destro
	BOOL			m_bRightClickSelects;	// flag per selezione con click bottone destro
	CTRL_ROW		m_NullRow;			// elemento interno
	BOOL			m_bMultipleSelection;	// flag per selezione multiple

	DECLARE_MESSAGE_MAP()
};

#endif // _CLISTCTRLMENU_H
