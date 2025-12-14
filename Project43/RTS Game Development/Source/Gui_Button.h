#ifndef GUI_BUTTON
#define GUI_BUTTON

#include <windows.h>
#include <stdio.h>
#include <malloc.h>
#include "gui_plane.h"

class Gui_Button:public Gui_Plane{
public:
	Gui_Button(const char *t, int w, int h):Gui_Plane(w,h)
	{
		setText(t);

		setVisibility(true);

		stat=RELEASED;
	};

	void setText(const char *t);

	virtual void render();
	virtual void _onLeftButtonDown(POINT mPos, UINT keyFlags);
	virtual void _onLeftButtonUp(POINT mPos, UINT keyFlags);

protected:
	char *text;
	int text_length;
	POINT text_pos;
	enum bt_stat { PRESSED, RELEASED} stat;
};

#endif //GUI_BUTTON		