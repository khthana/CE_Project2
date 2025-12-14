#ifndef MiniMapViewer_header
#define MiniMapViewer_header

#include "Gui.h"

#define MINI_GVIEW_WIDTH 200
#define MINI_GVIEW_HEIGHT 200

class MiniMapViewer:public Gui_Plane{
public:
	static MiniMapViewer *Instance();
	POINT resolveMap(int x, int y);
	POINT getMiniPos(int x, int y);
	void updateView();
	virtual void render();

	virtual void onLeftButtonDown(POINT mPos, UINT keyFlags);
	virtual void onLeftButtonUp(POINT mPos, UINT keyFlags);
	virtual void onRightButtonDown(POINT mPos, UINT keyFlags);
	virtual void onRightButtonUp(POINT mPos, UINT keyFlags);
	virtual void onMouseMove(UINT par1, UINT par2);
	virtual void onKeyDown(UINT par1, UINT par2);
	virtual void onKeyUp(UINT par1, UINT par2);
protected:
	MiniMapViewer();
	static MiniMapViewer *_instance;
	POINT game_map_size;
	POINT visible_size;
	RECT visible_rect;
};

#endif MiniMapViewer_header