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

#include "..\stdafx.h"
#include "Op.h"
#include "Util.h"

// Class COp
COp::COp()
{ 
	m_OpID     = OPID_NULL; 
	m_pOpFloat = NULL;
	m_pOpInt   = NULL;
	m_pOpStr   = NULL; 
};

COp::~COp()
{
	DestroyAllOp();
}

void COp::DestroyOpFloat()
{
	SAFE_DELETE_ARRAY( m_pOpFloat );
}

void COp::DestroyOpInt()
{
	SAFE_DELETE_ARRAY( m_pOpInt );
}

void COp::DestroyOpStr()
{
	SAFE_DELETE_ARRAY( m_pOpStr );
}

void COp::DestroyAllOp()
{
	DestroyOpFloat();
	DestroyOpInt();
	DestroyOpStr();
}

// Reserve
void COp::ReserveOpFloat( int Size )
{
	DestroyOpFloat();
	m_pOpFloat = new float[Size];
}

void COp::ReserveOpInt( int Size )
{
	DestroyOpInt();
	m_pOpInt   = new int[Size];
}

void COp::ReserveOpStr( int Size )
{
	DestroyOpStr();
	m_pOpStr   = new CString[Size];
}

// SetOP
void COp::SetOpID( int OpID )
{
	m_OpID = OpID;
}

void COp::SetOpFloat( int nIndex, float fData )
{
	m_pOpFloat[nIndex] = fData;
}

void COp::SetOpInt( int nIndex, int nData )
{
	m_pOpInt[nIndex]   = nData;	
}

void COp::SetOpStr( int nIndex, const CString& strData )
{
	m_pOpStr[nIndex] = strData;
}

// GetOP
int     COp::GetOpID()
{
	return m_OpID;
}

float   COp::GetOpFloat( int nIndex )
{
	return m_pOpFloat[nIndex];
}

int     COp::GetOpInt( int nIndex )
{
	return m_pOpInt[nIndex];
}

CString COp::GetOpStr( int nIndex )
{
	return m_pOpStr[nIndex];
}

