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

#include "stdafx.h"
#include "Soldier.h"
#include "Engine\Util.h"
#include "Engine\Triangle.h"
#include "Engine\Camera.h"
#include "Engine\Sound.h"
#include "Engine\EffectBillboardlist.h"

extern CUseSounds GunSound2;
extern CUseSounds DieSound;
extern CEffectBillboardList CloudList;
extern int g_nAmbRed;
extern int g_nAmbGreen;
extern int g_nAmbBlue;


//==============Constructor and Destructor===========================
CSoldier::CSoldier()
{
//	CMovMat::SetUpToGnd( -0.01f );
	m_nHP = 100;
	m_PromptState = PROMPTSTATE_READY;

	m_pLand = NULL;
	m_CurrentAnimationID = AN_NULL;
	
	for( int i=0; i<__NumAnimation; i++ ) 
	{
		m_arAnimationFts[i] = 1.0f;
	}

	m_arAnimationFts[ AN_StandSit ] = 3.0f;
	m_arAnimationFts[ AN_StandCrouch ] = 3.0f;

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

	m_fDesX = 0.0f; 
	m_fDesZ = 0.0f;

	m_bDoingScriptOp = FALSE;
	m_nCurrentOp = 0;

	m_FirstDie = FALSE;

	// Shadow
	m_bUseShadow = FALSE;
	m_fWaitTime  = 0.0f;
	m_bRenderFire = FALSE;
}

CSoldier::~CSoldier()
{
	DestroyScript();
	CDObjModel::ClearModel();
}

void CSoldier::DecreaseHP(int HP)
{
	m_nHP -= HP;
	
	if( m_nHP < 0 ) 
	{
		m_nHP = 0;
	}
}

int  CSoldier::GetHP()
{
	return m_nHP;
}

BOOL CSoldier::IsDead()
{
	return (m_nHP <= 0);
}

//===================Land Function===================================
void	CSoldier::SetLand( CSLandModel *pLand )
{
	m_pLand = pLand;	
}

CSLandModel *CSoldier::GetLand()
{
	return m_pLand;
}

void CSoldier::GetCurrentTriangleInLand( CTriangle *pTriangle )
{
	ASSERT( m_pLand != NULL );
	
	BOOL bLayOnSuccess = LayOn( m_pLand );
	ASSERT( bLayOnSuccess );
	
	CacheTri.GetCurrentTriangle( pTriangle );
}

void CSoldier::GetCurrentNormal( D3DXVECTOR3 *pvCurrentNormal )
{
	CTriangle CurrentTriangle;
	GetCurrentTriangleInLand( &CurrentTriangle );
	*pvCurrentNormal = CurrentTriangle.GetNormalVec();
}

void    CSoldier::SetDestination( float fDesX, float fDesZ )
{
	m_fDesX = fDesX;
	m_fDesZ = fDesZ;
}

void    CSoldier::GetDestination( float *pfDesX, float *pfDesZ )
{
	*pfDesX = m_fDesX;
	*pfDesZ = m_fDesZ;
}

//================================Calculate Moving=====================================
BOOL CSoldier::CalculateMoving( float DelX, float DelZ, float Velocity, float fElapseTime )
{
	float fZeta;
	if ( DelZ == 0.0f )
	{
		if ( DelX > 0.0f )
		{
			fZeta = 90.0f;
		}
		else
		{
			fZeta = 270;
		}
	}
	else
	{
		fZeta = cs::ToDeg * float(atan(DelX/DelZ));

		if (DelZ < 0.0f)
		fZeta += 180.0f;
	}

	CMovMat::SetRotation( CMovMat::Row(),
						  CMovMat::Phi(),	
						  fZeta );


	D3DXVECTOR3 vCurrentNormal;
	GetCurrentNormal( &vCurrentNormal );
	D3DXMATRIX MatNormal;
	Mat::CalNMat( &MatNormal, &vCurrentNormal );


	D3DXVECTOR3 vTrueFront;
	Vec3::MulMat( &vTrueFront,
				  &D3DXVECTOR3( Math::Sinf( cs::ToRad * fZeta ),
				                                             0,
								Math::Cosf( cs::ToRad * fZeta ) ),
				  &MatNormal );																	 
    D3DXVECTOR3 vTrueFrontNormalize;
	Vec3::Normalize( &vTrueFrontNormalize, &vTrueFront );

	D3DXVECTOR3 vTrueFrontXZ = D3DXVECTOR3( vTrueFront.x,
				                                       0,
											vTrueFront.z ); 
	float DistScale = Vec3::Length( &vTrueFrontXZ );
	//TRACE("%f\n", DistScale );
	float Distance = Velocity * fElapseTime * DistScale;
	float dx = Distance * Math::Sinf( cs::ToRad * fZeta );
	float dz = Distance * Math::Cosf( cs::ToRad * fZeta );
	
	float fPosX = CMovMat::Px() + dx;
	float fPosZ = CMovMat::Pz() + dz;

	if (DelX < 0.0f)
	{
		if (fPosX < m_fDesX)
		{
			fPosX = m_fDesX;
		}
	}
	else
	{
		if (fPosX > m_fDesX)
		{
			fPosX = m_fDesX;
		}
	}

	if (DelZ < 0.0f)
	{
		if (fPosZ < m_fDesZ)
		{
			fPosZ = m_fDesZ;
		}
	}
	else
	{
		if (fPosZ > m_fDesZ)
		{
			fPosZ = m_fDesZ;
		}
	}

	CMovMat::SetPosition( fPosX, 0, fPosZ );
	return LayOn( m_pLand );	
}

