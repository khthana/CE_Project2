#ifndef _CMONSTER_H_
#define _CMONSTER_H_

#include "cCreature.h"

#define MAX_COUNT			30	// Max count of monster array
#define MAX_MONSTERTEXTURE	5

//============================================================================
// Class : cMonster
//============================================================================
class cMonster : public cCreature
{
	private:
		cVertexBuffer	*m_VB;
		cTexture		*m_Tex;

		cVertexBuffer	*m_ShadowVB;
		cTexture		*m_ShadowTex;

		int			m_MID;

	private:
		virtual void UpdateAction();
		virtual void UpdateDirection();
		virtual BOOL SetTexture();

	public:
		cMonster();
		~cMonster();

		BOOL Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape, 
				cTexture *NumTexture, cTexture *MonsterTexture,	cTexture *ShadowTexture, 
				int MID, int Type);
		virtual BOOL Free();

		virtual BOOL Update();
		virtual BOOL Render();

		int	  GetMID()			{ return m_MID;	}
};

//============================================================================
// Class : cMonsterArray
//============================================================================
class cMonsterArray{
	private:
		cGraphics			*m_Graphics;
		cRelativeCamera		*m_RelCamera;
		cLandscape			*m_Landscape;
		cTexture			*m_NumTexture;

		cTexture		*m_MonsterTex[MAX_MONSTERTEXTURE];
		int				m_MonsterID[MAX_MONSTERTEXTURE];
		int				m_MonsterTexCount;
		
		cTexture		*m_ShadowTex;

		cMonster*		m_Array[MAX_COUNT];
		int				m_Count;

		cFont*			m_Font;

	private:
		BOOL AddMonsterTexture(int MonsterID);
		cTexture* GetTextureByMonsterID(int MonsterID);

	public:
		cMonsterArray();
		~cMonsterArray();

		BOOL Free();
		// create array
		BOOL Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape,
			cTexture *NumTexture);

		BOOL Render();
		BOOL RenderFont();
		BOOL RenderNumber();
		
		BOOL AddMonster(int MID, int MonsterID, float XPos, float ZPos, int Orient);
		// BOOL DeleteMonsterByID(int MID);

		BOOL GetMonsterByID(int MID, cMonster** Monster);
		BOOL GetMonsterByMouse(long MouseX, long MouseY, cMonster** Monster);

		BOOL ResetEnermyForAll(cCreature* DiePlayer);
};

#endif
