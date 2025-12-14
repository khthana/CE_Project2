#ifndef CMEDIA_H
#define CMEDIA_H

//#ifndef INITGUID
//#define INITGUID
//#endif

#include <Dshow.h>
#include "CDynamicArray.h"

#define SAFE_DELETE(p)  { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }

//HRESULT DMedia_init(HWND const hwnd);
//void DMedia_cleanup();

//HRESULT DMedia_addVideo(TCHAR* filename,TCHAR* name);
//HRESULT DMedia_removeVideo(TCHAR* name);
//HRESULT DMedia_setVideoName(TCHAR* name,TCHAR* newname);
//HRESULT DMedia_setVideoFilename(TCHAR* name,TCHAR* filename);
//HRESULT DMedia_addBGM(TCHAR* filename,TCHAR* name);
//HRESULT DMedia_removeBGM(TCHAR* name);
//HRESULT DMedia_setBGMName(TCHAR* name,TCHAR* newname);
//HRESULT DMedia_setBGMFilename(TCHAR* name,TCHAR* filename);
//HRESULT Dmedia_setBGMLoop(TCHAR* name,DWORD const loop)
//HRESULT Dmedia_setBGMLoop(TCHAR* name)
//HRESULT Dmedia_resetBGMLoop(TCHAR* name)

//HRESULT DMedia_setVideoSourceRectangle(TCHAR* name,LONG const left,LONG const top,LONG const width,LONG const height);
//HRESULT DMedia_getVideoSourceRectangle(TCHAR* name,LONG& left,LONG& top,LONG& width,LONG& height);
//HRESULT DMedia_setVideoDestRectangle(TCHAR* name,LONG const left,LONG const top,LONG const width,LONG const height);
//HRESULT DMedia_getVideoDestRectangle(TCHAR* name,LONG& left,LONG& top,LONG& width,LONG& height);
//HRESULT DMedia_getFileVideoSize(TCHAR* name,LONG& width,LONG& height);

//HRESULT DMedia_getVideoVolume(TCHAR* name,LONG& volume);
//HRESULT DMedia_setVideoVolume(TCHAR* name,LONG const volume);
//HRESULT DMedia_getBGMVolume(TCHAR* name,LONG& volume);
//HRESULT DMedia_setBGMVolume(TCHAR* name,LONG const volume);

//HRESULT DMedia_getFileVideoEnd(TCHAR* name,LONGLONG& start);
//HRESULT DMedia_setVideoStart(TCHAR* name,LONGLONG const start);
//HRESULT DMedia_getVideoStart(TCHAR* name,LONGLONG& start);
//HRESULT DMedia_setVideoEnd(TCHAR* name,LONGLONG const start);
//HRESULT DMedia_getVideoEnd(TCHAR* name,LONGLONG& start);
//HRESULT DMedia_setVideoPlayRate(TCHAR* name,double rate);
//HRESULT DMedia_getVideoPlayRate(TCHAR* name,double rate);

//HRESULT DMedia_getFileBGMEnd(TCHAR* name,LONGLONG& start);
//HRESULT DMedia_setBGMStart(TCHAR* name,LONGLONG const start);
//HRESULT DMedia_getBGMStart(TCHAR* name,LONGLONG& start);
//HRESULT DMedia_setBGMEnd(TCHAR* name,LONGLONG const start);
//HRESULT DMedia_getBGMEnd(TCHAR* name,LONGLONG& start);
//HRESULT DMedia_setBGMPlayRate(TCHAR* name,double rate);
//HRESULT DMedia_getBGMPlayRate(TCHAR* name,double rate);

//HRESULT DMedia_load(TCHAR* name);
//HRESULT DMedia_play();
//HRESULT DMedia_pause();
//HRESULT DMedia_stop();
//HRESULT DMedia_unload();
//HRESULT DMedia_isPlay();
//HRESULT DMedia_isPause();
//HRESULT DMedia_isStop();
//HRESULT DMedia_getCurrentPosition(LONGLONG& pos);
//HRESULT DMedia_getStopPosition(LONGLONG& pos);

//HRESULT DMedia_setRenderWindow(LONG const left,LONG const top,LONG const width,LONG const height);
//HRESULT DMedia_getRenderWindow(LONG&left,LONG& top,LONG& width,LONG& height);
//HRESULT DMedia_setPlayRate(double rate);
//HRESULT DMedia_getPlayRate(double rate);
//HRESULT DMedia_setEnd(LONGLONG const start);
//HRESULT DMedia_getEnd(LONGLONG& start);
//HRESULT DMedia_setStart(LONGLONG const start);
//HRESULT DMedia_getStart(LONGLONG& start);
//HRESULT DMedia_getVolume(LONG& volume);
//HRESULT DMedia_setVolume(LONG const volume);

struct MEDIA_ROW
{
    DWORD handle;
    TCHAR name[MAX_PATH];
	TCHAR filename[MAX_PATH];
	LONG source_width;
	LONG source_height;
	LONG dest_width;
	LONG dest_height;
	LONG volume;
	double rate;
	LONGLONG start;
	LONGLONG end;
};

class CMVideo
{
protected:
	IGraphBuilder* m_pGraphBuilder;
	IMediaControl* m_pController;
	IMediaSeeking* m_pSeeker;
	IBasicAudio* m_pAudio;
	IBasicVideo2* m_pVideo;
	IVideoWindow* m_pWindow;
public:
	CMVideo();
	HRESULT open(TCHAR* filename,HWND const hwnd);
	void close();

