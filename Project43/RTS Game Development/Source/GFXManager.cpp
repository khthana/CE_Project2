#include "GFXManager.h"

GFXManager				*GFXManager::_instance=NULL;
HWND					GFXManager::_hWnd=NULL;
LPDIRECTDRAW7			GFXManager::mainDDObj=NULL;
LPDIRECTDRAWSURFACE7	GFXManager::ddPrimarySurface=NULL;
LPDIRECTDRAWSURFACE7	GFXManager::ddSecondarySurface=NULL;
LPDIRECTDRAWSURFACE7	GFXManager::ddOffScreenSurface1=NULL;
LPDIRECTDRAWSURFACE7	GFXManager::ddOffScreenSurface2=NULL;

GFXManager *GFXManager::createInstance(HWND hWnd)
{
	if(_instance==NULL){
		_instance = new GFXManager(hWnd);
	}else if(hWnd!=_instance->_hWnd){
		return (NULL);
	}
	return(_instance);
}

int GFXManager::Init()
{
	HRESULT ddRetVal;
	DDSURFACEDESC2	ddSDesc;
	DDSCAPS2 ddSCaps;
	
	ddRetVal = DirectDrawCreateEx(NULL, (LPVOID *)&mainDDObj, IID_IDirectDraw7, NULL);
	if(ddRetVal!=DD_OK){
		ReleaseAllObjects();
		return -1;
	}

	ddRetVal = mainDDObj->SetCooperativeLevel(_hWnd, DDSCL_FULLSCREEN| DDSCL_EXCLUSIVE);
	if(ddRetVal!=DD_OK)
	{
		ReleaseAllObjects();
		return -1;
	}

	ddRetVal = mainDDObj->SetDisplayMode(GFX_DISPLAYSIZE_X, GFX_DISPLAYSIZE_Y, 16, 0, 0);
	if(ddRetVal!=DD_OK)
	{
		ReleaseAllObjects();
		return -1;
	}

	ZeroMemory(&ddSDesc, sizeof(ddSDesc));
	ddSDesc.dwSize=sizeof(ddSDesc);
	ddSDesc.dwFlags= DDSD_CAPS| DDSD_BACKBUFFERCOUNT;
	ddSDesc.ddsCaps.dwCaps=DDSCAPS_PRIMARYSURFACE|
							DDSCAPS_FLIP|
							DDSCAPS_COMPLEX;
	ddSDesc.dwBackBufferCount=2;

	ddRetVal = mainDDObj->CreateSurface(&ddSDesc, &ddPrimarySurface, NULL);
	if(ddRetVal!=DD_OK)
	{
		ReleaseAllObjects();
		return -1;
	}

	ZeroMemory(&ddSCaps, sizeof(ddSCaps));
	ddSCaps.dwCaps=DDSCAPS_BACKBUFFER;

	ddRetVal = ddPrimarySurface->GetAttachedSurface(&ddSCaps, &ddSecondarySurface);
	if(ddRetVal!=DD_OK)
	{
		ReleaseAllObjects();
		return -1;
	}

	ZeroMemory(&ddSDesc, sizeof(ddSDesc));
	ddSDesc.dwSize=sizeof(ddSDesc);
	ddSDesc.dwFlags=DDSD_CAPS| DDSD_WIDTH| DDSD_HEIGHT;
	ddSDesc.ddsCaps.dwCaps=DDSCAPS_OFFSCREENPLAIN;
	ddSDesc.dwWidth=GetSystemMetrics(SM_CXSCREEN);
	ddSDesc.dwHeight=GetSystemMetrics(SM_CYSCREEN);

	ddRetVal = mainDDObj->CreateSurface( &ddSDesc, &ddOffScreenSurface1, NULL);
	if(ddRetVal!=DD_OK)
	{
		ReleaseAllObjects();
		return -1;
	}

	ddRetVal = mainDDObj->CreateSurface( &ddSDesc, &ddOffScreenSurface2, NULL);
	if(ddRetVal!=DD_OK)
	{
		ReleaseAllObjects();
		return -1;
	}

	DDBLTFX BltFX;
	
	BltFX.dwSize = sizeof(BltFX);
	BltFX.dwFillColor = 1;
	ddPrimarySurface->Blt(NULL, NULL, NULL, DDBLT_COLORFILL, &BltFX);
	ddSecondarySurface->Blt(NULL, NULL, NULL, DDBLT_COLORFILL, &BltFX);
	ddOffScreenSurface1->Blt(NULL, NULL, NULL, DDBLT_COLORFILL, &BltFX);
	ddOffScreenSurface2->Blt(NULL, NULL, NULL, DDBLT_COLORFILL, &BltFX);

	return 0;
}

GFXManager::~GFXManager()
{
	ReleaseAllObjects();
}

void GFXManager::ReleaseAllObjects()
{
	if(mainDDObj!=NULL)
	{
		if(ddPrimarySurface!=NULL)
		{
			if(ddSecondarySurface!=NULL)
			{
				if(ddOffScreenSurface1!=NULL)
				{
					if(ddOffScreenSurface2!=NULL)
					{
						ddOffScreenSurface2->Release();
					}
					ddOffScreenSurface1->Release();
				}
				ddSecondarySurface->Release();
			}
			ddPrimarySurface->Release();
		}
		mainDDObj->Release();
	}
};

void GFXManager::ShowScreen(LPDIRECTDRAWSURFACE7 surface)
{
	if(surface==NULL)
		return;

	RECT srcRect;

	srcRect.left=0;
	srcRect.top=0;
	srcRect.right=GetSystemMetrics(SM_CXSCREEN)-1;
	srcRect.bottom=GetSystemMetrics(SM_CYSCREEN)-1;

	GetBackBuffer()->BltFast(0, 0, surface, &srcRect, DDBLTFAST_NOCOLORKEY);
	GetFrontBuffer()->Flip(NULL, DDFLIP_WAIT);
};

void GFXManager::Bad(char *s, int x, int y){
	HDC hdc;
	ddSecondarySurface->GetDC(&hdc);
	TextOut(hdc, x, y, s, strlen(s));
	ddSecondarySurface->ReleaseDC(hdc);
};
