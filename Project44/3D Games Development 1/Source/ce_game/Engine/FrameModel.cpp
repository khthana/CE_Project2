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

#include "../stdafx.h"
#include "FrameModel.h"

BOOL CFrame::RayTest( 
			  const D3DXVECTOR3& RayOrigin,
			  const D3DXVECTOR3& RayDirection, 
			  const D3DXMATRIX*  matWorld, 
			  float fBPos,
			  BOOL	bUseBoundSphereInRayTest,
			  // Out
			  int*       pFaceIndex ,
			  CTriangle* pTriangle  ,
			  FLOAT*	 pDistance  , 
			  FLOAT*	 pU         , 
			  FLOAT*     pV          )
{

	if( bUseBoundSphereInRayTest )
	{
		// if Not In Sphere then return FALSE
		D3DXVECTOR3 vCenter0 = m_ModelData[0].GetCenter();
		D3DXVECTOR3 vCenter1 = m_ModelData[1].GetCenter();

		float fRadius = m_ModelData[0].GetRadius();

		if ( fRadius <  m_ModelData[1].GetRadius() )
		{
			fRadius = m_ModelData[1].GetRadius();
		}
		
		if( !Ray::InSphere(  vCenter0.x + fBPos * ( vCenter1.x - vCenter0.x ),
			                 vCenter0.y + fBPos * ( vCenter1.y - vCenter0.y ),
							 vCenter0.z + fBPos * ( vCenter1.z - vCenter0.z ),
			                 fRadius, 
			   			     matWorld, 
						     RayOrigin,
						     RayDirection ) )
		{
			return FALSE;
		}
	}

	float *pVertices0 = m_ModelData[0].GetpVertices();
	float *pVertices1 = m_ModelData[1].GetpVertices();

	unsigned int *pIndices = CFrame::m_ModelData[0].GetpIndices();
	int           NumFaces = CFrame::m_ModelData[0].GetNumFaces();



	// Return
	return Ray::InBlendArfVertices( // In
									RayOrigin,
									RayDirection, 
									matWorld,
									pVertices0,
									pVertices1,
									fBPos , // 0.0f to 1.0f
									pIndices,
									NumFaces,
									// Out
									pFaceIndex,
									pTriangle,
									pDistance, 
	  								pU, 
									pV );

}

int CFrame::GetNumFaces()
{
	return m_ModelData[0].CUseModelData::GetNumFaces();
}

int CFrame::GetNumVertices()
{
	return m_ModelData[0].CUseModelData::GetNumVertices();
}

D3DXVECTOR3 CFrame::GetLocalCenter(float fBPos)
{
	D3DXVECTOR3 vReturn;
	D3DXVECTOR3 vCenter0 = m_ModelData[0].GetCenter();
	D3DXVECTOR3 vCenter1 = m_ModelData[1].GetCenter();

	vReturn.x = vCenter0.x + fBPos * ( vCenter1.x - vCenter0.x );
	vReturn.y = vCenter0.y + fBPos * ( vCenter1.y - vCenter0.y );
	vReturn.z = vCenter0.z + fBPos * ( vCenter1.z - vCenter0.z );

	return vReturn;
}

float CFrame::GetRadius(float fBPos)
{
	float fRadius = m_ModelData[0].GetRadius();

	if ( fRadius <  m_ModelData[1].GetRadius() )
	{
		fRadius = m_ModelData[1].GetRadius();
	}

	return fRadius;
}


void CFrame::Render(float fBPos,float fBUV)
{
	// Bind Texture
	glBindTexture( GL_TEXTURE_2D, m_ModelData[0].GetpTexture() );

	// Collect Inportance Data
	float *pVertices0 = m_ModelData[0].GetpVertices();
	float *pVertices1 = m_ModelData[1].GetpVertices();
	float *pTexCoord0 = m_ModelData[0].GetpTexCoord();
	float *pTexCoord1 = m_ModelData[1].GetpTexCoord();

	// 0 and 1 Same
	unsigned int *pIndices     = m_ModelData[0].GetpIndices();
	float        *pVertexColor = (m_ModelData[0].GetNumVertexColor() == 0)?
								  NULL : m_ModelData[0].GetpVertexColor();
	int           NumFaces     = m_ModelData[0].GetNumFaces();
	

	Tool::RenderBlend(	pVertices0,pVertices1,
						pTexCoord0,pTexCoord1, 
						fBPos,fBUV,
						pIndices,
						NumFaces,
						pVertexColor,
						m_bBlendPosition,
						m_bBlendUV);
	
}



/////////////////////////////////////////////////////////////////////
//	Name CAnimation
//	Desc Use for animation
/////////////////////////////////////////////////////////////////////

CAnimation::CAnimation()
{
	m_pFrame = NULL;
	m_pTimeSlot = NULL;
	m_fMaxTime = 0.0f;
	m_nNumFrame = 0;
	m_bLoop = FALSE;
}

CAnimation::~CAnimation()
{
	Clear();	
}

