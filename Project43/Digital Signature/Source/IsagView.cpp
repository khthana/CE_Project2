// IsagView.cpp : implementation of the CIsagSignView class
//

#include "stdafx.h"
#include "IsagSign.h"

#include "IsagSignDoc.h"
#include "IsagView.h"
#include "NewSigDlg.h"
#include "IpFrame.h"
#include "srvritem.h"
//#include "msword8.h"
#include "mso97.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

COleVariant covTrue((short)TRUE),
            covFalse((short)FALSE),
            covOptional((long)DISP_E_PARAMNOTFOUND, VT_ERROR);

/////////////////////////////////////////////////////////////////////////////
// CIsagSignView

IMPLEMENT_DYNCREATE(CIsagSignView, CListView)

BEGIN_MESSAGE_MAP(CIsagSignView, CListView)
	//{{AFX_MSG_MAP(CIsagSignView)
	ON_COMMAND(ID_CANCEL_EDIT_SRVR, OnCancelEditSrvr)
	ON_COMMAND(ID_SIGNATURE_SIGNSIGNATURE, OnSignatureSignsignature)
	ON_COMMAND(ID_SIGNATURE_VERIFYSIGNATURE, OnSignatureVerifysignature)
	ON_COMMAND(ID_SIGNATURE_TEST, OnSignatureTest)
	ON_COMMAND(ID_SIGNATURE_NEWSIGNATURE, OnNewsignature)
	ON_COMMAND(ID_EDIT_CUT, OnEditCut)
	ON_WM_KEYDOWN()
	ON_COMMAND(ID_SIGNATURE_REMOVESIGNATURE, OnRemovesignature)
	ON_WM_LBUTTONDBLCLK()
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CListView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CListView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CListView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIsagSignView construction/destruction

CIsagSignView::CIsagSignView()
{	m_pParentWnd = NULL;
}

CIsagSignView::~CIsagSignView()
{
}

BOOL CIsagSignView::PreCreateWindow(CREATESTRUCT& cs)
{
	return CListView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CIsagSignView drawing

void CIsagSignView::OnDraw(CDC* pDC)
{
	CIsagSignDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	if (theApp.m_pic != NULL)
	{	pDC->DrawState(CPoint(0,0), CSize(280, 80), theApp.m_pic, DSS_NORMAL, NULL);
	}
}

void CIsagSignView::OnInitialUpdate()
{
	CListView::OnInitialUpdate();
	theApp.InitRegistry();
	//Init();
	m_pisagsig = &(theApp.m_isagsig);
	
	CListCtrl& ListCtrl = GetListCtrl();
	m_itemnum = 0;
	m_imlist.Create(32, 32, ILC_COLORDDB, 0, 5);
	ListCtrl.SetImageList(&m_imlist, LVSIL_NORMAL);
	if (theApp.m_user == "") Refresh();
	else ClearView();
}

/////////////////////////////////////////////////////////////////////////////
// CIsagSignView printing

BOOL CIsagSignView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CIsagSignView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
}

void CIsagSignView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
}

/////////////////////////////////////////////////////////////////////////////
// OLE Server support


void CIsagSignView::OnCancelEditSrvr()
{
	GetDocument()->OnDeactivateUI(FALSE);
}

/////////////////////////////////////////////////////////////////////////////
// CIsagSignView diagnostics

#ifdef _DEBUG
void CIsagSignView::AssertValid() const
{
	CListView::AssertValid();
}

void CIsagSignView::Dump(CDumpContext& dc) const
{
	CListView::Dump(dc);
}

CIsagSignDoc* CIsagSignView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CIsagSignDoc)));
	return (CIsagSignDoc*)m_pDocument;
}
#endif //_DEBUG

void CIsagSignView::Init()
{	HRESULT hresult;
	IUnknown *pUnk = NULL;
	IDispatch *pDisp = NULL;
	IDataObject *pDataOb = NULL;
	LPDISPATCH lp_disp = NULL;

	if (m_pParentWnd == NULL) // First Time
	{	m_pParentWnd = theApp.m_pIpFrame->GetParentOwner();
		if (m_pParentWnd != NULL) // Embedded in others
		{	CString str, substr;
			
			m_pParentWnd->GetWindowText(str);
			substr = str.SpanIncluding("Microsoft Word");
			if (substr.Compare("Microsoft Word") > 0) // Word
			{	CLSID clsid;

				CLSIDFromProgID(L"Word.Application", &clsid);
				hresult = GetActiveObject(clsid, NULL, &pUnk);
				if (hresult != S_OK) return;
				hresult = pUnk->QueryInterface(IID_IDispatch, (void **)&pDisp);
				if (hresult != S_OK) return;
				m_objApp.AttachDispatch(pDisp, TRUE);
				lp_disp = m_objApp.GetDocuments();
				m_objDocs.AttachDispatch(lp_disp);
				if (m_objDocs.GetCount() != 0)
				{	lp_disp = m_objApp.GetActiveDocument();
					m_objDoc.AttachDispatch(lp_disp);
					lp_disp->QueryInterface(IID_IDataObject, (void **)&pDataOb);
					theApp.m_pDataOb = pDataOb;
				}
			} // Word
		} // Embedded in others
	} // First time
}

