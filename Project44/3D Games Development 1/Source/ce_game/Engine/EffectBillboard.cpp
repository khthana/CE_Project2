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
#include "EffectBillboard.h"
#include "Matrix.h"
#include "GlGfx.h"


unsigned int CEffectBillboard::m_DisplayListID = 0;	
BOOL         CEffectBillboard::m_bDisplayPrompt = FALSE;

void	CEffectBillboard::StaticBuildDisplayList()
{
	if( !m_bDisplayPrompt )
	{
		m_DisplayListID = glGenLists(1);
		glNewList(m_DisplayListID, GL_COMPILE);

			GLGfx::BeginDraw(GLDrawMode::QUADS);
				glTexCoord2f( 0.0f , 1.0f );
				glVertex3f( -0.5f , 0.5f , 0.0f );
				glTexCoord2f( 1.0f , 1.0f );
				glVertex3f(  0.5f , 0.5f , 0.0f );
				glTexCoord2f( 1.0f , 0.0f );
				glVertex3f(  0.5f , -0.5f , 0.0f );
				glTexCoord2f( 0.0f , 0.0f );
				glVertex3f( -0.5f , -0.5f , 0.0f );
			GLGfx::EndDraw();
		
		glEndList();
		m_bDisplayPrompt = TRUE;
	}
}
void	CEffectBillboard::StaticClearDisplayList()
{
	if( m_bDisplayPrompt )
	{
		glDeleteLists( m_DisplayListID, 1 ); 
		m_bDisplayPrompt = FALSE;
	}
}


CEffectBillboard::CEffectBillboard(
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

	m_vStart.x	=	fXStart; 
	m_vStart.y	=	fYStart; 
	m_vStart.z	=	fZStart; 

	m_vEnd.x	=	fXEnd;
	m_vEnd.y	=	fYEnd;
	m_vEnd.z	=	fZEnd;

	m_fStartWidth	= fStartWidth; 
	m_fStartHeight	= fStartHeight;
	m_fEndWidth		= fEndWidth;
	m_fEndHeight	= fEndHeight;

	m_fStartR	= fStartR;	
	m_fStartG	= fStartG;	
	m_fStartB	= fStartB; 
	m_fStartA	= fStartA;

	m_fEndR		= fEndR;	
	m_fEndG		= fEndG;	
	m_fEndB		= fEndB;	 
	m_fEndA		= fEndA;

	m_fAllTime	= fAllTime;	

	SetTime();
}

CEffectBillboard::CEffectBillboard(
									D3DXVECTOR3 vStart		,
									D3DXVECTOR3 vEnd		,

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
	m_vStart =	vStart; 
	m_vEnd	 =	vEnd;

	m_fStartWidth	= fStartWidth; 
	m_fStartHeight	= fStartHeight;
	m_fEndWidth		= fEndWidth;
	m_fEndHeight	= fEndHeight;

	m_fStartR	= fStartR;	
	m_fStartG	= fStartG;	
	m_fStartB	= fStartB; 
	m_fStartA	= fStartA;

	m_fEndR		= fEndR;	
	m_fEndG		= fEndG;	
	m_fEndB		= fEndB;	 
	m_fEndA		= fEndA;

	m_fAllTime	= fAllTime;	

	SetTime();
}

CEffectBillboard::~CEffectBillboard()
{
	m_Texture.UnUse();
}

BOOL CEffectBillboard::Render(D3DXMATRIX  &matBillboard)
{
	float fElTime = Timer::GetLogicalTime() - m_fRefTime;

	if (fElTime < 0 )			return TRUE;
	if (fElTime > m_fAllTime )	return TRUE;

	float fRBlend = fElTime / m_fAllTime;

	ASSERT( fRBlend <= 1.0f );

	CMat matWorld;


	matWorld.Scale(	 m_fStartWidth  + ( ( m_fEndWidth - m_fStartWidth )  * fRBlend) ,
					 m_fStartHeight  + ( ( m_fEndHeight - m_fStartHeight )  * fRBlend) ,
					1.0f );
  
	matWorld.Mul(&matBillboard);

	matWorld.Translatef(	
							m_vStart.x  + ( ( m_vEnd.x - m_vStart.x ) * fRBlend) ,
							m_vStart.y  + ( ( m_vEnd.y - m_vStart.y ) * fRBlend) ,
							m_vStart.z  + ( ( m_vEnd.z - m_vStart.z ) * fRBlend) 
						);
  

	GLGfx::SetMatWorld( matWorld.GetpMat() );

	glColor4f(	
					m_fStartR + ( ( m_fEndR - m_fStartR )* fRBlend) ,
					m_fStartG + ( ( m_fEndG - m_fStartG )* fRBlend) ,
					m_fStartB + ( ( m_fEndB - m_fStartB )* fRBlend) ,
					m_fStartA + ( ( m_fEndA - m_fStartA )* fRBlend) 
				);

	glBindTexture(GL_TEXTURE_2D, m_Texture.Get());

	glCallList( m_DisplayListID );


	return FALSE;
}

void CEffectBillboard::SetTexture(const char *FileName)
{
	m_Texture.Use(FileName);
}
