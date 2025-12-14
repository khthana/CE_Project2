#ifndef _GOD_OF_RENDERRING_HEADER_
#define _GOD_OF_RENDERRING_HEADER_

#include "Image.h"
#include "GameConfig.h"
#include "GameMap.h"
#include <map>
using namespace std;

typedef long GORenderringID;

class GORenderringDataSet{
public:
	GORenderringDataSet();
	GORenderringDataSet(Image *img, long relX, long relY,
						long left, long top, long right, long bottom);
	copy(GORenderringDataSet *master);
	Image *img;
	POINT relPos;
	RECT rc;
};

typedef map<long, GORenderringDataSet *, less<long> > GORenderringDataTable;

class GodOfRenderring{
public:
	static GodOfRenderring *Instance();
	void InitRenderringData();
	bool loadPlayerBMP(int pid, const char *fname);
	bool loadGroundBMP(const char *fname);
	bool mapGObjBMP(GORenderringID key, int rX, int rY, int left, int top, int right, int bottom);
	bool mapGroundBMP(GROUNDTYPE grndtype, int rX, int rY, int left, int top, int right, int bottom);
	bool getRenderringDataSet(GORenderringDataSet *rds, GORenderringID rid, int ggroupid);
	bool getGroundRIDS(GORenderringDataSet *rds, GROUNDTYPE gtype);
	HBRUSH getPlayerColor(int pid);
protected:
	GodOfRenderring();
	static GodOfRenderring *_instance;
	ImagePtr _playerBMP[MAXPLAYER+1];
	ImagePtr _groundBMP;
	GORenderringDataTable _table;
	GORenderringDataTable _grndtab;
	HBRUSH _playerColor[MAXPLAYER+1];
};

GORenderringID createGORenderringID(int gtype, int action, int specialstep, int dir, int actionstep);

#endif _GOD_OF_RENDERRING_HEADER_