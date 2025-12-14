//----------------------------------------------------------------------------------------
// Tina.cpp: implementation of the CTina class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "Scene.h"
#include "Tina.h"
#include "SoundContainer.h"


//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Function	| CTina
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CTina::CTina()
	  :m_oBullet0(BULLET),
	   m_oBullet1(BULLET1)
{
	// Set information
	m_strName			= "Tina";
	m_iHP				= 50;
	m_eActorType		= TINA;

	// Orientation height pivot relative value from loding data
	m_fPivotY			= 20.f;

	// Specific moving data
	m_fDestX			= 0.f; 
	m_fDestY			= 0.f; 
	m_fDestZ			= 0.f;
	m_fMovingVelocity	= 40.f;
	m_fMovingStep		= 2.f;
	
	// Specific ratation data
	m_fRotationVelocity	= 150.f;

	// Preparing the animation speed
	m_CurrentAnimationID = ANIM_NULL;
	
	for( int i=0; i<TINA_NUM_ANIMATION; i++ ) 
	{
		m_arAnimationFts[i] = 0.25f;
	}

	// Specific frame time scale
//	m_arAnimationFts[ANIM_Idle]		= 0.06f;
	m_arAnimationFts[ANIM_Run]		= 0.30f;
//	m_arAnimationFts[ANIM_Look]		= 0.04f;
	m_arAnimationFts[ANIM_Jump]		= 0.15f;
	m_arAnimationFts[ANIM_Shoot]	= 0.30f;
/*	m_arAnimationFts[ANIM_Push]		= 0.04f;
	m_arAnimationFts[ANIM_Pain]		= 0.04f;
	m_arAnimationFts[ANIM_Pain2]	= 0.04f;
	m_arAnimationFts[ANIM_Jeer]		= 0.04f;
	m_arAnimationFts[ANIM_Jeer2]	= 0.04f;
	m_arAnimationFts[ANIM_Avoid]	= 0.04f;
*/	m_arAnimationFts[ANIM_Dieback]	= 0.15f;
	m_arAnimationFts[ANIM_Diefront]	= 0.15f;
	m_arAnimationFts[ANIM_Diefall]	= 0.15f;

	// Operatio setting
	m_bIsDoingOp	= FALSE;
	m_iCurrentOp	= OP_NULL;
	m_iNextOp		= OP_NULL;

	m_iDeadBling	= 50;
	m_fLastTime		= 0.f;

/*	// Shadow
	m_bUseShadow = FALSE;
*/	m_fWaitTime  = 0.0f;
//	m_bRenderFire = FALSE;

}


