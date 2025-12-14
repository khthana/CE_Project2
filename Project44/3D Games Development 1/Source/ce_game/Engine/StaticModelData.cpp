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
#include "staticmodeldata.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif




/////////////////////////////////////////////////////////////////////
// Class CStaticModelDataManage
/////////////////////////////////////////////////////////////////////

// static variable for class CStaticModelDataManage
CAbTree CStaticModelDataManage::AbTree;

CStaticModelData * CStaticModelDataManage::Add( const CString& pName)
{
	CString strName = pName;
	strName.MakeUpper();

	CStaticModelDataAb * pStaticModelData = (CStaticModelDataAb *)AbTree.GetAtName(strName);


	if (pStaticModelData == NULL)
	{
		pStaticModelData = new CStaticModelDataAb(strName);
		
		pStaticModelData->AddStaticModelData();
		AbTree.Add(pStaticModelData);
	}
	else
	{
		pStaticModelData->AddStaticModelData();
	}

	return pStaticModelData->GetStaticModelData();
}

CStaticModelData * CStaticModelDataManage::GetStaticModelData( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CStaticModelDataAb * pStaticModelData = (CStaticModelDataAb *)AbTree.GetAtName(strName);

	if (pStaticModelData == NULL)
	{
		return NULL;
	}
	else
	{
		return pStaticModelData->GetStaticModelData();
	}
}

CStaticModelDataAb *  CStaticModelDataManage::GetpStaticModelData( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CStaticModelDataAb * pStaticModelData = (CStaticModelDataAb *)AbTree.GetAtName(strName);

	if (pStaticModelData == NULL)
	{
		return NULL;
	}
	else
	{
		return pStaticModelData;
	}
}

void CStaticModelDataManage::Remove( const CString& pName )
{
	CString strName = pName;
	strName.MakeUpper();

	CStaticModelDataAb * pStaticModelData = (CStaticModelDataAb *)AbTree.GetAtName(strName);
	
	if (pStaticModelData!=NULL)
	{
		if (pStaticModelData->DeleteStaticModelData()==0)
		{
			delete AbTree.RemoveAtName(strName);
		}
	}
}

void CStaticModelDataManage::StaticInitDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CStaticModelDataAb *)AbTree.GetAt(nCount))->InitDeviceObjects();
	}
}

void CStaticModelDataManage::StaticDeleteDeviceObjects()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
		((CStaticModelDataAb *)AbTree.GetAt(nCount))->DeleteDeviceObjects();
	}
}

void CStaticModelDataManage::StaticFinalCleanUp()
{
	int nSize = AbTree.GetSize();

	for (int nCount = 0; nCount < nSize; nCount++)
	{
			CStaticModelDataAb * pStaticModelData = (CStaticModelDataAb *)AbTree.GetAt(nCount);
			pStaticModelData->DeleteDeviceObjects();
			pStaticModelData->FinalCleanup();
			delete pStaticModelData;
	}
	AbTree.RemoveAll();
}

/////////////////////////////////////////////////////////////////////
// Class CStaticModelData
/////////////////////////////////////////////////////////////////////

CStaticModelDataAb::CStaticModelDataAb(const CString strName)  //Constructor
{
	m_nNumber = 0;
	m_StaticModelData = NULL;
	m_strKey = strName;
}

CStaticModelDataAb::~CStaticModelDataAb() //Destructor
{
		CStaticModelDataAb::DeleteDeviceObjects();
		CStaticModelDataAb::FinalCleanup();
}

BOOL CStaticModelDataAb::AddStaticModelData()
{	
	m_nNumber++;

	if ( (m_nNumber == 1 )  )
	{
		//DO load temp from string(m_strKey);
		CStaticModelDataAb::OneTimeSceneInit();

		if ( GLGfx::IsGLPrompt() )
		{
			CStaticModelDataAb::InitDeviceObjects();
		}
	}

	return TRUE;
}

int CStaticModelDataAb::DeleteStaticModelData()
{
 
	if ( m_nNumber == 1 )
	{
		CStaticModelDataAb::DeleteDeviceObjects();
		CStaticModelDataAb::FinalCleanup();

		m_nNumber--;
	}
	else if ( m_nNumber > 1)
	{
		m_nNumber--;
	}

	return m_nNumber;
}



