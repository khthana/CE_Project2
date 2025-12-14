#ifndef GUI_WINDOW
#define GUI_WINDOW

#include <ddraw.h>
#include "Gui_Container.h"
#include "GFXManager.h"
#include "Image.h"

class Gui_Window:public Gui_Container{
public:
	Gui_Window(int width, int height)
		:Gui_Container(width, height)
	{
	};
	bool isActive(){};
	void bringToTop(){};//bring this to top of parent's subComponents
	virtual void renderSelf();
	virtual void render();
	virtual void paint(Graphics *g){};
	virtual void calcall(){};

protected:
};

#endif//GUI_WINDOW