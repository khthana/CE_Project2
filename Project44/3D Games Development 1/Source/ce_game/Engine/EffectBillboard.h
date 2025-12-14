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

#include "d3dx8.h"
#include "Util.h"
#include "Texture.h"

class CEffectBillboard 
{
private:
	CUseTexture m_Texture;

	D3DXVECTOR3	m_vStart,m_vEnd;

	float	m_fStartWidth,m_fStartHeight;
	float	m_fEndWidth,m_fEndHeight;

	float m_fStartR,m_fStartG,m_fStartB,m_fStartA;
	float m_fEndR,m_fEndG,m_fEndB,m_fEndA;

	float m_fAllTime;
	float m_fRefTime;

public:

	CEffectBillboard(
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
					);


	CEffectBillboard(
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
					);

	virtual ~CEffectBillboard();

//User Interface
private:

public:

	static unsigned int m_DisplayListID;	
	static BOOL         m_bDisplayPrompt;
	static void	StaticBuildDisplayList();
	static void	StaticClearDisplayList();

	inline float GetMaxTime() { return m_fAllTime; }

	void SetTexture( const char * FileName);

	void SetTime() 
	{ 
		m_fRefTime = Timer::GetLogicalTime();
	}

	BOOL	Render( D3DXMATRIX  &matBillboard ); // return TRUE if finish

};