HRESULT CStaticModelDataAb::InitDeviceObjects()
{
	DeleteDeviceObjects();

	if ( (m_nNumber > 0) && (GLGfx::IsGLPrompt() ) )
	{
		CStaticModelDataAb::_InitDevice();
	}

	return S_OK;
}

HRESULT CStaticModelDataAb::DeleteDeviceObjects()
{
	if (m_nNumber > 0)
	{		
		CStaticModelDataAb::_DeleteDevice();
	}
	return S_OK;
}

HRESULT CStaticModelDataAb::OneTimeSceneInit()
{
	if (m_nNumber > 0)
	{		
		CStaticModelDataAb::_OneTime();
	}
	return S_OK;
}

HRESULT CStaticModelDataAb::FinalCleanup()
{
	if (m_nNumber > 0)
	{		
		CStaticModelDataAb::_FinalClean();
	}
	return S_OK;
}



/////////////////////////////////////////////////////////////////////////
// Name CStaticModelData
// Desc Static model data class
/////////////////////////////////////////////////////////////////////////

HRESULT CStaticModelData::LoadModelFromFile(  const char *strModelFileName )
{
	CStdioFile fp( strModelFileName , CFile::modeRead );

	if( fp )
	{
		Clear();

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
		m_Vertices.Use(String::Token(str,1," \t"));
		fp.ReadString( str );
		m_Indices.Use(String::Token(str,1," \t"));

		//Read At line MultiTexture or Texture FileName
		fp.ReadString( str );
		
		CString strTemp01 = String::Token(str,1," \t");
		CString strTemp02 = String::Token(str,2," \t");
		strTemp01.MakeUpper();

		// Normal Case
		if ( strTemp01 != "MULTITEXTURE" )
		{
			m_bUseMultiTexture = FALSE; // Set MultiTexture Flag to false

			m_nNumTexture = 1;
			m_pTexCoord = new CUseTexCoord[1];
			m_pTexture = new CUseTexture[1];

			m_pTexCoord[0].Use(String::Token(str,1," \t"));
			fp.ReadString( str );
			m_pTexture[0].Use(String::Token(str,1," \t"));
		}
		else // MultiTexture Case
		{
			#ifndef USE_GL_ARB_multitexture
				#error Cannot Use Multitexture function please define USE_GL_ARB_multitexture
			#endif

			m_bUseMultiTexture = TRUE; // Set MultiTexture Flag to true

			m_nNumTexture	= atoi(strTemp02);

			m_pTexCoord		= new CUseTexCoord[m_nNumTexture];
			m_pTexture		= new CUseTexture[m_nNumTexture];

			for (int nCount = 0 ; nCount < m_nNumTexture ; nCount++ )
			{
				fp.ReadString( str );
				m_pTexCoord[nCount].Use(String::Token(str,1," \t"));
				fp.ReadString( str );
				m_pTexture[nCount].Use(String::Token(str,1," \t"));
			}

		}

		fp.ReadString( str );
		m_VertexColor.Use(String::Token(str,1," \t"));
		
		fp.ReadString( str );

		if ( ! (String::Token(str,1," \t")).CString::IsEmpty())
		{
			m_Normals.Use( String::Token(str,1," \t") );

			fp.ReadString( str );
		}

		
		fp.ReadString( str );
		str.MakeUpper();

		m_bIsBlend = FALSE;   
		m_bIsAlpha = FALSE;   
		m_bIsCull  = FALSE;   

		if ( String::Token(str,1," \t") == "BEGIN" )
		{
			fp.ReadString( str );
			str.MakeUpper();
			CString word1 = String::Token(str,1," \t");
			CString word2= String::Token(str,2," \t");
			CString word3= String::Token(str,3," \t");

			while (  word1 !=  "END" )
			{
				if ( word1 == "BLEND" )
				{
					m_bIsBlend = TRUE;
					m_sfactor  = GetGLenum(word2);
					m_dfactor  = GetGLenum(word3);
				}

				if ( word1 == "ALPHA_TEST" )
				{
					m_bIsAlpha		= TRUE;
					m_func			= GetGLenum(word2);
					m_fValuefunc	= float(atof(word3));
				}

				if ( word1 == "CULL_FACE" )
				{
					m_bIsCull		= TRUE;
					m_strCullMode	= word2;
				}

				fp.ReadString( str );
				str.MakeUpper();
				word1 = String::Token(str,1," \t");
				word2 = String::Token(str,2," \t");
				word3= String::Token(str,3," \t");
			}			
		}

		fp.Close();

		CalBoundSphere();

		return S_OK;
	}
	else
	{
		char sz[512];
		sprintf(sz,"Error LoadStaticModelData FileName <%s>Not Found",strModelFileName);
		Log(sz);

		ASSERT(FALSE);
	}

	return E_FAIL;
}

