//----------------------------------------------------------------------------------------
// Vector3f.h: interface for the CVector3f class.
//----------------------------------------------------------------------------------------
#pragma once
#ifndef __CVector3fF_H__
#define __CVector3fF_H__


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Math.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Class		| CVector3f
------------+-----------------------------------------------------------------------------
 Description| 
 Author		| Mr.Apimun Junda
 Date		| Febuary 25, 2002
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CVector3f  
{
public:
	//---members variable-----------------------------------------------------------------
	FLOAT	x,y,z;

	//---constructors & destructor--------------------------------------------------------
	virtual ~CVector3f();
	CVector3f()								{ x=0.0f; y=0.0f; z=0.0f; }
	CVector3f(FLOAT X, FLOAT Y, FLOAT Z)	{ x=X; y=Y; z=Z; }
	CVector3f(DOUBLE X, DOUBLE Y, DOUBLE Z)	{ x=(FLOAT)X; y=(FLOAT)Y; z=(FLOAT)Z; }

	//---operators------------------------------------------------------------------------
	CVector3f operator= (const CVector3f& v){ x=v.x; y=v.y; z=v.z; return *this; }
//	CVector3f operator= (const D3DXCVector3f& v){ x=v.x; y=v.y; z=v.z; return *this; }

	//---members function-----------------------------------------------------------------
	GLfloat* GetGLfloat(GLfloat* p) { *p=x; *(p+1)=y; *(p+2)=z; return p; }
	static CVector3f* Add(CVector3f*,const CVector3f*,const CVector3f*);
	static DOUBLE AngleBetween(const CVector3f*,const CVector3f*);
	static CVector3f* Cross(CVector3f*,const CVector3f*,const CVector3f*);
	static DOUBLE Distance(const CVector3f*,const CVector3f*);
	static FLOAT Dot(const CVector3f*,const CVector3f*);
	static DOUBLE Length(const CVector3f*);
	static FLOAT LengthSq(const CVector3f*);
	static CVector3f* Maximize(CVector3f*,const CVector3f*,const CVector3f*);
	static CVector3f* Minimize(CVector3f*,const CVector3f*,const CVector3f*);
	static CVector3f* Lerp(CVector3f*,const CVector3f*,const CVector3f*,FLOAT);
	static CVector3f* Normalize(CVector3f*,const CVector3f*);
	static CVector3f* Scale(CVector3f*,const CVector3f*,FLOAT);
	static CVector3f* Subtract(CVector3f*,const CVector3f*,const CVector3f*);
//	static VECTOR4* Transform(VECTOR4*,const CVector3f*,const MATRIX4X4*);
//	static CVector3f* TransformNormal(CVector3f*,const CVector3f*,const MATRIX4X4*);
};



#endif // __CVector3fF_H__
