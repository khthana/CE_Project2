// DMyCamera.cpp: implementation of the CDMyCamera class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "DMyCamera.h"
#include "Scene.h"


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CDMyCamera::CDMyCamera()
{
	m_Distance	= 150.f;
	m_UpDistance= 10.f;
	m_Zetha		= 0.f;
	m_vEyeDes	= D3DXVECTOR3(0,0,0); 
	m_fEyeSentitive = 3;
}


CDMyCamera::~CDMyCamera()
{

}

/*
HRESULT CDMyCamera::Process(D3DXVECTOR3 vObj,FLOAT zetha)
{
	float m_Zethatemp;
	m_Zethatemp = zetha;

//	m_vLookat.x = vObj.x;
//	m_vLookat.y = vObj.y;
//	m_vLookat.z = vObj.z;
	
	bool hiden = false;
	int inter;
	D3DXVECTOR3 m_vEyeDestemp;
	
	m_Zethatemp = zetha;

		hiden = false;
		m_vEyeDestemp.x = m_vLookat.x -(float)cos((double)(m_Zetha*22.0/(7.0*180))) *m_Distance;
		m_vEyeDestemp.y = m_vLookat.y + m_UpDistance;
		m_vEyeDestemp.z = m_vLookat.z +(float)sin((double)(m_Zetha*22.0/(7.0*180))) *m_Distance;
		D3DXVECTOR3 vDir = vObj - m_vEyeDestemp;

		for( int ii = 0 ; ii < CScene::GetNumSceneObj()&& (!hiden) ;ii++)
		{
			int iNumFace = CScene::s_oScene[ii].GetNumFaces();
			for(int j=0; j<iNumFace&&(!hiden); j++)
			{
				CTriangle oTri;

				if( CScene::s_oScene[ii].GetTriangle( j, &oTri ) )
				{
					FLOAT fT=0.f;
					FLOAT fU=0.f;
					FLOAT fV=0.f;
					if(CMath::RayOnTriangle
					( 
						m_vEyeDestemp,
						vDir,
						oTri.GetV0(),
						oTri.GetV1(),
						oTri.GetV2(),
						&fT,
						&fU,
						&fV
				    ))

					{
						//if ft less than distance so that it is hiden surface
						if(((fT>0)&&(fT < m_Distance )) )
						{
							hiden = true;
							
						}
					}
				}
			}
		}

		if(hiden)
		{
			
			float sign;
			if(inter%2)
			{
				sign = 1;
			}
			else
			{
				sign = -1;
			}
			m_Zethatemp += inter*15.0f*sign;
		}
		else
		{
			//condition exit loop
			inter = 20;
			m_vEyeDes = m_vEyeDestemp;

		}
	m_Zetha = m_Zethatemp;

	return S_OK;
}
*/

HRESULT CDMyCamera::Process(D3DXVECTOR3 vObj,FLOAT zetha)
{
	float Dist = 500.f;
	float dx,dz,dx45,dz45,dx45m,dz45m;
	m_vLookat.x = vObj.x;
	m_vLookat.y = vObj.y;
	m_vLookat.z = vObj.z;
	D3DXVECTOR3 vEyeDestemp;

	dx		= -(float)cos((double)(		zetha*cs::ToRad)) *m_Distance;
	dz		=  (float)sin((double)(		zetha*cs::ToRad)) *m_Distance;
	dx45	= -(float)cos((double)((zetha+45)*cs::ToRad)) *m_Distance;
	dz45	=  (float)sin((double)((zetha+45)*cs::ToRad)) *m_Distance;
	dx45m	= -(float)cos((double)((zetha-45)*cs::ToRad)) *m_Distance;
	dz45m	=  (float)sin((double)((zetha-45)*cs::ToRad)) *m_Distance;

	vEyeDestemp.x = m_vLookat.x + dx+10.f;
	vEyeDestemp.y = m_vLookat.y + m_UpDistance;
	vEyeDestemp.z = m_vLookat.z + dz;
	D3DXVECTOR3 vDir = vObj - vEyeDestemp;
	RayTest(vEyeDestemp,vDir,&Dist);
	if(Dist >= m_Distance )
	{
		m_vEyeDes = vEyeDestemp;
		return S_OK;
	}

	Dist = 1000.f;
	vEyeDestemp.x = m_vLookat.x - dz;
	vEyeDestemp.y = m_vLookat.y + m_UpDistance;
	vEyeDestemp.z = m_vLookat.z + dx;
	vDir = vObj - vEyeDestemp;
	RayTest(vEyeDestemp,vDir,&Dist);
	if(Dist >= m_Distance )
	{
		m_vEyeDes = vEyeDestemp;
		return S_OK;
	}

	Dist = 1000.f;
	vEyeDestemp.x = m_vLookat.x + dz;
	vEyeDestemp.y = m_vLookat.y + m_UpDistance;
	vEyeDestemp.z = m_vLookat.z - dx;
	vDir = vObj - vEyeDestemp;
	RayTest(vEyeDestemp,vDir,&Dist);
	if(Dist >= m_Distance )
	{
		m_vEyeDes = vEyeDestemp;
		return S_OK;
	}

	Dist = 1000.f;
	vEyeDestemp.x = m_vLookat.x - dx/2;
	vEyeDestemp.y = m_vLookat.y + m_UpDistance;
	vEyeDestemp.z = m_vLookat.z - dz/2;
	vDir = vObj - vEyeDestemp;
	RayTest(vEyeDestemp,vDir,&Dist);
	if(Dist >= m_Distance )
	{
		m_vEyeDes = vEyeDestemp;
		return S_OK;
	}
	
	Dist = 1000.f;
	vEyeDestemp.x = m_vLookat.x + dx/2;
	vEyeDestemp.y = m_vLookat.y + m_UpDistance;
	vEyeDestemp.z = m_vLookat.z + dz/2;
	m_vEyeDes = vEyeDestemp;

	return S_OK;
}


