//----------------------------------------------------------------------------------------
// Actor.cpp: implementation of the CActor class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "Actor.h"
#include "Scene.h"
#include "SoundContainer.h"


//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------



/*
------------+-----------------------------------------------------------------------------
 Function	| CActor
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CActor::CActor()
{
	// Set information
	m_strName;
	m_iHP				= 100;
	m_eActorType		= BASE;

	// Orientation height pivot relative value from loding data
	m_fPivotY			= 0.0f;

	// Specific moving data
	m_fDestX			= 0.f; 
	m_fDestY			= 0.f; 
	m_fDestZ			= 0.f;
	m_fMovingVelocity	= 1.f;
	m_fMovingStep		= 1.f;
	
	// Specific ratation data
//	m_fCurrZeta			= 0.0f;
//	m_fDestZeta			= 0.0f;
	m_fRotate			= 0.f;
	m_fRotationVelocity	= 2.f;
	m_fZetaDist			= 0.f;//dech edit
	m_fPathDist			= 0.f;//dech edit

	// Initialize value of ray test distance
	fRay1				= RAND_MAX;
	
	// Effects attributes
	m_bUseShadow;
//	m_ShadowCylinder;
//	m_TexShadow;
	m_bRenderFire		= FALSE;
}



/*
------------+-----------------------------------------------------------------------------
 Function	| ~CActor
------------+-----------------------------------------------------------------------------
 Description| Destructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CActor::~CActor()
{

}


/*
------------+-----------------------------------------------------------------------------
 Function	| Destroy
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
void CActor::DecreaseHP( int iHP )
{
	m_iHP -= iHP;
	
	if( m_iHP < 0 ) 
	{
		m_iHP = 0;
	}
}


/*
------------+-----------------------------------------------------------------------------
 Function	| Destroy
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
void CActor::IncreaseHP( int iHP )
{
	m_iHP += iHP;
	
	if( m_iHP > 100 ) 
	{
		m_iHP = 100;
	}
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetHP
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
int  CActor::GetHP()
{
	return m_iHP;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| IsDead
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CActor::IsDead()
{
	return (m_iHP <= 0);
}


/*
------------+-----------------------------------------------------------------------------
 Function	| GetDestination
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
void CActor::GetDestMoving( float *pfDestX, float *pfDestY, float *pfDestZ )
{
	*pfDestX = m_fDestX;
	*pfDestY = m_fDestY;
	*pfDestZ = m_fDestZ;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| SetDestination
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
void CActor::SetDestMoving( float fDestX, float fDestY, float fDestZ )
{
	m_fDestX = fDestX;
	m_fDestY = fDestY;
	m_fDestZ = fDestZ;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| CalculateRotate
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CActor::CalculateRotate( D3DXVECTOR3 vDestination, float* pResultZeta )
{
	D3DXVECTOR3 vMyPos(CMovMat::Px(),CMovMat::Py(),CMovMat::Pz());
	vMyPos = vDestination - vMyPos;
	
	float fZeta;
	if ( vMyPos.z == 0.0f )
	{
		if ( vMyPos.x > 0.0f )
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
		fZeta = cs::ToDeg * float(atan(vMyPos.x/vMyPos.z));

		if (vMyPos.z < 0.0f)
		fZeta += 180.0f;
	}

	float FinalZeta = fZeta-90;
	
	if( pResultZeta )
		*pResultZeta = FinalZeta;

	CMovMat::SetRotation
	( 
		CMovMat::Row(),
		CMovMat::Phi(),	
		fZeta-90 
	);

	return TRUE;
}


BOOL CActor::CalculateMoving( float fElapseTime )
{
	// check is already reached
	CVector3f vSrc(CMovMat::Px(), CMovMat::Py(), CMovMat::Pz());
	CVector3f vDes(m_fDestX, m_fDestY, m_fDestZ);
	FLOAT fDist=(FLOAT)CVector3f::Distance(&vDes,&vSrc);
	if( fDist==0.f )
	{
		// Will not move 'caue reached
		return FALSE;
	}

	// Not reach then go adding step
	CVector3f  vTemp;
	CVector3f::Subtract(&vTemp, &vDes, &vSrc);

	// Check distance to destination
	if( fDist <= m_fMovingStep )
	{
		CMovMat::SetPosition(vDes.x, vDes.y, vDes.z);
		return TRUE;
	}

	// Add to temporary
	FLOAT   fPosSclae=fElapseTime*m_fMovingVelocity;
	CVector3f::Scale(&vTemp, &vTemp, fPosSclae);
	vTemp.x = vSrc.x + (vTemp.x/fDist);
	vTemp.y = vSrc.y + (vTemp.y/fDist);
	vTemp.z = vSrc.z + (vTemp.z/fDist);

	D3DXVECTOR3	vdxSrc( CMovMat::Px(), CMovMat::Py(), CMovMat::Pz());
	D3DXVECTOR3	vdxDes( vTemp.x, vTemp.y, vTemp.z );
	
	//dech code
	D3DXVECTOR3 Direction =  vdxSrc - vdxDes;
	//check for collish
	if( IsCollided(&vdxDes,&Direction) )
	{
		m_fDestX = vTemp.x;
		m_fDestY = vTemp.y; 
		m_fDestZ = vTemp.z;

		return FALSE;		
	}
	else
	{
		CMovMat::SetPosition( vTemp.x, CMovMat::Py(), vTemp.z);
//		CMovMat::SetPosition( vTemp.x, vTemp.y, vTemp.z);
	}

	// Will move at the next time
	return TRUE;
}


/*
------------+-----------------------------------------------------------------------------
 Function	| IsCollided
------------+-----------------------------------------------------------------------------
 Description| 
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
BOOL CActor::IsCollided( D3DXVECTOR3* pvSrc, D3DXVECTOR3* pvDir )
{
	int  iNumSceneObj = CScene::GetNumSceneObj();
	fRay1=RAND_MAX;
	for(int i=0; i<iNumSceneObj; i++)
	{
		int iNumFace = CScene::s_oScene[i].GetNumFaces();
		for(int j=0; j<iNumFace; j++)
		{
			CTriangle oTri;
			if( CScene::s_oScene[i].GetTriangle( j, &oTri ) )
			{
				FLOAT fT=0.f;
				FLOAT fU=0.f;
				FLOAT fV=0.f;
				if
				( 
					CMath::RayOnTriangle
					( 
						*pvSrc,
						*pvDir,
						oTri.GetV0(),
						oTri.GetV1(),
						oTri.GetV2(),
						&fT,
						&fU,
						&fV
					)
				)
				{
					if( (fT > 0.f)&&(fT < fRay1) )
					{
						fRay1 = fT;
						if( D3DXVec3Length(pvDir)+m_fMovingStep+10.f > fRay1 )
						{
							pvDir->y = oTri.GetMaxY();
							return TRUE;
						}
					}
				}
			}//end if
		}//end for
	}//end for

	int  iNumActorObj = CScene::GetNumActorObj();
	fRay1=RAND_MAX;
	for(i=0; i<iNumActorObj; i++)
	{
		// Ignore who was dead
		if( CScene::s_pActor[i]->IsDead() )
			continue;

		// Ignore environments
		if
		( 
			((m_eActorType==BULLET)||
			 (m_eActorType==BULLET1))
			&& 
			((CScene::s_pActor[i]->m_eActorType==ENVOBJ)|| 
			 (CScene::s_pActor[i]->m_eActorType==ENVOBJ1)|| 
			 (CScene::s_pActor[i]->m_eActorType==ENVOBJ2)) 
		)
			continue;

		if( (m_eActorType==BULLET)||(m_eActorType==BULLET1) )
		{
			if
			( 
				(this!=&CScene::s_oPlayer.m_oBullet0)&&
				(this!=&CScene::s_oPlayer.m_oBullet1)
			)
			{
				if( IsCollidedPlayer( pvSrc, pvDir ) )
					return TRUE;
			}
/**/		if
			( 
				(this->GetActor()==CScene::s_pActor[i]->GetActor())||
				(this->GetActor()==CScene::s_pActor[i]->GetActor())
			)
			{
				continue;
			}
		}

		float fX = CScene::s_pActor[i]->Px();
		float fY = CScene::s_pActor[i]->Py();
		float fZ = CScene::s_pActor[i]->Pz();
		D3DXVECTOR3 vSrcRelative = *pvSrc-D3DXVECTOR3(fX,fY,fZ);
		int iNumFace = CScene::s_pActor[i]->m_oBounding.GetNumFaces();
		for(int j=0; j<iNumFace; j++)
		{
			CTriangle oTri;
			if( CScene::s_pActor[i]->m_oBounding.GetTriangle( j, &oTri ) )
			{
				FLOAT fT=0.f;
				FLOAT fU=0.f;
				FLOAT fV=0.f;
				if
				( 
					CMath::RayOnTriangle
					( 
						//*pvSrc,
						vSrcRelative,
						*pvDir,
						oTri.GetV0(),
						oTri.GetV1(),
						oTri.GetV2(),
						&fT,
						&fU,
						&fV
					)
				)
				{
					if( (fT>0.f)&&(fT<fRay1) )
					{
						fRay1 = fT;
						if( D3DXVec3Length(pvDir)+m_fMovingStep > fRay1 )
						{
							pvDir->y = oTri.GetMaxY();
					
							// tina collide bullet
							if
							( 
								(CScene::s_pActor[i]->m_eActorType==TINA)||
								(CScene::s_pActor[i]->m_eActorType==TONY)
							)
							{
								switch( m_eActorType )
								{
									case BULLET:
									{
										CScene::s_pActor[i]->DecreaseHP(10);
										CScene::s_pActor[i]->IsHit();
									}
									break;
									case BULLET1:
									{
										CScene::s_pActor[i]->DecreaseHP(20);
										CScene::s_pActor[i]->IsHit();
									}
									break;
								}

							}

							return TRUE;
						}
					}
				}
			}//end if
		}//end for
	}//end for

	return FALSE;
}


