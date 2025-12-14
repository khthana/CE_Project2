#ifndef GUI_GRAPHICS
#define GUI_GRAPHICS

#include <windows.h>
#include <stdio.h>
#include <ddraw.h>
#include "GFXManager.h"
#include "ddutil.h"
#include "Image.h"

class Graphics{
public:
	Graphics(int width, int height);

	LPDIRECTDRAWSURFACE7 getSurface()
	{
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

	void GraphicsBlt(Graphics *srcGFX, int dest_x, int dest_y, LPRECT lprc);

	void Clear();
	void GGetDC(HDC *ref_hdc);
	void GReleaseDC(HDC hdc);
	void GDrawImage(Image *image, int dest_x, int dest_y, const RECT *lprc);

	virtual void ReleaseAllObject();

protected:
	SIZE _size;
	LPDIRECTDRAWSURFACE7 _surface;
	bool b_trans;
};


#endif//GUI_GRAPHICS

