#include "cPlayer.h"

#define NUM_PIC		10.0f	// number of picture for map u-cordinate

//============================================================================
// Class : cPlayer
//============================================================================
cPlayer::cPlayer() : cCreature()
{
	m_HeadVB	= NULL;
	m_BodyVB	= NULL;

	m_HeadTex	= NULL;
	m_BodyTex	= NULL;

	m_ShadowVB	= NULL;
	m_ShadowTex	= NULL;

	m_PID = -1;

	m_LoopTime = 0;
	m_LastTime = 0;

	sprintf(m_Message, "");
	m_MessageTime = 0;
}

BOOL cPlayer::Free()
{
	SAFE_DELETE(m_HeadVB);
	SAFE_DELETE(m_BodyVB);

	m_HeadTex	= NULL;
	m_BodyTex	= NULL;

	SAFE_DELETE(m_ShadowVB);
	m_ShadowTex = NULL;

	m_PID = -1;

	sprintf(m_Message, "");
	m_MessageTime = 0;

	cCreature::Free();

	return TRUE;
}

cPlayer::~cPlayer()
{
	Free();
}

BOOL cPlayer::Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape, 
					cTexture *NumTexture, cTexture *HeadTexture, cTexture *BodyTexture, 
					cTexture *ShadowTexture, DPNID PID)	
{
	Free();

	if (cCreature::Create(Graphics, RelCamera, Landscape, NumTexture) == FALSE)
		return FALSE;

	if ((m_HeadTex = HeadTexture) == NULL)
		return FALSE;

	if ((m_BodyTex = BodyTexture) == NULL)
		return FALSE;

	if ((m_ShadowTex = ShadowTexture) == NULL)
		return FALSE;

	sVertex HeadVertex[4] =
	{
		{-0.07f, 1.61f, 0.0f, 0xffffffff, 0.0f, 0.142857f},
		{-0.07f, 2.75f, 0.0f, 0xffffffff, 0.0f, 0.0f},
		{ 1.07f, 1.61f, 0.0f, 0xffffffff, 1.0f, 0.142857f},
		{ 1.07f, 2.75f, 0.0f, 0xffffffff, 1.0f, 0.0f}
	};
	sVertex BodyVertex[4] =
	{
		{-0.5f, 0.05f, 0.0f, 0xffffffff, 0.0f, 0.142857f},
		{-0.5f, 2.05f, 0.0f, 0xffffffff, 0.0f, 0.0f},
		{ 1.5f, 0.05f, 0.0f, 0xffffffff, 1.0f / NUM_PIC, 0.142857f},
		{ 1.5f, 2.05f, 0.0f, 0xffffffff, 1.0f / NUM_PIC, 0.0f}
	};
	
	// Create Head vertexBuffer
	m_HeadVB = new cVertexBuffer();
	if(m_HeadVB->Create(m_Graphics, 4, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
		return FALSE;
	if(m_HeadVB->Set(0, 4, &HeadVertex) == FALSE)
		return FALSE;
 
	// Create Body vertexBuffer
	m_BodyVB = new cVertexBuffer();
	if(m_BodyVB->Create(m_Graphics, 4, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
		return FALSE;
	if(m_BodyVB->Set(0, 4, &BodyVertex) == FALSE)
		return FALSE;

	sVertex ShadowVertex[4] =
	{
		{ 0.05f, 0.05f, 0.0f, 0x77ffffff, 0.0f, 1.0f},
		{ 0.05f, 0.65f, 0.0f, 0x77ffffff, 0.0f, 0.0f},
		{ 1.05f, 0.05f, 0.0f, 0x77ffffff, 1.0f, 1.0f},
		{ 1.05f, 0.65f, 0.0f, 0x77ffffff, 1.0f, 0.0f}
	};
	
	// Create vertexBuffer 
	m_ShadowVB = new cVertexBuffer();
	if(m_ShadowVB->Create(m_Graphics, 4, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
		return FALSE;
	if(m_ShadowVB->Set(0, 4, &ShadowVertex) == FALSE)
		return FALSE;
 
	m_PID = PID;

	return TRUE;
}

BOOL cPlayer::Update(){
	if (m_HeadVB->IsLoaded() == FALSE)
		return FALSE;
	if (m_BodyVB->IsLoaded() == FALSE)
		return FALSE;

	UpdateTime();
	UpdateAction();
	UpdatePosition();
	UpdateDirection();
	SetTexture();

	return TRUE;
}

BOOL cPlayer::Render()
{
	if ((m_HeadVB->IsLoaded() == FALSE)||(m_HeadTex->IsLoaded()==FALSE))
		return FALSE;
	if ((m_BodyVB->IsLoaded() == FALSE)||(m_BodyTex->IsLoaded()==FALSE))
		return FALSE;
	if ((m_ShadowVB->IsLoaded() == FALSE)||(m_ShadowTex->IsLoaded()==FALSE))
		return FALSE;

	// Render Shadow
	if (m_Action != DIE){
	m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 2);
	m_Graphics->SetTexture(0, m_ShadowTex);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP,	  D3DTOP_MODULATE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(1, D3DTSS_COLOROP,   D3DTOP_DISABLE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(1, D3DTSS_ALPHAOP,   D3DTOP_DISABLE);
	m_ShadowVB->Render(0, 2, D3DPT_TRIANGLESTRIP);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
	}

	// Render Body
	m_Graphics->SetTexture(0, m_BodyTex);
	m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 3);
	m_BodyVB->Render(0, 2, D3DPT_TRIANGLESTRIP);
	
	// Render Head
	m_Graphics->SetTexture(0, m_HeadTex);
	m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 4);
	m_HeadVB->Render(0, 2, D3DPT_TRIANGLESTRIP);


	m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 0);



	return TRUE;
}

void cPlayer::UpdateAction(){
	if ((m_Action == WALK ) && (m_XPos == m_XTarget) && (m_ZPos == m_ZTarget))
		m_Action = STAND;

	m_ActionCount = m_ActionCount + (m_LoopTime * 0.01f);

	switch (m_Action){
	case STAND:
		m_ActionCount = 0;
		break;
	case WALK:
		if (m_ActionCount >= 8) 
			m_ActionCount = 0;
		break;
	case ATTACK_WAIT:
		if (m_ActionCount >= 5) 
			m_ActionCount = 0;
		break;
	case ATTACK:
		if (m_ActionCount >= 5){
			m_ActionCount = 0;
			m_Action = ATTACK_WAIT;
		}
		break;
	case ATTACKED:
		if (m_ActionCount >= 3){
			m_ActionCount = 0;
			m_Action = ATTACK_WAIT;
		}
		break;
	case DIE:
		m_ActionCount = 0;
		break;
	default:
		m_Action = STAND;
		m_ActionCount = 0;
	}
}

void cPlayer::UpdateDirection(){
	int AngleDiff = m_RelCamera->GetOrient() - m_Orient;
	while (AngleDiff < 0)
		AngleDiff = AngleDiff + 360;
	if (AngleDiff >= 360)
		AngleDiff = AngleDiff % 360;
	
	if ((m_Action == STAND) || (m_Action == WALK)){
		if (((AngleDiff>=0)&&(AngleDiff<23)) || (AngleDiff>=338)&&(AngleDiff<360))
			m_Direction = DOWN;
		else if ((AngleDiff>=23)&&(AngleDiff<68))
			m_Direction = RIGHT_DOWN;
		else if ((AngleDiff>=68)&&(AngleDiff<113))
			m_Direction = RIGHT;
		else if ((AngleDiff>=113)&&(AngleDiff<158))
			m_Direction = RIGHT_UP;
		else if ((AngleDiff>=158)&&(AngleDiff<203))
			m_Direction = UP;
		else if ((AngleDiff>=203)&&(AngleDiff<248))
			m_Direction = LEFT_UP;
		else if ((AngleDiff>=248)&&(AngleDiff<293))
			m_Direction = LEFT;
		else if ((AngleDiff>=252)&&(AngleDiff<338))
			m_Direction = LEFT_DOWN;
	}else{
		if ((AngleDiff>=0)&&(AngleDiff<90))
			m_Direction = RIGHT_DOWN;
		else if ((AngleDiff>=90)&&(AngleDiff<180))
			m_Direction = RIGHT_UP;
		else if ((AngleDiff>=180)&&(AngleDiff<270))
			m_Direction = LEFT_UP;
		else if ((AngleDiff>=270)&&(AngleDiff<360))
			m_Direction = LEFT_DOWN;
	}

}

BOOL cPlayer::SetTexture(){
	if (m_HeadVB->Lock(0,4) == FALSE)
		return FALSE;
	if (m_BodyVB->Lock(0,4) == FALSE)
		return FALSE;

	sVertex *HeadVertex = (sVertex*)m_HeadVB->GetPtr();
	sVertex *BodyVertex = (sVertex*)m_BodyVB->GetPtr();

	//=======================\ Set V Coordinate /=================================	
	switch (m_Direction) {
		case DOWN: 
			HeadVertex[0].v = HeadVertex[2].v = BodyVertex[0].v = BodyVertex[2].v = 0.142857f;		
			HeadVertex[1].v = HeadVertex[3].v = BodyVertex[1].v = BodyVertex[3].v = 0.0f;
			break;
		case RIGHT_DOWN:
		case LEFT_DOWN:
			HeadVertex[0].v = HeadVertex[2].v = BodyVertex[0].v = BodyVertex[2].v = 0.285714f;		
			HeadVertex[1].v = HeadVertex[3].v = BodyVertex[1].v = BodyVertex[3].v = 0.142857f;
			break;
		case RIGHT:
		case LEFT:
			HeadVertex[0].v = HeadVertex[2].v = BodyVertex[0].v = BodyVertex[2].v = 0.428571f;		
			HeadVertex[1].v = HeadVertex[3].v = BodyVertex[1].v = BodyVertex[3].v = 0.285714f;
			break;
		case RIGHT_UP:
		case LEFT_UP:
			HeadVertex[0].v = HeadVertex[2].v = BodyVertex[0].v = BodyVertex[2].v = 0.571458f;		
			HeadVertex[1].v = HeadVertex[3].v = BodyVertex[1].v = BodyVertex[3].v = 0.428571f;
			break;
		case UP:
			HeadVertex[0].v = HeadVertex[2].v = BodyVertex[0].v = BodyVertex[2].v = 0.714857f;		
			HeadVertex[1].v = HeadVertex[3].v = BodyVertex[1].v = BodyVertex[3].v = 0.571458f;
			break;
		}
	if ((m_Action == ATTACK_WAIT) || (m_Action == ATTACK)) {
		switch (m_Direction) {
		case RIGHT_DOWN:
		case LEFT_DOWN:
			BodyVertex[0].v = BodyVertex[2].v = 0.857143f;	BodyVertex[1].v = BodyVertex[3].v = 0.714857f;
			break;
		case RIGHT_UP:
		case LEFT_UP:
			BodyVertex[0].v = BodyVertex[2].v = 1.0f;		BodyVertex[1].v = BodyVertex[3].v = 0.857143f;
			break;
		}
	} else if (m_Action == ATTACKED){
		switch (m_Direction) {
		case RIGHT_DOWN:
		case LEFT_DOWN:
			BodyVertex[0].v = BodyVertex[2].v = 0.142857f;	BodyVertex[1].v = BodyVertex[3].v = 0.0f;
			break;
		case RIGHT_UP:
		case LEFT_UP:
			BodyVertex[0].v = BodyVertex[2].v = 0.285714f;	BodyVertex[1].v = BodyVertex[3].v = 0.142857f;
			break;
		}
	} else if (m_Action == DIE){
		switch (m_Direction) {
		case RIGHT_DOWN:
		case LEFT_DOWN:
			HeadVertex[0].v = HeadVertex[2].v = 0.857143f;	HeadVertex[1].v = HeadVertex[3].v = 0.714857f;
			BodyVertex[0].v = BodyVertex[2].v = 0.428571f;	BodyVertex[1].v = BodyVertex[3].v = 0.285714f;
			break;
		case RIGHT_UP:
		case LEFT_UP:
			HeadVertex[0].v = HeadVertex[2].v = 1.0f;		HeadVertex[1].v = HeadVertex[3].v = 0.857143f;
			BodyVertex[0].v = BodyVertex[2].v = 0.571458f;	BodyVertex[1].v = BodyVertex[3].v = 0.428571f;
			break;
		}
	}

	//=======================\ Set U Coordinate /=================================
	// Head U is only relate to Direction
	switch (m_Direction){
	case DOWN:
	case RIGHT_DOWN:
	case RIGHT:
	case RIGHT_UP:
	case UP:
		HeadVertex[0].u = 0.0f;		HeadVertex[2].u = 1.0f;
		HeadVertex[1].u = 0.0f;		HeadVertex[3].u = 1.0f;
		break;
	case LEFT_UP:
	case LEFT:
	case LEFT_DOWN:
		HeadVertex[0].u = 1.0f;		HeadVertex[2].u = 0.0f;
		HeadVertex[1].u = 1.0f;		HeadVertex[3].u = 0.0f;
		break;
	}

	// Body U is relate to Direction and Action
	int index = (int)m_ActionCount;
	if		(m_Action == STAND)			index = 0;
	else if (m_Action == WALK)			index = index + 1;
	else if (m_Action == ATTACK_WAIT)	index = index;
	else if (m_Action == ATTACK)		index = index + 5;
	else if (m_Action == ATTACKED)		index = 9;
	else if (m_Action == DIE)			index = 9;
	
	if ((m_Action == STAND) || (m_Action == WALK)){
		switch (m_Direction){
		case DOWN:
		case RIGHT_DOWN:
		case RIGHT:
		case RIGHT_UP:
		case UP:
			BodyVertex[0].u = index / NUM_PIC;		BodyVertex[2].u = (index + 1.0f) / NUM_PIC;
			BodyVertex[1].u = index / NUM_PIC;		BodyVertex[3].u = (index + 1.0f) / NUM_PIC;
			break;
		case LEFT_UP:
		case LEFT:
		case LEFT_DOWN:
			BodyVertex[0].u = (index + 1.0f) / NUM_PIC;		BodyVertex[2].u = index / NUM_PIC;
			BodyVertex[1].u = (index + 1.0f) / NUM_PIC;		BodyVertex[3].u = index / NUM_PIC;
			break;
		}
	}else{
		switch (m_Direction){
		case RIGHT_UP:
		case RIGHT_DOWN:
			BodyVertex[0].u = index / NUM_PIC;		BodyVertex[2].u = (index + 1.0f) / NUM_PIC;
			BodyVertex[1].u = index / NUM_PIC;		BodyVertex[3].u = (index + 1.0f) / NUM_PIC;
			break;
		case LEFT_DOWN:
		case LEFT_UP:
			BodyVertex[0].u = (index + 1.0f) / NUM_PIC;		BodyVertex[2].u = index / NUM_PIC;
			BodyVertex[1].u = (index + 1.0f) / NUM_PIC;		BodyVertex[3].u = index / NUM_PIC;
			break;
		}
	}

	//=======================\ Set X-Y Coordinate /=================================
	// Head X-Y is changed for some action
	HeadVertex[0].x = HeadVertex[1].x =-0.07f;	HeadVertex[2].x = HeadVertex[3].x = 1.07f;
	HeadVertex[0].y = HeadVertex[2].y = 1.61f;	HeadVertex[1].y = HeadVertex[3].y = 2.75f;

	if (m_Action == ATTACK_WAIT){
		if ((index == 0) || (index == 4)){
			HeadVertex[0].y = HeadVertex[2].y = 1.55f;	HeadVertex[1].y = HeadVertex[3].y = 2.69f;
		}
	}else if (m_Action == ATTACK){
		HeadVertex[0].y = HeadVertex[2].y = 1.40f;	HeadVertex[1].y = HeadVertex[3].y = 2.54f;
		index = index - 5;
		switch (m_Direction){
		case RIGHT_UP:
			if (index == 0){	 HeadVertex[0].x = HeadVertex[1].x = 0.35f;	HeadVertex[2].x = HeadVertex[3].x = 1.49f;
			}else if (index==1){ HeadVertex[0].x = HeadVertex[1].x = 0.29f;	HeadVertex[2].x = HeadVertex[3].x = 1.43f;
			}else{				 HeadVertex[0].x = HeadVertex[1].x = 0.15f;	HeadVertex[2].x = HeadVertex[3].x = 1.29f;
			}
			break;
		case RIGHT_DOWN:
			if ((index==0)||(index==1)){		HeadVertex[0].x = HeadVertex[1].x = 0.23f;	HeadVertex[2].x = HeadVertex[3].x = 1.37f;
			}else if (index==2){				HeadVertex[0].x = HeadVertex[1].x = 0.13f;	HeadVertex[2].x = HeadVertex[3].x = 1.27f;
			}else if ((index==3)||(index==4)){	HeadVertex[0].x = HeadVertex[1].x =-0.27f;	HeadVertex[2].x = HeadVertex[3].x = 0.87f;
			}
			break;
		case LEFT_DOWN:
			if ((index==0)||(index==1)){		HeadVertex[0].x = HeadVertex[1].x =-0.37f;	HeadVertex[2].x = HeadVertex[3].x = 0.77f;
			}else if (index==2){				HeadVertex[0].x = HeadVertex[1].x =-0.27f;	HeadVertex[2].x = HeadVertex[3].x = 0.87f;
			}else if ((index==3)||(index==4)){	HeadVertex[0].x = HeadVertex[1].x = 0.13f;	HeadVertex[2].x = HeadVertex[3].x = 1.27f;
			}
			break;
		case LEFT_UP:
			if (index == 0){	 HeadVertex[0].x = HeadVertex[1].x =-0.49f;	HeadVertex[2].x = HeadVertex[3].x = 0.65f;
			}else if (index==1){ HeadVertex[0].x = HeadVertex[1].x =-0.43f;	HeadVertex[2].x = HeadVertex[3].x = 0.71f;
			}else{				 HeadVertex[0].x = HeadVertex[1].x =-0.29f;	HeadVertex[2].x = HeadVertex[3].x = 0.85f;
			}
			break;
		}	
	}else if (m_Action == ATTACKED){
		HeadVertex[0].y = HeadVertex[2].y = 1.40f;	HeadVertex[1].y = HeadVertex[3].y = 2.54f;
		switch (m_Direction){
		case RIGHT_UP:
		case RIGHT_DOWN:
			HeadVertex[0].x = HeadVertex[1].x = 0.38f;	HeadVertex[2].x = HeadVertex[3].x = 1.52f;
			break;
		case LEFT_DOWN:
		case LEFT_UP:
			HeadVertex[0].x = HeadVertex[1].x =-0.57f;	HeadVertex[2].x = HeadVertex[3].x = 0.57f;
			break;
		}
	}else if (m_Action == DIE){
		HeadVertex[0].x = HeadVertex[1].x =-0.07f;	HeadVertex[2].x = HeadVertex[3].x = 1.07f;
		HeadVertex[0].y = HeadVertex[2].y = 1.61f;	HeadVertex[1].y = HeadVertex[3].y = 2.75f;
		switch (m_Direction){
		case RIGHT_DOWN:
			HeadVertex[0].x = HeadVertex[1].x = 0.31f;	HeadVertex[2].x = HeadVertex[3].x = 1.45f;
			HeadVertex[0].y = HeadVertex[2].y = 0.26f;	HeadVertex[1].y = HeadVertex[3].y = 1.40f;
			break;
		case LEFT_DOWN:
			HeadVertex[0].x = HeadVertex[1].x =-0.49f;	HeadVertex[2].x = HeadVertex[3].x = 0.69f;
			HeadVertex[0].y = HeadVertex[2].y = 0.26f;	HeadVertex[1].y = HeadVertex[3].y = 1.40f;
			break;
		case RIGHT_UP:	
			HeadVertex[0].x = HeadVertex[1].x = 0.16f;	HeadVertex[2].x = HeadVertex[3].x = 1.30f;
			HeadVertex[0].y = HeadVertex[2].y = 1.11f;	HeadVertex[1].y = HeadVertex[3].y = 2.25f;
			break;
		case LEFT_UP:
			HeadVertex[0].x = HeadVertex[1].x =-0.30f;	HeadVertex[2].x = HeadVertex[3].x = 0.84f;
			HeadVertex[0].y = HeadVertex[2].y = 1.11f;	HeadVertex[1].y = HeadVertex[3].y = 2.25f;
			break;
		}
	}

	m_HeadVB->Unlock();
	m_BodyVB->Unlock();

	return TRUE;
}

void cPlayer::SayMessage(char* Message){
	sprintf(m_Message, "%s", Message);
	m_MessageTime = timeGetTime();
}


//============================================================================
// Class : cPlayerList
//============================================================================
cPlayerList::cPlayerList(){
	m_Graphics = NULL;
	m_RelCamera = NULL;
	m_Landscape = NULL;
	m_NumTexture = NULL;

	for (int i=0 ; i<MAX_PLAYERTEXTURE ; i++){
		m_HeadTex[i] = NULL;
		m_BodyTex[i] = NULL;
		m_HeadID[i] = -1;
		m_BodyID[i] = -1;
	}

	m_HeadTexCount = 0;
	m_BodyTexCount = 0;

	m_ShadowTex = NULL;

	m_FirstNode = NULL;

	m_Font = NULL;
}

cPlayerList::~cPlayerList(){
	Free();
}

BOOL cPlayerList::Free(){
	m_Landscape	= NULL;
	m_RelCamera	= NULL;
	m_Graphics	= NULL;
	m_NumTexture = NULL;

	int i;
	for (i=0 ; i<m_HeadTexCount ; i++)
		SAFE_DELETE(m_HeadTex[i]);

	for (i=0 ; i<m_BodyTexCount ; i++)
		SAFE_DELETE(m_BodyTex[i]);
	
	for (i=0 ; i<MAX_PLAYERTEXTURE ; i++){
		m_HeadID[i] = -1;
		m_BodyID[i] = -1;
	}

	m_HeadTexCount = 0;
	m_BodyTexCount = 0;

	SAFE_DELETE(m_ShadowTex);

	SAFE_DELETE(m_Font);

	if (m_FirstNode == NULL)
		return TRUE;
	
	sNode* temp;
	while(m_FirstNode != NULL){
		temp = m_FirstNode->Next;
		SAFE_DELETE(m_FirstNode);
		m_FirstNode = temp;
	}

	return TRUE;
}

BOOL cPlayerList::Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape,
						 cTexture *NumTexture){
	Free();

	if ((m_Graphics = Graphics) == NULL)
		return FALSE;

	if ((m_RelCamera = RelCamera) == NULL)
		return FALSE;

	if ((m_Landscape = Landscape) == NULL)
		return FALSE;

	if ((m_NumTexture = NumTexture) == NULL)
		return FALSE;

	m_ShadowTex = new cTexture();
	if(m_ShadowTex->Load(m_Graphics, "Data\\Shadow.bmp", 0xffff0000) == FALSE)
		return FALSE;

	m_Font = new cFont();
	if (m_Font->Create(m_Graphics, "MS Sans Serif",10) == FALSE)
		return FALSE;

	return TRUE;
}

BOOL cPlayerList::AddHeadTexture(int HeadID){
	if (m_Graphics == NULL)
		return FALSE;

	if (m_HeadTexCount >= MAX_PLAYERTEXTURE)
		return FALSE;

	// if this head id is already load then return false
	if (GetTextureByHeadID(HeadID) != NULL)
			return FALSE;

	// load texture
	char szTemp[32];
	m_HeadTex[m_HeadTexCount] = new cTexture();
	sprintf(szTemp, "Data\\Head%d.bmp", HeadID);
	if(m_HeadTex[m_HeadTexCount]->Load(m_Graphics, szTemp, 0xffff0000) == FALSE)
		return FALSE;
	
	m_HeadID[m_HeadTexCount] = HeadID;

	m_HeadTexCount++;

	return TRUE;
}

BOOL cPlayerList::AddBodyTexture(int BodyID){
	if (m_Graphics == NULL)
		return FALSE;

	if (m_BodyTexCount >= MAX_PLAYERTEXTURE)
		return FALSE;

	// if this body id is already load then return false
	if (GetTextureByBodyID(BodyID) != NULL)
			return FALSE;

	// load texture
	char szTemp[32];
	m_BodyTex[m_BodyTexCount] = new cTexture();
	sprintf(szTemp, "Data\\Body%d.bmp", BodyID);
	if(m_BodyTex[m_BodyTexCount]->Load(m_Graphics, szTemp, 0xffff0000) == FALSE)
		return FALSE;
	
	m_BodyID[m_BodyTexCount] = BodyID;

	m_BodyTexCount++;

	return TRUE;
}

cTexture* cPlayerList::GetTextureByHeadID(int HeadID){
	for (int i=0 ; i<m_HeadTexCount ; i++){
		if (HeadID == m_HeadID[i])
			return m_HeadTex[i];
	}

	return NULL;
}

cTexture* cPlayerList::GetTextureByBodyID(int BodyID){
	for (int i=0 ; i<m_BodyTexCount ; i++){
		if (BodyID == m_BodyID[i])
			return m_BodyTex[i];
	}

	return NULL;
}

BOOL cPlayerList::Render(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return TRUE;

	m_Graphics->EnableAlphaTesting(TRUE);
	m_Graphics->EnableAlphaBlending(TRUE);

	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();

	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	
	
	//m_Graphics->EnableZBuffer(FALSE);
	//m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	//m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_CLIPPING , FALSE);

//	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_DIFFUSE);
//	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_COLORARG2, D3DTOP_SELECTARG1);
/*	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState( 1, D3DTSS_COLOROP,   D3DTOP_DISABLE );
	m_Graphics->GetDeviceCOM()->SetTextureStageState( 1, D3DTSS_ALPHAOP,   D3DTOP_DISABLE );
*/
	// Render player's head and body
	while (temp != NULL){
		cPlayer* tp = temp->Player;

		tp->Update();
		D3DXMatrixTranslation(&matTranslation, tp->GetXPos()+XRender, tp->GetYPos(), tp->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
		if (FAILED(m_Graphics->GetDeviceCOM()->SetTransform(D3DTS_WORLD, &matTempWorld)))
			return FALSE;

		tp->Render();
		temp = temp->Next;
	}

	//m_Graphics->EnableZBuffer(TRUE);
	//m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZWRITEENABLE, TRUE);
	//m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_CLIPPING , TRUE);
/*
	m_Graphics->GetDeviceCOM()->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_TEXTURE );
	m_Graphics->GetDeviceCOM()->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );
	m_Graphics->GetDeviceCOM()->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_MODULATE );
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
*/

	m_Graphics->EnableAlphaBlending(FALSE);
	m_Graphics->EnableAlphaTesting(FALSE);

	return TRUE;
}

BOOL cPlayerList::RenderFont(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return TRUE;

	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	

	D3DXMATRIX   matView, matProj;
	D3DXVECTOR3  vecPos;
	D3DVIEWPORT8 vpScreen;

    m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_VIEW, &matView);
	m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_PROJECTION, &matProj);
	m_Graphics->GetDeviceCOM()->GetViewport(&vpScreen);

	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();

	while (temp != NULL){
		cPlayer* tp = temp->Player;

		D3DXMatrixTranslation(&matTranslation, tp->GetXPos()+XRender, tp->GetYPos(), tp->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
		// Render message
		if (tp->GetMessageTime() + 2000 > timeGetTime()){
			D3DXVec3Project(&vecPos, &D3DXVECTOR3(0.5f, 3.4f, 0),
							&vpScreen, &matProj, &matView, &matTempWorld);	
			char temp[145];	// 128 + 16 + 1
			sprintf(temp, "%s : %s", tp->GetName(), tp->GetMessage());
			m_Font->Print(temp, (long)vecPos.x-25, (long)vecPos.y, 50, 20, 0xffffff00, DT_CENTER|DT_NOCLIP );
		}
		
		// Render name
		if (tp->GetNameTime() + 500 > timeGetTime()){
			D3DXVec3Project(&vecPos, &D3DXVECTOR3(0.5f, -0.275f, 0),
					&vpScreen, &matProj, &matView, &matTempWorld);
			m_Font->Print(tp->GetName(), (long)vecPos.x-25, (long)vecPos.y, 50, 20, 0xffffffff, DT_CENTER|DT_NOCLIP );
		}

		temp = temp->Next;
	}

	return TRUE;
}

BOOL cPlayerList::RenderNumber(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return TRUE;

	m_Graphics->EnableAlphaTesting(TRUE);
	m_Graphics->EnableAlphaBlending(TRUE);
	m_Graphics->EnableZBuffer(FALSE);

	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	

	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();
	
	// Render Number
	while (temp != NULL){
		cPlayer* tp = temp->Player;

		D3DXMatrixTranslation(&matTranslation, tp->GetXPos()+XRender, tp->GetYPos(), tp->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
		if (FAILED(m_Graphics->GetDeviceCOM()->SetTransform(D3DTS_WORLD, &matTempWorld)))
			return FALSE;
		
		tp->SetNumberSide(TRUE);
		tp->RenderNumber();
		temp = temp->Next;
	}

	m_Graphics->EnableZBuffer(TRUE);
	m_Graphics->EnableAlphaBlending(FALSE);
	m_Graphics->EnableAlphaTesting(FALSE);

	return TRUE;
}

BOOL cPlayerList::AddMainPlayer(DPNID PID, int HeadID, int BodyID, float XPos, float ZPos, int Orient){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL)||(m_Landscape == NULL)||(m_NumTexture == NULL))
		return FALSE;

	// Cheak Texture for ID
	if (GetTextureByHeadID(HeadID) == NULL)
			if (AddHeadTexture(HeadID) == FALSE)
				return FALSE;

	if (GetTextureByBodyID(BodyID) == NULL)
			if (AddBodyTexture(BodyID) == FALSE)
				return FALSE;

	//Add main player at first node
	m_FirstNode = new sNode();
	m_FirstNode->Player = new cPlayer();
	if (m_FirstNode->Player->Create(m_Graphics, m_RelCamera, m_Landscape, m_NumTexture,
									GetTextureByHeadID(HeadID), GetTextureByBodyID(BodyID),
									m_ShadowTex, PID) == FALSE){
		SAFE_DELETE(m_FirstNode);
		return FALSE;
	}
	m_FirstNode->Player->SetPosition(XPos, ZPos);
	m_FirstNode->Player->SetOrientation(Orient);
	
	m_RelCamera->RelateTo(XPos, m_FirstNode->Player->GetYPos(), ZPos);
	m_RelCamera->Update();
	m_Graphics->SetCamera(m_RelCamera->GetCamera());	

	return TRUE;
}

BOOL cPlayerList::AddNode(DPNID PID, int HeadID, int BodyID, float XPos, float ZPos, int Orient){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL)||(m_Landscape == NULL)||(m_NumTexture == NULL))
		return FALSE;

	// Cheak Texture for ID
	if (GetTextureByHeadID(HeadID) == NULL)
			if (AddHeadTexture(HeadID) == FALSE)
				return FALSE;

	if (GetTextureByBodyID(BodyID) == NULL)
			if (AddBodyTexture(BodyID) == FALSE)
				return FALSE;

	// Create new node
	sNode* thisNode = new sNode();
	thisNode->Player = new cPlayer();
	if (thisNode->Player->Create(m_Graphics, m_RelCamera, m_Landscape, m_NumTexture, 
								GetTextureByHeadID(HeadID), GetTextureByBodyID(BodyID), 
								m_ShadowTex, PID) == FALSE){
		// if fail to create then delete node and return false
		SAFE_DELETE(thisNode);
		return FALSE;
	}
	thisNode->Player->SetPosition(XPos, ZPos);
	thisNode->Player->SetOrientation(Orient);
	
	// Add new node after main player node
	sNode* temp = m_FirstNode->Next;	// Store other node
	m_FirstNode->Next = thisNode;
	thisNode->Next = temp;
	return TRUE;
}