GLenum	CStaticModelData::GetGLenum(const CString& strEnum)
{
	if (strEnum == "ZERO")					return GL_ZERO;					else
	if (strEnum == "ONE")					return GL_ONE;					else
	if (strEnum == "SRC_COLOR")				return GL_SRC_COLOR;			else
	if (strEnum == "ONE_MINUS_SRC_COLOR")	return GL_ONE_MINUS_SRC_COLOR;	else
	if (strEnum == "SRC_ALPHA")				return GL_SRC_ALPHA;			else
	if (strEnum == "ONE_MINUS_SRC_ALPHA")	return GL_ONE_MINUS_SRC_ALPHA;	else
	if (strEnum == "DST_ALPHA")				return GL_DST_ALPHA;			else
	if (strEnum == "ONE_MINUS_DST_ALPHA")	return GL_ONE_MINUS_DST_ALPHA;	else
	if (strEnum == "DST_COLOR")				return GL_DST_COLOR;			else
	if (strEnum == "ONE_MINUS_DST_COLOR")	return GL_ONE_MINUS_DST_COLOR;	else
	if (strEnum == "SRC_ALPHA_SATURATE")	return GL_SRC_ALPHA_SATURATE;	else
	if (strEnum == "NEVER")					return GL_NEVER;				else
	if (strEnum == "LESS")					return GL_LESS;					else
	if (strEnum == "EQUAL")					return GL_EQUAL;				else
	if (strEnum == "LEQUAL")				return GL_LEQUAL;				else
	if (strEnum == "GREATER")				return GL_GREATER;				else
	if (strEnum == "NOTEQUAL")				return GL_NOTEQUAL;				else
	if (strEnum == "GEQUAL")				return GL_GEQUAL;				else
	if (strEnum == "ALWAYS")				return GL_ALWAYS;				else
	if (strEnum == "FRONT")					return GL_FRONT;				else
	if (strEnum == "BACK")					return GL_BACK;  

	return 0;
}


void CStaticModelData::Clear()
{
	m_Vertices.UnUse();
	m_Indices.UnUse();
	m_VertexColor.UnUse();
	m_Normals.UnUse();
	m_vCenter = cs::v3Zero;
	m_fRadius = 0;

	for ( int nCount = 0 ; nCount < m_nNumTexture; nCount++ )
	{
		m_pTexture[nCount].UnUse();
		m_pTexCoord[nCount].UnUse();
	}

	SAFE_DELETE_ARRAY(m_pTexture);
	SAFE_DELETE_ARRAY(m_pTexCoord);
	m_nNumTexture = 0;

	m_bUseMultiTexture = FALSE;

}


