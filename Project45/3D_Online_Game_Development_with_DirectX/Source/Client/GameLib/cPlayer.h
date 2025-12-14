#ifndef _CPLAYER_H_
#define _CPLAYER_H_

#include "cCreature.h"

#define	MAX_PLAYERTEXTURE 16

//============================================================================
// Class : cPlayer
//============================================================================
class cPlayer : public cCreature
{
	private:
		cVertexBuffer	*m_HeadVB;
		cVertexBuffer	*m_BodyVB;
		cTexture		*m_HeadTex;
		cTexture		*m_BodyTex;

		cVertexBuffer	*m_ShadowVB;
		cTexture		*m_ShadowTex;

		DPNID		m_PID;
		
		char		m_Message[128];
		DWORD		m_MessageTime;

	private:
		// use orderly in update function
		virtual void UpdateAction();
		virtual void UpdateDirection();
		virtual BOOL SetTexture();

	public:
		cPlayer();
		~cPlayer();

		BOOL Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape, 
					cTexture *NumTexture, cTexture *HeadTexture, cTexture *BodyTexture, 
					cTexture *ShadowTexture, DPNID PID);
		virtual BOOL Free();

		virtual BOOL Update();
		virtual BOOL Render();

		DPNID GetPID()			{ return m_PID;	}
		
		char* GetMessage()		{ return m_Message; }
		DWORD GetMessageTime()	{ return m_MessageTime; }

		void SayMessage(char* Message);
};

//============================================================================
// Class : cPlayerList
//============================================================================
class cPlayerList{
	private:
		cGraphics			*m_Graphics;
		cRelativeCamera		*m_RelCamera;
		cLandscape			*m_Landscape;
		cTexture			*m_NumTexture;

		cTexture		*m_HeadTex[MAX_PLAYERTEXTURE];
		cTexture		*m_BodyTex[MAX_PLAYERTEXTURE];
		int				m_HeadID[MAX_PLAYERTEXTURE];
		int				m_BodyID[MAX_PLAYERTEXTURE];
		int				m_HeadTexCount;
		int				m_BodyTexCount;

		cTexture		*m_ShadowTex;

		typedef struct sNode{
			cPlayer*	Player;
			sNode*		Next;

			sNode(){
				Player = NULL;
				Next = NULL;
			}

			~sNode(){
				SAFE_DELETE(Player);
				//SAFE_DELETE(Next);
			}
		} sNode;

		sNode*	m_FirstNode;	// First Node is MainPlayer node

		cFont*	m_Font;

	private:
		BOOL AddHeadTexture(int HeadID);
		BOOL AddBodyTexture(int BodyID);
		cTexture* GetTextureByHeadID(int HeadID);
		cTexture* GetTextureByBodyID(int BodyID);

	public:
		cPlayerList();
		~cPlayerList();

		BOOL Free();
		// create list and then add main player at first node
		BOOL Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape,
					cTexture *NumTexture);

		BOOL Render();
		BOOL RenderFont();
		BOOL RenderNumber();
		
		// Add main player at first node first node
		BOOL AddMainPlayer(DPNID PID, int HeadID, int BodyID, float XPos, float ZPos, int Orient);

		// Add other players after main player
		BOOL AddNode(DPNID PID, int HeadID, int BodyID, float XPos, float ZPos, int Orient);
		BOOL DeletePlayerByID(DPNID PID);

		BOOL GetMainPlayer(cPlayer** Player);
		BOOL GetPlayerByID(DPNID PID, cPlayer** Player);
		BOOL GetPlayerByMouse(long MouseX, long MouseY, cPlayer** Player);

		BOOL ResetEnermyForAll(cCreature* DiePlayer);
};

#endif
