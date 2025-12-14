// KickData.h: interface for the CKickData class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_KICKDATA_H__667FB7D6_C3BE_45BA_ACA7_A7298A126159__INCLUDED_)
#define AFX_KICKDATA_H__667FB7D6_C3BE_45BA_ACA7_A7298A126159__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CKickData  
{
public:
	CKickData();
	virtual ~CKickData();

	BOOL operator ==(const CKickData &rhs);
public:
	BOOL Save(CFile& file);
	BOOL Load(CFile& file);
	UINT	KickerNo;
	DWORD	KickerDir;
	CLocation KickerTeamLoc[NUMBER_OF_PLAYERS];
	CLocation OppTeamLoc[NUMBER_OF_PLAYERS];
	BOOL	Result;
};

typedef CArray<CKickData*,CKickData*>			CArrayOfKickData;
typedef CArrayOfKickData*						PCArrayOfKickData;


#endif // !defined(AFX_KICKDATA_H__667FB7D6_C3BE_45BA_ACA7_A7298A126159__INCLUDED_)
