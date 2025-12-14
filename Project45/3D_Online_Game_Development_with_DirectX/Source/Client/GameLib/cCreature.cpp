#include "Core_Global.h"
#include "cCreature.h"

#define WALKSPEED			0.004f		// 1ms -> 0.003f

//============================================================================
// Class : cCreature
//============================================================================
cCreature::cCreature()
{
	m_Graphics	= NULL;
	m_Landscape = NULL;
	m_RelCamera = NULL;
	
	m_Orient = 0;
	m_XPos = m_YPos = m_ZPos = 0.0f;
	m_XTarget = m_ZTarget = 0;

	m_Direction = DOWN;
	m_Action = STAND;
	m_ActionCount = 0.0f;

	m_LoopTime = 0;
	m_LastTime = 0;

	sprintf(m_Name, "");
	m_NameTime = 0;

	m_Enermy = NULL;
	m_IsAttack = NOT_ATTACK;

	m_IsAlive = TRUE;

	m_Number = NULL;
}

BOOL cCreature::Free()
{
	m_Orient = 0;
	m_XPos = m_YPos = m_ZPos = 0.0f;
	m_XTarget = m_ZTarget = 0;

	m_Direction = DOWN;
	m_Action = STAND;
	m_ActionCount = 0.0f;

	m_LoopTime = 0;
	m_LastTime = 0;

	sprintf(m_Name, "");
	m_NameTime = 0;

	m_Enermy = NULL;
	m_IsAttack = NOT_ATTACK;

	m_Landscape	= NULL;
	m_RelCamera	= NULL;
	m_Graphics	= NULL;

	m_IsAlive = TRUE;

	SAFE_DELETE(m_Number);

	return TRUE;
}

cCreature::~cCreature()
{
	Free();
}

BOOL cCreature::Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape,
					   cTexture *NumTexture)
{
	Free();

	if ((m_Graphics = Graphics) == NULL)
		return FALSE;

	if ((m_RelCamera = RelCamera) == NULL)
		return FALSE;

	if ((m_Landscape = Landscape) == NULL)
		return FALSE;
	
	m_Number = new cNumber();
	m_Number->Create(Graphics, NumTexture);

	m_LastTime = timeGetTime();

	return TRUE;
}

void cCreature::UpdateTime(){
	m_LoopTime = timeGetTime() - m_LastTime;
	
	m_LastTime = timeGetTime();
}

void cCreature::UpdatePosition()
{
	if (m_Action != WALK) return;

	// if there is no move then exit function
	if ((m_XPos == m_XTarget)&&(m_ZPos == m_ZTarget)) return;

	float Distance = m_LoopTime * WALKSPEED;

	//Walk To Up-Right
	if ((m_XTarget > m_XPos) && (m_ZTarget > m_ZPos)){
		m_Orient = 135;
		m_XPos += Distance;
		m_ZPos += Distance;
		if (m_XPos > m_XTarget)	m_XPos = m_XTarget;
		if (m_ZPos > m_ZTarget)	m_ZPos = m_ZTarget;
	}
	//Walk To Up-Left
	else if ((m_XTarget < m_XPos) && (m_ZTarget > m_ZPos)){
		m_Orient = 225;
		m_XPos -= Distance;
		m_ZPos += Distance;
		if (m_XPos < m_XTarget)	m_XPos = m_XTarget;
		if (m_ZPos > m_ZTarget)	m_ZPos = m_ZTarget;
	}
	//Walk To Down-Right
	else if ((m_XTarget > m_XPos) && (m_ZTarget < m_ZPos)){
		m_Orient = 45;
		m_XPos += Distance;
		m_ZPos -= Distance;
		if (m_XPos > m_XTarget)	m_XPos = m_XTarget;
		if (m_ZPos < m_ZTarget)	m_ZPos = m_ZTarget;
	}
	//Walk To Down-Left
	else if ((m_XTarget < m_XPos) && (m_ZTarget < m_ZPos)){
		m_Orient = 315;
		m_XPos -= Distance;
		m_ZPos -= Distance;
		if (m_XPos < m_XTarget)	m_XPos = m_XTarget;
		if (m_ZPos < m_ZTarget)	m_ZPos = m_ZTarget;
	}
	//Walk To Right
	else if (m_XTarget > m_XPos){
		m_Orient = 90;
		m_XPos += Distance;
		if (m_XPos > m_XTarget)	m_XPos = m_XTarget;
	}
	//Walk To Left
	else if (m_XTarget < m_XPos){
		m_Orient = 270;
		m_XPos -= Distance;
		if (m_XPos < m_XTarget)	m_XPos = m_XTarget;
	}
	//Walk To Up
	else if (m_ZTarget > m_ZPos){
		m_Orient = 180;
		m_ZPos += Distance;
		if (m_ZPos > m_ZTarget)	m_ZPos = m_ZTarget;
	}
	//Walk To Down
	else if (m_ZTarget < m_ZPos){
		m_Orient = 0;
		m_ZPos -= Distance;
		if (m_ZPos < m_ZTarget)	m_ZPos = m_ZTarget;
	}

	// Set YPos
	if (m_Landscape != NULL)
		m_YPos = m_Landscape->GetHeight(m_XPos, m_ZPos);
}

