#include "Graphics.h"

Graphics::Graphics(int width, int height){
	HRESULT ddRetVal;

	DDSURFACEDESC2	ddSDesc;

	ZeroMemory(&ddSDesc, sizeof(ddSDesc));
	ddSDesc.dwSize=sizeof(ddSDesc);
	ddSDesc.dwFlags=DDSD_CAPS| DDSD_WIDTH| DDSD_HEIGHT;
	ddSDesc.ddsCaps.dwCaps=DDSCAPS_OFFSCREENPLAIN;
	ddSDesc.dwWidth=width;
	ddSDesc.dwHeight=height;

	ddRetVal = GFXManager::GetDDObject()->CreateSurface( &ddSDesc, &_surface, NULL);
	
	_size.cx=width;
	_size.cy=height;

	setTransparency(false);
	Clear();
};

void Graphics::GraphicsBlt(Graphics *srcGFX, int dest_x, int dest_y, LPRECT lprc){
	RECT srcRect;
	SIZE src_size=srcGFX->getSize();
	SIZE dest_size=getSize();
	DWORD dwTrans;
	
	if(lprc==NULL){
		srcRect.left=0;
		srcRect.top=0;
		srcRect.right=src_size.cx-1;
		srcRect.bottom=src_size.cy-1;
	}else{
		srcRect.left=lprc->left;
		srcRect.top=lprc->top;
		srcRect.right=lprc->right;
		srcRect.bottom=lprc->bottom;
	}

	int exceed_x=dest_size.cx-(dest_x+srcRect.right-srcRect.left);
	int exceed_y=dest_size.cy-(dest_y+srcRect.bottom-srcRect.top);
	if(exceed_x<0)
		srcRect.right+=exceed_x;
	if(exceed_y<0)
		srcRect.bottom+=exceed_y;
	
	if(srcRect.right>=src_size.cx)
		srcRect.right=src_size.cx-1;
	if(srcRect.bottom>src_size.cy)
		srcRect.bottom=src_size.cy-1;

	LPDIRECTDRAWSURFACE7 srcSurface=srcGFX->getSurface();
	if(srcSurface==NULL)
		return;
	
	dwTrans=(srcGFX->getTransparency())? DDBLTFAST_SRCCOLORKEY:DDBLTFAST_NOCOLORKEY;

	_surface->BltFast(dest_x, dest_y, srcSurface, &srcRect, dwTrans);
};

void Graphics::Clear(){
	DDBLTFX BltFX;
	
	BltFX.dwSize = sizeof(BltFX);
	BltFX.dwFillColor = 1;
	_surface->Blt(NULL, NULL, NULL, DDBLT_COLORFILL, &BltFX);
};

void Graphics::GGetDC(HDC *ref_hdc){
	_surface->GetDC(ref_hdc);
};

void Graphics::GReleaseDC(HDC hdc){
	_surface->ReleaseDC(hdc);
};

void Graphics::GDrawImage(Image *image, int dest_x, int dest_y, const RECT *lprc){
	DWORD dwTrans;
	RECT rc;

	if(lprc==NULL){
		SIZE sz=image->getSize();
		rc.left=0;
		rc.top=0;
		rc.right=sz.cx;
		rc.bottom=sz.cy;
	}else{
		rc.left=lprc->left;
		rc.top=lprc->top;
		rc.right=lprc->right;
		rc.bottom=lprc->bottom;
	}

	SIZE gsz=getSize();
	int width=rc.right-rc.left;
	int height=rc.bottom-rc.top;
	int exceed_x=gsz.cx-(dest_x+width);
	int exceed_y=gsz.cy-(dest_y+height);
	if(exceed_x<0)
		rc.right+=exceed_x;
	if(exceed_y<0)
		rc.bottom+=exceed_y;

	LPDIRECTDRAWSURFACE7 srcSurface=image->getSurface();
	if(srcSurface==NULL)
		return;
	
	dwTrans=(image->getTransparency())? DDBLTFAST_SRCCOLORKEY:DDBLTFAST_NOCOLORKEY;

  	_surface->BltFast(dest_x, dest_y, srcSurface, &rc, dwTrans);
};

void Graphics::ReleaseAllObject(){
	if(_surface!=NULL){
		_surface->Release();
	}
};