//********************* Get Some Value ********************

_Application* CIsagSignView::GetobjApp()
{	return &m_objApp;
}

_Document* CIsagSignView::GetobjDoc()
{	return &m_objDoc;
}

Documents* CIsagSignView::GetobjDocs()
{	return &m_objDocs;
}

void CIsagSignView::getSel()
{	int nCurSel;
	CListCtrl& ListCtrl = GetListCtrl();
	
	theApp.m_user = "";
	if (ListCtrl.GetSelectedCount() == 1)
	{	nCurSel = ListCtrl.GetNextItem(-1,LVNI_SELECTED); 
		if (nCurSel != 0)
		{	theApp.m_user = ListCtrl.GetItemText(nCurSel,0);
		}
    }
}

CString CIsagSignView::GetActiveFilename()
{	return m_objDoc.GetFullName();
}

//********************** Manage View **********************

void CIsagSignView::Refresh() // View all signature in Registry
{	HKEY mainhk = NULL, hk = NULL;
	DWORD todo, i, signum, size;
	LPTSTR str;
	CString cstr;
	LONG err = ERROR_SUCCESS;
	CListCtrl& ListCtrl = GetListCtrl();

	ListCtrl.DeleteAllItems();
	m_itemnum = 0;
	m_user = "";
	theApp.m_user = "";
	i = 0;
	todo = REG_OPENED_EXISTING_KEY;
	err = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\IsagSign",
            0, KEY_ENUMERATE_SUB_KEYS, &mainhk);
	RegQueryInfoKey(mainhk, NULL, NULL, NULL, &signum, NULL,
			NULL, NULL, NULL, NULL, NULL, NULL);

	do
	{	str = new char[257];
		size = 257;
		err = RegEnumKeyEx(mainhk, i++, str, &size, NULL, NULL, NULL, NULL);
		cstr = str;
		if (err == ERROR_SUCCESS) addIcon(cstr);
	} while (err == ERROR_SUCCESS);
}

void CIsagSignView::ClearView()
{	CListCtrl& ListCtrl = GetListCtrl();

	ListCtrl.DeleteAllItems();
	m_itemnum = 0;
	addIcon(theApp.m_user);
}

//********************** Manage Icon **********************

void CIsagSignView::addIcon(CString inp)
{	HICON hicon;
	LPTSTR tmpname;
	LV_ITEM lvi;	// List View Item Structure
	CListCtrl& ListCtrl = GetListCtrl();

	// Add icon to image list
	hicon = AfxGetApp()->LoadIcon(IDI_ICON1);
	m_imlist.Add(hicon);
	// i = m_imlist.GetImageCount();
	
	// Insert new item in List Control
	lvi.mask = LVIF_TEXT | LVIF_IMAGE | LVIF_STATE;
	lvi.iItem = m_itemnum;
	lvi.iSubItem = 0;
//	kname = dlg.m_name+" "+dlg.m_surname+"\0";
	tmpname = inp.GetBuffer(0);
	lvi.pszText = tmpname;
	lvi.iImage = m_itemnum;
	lvi.stateMask = LVIS_STATEIMAGEMASK;
	lvi.state = INDEXTOSTATEIMAGEMASK(1);
	ListCtrl.InsertItem(&lvi);

	m_itemnum++;
}

void CIsagSignView::deleteIcon(CString inp)
{	theApp.deleteUser(inp);
}

//******************* On View Menu Event ******************

void CIsagSignView::OnEditCut() 
{	CListCtrl &ListCtrl = GetListCtrl();
	int nItem;
	CString str;
	POSITION pos = ListCtrl.GetFirstSelectedItemPosition();

	if ( (pos != NULL) && (ListCtrl.GetItemCount() > 1) )
	{	while (pos)
		{	nItem = ListCtrl.GetNextSelectedItem(pos);
			str = ListCtrl.GetItemText(nItem, 0);
			if (str != "IsagSign") deleteIcon(str);
		}
		Refresh();
	}
}

void CIsagSignView::OnNewsignature() 
{	CNewSigDlg dlg;
	
	if (dlg.DoModal()==IDOK)
	{	addIcon(dlg.m_name+" "+dlg.m_surname);
	}
	if (theApp.m_user == "") Refresh();
}

