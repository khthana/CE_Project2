/*
	CListCtrlEx.cpp
	Classe derivata per la gestione di CListCtrl con menu a comparsa (MFC).
	Luca Piergentili, 06/07/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "window.h"
#include <commctrl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "strcpyn.h"
#include "win32api.h"
#include "CNodeList.h"
#include "CListCtrlEx.h"

static BOOL		bAscending = FALSE;				// flag per direzione ordinamento righe
static char		cType = 'C';					// tipo dati per ordinamento righe
static int CALLBACK	CompareItems(LPARAM,LPARAM,LPARAM);// confronta i due elementi (ordinamento)
static LPCSTR		GetItemToken(int,LPCSTR);		// estrae dalla riga il campo relativo alla colonna

BEGIN_MESSAGE_MAP(CListCtrlEx,CListCtrl)
	ON_WM_LBUTTONDOWN()							// click bottone sinistro
	ON_WM_LBUTTONUP()							// rilascio bottone sinistro
	ON_WM_RBUTTONDOWN()							// click bottone destro
	ON_WM_RBUTTONUP()							// rilascio bottone destro
	ON_WM_LBUTTONDBLCLK()						// doppio click bottone sinistro
	ON_WM_RBUTTONDBLCLK()						// doppio click bottone destro
	ON_NOTIFY_REFLECT(LVN_COLUMNCLICK,OnColumnClick)	// click sull'header della colonna
END_MESSAGE_MAP()

/*
	CListCtrlEx()
*/
CListCtrlEx::CListCtrlEx()
{
	Initialize();
}

/*
	~CListCtrlEx()
*/
CListCtrlEx::~CListCtrlEx()
{
	Destroy();
}

/*
	Initialize()
*/
void CListCtrlEx::Initialize(void)
{
	m_nRedrawCount          = 0;
	m_nCurrentItem          = LB_ERR;
	m_nTotColumns           = 0;
	/*
	#define ILC_MASK                0x0001
	#define ILC_COLOR               0x0000
	#define ILC_COLORDDB            0x00FE
	#define ILC_COLOR4              0x0004
	#define ILC_COLOR8              0x0008
	#define ILC_COLOR16             0x0010
	#define ILC_COLOR24             0x0018
	#define ILC_COLOR32             0x0020
	#define ILC_PALETTE             0x0800      // (not implemented)
	*/
	m_IlcColor              = ILC_MASK;
	m_pWnd                  = NULL;
	m_pWinApp               = NULL;
	m_Point.x               = 0;
	m_Point.y               = 0;
	m_nMenuMessage          = (UINT)-1;
	m_nLButtonDownMessage   = (UINT)-1;
	m_nLButtonUpMessage     = (UINT)-1;
	m_nRButtonDownMessage   = (UINT)-1;
	m_nRButtonUpMessage     = (UINT)-1;
	m_nLButtonDblClkMessage = (UINT)-1;
	m_nRButtonDblClkMessage = (UINT)-1;
	m_bRightClickSelects    = FALSE;
	m_NullRow.ico           = -1;
	m_NullRow.item = new char[8];
	if(m_NullRow.item)
		strcpy(m_NullRow.item,"[null]");
	m_NullRow.menu          = -1;
	m_NullRow.selected      = FALSE;
	m_NullRow.index         = -1;
	m_bMultipleSelection    = FALSE;
}

/*
	Destroy()
*/
void CListCtrlEx::Destroy(void)
{
	m_nCurrentItem          = LB_ERR;
	m_RowList.DeleteAll();
	m_ColList.DeleteAll();
	m_ImageList.DeleteImageList();
	m_ImageListSmall.DeleteImageList();
	m_nTotColumns           = 0;
	m_pWnd                  = NULL;
	m_pWinApp               = NULL;
	m_Point.x               = 0;
	m_Point.y               = 0;
	m_nMenuMessage          = (UINT)-1;
	m_nLButtonDownMessage   = (UINT)-1;
	m_nLButtonUpMessage     = (UINT)-1;
	m_nRButtonDownMessage   = (UINT)-1;
	m_nRButtonUpMessage     = (UINT)-1;
	m_nLButtonDblClkMessage = (UINT)-1;
	m_nRButtonDblClkMessage = (UINT)-1;
	m_bRightClickSelects    = FALSE;
	m_NullRow.ico           = -1;
	if(m_NullRow.item)
	{
		delete [] m_NullRow.item;
		m_NullRow.item = NULL;
	}
	m_NullRow.menu          = -1;
	m_NullRow.selected      = FALSE;
	m_NullRow.index         = -1;
}

/*
	Create()

	Crea il controllo.
	
	CWnd* pCWnd = AfxGetMainWnd()		puntatore alla finestra principale per l'invio dei messaggi
	CWinApp* pCWinApp = AfxGetApp()	puntatore all'applicazione principale gli id delle icone
*/
BOOL CListCtrlEx::Create(CWnd* pCWnd,CWinApp* pCWinApp)
{
	// inizializza
	Destroy();
	Initialize();

	// puntatore alla finestra/applicazione principale
	m_pWnd = pCWnd;
	m_pWinApp = pCWinApp;

	// elimina le colonne eventualmente presenti
	while(CListCtrl::DeleteColumn(0))
		;

	// elimina le righe eventualmente presenti
	CListCtrl::DeleteAllItems();

	// liste immagini
	BOOL bCreated = TRUE;
	if(bCreated)
		bCreated = m_ImageList.Create(32,32,m_IlcColor/*ILC_COLOR32*/ /*1*/,0,5);
	if(bCreated)
		bCreated = m_ImageListSmall.Create(16,16,m_IlcColor/*ILC_COLOR32*/ /*1*/,0,5);

	return(bCreated);
}

/*
	SetRedraw()
*/
void CListCtrlEx::SetRedraw(BOOL bRedraw)
{
	if(!bRedraw)
	{
		if(m_nRedrawCount++ <= 0)
			CListCtrl::SetRedraw(false);
	}
	else
	{
		if(--m_nRedrawCount <= 0)
		{
			CListCtrl::SetRedraw(true);
			m_nRedrawCount = 0;
			CListCtrl::Invalidate();
		}
	}
}

