#ifndef _CMINIMAP_H_
#define _CMINIMAP_H_

#include "Core_Global.h"
#include "cPlayer.h"

class cMiniMap{
	private:
		cGraphics			*m_Graphics;
		cPlayer				*m_Player;

		cTexture			m_MiniMap;
		cTexture			m_MiniMapPos;

	public:
		cMiniMap();
	
		BOOL Create(cGraphics* Graphics, cPlayer* Player);
		BOOL RenderMap(HWND hWnd); 
};

#endif