// IsagSig.h: interface for the CIsagSig class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ISAGSIG_H__8A5F639B_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
#define AFX_ISAGSIG_H__8A5F639B_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define _WIN32_WINNT 0x0400

#include "wincrypt.h"

class CIsagSig
{
public:
	CString m_filename, m_user;
	bool haveOwner;
	BYTE myalg;
	CIsagSig();
	virtual ~CIsagSig();
	void SethProv(HCRYPTPROV hProv);
	void HashFile(CString Infile, BYTE alg);
	void HashStream(BYTE alg);
	BYTE* SetVarB(BYTE *From, int num);
	DWORD* SetVarDW(DWORD *From);
	bool SignFile(CString ProvName, CString Infile, bool isstream);
	BOOL VerifySig(CString ProvName, CString Infile, bool isstream);
	HCRYPTHASH GethHash();
	BYTE* GetSignVal();
	DWORD GetSignValLen();
	void SetSign(BYTE *sig, DWORD siglen, BYTE alg);
	void SetPubKey(BYTE *pub, DWORD publen);
	void CreateOutpB(BYTE *A,   DWORD *len, CString &B);
	void CreateOutpDW(DWORD *A, CString &B);

protected:
	void FindHashVal(HCRYPTHASH hHash);
//	void FindOutpHashVal(BYTE *pHashVal, DWORD *pHashValLen);

private:
	HCRYPTPROV m_hProv;
	HCRYPTHASH m_hHash;
	BYTE    *m_pHashVal,      *m_pSignVal,		*m_pPubVal;
	DWORD   *m_pHashValLen,   *m_pSignValLen,	*m_pPubValLen;
	CString  m_OutpHashVal,    m_OutpSignVal;
	CString  m_OutpHashValLen, m_OutpSignValLen;

	void ResetContext(CString ProvName);
};

#endif // !defined(AFX_ISAGSIG_H__8A5F639B_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