	HRESULT setPostion(LONGLONG const curpos,LONGLONG const endpos);
	HRESULT getCurrentPosition(LONGLONG& pos);
	HRESULT getStopPosition(LONGLONG& pos);
	HRESULT getFileVideoSize(LONG& width,LONG& height);
};

class CMVideoPlayer:public CMVideo
{
public:
	HRESULT play();
	HRESULT stop();
	HRESULT pause();

	BOOL isPlay();
	BOOL isPause();
	BOOL isStop();

	HRESULT setPlayRate(TCHAR* name,double rate);
	HRESULT getPlayRate(TCHAR* name,double rate);
	HRESULT setEnd(LONGLONG const start);
	HRESULT getEnd(LONGLONG& start);
	HRESULT setStart(LONGLONG const start);
	HRESULT getStart(LONGLONG& start);
	HRESULT getVolume(LONG& volume);
	HRESULT setVolume(LONG const volume);
	HRESULT setRenderWindow(LONG const left,LONG const top,LONG const width,LONG const height);
	HRESULT getRenderWindow(LONG&left,LONG& top,LONG& width,LONG& height);
	HRESULT FullScreen(HWND ghApp);
	HRESULT WindowScreen(HWND ghApp);
};

class CMManager
{
private:
	CMVideoPlayer* t_pPlayer;
	typedef CDynamicArray<MEDIA_ROW> Arr_MediaRow;
	Arr_MediaRow MediaTable;

	BOOL findDupName(TCHAR* name);
public:
	CMManager();
	HRESULT init();
	void cleanup();

	HRESULT addVideo(TCHAR* filename,TCHAR* name);
	HRESULT removeVideo(TCHAR* name);
	HRESULT setVideoName(TCHAR* name,TCHAR* newname);
	HRESULT setVideoFilename(TCHAR* name,TCHAR* filename);
	HRESULT setBGMLoop(TCHAR* name,DWORD const loop);
	HRESULT setBGMLoop(TCHAR* name);
	HRESULT resetBGMLoop(TCHAR* name);

	HRESULT addBGM(TCHAR* filename,TCHAR* name);
	HRESULT removeBGM(TCHAR* name);
	HRESULT setBGMName(TCHAR* name,TCHAR* newname);
	HRESULT setBGMFilename(TCHAR* name,TCHAR* filename);

	HRESULT setVideoSourceRectangle(TCHAR* name,LONG const left,LONG const top,LONG const width,LONG const height);
	HRESULT getVideoSourceRectangle(TCHAR* name,LONG& left,LONG& top,LONG& width,LONG& height);
	HRESULT setVideoDestRectangle(TCHAR* name,LONG const left,LONG const top,LONG const width,LONG const height);
	HRESULT getVideoDestRectangle(TCHAR* name,LONG& left,LONG& top,LONG& width,LONG& height);
	HRESULT getFileVideoSize(TCHAR* name,LONG& width,LONG& height);

	HRESULT getVideoVolume(TCHAR* name,LONG& volume);
	HRESULT setVideoVolume(TCHAR* name,LONG const volume);
	HRESULT getBGMVolume(TCHAR* name,LONG& volume);
	HRESULT setBGMVolume(TCHAR* name,LONG const volume);

	HRESULT getFileVideoEnd(TCHAR* name,LONGLONG& start);
	HRESULT setVideoStart(TCHAR* name,LONGLONG const start);
	HRESULT getVideoStart(TCHAR* name,LONGLONG& start);
	HRESULT setVideoEnd(TCHAR* name,LONGLONG const start);
	HRESULT getVideoEnd(TCHAR* name,LONGLONG& start);
	HRESULT setVideoPlayRate(TCHAR* name,double rate);
	HRESULT getVideoPlayRate(TCHAR* name,double rate);

	HRESULT getFileBGMEnd(TCHAR* name,LONGLONG& start);
	HRESULT setBGMStart(TCHAR* name,LONGLONG const start);
	HRESULT getBGMStart(TCHAR* name,LONGLONG& start);
	HRESULT setBGMEnd(TCHAR* name,LONGLONG const start);
	HRESULT getBGMEnd(TCHAR* name,LONGLONG& start);
	HRESULT setBGMPlayRate(TCHAR* name,double rate);
	HRESULT getBGMPlayRate(TCHAR* name,double rate);

	HRESULT load(TCHAR* name);
	HRESULT play();
	HRESULT pause();
	HRESULT stop();
	HRESULT unload();
	BOOL isPlay();
	BOOL isPause();
	BOOL isStop();
	HRESULT getCurrentPosition(LONGLONG& pos);
	HRESULT getStopPosition(LONGLONG& pos);

	HRESULT setRenderWindow(LONG const left,LONG const top,LONG const width,LONG const height);
	HRESULT getRenderWindow(LONG&left,LONG& top,LONG& width,LONG& height);
	HRESULT setPlayRate(double rate);
	HRESULT getPlayRate(double rate);
	HRESULT setEnd(LONGLONG const start);
	HRESULT getEnd(LONGLONG& start);
	HRESULT setStart(LONGLONG const start);
	HRESULT getStart(LONGLONG& start);
	HRESULT getVolume(LONG& volume);
	HRESULT setVolume(LONG const volume);
};

#endif