void CSoldier::FaceTo( float X, float Z )
{
	float DelX = X - CMovMat::Px();
	float DelZ = Z - CMovMat::Pz();
	
	if ( ( DelX == 0 ) && ( DelZ == 0 ) )
	{
		return;
	}

	float fZeta;
	if ( DelZ == 0.0f )
	{
		if ( DelX > 0.0f )
		{
			fZeta = 90.0f;
		}
		else
		{
			fZeta = 270;
		}
	}
	else
	{
		fZeta = cs::ToDeg * float(atan(DelX/DelZ));

		if (DelZ < 0.0f)
		fZeta += 180.0f;
	}

	CMovMat::SetRotation( CMovMat::Row(),
						  CMovMat::Phi(),	
						  fZeta );
}

//==================Process and Render===============================
BOOL CSoldier::Process( float fElapseTime )
{
	BOOL bOk = FALSE;

	if( m_PromptState = PROMPTSTATE_READY )
	{
		if( !IsDead() )
		{
			// Read Script
			if (!m_bDoingScriptOp)
			{
				m_bDoingScriptOp = TRUE;
				COp *pOp = (COp *)m_Script[m_nCurrentOp];
				int OpID = pOp->GetOpID(); 

				switch( OpID )
				{
					case OP_WALKTOXZ:
					{
						SetAnimationID( AN_Walk, TRUE );
						float fDesX = pOp->GetOpFloat(0); // DesX
						float fDesZ = pOp->GetOpFloat(1); // DesZ	
						SetDestination( fDesX, fDesZ );
						break;
					}
					case OP_RUNTOXZ:
					{
						SetAnimationID( AN_Run, TRUE );
						float fDesX = pOp->GetOpFloat(0); // DesX
						float fDesZ = pOp->GetOpFloat(1); // DesZ
						SetDestination( fDesX, fDesZ );			
						break;
					}
					case OP_CREEPTOXZ:
					{
						SetAnimationID( AN_Creep, TRUE );
						float fDesX = pOp->GetOpFloat(0); // DesX
						float fDesZ = pOp->GetOpFloat(1); // DesZ			
						SetDestination( fDesX, fDesZ );
						break;		
					}
					case OP_FACETO:
					{
						float fDesX = pOp->GetOpFloat(0); // DesX
						float fDesZ = pOp->GetOpFloat(1); // DesZ			
						FaceTo( fDesX, fDesZ );
						return TRUE;
					}
					case OP_CROUCH:
					{
						switch( AN_TYPE[m_CurrentAnimationID] )
						{
							case AN_TYPE_STAND:
							{
								SetAnimationID( AN_StandCrouch, TRUE );						
								break;
							}
							case AN_TYPE_SIT:
							{
								SetAnimationID( AN_SitCrouch, TRUE );	
								break;
							}
							case AN_TYPE_CROUCH:
							{
								m_bDoingScriptOp = FALSE;					
								return TRUE;
							}
						}
						break;
					}
					case OP_SIT:
					{
						switch( AN_TYPE[m_CurrentAnimationID] )
						{
							case AN_TYPE_STAND:
							{
								SetAnimationID( AN_StandSit, TRUE );							
								break;
							}
							case AN_TYPE_SIT:
							{
								m_bDoingScriptOp = FALSE;					
								return TRUE;
							}
							case AN_TYPE_CROUCH:
							{
								SetAnimationID( AN_CrouchSit, TRUE );						
								break;
							}
						}				
						break;
					}
					case OP_STAND:
					{
						switch( AN_TYPE[m_CurrentAnimationID] )
						{
							case AN_TYPE_STAND:
							{
								m_bDoingScriptOp = FALSE;					
								return TRUE;
							}
							case AN_TYPE_SIT:
							{
								SetAnimationID( AN_SitStand, TRUE );						
								break;
							}
							case AN_TYPE_CROUCH:
							{
								SetAnimationID( AN_CrouchStand, TRUE );					
								break;
							}
						}				
						break;
					}
					case OP_GUNUP:
					{
						SetAnimationID( AN_GunUp, TRUE );
						break;
					}
					case OP_GUNDOWN:
					{
						SetAnimationID( AN_GunDown, TRUE );
						break;
					}
					case OP_FIRE:
					{
						m_bRenderFire = TRUE;
						GunSound2.Play();
						switch( AN_TYPE[m_CurrentAnimationID] )
						{
							case AN_TYPE_STAND:
							{
								SetAnimationID( AN_StandFire, FALSE );					
								return TRUE;
							}
							case AN_TYPE_SIT:
							{
								SetAnimationID( AN_SitFire, FALSE );						
								break;
							}
							case AN_TYPE_CROUCH:
							{
								SetAnimationID( AN_CrouchFire, FALSE );					
								break;
							}
						}				
						break;
					}

					case OP_WAIT:
					{
						m_fWaitTime = pOp->GetOpFloat(0);
						switch( AN_TYPE[m_CurrentAnimationID] )
						{
							case AN_TYPE_STAND:
							{
								SetAnimationID( AN_StandStop, FALSE );					
								return TRUE;
							}
							case AN_TYPE_SIT:
							{
								SetAnimationID( AN_SitStop, FALSE );						
								break;
							}
							case AN_TYPE_CROUCH:
							{
								SetAnimationID( AN_CrouchStop, FALSE );					
								break;
							}
						}				
						break;
					}

				}
			}

			// Moving Animation
			if( AN_IS_MOVING[ m_CurrentAnimationID ] )
			{
				float Velocity = 0.0f;
				switch( m_CurrentAnimationID )
				{
					// Moving 
					case AN_Walk:
					{
						Velocity = m_fWalkVelocity;
						break;
					}
					case AN_WalkHobble:
					{
						Velocity = m_fWalkHobbleVelocity;
						break;
					}
					case AN_Run :
					{
						Velocity = m_fRunVelocity;
						break;
					}
					case AN_RunLeft: 
					{
						Velocity = m_fRunLeftVelocity;
						break;
					}
					case AN_RunRight: 
					{
						Velocity = m_fRunRightVelocity;
						break;
					}
					case AN_Creep:
					{
						Velocity = m_fCreepVelocity;
						break;
					}
				}

				if( !CDynamicModel::IsBlending() )
				{
					// Move
					// First Check If Reach to Destination
					float DelX = m_fDesX - CMovMat::Px();
					float DelZ = m_fDesZ - CMovMat::Pz();
					
					if ( ( DelX == 0 ) && ( DelZ == 0 ) )
					{
						// Goal
						bOk = TRUE;
						//SetAnimationToStop(TRUE);
						m_bDoingScriptOp = FALSE;
						DoNextOp();
					}
					else
					{
						// Calculate Moving
						bOk = CalculateMoving( DelX, DelZ, Velocity, fElapseTime );
						ASSERT( bOk );
						if( !bOk )
						{
							Log( "Move Error In CSoldier::Process( float fElapseTime ) " );
						}
					}
				}
			}
			// Not Moving Animation
		    else if( AN_IS_STOP[m_CurrentAnimationID] )
			{
				if( ( !CDynamicModel::IsBlending() ) && 
					(  CDynamicModel::GetCurrentAnimationTime() >= m_fWaitTime ) )
				{
					bOk = TRUE;
					//SetAnimationToStop();
					m_bDoingScriptOp = FALSE;
					DoNextOp();
				}
			}
			else 
			{
				if( ( !CDynamicModel::IsBlending() ) && 
					(  CDynamicModel::GetCurrentAnimationTime() >= CDynamicModel::GetCurrentMaxTime() ) )
				{
					bOk = TRUE;
					//SetAnimationToStop();
					m_bDoingScriptOp = FALSE;
					DoNextOp();
				}
				
			}
		}
		// Dead
		else
		{
			if( !m_FirstDie )
			{
				DieSound.Play();
				switch( AN_TYPE[m_CurrentAnimationID] )
				{
					case AN_TYPE_STAND:
					{
						m_FirstDie = TRUE;
						SetAnimationID( AN_DieBack, TRUE ); // Have Bug whan FALSE						
						break;
					}
					case AN_TYPE_SIT:
					{
						m_FirstDie = TRUE;
						SetAnimationID( AN_SitDie, TRUE );	
						break;
					}
					case AN_TYPE_CROUCH:
					{
						m_FirstDie = TRUE;
						SetAnimationID( AN_CrouchDie, TRUE );						
						break;
					}
				}
			}

			if( ( !CDynamicModel::IsBlending() ) && 
				(  CDynamicModel::GetCurrentAnimationTime() >= CDynamicModel::GetCurrentMaxTime() ) )
			{
				m_PromptState = PROMPTSTATE_END;
			}
		}
	}

	CDObjModel::Process( fElapseTime );
	return TRUE;
}

