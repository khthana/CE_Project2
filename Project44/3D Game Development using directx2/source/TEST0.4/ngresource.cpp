#include "ngresource.h"

NGResource* NGResource::m_pRes;

NGResource::NGResource()
{
	m_pRes2d	= NULL;
	m_pRes3d	= NULL;
	m_pRes		= this;
}

NGResource*	NGResource::CreateResource()
{
	new NGResource();

	return Resource();
}

VOID NGResource::SetResource(NGRes2d* r2d)
{
	m_pRes2d	= r2d;
}

VOID NGResource::SetResource(NGRes3d* r3d)
{
	m_pRes3d	= r3d;
}

NGResource*	NGResource::GetResource()
{
	return m_pRes;
}