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
#include "AbTree.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
IMPLEMENT_SERIAL(CAbTree,CObject,0)

CAbTree::CAbTree()
{

}

CAbTree::~CAbTree()
{

}

void CAbTree::Serialize(CArchive& ar)
{
	CObArray::Serialize(ar);
}

int CAbTree::Add(CAbstract * pData)
{
	int nSize = GetSize();

	if ( nSize < 1 )
	{
		CObArray::Add(pData);
		return 0;
	}
	else
	{
		int nFirst = 0;
		int nEnd = nSize -1;

		for(;;)
		{
			int nMid = ( nFirst + nEnd )/2;

			if ( ( nMid == nFirst ) || (nMid == nEnd) )
			{

				if ( pData->m_strKey < ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{
					CObArray::InsertAt(nFirst,pData);
					return nFirst;
				}
				else if ( pData->m_strKey == ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{
					CAbstract * pTemp = ((CAbstract*)GetAt(nFirst));
					delete pTemp;
					SetAt(nFirst,pData);
					return nFirst;

				}
				else  if ( pData->m_strKey < ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					CObArray::InsertAt(nEnd,pData);
					return nEnd;
				}
				else  if ( pData->m_strKey == ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					CAbstract * pTemp = ((CAbstract*)GetAt(nEnd));
					delete pTemp;
					SetAt(nEnd,pData);
					return nEnd;
				}
				else
				{
					if (( nEnd + 1 ) >= nSize)
					{
						CObArray::Add(pData);
						return nEnd;
					}
					else
					{
						CObArray::InsertAt(nEnd,pData);
						return nEnd;
					}
				}

			}
			else 
			{
				if ( pData->m_strKey > ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nFirst = nMid;
				}
				else if ( pData->m_strKey < ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nEnd = nMid;
				}
				else
				{
					CAbstract * pTemp = ((CAbstract*)GetAt(nMid));
					delete pTemp;
					SetAt(nMid,pData);
					return nMid;
				}

			}
		}
	}

}


CAbstract * CAbTree::GetAtName( const CString&   Sz)
{
	int nSize = GetSize();

	if ( nSize < 1 )
	{
		return NULL;
	}
	else
	{
		int nFirst = 0;
		int nEnd = nSize -1;

		for(;;)
		{
			int nMid = ( nFirst + nEnd )/2;

			if ( ( nMid == nFirst ) || (nMid == nEnd) )
			{

				if ( Sz < ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{
					return NULL;
				}
				else if ( Sz == ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{

					return ((CAbstract*)GetAt(nFirst));

				}
				else  if ( Sz < ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					return NULL;
				}
				else  if ( Sz == ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					return ((CAbstract*)GetAt(nEnd));
				}
				else
				{
					return NULL;
				}

			}
			else 
			{
				if ( Sz > ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nFirst = nMid;
				}
				else if ( Sz < ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nEnd = nMid;
				}
				else
				{
					
					return ((CAbstract*)GetAt(nMid));
				}

			}
		}
	}


}

int CAbTree::GetAtNameInt(const CString& Sz)
{
	int nSize = GetSize();

	if ( nSize < 1 )
	{
		return -1;
	}
	else
	{
		int nFirst = 0;
		int nEnd = nSize -1;

		for(;;)
		{
			int nMid = ( nFirst + nEnd )/2;

			if ( ( nMid == nFirst ) || (nMid == nEnd) )
			{

				if ( Sz < ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{
					return -1;
				}
				else if ( Sz == ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{

					return nFirst;

				}
				else  if ( Sz < ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					return -1;
				}
				else  if ( Sz == ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					return nEnd;
				}
				else
				{
					return -1;
				}

			}
			else 
			{
				if ( Sz > ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nFirst = nMid;
				}
				else if ( Sz < ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nEnd = nMid;
				}
				else
				{
					
					return nMid;
				}

			}
		}
	}

}

CAbstract * CAbTree::RemoveAtName( const CString& Sz)
{
	int nSize = GetSize();

	if ( nSize < 1 )
	{
		return NULL;
	}
	else
	{
		int nFirst = 0;
		int nEnd = nSize -1;

		for(;;)
		{
			int nMid = ( nFirst + nEnd )/2;

			if ( ( nMid == nFirst ) || (nMid == nEnd) )
			{

				if ( Sz < ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{
					return NULL;
				}
				else if ( Sz == ((CAbstract*)(GetAt(nFirst)))->m_strKey )
				{

					CAbstract* pData =((CAbstract*)GetAt(nFirst));
					RemoveAt(nFirst);
					return pData;

				}
				else  if ( Sz < ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					return NULL;
				}
				else  if ( Sz == ((CAbstract*)(GetAt(nEnd)))->m_strKey )
				{
					CAbstract* pData =((CAbstract*)GetAt(nEnd));
					RemoveAt(nEnd);
					return pData;
				}
				else
				{
					return NULL;
				}

			}
			else 
			{
				if ( Sz > ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nFirst = nMid;
				}
				else if ( Sz < ((CAbstract*)(GetAt(nMid)))->m_strKey )
				{
					nEnd = nMid;
				}
				else
				{
					
					CAbstract* pData =((CAbstract*)GetAt(nMid));
					RemoveAt(nMid);
					return pData;
				}

			}
		}
	}
}

HRESULT CAbTree::OneTimeSceneInit()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->OneTimeSceneInit())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}


HRESULT CAbTree::RestoreDeviceObjects()
{	

	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->RestoreDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbTree::InitDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->InitDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbTree::FrameMove()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->FrameMove())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbTree::Render()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->Render())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbTree::InvalidateDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->InvalidateDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbTree::DeleteDeviceObjects()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->DeleteDeviceObjects())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CAbTree::FinalCleanup()
{	

   	int nBound = GetUpperBound();
	
	for( int i = 0; i <= nBound; i++ )
	{
		if FAILED( ((CAbstract *)GetAt(i))->FinalCleanup())
		{
			return E_FAIL;
		}
	}

	return S_OK;
}