void cCreature::SetPosition(float X, float Z){
	m_XPos = m_XTarget = X;
	m_ZPos = m_ZTarget = Z;
	if (m_Landscape != NULL)
		m_YPos = m_Landscape->GetHeight(m_XPos, m_ZPos);
}

void cCreature::SetOrientation(int Orient){
	m_Orient = Orient;
}

void cCreature::SetName(char* Name){
	sprintf(m_Name, "%s", Name);
}

void cCreature::ShowName(){
	if (strcmp(m_Name, "") == 0)
		return;

	m_NameTime = timeGetTime();
}

void cCreature::ShowNumber(int Number){
	if (m_Number == NULL)
		return;

	m_Number->ShowNumber(Number);
}

void cCreature::SetNumberSide(BOOL IsPlayerSide){
	m_Number->SetSide(IsPlayerSide);
}

BOOL cCreature::RenderNumber(){
	if (m_Number == NULL)
		return FALSE;

	return m_Number->Render();
}

void cCreature::MoveTo(float XTarget, float ZTarget){
	if (m_IsAlive == FALSE) return;

	//m_IsAttack = NOT_ATTACK;
	//m_Enermy = NULL;

	m_XTarget = XTarget;
	m_ZTarget = ZTarget;
	m_Action = WALK;
}

void cCreature::SetEnermy(cCreature *Enermy, AttackType Type){
	if ((Type != NOT_ATTACK)&&(Type != ATTACK_ONCE)&&(Type != ATTACK_CONTINUE))
		return;
	m_Enermy = Enermy;	
	m_IsAttack = Type;
}

void cCreature::ResetEnermy(){
	m_Enermy = NULL;
	m_IsAttack = NOT_ATTACK;
}

void cCreature::Attack(){
	if (m_IsAlive == FALSE) return;

	if ((m_Enermy == NULL) || (m_IsAttack == NOT_ATTACK))
		return;

	m_Action = ATTACK;
	m_ActionCount = 0;

	// Face to enermy
	int XPos = (int)m_Enermy->GetXPos();
	int ZPos = (int)m_Enermy->GetZPos();

	int thisXPos = (int)m_XPos;
	int thisZPos = (int)m_ZPos;

	// Monster is Down-Right
	if ((XPos > thisXPos) && (ZPos < thisZPos)){
		m_Orient = 45;
	}
	// Monster is Down-Left
	else if ((XPos < thisXPos) && (ZPos < thisZPos)){
		m_Orient = 315;
	}
	// Monster is Up-Right
	else if ((XPos > thisXPos) && (ZPos > thisZPos)){
		m_Orient = 135;
	}
	// Monster is Up-Left
	else if ((XPos < thisXPos) && (ZPos > thisZPos)){
		m_Orient = 225;
	}
	// Monster is Right
	else if (XPos > thisXPos){
		m_Orient = 90;
	}
	// Monster is Left
	else if (XPos < thisXPos){
		m_Orient = 270;
	}
	// Monster is Up
	else if (ZPos > thisZPos){
		m_Orient = 180;
	}
	// Monster is Down
	else if (ZPos < thisZPos){
		m_Orient = 0;
	}
	else
		m_Orient = 0;
}

void cCreature::Attacked(){
	if (m_IsAlive == FALSE) return;

	m_Action = ATTACKED;
	m_ActionCount = 0;
}

BOOL cCreature::IsNearEnermy(){
	if ((m_Enermy == NULL) || (m_IsAttack == NOT_ATTACK))
		return FALSE;

	int XPos = (int)m_Enermy->GetXPos();
	int ZPos = (int)m_Enermy->GetZPos();

	int thisXPos = (int)m_XPos;
	int thisZPos = (int)m_ZPos;

	// Same position
	if ((XPos == thisXPos) && (ZPos == thisZPos))
		return TRUE;

	// Left & Right
	if (ZPos == thisZPos)
		if ((XPos == thisXPos + 1)||(XPos == thisXPos - 1))
			return TRUE;

	// Up & Down
	if (XPos == thisXPos)
		if ((ZPos == thisZPos + 1)||(ZPos == thisZPos - 1))
			return TRUE;

	// Upper-Left, Upper-Right, Down-Left, Down-Right
	if ((XPos == thisXPos + 1)&&(ZPos == thisZPos + 1))
		return TRUE;	
	if ((XPos == thisXPos + 1)&&(ZPos == thisZPos - 1))
		return TRUE;	
	if ((XPos == thisXPos - 1)&&(ZPos == thisZPos + 1))
		return TRUE;	
	if ((XPos == thisXPos - 1)&&(ZPos == thisZPos - 1))
		return TRUE;
	
	return FALSE;
}

void cCreature::Die(){
	m_IsAlive = FALSE;
	m_Action = DIE;
	m_ActionCount = 0;
}

void cCreature::Reborn(){
	m_IsAlive = TRUE;
	m_Action = STAND;
	m_ActionCount = 0;
}

		