void CStaticModelData::DisplayFn()
{

	if ( ! m_bUseMultiTexture )
	{
		ASSERT( m_pTexCoord );
		ASSERT( m_pTexture );

		glBindTexture( GL_TEXTURE_2D, m_pTexture[0].Get() );

		float			*pVertices		= m_Vertices.Get();
		float			*pTexCoord		= m_pTexCoord[0].Get();
		unsigned int	*pIndices		= m_Indices.Get();
		float			*pVertexColor	= m_VertexColor.Get();
		int				NumFaces		= m_Indices.GetNumFaces();
		float			*pNormals		= m_Normals.Get();

		if ( pNormals == NULL )
		{
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

					glTexCoord2f( pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
					glColor3fv( &pVertexColor[3*i1] );
					glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );

					glTexCoord2f( pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
					glColor3fv( &pVertexColor[3*i2] );
					glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
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

					glTexCoord2f( pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
					glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );

					glTexCoord2f( pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
					glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
				}
				glEnd();
			}
		}
		else		   //if ( pNormals != NULL )
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				int startTIndex = 6*i;

				glNormal3f(	pNormals[3*i0], pNormals[3*i0+1], pNormals[3*i0+2] );
				glTexCoord2f( pTexCoord[startTIndex+0], pTexCoord[startTIndex+1] );
				glVertex3f( pVertices[3*i0], pVertices[3*i0+1], pVertices[3*i0+2] );

				glNormal3f(	pNormals[3*i1], pNormals[3*i1+1], pNormals[3*i1+2] );
				glTexCoord2f( pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
				glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );

				glNormal3f(	pNormals[3*i2], pNormals[3*i2+1], pNormals[3*i2+2] );
				glTexCoord2f( pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
				glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
			}
			glEnd();
		}
	}
	else //MultiTexture Render
	{
		ASSERT( m_pTexCoord );
		ASSERT( m_pTexture );

		//glBindTexture( GL_TEXTURE_2D, m_pTexture[0].Get() );

		for ( int nCountTex = 0 ; nCountTex < m_nNumTexture; nCountTex++)
		{
			GLGfx::ActiveTextureARB(GL_TEXTURE0_ARB + nCountTex);
			glEnable(GL_TEXTURE_2D);
			glBindTexture(GL_TEXTURE_2D, m_pTexture[nCountTex].Get() );
			//glTexEnvf(GL_TEXTURE_ENV, GL_COMBINE_RGB_EXT, GL_REPLACE);	
			glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
		}


		float			*pVertices		= m_Vertices.Get();
		unsigned int	*pIndices		= m_Indices.Get();
		float			*pVertexColor	= m_VertexColor.Get();
		int				NumFaces		= m_Indices.GetNumFaces();
		float			*pNormals		= m_Normals.Get();

		if ( pNormals == NULL )
		{
			if ( m_VertexColor.GetNumVertexColor() != 0 )
			{
				glBegin( GLDrawMode::TRIANGLES );
				for( int i = 0; i < NumFaces; i++ )
				{
					int i0 = pIndices[ (3*i) + 0 ] ;
					int i1 = pIndices[ (3*i) + 1 ] ;
					int i2 = pIndices[ (3*i) + 2 ] ;

					int startTIndex = 6*i;

					for( int nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
					{
						float * pTexCoord = m_pTexCoord[nCountVertex].Get();
						GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+0], pTexCoord[startTIndex+1] );
					}
					glColor3fv( &pVertexColor[3*i0] );
					glVertex3f( pVertices[3*i0], pVertices[3*i0+1], pVertices[3*i0+2] );

					for(  nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
					{
						float * pTexCoord = m_pTexCoord[nCountVertex].Get();
						GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
					}
					glColor3fv( &pVertexColor[3*i1] );
					glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );

					for(  nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
					{
						float * pTexCoord = m_pTexCoord[nCountVertex].Get();
						GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
					}
					glColor3fv( &pVertexColor[3*i2] );
					glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
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

					for( int nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
					{
						float * pTexCoord = m_pTexCoord[nCountVertex].Get();
						GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+0], pTexCoord[startTIndex+1] );
					}
					glVertex3f( pVertices[3*i0], pVertices[3*i0+1], pVertices[3*i0+2] );

					for(  nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
					{
						float * pTexCoord = m_pTexCoord[nCountVertex].Get();
						GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
					}
					glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );

					for(  nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
					{
						float * pTexCoord = m_pTexCoord[nCountVertex].Get();
						GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
					}
					glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
				}
				glEnd();
			}
		}
		else		   //if ( pNormals != NULL )
		{
			glBegin( GLDrawMode::TRIANGLES );
			for( int i = 0; i < NumFaces; i++ )
			{
				int i0 = pIndices[ (3*i) + 0 ] ;
				int i1 = pIndices[ (3*i) + 1 ] ;
				int i2 = pIndices[ (3*i) + 2 ] ;

				int startTIndex = 6*i;

				glNormal3f(	pNormals[3*i0], pNormals[3*i0+1], pNormals[3*i0+2] );
				for( int nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
				{
					float * pTexCoord = m_pTexCoord[nCountVertex].Get();
					GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+0], pTexCoord[startTIndex+1] );
				}
				glVertex3f( pVertices[3*i0], pVertices[3*i0+1], pVertices[3*i0+2] );

				glNormal3f(	pNormals[3*i1], pNormals[3*i1+1], pNormals[3*i1+2] );
				for(  nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
				{
					float * pTexCoord = m_pTexCoord[nCountVertex].Get();
					GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+2], pTexCoord[startTIndex+3] );
				}
				glVertex3f( pVertices[3*i1], pVertices[3*i1+1], pVertices[3*i1+2] );

				glNormal3f(	pNormals[3*i2], pNormals[3*i2+1], pNormals[3*i2+2] );
				for(  nCountVertex = 0 ; nCountVertex < m_nNumTexture; nCountVertex++)
				{
					float * pTexCoord = m_pTexCoord[nCountVertex].Get();
					GLGfx::MultiTexCoord2fARB( GL_TEXTURE0_ARB +  nCountVertex,  pTexCoord[startTIndex+4], pTexCoord[startTIndex+5] );
				}
				glVertex3f( pVertices[3*i2], pVertices[3*i2+1], pVertices[3*i2+2] );
			}
			glEnd();
		}


		for (  nCountTex = 0 ; nCountTex < m_nNumTexture; nCountTex++)
		{
			GLGfx::ActiveTextureARB(GL_TEXTURE0_ARB + nCountTex);
			glDisable(GL_TEXTURE_2D);
		}

		GLGfx::ActiveTextureARB(GL_TEXTURE0_ARB);
		glEnable(GL_TEXTURE_2D);
		glTexEnvf (GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE_EXT);
	}

}


