#include "cMonster.h"

#define NUM_PIC		13.0f	// number of picture for map u-cordinate

//============================================================================
// Class : cMonster
//============================================================================
cMonster::cMonster() : cCreature()
{
	m_VB	= NULL;
	m_Tex	= NULL;

	m_ShadowVB	= NULL;
	m_ShadowTex	= NULL;
	
	m_MID = -1;
}

BOOL cMonster::Free()
{
	SAFE_DELETE(m_VB);
	m_Tex = NULL;

	SAFE_DELETE(m_ShadowVB);
	m_ShadowTex = NULL;

	m_MID = -1;
	
	cCreature::Free();

	return TRUE;
}

cMonster::~cMonster()
{
	Free();
}

BOOL cMonster::Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape, 
					  cTexture *NumTexture, cTexture *MonsterTexture, cTexture *ShadowTexture, 
					  int MID, int Type)
{
	Free();

	if (cCreature::Create(Graphics, RelCamera, Landscape, NumTexture) == FALSE)
		return FALSE;

	if ((m_Tex = MonsterTexture) == NULL)
		return FALSE;

	if ((m_ShadowTex = ShadowTexture) == NULL)
		return FALSE;

	sVertex Vertex[4] =
	{
		{ -0.25f, 0.05f, 0.0f, 0xffffffff, 0.0f, 0.2f},
		{ -0.25f, 1.55f, 0.0f, 0xffffffff, 0.0f, 0.0f},
		{  1.25f, 0.05f, 0.0f, 0xffffffff, 1.0f, 0.2f},
		{  1.25f, 1.55f, 0.0f, 0xffffffff, 1.0f, 0.0f}
	};
	
	// Create vertexBuffer 
	m_VB = new cVertexBuffer();
	if(m_VB->Create(m_Graphics, 4, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
		return FALSE;
	if(m_VB->Set(0, 4, &Vertex) == FALSE)
		return FALSE;
 
	sVertex ShadowVertex[4] =
	{
		{ 0.15f, 0.05f, 0.0f, 0x77ffffff, 0.0f, 1.0f},
		{ 0.15f, 0.55f, 0.0f, 0x77ffffff, 0.0f, 0.0f},
		{ 0.95f, 0.05f, 0.0f, 0x77ffffff, 1.0f, 1.0f},
		{ 0.95f, 0.55f, 0.0f, 0x77ffffff, 1.0f, 0.0f}
	};
	
	// Create vertexBuffer 
	m_ShadowVB = new cVertexBuffer();
	if(m_ShadowVB->Create(m_Graphics, 4, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
		return FALSE;
	if(m_ShadowVB->Set(0, 4, &ShadowVertex) == FALSE)
		return FALSE;

	// Set name
	switch (Type){
	case 1:
		sprintf(m_Name, "yoyo");
		break;
	case 2:
		sprintf(m_Name, "desert wolf");
		break;
	case 3:
		sprintf(m_Name, "drops");
		break;
	default:
		sprintf(m_Name, "yoyo");
		break;
	}

	m_MID = MID;

	return TRUE;
}

BOOL cMonster::Update(){
	if (m_VB->IsLoaded() == FALSE)
		return FALSE;
	
	UpdateTime();
	UpdateAction();
	UpdatePosition();
	UpdateDirection();
	SetTexture();

	return TRUE;
}

BOOL cMonster::Render()
{
	if ((m_VB->IsLoaded() == FALSE)||(m_Tex->IsLoaded()==FALSE))
		return FALSE;
	if ((m_ShadowVB->IsLoaded() == FALSE)||(m_ShadowTex->IsLoaded()==FALSE))
		return FALSE;

	UpdateTime();
	UpdateAction();
	UpdatePosition();
	UpdateDirection();
	SetTexture();

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

	// Render Monster
	m_Graphics->SetTexture(0, m_Tex);
	m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 3);
	m_VB->Render(0, 2, D3DPT_TRIANGLESTRIP);

	m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 0);

	return TRUE;
}

void cMonster::UpdateAction(){
	if ((m_Action == WALK ) && (m_XPos == m_XTarget) && (m_ZPos == m_ZTarget))
		m_Action = STAND;

	m_ActionCount = m_ActionCount + (m_LoopTime * 0.01f);

	switch (m_Action){
	case STAND:
		if (m_ActionCount >= 3) 
			m_ActionCount = 0;
		break;
	case WALK:
		if (m_ActionCount >= 4) 
			m_ActionCount = 0;
		break;
	case ATTACK:
		if (m_ActionCount >= 4){
			m_ActionCount = 0;
			m_Action = STAND;
		}
		break;
	case ATTACKED:
		if (m_ActionCount >= 3){
			m_ActionCount = 0;
			m_Action = STAND;
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

void cMonster::UpdateDirection(){
	int AngleDiff = m_RelCamera->GetOrient() - m_Orient;
	while (AngleDiff < 0)
		AngleDiff = AngleDiff + 360;
	if (AngleDiff >= 360)
		AngleDiff = AngleDiff % 360;
	
	if ((AngleDiff>=0)&&(AngleDiff<90))
		m_Direction = RIGHT_DOWN;
	else if ((AngleDiff>=90)&&(AngleDiff<180))
		m_Direction = RIGHT_UP;
	else if ((AngleDiff>=180)&&(AngleDiff<270))
		m_Direction = LEFT_UP;
	else if ((AngleDiff>=270)&&(AngleDiff<360))
		m_Direction = LEFT_DOWN;
}

BOOL cMonster::SetTexture(){
	if (m_VB->Lock(0,4) == FALSE)
		return FALSE;
	
	sVertex *Vertex = (sVertex*)m_VB->GetPtr();
	
	//===========================\ Set V Coordinate /===============================
	switch (m_Direction) {
	case RIGHT_DOWN:
	case LEFT_DOWN:
		Vertex[0].v = 0.5f;		Vertex[1].v = 0.0f;
		Vertex[2].v = 0.5f;		Vertex[3].v = 0.0f;
		break;
	case RIGHT_UP:
	case LEFT_UP:
		Vertex[0].v = 1.0f;		Vertex[1].v = 0.5f;
		Vertex[2].v = 1.0f;		Vertex[3].v = 0.5f;
	}

	//===========================\ Set U Coordinate /===============================
	int index = (int)m_ActionCount;
	if (m_Action == STAND)			index = index;
	else if (m_Action == WALK)		index = index + 3;
	else if (m_Action == ATTACK)	index = index + 7;
	else if (m_Action == ATTACKED)	index = 11;
	else if (m_Action == DIE)		index = 12;

	switch (m_Direction){
		case LEFT_UP:
		case RIGHT_DOWN:
			Vertex[0].u = index / NUM_PIC;		Vertex[2].u = (index + 1.0f) / NUM_PIC;
			Vertex[1].u = index / NUM_PIC;		Vertex[3].u = (index + 1.0f) / NUM_PIC;
			break;
		case LEFT_DOWN:
		case RIGHT_UP:
			Vertex[0].u = (index + 1.0f) / NUM_PIC;		Vertex[2].u = index / NUM_PIC;
			Vertex[1].u = (index + 1.0f) / NUM_PIC;		Vertex[3].u = index / NUM_PIC;
			break;
	}

	//=======================\ Set X-Y Coordinate /=================================
	Vertex[0].y = Vertex[2].y = 0.05f;	Vertex[1].y = Vertex[3].y = 1.55f;

	if (m_Action == ATTACK){
		index = index - 5;
		switch (index){
		case 0:
			Vertex[0].y = Vertex[2].y = 0.25f;	Vertex[1].y = Vertex[3].y = 1.75f;
			break;
		case 1:		
			Vertex[0].y = Vertex[2].y = 0.75f;	Vertex[1].y = Vertex[3].y = 2.25f;
			break;		
		case 2:
			Vertex[0].y = Vertex[2].y = 1.05f;	Vertex[1].y = Vertex[3].y = 2.55f;
			break;
		case 3:
			Vertex[0].y = Vertex[2].y = 0.95f;	Vertex[1].y = Vertex[3].y = 2.45f;
			break;
		}
	}
	
	m_VB->Unlock();

	return TRUE;
}


//============================================================================
// Class : cMonsterArray
//============================================================================
cMonsterArray::cMonsterArray(){
	m_Graphics = NULL;
	m_RelCamera = NULL;
	m_Landscape = NULL;
	m_NumTexture = NULL;

	for (int i=0 ; i<MAX_MONSTERTEXTURE ; i++){
		m_MonsterTex[i] = NULL;
		m_MonsterID[i] = -1;
	}

	m_MonsterTexCount = 0;

	m_ShadowTex = NULL;

	m_Count = 0;

	m_Font = NULL;
}

cMonsterArray::~cMonsterArray(){
	Free();
}

BOOL cMonsterArray::Free(){
	m_Landscape	= NULL;
	m_RelCamera	= NULL;
	m_Graphics	= NULL;
	m_NumTexture = NULL;

	int i;
	for (i=0 ; i<m_MonsterTexCount ; i++)
		SAFE_DELETE(m_MonsterTex[i]);

	for (i=0 ; i<MAX_MONSTERTEXTURE ; i++){
		m_MonsterID[i] = -1;
	}

	m_MonsterTexCount = 0;

	SAFE_DELETE(m_ShadowTex);

	m_Count = 0;

	SAFE_DELETE(m_Font);

	return TRUE;
}

BOOL cMonsterArray::Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cLandscape *Landscape,
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

BOOL cMonsterArray::AddMonsterTexture(int MonsterID){
	if (m_Graphics == NULL)
		return FALSE;

	if (m_MonsterTexCount >= MAX_MONSTERTEXTURE)
		return FALSE;

	// if this monster id is already load then return false
	if (GetTextureByMonsterID(MonsterID) != NULL)
			return FALSE;

	// load texture
	char szTemp[32];
	m_MonsterTex[m_MonsterTexCount] = new cTexture();
	sprintf(szTemp, "Data\\Monster%d.bmp", MonsterID);
	if(m_MonsterTex[m_MonsterTexCount]->Load(m_Graphics, szTemp, 0xffff0000) == FALSE)
		return FALSE;
	
	m_MonsterID[m_MonsterTexCount] = MonsterID;

	m_MonsterTexCount++;

	return TRUE;
}

cTexture* cMonsterArray::GetTextureByMonsterID(int MonsterID){
	for (int i=0 ; i<m_MonsterTexCount ; i++){
		if (MonsterID == m_MonsterID[i])
			return m_MonsterTex[i];
	}

	return NULL;
}

BOOL cMonsterArray::Render(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	if (m_Count == 0)
		return TRUE;

	m_Graphics->EnableAlphaTesting(TRUE);
	m_Graphics->EnableAlphaBlending(TRUE);

	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();
	
	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	

	// Render Monster
	for (int i=0 ; i<m_Count ; i++){
		m_Array[i]->Update();
		D3DXMatrixTranslation(&matTranslation, m_Array[i]->GetXPos()+XRender, m_Array[i]->GetYPos(), m_Array[i]->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
		if (FAILED(m_Graphics->GetDeviceCOM()->SetTransform(D3DTS_WORLD, &matTempWorld)))
			return FALSE;

		m_Array[i]->Render();
	}

	m_Graphics->EnableAlphaBlending(FALSE);
	m_Graphics->EnableAlphaTesting(FALSE);

	return TRUE;
}

BOOL cMonsterArray::RenderFont(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	if (m_Count == 0)
		return TRUE;

	D3DXMATRIX   matView, matProj;
	D3DXVECTOR3  vecPos;
	D3DVIEWPORT8 vpScreen;

    m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_VIEW, &matView);
	m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_PROJECTION, &matProj);
	m_Graphics->GetDeviceCOM()->GetViewport(&vpScreen);
	
	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();
	
	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	

	// Render Monster
	for (int i=0 ; i<m_Count ; i++){
		D3DXMatrixTranslation(&matTranslation, m_Array[i]->GetXPos()+XRender, m_Array[i]->GetYPos(), m_Array[i]->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
		// Render name
		if (m_Array[i]->GetNameTime() + 500 > timeGetTime()){
			D3DXVec3Project(&vecPos, &D3DXVECTOR3(0.5f, -0.1f, 0),
							&vpScreen, &matProj, &matView, &matTempWorld);
			m_Font->Print(m_Array[i]->GetName(), (long)vecPos.x-25, (long)vecPos.y, 50, 20, 0xFFFFCCCC, DT_CENTER|DT_NOCLIP );
		}
	}

	return TRUE;
}

BOOL cMonsterArray::RenderNumber(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	if (m_Count == 0)
		return TRUE;

	m_Graphics->EnableAlphaTesting(TRUE);
	m_Graphics->EnableAlphaBlending(TRUE);
	m_Graphics->EnableZBuffer(FALSE);

	D3DXMATRIX matBillboardWorld, matTranslation, matTempWorld;
	matBillboardWorld = m_RelCamera->GetBillboardMetrix();	

	float XRender = m_RelCamera->GetXRender();
	float ZRender = m_RelCamera->GetZRender();
	
	// Render Number
	for (int i=0 ; i<m_Count ; i++){
		D3DXMatrixTranslation(&matTranslation, m_Array[i]->GetXPos()+XRender, m_Array[i]->GetYPos(), m_Array[i]->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
		if (FAILED(m_Graphics->GetDeviceCOM()->SetTransform(D3DTS_WORLD, &matTempWorld)))
			return FALSE;

		m_Array[i]->SetNumberSide(FALSE);
		m_Array[i]->RenderNumber();
	}

	m_Graphics->EnableZBuffer(TRUE);
	m_Graphics->EnableAlphaBlending(FALSE);
	m_Graphics->EnableAlphaTesting(FALSE);

	return TRUE;
}

BOOL cMonsterArray::AddMonster(int MID, int MonsterID, float XPos, float ZPos, int Orient){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL)||(m_Landscape == NULL)||(m_NumTexture == NULL))
		return FALSE;

	if (m_Count >= MAX_COUNT)
		return FALSE;

	// Cheak Texture for ID
	if (GetTextureByMonsterID(MonsterID) == NULL)
			if (AddMonsterTexture(MonsterID) == FALSE)
				return FALSE;

	//Add monster
	m_Array[m_Count] = new cMonster();
	if (m_Array[m_Count]->Create(m_Graphics, m_RelCamera, m_Landscape, m_NumTexture,
								GetTextureByMonsterID(MonsterID), m_ShadowTex, MID, MonsterID) == FALSE){
		SAFE_DELETE(m_Array[m_Count]);
		return FALSE;
	}

	m_Array[m_Count]->SetPosition(XPos, ZPos);
	m_Array[m_Count]->SetOrientation(Orient);
	
	m_Count++;

	return TRUE;
}

BOOL cMonsterArray::GetMonsterByID(int MID, cMonster** Monster){
	if (m_Count <= 0)
		return FALSE;

	for (int i=0 ; i<m_Count ; i++){
		if (m_Array[i]->GetMID() == MID){
			*Monster = m_Array[i];
			return TRUE;
		}
	}

	*Monster = NULL;
	return FALSE;
}

BOOL cMonsterArray::GetMonsterByMouse(long MouseX, long MouseY, cMonster** Monster){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL))
		return FALSE;

	if (m_Count <= 0)
		return FALSE;

	// Convert Mouse position to 3D space
	D3DXMATRIX matProj;
	D3DXMATRIX matView, matInvView;
	D3DXVECTOR3 vecRay, vec, vecDir;

	D3DXMATRIX matInv;
	D3DXVECTOR3 vecObjRay, vecObjDir;

	D3DXVECTOR3 p0 = D3DXVECTOR3(-0.25f, 0.05f, 0.0f);
	D3DXVECTOR3 p1 = D3DXVECTOR3(-0.25f, 1.55f, 0.0f);
	D3DXVECTOR3 p2 = D3DXVECTOR3( 1.25f, 0.05f, 0.0f);
	D3DXVECTOR3 p3 = D3DXVECTOR3( 1.25f, 1.55f, 0.0f);

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
	cMonster* tempReturn = NULL;

	for(int i=0 ; i<m_Count ; i++){
		D3DXMatrixTranslation(&matTranslation, m_Array[i]->GetXPos()+XRender, m_Array[i]->GetYPos(), m_Array[i]->GetZPos()+ZRender);
		D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);

		D3DXMatrixInverse(&matInv, NULL, &matTempWorld);
		D3DXVec3TransformCoord(&vecObjRay, &vecRay, &matInv);
		D3DXVec3TransformNormal(&vecObjDir, &vecDir, &matInv);

		if (D3DXIntersectTri(&p0, &p1, &p2, &vecObjRay, &vecObjDir, &u, &v, &Dist) == TRUE){
			if (Dist < NearestDist){
				NearestDist = Dist;
				tempReturn = m_Array[i];
			}
		}else if(D3DXIntersectTri(&p3, &p1, &p1, &vecObjRay, &vecObjDir, &u, &v, &Dist) == TRUE){
			if (Dist < NearestDist){
				NearestDist = Dist;
				tempReturn = m_Array[i];
			}
		}
	}

	if (tempReturn != NULL){
		*Monster = tempReturn;
		return TRUE;
	}
	
	//else
	*Monster = NULL;
	return FALSE;
}

BOOL cMonsterArray::ResetEnermyForAll(cCreature* DiePlayer){
	if (m_Count <= 0)
		return TRUE;

	for (int i=0 ; i<m_Count ; i++){
		if (m_Array[i]->GetEnermy() == DiePlayer){
			m_Array[i]->ResetEnermy();
		}
	}

	return TRUE;
}
