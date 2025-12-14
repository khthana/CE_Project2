#ifndef _CNUMBER_H_
#define _CNUMBER_H_

#include "Core_Global.h"
#include "cRelCamera.h"

//============================================================================
// Class : cNumber
//============================================================================
class cNumber
{
	private:
		cGraphics			*m_Graphics;
		cTexture			*m_Texture;

		typedef struct sVertex{
			FLOAT x, y, z;
			DWORD color;
			FLOAT u,v;
		} sVertex;

		cVertexBuffer	*m_VB;

		BOOL		m_IsPlayerSide;

		DWORD		m_Time[5];
		int			m_Length[5];
		int			m_Count;

	private:
		void SetAnimate();

	public:
		cNumber();
		~cNumber();

		BOOL Create(cGraphics *Graphics, cTexture *Texture);
		BOOL Free();

		BOOL Render();

		void SetSide(BOOL IsPlayerSide)	{ m_IsPlayerSide = IsPlayerSide; }
		void SetPosition(float XPos, float YPos, float ZPos);

		BOOL ShowNumber(int number);
};

#endif