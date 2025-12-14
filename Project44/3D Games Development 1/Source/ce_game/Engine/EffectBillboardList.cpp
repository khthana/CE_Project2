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
#include "EffectBillboardList.h"


CEffectBillboardList::CEffectBillboardList()
{

}

CEffectBillboardList::~CEffectBillboardList()
{
	Clear();
}
		

void CEffectBillboardList::Clear()
{
	int nSize = m_ptrList.GetSize();

	for (int nCount = 0 ; nCount < nSize ; nCount++ )
	{
		delete ((CEffectBillboard *)m_ptrList.GetAt(nCount) );
	}

	m_ptrList.RemoveAll();

}
		  

void CEffectBillboardList::Add(
						const char *  FileName  ,
						float fXStart			,
						float fYStart			,
						float fZStart			,

						float fXEnd				,
						float fYEnd				,
						float fZEnd				,

						float fStartWidth		,
						float fStartHeight		,
						float fEndWidth			,
						float fEndHeight		,

						float fStartR			,
						float fStartG			,
						float fStartB			,
						float fStartA			,

						float fEndR				,
						float fEndG				,
						float fEndB				,
						float fEndA				,

						float fAllTime			
			)
{
	CEffectBillboard *pBill = new CEffectBillboard(
													 fXStart,fYStart,fZStart,
													 fXEnd,fYEnd,fZEnd,
													 fStartWidth,fStartHeight,
													 fEndWidth,fEndHeight,
													 fStartR,fStartG,fStartB,fStartA,
													 fEndR,fEndG,fEndB,fEndA,
													 fAllTime			
													);

	pBill->SetTime();
	pBill->SetTexture(FileName);
	m_ptrList.Add(pBill);

}

void CEffectBillboardList::Render( D3DXMATRIX  &matBillboard )
{
	int nSize = m_ptrList.GetSize();

	for (int nCount = 0 ; nCount < nSize ; nCount++ )
	{
		CEffectBillboard *pBill =((CEffectBillboard *)m_ptrList.GetAt(nCount));

		if ( pBill->Render(matBillboard) )
		{
			 delete (CEffectBillboard *)pBill;
			 m_ptrList.RemoveAt(nCount--);
			 nSize--;
		}
	}

}

