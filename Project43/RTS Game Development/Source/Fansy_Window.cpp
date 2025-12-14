#include "Fansy_Window.h"
Fansy_Window::Fansy_Window(const char *bmpname, int x, int y):Gui_Window(x,y)
{
	img=new Image();
	img->loadBitmap(bmpname);
	_graphics->setTransparency(true);
	_graphics->setTransparentColor(TRANS_RGB);	
};

void Fansy_Window::render(){
	renderSelf();
	renderSub();
};

void Fansy_Window::renderSelf(){
	_graphics->GDrawImage(img, 0, 0, NULL);
};

bool Fansy_Window::isContain(POINT p){
	if(!(p.x>_pos.x&&p.x<_pos.x+_size.cx))
		return false;
	if(!(p.y>_pos.y&&p.y<_pos.y+_size.cy))
		return false;
	
	int x=static_cast<int>(p.x-_pos.x);
	int y=static_cast<int>(p.y-_pos.y);

	HDC hdc;
	_graphics->GGetDC(&hdc);

	COLORREF rgb=GetPixel(hdc, x, y);
	_graphics->GReleaseDC(hdc);
	if(rgb==CLR_INVALID)
		rgb=0x0;
	if(rgb==TRANS_RGB)
		return false;

	return true;
	
};