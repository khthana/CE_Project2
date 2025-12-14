#ifndef DDUTIL_H_
#define DDUTIL_H_
//-----------------------------------------------------------------------------
// File: ddutil.cpp
//
// Desc: Routines for loading bitmap and palettes from resources
//
//
// Copyright (c) 1995-1999 Microsoft Corporation. All rights reserved.
//-----------------------------------------------------------------------------

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif

//-----------------------------------------------------------------------------
// Include files
//-----------------------------------------------------------------------------
#include <windows.h>
#include <windowsx.h>
#include <ddraw.h>

//-----------------------------------------------------------------------------
// Functions prototype
//-----------------------------------------------------------------------------
extern "C" IDirectDrawSurface7 *
DDLoadBitmap(IDirectDraw7 * pdd, LPCSTR szBitmap, int dx, int dy);

HRESULT
DDReLoadBitmap(IDirectDrawSurface7 * pdds, LPCSTR szBitmap);

extern "C" HRESULT
DDCopyBitmap(IDirectDrawSurface7 * pdds, HBITMAP hbm, int x, int y,
             int dx, int dy);

extern "C" IDirectDrawPalette *
DDLoadPalette(IDirectDraw7 * pdd, LPCSTR szBitmap);

extern "C" DWORD
DDColorMatch(IDirectDrawSurface7 * pdds, COLORREF rgb);

extern "C" HRESULT
DDSetColorKey(IDirectDrawSurface7 * pdds, COLORREF rgb);

#endif //DDUTIL_H_
