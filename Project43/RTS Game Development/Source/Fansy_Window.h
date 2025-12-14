#ifndef Fansy_Window_header
#define Fansy_Window_header

#include "Gui_Window.h"
#include "Gui_Button.h"
#include "GameCommand.h"

class Fansy_Window:public Gui_Window{
public:

	Fansy_Window(const char *bmpname, int x, int y);

	virtual void render();
	virtual void renderSelf();
	virtual bool isContain(POINT p);
	void setCommand(game_command_type cmd, int page, int index);

private:

	Image *img;
};

#endif Fansy_Window_header