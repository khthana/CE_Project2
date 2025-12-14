#ifndef GUI_CONTAINER
#define GUI_CONTAINER

#include "Gui_Plane.h"
#include "Graphics.h"

#include <list>
using namespace std;

class Gui_Container:public Gui_Plane{
public:
	Gui_Container(int width, int height)
		:Gui_Plane(width, height)
	{};
//-------------------------------------------------------------
//	begin: Containment Management
//-------------------------------------------------------------
	int add(Gui_Plane * aComp);
	int remove(Gui_Plane * aComp);
	Gui_Plane * findChildAtCoord(POINT p);
	virtual Gui_Plane * getObjectAtCoord(POINT p);
//-------------------------------------------------------------
//	begin: Action
//-------------------------------------------------------------
	virtual void _onLeftButtonDown(POINT mPos, UINT keyFlags);
	virtual void _onLeftButtonUp(POINT mPos, UINT keyFlags);
	virtual void _onRightButtonDown(POINT mPos, UINT keyFlags);
	virtual void _onRightButtonUp(POINT mPos, UINT keyFlags);
//-------------------------------------------------------------
//	begin: Renderring
//-------------------------------------------------------------
	virtual void render();
	virtual void renderSelf();
	virtual void renderSub();
//-------------------------------------------------------------
//	end: Renderring
//-------------------------------------------------------------
	virtual void ReleaseAllObject();
protected:
	list<Gui_Plane *> subComponents;
};

#endif//GUI_CONTAINER