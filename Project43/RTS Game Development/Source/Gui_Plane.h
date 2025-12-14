#ifndef GUI_PLANE
#define GUI_PLANE

#include <windows.h>
#include <windef.h>
#include <math.h>
#include "Graphics.h"

#define TRANS_RGB RGB(255,255,255)

class Gui_Plane{
//-----------------------------------------------------------
//	begin: Window management control
//-----------------------------------------------------------
public:
	virtual void setParent(Gui_Plane * p);
	virtual Gui_Plane *getParent();
	virtual void setVisibility(bool v);
	virtual bool getVisibility();
//-----------------------------------------------------------
//	end: Window management control
//-----------------------------------------------------------
//-----------------------------------------------------------
//	begin: Coordination
//-----------------------------------------------------------
	virtual void setPos(int x, int y);
	virtual POINT getPos();
	virtual void setSize(int w, int h);
	virtual SIZE getSize();
	virtual bool isContain(POINT p);
	virtual Gui_Plane * getObjectAtCoord(POINT p);
//-----------------------------------------------------------
//	end: Coordination
//-----------------------------------------------------------
//-----------------------------------------------------------
//	begin: Rendering
//-----------------------------------------------------------
	virtual Graphics *getGraphics();
	virtual void render();
	void refresh();
	bool isRefreshing();
//-----------------------------------------------------------
//	end: Rendering
//-----------------------------------------------------------
//-----------------------------------------------------------
//	begin: Window Message Management
//-----------------------------------------------------------
	virtual void calcall();

	virtual void _onLeftButtonDown(POINT mPos, UINT keyFlags);
	virtual void _onLeftButtonUp(POINT mPos, UINT keyFlags);
	virtual void _onRightButtonDown(POINT mPos, UINT KeyFlags);
	virtual void _onRightButtonUp(POINT mPos, UINT KeyFlags);
	virtual void _onMouseMove(UINT par1, UINT par2);
	virtual void _onKeyDown(UINT par1, UINT par2);
	virtual void _onKeyUp(UINT par1, UINT par2);

	virtual void onLeftButtonDown(POINT mPos, UINT keyFlags);
	virtual void onLeftButtonUp(POINT mPos, UINT keyFlags);
	virtual void onRightButtonDown(POINT mPos, UINT keyFlags);
	virtual void onRightButtonUp(POINT mPos, UINT keyFlags);
	virtual void onMouseMove(UINT par1, UINT par2);
	virtual void onKeyDown(UINT par1, UINT par2);
	virtual void onKeyUp(UINT par1, UINT par2);
//-----------------------------------------------------------
//	end: Window Message Management
//-----------------------------------------------------------
	virtual void ReleaseAllObject();
protected:
	Gui_Plane(int width, int height);
	Gui_Plane * _parent;
	bool b_Visibility;
	bool b_isRefreshing;
	POINT _pos;
	SIZE _size;
	Graphics *_graphics;
};

#endif//GUI_PLANE