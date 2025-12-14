#ifndef _GFXManager
#define _GFXManager

#include <windows.h>
#include <ddraw.h>

#define GFX_DISPLAYSIZE_X 800
#define GFX_DISPLAYSIZE_Y 600

class GFXManager{
public:
	static GFXManager *createInstance(HWND hWnd);
	~GFXManager();
	static int Init();
	static LPDIRECTDRAWSURFACE7 GetBackBuffer(){ return(ddSecondarySurface);};
	static LPDIRECTDRAWSURFACE7 GetFrontBuffer(){ return(ddPrimarySurface);};
	static LPDIRECTDRAW7 GetDDObject(){ return(mainDDObj);};
	static void ShowScreen(LPDIRECTDRAWSURFACE7 surface);
	static void ReleaseAllObjects();
	static void Bad(char *s, int x, int y);
private:
	static GFXManager* _instance;
	GFXManager(HWND hWnd){ this->_hWnd=hWnd;};
	static HWND _hWnd;
	static LPDIRECTDRAW7	mainDDObj;
	static LPDIRECTDRAWSURFACE7	ddPrimarySurface;
	static LPDIRECTDRAWSURFACE7	ddSecondarySurface;
	static LPDIRECTDRAWSURFACE7	ddOffScreenSurface1;
	static LPDIRECTDRAWSURFACE7	ddOffScreenSurface2;
};

#endif _GFXManager