HRESULT CSoldier::Render( const D3DXMATRIX* matCustom )
{
	
	if( m_bUseShadow )
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

	glDisable( GL_STENCIL_TEST );
	CDObjModel::Render( matCustom );

    if( m_bRenderFire )
	{
		CTriangle Triangle;
		GetTriangle( 907, &Triangle );
		
		/*
        char sz[255];
		sprintf( sz, "%f %f %f", Triangle.GetV0().x,Triangle.GetV0().y,Triangle.GetV0().z );
		Log(sz);
		*/

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
	return TRUE;
}

//=================Load and Destroy Script===========================
BOOL CSoldier::LoadScript( const CString& strScrFileName )
{
	// First Land Must Load and Install before LoadScript
	ASSERT( m_pLand );
	DestroyScript();	
	CStdioFile fp( strScrFileName, CFile::modeRead );

	if( fp )
	{
		CString str;
		fp.ReadString( str );
		if( strcmp( str, "Maetee Supreanruey and Anusorn Krasantisuk format" ) != 0 )
		{
			char sz[255];
			sprintf( sz, "Error file format name <%s>", strScrFileName );
			Log(sz);
			fp.Close();
			return FALSE;
		}

		fp.ReadString( str );
		
		// Read Information Header
		fp.ReadString( str );
		str.MakeUpper();
		CString strHeader = String::Token( str, 1, " =(),/\t" );
		
		while( strHeader != "ENDFILE" )
		{
			if( strHeader == "INFORMATION" )
			{
				fp.ReadString( str );
				str.MakeUpper();
				while ( String::Token( str, 1, " =(),/\t" ) != "END" )
				{
					CString strCommand = String::Token( str, 1, " =(),/\t" );
					if( strCommand == "MODEL" )
					{
						CString ModelPath = String::Token( str, 2, " =(),/\t" );
						LoadModel( ModelPath );
					}
					else
					if( strCommand == "PARTDEF" )
					{
						CString PartDefPath = String::Token( str, 2, " =(),/\t" );
						UsePartDef( PartDefPath );
					}
					else
					if( strCommand == "NAME" )
					{
						m_strName = String::Token( str, 2, " =(),/\t" );
					}
					else 
					if( strCommand == "WALKPARAM" )
					{
						CString strWalkStepDistance = String::Token( str, 2, " =(),/\t" );
						CString strWalkVelocity     = String::Token( str, 3, " =(),/\t" );
						float   fWalkStepDistance   = float(atof( strWalkStepDistance ));
						float   fWalkVelocity       = float(atof( strWalkVelocity ));

						SetWalkParam( fWalkStepDistance, fWalkVelocity );	
					}
					else
					if( strCommand == "WALKHOBBLEPARAM" )
					{
						CString strWalkHobbleStepDistance = String::Token( str, 2, " =(),/\t" );
						CString strWalkHobbleVelocity     = String::Token( str, 3, " =(),/\t" );
						float   fWalkHobbleStepDistance   = float(atof( strWalkHobbleStepDistance ));
						float   fWalkHobbleVelocity       = float(atof( strWalkHobbleVelocity ));

						SetWalkHobbleParam( fWalkHobbleStepDistance, fWalkHobbleVelocity );	
					}
					else
					if( strCommand == "RUNPARAM" )
					{
						CString strRunStepDistance = String::Token( str, 2, " =(),/\t" );
						CString strRunVelocity     = String::Token( str, 3, " =(),/\t" );
						float   fRunStepDistance   = float(atof( strRunStepDistance ));
						float   fRunVelocity       = float(atof( strRunVelocity ));

						SetRunParam( fRunStepDistance, fRunVelocity );	
					}
					else
					if( strCommand == "CREEPPARAM" )
					{
						CString strCreepStepDistance = String::Token( str, 2, " =(),/\t" );
						CString strCreepVelocity     = String::Token( str, 3, " =(),/\t" );
						float   fCreepStepDistance   = float(atof( strCreepStepDistance ));
						float   fCreepVelocity       = float(atof( strCreepVelocity ));

						SetCreepParam( fCreepStepDistance, fCreepVelocity );	
					}
					else
					if( strCommand == "STARTPOSITION" )
					{
						CString strPx = String::Token( str, 2, " =(),/\t" );
						CString strPz = String::Token( str, 3, " =(),/\t" );
						float   fPx   = float(atof( strPx ));
						float   fPz   = float(atof( strPz ));	
						
						CMovMat::SetPosition( fPx, 0, fPz );
						BOOL bOK = LayOn( m_pLand );
						ASSERT( bOK );
					}

					fp.ReadString( str );
					str.MakeUpper();
				}
				// Str == End
			}
			else
			if( strHeader == "BEGINSCRIPT" )
			{
				fp.ReadString( str );
				str.MakeUpper();
				while ( String::Token( str, 1, " =(),/\t" ) != "END" )
				{
					CString strCommand = String::Token( str, 1, " =(),/\t" );

					if( strCommand == "WALKTOXZ" )
					{
						CString strPx = String::Token( str, 2, " =(),/\t" );
						CString strPz = String::Token( str, 3, " =(),/\t" );
						float   fPx   = float(atof( strPx ));
						float   fPz   = float(atof( strPz ));	
						
						COp *pOp = new COp;
						pOp->ReserveOpFloat( 2 );
						pOp->SetOpID( CSoldier::OP_WALKTOXZ );
						pOp->SetOpFloat( 0, fPx );
						pOp->SetOpFloat( 1, fPz );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "RUNTOXZ" )
					{
						CString strPx = String::Token( str, 2, " =(),/\t" );
						CString strPz = String::Token( str, 3, " =(),/\t" );
						float   fPx   = float(atof( strPx ));
						float   fPz   = float(atof( strPz ));	
						
						COp *pOp = new COp;
						pOp->ReserveOpFloat( 2 );
						pOp->SetOpID( CSoldier::OP_RUNTOXZ );
						pOp->SetOpFloat( 0, fPx );
						pOp->SetOpFloat( 1, fPz );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "CREEPTOXZ" )
					{
						CString strPx = String::Token( str, 2, " =(),/\t" );
						CString strPz = String::Token( str, 3, " =(),/\t" );
						float   fPx   = float(atof( strPx ));
						float   fPz   = float(atof( strPz ));	
						
						COp *pOp = new COp;
						pOp->ReserveOpFloat( 2 );
						pOp->SetOpID( CSoldier::OP_CREEPTOXZ );
						pOp->SetOpFloat( 0, fPx );
						pOp->SetOpFloat( 1, fPz );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "FACETO" )
					{
						CString strPx = String::Token( str, 2, " =(),/\t" );
						CString strPz = String::Token( str, 3, " =(),/\t" );
						float   fPx   = float(atof( strPx ));
						float   fPz   = float(atof( strPz ));	
						
						COp *pOp = new COp;
						pOp->ReserveOpFloat( 2 );
						pOp->SetOpID( CSoldier::OP_FACETO );
						pOp->SetOpFloat( 0, fPx );
						pOp->SetOpFloat( 1, fPz );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "CROUCH" )
					{
						COp *pOp = new COp;
						pOp->SetOpID( CSoldier::OP_CROUCH );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "SIT" )
					{
						COp *pOp = new COp;
						pOp->SetOpID( CSoldier::OP_SIT );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "STAND" )
					{
						COp *pOp = new COp;
						pOp->SetOpID( CSoldier::OP_STAND );

						m_Script.Add( pOp );
					}	
					else
					
					if( strCommand == "GUNUP" )
					{
						COp *pOp = new COp;
						pOp->SetOpID( CSoldier::OP_GUNUP );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "GUNDOWN" )
					{
						COp *pOp = new COp;
						pOp->SetOpID( CSoldier::OP_GUNDOWN );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "FIRE" )
					{
						COp *pOp = new COp;
						pOp->SetOpID( CSoldier::OP_FIRE );

						m_Script.Add( pOp );
					}
					else
					if( strCommand == "WAIT" )
					{
						CString strSecond = String::Token( str, 2, " =(),/\t" );
						float   fSecond   = float(atof( strSecond ));
						
						COp *pOp = new COp;
						pOp->ReserveOpFloat( 1 );
						pOp->SetOpID( CSoldier::OP_WAIT );
						pOp->SetOpFloat( 0, fSecond );

  						m_Script.Add( pOp );
					}					
					fp.ReadString( str );
					str.MakeUpper();
				}
				// Str == End
			}

			fp.ReadString( str );
			str.MakeUpper();
			strHeader = String::Token( str, 1, " =(),/\t" );
		}

		fp.Close();
	}	

	return TRUE;
}

void CSoldier::DoNextOp()
{
	if( m_nCurrentOp < m_Script.GetUpperBound() )
	{
		m_nCurrentOp++;
	}
	else
	{
		m_nCurrentOp = 0;
	}
}

void CSoldier::DestroyScript()
{
	int nBound  = m_Script.GetUpperBound();

	for ( int nCount = 0; nCount <= nBound; nCount++ )
	{
		delete ((COp *)m_Script.GetAt(nCount));
	}

	m_Script.RemoveAll();
}

//=========================== Animation =========================================
BOOL CSoldier::SetAnimationID( ANIMATION AnimationID, 
							   BOOL  bBlend, 
							   float fFinishBlendTime )
{
	BOOL bOk = CDynamicModel::SetAnimation( __szAnimation[AnimationID], bBlend, fFinishBlendTime );

	if( bOk )
	{
		CDynamicModel::SetTimeScale( m_arAnimationFts[AnimationID] );
		m_CurrentAnimationID = AnimationID;
		return TRUE;
	}

	return FALSE;
}

void CSoldier::SetAnimationToStop( BOOL  bBlend, 
					               float fFinishBlendTime )
{
	
	switch ( AN_TYPE[m_CurrentAnimationID] )
	{
		case AN_TYPE_STAND:
			SetAnimationID( AN_StandStop,  bBlend, fFinishBlendTime );
			return;
		case AN_TYPE_SIT:
			SetAnimationID( AN_SitStop,    bBlend, fFinishBlendTime );
			return;
		case AN_TYPE_CROUCH:
			SetAnimationID( AN_CrouchStop, bBlend, fFinishBlendTime );
			return;
	}

	ASSERT(FALSE);
	Log("Error In CSoldier::SetAnimationToStop" );
}

float CSoldier::GetAnimationFts( ANIMATION AnimationID )
{
	return m_arAnimationFts[AnimationID];
}

//========================= Set Animation Parameter Function =================================
void  CSoldier::SetWalkParam( float fWalkStepDistance, 
							  float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_Walk] ) );

	m_fWalkStepDistance = fWalkStepDistance;
	m_fWalkVelocity     = fVelocity;
	
	float fMaxTimeWalk  = GetAnimationMaxtime( __szAnimation[AN_Walk] );

	// Calculate Walk Time Scale
	m_arAnimationFts[AN_Walk] = ( m_fWalkVelocity * fMaxTimeWalk ) / m_fWalkStepDistance;
}

