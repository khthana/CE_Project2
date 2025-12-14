//----------------------------------------------------------------------------------------
// MyCamera.cpp: implementation of the CMyCamera class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "MyCamera.h"



//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------



/*
------------+-----------------------------------------------------------------------------
 Function	| CMyCamera
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CMyCamera::CMyCamera()
{

}



/*
------------+-----------------------------------------------------------------------------
 Function	| ~CMyCamera
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CMyCamera::~CMyCamera()
{

}


/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CMyCamera::Initialize()
{
	// Initialize is finished
	return S_OK;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CMyCamera::Render()
{
/*	// Builds a left-handed, view matrix.
	D3DXMatrixPerspectiveFovLH
	( 
		&m_matProj, 
		m_fFOV, 
		m_fAspect, 
		m_fNearPlane, 
		m_fFarPlane 
	);

	// Set viewing parameter
	D3DXVECTOR3 vEye	( m_vEye.x, m_vEye.y, m_vEye.z );
	D3DXVECTOR3 vLookat	( m_vLookat.x, m_vLookat.y, m_vLookat.z );
	D3DXVECTOR3 vUp		( m_vUp.x, m_vUp.y, m_vUp.z );

	// Builds a left-handed, look-at matrix.
	D3DXMatrixLookAtLH( &m_matView, &vEye, &vLookat, &vUp );
*/
	// Then send matrix to graphics engine
	GLGfx::SetMatProj( &m_matProj );
	GLGfx::SetMatView( &m_matView );

	// Rendering is finished
	return S_OK;
}


HRESULT CMyCamera::ProcessKey( FLOAT fElapsedTime, RECT rcScreen, BOOL* m_arKey )
{
	static float s_fLimit = 6.0f;

	// Move Forward
	static float s_fMoveForward = 0.0f;
	if( m_arKey[VK_NUMPAD8]) 
	{
		s_fMoveForward+=(fElapsedTime); 
		if( s_fMoveForward > s_fLimit )
		{
			s_fMoveForward = s_fLimit;
		}
	}
	else 
	{
		s_fMoveForward-=(fElapsedTime*4.f);
	}
	if( s_fMoveForward<=0.0f ) 
	{
		s_fMoveForward = 0.0f;
	}
	else
	{
		MoveForward( s_fMoveForward );
	}

	// Move Backward
	static float s_fMoveBackward = 0.0f;
	if( m_arKey[VK_NUMPAD2]) 
	{
		s_fMoveBackward+=(fElapsedTime);
		if( s_fMoveBackward > s_fLimit ) s_fMoveBackward = s_fLimit;
	}	
	else 
	{
		s_fMoveBackward-=(fElapsedTime*4.f);
	}
	if (s_fMoveBackward<=0.0f) 
	{
		s_fMoveBackward = 0.0f;
	}
	else
	{
		MoveBackward( s_fMoveBackward );
	}

	// Move Left
	static float s_fMoveLeft = 0.0f;
	if( m_arKey[VK_NUMPAD4]) 
	{
		s_fMoveLeft+=(fElapsedTime);
		if( s_fMoveLeft > s_fLimit ) s_fMoveLeft = s_fLimit;
	}
	else 
	{
		s_fMoveLeft-=(fElapsedTime*4.f);
	}
	if (s_fMoveLeft<=0.0f) 
	{
		s_fMoveLeft = 0.0f;
	}
	else
	{
		MoveLeft( s_fMoveLeft );
	}

	static float s_fMoveRight = 0.0f;
	if( m_arKey[VK_NUMPAD6]) 
	{
		s_fMoveRight+=(fElapsedTime);
		if( s_fMoveRight > s_fLimit ) s_fMoveRight = s_fLimit;
	}
	else 
	{
		s_fMoveRight-=(fElapsedTime*4.f);
	}

	if (s_fMoveRight<=0.0f) 
	{
		s_fMoveRight = 0.0f;
	}
	else
	{
		MoveRight( s_fMoveRight );
	}

	// Move Up
	static float s_fMoveUp = 0.0f;
	if( m_arKey['W']) 
	{
		s_fMoveUp+=(fElapsedTime);
		if( s_fMoveUp > s_fLimit ) s_fMoveUp = s_fLimit;
	}
	else 
	{
		s_fMoveUp-=(fElapsedTime*4.f);
	}

	if (s_fMoveUp<=0.0f) 
	{
		s_fMoveUp = 0.0f;
	}
	else
	{
		MoveUp( s_fMoveUp );
	}

	// Move Down
	static float s_fMoveDown = 0.0f;
	if( m_arKey['Z']) 
	{
		s_fMoveDown+=(fElapsedTime);
		if( s_fMoveDown > s_fLimit ) s_fMoveDown = s_fLimit;
	}
	else 
	{
		s_fMoveDown-=(fElapsedTime*4.f);
	}

	if (s_fMoveDown<=0.0f) 
	{
		s_fMoveDown = 0.0f;
	}
	else
	{
		MoveDown( s_fMoveDown );
	}

	// UseFul Data
	int ScrWidth  = rcScreen.right - rcScreen.left;
	int ScrHeight = rcScreen.bottom - rcScreen.top;

	// Rotate Left
	if( m_arKey[VK_NUMPAD7] )//|| (m_MouseX == 0) ) 
	{
		RotateLeft( fElapsedTime );
	}

	// Rotate Right
	if( m_arKey[VK_NUMPAD9] )//|| (m_MouseX == ScrWidth - 1) ) 
	{
		RotateRight( fElapsedTime );
	}

	// Rotate Up
	if( m_arKey['E'] )//|| (m_MouseY == 0) ) 
	{
		RotateUp( fElapsedTime );
	}

	// Rotate Down
	if( m_arKey['X'] )//|| (m_MouseY == ScrHeight - 1 )  ) 
	{
		RotateDown( fElapsedTime );
	}

	// Orbit Left
	if( m_arKey[VK_NUMPAD1] )//|| (m_MouseX == 0) ) 
	{
		OrbitLeft( fElapsedTime );
	}

	// Orbit Right
	if( m_arKey[VK_NUMPAD3] )//|| (m_MouseX == ScrWidth - 1) ) 
	{
		OrbitRight( fElapsedTime );
	}

	// Orbit Up
	if( m_arKey['R'] )//|| (m_MouseX == 0) ) 
	{
		OrbitUp( fElapsedTime );
	}

	// Orbit Down
	if( m_arKey['C'] )//|| (m_MouseX == ScrWidth - 1) ) 
	{
		OrbitDown( fElapsedTime );
	}

	// Zoom In
	if( m_arKey[VK_ADD] )//|| (m_MouseX == 0) ) 
	{
		ZoomIn( fElapsedTime );
	}

	// Zoom Out
	if( m_arKey[VK_SUBTRACT] )//|| (m_MouseX == ScrWidth - 1) ) 
	{
		ZoomOut( fElapsedTime );
	}

	return S_OK;
}