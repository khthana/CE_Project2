//----------------------------------------------------------------------------------------
// Math.h: interface for the CMath class.
//----------------------------------------------------------------------------------------
#ifndef __MATH_H__
#define __MATH_H__
#pragma once


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include <gl\gl.h>			
#include <math.h>
#include <Mmsystem.h>
#include <windows.h>
#include <d3dx8.h>
#include <D3dx8math.h>

//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------


//----------------------------------------------------------------------------------------
// Declaration.
//----------------------------------------------------------------------------------------
const FLOAT	PI		= 3.1415927410125732;		// Equal to D3DX_PI
const FLOAT	PIX2	= 6.2831854820251464;
const FLOAT	PIBY2	= 1.5707963705062866;
const FLOAT	ONEBYPI	= 0.31830987334251404;		// Equal to D3DX_1BYPI;


/*
------------+-----------------------------------------------------------------------------
 Class		| CMath
------------+-----------------------------------------------------------------------------
 Description| 
 Author		| Mr.Apimun Junda
 Date		| Febuary 25, 2002
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CMath  
{
public:
	//---members variable-----------------------------------------------------------------

	//---constructors & destructor--------------------------------------------------------
	CMath();
	virtual ~CMath();

	//---operators------------------------------------------------------------------------

	//---members function-----------------------------------------------------------------
	inline static FLOAT DegreeToRadian( FLOAT degree )
	{
		return ( degree*(PI/180.0f) ); 
	}

	inline static DOUBLE DegreeToRadian( DOUBLE degree )
	{
		return ( degree*(PI/180.0f) ); 
	}

	inline static FLOAT RadianToDegree( FLOAT radian )
	{
		return ( radian*(180.0f/PI) ); 
	}

	inline static DOUBLE RadianToDegree( DOUBLE radian )
	{
		return ( radian*(180.0f/PI) ); 
	}

	inline static FLOAT Absolute( FLOAT abs )
	{
		if(abs<0.0f) return -abs; return abs; 
	}

	inline static DOUBLE Absolute( DOUBLE abs )
	{
		if(abs<0.0f) return -abs; return abs; 
	}

	inline static INT Absolute( INT abs )
	{
		if(abs<0.0f) return -abs; return abs; 
	}

	inline static DOUBLE Magnitude( FLOAT x, FLOAT y, FLOAT z )
	{
		return sqrt( (x*x)+(y*y)+(z*z) );
	}
/*
	inline static DOUBLE Magnitude( VECTOR3 v )
	{
		return sqrt( (v.x*v.x)+(v.y*v.y)+(v.z*v.z) );
	}

	inline static DOUBLE Distance( VECTOR3 v1, VECTOR3 v2 )
	{
		return sqrt( pow((v1.x-v2.x),2)+pow((v1.y-v2.y),2)+pow((v1.z-v2.z),2) );
	}

	inline static VECTOR3 CartesianToSphere( FLOAT x, FLOAT y, FLOAT z )	// The coordiante will reference to Engineering Electromagnetics, William H. Hayt, Jr.
	{
		DOUBLE r = Magnitude(x,y,z);
		return VECTOR3( r, acos(z/r), atan(y/x) );
	};

	inline static VECTOR3 CartesianToCylindrical( FLOAT x, FLOAT y, FLOAT z )
	{
		return VECTOR3( sqrt((x*x)+(y*y)), atan(y/x), (DOUBLE)z );
	};

	inline static VECTOR3 SphereToCartesian( FLOAT r, FLOAT theta, FLOAT phi )
	{
		return VECTOR3( r*sin(theta)*cos(phi), r*sin(theta)*sin(phi), r*cos(theta) );
	};

	inline static VECTOR3 CylindricalToCartesian( FLOAT rho, FLOAT phi, FLOAT z )
	{
		return VECTOR3( rho*cos(phi), rho*sin(phi), (DOUBLE)z );
	};

	inline static VOID MAXtoGL( VECTOR3* pV )
	{
		FLOAT MAXy=pV->y;
		pV->y = pV->z;
		pV->z = -MAXy;
	};

	inline static VOID GLtoMAX( VECTOR3* pV )
	{
		FLOAT GLz=pV->z;
		pV->z = pV->y;
		pV->y = -GLz;
	};

	inline static VOID MAXtoDX( VECTOR3* pV )
	{
		FLOAT MAXy=pV->y;
		pV->y = pV->z;
		pV->z = MAXy;
	};

	inline static VOID DXtoMAX( VECTOR3* pV )
	{
		FLOAT DXz=pV->y;
		pV->z = pV->y;
		pV->y = DXz;
	};
*/
/*
------------+-----------------------------------------------------------------------------
 Function	| Randomize
------------+-----------------------------------------------------------------------------
 Description| Find a random number between iMin and iMax that different from the value of
			| *piDiffNum parameter.
 Parameters	| iMin
			|	Minimun value the default value is 0
			| iMax
			|	Maximum random range the default value is RAND_MAX
			| piDiffNum
			|	Pointer to difference number the default value is NULL
 return		| If the function succeeds, the return value is random number
			| If the function failed, the return value is -1
 Remarks    | -
 See Also	| -
------------+-----------------------------------------------------------------------------
*/
	inline static INT RandomizeInt( INT iMin=0, INT iMax=RAND_MAX, INT* piDiffNum=NULL )
	{
		INT iDistance  = iMax-iMin;
		if( iDistance <= 0 )
		{
			return -1;
		}

		if( piDiffNum )
		{
			INT iNum = *piDiffNum;
			while( *piDiffNum == iNum )
			{
			    iNum = (iMin+((rand()+timeGetTime())%iDistance));
			}
			return iNum;
		}
		else
		{
			return (iMin+((rand()+timeGetTime())%iDistance));
		}
	}

	inline static FLOAT Randomize0to1() 
	{
		return (((FLOAT)rand()+timeGetTime()-timeGetTime())/RAND_MAX); 
	}

	static BOOL RayOnTriangle
	( 
		const D3DXVECTOR3& orig,
		const D3DXVECTOR3& dir, 
		D3DXVECTOR3& v0, 
		D3DXVECTOR3& v1, 
		D3DXVECTOR3& v2,
		FLOAT* t, 
		FLOAT* u, 
		FLOAT* v 
	);

};



#endif // __MATH_H__
