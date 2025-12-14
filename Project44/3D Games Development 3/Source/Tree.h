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

#include "ENGINE\Matrix.h"

#include "ENGINE\MultiDetailData.h"
#include "ENGINE\UseMultidetailData.h"
#include <fstream>
using namespace std;

class CTree : public CMovMat  
{
private:
	CUseMultiDetailData		m_Data;

protected:
	// Cache Triangle Use for GetHigh
	CCacheTriangle CacheTri;

public:
	float	m_fRadius;

	BOOL LayOn( CSLandModel *pLandModel ,BOOL bFollowNorm = TRUE); // pModel Not Modify
	void SetCacheSize( int nCacheSize );

	void LoadModel( const char *strFileName ); // Filename.mam (multidetaildata)
	void ClearModel();
	void Render( int nDetail , const D3DXMATRIX* matCustom =NULL );
	
	void WriteToFileStream( ofstream* ofs );
	void ReadFromFileStream( ifstream* ifs );
public:
	CTree();
	virtual ~CTree();

};
