#pragma warning(disable:4786)
#ifndef ___NGRESOURCE_H
#define ___NGRESOURCE_H

#include "ngtexture.h"
#include "ngmodel.h"

class NGResource
{
private:
	NGRes2d*	m_pRes2d;
	NGRes3d*	m_pRes3d;

	static NGResource*	m_pRes;

public:

	NGResource();

	VOID	SetResource(NGRes2d*);
	VOID	SetResource(NGRes3d*);

	static NGResource*	CreateResource();
	static NGResource*	GetResource();
};

inline NGResource*	CreateResource()
{
	return NGResource::CreateResource();
};

inline NGResource*	Resource()
{
	return NGResource::GetResource();
};

#endif