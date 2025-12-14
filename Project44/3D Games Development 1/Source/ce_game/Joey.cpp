//----------------------------------------------------------------------------------------
// Joey.cpp: implementation of the CJoey class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "Joey.h"
#include "Scene.h"


//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------



/*
------------+-----------------------------------------------------------------------------
 Function	| CJoey
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CJoey::CJoey()
{
	m_strName	= "Joey";

//	m_pLand = NULL;
	m_CurrentAnimationID = ANIM_NULL;
	
	for( int i=0; i<JOEY_NUM_ANIMATION; i++ ) 
	{
		m_arAnimationFts[i] = 1.f;
	}

	// Specific frame time scale
	m_arAnimationFts[ANIM_Idle]		= 0.06f;
	m_arAnimationFts[ANIM_Walk]		= 0.15f;
	m_arAnimationFts[ANIM_Dieback0] = 0.10f;
/*
	// Animation Param
	m_fWalkStepDistance = 0.0f;
	m_fWalkVelocity     = 0.0f;

	m_fWalkHobbleStepDistance = 0.0f;
	m_fWalkHobbleVelocity = 0.0f;

	m_fRunStepDistance = 0.0f;
	m_fRunVelocity = 0.0f;

	m_fRunLeftStepDistance = 0.0f;
	m_fRunLeftVelocity = 0.0f;

	m_fRunRightStepDistance = 0.0f;
	m_fRunRightVelocity = 0.0f;

	m_fCreepStepDistance = 0.0f;
	m_fCreepVelocity = 0.0f;

*/
	m_bIsDoingOp	= FALSE;
	m_iCurrentOp	= OP_NULL;
	m_iNextOp		= OP_NULL;

/*	m_FirstDie = FALSE;

	// Shadow
	m_bUseShadow = FALSE;
*/	m_fWaitTime  = 0.0f;
//	m_bRenderFire = FALSE;

}


