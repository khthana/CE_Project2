// FImgDraw.h: interface for the FImgDraw class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIMGDRAW_H__755EB1BE_3244_4890_9A36_91116BEF69E1__INCLUDED_)
#define AFX_FIMGDRAW_H__755EB1BE_3244_4890_9A36_91116BEF69E1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif

#include "FImgProc.h"

class FImgDraw	// Class for drawing object on image
{
public:
	FImgDraw();
	virtual ~FImgDraw();

	static void DrawCrosshair(FImage&, int, int, int, F_PIXEL&);	// Draw cross line at a point with specified size & colro

};

#endif // !defined(AFX_FIMGDRAW_H__755EB1BE_3244_4890_9A36_91116BEF69E1__INCLUDED_)