void  CSoldier::SetWalkVelocity( float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_Walk] ) );

	m_fWalkVelocity     = fVelocity;
	
	float fMaxTimeWalk  = GetAnimationMaxtime( __szAnimation[AN_Walk] );

	// Calculate Walk Time Scale
	m_arAnimationFts[AN_Walk] = ( m_fWalkVelocity * fMaxTimeWalk ) / m_fWalkStepDistance;	
}

// Get Animation Parameter Function
void  CSoldier::GetWalkParam( float*   pfWalkStepDistance, 
							  float*   pfVelocity )
{
	if( pfWalkStepDistance )
	{
		*pfWalkStepDistance = m_fWalkStepDistance;
	}
	if( pfVelocity )
	{
		*pfVelocity = m_fWalkVelocity;
	}
}

void  CSoldier::SetWalkHobbleParam( float fWalkHobbleStepDistance, 
							  float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_WalkHobble] ) );

	m_fWalkHobbleStepDistance = fWalkHobbleStepDistance;
	m_fWalkHobbleVelocity     = fVelocity;
	
	float fMaxTimeWalkHobble  = GetAnimationMaxtime( __szAnimation[AN_WalkHobble] );

	// Calculate WalkHobble Time Scale
	m_arAnimationFts[AN_WalkHobble] = ( m_fWalkHobbleVelocity * fMaxTimeWalkHobble ) / m_fWalkHobbleStepDistance;
}

