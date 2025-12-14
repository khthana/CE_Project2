#ifndef _CCREATURE_H_
#define _CCREATURE_H_

#include "Core_Global.h"
#include "cLandscape.h"
#include "cRelCamera.h"
#include "cNumber.h"

//============================================================================
// Class : cCreature
//============================================================================
class cCreature{
	protected:
		cGraphics			*m_Graphics;
		cRelativeCamera		*m_RelCamera;
		cLandscape			*m_Landscape;

		typedef struct sVertex{
			FLOAT x, y, z;
			DWORD color;
			FLOAT u,v;
		} sVertex;

		enum Direction { DOWN, RIGHT_DOWN, RIGHT, RIGHT_UP, UP, LEFT_UP, LEFT, LEFT_DOWN };
		Direction	m_Direction; // Direction which face to camera

		enum Action { STAND, WALK, ATTACK, ATTACK_WAIT, ATTACKED, DIE };
		Action		m_Action;	
		float		m_ActionCount;
		
		int			m_Orient;
		float		m_XPos, m_YPos, m_ZPos;
		float		m_XTarget, m_ZTarget;

		DWORD		m_LoopTime;
		DWORD		m_LastTime;

		char		m_Name[16];
		DWORD		m_NameTime;
		
		cCreature	*m_Enermy;
		AttackType	m_IsAttack;

		BOOL		m_IsAlive;

		cNumber		*m_Number;

	protected:
		// use orderly in update function
		void UpdateTime();
		void UpdatePosition();
		virtual void UpdateAction() = 0;
		virtual void UpdateDirection() = 0;
		virtual BOOL SetTexture() = 0;

	public:
		cCreature();
		~cCreature();

		BOOL Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape,
			cTexture *NumTexture);
		virtual BOOL Free();

		virtual BOOL Update() = 0;
		virtual BOOL Render() = 0;

		float GetXPos()			{ return m_XPos; }
		float GetYPos()			{ return m_YPos; }
		float GetZPos()			{ return m_ZPos; }
		int	  GetOrient()		{ return m_Orient; }
		char* GetName()			{ return m_Name; }
		DWORD GetNameTime()		{ return m_NameTime; }
		
		void SetPosition(float XPos, float ZPos);
		void SetOrientation(int Orient);

		void SetName(char* Name);
		void ShowName();

		void ShowNumber(int Number);
		void SetNumberSide(BOOL IsPlayerSide);
		BOOL RenderNumber();

		void MoveTo(float XTarget, float ZTarget);

		void SetEnermy(cCreature *Enermy, AttackType Type);
		void ResetEnermy();
		//void MoveToEnermy();
		void Attack();
		void Attacked();
		BOOL IsNearEnermy();
		AttackType IsAttack()	{ return m_IsAttack; }
		cCreature* GetEnermy()	{ return m_Enermy; }

		void Die();
		void Reborn();
		BOOL IsAlive()			{ return m_IsAlive; }
};

#endif