//----------------------------------------------------------------------------------------
// Vector4f.h: interface for the CVector4f class.
//----------------------------------------------------------------------------------------
#pragma once
#ifndef __VECTOR4F_H__
#define __VECTOR4F_H__


//----------------------------------------------------------------------------------------
// Including files.
//----------------------------------------------------------------------------------------
#include "Vector3f.h"


//----------------------------------------------------------------------------------------
// Definition.
//----------------------------------------------------------------------------------------


/*
------------+-----------------------------------------------------------------------------
 Class		| CVector4f
------------+-----------------------------------------------------------------------------
 Description| 
 Author		| Mr.Apimun Junda
 Date		| Febuary 25, 2002
------------+-----------------------------------------------------------------------------
 Copyright (c) 2001 Aj Slayer Team. All rights reserved.
------------+-----------------------------------------------------------------------------
*/
class CVector4f : virtual public CVector3f
{
public:
	//---members variable-----------------------------------------------------------------
	FLOAT	w;

	//---constructors & destructor--------------------------------------------------------
	virtual ~CVector4f();
	CVector4f()											{ w=0.0f; }
	CVector4f(FLOAT X, FLOAT Y, FLOAT Z, FLOAT W=0.0f)	{ x=X; y=Y; z=Z; w=W; }
	CVector4f(DOUBLE X, DOUBLE Y, DOUBLE Z, DOUBLE W=0.0f){ x=(FLOAT)X; y=(FLOAT)Y; z=(FLOAT)Z; w=(FLOAT)W; }

	//---operators------------------------------------------------------------------------
	CVector4f operator= (const CVector3f& v)	{ x=v.x; y=v.y; z=v.z; return *this; }
	CVector4f operator= (const CVector4f& v)	{ x=v.x; y=v.y; z=v.z; w=v.w; return *this; }

	//---members function-----------------------------------------------------------------
	GLfloat* GetGLfloat(GLfloat* p) { *p=x; *(p+1)=y; *(p+2)=z; *(p+3)=w;return p; }
};



#endif // __VECTOR4F_H__