BOOL CActor::IsCollidedPlayer( D3DXVECTOR3* pvSrc, D3DXVECTOR3* pvDir )
{
	fRay1=RAND_MAX;
	float fX = CScene::s_oPlayer.Px();
	float fY = CScene::s_oPlayer.Py();
	float fZ = CScene::s_oPlayer.Pz();
	
	D3DXVECTOR3 vSrcRelative = *pvSrc-D3DXVECTOR3(fX,fY,fZ);
	int iNumFace = CScene::s_oPlayer.m_oBounding.GetNumFaces();
	for(int j=0; j<iNumFace; j++)
	{
		CTriangle oTri;
		if( CScene::s_oPlayer.m_oBounding.GetTriangle( j, &oTri ) )
		{
			FLOAT fT=0.f;
			FLOAT fU=0.f;
			FLOAT fV=0.f;
			if
			( 
				CMath::RayOnTriangle
				( 
					vSrcRelative,
					*pvDir,
					oTri.GetV0(),
					oTri.GetV1(),
					oTri.GetV2(),
					&fT,
					&fU,
					&fV
				)
			)
			{
				if( (fT>0.f)&&(fT<fRay1) )
				{
					fRay1 = fT;
					if( D3DXVec3Length(pvDir)+m_fMovingStep > fRay1 )
					{
						// tina collide bullet
						switch( m_eActorType )
						{
							case BULLET:
							{
								CScene::s_oPlayer.DecreaseHP(2);
								CScene::s_oPlayer.IsHit();
							}
							break;
							case BULLET1:
							{
								CScene::s_oPlayer.DecreaseHP(5);
								CScene::s_oPlayer.IsHit();
							}
							break;
						}

						return TRUE;
					}
				}
			}
		}//end if
	}//end for

	return FALSE;
}


