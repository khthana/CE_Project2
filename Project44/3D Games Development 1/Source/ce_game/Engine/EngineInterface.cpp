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

#include "..\StdAfx.h"
#include "engineinterface.h"
#include "GLGfx.h"
#include "Texture.h"
#include "Vertices.h"
#include "Indices.h"
#include "TexCoord.h"
#include "Texture.h"
#include "Text2D.h"
#include "VertexColor.h"
#include "ModelData.h"
#include "StaticModelData.h"
#include "Animation.h"
#include "PartDef.h"
#include "UseMultiDetailData.h"
#include "EffectBillboard.h"
#include "Normals.h"
#include "Sound.h"

HRESULT CEngineInterface::InitDeviceObjects( HWND hWnd, int Bit  )
{
	// for first only
	GLGfx::InitGL( hWnd, Bit );

	CSoundsManage::StaticInitDeviceObjects(hWnd);
	CTextureManage::StaticInitDeviceObjects();
	CVerticesManage::StaticInitDeviceObjects();
	CIndicesManage::StaticInitDeviceObjects();
	CTexCoordManage::StaticInitDeviceObjects();
	CVertexColorManage::StaticInitDeviceObjects();
	CNormalsManage::StaticInitDeviceObjects();
	CModelDataManage::StaticInitDeviceObjects();
	CStaticModelDataManage::StaticInitDeviceObjects();
	CAnimationManage::StaticInitDeviceObjects();
	CPartDefManage::StaticInitDeviceObjects();
	CMultiDetailDataManage::StaticInitDeviceObjects();
	CEffectBillboard::StaticBuildDisplayList();

	return S_OK;
}

HRESULT CEngineInterface::DeleteDeviceObjects()
{
	CEffectBillboard::StaticClearDisplayList();
	CMultiDetailDataManage::StaticDeleteDeviceObjects();
	CPartDefManage::StaticDeleteDeviceObjects();
	CAnimationManage::StaticDeleteDeviceObjects();
	CStaticModelDataManage::StaticDeleteDeviceObjects();
	CModelDataManage::StaticDeleteDeviceObjects();
	CNormalsManage::StaticDeleteDeviceObjects();
	CVertexColorManage::StaticDeleteDeviceObjects();
	CTexCoordManage::StaticDeleteDeviceObjects();
	CIndicesManage::StaticDeleteDeviceObjects();
	CVerticesManage::StaticDeleteDeviceObjects();
	CTextureManage::StaticDeleteDeviceObjects();
	CSoundsManage::StaticDeleteDeviceObjects();

	GLGfx::ReleaseGL();// last only
	return S_OK;
}

HRESULT CEngineInterface::OneTimeSceneInit()
{
	CText2D::CreateCharSurface();

	return S_OK;
}

HRESULT CEngineInterface::FinalCleanup()
{
	CMultiDetailDataManage::StaticFinalCleanUp();
	CPartDefManage::StaticFinalCleanUp();
	CAnimationManage::StaticFinalCleanUp();
	CStaticModelDataManage::StaticFinalCleanUp();
	CModelDataManage::StaticFinalCleanUp();
	CNormalsManage::StaticFinalCleanUp();
	CVertexColorManage::StaticFinalCleanUp();
	CTexCoordManage::StaticFinalCleanUp();
	CIndicesManage::StaticFinalCleanUp();
	CVerticesManage::StaticFinalCleanUp();
	CTextureManage::StaticFinalCleanUp();
	CSoundsManage::StaticFinalCleanUp();
	
	return S_OK;
}

