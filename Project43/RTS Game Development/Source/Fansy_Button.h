#ifndef Fansy_Button_header
#define Fansy_Button_header

#include "Gui_Button.h"
#include "Image.h"

class Fansy_Button:public Gui_Button
{
public:
	Fansy_Button(const char *bmp, int w, int h);
	virtual void render();
protected:
	char *bmpname;
	Image *bmp;
};
#endif Fansy_Button_header