/////////////////////////////////////////////////////////////////////////////
//
//	Copyright (c) 2001, Maetee Supreanruey and Anusorn Krasantisuk
//	All Rights Reserved.
//
//	This is UNPUBLISHED PROPRIETARY SOURCE CODE of Maetee Supreanruey 
//	and Anusorn Krasantisuk, the contents of this file may not be 
//	disclosed to third parties, copied or duplicated in any form, 
//	in whole or in part, without the prior written permission of 
//	Maetee Supreanruey and Anusorn Krasantisuk.
//
/////////////////////////////////////////////////////////////////////////////

#pragma once

//=======================================================================
// Class Operation
//=======================================================================
class COp 
{
public:
	enum OPIDTYPE 
	{
		OPID_NULL = -1
	};

public:
	COp();
	virtual ~COp();

private:
	int      m_OpID; 
	float   *m_pOpFloat;
	int     *m_pOpInt;
	CString *m_pOpStr;

public:
	// Reserve
	void ReserveOpFloat( int Size );
	void ReserveOpInt  ( int Size );
	void ReserveOpStr  ( int Size );

	// SetOP
	void SetOpID   ( int OpID );
	void SetOpFloat( int nIndex, float fData );
	void SetOpInt  ( int nIndex, int nData );
	void SetOpStr  ( int nIndex, const CString& strData );

	// GetOP
	int     GetOpID();
	float   GetOpFloat( int nIndex );
	int     GetOpInt( int nIndex );
	CString GetOpStr( int nIndex );

	// Destroy
	void DestroyOpFloat();
	void DestroyOpInt();
	void DestroyOpStr();
	void DestroyAllOp();
};