/*
------------+-----------------------------------------------------------------------------
 Function	| ~CTina
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CTina::~CTina()
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
BOOL CTina::SetAnimationID
( 
	TINA_ANIMATION	AnimID, 
	BOOL			bBlend, 
	float			fFinishBlendTime 
)
{
	if
	(
		CDynamicModel::SetAnimation
		( 
			__szTinaAnimation[AnimID], 
			bBlend, 
			fFinishBlendTime 
		)
	)
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
BOOL CTina::LoadAnimModel()
{
	LoadModel( "Resource\\Model\\Tina\\tina.mas" );
	SetAnimationID( ANIM_Idle );
	SetAnimationID( ANIM_Idle, FALSE, 0.125f );
	m_iCurrentOp = OP_IDLE;

	SetPosition( 0, 0, 0);
	m_oBounding.LoadModel("Resource\\Model\\Tina\\tina_bounding.maf");
	
	// following loading... 
	m_oBullet0.LoadAnimModel();
	m_oBullet1.LoadAnimModel();

	return TRUE;
}

/*
------------+-----------------------------------------------------------------------------
 Function	| Is
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
VOID CTina::IsHit()
{
	m_iNextOp = OP_PAIN;
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
BOOL CTina::ProcessAI()
{
	if( !m_iDeadBling )
		return TRUE;

	// Finding destination distance
	CVector3f vSrc(Px(), Py(), Pz());
	CVector3f vDes(CScene::s_oPlayer.Px(), CScene::s_oPlayer.Py(), CScene::s_oPlayer.Pz());
	bool bFoundTarget = ( 150.f > (FLOAT)CVector3f::Distance(&vSrc,&vDes) );

	// Now i'm die
	if( IsDead()&&(m_iCurrentOp!=OP_DIE)&&(m_iCurrentOp!=OP_NULL) )
	{
   		m_iCurrentOp= OP_DIE;
		m_iNextOp	= OP_NULL;
		m_fWaitTime = (float)CMath::RandomizeInt(0,2);
		if(CMath::RandomizeInt(0,2)==1)
		{
			SetAnimationID( ANIM_Diefront, TRUE );
		}
		else
		{
			SetAnimationID( ANIM_Dieback, TRUE );
		}
		CSoundContainer::s_oSound[SOUND_WOMAN_DIE00].Play();
	}
	else // Found destination change operation to action state
	if( m_iNextOp==OP_PAIN )
	{
		// Go to next operation
		m_bIsDoingOp= FALSE;
		m_iCurrentOp= OP_PAIN;
		m_iNextOp	= OP_NULL;
	}
	else
	if( bFoundTarget && (m_iCurrentOp!=OP_ACTION)&&(m_iCurrentOp!=OP_DIE) )
	{
		m_iCurrentOp= OP_ACTION;
		m_iNextOp	= OP_NULL;
		m_fWaitTime = 0.f;
	}
	else
	// Random the next operation will be done
	if( (!bFoundTarget)&&(!IsDead())&&(m_iNextOp==OP_NULL) )
	{
		switch( CMath::RandomizeInt(0,6) )
		{
			case 1: m_iNextOp = OP_IDLE;		break;
			case 2: m_iNextOp = OP_WALKTOXZ;	break;
			case 3: m_iNextOp = OP_RUNTOXZ;		break;
			case 4: m_iNextOp = OP_JEER;		break;
			case 5: m_iNextOp = OP_LOOK;		break;
			case 6: m_iNextOp = OP_WAIT;		break;
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
BOOL CTina::Process( float fElapsedTime )
{
	if( !m_iDeadBling )
		return TRUE;

	if( m_iCurrentOp!=OP_DIE && m_iCurrentOp!=OP_DEAD)
		ProcessAI();

	BOOL bOk = FALSE;
	
	if( !IsDead() )
	{
		if( (!m_bIsDoingOp) && (m_iCurrentOp!=OP_ACTION) )
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
					float fMore = (float)CMath::RandomizeInt(0,50);
					float fX	= CMovMat::Px();
					float fZ	= CMovMat::Pz();
					switch( CMath::RandomizeInt(1,4) )
					{
						case 1: fX+=fMore;		break;
						case 2: fX-=fMore;		break;
						case 3: fZ+=fMore;		break;
						case 4: fZ-=fMore;		break;
						default:fZ+=fMore;		break;
					}
					float fY = CMovMat::Py();//m_fPivotY+CScene::GetHeight(x, CMovMat::Py(), z);		
					SetAnimationID( ANIM_Run, TRUE );
					CalculateRotate( D3DXVECTOR3(fX, fY, fZ) );
					SetDestMoving(fX, fY, fZ);
					//m_fWaitTime = 0.f;
				}
				break;
				
				case OP_RUNTOXZ:
				{
					float fMore = (float)CMath::RandomizeInt(0,60);
					float fX	= CMovMat::Px();
					float fZ	= CMovMat::Pz();
					switch( CMath::RandomizeInt(1,4) )
					{
						case 1: fZ+=fMore;		break;
						case 2: fZ-=fMore;		break;
						case 3: fX+=fMore;		break;
						case 4: fX-=fMore;		break;
						default:fX+=fMore;		break;
					}
					float fY = CMovMat::Py();//m_fPivotY+CScene::GetHeight(x, CMovMat::Py(), z);		
					SetAnimationID( ANIM_Run, TRUE );
					CalculateRotate( D3DXVECTOR3(fX, fY, fZ) );
					SetDestMoving(fX, fY, fZ);
					m_fLastTime=0.f;//fElapsedTime;
				}
				break;
					
				case OP_JUMPTOXZ:
				{
/*						SetAnimationID( ANIM_Jump, TRUE );
						FLOAT x= -(CMath::Randomize0to1()+(FLOAT)CMath::RandomizeInt(0,200));
						FLOAT z= CMath::Randomize0to1()+(FLOAT)CMath::RandomizeInt(000,400);
						float fY = m_fPivotY+CScene::GetHeight(x, CMovMat::Py(), z);
						SetDestMoving(x, fY, z);
//						SetDestMoving( x, CMovMat::Py(), z );
						m_fWaitTime = 0.f;
						CSoundContainer::s_oSound[SOUND_WOMAN_JUMP00].Play();
*/
				}
				break;
		
				case OP_JEER:
				{
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
					if(CMath::RandomizeInt(0,2)==1)
					{
						SetAnimationID( ANIM_Jeer, TRUE );
					}
					else
						SetAnimationID( ANIM_Jeer2, TRUE );
				}
				break;

				case OP_PAIN:
				{

					switch( CMath::RandomizeInt(1,100)%2 )
					{
						case 0: SetAnimationID(ANIM_Pain, TRUE); break;
						case 1: SetAnimationID(ANIM_Pain2,TRUE); break;
					}
					
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
					CSoundContainer::s_oSound[SOUND_WOMAN_PAIN00].Play();
					CSoundContainer::s_oSound[SOUND_BREATH_000].Play();
				}
				break;

				case OP_AVOID:
				{
					SetAnimationID( ANIM_Avoid, TRUE );
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
				}
				break;

				case OP_LOOK:
				{
					SetAnimationID( ANIM_Look, TRUE );
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
				}
				break;

				case OP_WAIT:
				{
					SetAnimationID( ANIM_Idle, TRUE );
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
				}
				break;

				case OP_DIE:
				{
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
					if(CMath::RandomizeInt(0,2)==1)
					{
						SetAnimationID( ANIM_Diefront, TRUE );
					}
					else
					SetAnimationID( ANIM_Dieback, TRUE );
					CSoundContainer::s_oSound[SOUND_WOMAN_DIE00].Play();
//					CSoundContainer::s_oSound[SOUND_BACKGROUND00].Play();
				}
				break;

				default:
				{
					SetAnimationID( ANIM_Idle, TRUE );
					m_fWaitTime = (float)CMath::RandomizeInt(0,2);
				}
				break;
			}
		}

		// Animate action and moving position
		if( TINA_ANIM_IS_MOVING[m_CurrentAnimationID] )
		{
			switch( m_CurrentAnimationID )
			{
				// Moving 
				case ANIM_Run:
				{
/*					if(!CSoundContainer::s_oSound[SOUND_STEP_001].IsSoundPlaying())
					{
						m_fLastTime+=fElapsedTime;
						if( m_fLastTime>0.25f )
						{
							CSoundContainer::s_oSound[SOUND_STEP_001].Play();
							m_fLastTime=0.f;//fElapsedTime;
						}
					}
*/				}
				break;
			}

			if( !CDynamicModel::IsBlending() )
			{
				// Check if reached destination point
				if( !CalculateMoving( fElapsedTime ) )
				{
					switch( m_iCurrentOp )
					{
						case OP_ACTION:
						{
							// Go to next operation
							m_bIsDoingOp= FALSE;
//							m_iCurrentOp= OP_PAIN;
//							m_iCurrentOp= OP_SHOOT;
//							m_iNextOp	= OP_NULL;
						}
						break;
							
						default:
						{
							// Go to next operation
							m_bIsDoingOp= FALSE;
							m_iCurrentOp= m_iNextOp;
							m_iNextOp	= OP_NULL;
						}
						break;
					}
					
					// Goal
					bOk = TRUE;
				}
			}
				
			if( IsPickedEnvObj() )
				CSoundContainer::s_oSound[SOUND_CHARGE_000].Play();
		}
		// Animate action but not moving position
		if( ( !CDynamicModel::IsBlending() ) && 
			(  CDynamicModel::GetCurrentAnimationTime()>=CDynamicModel::GetCurrentMaxTime() ) )
		{
			switch( m_iCurrentOp )
			{
				case OP_ACTION:
				{
					FLOAT x= CScene::s_oPlayer.Px();
					FLOAT y= CScene::s_oPlayer.Py();
					FLOAT z= CScene::s_oPlayer.Pz();
					FLOAT fZeta=0.f;
					CalculateRotate( D3DXVECTOR3(x, y, z), &fZeta);

					D3DXVECTOR3	vdxSrc( CMovMat::Px(), CMovMat::Py(), CMovMat::Pz());
					D3DXVECTOR3	vdxDes( x, y, z );
	
					//dech code
					D3DXVECTOR3 Direction =  vdxSrc - vdxDes;

					//check for collish
					if( IsCollidedPlayer(&vdxDes,&Direction) )
					{
						FLOAT   fPosSclae = 500+m_fMovingVelocity*m_fMovingStep;
	
						D3DXVECTOR3 vMyPos(CMovMat::Px(),CMovMat::Py(),CMovMat::Pz());
						vMyPos = D3DXVECTOR3( x, y, z ) - vMyPos;
						  
						float fZ = -(float)sin((double)(fZeta*cs::ToRad));
						float fX =  (float)cos((double)(fZeta*cs::ToRad));
						vdxDes.x += fX * fPosSclae;
						vdxDes.z += fZ * fPosSclae;

						//dech code
						if
						( 
							m_oBullet0.Fire
							(
								CVector3f( Px()+(fX*18.f), Py()+6.f, Pz()+(fZ*18.f) ),
								CVector3f( vdxDes.x, vdxDes.y, vdxDes.z )
							)
						)
						{
							SetAnimationID( ANIM_Shoot, TRUE );
							m_fWaitTime = (float)CMath::RandomizeInt(0,2);
//							CSoundContainer::s_oSound[SOUND_SHOOT_000].Play();
						}
					}
//					CScene::s_oPlayer.DecreaseHP(1);
					if( CScene::s_oPlayer.IsDead() )
					{
						CScene::s_oPage = GAMEOVER;
					}

					// Go to next operation
					if( m_iNextOp != OP_ACTION )
					{
						// Go to next operation
						m_bIsDoingOp= FALSE;
						m_iCurrentOp= m_iNextOp;
						m_iNextOp	= OP_NULL;
						break;
					}
				}
				break;
							
				default:
				{
					// Go to next operation
					m_bIsDoingOp= FALSE;
					m_iCurrentOp= m_iNextOp;
					m_iNextOp	= OP_NULL;
				}
				break;
			}
						
			// Goal
			bOk = TRUE;
		}
	}

	CActor::Process( fElapsedTime );
	m_oBullet0.Process( fElapsedTime );
	m_oBullet1.Process( fElapsedTime );
