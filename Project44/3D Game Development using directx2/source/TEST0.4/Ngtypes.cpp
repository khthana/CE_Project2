#include "ngtypes.h"

NGObject::NGObject()
{
	update = false;
}

VOID NGObject::Reset()
{
	update = false;
}

BOOL NGObject::Update()
{
	update = true;
	return true;
}
