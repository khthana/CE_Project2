//----------------------------------------------------------------------------------------
// Vector3f.cpp: implementation of the CVector3f class.
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "stdafx.h"
#include "Vector3f.h"
#include <math.h>



//----------------------------------------------------------------------------------------
// Definition and Declaration
//----------------------------------------------------------------------------------------



/*
------------+-----------------------------------------------------------------------------
 Function	| CVector3f
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
/*CVector3f::CVector3f()
{

}
*/



/*
------------+-----------------------------------------------------------------------------
 Function	| ~CVector3f
------------+-----------------------------------------------------------------------------
 Description| Default constructor.
 Parameters	| -
 Return		| -
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CVector3f::~CVector3f()
{

}



/*
------------+-----------------------------------------------------------------------------
 Function	| Add
------------+-----------------------------------------------------------------------------
 Description| Adds two 3-D vectors.
 Parameters	| pOut
			|	[in, out] Pointer to the CVector3f that is the result of the operation. 
			| pV1
			|	[in] Pointer to a source CVector3f. 
			| pV2
			|	[in] Pointer to a source CVector3f. 
 Return		| Pointer to a CVector3f that is the sum of the two 3-D vectors.
 Remarks    | The return value for this function is the same value returned in the pOut 
			| parameter. In this way, the D3DXVec3Add function can be used as a parameter 
			| for another function.
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
CVector3f* CVector3f::Add
(
	CVector3f*			pOut,
	const CVector3f*	pV1,
	const CVector3f*	pV2
)
{
	pOut->x = pV1->x + pV2->x;
	pOut->y = pV1->y + pV2->y;
	pOut->z = pV1->z + pV2->z;
	
	return pOut;
}



DOUBLE CVector3f::AngleBetween
(
	const CVector3f*	pV1,
	const CVector3f*	pV2
)
{
	return acos
	( 
		CVector3f::Dot(pV1,pV2)/(CVector3f::Length(pV1)*CVector3f::Length(pV2)) 
	);
}



/*
CVector3f* CVector3f::BaryCentric
(
	CVector3f* pOut,
	const CVector3f* pV1,
	const CVector3f* pV2,
	CVector3f* pV3,
	FLOAT f,
	FLOAT g
)
*/



/* 
CVector3f* CVector3f::CatmullRom(
  CVector3f* pOut,
  const CVector3f* pV1,
  const CVector3f* pV2,
  const CVector3f* pV3,
  const CVector3f* pV4,
  FLOAT s
);
*/



CVector3f* CVector3f::Cross
(
	CVector3f*		pOut,
	const CVector3f*	pV1,
	const CVector3f*	pV2
)
{
	*pOut = CVector3f
	(
		(pV1->y * pV2->z) - (pV1->z * pV2->y),
		(pV1->z * pV2->x) - (pV1->x * pV2->z),
		(pV1->x * pV2->y) - (pV1->y * pV2->x)
	);

	return pOut;
}



DOUBLE CVector3f::Distance
(
	const CVector3f*	pV1,
	const CVector3f*	pV2
)
{
	CVector3f v( (pV2->x-pV1->x), (pV2->y-pV1->y), (pV2->z-pV1->z) );

	return sqrt( (v.x*v.x)+(v.y*v.y)+(v.z*v.z) );
}




FLOAT CVector3f::Dot
(
	const CVector3f* pV1,
	const CVector3f* pV2
)
{
	return ( (pV1->x*pV2->x)+(pV1->y*pV2->y)+(pV1->z*pV2->z) ); 
}



/*  
CVector3f* CVector3f::Hermite(
  CVector3f* pOut,
  const CVector3f* pV1,
  const CVector3f* pT1,
  const CVector3f* pV2,
  const CVector3f* pT2,
  FLOAT s
);
*/



DOUBLE CVector3f::Length
(
	const CVector3f*	pV
)
{
	return sqrt( (pV->x*pV->x)+(pV->y*pV->y)+(pV->z*pV->z) );
}



FLOAT CVector3f::LengthSq
(
	const CVector3f*	pV
)
{
	return ( (pV->x*pV->x)+(pV->y*pV->y)+(pV->z*pV->z) );
}