BOOL CDMyCamera::RayTest( D3DXVECTOR3 vEyeDestemp,D3DXVECTOR3 vDir,FLOAT* Dist)
{
	float fU,fV;
	bool hiden = false;
	for( int ii = 0 ; ii<CScene::GetNumSceneObj()&&(!hiden) ;ii++)
	{
		int iNumFace = CScene::s_oScene[ii].GetNumFaces();
		for(int j=0; j<iNumFace&&(!hiden); j++)
		{
			CTriangle oTri;

			if( CScene::s_oScene[ii].GetTriangle( j, &oTri ) )
			{
				FLOAT fT=0.f;
				if
				(
					CMath::RayOnTriangle
					( 
						vEyeDestemp,
						vDir,
						oTri.GetV0(),
						oTri.GetV1(),
						oTri.GetV2(),
						&fT,
						&fU,
						&fV
				    )
				)
				{
					//if ft less than distance so that it is hiden surface
					if(((fT>0)&&(fT < *Dist)) )
					{
						*Dist = fT;
						if( *Dist < m_Distance)
						{
							hiden = true;
						}
					}
				}
			}
		}
	}
    return TRUE;
}


HRESULT CDMyCamera::FrameMove() 
{
	D3DXVECTOR3 ey(m_vEye.x,m_vEye.y,m_vEye.z);
	D3DXVECTOR3 vunit;
	float lg;

	//m_vEye.x = m_vEyeDes.x;
	//m_vEye.y = m_vEyeDes.y;
	//m_vEye.z = m_vEyeDes.z;
	vunit = m_vEyeDes - ey;
	
	lg = D3DXVec3Length(&vunit);
	
	if(lg <= m_fEyeSentitive)
	{
		m_vEye.x = m_vEyeDes.x;
		m_vEye.y = m_vEyeDes.y;
		m_vEye.z = m_vEyeDes.z;
	
		SetViewParams( m_vEye, m_vLookat, m_vUp );
		return S_OK;
	}

//	vunit = 2.f*vunit*m_fEyeSentitive/ lg;
	vunit = vunit*m_fEyeSentitive/ lg;
	m_vEye.x += vunit.x;
	m_vEye.y += vunit.y;
	m_vEye.z += vunit.z;

	SetViewParams( m_vEye, m_vLookat, m_vUp );
	return S_OK;
}


CVector3f CDMyCamera::GetDirection()
{
	CVector3f vTemp;
	CVector3f::Subtract( &vTemp, &m_vLookat, &m_vEye );
	FLOAT fDist = (FLOAT)CVector3f::Distance(&m_vLookat,&m_vEye);
	vTemp.x = vTemp.x/fDist;
	vTemp.y = vTemp.y/fDist;
	vTemp.z = vTemp.z/fDist;
	return vTemp;
}