/*
	AutoSizeColumns()

	Dimensiona automaticamente le colonne in base al contenuto/etichetta.
	Da chiamare dopo aver riempito il controllo.l
	Da usare solo se il controllo si trova in modalita' report.
*/
void CListCtrlEx::AutoSizeColumns(int nCol/*=-1*/,int nWidth/*=0*/) 
{
	SetRedraw(FALSE);

	if(!(GetStyle() & LVS_REPORT))
		return;

	int nMinCol = nCol < 0 ? 0 : nCol;
	int nMaxCol = nCol < 0 ? GetColumnCount()-1 : nCol;
	
	for(nCol = nMinCol; nCol <= nMaxCol; nCol++) 
	{
		if(nWidth==0)
		{
			CListCtrl::SetColumnWidth(nCol,LVSCW_AUTOSIZE);
			int nWidthAutosize = CListCtrl::GetColumnWidth(nCol);

			CListCtrl::SetColumnWidth(nCol,LVSCW_AUTOSIZE_USEHEADER);
			int nWidthUseHeader = CListCtrl::GetColumnWidth(nCol);

			CListCtrl::SetColumnWidth(nCol,max(MINCOLWIDTH,max(nWidthAutosize,nWidthUseHeader)));
		}
		else
			CListCtrl::SetColumnWidth(nCol,nWidth);     
	}

	SetRedraw(TRUE);
}

/*
	GetColumnCount()

	Ricava il numero di colonne del controllo.
*/
int CListCtrlEx::GetColumnCount(void)
{
	CHeaderCtrl* pHeader = (CHeaderCtrl*)CListCtrl::GetDlgItem(0);
	return(pHeader ? pHeader->GetItemCount() : 0);
}

