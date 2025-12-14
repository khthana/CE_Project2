// IsagSignDoc.cpp : implementation of the CIsagSignDoc class
//

#include "stdafx.h"
#include "IsagSign.h"

#include "IsagSignDoc.h"
#include "SrvrItem.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CIsagSignDoc

IMPLEMENT_DYNCREATE(CIsagSignDoc, COleServerDoc)

BEGIN_MESSAGE_MAP(CIsagSignDoc, COleServerDoc)
	//{{AFX_MSG_MAP(CIsagSignDoc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIsagSignDoc construction/destruction

CIsagSignDoc::CIsagSignDoc()
{
}

CIsagSignDoc::~CIsagSignDoc()
{
}

BOOL CIsagSignDoc::OnNewDocument()
{	if (!COleServerDoc::OnNewDocument())
		return FALSE;

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CIsagSignDoc server implementation

COleServerItem* CIsagSignDoc::OnGetEmbeddedItem()
{
	CIsagSrvrItem* pItem = new CIsagSrvrItem(this);
	ASSERT_VALID(pItem);
	
	return pItem;
}

/////////////////////////////////////////////////////////////////////////////
// CIsagSignDoc serialization

void CIsagSignDoc::Serialize(CArchive& ar)
{	// Data format will be
	// 1. Signature Name					- String
	// 2. Hash Algorithm					- BYTE
	// 3. Signature Length (Bytes)			- DWORD
	// 4. Signature Data					- BYTE stream
	// 5. Public Key BLOB Length (Bytes)	- DWORD
	// 6. Public Key BLOB					- BYTE stream

	CString username;
	DWORD siglen, klen, alglen = 1;
	BYTE *psig, *pk;
	BOOL have;
	BYTE *alg, lalg;

	if (ar.IsStoring())
	{	//AfxMessageBox("Storing");
		if (theApp.m_user == "") return;
		m_user = theApp.m_user+"\r\n";
		alg = theApp.getRegVal(theApp.m_user, "Alg", REG_BINARY, &alglen);
		siglen = theApp.m_isagsig.GetSignValLen();
		psig = theApp.m_isagsig.GetSignVal();
		pk = theApp.getUserKey(theApp.m_user, &klen);

		ar.WriteString((LPCTSTR)m_user.GetBuffer(0));	// 1
		ar << *alg;										// 2
		ar << siglen;									// 3
		if (psig != NULL) ar.Write(psig, (UINT)siglen);	// 4
		ar << klen;										// 5
		if (pk != NULL) ar.Write(pk, (UINT)klen);		// 6
		
		// for verify immediately after sign
		theApp.m_isagsig.SetSign(psig, siglen, *alg);
		theApp.m_isagsig.SetPubKey(pk, klen);
	}
	else
	{	//AfxMessageBox("Loading");
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
// CIsagSignDoc diagnostics

#ifdef _DEBUG
void CIsagSignDoc::AssertValid() const
{
	COleServerDoc::AssertValid();
}

void CIsagSignDoc::Dump(CDumpContext& dc) const
{
	COleServerDoc::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CIsagSignDoc commands