void  CSoldier::SetWalkHobbleVelocity( float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_WalkHobble] ) );

	m_fWalkHobbleVelocity     = fVelocity;
	
	float fMaxTimeWalkHobble  = GetAnimationMaxtime( __szAnimation[AN_WalkHobble] );

	// Calculate WalkHobble Time Scale
	m_arAnimationFts[AN_WalkHobble] = ( m_fWalkHobbleVelocity * fMaxTimeWalkHobble ) / m_fWalkHobbleStepDistance;	
}

// Get Animation Parameter Function
void  CSoldier::GetWalkHobbleParam( float*   pfWalkHobbleStepDistance, 
							  float*   pfVelocity )
{
	if( pfWalkHobbleStepDistance )
	{
		*pfWalkHobbleStepDistance = m_fWalkHobbleStepDistance;
	}
	if( pfVelocity )
	{
		*pfVelocity = m_fWalkHobbleVelocity;
	}
}

void  CSoldier::SetRunParam( float fRunStepDistance, 
							  float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_Run] ) );

	m_fRunStepDistance = fRunStepDistance;
	m_fRunVelocity     = fVelocity;
	
	float fMaxTimeRun  = GetAnimationMaxtime( __szAnimation[AN_Run] );

	// Calculate Run Time Scale
	m_arAnimationFts[AN_Run] = ( m_fRunVelocity * fMaxTimeRun ) / m_fRunStepDistance;
}

