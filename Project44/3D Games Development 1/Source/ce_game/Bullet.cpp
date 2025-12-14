//----------------------------------------------------------------------------------------
// Bullet.cpp: implementation of the CBullet class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "Scene.h"
#include "Bullet.h"
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
CBullet::CBullet( ACTOR_TYPE eActorType )
{
	switch( eActorType )
	{
		case BULLET:
		{
			// Set information
			m_strName			= "Bullet 000";
			m_iHP				= 30;
			m_eActorType		= BULLET;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 0.f;
	
			m_arAnimationFts	= 0.10f;
			m_bIsShot			= false;
			m_bIsExploded		= false;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 20.f;

			// Specific moving data
			m_fDestX			= 0.f; 
			m_fDestY			= 0.f; 
			m_fDestZ			= 0.f;
			m_fMovingVelocity	= 200.f;
			m_fMovingStep		= 10.f;
	
			// Specific ratation data
			m_fRotationVelocity	= 300.f;

			// Initialize 2D Effects
			m_f2DScaleX			= 12.f;
			m_f2DScaleY			= 12.f;
			m_f2DScaleZ			= 1.f;
			m_f2DAlpha			= 0.5f;
		}
		break;

		case BULLET1:
		{
			// Set information
			m_strName			= "Bullet 001";
			m_iHP				= 20;
			m_eActorType		= BULLET1;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 0.f;
	
			m_arAnimationFts	= 0.10f;
			m_bIsShot			= false;
			m_bIsExploded		= false;

			// Orientation height pivot relative value from loding data
			m_fPivotY			= 20.f;

			// Specific moving data
			m_fDestX			= 0.f; 
			m_fDestY			= 0.f; 
			m_fDestZ			= 0.f;
			m_fMovingVelocity	= 200.f;
			m_fMovingStep		= 10.f;
	
			// Specific ratation data
			m_fRotationVelocity	= 300.f;

			// Initialize 2D Effects
			m_f2DScaleX			= 12.f;
			m_f2DScaleY			= 12.f;
			m_f2DScaleZ			= 1.f;
			m_f2DAlpha			= 0.5f;
		}
		break;
	}
}


/*
------------+-----------------------------------------------------------------------------
 Function	| ~CBullet
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CBullet::~CBullet()
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
BOOL CBullet::LoadAnimModel()
{
	switch( m_eActorType )
	{
		case BULLET:
		{
			LoadModel( "Resource\\Model\\Bullet\\bullet000.mas" );
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
			m_oBounding.LoadModel("Resource\\Model\\Bullet\\bullet000_bounding.maf");
		}
		break;

		case BULLET1:
		{
			LoadModel( "Resource\\Model\\Bullet1\\bullet001.mas" );
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
			m_oBounding.LoadModel("Resource\\Model\\Bullet1\\bullet001_bounding.maf");
		}
		break;
	}

	return TRUE;
}


bool CBullet::Fire( CVector3f vSrc, CVector3f vDes )
{
	if( m_bIsShot || IsDead() )
		return FALSE;

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

	SetPosition( vSrc.x, vSrc.y, vSrc.z);
	CalculateRotate( D3DXVECTOR3(vDes.x, vDes.y, vDes.z) );
	SetDestMoving(vDes.x, vDes.y, vDes.z);
	
	switch( m_eActorType )
	{
		case BULLET:
		{
			CSoundContainer::s_oSound[SOUND_SHOOT_001].Play();
		}
		break;
	
		case BULLET1:
		{
			CSoundContainer::s_oSound[SOUND_SHOOT_002].Play();
		}
		break;
	}

	m_bIsShot = true;

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
BOOL CBullet::Process( float fElapseTime )
{
	if( !m_iHP )
	{
		return TRUE;
	}

	if( m_bIsShot )
	{
		if( !CDynamicModel::IsBlending() )
		{
			// Check if reached destination point
			if( !CalculateMoving( fElapseTime ) )
			{
				switch( m_eActorType )
				{
					case BULLET:
					{
						CSoundContainer::s_oSound[SOUND_EXPLODE_000].Play();
					}
					break;
	
					case BULLET1:
					{
						CSoundContainer::s_oSound[SOUND_EXPLODE_001].Play();
					}
					break;
				}

				m_bIsShot		= false;
				m_bIsExploded	= true;
				if
				( 
					!CDynamicModel::SetAnimation
					( 
						"Explode", 
						FALSE, 
						0.4f 
					)
				)
				{
					return FALSE;
				}

				DecreaseHP(1);
			}
		}

		CActor::Process( fElapseTime );
		CActor::FrameMove( fElapseTime );
	}
	else
	if( m_bIsExploded )
	{
		m_f2DScaleX += 30.f;
		m_f2DScaleY += 36.f;
		m_f2DScaleZ += 6.f;
		m_f2DAlpha	-= 0.14f;

		if
		( 
			( !CDynamicModel::IsBlending() ) && 
			(  CDynamicModel::GetCurrentAnimationTime()>=CDynamicModel::GetCurrentMaxTime() ) 
		)
		{
			m_bIsExploded	= false;
			m_f2DScaleX		= 12.f;
			m_f2DScaleY		= 12.f;
			m_f2DScaleZ		= 1.f;
			m_f2DAlpha		= 0.5f;
		}

		CActor::Process( fElapseTime );
		CActor::FrameMove( fElapseTime );
	}

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
HRESULT CBullet::Render( const D3DXMATRIX* matCustom )
{
	if( !m_iHP )
	{
		return TRUE;
	}

	if( m_bIsShot || m_bIsExploded )
	{
		CActor::Render( matCustom );
		CMat matWorld;

		glDisable(GL_LIGHTING);				 
		glEnable(GL_BLEND);
		glDepthMask(0);
		glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
		matWorld.Scale(	m_f2DScaleX, m_f2DScaleY, m_f2DScaleZ );
		matWorld.Mul(&CScene::s_pMyGlApp->m_oCamera.GetBillboard());
		matWorld.Translatef(Px(),Py()+m_f2DScaleZ,Pz());
		GLGfx::SetMatWorld( matWorld.GetpMat() );
		glColor4f( 1.f, 1.f, 1.f, m_f2DAlpha );
		glBindTexture(GL_TEXTURE_2D, CScene::s_oTexture[TEXTURE_FIRE].Get());
		glCallList(  CEffectBillboard::m_DisplayListID );
		glDisable(GL_BLEND);
		glDepthMask(1);
	}

	return TRUE;
}

