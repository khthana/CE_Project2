#include "cMiniMap.h"

cMiniMap::cMiniMap(){
	m_Graphics	= NULL;
	m_Player	= NULL;
}

BOOL cMiniMap::Create(cGraphics *Graphics, cPlayer *Player){
	if ((m_Graphics = Graphics) == NULL)
		return FALSE;

	if ((m_Player = Player) == NULL)
		return FALSE;

	if(m_MiniMap.Load(m_Graphics, "Data\\MiniMap.bmp") == FALSE)
		return FALSE;

	if(m_MiniMapPos.Load(m_Graphics, "Data\\MiniMapPos.bmp") == FALSE)
		return FALSE;

	return TRUE;
}

BOOL cMiniMap::RenderMap(HWND hWnd){
	if ((m_Graphics == NULL)||(m_Player == NULL))
		return FALSE;

	RECT rect;
	GetClientRect(hWnd, &rect);
	float XPos = rect.right - 140.0f; 
	float YPos = rect.top + 5.0f;

	m_Graphics->EnableAlphaBlending(TRUE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP,	  D3DTOP_MODULATE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(1, D3DTSS_COLOROP,   D3DTOP_DISABLE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(1, D3DTSS_ALPHAOP,   D3DTOP_DISABLE);
	
	// Render MiniMap
	m_MiniMap.Blit((long)XPos, (long)YPos, 0, 0, 0, 0, 0.5f, 0.5f);

	// Render MiniMapPos
	XPos = (XPos - 2) + (long)( (m_Player->GetXPos() + 60.0f) * 1.03333f );
	YPos = (YPos - 2) + (long)( (60.0f - m_Player->GetZPos()) * 1.03333f );
	RECT Rect;
	ID3DXSprite *pSprite;
	if((pSprite = m_Graphics->GetSpriteCOM()) == NULL)
		return FALSE;
	Rect.left = 0;
	Rect.top  = 0;
	Rect.right = m_MiniMapPos.GetWidth();
	Rect.bottom = m_MiniMapPos.GetHeight();

	if(FAILED(pSprite->Draw(m_MiniMapPos.GetTextureCOM(), &Rect, &D3DXVECTOR2(0.5f, 0.5f), 
							&D3DXVECTOR2(5,5), m_Player->GetOrient()*0.017f, 
							&D3DXVECTOR2(XPos, YPos), 0xFFFFFFFF)))
		return FALSE;
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
	m_Graphics->EnableAlphaBlending(FALSE);

	return TRUE;
}