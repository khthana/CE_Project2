// Crypt.h: interface for the CCrypt class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_CRYPT_H__174E877F_0CD8_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_CRYPT_H__174E877F_0CD8_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define _WIN32_WINNT 0x0400

#include "wincrypt.h"

class CCrypt  
{
public:
	CCrypt();
	virtual ~CCrypt();
	
	CString		m_filename, m_user;
	bool		haveOwner;
	BYTE		myalg;

	void		SethProv(HCRYPTPROV hProv);
	void		HashFile(CString Infile, BYTE alg);
	void		HashStream(BYTE alg);
	BYTE*		SetVarB(BYTE *From, int num);
	DWORD*		SetVarDW(DWORD *From);
	bool		SignFile(CString ProvName, CString Infile, bool isstream);
	BOOL		VerifySig(CString ProvName, CString Infile, bool isstream);
	HCRYPTHASH	GethHash();
	BYTE*		GetSignVal();
	DWORD		GetSignValLen();
	void		SetSign(BYTE *sig, DWORD siglen, BYTE alg);
	void		SetPubKey(BYTE *pub, DWORD publen);
	void		CreateOutpB(BYTE *A,   DWORD *len, CString &B);
	void		CreateOutpDW(DWORD *A, CString &B);

protected:
	void FindHashVal(HCRYPTHASH hHash);

private:
	HCRYPTPROV	m_hProv;
	HCRYPTHASH	m_hHash;
	BYTE		*m_pHashVal,      *m_pSignVal,		*m_pPubVal;
	DWORD		*m_pHashValLen,   *m_pSignValLen,	*m_pPubValLen;
	CString		m_OutpHashVal,    m_OutpSignVal;
	CString		m_OutpHashValLen, m_OutpSignValLen;

	void		ResetContext(CString ProvName);
};

#endif // !defined(AFX_CRYPT_H__174E877F_0CD8_11D6_BB32_00E07D0326BE__INCLUDED_)