CActor::ACTOR_TYPE CActor::IsPickedEnvObj()
{
	int iNumEnv = CScene::GetNumEnvObj();
	for(int i=0; i<iNumEnv; i++)
	{
		if( CScene::s_oEnvObj[i].IsDead() )
			continue;

		float fDistX = CMath::Absolute(CScene::s_oEnvObj[i].Px()-Px());
		float fDistZ = CMath::Absolute(CScene::s_oEnvObj[i].Pz()-Pz());

		if( fDistX<=10.f && fDistZ<=10.f )
		{
			int iHP = CScene::s_oEnvObj[i].GetHP();
			CScene::s_oEnvObj[i].DecreaseHP(iHP);
			return  CScene::s_oEnvObj[i].m_eActorType;

//			IncreaseHP(iHP);
//			CSoundContainer::s_oSound[SOUND_CHARGE_000].Play();
//			return TRUE;
		}
	}

	return CActor::BASE;
}


D3DXVECTOR3 CActor::GetCurrent()
{
	return D3DXVECTOR3(CMovMat::Px(), CMovMat::Py(), CMovMat::Pz());;
}


HRESULT CActor::FrameMove( FLOAT fElapseTime )
{
	
	//have any to move 
	if(m_fRotate != 0.0f)
	{
		// Add to temporary
		FLOAT   fRotSclae = m_fRotationVelocity* fElapseTime;
		float Temp;
		
		if( (m_fRotate <= fRotSclae )&&( m_fRotate >= 0) )
		{
			Temp = m_fRotate;
			m_fRotate	= 0.f;
		}
		else if( (m_fRotate >=  -fRotSclae )&&( m_fRotate < 0) )
		{
			Temp = m_fRotate;
			m_fRotate	= 0.f;
		}
		else if(m_fRotate > 0)
		{
			Temp = fRotSclae;
			m_fRotate -= fRotSclae;

		}
		else if( m_fRotate < 0 )
		{
			Temp = -fRotSclae;
			m_fRotate += fRotSclae;
		}
		float zeta=CMovMat::Zetha();

		CMovMat::SetRotation(CMovMat::Row(), CMovMat::Phi(), zeta+ Temp);

		return S_OK;
	}
	
	
	
	//have any to move 
	if(m_fPathDist != 0.0f)
	{
		// Add to temporary
		FLOAT   fPosSclae = m_fMovingVelocity*m_fMovingStep;
		D3DXVECTOR3	vdxSrc= GetCurrent();
		D3DXVECTOR3	vdxDes = vdxSrc;
		float walkstep = 0;
	
		if( (m_fPathDist <= fPosSclae )&&( m_fPathDist >= -fPosSclae) )
		{
			walkstep = m_fPathDist;
			m_fPathDist	= 0.f;
		}
		else if(m_fPathDist > 0)
		{
			walkstep = fPosSclae;
			m_fPathDist -= fPosSclae;

		}
		else if( m_fPathDist < 0 )
		{
			walkstep = -fPosSclae;
			m_fPathDist += fPosSclae;
		}

		float fZ = -(float)sin((double)(CMovMat::Zetha()*22.0/(7.0*180))) * walkstep * fElapseTime;
		float fX = (float)cos((double)(CMovMat::Zetha()*22.0/(7.0*180))) * walkstep * fElapseTime;


//		vdxDes.x += fX-10.f;
//		vdxDes.z += fZ-10.f;
/**/	vdxDes.x += fX;
/**/	vdxDes.z += fZ;
		
		//dech code
		D3DXVECTOR3 Direction =  vdxSrc - vdxDes;

		//check for collish
		if( IsCollided(&vdxDes,&Direction) )
		{
			m_fPathDist = 0.0f;
			CMovMat::SetPosition( Px(), Py(), Pz());
			return FALSE;		
		}
		else
		{
			float fY = m_fPivotY+CScene::GetHeight(vdxDes.x, Py(), vdxDes.z);
			CMovMat::SetPosition( vdxDes.x, vdxDes.y, vdxDes.z);
		}
	}
	return S_OK;
}


