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
#include "modeldata.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CModelDataManage
/////////////////////////////////////////////////////////////////////

// static variable for class CModelDataManage
CAbTree CModelDataManage::AbTree;

CModelData * CModelDataManage::Add( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CModelDataAb * pModelData = (CModelDataAb *)AbTree.GetAtName(strName);


	if (pModelData == NULL)
	{
		pModelData = new CModelDataAb(strName);
		
		pModelData->AddModelData();
		AbTree.Add(pModelData);
	}
	else
	{
		pModelData->AddModelData();
	}

	return pModelData->GetModelData();
}

CModelData * CModelDataManage::GetModelData( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CModelDataAb * pModelData = (CModelDataAb *)AbTree.GetAtName(strName);

	if (pModelData == NULL)
	{
		return NULL;
	}
	else
	{
		return pModelData->GetModelData();
	}
}

CModelDataAb *  CModelDataManage::GetpModelData( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CModelDataAb * pModelData = (CModelDataAb *)AbTree.GetAtName(strName);

	if (pModelData == NULL)
	{
		return NULL;
	}
	else
	{
		return pModelData;
	}
}

void CModelDataManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CModelDataAb * pModelData = (CModelDataAb *)AbTree.GetAtName(strName);
	
	if (pModelData!=NULL)
	{
		if (pModelData->DeleteModelData()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CModelDataManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CModelDataAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CModelDataManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CModelDataAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CModelDataManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CModelDataAb * pModelData = (CModelDataAb *)AbTree.GetAt(nCount);
			pModelData->DeleteDeviceObjects();
			pModelData->FinalCleanup();
			delete pModelData;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CModelData
/////////////////////////////////////////////////////////////////////

CModelDataAb::CModelDataAb( const CString& strName )  //Constructor
{
	m_nNumber = 0;
	m_ModelData = NULL;
	m_strKey = strName;
}

CModelDataAb::~CModelDataAb() //Destructor
{
		CModelDataAb::DeleteDeviceObjects();
		CModelDataAb::FinalCleanup();
}

BOOL CModelDataAb::AddModelData()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CModelDataAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CModelDataAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CModelDataAb::DeleteModelData()
{
 
	if ( m_nNumber == 1 )
	{
		CModelDataAb::DeleteDeviceObjects();
		CModelDataAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CModelDataAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CModelDataAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CModelDataAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CModelDataAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CModelDataAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CModelDataAb::_OneTime();
	}
	return S_OK;
}

HRESULT CModelDataAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CModelDataAb::_FinalClean();
	}
	return S_OK;
}


HRESULT CModelData::LoadModelFromFile(  const char *strModelFileName )
{
		CStdioFile fp( strModelFileName , CFile::modeRead );

		if( fp )
		{
			CString str;
			fp.ReadString( str );
			if( strcmp( str, "Maetee Supreanruey and Anusorn Krasantisuk format" ) != 0 )
			{
				char sz[255];
				sprintf(sz,"Error file format name <%s>",strModelFileName);
				Log(sz);
				fp.Close();
				return E_FAIL;
			}

			fp.ReadString( str );

			fp.ReadString( str );
			m_Vertices.Use(String::Token(str,1," "));
			fp.ReadString( str );
			m_Indices.Use(String::Token(str,1," "));
			fp.ReadString( str );
			m_TexCoord.Use(String::Token(str,1," "));
			fp.ReadString( str );
			m_Texture.Use(String::Token(str,1," "));
			fp.ReadString( str );
			m_VertexColor.Use(String::Token(str,1," "));

			fp.Close();

			CalBoundSphere();

			return S_OK;
		}

		return E_FAIL;
}

void CModelData::Clear()
{
	m_Vertices.UnUse();
	m_Indices.UnUse();
	m_TexCoord.UnUse();
	m_VertexColor.UnUse();
	m_Texture.UnUse();
	m_vCenter = cs::v3Zero;
	m_fRadius = 0;
}

void CModelData::Render()
{

	glBindTexture( GL_TEXTURE_2D, m_Texture.Get() );

	float *pVertices = m_Vertices.Get();
	float *pTexCoord = m_TexCoord.Get();
	unsigned int *pIndices  = m_Indices.Get();
	float *pVertexColor = m_VertexColor.Get();
	int    NumFaces  = m_Indices.GetNumFaces();
	
	if ( m_VertexColor.GetNumVertexColor() != 0 )
	{
		glBegin( GLDrawMode::TRIANGLES );
		for( int i = 0; i < NumFaces; i++ )
		{
			int i0 = pIndices[ (3*i) + 0 ] ;
			int i1 = pIndices[ (3*i) + 1 ] ;
			int i2 = pIndices[ (3*i) + 2 ] ;

			int startTIndex = 6*i;

			glTexCoord2f( pTexCoord[startTIndex+0], pTexCoord[startTIndex+1] );
			glColor3fv( &pVertexColor[3*i0] );
			glVertex3f( pVertices[3*i0], pVertices[3*i0+1], pVertices[3*i0+2] );
			//glTexCoord2fv( &pTexCoord[startTIndex+0] );
			//glColor3fv( &pVertexColor[3*i0] );
			//glVertex3fv( &pVertices[3*i0] );

			glTexCoord2f( pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
			glColor3fv( &pVertexColor[3*i1] );
			glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );
			//glTexCoord2fv( &pTexCoord[startTIndex+2] );
			//glColor3fv( &pVertexColor[3*i1] );
			//glVertex3fv( &pVertices[3*i1] );

			glTexCoord2f( pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
			glColor3fv( &pVertexColor[3*i2] );
			glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
			//glTexCoord2fv( &pTexCoord[startTIndex+4] );
			//glColor3fv( &pVertexColor[3*i2] );
			//glVertex3fv( &pVertices[3*i2] );
		}
		glEnd();
	}
	else 
	{
		glBegin( GLDrawMode::TRIANGLES );
		for( int i = 0; i < NumFaces; i++ )
		{
			int i0 = pIndices[ (3*i) + 0 ] ;
			int i1 = pIndices[ (3*i) + 1 ] ;
			int i2 = pIndices[ (3*i) + 2 ] ;

			int startTIndex = 6*i;

			glTexCoord2f( pTexCoord[startTIndex+0], pTexCoord[startTIndex+1] );
			glVertex3f( pVertices[3*i0], pVertices[3*i0+1], pVertices[3*i0+2] );
			//glTexCoord2fv( &pTexCoord[startTIndex+0] );
			//glVertex3fv( &pVertices[3*i0] );

			glTexCoord2f( pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
			glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );
			//glTexCoord2fv( &pTexCoord[startTIndex+2] );
			//glVertex3fv( &pVertices[3*i1] );

			glTexCoord2f( pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
			glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
			//glTexCoord2fv( &pTexCoord[startTIndex+4] );
			//glVertex3fv( &pVertices[3*i2] );
		}
		glEnd();
	}
}

void    CModelData::CalBoundSphere()
{
	Tool::CalBoundSphere( m_Vertices.Get(), 
						  m_Vertices.GetNumVertices(),
						  &m_vCenter, 
						  &m_fRadius );	
}