void CStaticModelData::BuildDisplayList()
{
	if( !m_bDisplayPrompt )
	{
		m_DisplayListID = glGenLists(1);
		glNewList(m_DisplayListID, GL_COMPILE);
		DisplayFn();
		glEndList();
		m_bDisplayPrompt = TRUE;
	}
}

void CStaticModelData::DestroyDisplayList()
{
	if( m_bDisplayPrompt )
	{
		glDeleteLists( m_DisplayListID, 1 ); 
		m_bDisplayPrompt = FALSE;
	}
}

void CStaticModelData::Render()
{
	if( m_bDisplayPrompt )
	{

		if ( CStaticModelData::m_bIsBlend ) 
		{
			glEnable(GL_BLEND);
			glBlendFunc(m_sfactor,m_dfactor);
		}

		if ( CStaticModelData::m_bIsAlpha )
		{
			glEnable(GL_ALPHA_TEST);
			glAlphaFunc(m_func,m_fValuefunc);
		}

		if ( CStaticModelData::m_bIsCull )
		{
			if ( m_strCullMode == "NON" )
			{
				glDisable(GL_CULL_FACE);
			}
			else
			{
				glEnable(GL_CULL_FACE);
				if ( m_strCullMode == "FRONT" )
				{
					glCullFace( GL_FRONT );
				}
				else if ( m_strCullMode == "BACK" )
				{
					glCullFace( GL_BACK );
				}
				else if ( m_strCullMode == "FRONT_AND_BACK" )
				{
					glCullFace( GL_FRONT_AND_BACK );
				}
			}

		}

		glCallList( m_DisplayListID );

	}
	else
	{
		TRACE("\r\n void CStaticModelData::Render() error! \r\n");
		TRACE("\r\n render butnot Prompt! \r\n");
	}
}


void CStaticModelData::CalBoundSphere()
{
	Tool::CalBoundSphere( m_Vertices.Get(), 
						  m_Vertices.GetNumVertices(),
						  &m_vCenter, 
						  &m_fRadius );	
}