//	CActor::FrameMove( fElapsedTime );

	if( !IsDead() )
		return TRUE;

	// die operation
  	if( m_iCurrentOp==OP_DIE )
	{
		if( ( !CDynamicModel::IsBlending() ) && 
			(  CDynamicModel::GetCurrentAnimationTime()>=CDynamicModel::GetCurrentMaxTime() ) )
		{
//			m_iDeadBling= 30;
			m_fLastTime = 0.f;
			m_iCurrentOp= OP_DEAD;
		}
	}
	else // after die operation
	if( (m_iDeadBling)&&(m_iCurrentOp==OP_DEAD) )
	{
		m_fLastTime += fElapsedTime;
		if( 0.01f<m_fLastTime )
		{
			m_iDeadBling--;
			m_fLastTime  = 0;//fElapsedTime;
		}
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
HRESULT CTina::Render( const D3DXMATRIX* matCustom )
{
	
//	glDisable( GL_STENCIL_TEST );
//	CTina::SetScale( 0.50f, 0.5f, 0.50f );
//	m_oBounding.SetScale( 0.50f, 0.5f, 0.50f );
//	if( IsDead() )
//		return TRUE;
	
	m_oBullet0.Render( matCustom );
	m_oBullet1.Render( matCustom );

	if( !IsDead() || (m_iCurrentOp==OP_DIE) )
	{
/*		glDisable(GL_LIGHTING);				 
		glEnable(GL_BLEND);
		glDepthMask(0);
		glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
		CMat matWorld;
		matWorld.Scale(	30.f, 30.f, 30.f );
		matWorld.Mul(&CScene::s_pMyGlApp->m_oCamera.GetBillboard());
//		matWorld.RotateX(90.f);
		matWorld.Translatef(Px(),Py(),Pz());
		glColor4f( 1.f, 1.f, 1.f, 0.5f );
		glBindTexture(GL_TEXTURE_2D, CScene::s_oTexture[TEXTURE_CLOUD].Get());
		glCallList( CEffectBillboard::m_DisplayListID );
		glDisable(GL_BLEND);
		glDepthMask(1);
*/
		CActor::Render( matCustom );
	}
	else
	if( IsDead()&&(m_iCurrentOp==OP_DEAD) )
	{
		if( m_iDeadBling%2 )
		{
			return TRUE;
		}
		glDisable(GL_LIGHTING);				 
		glEnable(GL_BLEND);
		glDepthMask(0);
		glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
		glColor4f( 1.f, 1.f, 1.f, 0.3f );
		CActor::Render( matCustom );
		glDepthMask(1);
		glDisable(GL_BLEND);	
	}

//	CActor::Render( matCustom );
	return TRUE;
}


HRESULT CTina::ProcessKey( FLOAT fElapsedTime, RECT rcScreen, BOOL* m_arKey )
{
	// Pick object process
	switch( IsPickedEnvObj() )
	{
		case ENVOBJ:
		{
			IncreaseHP(5);
			CSoundContainer::s_oSound[SOUND_CHARGE_000].Play();
			if( m_iHP == 100 )
			{
				CSoundContainer::s_oSound[SOUND_FULL_HEALTH].Play();
			}
			else
			{
				CSoundContainer::s_oSound[SOUND_HEALTH_UP].Play();
			}
		}
		break;

		case ENVOBJ1:
		{
			CSoundContainer::s_oSound[SOUND_CHARGE_001].Play();
			m_oBullet0.IncreaseHP(5);
			if( m_oBullet0.GetHP() == 100 )
			{
				CSoundContainer::s_oSound[SOUND_FORCE_FILL].Play();
			}
			else
			{
				CSoundContainer::s_oSound[SOUND_FORCE_FILL].Play();
			}
		}
		break;

		case ENVOBJ2:
		{
			CSoundContainer::s_oSound[SOUND_CHARGE_001].Play();
			m_oBullet1.IncreaseHP(5);
			if( m_oBullet1.GetHP() == 100 )
			{
				CSoundContainer::s_oSound[SOUND_FORCE_FILL].Play();
			}
			else
			{
				CSoundContainer::s_oSound[SOUND_FORCE_FILL].Play();
			}
		}
		break;
	}

	// Health warning...
	if(m_iHP <=15)
	{
		bool bWarning=false;
		m_fLastTime+=fElapsedTime;

		if( (m_iHP<5)&&(m_fLastTime>3.f) )
		{
			bWarning = true;
		}
		else if( m_fLastTime>7.5f )
		{
			bWarning = true;
		}

		if( bWarning )
		{
			CSoundContainer::s_oSound[SOUND_HEALTH_CRITICAL].Play();
			m_fLastTime=0.f;
		}
	}

	// Rotate Left
	if( m_arKey[VK_LEFT] )//|| (m_MouseX == 0) ) 
	{
		float zetha = CMovMat::Zetha();
		zetha  -= (m_fRotationVelocity*fElapsedTime);
		if( zetha < -180.f )
		{
			zetha += 360;
		}
		CMovMat::SetRotation(CMovMat::Row(), CMovMat::Phi(), zetha);
	}

	// Rotate Right
	if( m_arKey[VK_RIGHT] )//|| (m_MouseX == ScrWidth - 1) ) 
	{
		float zetha = CMovMat::Zetha();
		zetha  += (m_fRotationVelocity*fElapsedTime);
		if( zetha > 180.f )
		{
			zetha -= 360;
		}
		CMovMat::SetRotation(CMovMat::Row(), CMovMat::Phi(), zetha);
	}
	
	// Shooting
	if( m_arKey[VK_SPACE] ) 
	{
		// Add to temporary
		FLOAT   fPosSclae = 500+m_fMovingVelocity*m_fMovingStep;
		D3DXVECTOR3	vdxSrc= GetCurrent();
		D3DXVECTOR3	vdxDes= vdxSrc;

		float fZ = -(float)sin((double)(CMovMat::Zetha()*22.0/(7.0*180))) * fPosSclae;
		float fX = (float)cos((double)(CMovMat::Zetha()*22.0/(7.0*180))) * fPosSclae;

		vdxDes.x += fX;
		vdxDes.z += fZ;
		
		//dech code
		D3DXVECTOR3 Direction =  vdxSrc - vdxDes;
		if
		(
			m_oBullet0.Fire
			(
				CVector3f( Px(), Py(), Pz() ),
				CVector3f( vdxDes.x, vdxDes.y, vdxDes.z )
			)
		)
		{
			SetAnimationID( ANIM_Shoot, TRUE );
			m_fWaitTime = (float)CMath::RandomizeInt(0,2);
//			CSoundContainer::s_oSound[SOUND_SHOOT_000].Play();
		}

		m_bRenderFire = TRUE;
	}

	// Shooting
	if( m_arKey['B'] ) 
	{
		// Add to temporary
		FLOAT   fPosSclae = 500+m_fMovingVelocity*m_fMovingStep;
		D3DXVECTOR3	vdxSrc= GetCurrent();
		D3DXVECTOR3	vdxDes= vdxSrc;

		float fZ = -(float)sin((double)(CMovMat::Zetha()*22.0/(7.0*180))) * fPosSclae;
		float fX = (float)cos((double)(CMovMat::Zetha()*22.0/(7.0*180))) * fPosSclae;

		vdxDes.x += fX;
		vdxDes.z += fZ;
		
		//dech code
		D3DXVECTOR3 Direction =  vdxSrc - vdxDes;
		if
		(
			m_oBullet1.Fire
			(
				CVector3f( Px(), Py(), Pz() ),
				CVector3f( vdxDes.x, vdxDes.y, vdxDes.z )
			)
		)
		{
			SetAnimationID( ANIM_Shoot, TRUE );
			m_fWaitTime = (float)CMath::RandomizeInt(0,2);
//			CSoundContainer::s_oSound[SOUND_SHOOT_001].Play();
		}
	}

	if( m_iCurrentOp==OP_PAIN )
	{
		switch( CMath::RandomizeInt(1,100)%2 )
		{
			case 0: SetAnimationID(ANIM_Pain, TRUE); break;
			case 1: SetAnimationID(ANIM_Pain2,TRUE); break;
		}
					
		m_fWaitTime = (float)CMath::RandomizeInt(0,2);
		CSoundContainer::s_oSound[SOUND_WOMAN_PAIN00].Play();
		CSoundContainer::s_oSound[SOUND_BREATH_000].Play();
		m_iCurrentOp=OP_IDLE;
	}

	// Move Forward
	if( m_arKey[VK_UP]) 
	{
		float fZ = -(float)sin((double)(CMovMat::Zetha()*22.0/(7.0*180))) * m_fMovingStep * fElapsedTime;
		float fX = (float)cos((double)(CMovMat::Zetha()*22.0/(7.0*180))) * m_fMovingStep * fElapsedTime;
// 		float fY = m_fPivotY+CScene::GetHeight(x, CMovMat::Py(), z);
		//SetDestMoving( CMovMat::Px()+fX, CMovMat::Py(), CMovMat::Pz()+fZ );
		//CMovMat::SetPosition( CMovMat::Px()+fX, CMovMat::Py(), CMovMat::Pz()+fZ );
		//CMovMat::SetPosition( vTemp.x, vTemp.y, vTemp.z);
		CActor::Forward(60);
		if(m_CurrentAnimationID != OP_WALKTOXZ)
		{
			m_fWaitTime	 = 0.f;
			m_bIsDoingOp = TRUE;
			m_iCurrentOp = OP_WALKTOXZ;
			SetAnimationID( ANIM_Run, TRUE );
		}
		if(!CSoundContainer::s_oSound[SOUND_STEP_001].IsSoundPlaying())
		{
			m_fLastTime+=fElapsedTime;
			if( m_fLastTime>0.2f )
			{
				CSoundContainer::s_oSound[SOUND_STEP_001].Play();
				m_fLastTime=0.f;//fElapsedTime;
			}
		}
	}
	else
	if
	( 
		( !CDynamicModel::IsBlending() ) && 
		(  CDynamicModel::GetCurrentAnimationTime()>=CDynamicModel::GetCurrentMaxTime() ) &&
		( !IsMoving() )
	)
	{
//		CSoundContainer::s_oSound[SOUND_SHOOT_000].Play();
		SetAnimationID( ANIM_Idle, TRUE );
		m_fWaitTime = (float)CMath::RandomizeInt(0,2);
	}
//	else
	{
		CActor::Process( fElapsedTime );
		m_oBullet0.Process( fElapsedTime );
		m_oBullet1.Process( fElapsedTime );
	}

//Fire( CVector3f vSrc, CVector3f vDes )
	if( m_arKey['X'] )
	{
		CMovMat::SetPosition( CMovMat::Px()+1, CMovMat::Py(), CMovMat::Pz() );
	}
	if(m_arKey['Z'])
	{
		CMovMat::SetPosition( CMovMat::Px(), CMovMat::Py(), CMovMat::Pz()+1 );
	}
	if( m_arKey['S'] )
	{
		CMovMat::SetPosition( CMovMat::Px()-1, CMovMat::Py(), CMovMat::Pz() );
	}
	if(m_arKey['A'])
	{
		CMovMat::SetPosition( CMovMat::Px(), CMovMat::Py(), CMovMat::Pz()-1 );
	}
	FrameMove(fElapsedTime);

	return S_OK;
}

