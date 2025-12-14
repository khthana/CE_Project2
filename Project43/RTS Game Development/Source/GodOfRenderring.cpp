#include "GodOfRenderring.h"
#include "gui.h"

//---------------------GORenderringDataSet--------------------
GORenderringDataSet::GORenderringDataSet()
{
	img = NULL;
};
GORenderringDataSet::GORenderringDataSet(Image *img, long relX, long relY,
						long left, long top, long right, long bottom)
{
	this->img = img;
	relPos.x = relX;
	relPos.y = relY;
	rc.left = left;
	rc.top = top;
	rc.right = right;
	rc.bottom = bottom;
};
GORenderringDataSet::copy(GORenderringDataSet *master)
{
	img = master->img;
	relPos.x = master->relPos.x;
	relPos.y = master->relPos.y;
	rc.left = master->rc.left;
	rc.top = master->rc.top;
	rc.right = master->rc.right;
	rc.bottom = master->rc.bottom;
};

//-----------------------GodOfRenderring----------------------
GodOfRenderring *GodOfRenderring::_instance=NULL;

GodOfRenderring *GodOfRenderring::Instance()
{
	if(_instance==NULL)
		_instance = new GodOfRenderring();
	return _instance;
};


bool GodOfRenderring::loadPlayerBMP (int pid, const char *fname)
{
	if (pid < 0 || pid > MAXPLAYER+1)
		return false;
	Image *img = new Image();
	if (img->loadBitmap(fname) == 0)
	{
		img->setTransparency(true);
		img->setTransparentColor(TRANS_RGB);
		_playerBMP[pid] = img;
		return true;
	}
	else
		return false;
};

bool GodOfRenderring::loadGroundBMP (const char *fname)
{
	Image *img = new Image();
	if (img->loadBitmap(fname) == 0)
	{
		_groundBMP = img;
		return true;
	}
	else
		return false;
};

GodOfRenderring::GodOfRenderring()
{
};

bool 
GodOfRenderring::mapGObjBMP(GORenderringID key, int rX, int rY, int left, int top, int right, int bottom)
{
	GORenderringDataSet *rds = new GORenderringDataSet(NULL, rX, rY, left, top, right, bottom);
	_table.insert(GORenderringDataTable::value_type(key , rds));
	return true;
};

bool 
GodOfRenderring::mapGroundBMP(GROUNDTYPE grndtype, int rX, int rY, int left, int top, int right, int bottom)
{
	GORenderringDataSet *rds = new GORenderringDataSet(NULL, rX, rY, left, top, right, bottom);
	_grndtab.insert(GORenderringDataTable::value_type((long)grndtype, rds));
	return true;
};

void GodOfRenderring::InitRenderringData()
{
	_playerColor[0] = (HBRUSH)CreateSolidBrush(RGB(50, 50 ,255));
	_playerColor[1] = (HBRUSH)CreateSolidBrush(RGB(255, 50 ,50));
	_playerColor[8] = (HBRUSH)CreateSolidBrush(RGB(50, 50 ,80));

}

bool GodOfRenderring::getRenderringDataSet(GORenderringDataSet *rds, GORenderringID rid, int ggroupid)
{
	GORenderringDataTable::iterator it = _table.find(rid);
	if(it==_table.end()){
		return false;
	}
	rds->copy((*it).second);

	rds->img = _playerBMP[ggroupid];

	return true;
};

bool GodOfRenderring::getGroundRIDS(GORenderringDataSet *rds, GROUNDTYPE gtype)
{
	long key = (long) gtype;
	GORenderringDataTable::iterator it = _grndtab.find(key);
	if(it==_grndtab.end())
		return false;
	else
		rds->copy((*it).second);

	rds->img = _groundBMP;
	return true;
};

HBRUSH GodOfRenderring::getPlayerColor(int pid)
{
	return _playerColor[pid];
};

GORenderringID createGORenderringID(int gtype, int action, int specialstep, int dir, int actionstep)
{
	GORenderringID rid=(gtype<<20)|(action<<16)|(specialstep<<8)|(dir<<4)|actionstep;
	return rid;
};
