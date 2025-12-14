#ifndef _CSTATUSBAR_H_
#define _CSTATUSBAR_H_

#include "Core_Global.h"
#include "cRelCamera.h"
#include "cPlayer.h"

class cStatusBar{
	private:
		cGraphics			*m_Graphics;
		cRelativeCamera		*m_RelCamera;
		cPlayer				*m_Player;

		cTexture			m_StatusBar;
		cTexture			m_ColorBar;
	
		int			m_PercentHP;
		int			m_PercentMP;

	public:
		cStatusBar();
	
		BOOL Create(cGraphics* Graphics, cRelativeCamera* RelCamera, cPlayer* Player);
		void SetStatus(int HP, int MaxHP, int MP, int MaxMP);
		BOOL RenderBar(); 
};

#endif