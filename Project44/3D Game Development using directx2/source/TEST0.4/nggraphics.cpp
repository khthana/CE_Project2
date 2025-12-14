#include "stdafx.h"
#include "nggraphics.h"

BOOL CreateGraphics(NGCREATEINFO* cs)
{
	NG3D::CreateGraphics(cs);
	NGPanelControl::CreatePanelCtrl( 0, 0, cs->dwWidth, cs->dwHeight);
	NGRenderer::CreateRenderer(Graphics());
	NGResource::CreateResource();

	return true;
}