void  CSoldier::SetRunVelocity( float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_Run] ) );

	m_fRunVelocity     = fVelocity;
	
	float fMaxTimeRun  = GetAnimationMaxtime( __szAnimation[AN_Run] );

	// Calculate Run Time Scale
	m_arAnimationFts[AN_Run] = ( m_fRunVelocity * fMaxTimeRun ) / m_fRunStepDistance;	
}

// Get Animation Parameter Function
void  CSoldier::GetRunParam( float*   pfRunStepDistance, 
							  float*   pfVelocity )
{
	if( pfRunStepDistance )
	{
		*pfRunStepDistance = m_fRunStepDistance;
	}
	if( pfVelocity )
	{
		*pfVelocity = m_fRunVelocity;
	}
}

void  CSoldier::SetRunLeftParam( float fRunLeftStepDistance, 
							  float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_RunLeft] ) );

	m_fRunLeftStepDistance = fRunLeftStepDistance;
	m_fRunLeftVelocity     = fVelocity;
	
	float fMaxTimeRunLeft  = GetAnimationMaxtime( __szAnimation[AN_RunLeft] );

	// Calculate RunLeft Time Scale
	m_arAnimationFts[AN_RunLeft] = ( m_fRunLeftVelocity * fMaxTimeRunLeft ) / m_fRunLeftStepDistance;
}