/*
	GetRowByItem()

	Ricava il puntatore alla riga relativa all'elemento.
	L'elemento (indice base 0 dell'elemento di CListCtrl) corrisponde con l'indice (base 0) della riga,
	da mantenere aggiornato in base agli spostamenti degli items di ClistCtrl.
	Da non confondere con l'indice interno di CNodeList.

	int nItem		indice (base 0) dell'item per la riga da cercare
*/
CTRL_ROW* CListCtrlEx::GetRowByItem(int nItem)
{
	ITERATOR iter;
	CTRL_ROW* ra = NULL;

	if((iter = m_RowList.First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			ra = (CTRL_ROW*)iter->data;
			if(ra)
			{
				if(ra->index==nItem)
					break;
				else
					ra = NULL;
			}
			iter = m_RowList.Next(iter);
		}

	return(ra);
}

/*
	GetColByItem()

	Ricava il puntatore alla colonna relativa all'elemento.
	L'elemento (indice base 0 dell'elemento di CListCtrl) corrisponde con l'indice (base 0) della riga.
	Dato che le colonne non cambiano di posizione, tale indice corrisponde con l'indice interno di
	CNodeList, per cui la ricerca puo essere effettuata con FindAt().

	int nItem		indice (base 0) dell'item per la colonna da cercare
*/
CTRL_COL* CListCtrlEx::GetColByItem(int nItem)
{
	ITERATOR iter;
	CTRL_COL* ca = NULL;

	if((iter = m_ColList.FindAt(nItem))!=NULL)
		ca = (CTRL_COL*)iter->data;

	return(ca);
}

/*
	AddCol()

	Aggiunge la colonna al controllo.

	LPCSTR lpcszColumnText	testo per l'intestazione della colonna
	char cDataType	= 'C'	carattere per il tipo dei dati contenuti nella colonna: 'C' carattere, 'N' numerico
	int nWidth = -1		dimensione della colonna (in pixel)
	BOOL bDescend = FALSE	flag per ordinamento (FALSE=discendente, TRUE=ascendente)
*/
int CListCtrlEx::AddCol(LPCSTR lpcszColumnText,char cDataType,int nWidth,BOOL bDescend)
{
	int nCurrentCol = LB_ERR;

	// crea la colonna
	CTRL_COL* ca = new CTRL_COL;

	if(ca)
	{
		memset(ca,'\0',sizeof(CTRL_COL));
		int len = strlen(lpcszColumnText)+1;
		ca->item = new char[len];
		memset(ca->item,'\0',len);
		
		// aggiunge la colonna alla lista
		if(m_ColList.Add(ca))
		{
			CSize size;
			LPSTR lpToken;
			LV_COLUMN lvcolumn;

			// indice (base 0) della nuova colonna
			int nCol = m_nTotColumns++;

			strcpy(ca->item,lpcszColumnText);

			// ordinamento colonna (default FALSE = discendente)
			ca->type  = cDataType;
			ca->order = bDescend;
			
			// elemento
			lvcolumn.mask     = LVCF_FMT | LVCF_SUBITEM | LVCF_TEXT | LVCF_WIDTH;
			lvcolumn.fmt      = LVCFMT_LEFT;
			lvcolumn.pszText  = ca->item;
			lvcolumn.iSubItem = nCol;
			
			// calcola la dimensione (in pixel) della colonna in base alla dimensione del testo
			// della colonna e del testo della prima riga (+15 per l'icona)
			if(nWidth <= 0)
			{
				lpToken = "";

				if(CListCtrl::GetItemCount() > 0)
				{
					CTRL_ROW* ra;
					if((ra = GetRowByItem(0))!=NULL)
						lpToken = (LPSTR)GetItemToken(nCol,ra->item);
				}
				else
				{
					lpToken = ca->item;
				}

				int nColSize  = CListCtrl::GetStringWidth(lvcolumn.pszText);
				int nItemSize = CListCtrl::GetStringWidth(lpToken);
				size.cx       = nColSize > nItemSize ? nColSize : nItemSize;
				lvcolumn.cx   = size.cx + 15;
			}
			else
			{
				lvcolumn.cx = nWidth;
			}
			
			// inserisce la colonna
			if((nCurrentCol = CListCtrl::InsertColumn(nCol,&lvcolumn)) < 0)
				nCurrentCol = LB_ERR;
		}
	}

	return(nCurrentCol);
}

/*
	AddItem()

	Aggiunge la riga al controllo.

	LPCSTR lpcszItemText	testo per l'elemento della riga (separare il testo per le colonne con ';')
	int nIconIndex = 0		indice dell'icona relativa
	int nMenuIndex = -1		indice del menu relativo
*/
int CListCtrlEx::AddItem(LPCSTR lpcszItemText,int nIconIndex,int nMenuIndex) 
{
	int nCurrentItem = LB_ERR;

	// crea la riga
	CTRL_ROW* ra = new CTRL_ROW;
	
	if(ra)
	{
		memset(ra,'\0',sizeof(CTRL_ROW));
		int len = strlen(lpcszItemText)+1;
		ra->item = new char[len];
		memset(ra->item,'\0',len);
		strcpy(ra->item,lpcszItemText);

		// aggiunge la riga alla lista
		if(m_RowList.Add(ra))
		{
			int nItem,nSubItem;
			LV_ITEM lvitem;

			// indice (base 0) della nuova riga
			nItem = CListCtrl::GetItemCount();

			// colonne della riga
			for(nSubItem = 0,nCurrentItem = 0; nSubItem < m_nTotColumns && nCurrentItem!=LB_ERR; nSubItem++)
			{
				// status della riga (default su non selezionata)
				ra->ico      = nIconIndex;
				ra->menu     = nMenuIndex;
				ra->selected = FALSE;
				ra->index    = nItem;

				// la riga viene passata in un unico buffer, diviso in colonne dal carattere ';'
				lvitem.pszText = (LPSTR)GetItemToken(nSubItem,ra->item);
				
				int nItemSize = CListCtrl::GetStringWidth(lvitem.pszText);
				//int nColSize = CListCtrl::GetColumnWidth(nSubItem);
				if(nItemSize >= CListCtrl::GetColumnWidth(nSubItem))
					CListCtrl::SetColumnWidth(nSubItem,nItemSize+15);

				lvitem.iSubItem = nSubItem;

				if(nSubItem==0)
				{
					lvitem.mask   = LVIF_TEXT | LVIF_PARAM | LVIF_IMAGE;
					lvitem.iItem  = nItem;
					lvitem.iImage = ra->ico; // icona relativa (indice base 0 nell'array delle immagini)
					lvitem.lParam = (LPARAM)(ra->item);
					
					if((nCurrentItem  = CListCtrl::InsertItem(&lvitem)) < 0)
						nCurrentItem = LB_ERR;
				}
				else
				{
					lvitem.mask  = LVIF_TEXT;
					lvitem.iItem = nCurrentItem;
					
					CListCtrl::SetItem(&lvitem);
				}
			}
		}
	}

	return(nCurrentItem);
}

/*
	UpdateItem()

	Aggiorna l'elemento del controllo.
*/
BOOL CListCtrlEx::UpdateItem(int nItem,LPCSTR lpcszItemText,int nIconIndex/*=0*/,int nMenuIndex/*=-1*/)
{
	BOOL bUpdated = FALSE;
	ITERATOR iter;
	CTRL_ROW* ra = NULL;

	// cerca la riga relativa all'indice
	if((iter = m_RowList.First())!=(ITERATOR)NULL)
	{
		while(iter!=(ITERATOR)NULL)
		{
			ra = (CTRL_ROW*)iter->data;
			if(ra)
			{
				if(ra->index==nItem)
					break;
				else
					ra = NULL;
			}
			iter = m_RowList.Next(iter);
		}
	}

	if(ra)
	{
		int nCurrent = GetCurrentItem();
		
		CListCtrl::DeleteItem(nItem);

		if(ra->item)
		{
			delete [] ra->item;
			ra->item = NULL;
		}
		int len = strlen(lpcszItemText)+1;
		ra->item = new char[len];
		memset(ra->item,'\0',len);
		strcpy(ra->item,lpcszItemText);

		int nSubItem,nCurrentItem;
		LV_ITEM lvitem;

		// colonne della riga
		for(nSubItem = 0,nCurrentItem = 0; nSubItem < m_nTotColumns && nCurrentItem!=LB_ERR; nSubItem++)
		{
			// status della riga (default su non selezionata)
			ra->ico      = nIconIndex;
			ra->menu     = nMenuIndex;
			ra->selected = FALSE;
			ra->index    = nItem;

			// la riga viene passata in un unico buffer, diviso in colonne dal carattere ';'
			lvitem.pszText = (LPSTR)GetItemToken(nSubItem,ra->item);
			
			int nItemSize = CListCtrl::GetStringWidth(lvitem.pszText);
			//int nColSize = CListCtrl::GetColumnWidth(nSubItem);
			if(nItemSize >= CListCtrl::GetColumnWidth(nSubItem))
				CListCtrl::SetColumnWidth(nSubItem,nItemSize+15);

			lvitem.iSubItem = nSubItem;

			if(nSubItem==0)
			{
				lvitem.mask   = LVIF_TEXT | LVIF_PARAM | LVIF_IMAGE;
				lvitem.iItem  = nItem;
				lvitem.iImage = ra->ico; // icona relativa (indice base 0 nell'array delle immagini)
				lvitem.lParam = (LPARAM)(ra->item);
				
				if((nCurrentItem  = CListCtrl::InsertItem(&lvitem)) < 0)
					nCurrentItem = LB_ERR;
			}
			else
			{
				lvitem.mask  = LVIF_TEXT;
				lvitem.iItem = nCurrentItem;
				
				CListCtrl::SetItem(&lvitem);
			}
		}
		
		SelectItem(nCurrent);
		CListCtrl::Update(nItem);
		
		bUpdated = TRUE;
	}

	return(bUpdated);
}

/*
	DeleteItem()

	Elimina l'elemento dal controllo.

	int nItem		indice (base 0) della riga.
*/
BOOL CListCtrlEx::DeleteItem(int nItem)
{
	ITERATOR iter;
	CTRL_ROW* ra = NULL;

	// elimina la riga dal controllo
	BOOL bDeleted = CListCtrl::DeleteItem(nItem);

	// cerca la riga relativa all'indice e la elimina dalla lista
	if((iter = m_RowList.First())!=(ITERATOR)NULL)
	{
		while(iter!=(ITERATOR)NULL)
		{
			ra = (CTRL_ROW*)iter->data;
			if(ra)
			{
				if(ra->index==nItem)
					break;
				else
					ra = NULL;
			}
			iter = m_RowList.Next(iter);
		}
	}
	
	if(ra)
		m_RowList.Delete(iter);

	// rinumera gli indici delle righe presenti nella lista
	int tot = m_RowList.Count()+1;

	for(int n = ++nItem; n < tot; n++)
	{
		if((ra = GetRowByItem(n))!=(CTRL_ROW*)NULL)
			ra->index = n-1;
	}

	return(bDeleted);
}

/*
	DeleteAllItems()

	Elimina tutti gli elementi dal controllo.
*/
BOOL CListCtrlEx::DeleteAllItems(void)
{
	// elimina le righe dal controllo
	BOOL bDeleted = CListCtrl::DeleteAllItems();

	// elimina le righe dalla lista
	m_RowList.DeleteAll();

	return(bDeleted);
}

/*
	FindItem()

	Cerca l'elemento nel controllo.

	LPCSTR lpcszText	testo dell'elemento da cercare.
*/
int CListCtrlEx::FindItem(LPCSTR lpcszText)
{
	LVFINDINFO lv = {0};
	lv.flags = LVFI_STRING;
	lv.psz = lpcszText;
	return(CListCtrl::FindItem(&lv,-1));
}

/*
	FindItem()

	Cerca la coppia di elementi nel controllo.

	LPCSTR lpcszItemText	testo dell'elemento da cercare.
	LPCSTR lpcszColumnText	testo addizionale dell'elemento da cercare.
	UINT nCol				indice (base 0) della colonna per il testo addizionale
*/
int CListCtrlEx::FindItem(LPCSTR lpcszItemText,LPCSTR lpcszColumnText,UINT nCol)
{
	char szItem[MAX_CTRLITEM_SIZE+1] = {0};
	LVFINDINFO lv = {0};
	lv.flags = LVFI_STRING;
	lv.psz = lpcszItemText;
	int nItem = CListCtrl::FindItem(&lv,-1);
	while(nItem >= 0)
	{
		CListCtrl::GetItemText(nItem,nCol,szItem,sizeof(szItem)-1);
		if(strcmp(szItem,lpcszColumnText)==0)
			break;
		else
			nItem = CListCtrl::FindItem(&lv,nItem);
	}
	return(nItem);
}

/*
	MoveItem()

	Sposta l'elemento in alto o in basso di una posizione.

	int nItem			indice (base 0) dell'elemento
	ITEM_SKIP skip		flag per tipo spostamento (precedente/successivo)
*/
int CListCtrlEx::MoveItem(int nItem,ITEM_SKIP skip)
{
	int nCurrentItem = LB_ERR;
	int nNewItem = (nItem + (skip==PREVIOUS_ITEM ? -1 : (skip==NEXT_ITEM ? +1 : -1)));

	// controlla l'intervallo
	if(nNewItem >= 0 && nNewItem < CListCtrl::GetItemCount())
	{
		// riga da spostare
		CTRL_ROW* ra = GetRowByItem(nItem);
		
		// riga precedente/successiva
		CTRL_ROW* ra_prevnext = GetRowByItem(nNewItem);
		
		if(ra && ra_prevnext)
		{
			int nSubItem;
			LV_ITEM lvitem;
			char szItem[MAX_CTRLROW_SIZE+1];

			// elimina l'elemento dal controllo (chiama la classe base perche' non deve aggiornare il contatore interno)
			CListCtrl::DeleteItem(nItem);

			// testo dell'elemento
			strcpyn(szItem,ra->item,sizeof(szItem));
			
			// rinumera gli indici dei due elementi coinvolti nello spostamento
			ra->index = nNewItem;
			ra_prevnext->index = nItem;

			// colonne dell'elemento
			for(nSubItem = 0,nCurrentItem = 0; nSubItem < m_nTotColumns && nCurrentItem!=LB_ERR; nSubItem++)
			{
				// l'elemento (riga) viene passata in un unico buffer, diviso in colonne dal carattere ';'
				lvitem.pszText = (LPSTR)GetItemToken(nSubItem,szItem);
				
				lvitem.iSubItem = nSubItem;

				if(nSubItem==0)
				{
					lvitem.mask   = LVIF_TEXT | LVIF_PARAM | LVIF_IMAGE;
					lvitem.iItem  = nNewItem;
					lvitem.iImage = ra->ico;
					lvitem.lParam = (LPARAM)(ra->item);
					
					if((nCurrentItem  = CListCtrl::InsertItem(&lvitem)) < 0)
						nCurrentItem = LB_ERR;
				}
				else
				{
					lvitem.mask  = LVIF_TEXT;
					lvitem.iItem = nCurrentItem;
					
					CListCtrl::SetItem(&lvitem);
				}
			}

			// imposta la riga come selezionata
			nCurrentItem = SelectItem(nNewItem);
		}
	}

	return(nCurrentItem);
}

/*
	AddIcon()

	Aggiunge l'icona alla lista delle immagini per la lista.

	int nIcon		id della risorsa relativo all'icona
*/
int CListCtrlEx::AddIcon(int nIcon)
{
	int nCurrentIcon = LB_ERR;

	if(!m_pWinApp)
		return(nCurrentIcon);

	if((nCurrentIcon = m_ImageList.Add(m_pWinApp->LoadIcon(nIcon))) < 0)
		return(nCurrentIcon);
	CListCtrl::SetImageList(&m_ImageList,LVSIL_NORMAL);
	
	if((nCurrentIcon = m_ImageListSmall.Add(m_pWinApp->LoadIcon(nIcon))) < 0)
		return(nCurrentIcon);
	CListCtrl::SetImageList(&m_ImageListSmall,LVSIL_SMALL);

	return(nCurrentIcon);
}

/*
	AddIcon()

	Aggiunge l'icona alla lista delle immagini per la lista.

	HICON hIcon	handle relativo all'icona
*/
int CListCtrlEx::AddIcon(HICON hIcon)
{
	int nCurrentIcon = LB_ERR;

	if((nCurrentIcon = m_ImageList.Add(hIcon)) < 0)
		return(nCurrentIcon);
	CListCtrl::SetImageList(&m_ImageList,LVSIL_NORMAL);
	
	if((nCurrentIcon = m_ImageListSmall.Add(hIcon)) < 0)
		return(nCurrentIcon);
	CListCtrl::SetImageList(&m_ImageListSmall,LVSIL_SMALL);

	return(nCurrentIcon);
}

/*
	RemoveIcon()
*/
void CListCtrlEx::RemoveIcon(int nIcon)
{
	m_ImageList.Remove(nIcon);
	m_ImageListSmall.Remove(nIcon);
}

/*
	RemoveAllIcons()
*/
void CListCtrlEx::RemoveAllIcons(void)
{
	int i,nTot;
	for(i = 0,nTot = m_ImageList.GetImageCount(); i < nTot; i++)
		m_ImageList.Remove(0);
	for(i = 0,nTot = m_ImageListSmall.GetImageCount(); i < nTot; i++)
		m_ImageListSmall.Remove(0);
}

/*
	SelectItem()

	Imposta l'elemento come selezionato.
	Se la selezione riesce, imposta l'indice interno relativo alla riga corrente.

	int nItem		indice (base 0) dell'elemento
*/
int CListCtrlEx::SelectItem(int nItem)
{
	// riga corrente
	int iCurrentItem = GetCurrentItem();

	// controlla l'indice
	if(nItem >=0 && nItem < CListCtrl::GetItemCount())
	{
		/* M$VC 6.0
		POSITION position;
		position = GetFirstSelectedItemPosition();
		while(position)
			iCurrentItem = GetNextSelectedItem(position);
		*/

		LV_ITEM lvitem;

		// ricava la riga selezionata
		if((iCurrentItem = CListCtrl::GetNextItem(0,LVNI_ALL|LVNI_FOCUSED|LVNI_SELECTED)) < 0)
			iCurrentItem = 0;

		if(iCurrentItem >= 0)
		{
			// elimina la selezione per la riga corrente
			memset(&lvitem,'\0',sizeof(LV_ITEM));
			lvitem.mask = LVIF_STATE;
			lvitem.iItem = iCurrentItem;
			lvitem.iSubItem = 0;
			lvitem.state = 0;
			lvitem.stateMask = LVIS_FOCUSED | LVIS_SELECTED ;
			if(CListCtrl::SetItemState(iCurrentItem,&lvitem))
			{
				// imposta come selezionata la riga specificata
				memset(&lvitem,'\0',sizeof(LV_ITEM));
				lvitem.mask = LVIF_STATE;
				lvitem.iItem = nItem;
				lvitem.iSubItem = 0;
				lvitem.state = LVIS_FOCUSED | LVIS_SELECTED;
				lvitem.stateMask = LVIS_FOCUSED | LVIS_SELECTED;
				if(CListCtrl::SetItemState(nItem,&lvitem))
				{
					// si assicura che la riga sia visibile ed aggiorna l'indice interno
					SetRedraw(FALSE);
					CListCtrl::EnsureVisible(nItem,FALSE);
					SetRedraw(TRUE);

					SetCurrentItem(nItem);
				}
			}
		}
	}

	return(iCurrentItem);
}

/*
	SetCurrentItem()

	Aggiorna l'indice interno relativo alla riga corrente.
	Notare che la riga corrente puo' non corrispondere con quella selezionata (focused).

	int nItem		indice (base 0) dell'elemento
*/
int CListCtrlEx::SetCurrentItem(int nItem)
{
	if(CListCtrl::GetItemCount() <= 0)
		return(LB_ERR);

	if(nItem < 0 || nItem > CListCtrl::GetItemCount())
		nItem = 0;

	m_nCurrentItem = nItem;

	return(m_nCurrentItem);
}

/*
	GetCurrentItem()

	Restituisce l'indice interno relativo alla riga corrente.
	Notare che la riga corrente puo' non corrispondere con quella selezionata (focused).
*/
int CListCtrlEx::GetCurrentItem(void)
{
	if(CListCtrl::GetItemCount() <= 0)
		return(LB_ERR);

	if(m_nCurrentItem==LB_ERR)
		m_nCurrentItem = 0;

	return(m_nCurrentItem);
}

/*
	SetItemSelection()

	Imposta lo status (interno) dell'elemento (selezionato o meno), restituendo l'anteriore.

	int nItem			indice (base 0) dell'elemento
	BOOL bSelected		flag per selezione elemento
*/
BOOL CListCtrlEx::SetItemSelection(int nItem,BOOL bSelected)
{
	BOOL bIsSelected = FALSE;
	CTRL_ROW* ra = GetRowByItem(nItem);
	
	if(ra)
	{
		bIsSelected = ra->selected;
		ra->selected = bSelected;
	}

	return(bIsSelected);
}

/*
	GetItemSelection()

	Restituisce lo status (interno) dell'elemento (selezionata o meno).

	int nItem			indice (base 0) dell'elemento
*/
BOOL CListCtrlEx::GetItemSelection(int nItem)
{
	BOOL bIsSelected = FALSE;
	CTRL_ROW* ra = GetRowByItem(nItem);
	
	if(ra)
		bIsSelected = ra->selected;

	return(bIsSelected);
}

/*
	ResetItemsSelection()

	Azzera lo status (interno) degli elementi (imposta su non selezionati).
*/
void CListCtrlEx::ResetItemsSelection(void)
{
	CTRL_ROW* ra;

	for(int i = 0; i < CListCtrl::GetItemCount(); i++)
		if((ra = GetRowByItem(i))!=(CTRL_ROW*)NULL)
			ra->selected = FALSE;
}

/*
	CompareItems()

	Confronta i due elementi per l'ordinamento del controllo.

	LPARAM lParam1		puntatore al testo del primo elemento
	LPARAM lParam2		puntatore al testo del secondo elemento
	LPARAM lCol		indice (base 0) della colonna
*/
int CALLBACK CompareItems(LPARAM lParam1,LPARAM lParam2,LPARAM lCol)
{
	int nCmp = 0;
	int n1,n2;
	static char s1[MAX_CTRLITEM_SIZE + 1],s2[MAX_CTRLITEM_SIZE + 1];
	static int n = 0;

	strcpyn(s1,GetItemToken(lCol,(LPCSTR)lParam1),sizeof(s1));
	strcpyn(s2,GetItemToken(lCol,(LPCSTR)lParam2),sizeof(s2));

	if(bAscending)
	{
		if(cType=='N')
		{
			n1 = atoi(s1);
			n2 = atoi(s2);
			
			if(n1 < n2)
				nCmp = -1;
			else if(n1 > n2)
				nCmp = 1;
		}
		else if(cType=='C')
			nCmp = strcmp(s1,s2);
	}
	else
	{
		if(cType=='N')
		{
			n1 = atoi(s1);
			n2 = atoi(s2);
			
			if(n2 < n1)
				nCmp = -1;
			else if(n2 > n1)
				nCmp = 1;
		}
		else if(cType=='C')
			nCmp = strcmp(s2,s1);
	}

	if(++n > 5)
	{
		n = 0;
		::PeekAndPump();
	}

	return(nCmp);
}

/*
	GetItemToken()

	Estrae dalla riga l'elemento relativo alla colonna.
	Gli elementi, all'interno della riga, devono essere separati dal carattere ';'.

	int nItem			indice (base 0) dell'elemento
	LPCSTR lpcszRow	riga contenente gli elementi separati dal carattere ';'
*/
LPCSTR GetItemToken(int nItem,LPCSTR lpcszRow)
{
	int i;
	LPSTR lpToken;
	static char szItem[MAX_CTRLROW_SIZE + 1];

	strcpy(szItem,"[null]");

	if(lpcszRow && *lpcszRow)
	{
		strcpyn(szItem,lpcszRow,sizeof(szItem));

		for(i = 0,lpToken = strtok(szItem,";"); lpToken!=NULL; i++)
		{
			if(i==nItem)
			{
				strcpyn(szItem,lpToken,sizeof(szItem));
				break;
			}

			lpToken = strtok(NULL,";");
		}
	}

	return(szItem);
}

/*
	PopUpMenu()

	Visualizza il menu popup sul controllo.
	Il menu visualizzato e' il primo sottomenu (base 0) del menu relativo all'id nel caso in cui venga
	fatto click su un elemento o il secondo se viene fatto click in una zona del controllo senza elementi.

	const CPoint& point		coordinate del click
*/
void CListCtrlEx::PopUpMenu(const CPoint& point)
{
	int i;
	CRect rect;
	CMenu menu;
	CMenu* pSubMenu = NULL;
	CTRL_ROW* ra;

	// coordinate dell'area client (CWnd, base 0,0)
	CWnd::GetClientRect(&rect);
	
	// trasforma le coordinate in assolute (schermo)
	// da aggiungere alle coordinate del click del mouse per ottenere le coordinate a cui visualizzare il menu a comparsa
	CWnd::ClientToScreen(&rect);	
	
	// click su un elemento del controllo
	if((i = CListCtrl::HitTest(point)) >= 0)
	{
		// carica il menu relativo all'id specificato dall'elemento su cui e' stato fatto click
		// (primo sottomenu, base 0)
		if((ra = GetRowByItem(i))!=(CTRL_ROW*)NULL)
			if(ra->menu > 0)
				if(menu.LoadMenu(ra->menu))
					pSubMenu = menu.GetSubMenu(0);
	}
	// click fuori dall'elemento
	else
	{
		// click su una zona del controllo contenente almeno un elemento
		if((ra = GetRowByItem(0))!=(CTRL_ROW*)NULL)
		{
			// carica il menu relativo all'id specificato dal primo elemento della lista
			// (secondo sottomenu, base 0)
			if(ra->menu > 0)
				if(menu.LoadMenu(ra->menu))
					pSubMenu = menu.GetSubMenu(1);
		}
		// click su una zona del controllo senza nessun elemento
		else
		{
			// carica il menu di default
			// (primo sottomenu, base 0)
			if(m_NullRow.menu > 0)
				if(menu.LoadMenu(m_NullRow.menu))
					pSubMenu = menu.GetSubMenu(0);
		}
	}

	// visualizza il menu popup
	if(pSubMenu && m_pWnd)
	{
		if(m_nMenuMessage!=(UINT)-1)
			::SendMessage(m_pWnd->m_hWnd,m_nMenuMessage,(WPARAM)m_nCurrentItem,(LPARAM)pSubMenu);

		pSubMenu->TrackPopupMenu(TPM_LEFTALIGN|TPM_RIGHTBUTTON,point.x+rect.left,point.y+rect.top,m_pWnd);
	}
}

/*
	Sort()
*/
void	CListCtrlEx::Sort(int nCol/* = 0*/)
{
	LRESULT lResult = 0L;
	NM_LISTVIEW nm_listview;
	memset(&nm_listview,'\0',sizeof(NM_LISTVIEW));
	nm_listview.iSubItem = nCol;
	OnColumnClick((NMHDR*)&nm_listview,&lResult);
}

/*
	OnColumnClick()

	Gestore per il click sull'header della colonna.
	Ordina le righe presenti nella colonna.
*/
void CListCtrlEx::OnColumnClick(NMHDR* pNMHDR,LRESULT* pResult) 
{
	// verifica che il controllo contenga almeno un elemento
	if(CListCtrl::GetItemCount() > 0)
	{
		NM_LISTVIEW* pNM_LISTVIEW = (NM_LISTVIEW*)pNMHDR;
		int nCol = pNM_LISTVIEW->iSubItem;
		CTRL_COL* ca = GetColByItem(nCol);

		if(ca)
		{
			// imposta l'ordinamento corrente (ascendente/discendente) in base al precedente
			ca->order = (ca->order==FALSE ? TRUE : FALSE);
			bAscending = ca->order;
			
			// distingue tra dati numerici e carattere
			cType = ca->type;
			if(cType!='C' && cType!='N')
				cType = 'C';
			
			// ordina le righe della colonna
			CListCtrl::SortItems((PFNLVCOMPARE)CompareItems,nCol);

			// rinumera l'indice (interno) delle rige secondo l'ordinamento corrente
			
			// notare che l'ordinamento avviene considerando la prima colonna (base 0) della lista
			// motivo per cui tale colonna non puo' contenere elementi duplicati: in tal caso il
			// confronto (vedi la strcmp() di cui sotto) tra i due elementi selezionerebbe sempre
			// il primo e tanti saluti alla rinumerazione dell'indice interno che se ne andrebbe a
			// puttane
			// il confronto non puo' essere fatto con memcmp() su n caratteri perche' fallirebbe
			// nel caso in cui ci siano elementi che iniziano con gli stessi caratteri (ftp e ftp-wpd)
			// per cui deve estrarre il testo relativo dal buffer interno (testo;testo;testo;etc.) e
			// confrontarlo con quello della riga con strcmp()
			ITERATOR iter;
			CTRL_ROW* ra = NULL;
			LPSTR p;
			char szItem[MAX_CTRLITEM_SIZE+1];
			char buffer[MAX_CTRLITEM_SIZE+1];
			int tot = CListCtrl::GetItemCount();
			register int i,n;

			// per ogni riga
			for(i = 0,n = 0; i < tot; i++)
			{
				// ricava il testo della riga a colonna 0
				if(CListCtrl::GetItemText(i,0,buffer,sizeof(buffer)-1) > 0)
					// cerca l'entrata corrispondente (testo;testo;testo;etc.) nella lista interna
					if((iter = m_RowList.First())!=(ITERATOR)NULL)
						while(iter!=(ITERATOR)NULL)
						{
							// puntatore alla riga
							ra = (CTRL_ROW*)iter->data;
							if(ra)
							{
								// estrae il testo corrispondente alla colonna 0
								if((p = strchr(ra->item,';'))!=NULL)
								{
									int n = p - ra->item;
									memcpy(szItem,ra->item,n);
									szItem[n] = '\0';
									
									if(strcmp(buffer,szItem)==0)
									{
										ra->index = i;
										break;
									}
								}
							}
							iter = m_RowList.Next(iter);
						}

				if(++n > 5)
				{
					n = 0;
					::PeekAndPump();
				}
			}
		}
	}

	*pResult = 0;
}

/*
	OnLButtonDown()

	Gestore per il click con il bottone sinistro del mouse sull'elemento del controllo.
	Imposta la riga come selezionata ed invia il messaggio alla finestra principale (in wParam l'indice
	dell'elemento selezionato ed in lParam le coordinate del click).
	Per catturare il rilascio del bottone sinistro del mouse con OnLButtonUp() anche quando il cursore
	del mouse e' stato spostato fuori dall'area client, utilizzare la SetCapture().
*/
void CListCtrlEx::OnLButtonDown(UINT nFlags,CPoint point)
{
	// salva le coordinate del click
	m_Point.x = point.x;
	m_Point.y = point.y;

	m_MouseClick.point.x = point.x;
	m_MouseClick.point.y = point.y;
	m_MouseClick.flags = nFlags;

	// chiama il gestore originale
	CListCtrl::OnLButtonDown(nFlags,point);

	// per continuare a ricevere i messaggi quando il mouse si sposta fuori dell'area client
	//::SetCapture(this->m_hWnd);
	
	// indice dell'elemento cliccato
	m_nCurrentItem = CListCtrl::HitTest(point);

	// imposta il flag relativo alla selezione
	// se viene cambiato l'ordinamento del controllo l'elemento relativo all'indice non corrisponde a quanto
	// presente nella lista del chiamante, per cui deve cercare l'elemento relativo prima di impostare il
	// flag per la selezione
	// effettua tale ricerca con il primo subitem (indice 0), per cui il valore presente in tale posizione
	// deve essere unico
	int nTotItems = CListCtrl::GetItemCount();

	if(m_nCurrentItem >= 0 && m_nCurrentItem < nTotItems)
	{
		CTRL_ROW* ra = NULL;
		ITERATOR iter;
		register int i;
		char buffer[MAX_CTRLITEM_SIZE+1];

		// azzera le selezioni correnti
		if((iter = m_RowList.First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				ra = (CTRL_ROW*)iter->data;
				if(ra)
					ra->selected = FALSE;
				iter = m_RowList.Next(iter);
			}

		// per ogni elemento del controllo verifica se e' stato selezionato, ricava il valore relativo al
		// subitem con indice 0 e lo confronta con l'elemento corrente: se coincidono imposta il flag per
		// la selezione
		// deve scorrere il controllo per gestire le selezioni multiple (click sul primo, shift+click
		// sull'ultimo)
		for(i = 0; i < nTotItems/*CListCtrl::GetItemCount()*/; i++)
		{
			// il cazzo di elemento e' stato cliccato ?
			// (click sull'elemento o elemento nel mezzo di una selezione click su i, shift+click su i+n)
			if(CListCtrl::GetItemState(i,LVIS_SELECTED) & LVIS_SELECTED)
			{
				memset(buffer,'\0',sizeof(buffer));

				LV_ITEM lvitem;
				lvitem.mask = LVIF_TEXT;
				lvitem.iItem = i;
				lvitem.iSubItem = 0;
				lvitem.pszText = buffer;
				lvitem.cchTextMax = sizeof(buffer)-1;
				CListCtrl::GetItem(&lvitem);

				if((ra = GetRowByItem(i))!=(CTRL_ROW*)NULL)
				{
					if(memcmp(ra->item,buffer,strlen(buffer))==0)
					{
						ra->selected = TRUE;
						break;
					}
				}

				if(!m_bMultipleSelection)
					break;
			}
		}
	}

	// salva l'indice (base 0) dell'elemento corrente (selezionato), controllando l'intervallo
	if(m_nCurrentItem < 0)
		m_nCurrentItem = LB_ERR;
	else if(m_nCurrentItem >= nTotItems/*CListCtrl::GetItemCount()*/)
		m_nCurrentItem = nTotItems/*CListCtrl::GetItemCount()*/ - 1;

	// se e' stato specificato un gestore, invia il messaggio relativo
	// in wParam l'indice dell'elemento ed in lParam le coordinate del click
	if(m_pWnd!=NULL && m_nLButtonDownMessage!=(UINT)-1)
		::SendMessage(m_pWnd->m_hWnd,m_nLButtonDownMessage,(WPARAM)m_nCurrentItem,(LPARAM)&m_MouseClick);
}

/*
	OnLButtonUp()

	Gestore per il rilascio del bottone sinistro del mouse.
	Invia il messaggio alla finestra principale (in wParam l'indice dell'elemento su cui e' stato rilasciato
	il mouse ed in lParam le coordinate del rilascio).
	Vedi le note in OnLButtonDown() a proposito di SetCapture().
*/
void CListCtrlEx::OnLButtonUp(UINT nFlags,CPoint point)
{
	// salva le coordinate del click
	m_Point.x = point.x;
	m_Point.y = point.y;

	// chiama il gestore originale
	CListCtrl::OnLButtonUp(nFlags,point);

	// per terminare di ricevere i messaggi con il mouse fuori dell'area client
	//if(::GetCapture()==this->m_hWnd)
	//	::ReleaseCapture();

	// indice dell'elemento su cui e' stato effettuato il rilascio
	int m_nCurrentItem = CListCtrl::HitTest(point);

	// se e' stato specificato un gestore, invia il messaggio relativo
	// in wParam l'indice dell'elemento ed in lParam le coordinate del rilascio
	if(m_pWnd!=NULL && m_nLButtonUpMessage!=(UINT)-1)
		::SendMessage(m_pWnd->m_hWnd,m_nLButtonUpMessage,(WPARAM)m_nCurrentItem,(LPARAM)&m_Point);
}

/*
	OnRButtonDown()

	Gestore per il click con il bottone destro del mouse sull'elemento del controllo.
	Visualizza il menu popup ed invia il messaggio alla finestra principale (in wParam
	l'indice dell'elemento selezionato ed in lParam le coordinate del click).
*/
void CListCtrlEx::OnRButtonDown(UINT nFlags,CPoint point)
{
	// salva le coordinate del click
	m_Point.x = point.x;
	m_Point.y = point.y;

	// chiama il gestore originale
	CListCtrl::OnRButtonDown(nFlags,point);

	// indice dell'item cliccato
	m_nCurrentItem = CListCtrl::HitTest(point);

	// a seconda del flag imposta l'item corrente come selezionato
	// (per default solo il click con il sinistro imposta l'elemento come selezionato)
	if(m_bRightClickSelects)
	{
		// resetta le selezioni correnti dato la selezione multiple puo' effettuarsi solo con CTRL+click destro
		ResetItemsSelection();
		
		// seleziona l'item
		SetItemSelection(m_nCurrentItem,TRUE);
	}

	// visualizza il menu a comparsa
	PopUpMenu(point);

	// se e' stato specificato un gestore, invia il messaggio relativo
	// in wParam l'indice dell'elemento ed in lParam le coordinate del click
	if(m_pWnd!=NULL && m_nRButtonDownMessage!=(UINT)-1)
		::PostMessage(m_pWnd->m_hWnd,m_nRButtonDownMessage,(WPARAM)m_nCurrentItem,(LPARAM)&m_Point);
}

/*
	OnRButtonUp()

	Gestore per il rilascio del bottone destro del mouse.
	Invia il messaggio alla finestra principale (in wParam l'indice dell'elemento su cui e' stato rilasciato
	il mouse ed in lParam le coordinate del rilascio).
*/
void CListCtrlEx::OnRButtonUp(UINT nFlags,CPoint point)
{
	// salva le coordinate del click
	m_Point.x = point.x;
	m_Point.y = point.y;

	// chiama il gestore originale
	CListCtrl::OnRButtonUp(nFlags,point);

	// indice dell'elemento su cui e' stato effettuato il rilascio
	int m_nCurrentItem = CListCtrl::HitTest(point);

	// se e' stato specificato un gestore, invia il messaggio relativo
	// in wParam l'indice dell'elemento ed in lParam le coordinate del rilascio
	if(m_pWnd!=NULL && m_nRButtonUpMessage!=(UINT)-1)
		::SendMessage(m_pWnd->m_hWnd,m_nRButtonUpMessage,(WPARAM)m_nCurrentItem,(LPARAM)&m_Point);
}

/*
	OnLButtonDblClk()

	Gestore per il doppio click con il bottone sinistro del mouse sull'elemento del controllo.
	Invia il messaggio alla finestra principale (in wParam l'indice dell'elemento selezionato ed in lParam
	le coordinate del click).
*/
void CListCtrlEx::OnLButtonDblClk(UINT nFlags,CPoint point)
{
	// salva le coordinate del click
	m_Point.x = point.x;
	m_Point.y = point.y;

	// chiama il gestore originale
	CListCtrl::OnLButtonDblClk(nFlags,point);

	// indice dell'elemento cliccato
	m_nCurrentItem = CListCtrl::HitTest(point);

	// se e' stato specificato un gestore, invia il messaggio relativo
	// in wParam l'indice dell'elemento ed in lParam le coordinate del click
	if(m_pWnd!=NULL && m_nLButtonDblClkMessage!=(UINT)-1)
		::PostMessage(m_pWnd->m_hWnd,m_nLButtonDblClkMessage,(WPARAM)m_nCurrentItem,(LPARAM)&m_Point);
}

/*
	OnRButtonDblClk()

	Gestore per il doppio click con il bottone destro del mouse sull'elemento del controlo.
	Invia il messaggio alla finestra principale (in wParam l'indice dell'elemento selezionato ed in lParam
	le coordinate del click).
*/
void CListCtrlEx::OnRButtonDblClk(UINT nFlags,CPoint point)
{
	// salva le coordinate del click
	m_Point.x = point.x;
	m_Point.y = point.y;

	// chiama il gestore originale
	CListCtrl::OnRButtonDblClk(nFlags,point);

	// indice dell'elemento cliccato
	m_nCurrentItem = CListCtrl::HitTest(point);

	// se e' stato specificato un gestore, invia il messaggio relativo
	// in wParam l'indice dell'elemento ed in lParam le coordinate del click
	if(m_pWnd!=NULL && m_nRButtonDblClkMessage!=(UINT)-1)
		::PostMessage(m_pWnd->m_hWnd,m_nRButtonDblClkMessage,(WPARAM)m_nCurrentItem,(LPARAM)&m_Point);
}
