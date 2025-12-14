#include "Gui_Window.h"

void Gui_Window::render(){
	_graphics->Clear();
	paint(getGraphics());
	renderSub();
	renderSelf();
};

void Gui_Window::renderSelf(){
	HDC hdc;
	_graphics->GGetDC(&hdc);
	RECT rect;
	rect.left=0;
	rect.top=0;
	rect.right=_size.cx-1;
	rect.bottom=_size.cy-1;
	FrameRect(hdc, &rect, (HBRUSH)GetStockObject(LTGRAY_BRUSH));
	rect.left=1;
	rect.top=1;
	rect.right=_size.cx-2;
	rect.bottom=20;
	FillRect(hdc, &rect, (HBRUSH)GetStockObject(LTGRAY_BRUSH));
	char s[20];
	sprintf(s,"%d %d", _pos.x, _pos.y);
	TextOut(hdc, _size.cx-60, 2, s, strlen(s));
	_graphics->GReleaseDC(hdc);

};