void  CSoldier::SetRunLeftVelocity( float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_RunLeft] ) );

	m_fRunLeftVelocity     = fVelocity;
	
	float fMaxTimeRunLeft  = GetAnimationMaxtime( __szAnimation[AN_RunLeft] );

	// Calculate RunLeft Time Scale
	m_arAnimationFts[AN_Run] = ( m_fRunLeftVelocity * fMaxTimeRunLeft ) / m_fRunLeftStepDistance;	
}

// Get Animation Parameter Function
void  CSoldier::GetRunLeftParam( float*   pfRunLeftStepDistance, 
							  float*   pfVelocity )
{
	if( pfRunLeftStepDistance )
	{
		*pfRunLeftStepDistance = m_fRunLeftStepDistance;
	}
	if( pfVelocity )
	{
		*pfVelocity = m_fRunLeftVelocity;
	}
}

void  CSoldier::SetRunRightParam( float fRunRightStepDistance, 
							  float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_RunRight] ) );

	m_fRunRightStepDistance = fRunRightStepDistance;
	m_fRunRightVelocity     = fVelocity;
	
	float fMaxTimeRunRight  = GetAnimationMaxtime( __szAnimation[AN_RunRight] );

	// Calculate RunRight Time Scale
	m_arAnimationFts[AN_RunRight] = ( m_fRunRightVelocity * fMaxTimeRunRight ) / m_fRunRightStepDistance;
}

void  CSoldier::SetRunRightVelocity( float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_RunRight] ) );

	m_fRunRightVelocity     = fVelocity;
	
	float fMaxTimeRunRight  = GetAnimationMaxtime( __szAnimation[AN_RunRight] );

	// Calculate RunRight Time Scale
	m_arAnimationFts[AN_RunRight] = ( m_fRunRightVelocity * fMaxTimeRunRight ) / m_fRunRightStepDistance;	
}

// Get Animation Parameter Function
void  CSoldier::GetRunRightParam( float*   pfRunRightStepDistance, 
							  float*   pfVelocity )
{
	if( pfRunRightStepDistance )
	{
		*pfRunRightStepDistance = m_fRunRightStepDistance;
	}
	if( pfVelocity )
	{
		*pfVelocity = m_fRunRightVelocity;
	}
}

void  CSoldier::SetCreepParam( float fCreepStepDistance, 
							  float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_Creep] ) );

	m_fCreepStepDistance = fCreepStepDistance;
	m_fCreepVelocity     = fVelocity;
	
	float fMaxTimeCreep  = GetAnimationMaxtime( __szAnimation[AN_Creep] );

	// Calculate Creep Time Scale
	m_arAnimationFts[AN_Creep] = ( m_fCreepVelocity * fMaxTimeCreep ) / m_fCreepStepDistance;
}

void  CSoldier::SetCreepVelocity( float fVelocity )
{
	ASSERT( CDynamicModel::IsHaveAnimation( __szAnimation[AN_Creep] ) );

	m_fCreepVelocity     = fVelocity;
	
	float fMaxTimeCreep  = GetAnimationMaxtime( __szAnimation[AN_Creep] );

	// Calculate Creep Time Scale
	m_arAnimationFts[AN_Creep] = ( m_fCreepVelocity * fMaxTimeCreep ) / m_fCreepStepDistance;	
}

// Get Animation Parameter Function
void  CSoldier::GetCreepParam( float*   pfCreepStepDistance, 
							  float*   pfVelocity )
{
	if( pfCreepStepDistance )
	{
		*pfCreepStepDistance = m_fCreepStepDistance;
	}
	if( pfVelocity )
	{
		*pfVelocity = m_fCreepVelocity;
	}
}

// Shadow
BOOL CSoldier::UseShadow()
{
	if( !m_bUseShadow )
	{
		m_ShadowCylinder.LoadModel("Frame\\ShadowCylinder.Maf");
		m_TexShadow.Use( "Texture\\Shadow.tga" );
		m_bUseShadow = TRUE;
	}

	return TRUE;
}

BOOL CSoldier::UnUseShadow()
{
	if( m_bUseShadow )
	{
		m_ShadowCylinder.ClearModel();
		m_TexShadow.UnUse();
		m_bUseShadow = FALSE;
	}

	return TRUE;
}

//================================================================================================================
// Class CSoldier List
//================================================================================================================
CSoldierList::CSoldierList()
{
	m_pLand = NULL;
}

CSoldierList::~CSoldierList()
{
	DestroyAllSoldier();
}

void CSoldierList::DestroyAllSoldier()
{
	int nBound  = m_arSoldier.GetUpperBound();

	for ( int nCount = 0; nCount <= nBound; nCount++ )
	{
		delete ((CSoldier *)m_arSoldier.GetAt(nCount));
	}

	m_arSoldier.RemoveAll();
}

BOOL CSoldierList::AddSoldier( CString strScriptName )
{
	ASSERT( m_pLand );
	CSoldier *pSoldier = new CSoldier;
	pSoldier->SetLand( m_pLand );
	pSoldier->LoadScript( strScriptName );
	pSoldier->SetAnimationID( CSoldier::AN_Walk );
	pSoldier->UseShadow();
	m_arSoldier.Add( pSoldier );
	return TRUE;
}

