#include "Fansy_Button.h"

Fansy_Button::Fansy_Button(const char *bmpname, int w, int h)
:Gui_Button("", w, h)
{
	bmp = new Image();
	bmp->loadBitmap(bmpname);
//	strcpy(this->bmpname, bmpname);
	_graphics->setTransparency(true);
	_graphics->setTransparentColor(RGB(255,255,255));
};

void Fansy_Button::render()
{
	_graphics->Clear();
	switch(stat){
	case PRESSED:
		_graphics->GDrawImage(bmp, 1, 1, NULL);
		break;
	case RELEASED:
		_graphics->GDrawImage(bmp, 0, 0, NULL);
		break;
	}
};