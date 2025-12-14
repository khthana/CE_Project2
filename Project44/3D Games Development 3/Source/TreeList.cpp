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

#include "stdafx.h"
#include "TreeList.h"
#include "Engine\logger.h"
#include <fstream>
using namespace std;

CTreeList::CTreeList()
{
}

CTreeList::~CTreeList()
{
	ClearTreeList();
}

void CTreeList::AddTree(CTree * pTree)
{
	if (pTree != NULL)
	{
		m_ptrTree.Add( pTree );
	}
}

void CTreeList::ClearTreeList()
{
	int nSize = m_ptrTree.GetSize();

	for ( int nCount = 0 ; nCount < nSize ; nCount++)
	{
		delete ((CTree*)(m_ptrTree.GetAt(nCount)));
	}

	m_ptrTree.RemoveAll();
}

void CTreeList::AddTree(	const char * FileName,
							float fX, float fY, float fZ,
							float fSX,float fSY,float fSZ,
							D3DXVECTOR3 vNormal, 
							float fRow, float fPhi, float fZetha)
{
	CTree * pTree = new CTree;
	pTree->LoadModel(FileName);
	pTree->SetScale(fSX,fSY,fSZ);
	pTree->SetPosition(fX,fY,fZ);
	pTree->SetDirVecMode( CMovMat::DV_NORMALVEC );
	pTree->SetDirVec( &vNormal );
	pTree->SetRotation(fRow,fPhi,fZetha);
	AddTree(pTree);	
}

void CTreeList::Delete( int nCount )
{
	delete ((CTree *)m_ptrTree.GetAt(nCount));
	m_ptrTree.RemoveAt(nCount);
}


CTree* CTreeList::GetAt(int nCount)
{
	int nSize = m_ptrTree.GetSize();
	if ( (nCount>=0) && (nCount<nSize))
	{
		return ((CTree *)(m_ptrTree.GetAt(nCount)));
	}
	return NULL;
}

void CTreeList::RenderAll(D3DXVECTOR3 &vCamera,const D3DXMATRIX *matBillBoard)
{
	int nSize = m_ptrTree.GetSize();

	float fCX = vCamera.x;
	float fCY = vCamera.y;
	float fCZ = vCamera.z;

	float fDX = 0;
	float fDY = 0;
	float fDZ = 0;

	for ( int nCount = 0 ; nCount < nSize; nCount++)
	{
		CTree *  pTree = GetAt(nCount);

		if ( pTree == NULL )
		{
			Log("error tree is null int void CTreeList::RenderAll ");
		}
		fDX = ( pTree->Px() - fCX );
		fDY = ( pTree->Py() - fCY );
		fDZ = ( pTree->Pz() - fCZ );
		 
		if ( fDX < 0.0f ) fDX = - fDX;
		if ( fDY < 0.0f ) fDY = - fDY;
		if ( fDZ < 0.0f ) fDZ = - fDZ;

		float fLength = ( fDX + fDY + fDZ );

		if ( fLength < __fRenderTreeLength[CMultiDetailData::HiDetail] )
		{
			pTree->Render(CMultiDetailData::HiDetail);
		}
		else if  ( fLength < __fRenderTreeLength[CMultiDetailData::MidDetail] )
		{
			pTree->Render(CMultiDetailData::MidDetail);
		}
		else if  ( fLength < __fRenderTreeLength[CMultiDetailData::LowDetail] )
		{
			pTree->Render(CMultiDetailData::LowDetail);
		}
		else if  ( fLength < __fRenderTreeLength[CMultiDetailData::BillBoard] )
		{
			//D3DXMatrixInverse( &m_matBillboard, NULL, &m_matView );
			pTree->Render(CMultiDetailData::BillBoard, matBillBoard );
		}
	}
}

void CTreeList::RenderAt(int nNumber, D3DXVECTOR3 &vCamera,const D3DXMATRIX *matBillBoard)
{
	CTree * pTree = GetAt(nNumber);

	// Check Error
	if ( pTree == NULL ) return;

	float fCX = vCamera.x;
	float fCY = vCamera.y;
	float fCZ = vCamera.z;

	float fDX = 0;
	float fDY = 0;
	float fDZ = 0;


		fDX = ( pTree->Px() - fCX );
		fDY = ( pTree->Py() - fCY );
		fDZ = ( pTree->Pz() - fCZ );
		 
		if ( fDX < 0.0f ) fDX = - fDX;
		if ( fDY < 0.0f ) fDY = - fDY;
		if ( fDZ < 0.0f ) fDZ = - fDZ;

		float fLength = ( fDX + fDY + fDZ );

		if ( fLength < __fRenderTreeLength[CMultiDetailData::HiDetail] )
		{
			pTree->Render(CMultiDetailData::HiDetail);
		}
		else if  ( fLength < __fRenderTreeLength[CMultiDetailData::MidDetail] )
		{
			pTree->Render(CMultiDetailData::MidDetail);
		}
		else if  ( fLength < __fRenderTreeLength[CMultiDetailData::LowDetail] )
		{
			pTree->Render(CMultiDetailData::LowDetail);
		}
		else if  ( fLength < __fRenderTreeLength[CMultiDetailData::BillBoard] )
		{
			//D3DXMatrixInverse( &m_matBillboard, NULL, &m_matView );
			pTree->Render(CMultiDetailData::BillBoard, matBillBoard );
		}
	
}


BOOL CTreeList::CanStay(float fX,float fZ)
{
	int nSize = m_ptrTree.GetSize();

	for ( int nCount = 0 ; nCount < nSize; nCount++)
	{
		CTree *  pTree = GetAt(nCount);

		if ( pTree == NULL )
		{
			Log("error tree is null int void CTreeList::RenderAll ");
		}

		float DX = ( pTree->Px() - fX );
		if ( DX < 0.0f ) DX = - DX;

		if ( DX < pTree->m_fRadius )
		{
			float DZ = ( pTree->Pz() - fZ );
			if ( DZ < 0.0f ) DZ = - DZ;

			if ( DZ < pTree->m_fRadius )
			{
				if (  ( (DX*DX) + (DZ*DZ) ) < (pTree->m_fRadius*pTree->m_fRadius))
				{
					return FALSE;
				}
			}
		}
	}

	return TRUE;
}

void CTreeList::SaveToFile( const char* FileName )
{
	ofstream ofs( FileName, ios::binary );
	int nCount = m_ptrTree.GetUpperBound() + 1;
	ofs.write( (char *)(&nCount), 4 );
	for( int i = 0; i < nCount; i++ )
	{
		CTree *pTree = (CTree *)m_ptrTree[i];
		pTree->WriteToFileStream( &ofs );
	}
}

void CTreeList::LoadFromFile( const char* FileName )
{
	ClearTreeList();
	ifstream ifs( FileName, ios::binary );	
	int nCount;
	ifs.read( (char *)(&nCount), 4 );
	for( int i = 0; i < nCount; i++ )
	{
		CTree *pTree = new CTree;
		pTree->ReadFromFileStream(&ifs);
		m_ptrTree.Add( pTree );
	}
}
