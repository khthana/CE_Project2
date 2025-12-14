// IsagSig.cpp: implementation of the CIsagSig class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "IsagSign.h"
#include "IsagSig.h"
#include "math.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

HCRYPTHASH myhHash;
BYTE *Area;
DWORD *What;
DWORD result;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CIsagSig::CIsagSig()
{	m_hProv = NULL;
	m_hHash = NULL;
	m_pHashVal = NULL;
	m_pHashValLen = NULL;
	m_pSignVal = NULL;
	m_pSignValLen = NULL;
}

CIsagSig::~CIsagSig()
{	CryptReleaseContext(m_hProv,0);
}

void CIsagSig::ResetContext(CString ProvName)
{	CryptReleaseContext(m_hProv,0);
	{	if(!CryptAcquireContext(&m_hProv, ProvName,NULL,PROV_RSA_FULL,0))
		{	AfxMessageBox("Error during:\r\n\tAcquire "+ProvName+" Context");
			exit(1);
		}
	}
}

BYTE* CIsagSig::SetVarB(BYTE *From, int num)
{	int i;
	
	Area = new BYTE[num];
	for (i=0; i<num; i++)
	{	Area[i] = From[i];
	}
	return Area;
}

DWORD* CIsagSig::SetVarDW(DWORD *From)
{	What = new DWORD;
	*What = *From;
	return What;
}

void CIsagSig::CreateOutpB(BYTE *A, DWORD *len, CString &B)
{	DWORD Len, chrnum;
	CHAR *temp, *Result;
	
	if (A != NULL)
	{	Len = *len;
		temp = new CHAR[2*Len];
		Result=temp;
		for (chrnum=1; chrnum<=Len; chrnum++)
		{	sprintf(temp++,"%02X",*A++);
			temp++;
		}				
		*temp=NULL;
		B = Result;
	}
	else AfxMessageBox("A is null");
}

void CIsagSig::CreateOutpDW(DWORD *A, CString &B)
{	DWORD Len;
	CHAR *LenStr = new CHAR;

	Len = *A;
	sprintf(LenStr,"%d",Len*8);
	B = LenStr;
}

void CIsagSig::HashFile(CString Infile, BYTE alg)
{	// MD4=32770, MD5=32771, SHA-1=32772
	ALG_ID algid;
	DWORD BuffLen=1000, dwCount;
	BYTE *DataBuff=new BYTE[BuffLen+10];
	CHAR *hashalg=new CHAR[10], *LenStr=new CHAR[4];
	CFile FileHandle(Infile, CFile::modeRead|CFile::shareDenyNone);
	
	if (alg == 0) algid = CALG_MD4;
	else if (alg == 1) algid = CALG_MD5;
	else algid = CALG_SHA1;
	m_filename = Infile;
	
	if (!CryptCreateHash(m_hProv,algid,0,0,&myhHash))
	{	AfxMessageBox("Error during:\r\n\tCreate Hash");
		exit(1);
	}
	
			//********  Read File *********
	do
	{	dwCount=FileHandle.Read(DataBuff, BuffLen);
		if(!CryptHashData(myhHash, DataBuff, dwCount, 0))
		{	AfxMessageBox("Hash DATA has failed!");
		}
	} while(FileHandle.GetPosition()!=FileHandle.GetLength());

	FileHandle.Close();

			//********  Read File *********
	m_hHash = myhHash;
//	FindHashVal(m_hHash);
}

void CIsagSig::HashStream(BYTE alg)
{	// MD4=32770, MD5=32771, SHA-1=32772
	ALG_ID algid;
	ULONG BuffLen=1000, dwCount, final;
	HRESULT hresult;
	BYTE *DataBuff=new BYTE[BuffLen+10];
	CHAR *hashalg=new CHAR[10], *LenStr=new CHAR[4];
	FORMATETC fmetc;
	STGMEDIUM medium;
	HGLOBAL hGlobal;
	DWORD gsize, loop, count;
	
	fmetc.cfFormat = CF_TEXT;
	fmetc.ptd = NULL;
	fmetc.lindex = -1;
	fmetc.dwAspect = DVASPECT_CONTENT;
	fmetc.tymed = TYMED_HGLOBAL;
	
	hresult = theApp.m_pDataOb->GetData(&fmetc, &medium);
	// hresult return -2147024882 if sign with isagsign signature
	hGlobal = medium.hGlobal;
	DataBuff = (BYTE *)GlobalLock(hGlobal);
	gsize = GlobalSize(hGlobal);
	
	loop = floor(gsize/BuffLen);
	final = gsize % BuffLen;
	
	if (alg == 0) algid = CALG_MD4;
	else if (alg == 1) algid = CALG_MD5;
	else algid = CALG_SHA1;

	if (!CryptCreateHash(m_hProv,algid,0,0,&myhHash))
	{	AfxMessageBox("Error during:\r\n\tCreate Hash");
		exit(1);
	}

	//********  Read Stream from HGlobal *********
	if (loop > 0)
	{	for (count = 0; count < loop; count++)
		{	if(!CryptHashData(myhHash, DataBuff, BuffLen, 0))
			{	AfxMessageBox("Hash DATA has failed!");
			}
			DataBuff = DataBuff+BuffLen;
		}
	}
	
	if (final != 0)
	{	for (count = 0; count < final; count++)
		{	if (DataBuff[count] == 0) break;
		}
//		CString test;
//		CreateOutpB(DataBuff, &count, test);
//		AfxMessageBox(test);

		if(!CryptHashData(myhHash, DataBuff, count, 0))
		{	AfxMessageBox("Hash DATA has failed!");
		}
	}
		//********  Read Stream from HGlobal *********
	
	GlobalUnlock(hGlobal);
	ReleaseStgMedium(&medium);
	m_hHash = myhHash;
//	FindHashVal(m_hHash);
}