BOOL cPlayerList::DeletePlayerByID(DPNID PID){
	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return FALSE;

	// if delete first node
	cPlayer* tPlayer = temp->Player;
	if (tPlayer->GetPID() == PID){
		m_FirstNode = temp->Next;
		SAFE_DELETE(temp);
		return TRUE;
	}
		
	sNode* tempPrev = m_FirstNode;
	temp = m_FirstNode->Next;
	
	while (temp != NULL){
		cPlayer* tp = temp->Player;
		if (tp->GetPID() == PID){
			tempPrev->Next = temp->Next;
			SAFE_DELETE(temp);
			return TRUE;
		}
		tempPrev = temp;
		temp = temp->Next;
	}

	return FALSE;
}

BOOL cPlayerList::GetMainPlayer(cPlayer** Player){
	if (m_FirstNode == NULL)
		return FALSE;

	*Player = m_FirstNode->Player;
	return TRUE;
}

BOOL cPlayerList::GetPlayerByID(DPNID PID, cPlayer** Player){
	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return FALSE;

	while (temp != NULL){
		cPlayer* tp = temp->Player;
		if (tp->GetPID() == PID){
			*Player = tp;
			return TRUE;
		}
		temp = temp->Next;
	}

	*Player = NULL;
	return FALSE;
}

