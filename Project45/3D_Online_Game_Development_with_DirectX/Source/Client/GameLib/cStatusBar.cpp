#include "cStatusBar.h"

cStatusBar::cStatusBar(){
	m_Graphics	= NULL;
	m_RelCamera	= NULL;
	m_Player	= NULL;
}

BOOL cStatusBar::Create(cGraphics *Graphics, cRelativeCamera *RelCamera, cPlayer *Player){
	if ((m_Graphics = Graphics) == NULL)
		return FALSE;

	if ((m_RelCamera = RelCamera) == NULL)
		return FALSE;

	if ((m_Player = Player) == NULL)
		return FALSE;

	if(m_StatusBar.Load(m_Graphics, "Data\\BarStatus.bmp") == FALSE)
		return FALSE;

	if(m_ColorBar.Load(m_Graphics, "Data\\BarColor.bmp") == FALSE)
		return FALSE;

	return TRUE;
}

void cStatusBar::SetStatus(int HP, int MaxHP, int MP, int MaxMP){
	m_PercentHP = (int)((HP*100)/MaxHP);
	m_PercentMP = (int)((MP*100)/MaxMP);
}

BOOL cStatusBar::RenderBar(){
	if ((m_Graphics == NULL)||(m_RelCamera == NULL)||(m_Player == NULL))
		return FALSE;

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

	D3DXMatrixTranslation(&matTranslation, m_Player->GetXPos()+XRender, m_Player->GetYPos(), m_Player->GetZPos()+ZRender);
	D3DXMatrixMultiply(&matTempWorld, &matBillboardWorld, &matTranslation);
		
	// Render Bar
	D3DXVec3Project(&vecPos, &D3DXVECTOR3(0.5f, -0.025f, 0), &vpScreen, &matProj, &matView, &matTempWorld);	
			

	m_StatusBar.Blit((long)(vecPos.x-26), (long)(vecPos.y), 0, 0, 0, 0, 0.405f, 0.47f);
	
	if (m_PercentHP <= 30)
		m_ColorBar.Blit((long)(vecPos.x-25), (long)(vecPos.y+1), 0, 11, 1, 3, (float)m_PercentHP/2.0f, 0.82f);
	else
		m_ColorBar.Blit((long)(vecPos.x-25), (long)(vecPos.y+1), 0, 1, 1, 3, (float)m_PercentHP/2.0f, 0.82f);

	if (m_PercentMP <= 30)
		m_ColorBar.Blit((long)(vecPos.x-25), (long)(vecPos.y+4), 0, 11, 1, 3, (float)m_PercentMP/2.0f, 0.82f);
	else
		m_ColorBar.Blit((long)(vecPos.x-25), (long)(vecPos.y+4), 0, 7, 1, 3, (float)m_PercentMP/2.0f, 0.82f);

	return TRUE;

}