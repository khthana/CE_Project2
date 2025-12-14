#ifndef GUI_MANAGER
#define GUI_MANAGER

#include <windows.h>
#include "GFXManager.h"
#include "Gui_Window.h"
#include "Gui_Button.h"

class Gui
{
public:
	static int start(HINSTANCE hInstance, int nCmdShow);

	static void refresh();

	static Gui_Container *getDesktop()
	{
		return desktop;
	}

	static void ReleaseAllObject();

private:
	static Gui_Container *desktop;
};


#endif//GUI_MANAGER