BOOL CActor::Forward(FLOAT Long)
{	
	m_fPathDist += Long;
	return true;
}


BOOL CActor::RotateLeft(FLOAT step)
{	
	m_fRotate += step;
	return true;
}

BOOL CActor::RotateRight(FLOAT step)
{	
	m_fRotate -= step;
	return true;
}


BOOL CActor::IsMoving()
{
	return (m_fPathDist != 0);
}


HRESULT CActor::Render( const D3DXMATRIX* matCustom )
{
	glDisable( GL_STENCIL_TEST );
	CDObjModel::Render( matCustom );
/*
    if( m_bRenderFire )
	{
		CTriangle Triangle;
		GetTriangle( 907, &Triangle );
		
		D3DXVECTOR3 vPos;
		Vec3::MulMat( &vPos, &Triangle.GetV0(), CMovMat::GetpMat() );
		CColor4f c4 = CMyGlApp::s_oSceneColor;

		CScene::s_oCloudList.Add
		(	
			"Resource\\Texture\\blue_plasma.tga",
			Px(),Py()+0.00f,Pz(),
			Px(),Py()+3.25f,Pz(),
			0.0f, 0.0f,
			100.f, 100.f,
			c4.r, c4.g, c4.b, 0.5f,
			c4.r, c4.g, c4.b, 0.0f,
			0.30f
		);
	}
*/
	m_bRenderFire = FALSE;
	return TRUE;
}

  
BOOL CActor::UseShadow()
{
/*	if( !m_bUseShadow )
	{
		m_ShadowCylinder.LoadModel("Frame\\ShadowCylinder.Maf");
		m_TexShadow.Use( "Texture\\Shadow.tga" );
		m_bUseShadow = TRUE;
	}
*/
	return TRUE;
}


BOOL CActor::UnUseShadow()
{
/*	if( m_bUseShadow )
	{
		m_ShadowCylinder.ClearModel();
		m_TexShadow.UnUse();
		m_bUseShadow = FALSE;
	}
*/
	return TRUE;
}
