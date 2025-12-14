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
#include "windows.h"
#include "Util.h"
class CEngineInterface
{
public:
	static HRESULT InitDeviceObjects( HWND hWnd, int Bit  );
	static HRESULT DeleteDeviceObjects();
	static HRESULT OneTimeSceneInit();
	static HRESULT FinalCleanup();
	static void	   AddLogicalTime(float fTime)
	{
		Timer::m_fLogicalTime += fTime;
	}
};
