// ProjectileObject.cpp: implementation of the CProjectileObject class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "ProjectileObject.h"
#include "Engine\Triangle.h"
#include "Engine\EffectBillboardList.h"
#include "Engine\Sound.h"
#include "Soldier.h"

//========================================Class CProjectileObject===================================================
extern CEffectBillboardList CloudList;
extern int g_nAmbRed;
extern int g_nAmbGreen;
extern int g_nAmbBlue;
extern CUseSounds BombSound;
extern CSoldierList SoldierList;

CProjectileObject::CProjectileObject()
{
	CacheTri.SetCacheSize( 5 );
	m_vStartVelocity   = cs::v3Zero;          // Unit Vector of, v, t
	m_vCurrentVelocity = cs::v3Zero;
	m_fGravity         = 9.8f;
}

CProjectileObject::CProjectileObject( D3DXVECTOR3 vPos,
									  D3DXVECTOR3 vStartVelocity,
									  float       fGravity )
{
	CMovMat::SetPosition( vPos.x, vPos.y, vPos.z );
	m_vStartVelocity   = vStartVelocity;
	m_vCurrentVelocity = vStartVelocity;
	m_fGravity         = fGravity;
}

CProjectileObject::~CProjectileObject()
{

}

BOOL CProjectileObject::Process( float fElapseTime )
{
	m_vCurrentVelocity.y -= fElapseTime * m_fGravity;
	float px = CMovMat::Px();
	float py = CMovMat::Py();
	float pz = CMovMat::Pz();
	CMovMat::SetPosition( px + fElapseTime * m_vCurrentVelocity.x,
		                  py + fElapseTime * m_vCurrentVelocity.y,
						  pz + fElapseTime * m_vCurrentVelocity.z );
	// kanok
	return TRUE;

}

HRESULT CProjectileObject::Render()
{
	// Call base class version;
	return CStaticModel::Render();
}

void CProjectileObject::SetLand( CSLandModel *pLand )
{
	m_pLand = pLand;
}

BOOL CProjectileObject::IsReachTarget()
{
	float px = CMovMat::Px();
	float pz = CMovMat::Pz();
	float High;
	
	if( !CacheTri.GetHigh1( CMovMat::Px(),
						    CMovMat::Pz(),
						    &High ) )
	{
		CTriangle HitTriangle;
		if( m_pLand->GetHigh1( px, pz, &High,NULL,&HitTriangle ) )
		{
			if( CMovMat::Py() <= High )
			{
				BombSound.Play();

				if( High <= 28.80f )
				{
					CloudList.Add(	"Texture\\WaterEf.tga",
									CMovMat::Px(), 29+0.00f, CMovMat::Pz(),
									CMovMat::Px(), 29.0f-0.0f,CMovMat::Pz(),
									0.0f, 0.0f,
									4.0f, 25.5f,
									float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,01.0f,
									float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.0f,
									0.70f);
					CloudList.Add(	"Texture\\WaterEf.tga",
									CMovMat::Px(), 29.0f+0.00f, CMovMat::Pz(),
									CMovMat::Px(), 29.0f-0.0f,CMovMat::Pz(),
									0.0f, 0.0f,
									12.5f, 15.5f,
									float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,01.0f,
									float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.0f,
									01.10f);
				}

				CloudList.Add(	"Texture\\cloud.tga",
								CMovMat::Px(), CMovMat::Py()+2.00f, CMovMat::Pz(),
								CMovMat::Px()+0.15f,CMovMat::Py()+18.25f,CMovMat::Pz()+0.15f,
								10.0f, 10.0f,
								30.5f, 25.5f,
								float(g_nAmbRed)/255.0f/1.50f,
								float(g_nAmbGreen)/255.0f/1.50f,
								float(g_nAmbBlue)/255.0f/1.50f,
								0.70f,
								float(g_nAmbRed)/255.0f*1.50f,
								float(g_nAmbGreen)/255.0f*1.50f,
								float(g_nAmbBlue)/255.0f*1.50f,
								0.0f,
								4.0f);

				CloudList.Add(	"Texture\\FireBomb.tga",
								CMovMat::Px(), CMovMat::Py()+0.00f, CMovMat::Pz(),
								CMovMat::Px(),CMovMat::Py()+3.25f,CMovMat::Pz(),
								0.0f, 0.0f,
								8.5f, 10.5f,
								float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.50f,
								float(g_nAmbRed)/255.0f,float(g_nAmbGreen)/255.0f,float(g_nAmbBlue)/255.0f,0.0f,
								0.30f);

				int nBound = SoldierList.GetUpperBound();
				for( int i = 0; i <= nBound; i++ )
				{
					CSoldier *pSoldier = SoldierList.GetAt( i );
					float SoldierX = pSoldier->CMovMat::Px();
					float SoldierY = pSoldier->CMovMat::Py();
					float SoldierZ = pSoldier->CMovMat::Pz();
					
					float fDistance = Tool::GetDistance( SoldierX, SoldierY, SoldierZ, px, CMovMat::Py(), pz ); 
					if( fDistance < 5.0f )
					{
						pSoldier->DecreaseHP( 1000 );
					}
				}

				return TRUE;
			}
			CacheTri.Add( HitTriangle );
		}
		else
		{
			return TRUE;
		}
	}
	else // Is in Cache
	{
		if( CMovMat::Py() <= High )
		{
			return TRUE;
		}
	}

	return FALSE;
}

//========================================Class CProjectileObjectList=============================================
CProjectileObjectList::CProjectileObjectList()
{

}

CProjectileObjectList::~CProjectileObjectList()
{
	RemoveAll();
}

void CProjectileObjectList::Add( D3DXVECTOR3 vPos, D3DXVECTOR3 vStartVelocity, float fGravity )
{
	CProjectileObject *pProjectileObject = new CProjectileObject( vPos, vStartVelocity, fGravity );
	pProjectileObject->LoadModel( "Frame\\BigBullet.maf" );
	pProjectileObject->SetLand( m_pLand );
	m_arObject.Add( pProjectileObject );
}

BOOL CProjectileObjectList::Process( float fElapseTime )
{
	for( int i = 0; i <= m_arObject.GetUpperBound(); i++ )
	{
		CProjectileObject *pObject = (CProjectileObject *) m_arObject.GetAt(i);
		pObject->Process( fElapseTime );
		if( pObject->IsReachTarget() )
		{
			delete (CProjectileObject *) m_arObject.GetAt(i);
			m_arObject.RemoveAt( i );
			i--;
		}
	}

	return TRUE;
}

HRESULT CProjectileObjectList::Render()
{
	int nBound = m_arObject.GetUpperBound();
	for( int i = 0; i <= nBound; i++ )
	{
		CProjectileObject *pObject = (CProjectileObject *) m_arObject.GetAt(i);
		pObject->Render();		
	}

	return TRUE;
}

void CProjectileObjectList::RemoveAll()
{
	int nBound = m_arObject.GetUpperBound();
	for( int i = 0; i <= nBound; i++ )
	{
		delete (CProjectileObject *) m_arObject.GetAt(i);	
	}

	m_arObject.RemoveAll();	
}

void CProjectileObjectList::SetLand( CSLandModel *pLand )
{
	m_pLand = pLand;
}