void CAnimation::LoadAnimationFromFile( const char * strFileName)
{
	if (strFileName == NULL ) return;

	Clear();

	m_strKey = strFileName;

	CStdioFile fp( strFileName, CFile::modeRead );

	if( fp )
	{
		CString str;
		fp.ReadString( str );
		if( strcmp( str, "Maetee Supreanruey and Anusorn Krasantisuk format" ) != 0 )
		{
			char sz[255];
			sprintf(sz,"Error file format name <%s>",strFileName);
			Log(sz);
			fp.Close();
			return ;
		}

		fp.ReadString( str );
	
		// start Read
		fp.ReadString( str );
		m_nNumFrame = atoi( String::Token( str,1," ") );

		CString TmpStr = String::Token( str,2," ");
		TmpStr.MakeLower();
		if ( TmpStr == "loop" )
		{
			m_bLoop = TRUE;
		}
		else
		{
			m_bLoop = FALSE;
		}

		//check error
		if (m_nNumFrame <= 0 )
		{
			fp.Close();
			return;
		}

		m_pFrame = new CFrame[m_nNumFrame];
		m_pTimeSlot = new float[m_nNumFrame];

		float fNow = 0.0f;

		for (int nCount = 0 ; nCount < m_nNumFrame; nCount++)
		{
			fp.ReadString( str );

			m_pFrame[nCount].LoadFrame( String::Token( str,1," "),
 										String::Token( str,2," ")  );
			
			CString strWord4 = String::Token( str,4," ");

			if ( ! strWord4.IsEmpty() )
			{
				strWord4.MakeLower();

				if ( strWord4 == "true" )
				{
					m_pFrame[nCount].m_bBlendPosition = TRUE;
				}
				else 
				if ( strWord4 == "false" )
				{
					m_pFrame[nCount].m_bBlendPosition = FALSE;
				}

				CString strWord5 = String::Token( str,5," ");

				if ( ! strWord5.IsEmpty() )
				{
					strWord5.MakeLower();

					if ( strWord5 == "true" )
					{
						m_pFrame[nCount].m_bBlendUV = TRUE;
					}
					else 
					if ( strWord5 == "false" )
					{
						m_pFrame[nCount].m_bBlendUV = FALSE;
					}

				}

			}

			fNow += float(atof(String::Token(str,3," ")));

			m_pTimeSlot[nCount] = fNow;

		}

		m_fMaxTime = fNow;

		fp.Close();
	}

}

void CAnimation::Clear()
{
	if (m_pFrame != NULL) 
	{
		delete [] m_pFrame;
		m_pFrame = NULL;
	}

	if (m_pTimeSlot != NULL) 
	{
		delete [] m_pTimeSlot;
		m_pTimeSlot = NULL;
	}

	m_fMaxTime = 0.0f;
	m_nNumFrame = 0;

}

void  CAnimation::GenTime(	//In
							float fNowTime,
							//Out
							float * fTrueTime,
							float * fBlendfac,
							int	  * nNumSlot
						 )
{
	if ( m_bLoop )
	{
		if ( fNowTime < 0.0f )
		{
			fNowTime =   fNowTime  - ( (int(fNowTime/m_fMaxTime) - 1 ) * m_fMaxTime );
		}

		if ( fNowTime > m_fMaxTime )
		{
			fNowTime =  fNowTime - ( int(fNowTime/m_fMaxTime) * m_fMaxTime) ;
		}
	}
	else
	{
		if ( fNowTime < 0.0f )
		{
			fNowTime =   0.0f;
		}

		if ( fNowTime > m_fMaxTime )
		{
			fNowTime =  m_fMaxTime ;
		}

	}

	int nCount = 0 ;
	float fPrevTime = 0.0f;

	while ( fNowTime > m_pTimeSlot[nCount] )
	{

		fPrevTime = m_pTimeSlot[nCount] ;

		nCount++;
	}

	float fBlend = (fNowTime - fPrevTime)/(m_pTimeSlot[nCount] - fPrevTime);

	if ( fTrueTime != NULL ) (*fTrueTime) = fNowTime;
	if ( fBlendfac != NULL ) (*fBlendfac) = fBlend;
	if ( nNumSlot != NULL ) (*nNumSlot) = nCount;
 
}
CUseModelData * CAnimation::GetpModelData(float fTime)
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(fTime,NULL,&fBlend,&nSlot);
	if ( fBlend <= 0.5f )
	{
		return & ( (m_pFrame[nSlot].GetpModelData())[0] );
	}
	else
	{
		return & ( (m_pFrame[nSlot].GetpModelData())[1] );
	}
}

void CAnimation::Render(float fTime)
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(fTime,NULL,&fBlend,&nSlot);
	m_pFrame[nSlot].Render( fBlend , fBlend );
}

int CAnimation::GetNumFaces()
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(0,NULL,&fBlend,&nSlot);
	return m_pFrame[nSlot].GetNumFaces();
}

int CAnimation::GetNumVertices()
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(0,NULL,&fBlend,&nSlot);
	return m_pFrame[nSlot].GetNumVertices();
}

D3DXVECTOR3 CAnimation::GetLocalCenter(float fTime)
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(fTime,NULL,&fBlend,&nSlot);
	return m_pFrame[nSlot].GetLocalCenter( fBlend );

}

float CAnimation::GetRadius(float fTime)
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(fTime,NULL,&fBlend,&nSlot);
	return m_pFrame[nSlot].GetRadius( fBlend );

}


BOOL CAnimation::RayTest( 
				  const D3DXVECTOR3& RayOrigin,
				  const D3DXVECTOR3& RayDirection, 
				  const D3DXMATRIX*  matWorld, 
				  float fTime,
				  BOOL bUseBoundSphereInRayTest,
				  // Out
				  int*       pFaceIndex ,
				  CTriangle* pTriangle  ,
				  FLOAT*	 pDistance  , 
				  FLOAT*	 pU         , 
				  FLOAT*     pV         )
{
	float fBlend = 0.0f;
	int	  nSlot  = 0;

	GenTime(fTime,NULL,&fBlend,&nSlot);
	return m_pFrame[nSlot].CFrame::RayTest(  //in
											  RayOrigin,
											  RayDirection, 
											  matWorld, 
											  fBlend,
											  bUseBoundSphereInRayTest,
											  // Out
											  pFaceIndex,
											  pTriangle,
											  pDistance, 
											  pU, 
											  pV  );
}



