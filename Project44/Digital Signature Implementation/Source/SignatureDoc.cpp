// SignatureDoc.cpp : implementation of the CSignatureDoc class
//

#include "stdafx.h"
#include "Signature.h"

#include "SignatureDoc.h"
#include "SrvrItem.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc

IMPLEMENT_DYNCREATE(CSignatureDoc, COleServerDoc)

BEGIN_MESSAGE_MAP(CSignatureDoc, COleServerDoc)
	//{{AFX_MSG_MAP(CSignatureDoc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BEGIN_DISPATCH_MAP(CSignatureDoc, COleServerDoc)
	//{{AFX_DISPATCH_MAP(CSignatureDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//      DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_DISPATCH_MAP
END_DISPATCH_MAP()

static const IID IID_ISignature =
{ 0xf65842e5, 0xf2e, 0x11d6, { 0xbb, 0x32, 0x0, 0xe0, 0x7d, 0x3, 0x26, 0xbe } };

BEGIN_INTERFACE_MAP(CSignatureDoc, COleServerDoc)
	INTERFACE_PART(CSignatureDoc, IID_ISignature, Dispatch)
END_INTERFACE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc construction/destruction

CSignatureDoc::CSignatureDoc()
{
	//EnableAutomation();

	//AfxOleLockApp();
}

CSignatureDoc::~CSignatureDoc()
{
	//AfxOleUnlockApp();
}

BOOL CSignatureDoc::OnNewDocument()
{
	if (!COleServerDoc::OnNewDocument())
		return FALSE;

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc server implementation

COleServerItem* CSignatureDoc::OnGetEmbeddedItem()
{
	//m_strText = "Signature";

	CSignatureSrvrItem* pItem = new CSignatureSrvrItem(this);
	ASSERT_VALID(pItem);
	return pItem;
}

/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc Active Document server implementation

CDocObjectServer *CSignatureDoc::GetDocObjectServer(LPOLEDOCUMENTSITE pDocSite)
{
	return new CDocObjectServer(this, pDocSite);
}



/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc serialization

void CSignatureDoc::Serialize(CArchive& ar)
{

	CString username;
	DWORD siglen, klen, alglen = 1;
	BYTE *psig, *pk;
	BOOL have;
	BYTE *alg, lalg;

	if (ar.IsStoring())
	{

		if (theApp.m_user == "") 
			return;
		m_user = theApp.m_user+"\r\n";
	
		alg = theApp.getRegVal(theApp.m_user, "Alg", REG_BINARY, &alglen);
		
		siglen = theApp.m_isagsig.GetSignValLen();
	
		psig = theApp.m_isagsig.GetSignVal();
	
		pk = theApp.getUserKey(theApp.m_user, &klen);

		ar.WriteString((LPCTSTR)m_user.GetBuffer(0));	// 1
	
		ar << *alg;										// 2
		
		ar << siglen;									// 3
		
		if (psig != NULL) 
			ar.Write(psig, (UINT)siglen);				// 4
		
		ar << klen;										// 5
		
		if (pk != NULL) ar.Write(pk, (UINT)klen);		// 6
		
		
		// for verify immediately after sign
		theApp.m_isagsig.SetSign(psig, siglen, *alg);
		theApp.m_isagsig.SetPubKey(pk, klen);
	}
	else
	{
		have = ar.ReadString(username);					// 1
		if (!have) return;
		ar >> lalg;										// 2
		ar >> siglen; psig = new BYTE[siglen];			// 3
		if (siglen > 0) ar.Read(psig, (UINT)siglen);	// 4
		ar >> klen; pk = new BYTE[klen];				// 5
		if (klen > 0) ar.Read(pk, (UINT)klen);			// 6
		
		theApp.m_user = username;
		theApp.m_isagsig.SetSign(psig, siglen, lalg);
		theApp.m_isagsig.SetPubKey(pk, klen);
	}
}

/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc diagnostics

#ifdef _DEBUG
void CSignatureDoc::AssertValid() const
{
	COleServerDoc::AssertValid();
}

void CSignatureDoc::Dump(CDumpContext& dc) const
{
	COleServerDoc::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CSignatureDoc commands