void CIsagSig::FindHashVal(HCRYPTHASH hHash)
{	BYTE *temp=new BYTE[100];
	DWORD *hlen=new DWORD;
		
	if (CryptGetHashParam(hHash,HP_HASHVAL,temp,hlen,0))
	{	m_pHashVal = SetVarB(temp, (int)*hlen);
		m_pHashValLen = SetVarDW(hlen);
		CreateOutpB(m_pHashVal, m_pHashValLen, m_OutpHashVal);
		CreateOutpDW(m_pHashValLen, m_OutpHashValLen);
		AfxMessageBox(m_OutpHashVal);
	}
	else
	{	AfxMessageBox("Error during:\r\n\tGet Hash Parameter");
		m_pHashVal = NULL;
	}
}

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

bool CIsagSig::SignFile(CString ProvName, CString Infile, bool isstream)
{	DWORD *SgLen = new DWORD, alglen = 1;
	BYTE *Sg, *alg;
	
	alg = theApp.getRegVal(ProvName, "Alg", REG_BINARY, &alglen);
	haveOwner = true;
	m_filename = Infile;
	ResetContext(ProvName);
	if (isstream) HashStream(*alg);
	else HashFile(Infile, *alg);
	
	//Get Signature Length
	if(!CryptSignHash(m_hHash, AT_SIGNATURE, NULL, 0, NULL, SgLen))
	{	//AfxMessageBox("Fail: Sign Hash Value");
		return false;
    }
	Sg = (BYTE *)malloc((unsigned int) *SgLen);
	
    // Sign hash object (with signature key).
    if(!CryptSignHash(m_hHash, AT_SIGNATURE, NULL, 0, Sg, SgLen))
	{	return false;
    }
	if (Sg != NULL)
	{	m_pSignVal = SetVarB(Sg, (int)*SgLen);
		CreateOutpB(Sg, SgLen, m_OutpSignVal);
		//AfxMessageBox(m_OutpSignVal);
	}
	if (SgLen != NULL)
	{	m_pSignValLen = SetVarDW(SgLen);
		CreateOutpDW(SgLen, m_OutpSignValLen);
	}
	haveOwner = true;
	return true;
}

// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BOOL CIsagSig::VerifySig(CString ProvName, CString Infile, bool isstream)
{	HCRYPTKEY hSigPublicKey;
	DWORD err = 0, alglen = 1;
	CHAR *test = new CHAR;
	CString test1;
	BYTE *alg;

	ResetContext(ProvName);
	if (ProvName=="TEMP") 
	{	if(!CryptImportKey(m_hProv, m_pPubVal, *m_pPubValLen, 0, 0, &hSigPublicKey))
		{	AfxMessageBox("Error during:\r\n\tImport public key");
			exit(1);
		}
		alg = new BYTE;
		*alg = myalg;
	}
	else
	{	if(!CryptGetUserKey(m_hProv, AT_SIGNATURE, &hSigPublicKey))
		{	AfxMessageBox("Error during:\r\n\tGet user key");
			return FALSE;
		}
		alg = theApp.getRegVal(ProvName, "Alg", REG_BINARY, &alglen);
	}
	if (isstream) HashStream(*alg);
	else HashFile(Infile, *alg);
	
	if (!CryptVerifySignature(m_hHash, m_pSignVal, *m_pSignValLen,
								hSigPublicKey, NULL, 0))
	{	//result = GetLastError();
		//theApp.chkSigresult(result);
		//sprintf(test, "%i", *m_pSignValLen);
		//test1 = test;
		//CreateOutpB(m_pSignVal, m_pSignValLen, m_OutpSignVal);
		//AfxMessageBox(m_OutpSignVal);
//		CryptReleaseContext(m_hProv, 0);
		return FALSE;
	}
//	CryptReleaseContext(m_hProv, 0);
	return TRUE;
}

HCRYPTHASH CIsagSig::GethHash()
{	return m_hHash;
}

BYTE* CIsagSig::GetSignVal()
{	return m_pSignVal;
}

DWORD CIsagSig::GetSignValLen()
{	return *m_pSignValLen;
}

void CIsagSig::SetSign(BYTE *sig, DWORD siglen, BYTE alg)
{	m_pSignVal = sig;
	if (m_pSignValLen == NULL)
		m_pSignValLen = new DWORD;
	*m_pSignValLen = siglen;
	myalg = alg;
}

void CIsagSig::SetPubKey(BYTE *pub, DWORD publen)
{	m_pPubVal = pub;
	if (m_pPubValLen == NULL)
		m_pPubValLen = new DWORD;
	*m_pPubValLen = publen;
}