/*
------------+-----------------------------------------------------------------------------
 Function	| ~CJoey
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CJoey::~CJoey()
{
	CDObjModel::ClearModel();
}


/*
------------+-----------------------------------------------------------------------------
 Function	| Process
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CJoey::SetAnimationID
( 
	JOEY_ANIMATION	AnimID, 
	BOOL			bBlend, 
	float			fFinishBlendTime 
)
{
	BOOL bOk = 
	CDynamicModel::SetAnimation
	( 
		__szJoeyAnimation[AnimID], 
		bBlend, 
		fFinishBlendTime 
	);

	if( bOk )
	{
		CDynamicModel::SetTimeScale( m_arAnimationFts[AnimID] );
		m_CurrentAnimationID = AnimID;
		return TRUE;
	}

	return FALSE;
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
BOOL CJoey::LoadAnimModel( const CString& strScrFileName )
{
	LoadModel( strScrFileName );
	SetAnimationID( ANIM_Idle );
//	SetAnimationID( ANIM_Idle, FALSE, 0.125f );
	SetAnimationID( ANIM_Dieback0, FALSE, 0.125f );
	m_iCurrentOp = OP_WALKTOXZ;

	float fY = CScene::GetHeight(-100.f, 50.f, 50.f);
	SetPosition(-100.f, fY+50, 50.f);
//	m_fVelocity	= 1.f;
//	SetDestMoving(0.f, 50.f, 50.f);

	return TRUE;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| ProcessAI
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CJoey::ProcessAI()
{
	// Random the next operation will be done
	if( m_iNextOp == OP_NULL )
	{
		switch( CMath::RandomizeInt(0,4) )
		{
			case 1: m_iNextOp = OP_IDLE;		break;
			case 2: m_iNextOp = OP_WALKTOXZ;	break;
			case 3: m_iNextOp = OP_DIEBACK0;	break;
			default:m_iNextOp = OP_IDLE;		break;
		}
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
BOOL CJoey::Process( float fElapseTime )
{
	ProcessAI();

	BOOL bOk = FALSE;
	
	if( m_PromptState = PROMPTSTATE_READY )
	{
		if( !IsDead() )
		{
			if( !m_bIsDoingOp )
			{
				m_bIsDoingOp = TRUE;
				switch( m_iCurrentOp )
				{
					case OP_IDLE:
					{
						SetAnimationID( ANIM_Idle, TRUE );
						m_fWaitTime = (float)CMath::RandomizeInt(0,2);
					}
					break;

					case OP_WALKTOXZ:
					{
						SetAnimationID( ANIM_Walk, TRUE );
						FLOAT x= CMath::Randomize0to1()+(FLOAT)CMath::RandomizeInt(0,400);
						FLOAT z= CMath::Randomize0to1()+(FLOAT)CMath::RandomizeInt(100,400);
						float fY = CScene::GetHeight(x, CMovMat::Py(), z);
						SetDestMoving( -x, fY+50, z );
						m_fWaitTime = 0.f;
					}
					break;

					case OP_DIEBACK0:
					{
						SetAnimationID( ANIM_Dieback0, TRUE );
					}
					break;
				}
			}

			// Animate action and moving position
			if( JOEY_ANIM_IS_MOVING[m_CurrentAnimationID] )
			{
//				float Velocity = 0.0f;
/*				switch( m_CurrentAnimationID )
				{
					// Moving 
					case ANIM_Walk:
					{
//						Velocity = m_fWalkVelocity;
					}
					break;
				}
*/
				if( !CDynamicModel::IsBlending() )
				{
					// Check if reached destination point
					if( !CalculateMoving( fElapseTime ) )
					{
						// Go to next operation
						m_bIsDoingOp= FALSE;
						m_iCurrentOp= m_iNextOp;
						m_iNextOp	= OP_NULL;
						
						// Goal
						bOk = TRUE;

					}
				}
			}
			// Animate action but not moving position
		    else if( JOEY_ANIM_IS_STOP[m_CurrentAnimationID] )
			{
				if( ( !CDynamicModel::IsBlending() ) && 
					(  CDynamicModel::GetCurrentAnimationTime() >= m_fWaitTime ) )
				{
					// Go to next operation
					m_bIsDoingOp= FALSE;
					m_iCurrentOp= m_iNextOp;
					m_iNextOp	= OP_NULL;
						
					// Goal
					bOk = TRUE;
				}
			}
			else 
			{
				if( ( !CDynamicModel::IsBlending() ) && 
					(  CDynamicModel::GetCurrentAnimationTime() >= CDynamicModel::GetCurrentMaxTime() ) )
				{
					// Go to next operation
					m_bIsDoingOp= FALSE;
					m_iCurrentOp= m_iNextOp;
					m_iNextOp	= OP_NULL;
						
					// Goal
					bOk = TRUE;
				}		
			}
		}
	}

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
HRESULT CJoey::Render( const D3DXMATRIX* matCustom )
{
	
/*	if( m_bUseShadow )
	{
		glEnable( GL_STENCIL_TEST );
		//======================= Render Shadow Box ================================
//		glColorMask( 1,1,1,1 );
		glColorMask( 0,0,0,0 );
		glDepthMask( 0 );
		glStencilFunc(GL_EQUAL, 1, 0xffffffff);
		glStencilOp( GL_KEEP, GL_KEEP, GL_INCR );
		
		m_ShadowCylinder.CMovMat::SetDirVecMode( DV_NORMALVEC );
		D3DXVECTOR3 vCurentNormal;
		GetCurrentNormal( &vCurentNormal );
		m_ShadowCylinder.CMovMat::SetDirVec( &vCurentNormal );

		m_ShadowCylinder.CMovMat::SetScale( 1.0f, 0.25f, 1.0f );
		m_ShadowCylinder.CMovMat::SetPosition( CMovMat::Px(),
										  CMovMat::Py(),
										  CMovMat::Pz() );

		m_ShadowCylinder.Render();
		

		//======================= Render Shadow=====================================
		glStencilFunc( GL_EQUAL, 2, 0xffffffff );
		glStencilOp( GL_KEEP, GL_KEEP, GL_KEEP );

		glColorMask( 1,1,1,1 );
//		glEnable( GL_ALPHA_TEST );
		glDisable( GL_DEPTH_TEST );
		glEnable(GL_BLEND);
//      glBlendFunc( GL_SRC_COLOR, GL_DST_COLOR );	// Select The Type Of Blending
		glBlendFunc( GL_SRC_COLOR, GL_ONE_MINUS_SRC_ALPHA );	// Select The Type Of Blending

		Tool::PutSqrTexture3D( &m_TexShadow,
							   // Position
							   CMovMat::Px(), CMovMat::Py(), CMovMat::Pz(),
							   1.5f, 
							   &vCurentNormal );
		glDisable( GL_BLEND );
		glEnable ( GL_DEPTH_TEST );
		glDepthMask( 1 );
//		glDisable( GL_ALPHA_TEST );
	}
*/
//	glDisable( GL_STENCIL_TEST );
	CJoey::SetScale( 0.50f, 0.5f, 0.50f );
	CActor::Render( matCustom );
/*
    if( m_bRenderFire )
	{
		CTriangle Triangle;
		GetTriangle( 907, &Triangle );
		
		/*
        char sz[255];
		sprintf( sz, "%f %f %f", Triangle.GetV0().x,Triangle.GetV0().y,Triangle.GetV0().z );
		Log(sz);
		*/
/*
		D3DXVECTOR3 vPos;
		Vec3::MulMat( &vPos, &Triangle.GetV0(), CMovMat::GetpMat() );
		CloudList.Add(	"Texture\\cloud.tga",
						vPos.x,vPos.y,vPos.z,
						vPos.x+0.15f,vPos.y+0.25f,vPos.z+0.15f,
						0.20f,0.30f,
						0.250f,0.35f,
						float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,1.0f,
						float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.0f,
						00.80f);

	}

	m_bRenderFire = FALSE;
*/
	return TRUE;
}
