#include "MiniMapViewer.h"
#include "GameWorld.h"
#include "GodOfRenderring.h"
#include "ActionInterpreter.h"

MiniMapViewer *MiniMapViewer::_instance = NULL;
MiniMapViewer *MiniMapViewer::Instance()
{
	if(_instance==NULL)
		_instance = new MiniMapViewer();
	return _instance;
};
MiniMapViewer::MiniMapViewer()
:Gui_Plane(MINI_GVIEW_WIDTH, MINI_GVIEW_HEIGHT)
{
	int mapWidth, mapHeight, visWidth, visHeight, visX, visY;
	GameMap *gm = getWorldMap();
	mapWidth = gm->getWidth();
	mapHeight = gm->getHeight();

	visWidth = MINI_GVIEW_WIDTH;
	visHeight = static_cast<int>(1.0*visWidth*mapHeight/mapWidth);
	if(visHeight<=MINI_GVIEW_HEIGHT){
		visX = 0;
		visY = static_cast<int>(1.0*(MINI_GVIEW_HEIGHT-visHeight)/2);
	}else{
		visHeight = MINI_GVIEW_HEIGHT;
		visWidth = static_cast<int>(1.0*visHeight*mapWidth/mapHeight);
		visX = static_cast<int>(1.0*(MINI_GVIEW_WIDTH-visWidth)/2);
		visY = 0;
	}

	visible_size.x = visWidth;
	visible_size.y = visHeight;
	visible_rect.left = visX;
	visible_rect.right = visX+visWidth;
	visible_rect.top = visY;
	visible_rect.bottom = visY+visHeight;

	game_map_size.x = mapWidth;
	game_map_size.y = mapHeight;
};

POINT MiniMapViewer::resolveMap(int x, int y)
{
	int _x, _y;
	_x = x - visible_rect.left;
	_y = y - visible_rect.top;
	POINT p;
	p.x = (1.0*_x/visible_size.x)*game_map_size.x;
	p.y = (1.0*_y/visible_size.y)*game_map_size.y;
	return p;
};

POINT MiniMapViewer::getMiniPos(int x, int y)
{
	POINT p;
	p.x = (1.0*x/game_map_size.x)*visible_size.x+visible_rect.left;
	p.y = (1.0*y/game_map_size.y)*visible_size.y+visible_rect.top;
	return p;
};

void MiniMapViewer::updateView()
{
	HDC hdc;
	HBRUSH hBr;
	RECT border_rc={0,0,_size.cx-1,_size.cy-1};

	_graphics->Clear();

	_graphics->GGetDC(&hdc);//GetDC

	hBr = (HBRUSH)CreateSolidBrush(RGB(0,100, 50));
	FrameRect(hdc, &visible_rect, hBr);
	DeleteObject(hBr);
	hBr = (HBRUSH)CreateSolidBrush(RGB(200,100, 50));
	FrameRect(hdc, &border_rc, hBr);
	DeleteObject(hBr);

	//paint GameObjects
	int i, j, w, h;
	GroundLayerMap *grnd1 = (GroundLayerMap *)getGameObjectMap(GRND_LYR_METRICS1);
	w = grnd1->getWidth();
	h = grnd1->getHeight();
	for(j=0; j<h; j++){
		for(i=0; i<w; i++){
			GameObject * GObj;
			if((GObj=grnd1->get(i, j))!=NULL){
				hBr = GodOfRenderring::Instance()->getPlayerColor(GObj->getGroupID());				
				POINT p = getMiniPos(i, j);
				RECT rc = {p.x-2, p.y-2, p.x+2, p.y+2};
				FillRect(hdc, &rc, hBr);
			}
		}
	}

	_graphics->GReleaseDC(hdc);//ReleaseDC
};

void MiniMapViewer::render()
{
	updateView();
}

void MiniMapViewer::onLeftButtonDown(POINT mPos, UINT keyFlags)
{
	POINT p = resolveMap(mPos.x, mPos.y);
	ActionInterpreter::getCurrentInterpreter()->leftClickOnMiniMap(p, keyFlags);
};
void MiniMapViewer::onLeftButtonUp(POINT mPos, UINT keyFlags){};
void MiniMapViewer::onRightButtonDown(POINT mPos, UINT keyFlags)
{
	POINT p = resolveMap(mPos.x, mPos.y);
	ActionInterpreter::getCurrentInterpreter()->rightClickOnMiniMap(p, keyFlags);
};
void MiniMapViewer::onRightButtonUp(POINT mPos, UINT keyFlags){};
void MiniMapViewer::onMouseMove(UINT par1, UINT par2){};
void MiniMapViewer::onKeyDown(UINT par1, UINT par2){};
void MiniMapViewer::onKeyUp(UINT par1, UINT par2){};