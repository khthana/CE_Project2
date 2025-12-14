//----------------------------------------------------------------------------------------
// EnvObj.cpp: implementation of the CEnvObj class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "Scene.h"
#include "EnvObj.h"
#include "SoundContainer.h"


//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CEnvObj::CEnvObj()
{
	// Set information
	m_strName			= "Environment Object Type 000";
	m_iHP				= 10;
	m_eActorType		= ENVOBJ;

	// Orientation height pivot relative value from loding data
	m_fPivotY			= 0.f;
	m_arAnimationFts	= 0.10f;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| 
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CEnvObj::SetEnvType( ACTOR_TYPE eActorType )
{
	switch( eActorType )
	{
		case ENVOBJ:
		{
			// Set information
			m_strName			= "Environment Object Type 000";
			m_iHP				= 10;
			m_eActorType		= ENVOBJ;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 0.f;
			m_arAnimationFts	= 0.10f;
		}
		break;

		case ENVOBJ1:
		{
			// Set information
			m_strName			= "Environment Object Type 001";
			m_iHP				= 10;
			m_eActorType		= ENVOBJ1;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 0.f;
			m_arAnimationFts	= 0.10f;
		}
		break;

		case ENVOBJ2:
		{
			// Set information
			m_strName			= "Environment Object Type 002";
			m_iHP				= 10;
			m_eActorType		= ENVOBJ2;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 0.f;
			m_arAnimationFts	= 0.10f;
		}
		break;
	}

	return TRUE;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| ~CEnvObj
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CEnvObj::~CEnvObj()
{
	CDObjModel::ClearModel();
}


/*
------------+-----------------------------------------------------------------------------
 Function	| LoadAnimModel
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CEnvObj::LoadAnimModel()
{
	switch( m_eActorType )
	{
		case ENVOBJ:
		{
			LoadModel( "Resource\\Model\\EnvObj\\env_obj000.mas" );

			if
			( 
				!CDynamicModel::SetAnimation
				( 
					"Idle", 
					FALSE, 
					0.125f 
				)
			)
			{
				return FALSE;
			}
	
			CDynamicModel::SetTimeScale( m_arAnimationFts );
			SetPosition( Px(), 6.f, Pz());

			m_oBounding.LoadModel("Resource\\Model\\EnvObj\\env_obj000_bounding.maf");
		}
		break;

		case ENVOBJ1:
		{
			LoadModel( "Resource\\Model\\gapbox\\gapbox000.mas" );

			if
			( 
				!CDynamicModel::SetAnimation
				( 
					"Idle", 
					FALSE, 
					0.125f 
				)
			)
			{
				return FALSE;
			}
	
			CDynamicModel::SetTimeScale( m_arAnimationFts );
			SetPosition( Px(), 6.f, Pz());

			m_oBounding.LoadModel("Resource\\Model\\EnvObj1\\env_obj001_bounding.maf");
		}
		break;

		case ENVOBJ2:
		{
			LoadModel( "Resource\\Model\\magbox\\magbox000.mas" );

			if
			( 
				!CDynamicModel::SetAnimation
				( 
					"Idle", 
					FALSE, 
					0.125f 
				)
			)
			{
				return FALSE;
			}
	
	
			CDynamicModel::SetTimeScale( m_arAnimationFts );
			SetPosition( Px(), 6.f, Pz());

			m_oBounding.LoadModel("Resource\\Model\\EnvObj1\\env_obj001_bounding.maf");
		}
		break;
	}

	return TRUE;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| Process
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CEnvObj::Process( float fElapseTime )
{
	if( !m_iHP )
	{
		return TRUE;
	}

	SetPosition( Px(), Py(), Pz());
	CActor::Process( fElapseTime );

	return TRUE;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| Render
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
HRESULT CEnvObj::Render( const D3DXMATRIX* matCustom )
{
	if( !m_iHP )
	{
		return TRUE;
	}

	switch( m_eActorType )
	{
		case ENVOBJ1:
		case ENVOBJ2:
		{
			SetScale( 0.50f, 0.5f, 0.50f );
		}
		break;
	}
	CActor::Render( matCustom );

	return TRUE;
}