CVector3f* CVector3f::Lerp
(
	CVector3f*		pOut,
	const CVector3f*	pV1,
	const CVector3f*	pV2,
	FLOAT			s
)
{ 
	pOut->x = pV1->x + s*(pV2->x-pV1->x);
	pOut->y = pV1->y + s*(pV2->y-pV1->y);
	pOut->z = pV1->z + s*(pV2->z-pV1->z);

	return pOut;
}



CVector3f* CVector3f::Maximize
(
	CVector3f*		pOut,
	const CVector3f*	pV1,
	const CVector3f*	pV2
)
{
	if( pV1->x >= pV2->x ) 
		pOut->x = pV1->x;
	else
		pOut->x = pV2->x;

	if( pV1->y >= pV2->y )		
		pOut->y = pV1->y;
	else
		pOut->y = pV2->y;

	if( pV1->z >= pV2->z )		
		pOut->z = pV1->z;
	else
		pOut->z = pV2->z;

	return pOut;
}



CVector3f* CVector3f::Minimize
(
	CVector3f*		pOut,
	const CVector3f*	pV1,
	const CVector3f*	pV2
) 
{
	if( pV1->x <= pV2->x ) 
		pOut->x = pV1->x;
	else
		pOut->x = pV2->x;

	if( pV1->y <= pV2->y )		
		pOut->y = pV1->y;
	else
		pOut->y = pV2->y;

	if( pV1->z <= pV2->z )		
		pOut->z = pV1->z;
	else
		pOut->z = pV2->z;

	return pOut;
}



CVector3f* CVector3f::Normalize
(
	CVector3f*		pOut,
	const CVector3f*	pV
)
{
	FLOAT fOnebyMag = (FLOAT)(1/CVector3f::Length(pV));

	pOut->x = pV->x*fOnebyMag;
	pOut->y = pV->y*fOnebyMag;
	pOut->z = pV->z*fOnebyMag;

	return pOut;
}



/*
CVector3f* CVector3f::Project(
  CVector3f* pOut,
  const CVector3f* pV
  const D3DVIEWPORT8* pViewport,
  const D3DXMATRIX* pProjection
  const D3DXMATRIX* pView,
  const D3DXMATRIX* pWorld
)
*/


 
CVector3f* CVector3f::Scale
(
	CVector3f*			pOut,
	const CVector3f*	pV,
	FLOAT				s
)
{
	pOut->x = pV->x*s;
	pOut->y = pV->y*s;
	pOut->z = pV->z*s;

	return pOut;
}



CVector3f* CVector3f::Subtract
(
	CVector3f*			pOut,
	const CVector3f*	pV1,
	const CVector3f*	pV2
)
{
	pOut->x = pV1->x - pV2->x;
	pOut->y = pV1->y - pV2->y;
	pOut->z = pV1->z - pV2->z;

	return pOut;
}

/*

VECTOR4* CVector3f::Transform
(
	VECTOR4*			pOut,
	const CVector3f*		pV,
	const MATRIX4X4*	pM
)
{
	*pOut = VECTOR4
	(
		(pV->x*pM->m11 + pV->y*pM->m21 + pV->z*pM->m31 + pM->m41),
		(pV->x*pM->m12 + pV->y*pM->m22 + pV->z*pM->m32 + pM->m42),
		(pV->x*pM->m13 + pV->y*pM->m23 + pV->z*pM->m33 + pM->m43),
		(pV->x*pM->m14 + pV->y*pM->m24 + pV->z*pM->m34 + pM->m44)
	);

	return pOut;
}



/*
CVector3f* CVector3f::TransformCoord(
  CVector3f* pOut,
  const CVector3f* pV,
  const MATRIX4X4* pM
); 
*/

/*

CVector3f* CVector3f::TransformNormal
(
	CVector3f*			pOut,
	const CVector3f*		pV,
	const MATRIX4X4*	pM
)
{
	*pOut = CVector3f
	(
		(pV->x*pM->m11 + pV->y*pM->m21 + pV->z*pM->m31),
		(pV->x*pM->m12 + pV->y*pM->m22 + pV->z*pM->m32),
		(pV->x*pM->m13 + pV->y*pM->m23 + pV->z*pM->m33)
	);

	return pOut;
}


 
/*
CVector3f* CVector3f::Unproject(
  CVector3f* pOut,
  const CVector3f* pV
  const D3DVIEWPORT8* pViewport,
  const MATRIX4X4* pProjection
  const MATRIX4X4* pView,
  const MATRIX4X4* pWorld
); 

*/