int  CSoldierList::GetNumSoldier()
{
	return m_arSoldier.GetUpperBound()+1;
}

BOOL    CSoldierList::Process( float fElapseTime )
{
	int nBound = m_arSoldier.GetUpperBound();
	for( int i = 0; i <= nBound; i++ )
	{
		CSoldier *pSoldier = (CSoldier *)m_arSoldier[i];
		BOOL bOk = pSoldier->Process( fElapseTime );
		ASSERT( bOk );
	}

	return TRUE;
}

HRESULT CSoldierList::Render( CCamera *pCamera )
{
	D3DXVECTOR3 vEyeAt     = pCamera->GetEyePt();
	D3DXVECTOR3 vLookAt	   = pCamera->GetLookatPt();
	D3DXVECTOR3 vEyeLookAt = D3DXVECTOR3( 
											vLookAt.x - vEyeAt.x , 
											vLookAt.y - vEyeAt.y , 
											vLookAt.z - vEyeAt.z 
										 );

	float ex = vEyeAt.x;
	float ey = vEyeAt.y;
	float ez = vEyeAt.z;

	D3DXVECTOR3 vDir  = pCamera->GetViewDir();
	D3DXVECTOR3 vToSoldier = cs::v3Zero;

	int nBound = m_arSoldier.GetUpperBound();
	for( int i = 0; i <= nBound; i++ )
	{
		CSoldier *pSoldier = (CSoldier *)m_arSoldier[i];
		
		float px = pSoldier->CMovMat::Px();
		float py = pSoldier->CMovMat::Py();
		float pz = pSoldier->CMovMat::Pz();

		vToSoldier = D3DXVECTOR3( px - ex,
							      py - ey,
								  pz - ez );

		float Angle = float(Vec3::RetAngleDeg( &vToSoldier, &vDir ));

		if( Tool::GetDistance( px, py, pz, ex, ey, ez ) < 400 )
		{
			//if ( (Angle*cs::ToDeg) < 10.0f )
			if( Angle < 60.0f ) pSoldier->Render();	
		}
	}
	
	return S_OK;
}

void CSoldierList::SetLand( CSLandModel *pLand )
{
	m_pLand = pLand;
}

CSLandModel *CSoldierList::GetLand()
{
	return m_pLand;
}

CSoldier* CSoldierList::RayTest( const D3DXVECTOR3& RayOrigin,
							     const D3DXVECTOR3& RayDirection, 
						         // Out
								 int*       pFaceIndex,
								 CTriangle* pTriangle,
								 FLOAT*	   pDistance, 
								 FLOAT*	   pU, 
								 FLOAT*    pV )
{
	int       IndexMinSoldier;
	int       MinFaceIndex;
	CTriangle MinTriangle;
	float     MinDistance;
	float     MinU;
	float     MinV;

	int       TmpFaceIndex;
	CTriangle TmpTriangle;
	float     TmpDistance;
	float     TmpU;
	float     TmpV;

	BOOL bFound = FALSE;

	int nBound = m_arSoldier.GetUpperBound();
	for( int i = 0; i <= nBound; i++ )
	{
		CSoldier *pSoldier = (CSoldier *)m_arSoldier[i];
		if( pSoldier->RayTest( RayOrigin,
							   RayDirection,  
							   // Out
							   &TmpFaceIndex,
							   &TmpTriangle,
							   &TmpDistance, 
							   &TmpU, 
							   &TmpV ) )
		{
			if( !bFound )
			{
				IndexMinSoldier = i;
				MinFaceIndex    = TmpFaceIndex;
				MinTriangle.SetTriangle( TmpTriangle.GetV0(),
										 TmpTriangle.GetV1(),
										 TmpTriangle.GetV2() );
				MinDistance     = TmpDistance;
				MinU            = TmpU;
				MinV            = TmpV;

				// Set bFound True
				bFound          = TRUE;
			}
			else // if bFound
			{
				if( TmpDistance < MinDistance )
				{
					IndexMinSoldier = i;
					MinFaceIndex    = TmpFaceIndex;
					MinTriangle.SetTriangle( TmpTriangle.GetV0(),
											 TmpTriangle.GetV1(),
											 TmpTriangle.GetV2() );
					MinDistance     = TmpDistance;
					MinU            = TmpU;
					MinV            = TmpV;					
				}
			}
		}
	}
	
	if( !bFound )
	{
		return NULL;
	}

	// Found
	if( pFaceIndex )
	{
		*pFaceIndex = MinFaceIndex;
	}
	if( pTriangle )
	{
		pTriangle->SetTriangle( MinTriangle.GetV0(),  
								MinTriangle.GetV1(),
								MinTriangle.GetV2() );
	}
	if( pDistance )
	{
		*pDistance = MinDistance;
	}
	if( pU )
	{
		*pU = MinU;
	}
	if( pV )
	{
		*pV = MinV;
	}

	return (CSoldier *)m_arSoldier[IndexMinSoldier];
}

