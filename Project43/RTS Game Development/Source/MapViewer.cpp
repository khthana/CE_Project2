#include "MapViewer.h"
#include "ActionInterpreter.h"
#include "GodOfRenderring.h"
#include "Image.h"
#include "GameObject.h"
#include "GameMap.h"
#include "GameWorld.h"
#include "GroundLayerMap.h"

MapViewer *MapViewer::_instance = NULL;
MapViewer *MapViewer::Instance()
{
	if(_instance==NULL)
		_instance = new MapViewer();
	return _instance;
};
MapViewer::MapViewer()
:Gui_Container(GVIEW_WIDTH,GVIEW_HEIGHT)
{
	GameMap *map = getWorldMap();
	_bkgrnd = new Graphics(GVIEW_WIDTH, GVIEW_HEIGHT);
	lastViewPos.x = 0XFFFFFFFF;
	lastViewPos.y = 0XFFFFFFFF;
};

void MapViewer::render()
{
	renderSelf();
	renderSub();
}

void MapViewer::updateView()
{
	HDC hdc;
	GameMap *map = getWorldMap();
	POINT viewPos = getViewPos();
	GORenderringDataSet rds;
	HBRUSH greenbrush = (HBRUSH)CreateSolidBrush(RGB(0, 255, 0));
	HBRUSH redbrush = (HBRUSH)CreateSolidBrush(RGB(255, 0, 0));

	//clean it
	_graphics->Clear();


	int x,y;
	int j,i;
	int max_i, max_j;
	max_i = min(map->getWidth()-viewPos.x, MAX_VISIBLE_TILE_X);
	max_j = min(map->getHeight()-viewPos.y, MAX_VISIBLE_TILE_Y);

	if(viewPos.x != lastViewPos.x || viewPos.y != lastViewPos.y )
	{
		printf("update background\n");
		lastViewPos.x = viewPos.x;
		lastViewPos.y = viewPos.y;
		//update background
		for (j=0; j<max_j; j++)
		{
			for (i=0; i<max_i; i++)
			{
				if (GodOfRenderring::Instance ()->getGroundRIDS(&rds, GRND_SAND))
				{
					_bkgrnd->GDrawImage(rds.img, i*TILEWIDTH+rds.relPos.x, j*TILEHEIGHT+rds.relPos.y, &(rds.rc));
				}
			}
		}
	}
	{
		RECT rc = {100, 100, 200, 200};
		_graphics->GraphicsBlt(_bkgrnd, 0, 0, NULL);
	}

	_graphics->GGetDC(&hdc);

	//paint GameObjects
	GroundLayerMap *grnd1 = (GroundLayerMap *)getGameObjectMap(GRND_LYR_METRICS1);
	for(j=0; j<max_j; j++){
		for(i=0; i<max_i; i++){
			GameObject * GObj;
			if((GObj=grnd1->get(i+viewPos.x, j+viewPos.y))!=NULL){
				GORenderringID rid = GObj->getRenderringID(i+viewPos.x, j+viewPos.y);
				if(GodOfRenderring::Instance()->getRenderringDataSet(&rds, rid, GObj->getGroupID())){
					_graphics->GReleaseDC(hdc);
					_graphics->GDrawImage(rds.img, i*TILEWIDTH+rds.relPos.x, j*TILEHEIGHT+rds.relPos.y, &(rds.rc));
					_graphics->GGetDC(&hdc);
					if(GObj->getSelected()){
						RECT rc1 = {i*TILEWIDTH, (j-GObj->getHeight()+1)*TILEHEIGHT, (i+GObj->getWidth())*TILEWIDTH, (j+1)*TILEHEIGHT};
						FrameRect(hdc, &rc1, (HBRUSH)GetStockObject(WHITE_BRUSH));
						RECT rc2 = {i*TILEWIDTH, (j+1)*TILEHEIGHT, (i+GObj->getWidth())*TILEWIDTH, (j+1)*TILEHEIGHT+4};
						FillRect(hdc, &rc2, redbrush);
						double z = (1.00*GObj->getlife()/GObj->getmaxlife())*GObj->getWidth()*TILEWIDTH;
						rc2.right = rc2.left+z;
						FillRect(hdc, &rc2, greenbrush);
					}
				}
			}
		}
	}

	_graphics->GReleaseDC(hdc);
	DeleteObject(greenbrush);
	DeleteObject(redbrush);

};

void MapViewer::renderSelf() {
	updateView();
};

POINT MapViewer::resolveMap(int x, int y){
	POINT p;
	p.x = x/TILEWIDTH;
	p.y = y/TILEHEIGHT;
	return p;
};

void MapViewer::onLeftButtonDown(POINT mPos, UINT keyFlags)
{
	POINT p = resolveMap(mPos.x, mPos.y);
	POINT vp = getViewPos();
	p.x += vp.x;
	p.y += vp.y;
	ActionInterpreter::getCurrentInterpreter()->leftClickOnMap(p, keyFlags);
};

void MapViewer::onRightButtonDown(POINT mPos, UINT keyFlags)
{
	POINT p = resolveMap(mPos.x, mPos.y);
	POINT vp = getViewPos();
	p.x += vp.x;
	p.y += vp.y;
	ActionInterpreter::getCurrentInterpreter()->rightClickOnMap(p, keyFlags);
};
