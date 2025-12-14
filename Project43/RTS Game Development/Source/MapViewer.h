#ifndef _MAPVIEWER_header_
#define _MAPVIEWER_header_

#include "Gui.h"

#define TILEWIDTH 20
#define TILEHEIGHT 20
#define GVIEW_WIDTH 800
#define GVIEW_HEIGHT 450
#define MAX_VISIBLE_TILE_X (GVIEW_WIDTH/TILEWIDTH)
#define MAX_VISIBLE_TILE_Y (GVIEW_HEIGHT/TILEHEIGHT)

class MapViewer:public Gui_Container{
public:
	static MapViewer *Instance();
	POINT resolveMap(int x, int y);
	void updateView();
	virtual void renderSelf();
	virtual void render();

	virtual void onLeftButtonDown(POINT mPos, UINT keyFlags);
	virtual void onLeftButtonUp(POINT mPos, UINT keyFlags){};
	virtual void onRightButtonDown(POINT mPos, UINT keyFlags);
	virtual void onRightButtonUp(POINT mPos, UINT keyFlags){};
	virtual void onMouseMove(UINT par1, UINT par2){};
	virtual void onKeyDown(UINT par1, UINT par2){};
	virtual void onKeyUp(UINT par1, UINT par2){};
protected:
	MapViewer();
	static MapViewer *_instance;
	Graphics *_bkgrnd;
	POINT lastViewPos;
};

#endif _MAPVIEWER_header_