BOOL cPlayerList::GetPlayerByMouse(long MouseX, long MouseY, cPlayer** Player){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return FALSE;

	// Convert Mouse position to 3D space
	D3DXMATRIX matProj;
	D3DXMATRIX matView, matInvView;
	D3DXVECTOR3 vecRay, vec, vecDir;

	D3DXMATRIX matInv;
	D3DXVECTOR3 vecObjRay, vecObjDir;

	D3DXVECTOR3 p0 = D3DXVECTOR3(-0.2f, 0.05f, 0.0f);
	D3DXVECTOR3 p1 = D3DXVECTOR3(-0.2f, 2.85f, 0.0f);
	D3DXVECTOR3 p2 = D3DXVECTOR3( 1.2f, 0.05f, 0.0f);
	D3DXVECTOR3 p3 = D3DXVECTOR3( 1.2f, 2.85f, 0.0f);

	m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_PROJECTION, &matProj);
	m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_VIEW, &matView);
	D3DXMatrixInverse(&matInvView, NULL, &matView);

	vec.x =  ( ( ( 2.0f * MouseX ) / m_Graphics->GetWidth() ) - 1 ) / matProj._11;
	vec.y = -( ( ( 2.0f * MouseY ) / m_Graphics->GetHeight() ) - 1 ) / matProj._22;
	vec.z =  1.0f;

	vecRay.x = matInvView._41;
	vecRay.y = matInvView._42;
	vecRay.z = matInvView._43;

	vecDir.x  = vec.x*matInvView._11 + vec.y*matInvView._21 + vec.z*matInvView._31;
	vecDir.y  = vec.x*matInvView._12 + vec.y*matInvView._22 + vec.z*matInvView._32;
	vecDir.z  = vec.x*matInvView._13 + vec.y*matInvView._23 + vec.z*matInvView._33;
	
	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	

	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();

	// Loop find nearest hit player
	float u, v;
	float Dist = 0;
	float NearestDist = 50000;	// Save nearest distance
	cPlayer* tempReturn = NULL;

	while (temp != NULL){
		cPlayer* tp = temp->Player;

		D3DXMatrixTranslation(&matTranslation, tp->GetXPos()+XRender, tp->GetYPos(), tp->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);

		D3DXMatrixInverse(&matInv, NULL, &matTempWorld);
		D3DXVec3TransformCoord(&vecObjRay, &vecRay, &matInv);
		D3DXVec3TransformNormal(&vecObjDir, &vecDir, &matInv);

		if (D3DXIntersectTri(&p0, &p1, &p2, &vecObjRay, &vecObjDir, &u, &v, &Dist) == TRUE){
			if (Dist < NearestDist){
				NearestDist = Dist;
				tempReturn = tp;
			}
		}else if(D3DXIntersectTri(&p3, &p1, &p1, &vecObjRay, &vecObjDir, &u, &v, &Dist) == TRUE){
			if (Dist < NearestDist){
				NearestDist = Dist;
				tempReturn = tp;
			}
		}

		temp = temp->Next;
	}

	if (tempReturn != NULL){
		*Player = tempReturn;
		return TRUE;
	}
	
	//else
	*Player = NULL;
	return FALSE;
}

BOOL cPlayerList::ResetEnermyForAll(cCreature* DiePlayer){
	sNode* temp;
	if ((temp = m_FirstNode) == NULL)
		return TRUE;

	while (temp != NULL){
		cPlayer* tp = temp->Player;
		if (tp->GetEnermy() == DiePlayer){
			tp->ResetEnermy();
		}
		temp = temp->Next;
	}

	return TRUE;
}