void CIsagSignView::OnRemovesignature()
{	OnEditCut();
}

void CIsagSignView::OnSignatureSignsignature()
{	if (theApp.m_user != "")
	{	MessageBox("You cannot sign more than one time");
		return;
	}
	getSel();
	if (theApp.m_user == "")
	{	AfxMessageBox("Can't use this signature");
	}
	else
	{	Init();
		MessageBox(theApp.m_user);
		SignSignature(theApp.m_user);
	}
}

void CIsagSignView::SignSignature(CString name)
{	CString fname;

	//fname = GetActiveFilename();
	fname = "";
	if (!theApp.LoadPicFile(name))
	{	AfxMessageBox("Picture change");
	}
	else 
	{	if (m_pisagsig->SignFile(name, fname, true))
		{	GetDocument()->NotifyChanged();
			GetDocument()->GetEmbeddedItem()->NotifyChanged();
			ClearView();
		}
		else theApp.m_user = "";
	}
}

void CIsagSignView::OnSignatureVerifysignature() 
{	BOOL test;
	
//	m_objDoc.Save();
	Init();
	if (theApp.m_user == "") 
	{	AfxMessageBox("Doesn't sign yet !");
		return;
	}
	//test = m_pisagsig->VerifySig(theApp.m_user, "", true);
	test = m_pisagsig->VerifySig("TEMP", "", true);
	if (test == TRUE) AfxMessageBox("Valid");
	else AfxMessageBox("Invalid");
}

void CIsagSignView::OnSignatureTest() 
{	CommandBars cbs;
	CommandBar cb;
	CommandBarControls cbctrls;
	CommandBarControl cbpop;
	LPDISPATCH lp_disp;
	VARIANT vr;
	CString str;
	
	//Init();
	lp_disp = m_objApp.GetCommandBars();
	cbs.AttachDispatch(lp_disp);
	long i = cbs.GetCount();
/*
	vr.vt = VT_BSTR;
	vr.bstrVal = (BSTR)"IsagSign";
	cbs.Add(vr, COleVariant((short)6), covOptional, covTrue);
*/
	lp_disp = cbs.GetActiveMenuBar();
	cb.AttachDispatch(lp_disp);
	lp_disp = cb.GetControls();
	cbctrls.AttachDispatch(lp_disp);

	lp_disp = cbctrls.GetItem(COleVariant((short)9));
	cbpop.AttachDispatch(lp_disp);
//	cbpop.Delete(covTrue);
	//cbctrl.SetBeginGroup(FALSE);
	

	cbpop = cbctrls.Add(COleVariant((short)1), covOptional, covOptional,
		COleVariant((long)9), covTrue);
//	cbctrl = cbctrls.Add(COleVariant((short)1), covOptional, covOptional,
//		COleVariant((short)9), covTrue);
	cbpop.SetCaption("Isag&Sign");
	cbpop.SetVisible(TRUE);
	cbpop.SetEnabled(TRUE);

/*
	cbctrl = cbctrls.Add(
		COleVariant((short)1), //  msoControlButton const VARIANT& Type,
        covOptional, //const VARIANT& Id,
        covOptional, //const VARIANT&
        //  Parameter, to pass with OnAction
        covOptional, //const VARIANT&
        //  Before,
        //  Location on popup before item #
        covTrue  //const VARIANT& Temporary, (delete when app quits).
      );
	cbctrl.SetCaption("IsagSign");
	cbctrl.SetVisible(TRUE);
	cbctrl.SetEnabled(TRUE);
*/
}

//********************** On Other Event *******************

void CIsagSignView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	CListView::OnKeyDown(nChar, nRepCnt, nFlags);

	if (nChar == VK_DELETE) OnEditCut();
}

void CIsagSignView::OnLButtonDblClk(UINT nFlags, CPoint point) 
{	CListCtrl& ListCtrl = GetListCtrl();
	int which, namelen;
	char *pname = new char[100];
	CString name;
	
	CListView::OnLButtonDblClk(nFlags, point);
	Init();
	if (m_pParentWnd != NULL) // Embedded
	{	if (theApp.m_user == "") // Not Signed yet
		{	which = ListCtrl.HitTest(point, NULL);
			if (which != -1) // Found double click item
			{	namelen = ListCtrl.GetItemText(which, 0, pname, 100);
				name = pname;
				theApp.m_user = name;
				if (theApp.m_user != "IsagSign") SignSignature(name);
				else theApp.m_user = "";
			}
		}
		else // has been signed before
			MessageBox("You cannot sign more than one time");
	}
}
