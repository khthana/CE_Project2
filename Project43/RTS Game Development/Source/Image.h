#ifndef IMAGE_H_
#define IMAGE_H_

#include <windows.h>
#include <stdio.h>
#include <ddraw.h>
#include "GFXManager.h"
#include "ddutil.h"

class Image;

typedef Image * ImagePtr;
class Image{
public:

	Image(){
		setTransparency(false);
	};

	LPDIRECTDRAWSURFACE7 getSurface(){
  		return _surface;
	};
	
	SIZE getSize(){
 		return _size;
	};
	
	bool getTransparency(){
		return b_trans;
	};

	void setTransparency(bool value){
		b_trans=value;
	};

	void setTransparentColor(COLORREF rgb){
		DDSetColorKey(_surface, rgb);
	};

/*	void getTrasparentColor(LPDDCOLORKEY lpDDColorKey){
		_surface->GetColorKey(DDCKEY_SRCBLT, lpDDColorKey);
	};*/

	int loadBitmap(const char *szBitmap){
		DDSURFACEDESC2 ddsd;
		_surface = DDLoadBitmap(GFXManager::GetDDObject(), szBitmap, 0, 0);
		if(!_surface){
			return -1;
		}
		ddsd.dwSize = sizeof(ddsd);
		ddsd.dwFlags = DDSD_HEIGHT | DDSD_WIDTH;
		_surface->GetSurfaceDesc(&ddsd);
		_size.cx=static_cast<LONG>(ddsd.dwWidth);
		_size.cy=static_cast<LONG>(ddsd.dwHeight);
		return 0;
	};

protected:
	SIZE _size;
	LPDIRECTDRAWSURFACE7 _surface;
	bool b_trans;
};

#endif//GUI_GRAPHICS

