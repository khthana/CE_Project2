#include "Core_Global.h"
#include "cNumber.h"

//============================================================================
// Class : cNumber
//============================================================================
cNumber::cNumber()
{
	m_Graphics	= NULL;
	m_Texture	= NULL;
	
	m_VB	= NULL;

	m_IsPlayerSide = TRUE;

	m_Time[0] = 0;
	m_Time[1] = 0;
	m_Time[2] = 0;
	m_Time[3] = 0;
	m_Time[4] = 0;

	m_Length[0] = 0;
	m_Length[1] = 0;
	m_Length[2] = 0;
	m_Length[3] = 0;
	m_Length[4] = 0;

	m_Count = 0;
}

BOOL cNumber::Free()
{
	SAFE_DELETE(m_VB);

	m_IsPlayerSide = TRUE;

	m_Time[0] = 0;
	m_Time[1] = 0;
	m_Time[2] = 0;
	m_Time[3] = 0;
	m_Time[4] = 0;

	m_Length[0] = 0;
	m_Length[1] = 0;
	m_Length[2] = 0;
	m_Length[3] = 0;
	m_Length[4] = 0;

	m_Count		= 0;
	
	m_Texture	= NULL;
	m_Graphics	= NULL;

	return TRUE;
}

cNumber::~cNumber()
{
	Free();
}

BOOL cNumber::Create(cGraphics *Graphics, cTexture *Texture){
	Free();

	if ((m_Graphics = Graphics) == NULL)
		return FALSE;

	if ((m_Texture = Texture) == NULL)
		return FALSE;

	sVertex Vertex[120];

	int i;
	for( i=0 ; i<120 ; i++){
		Vertex[i].x		= 0.0f;
		Vertex[i].y		= 0.0f;
		Vertex[i].z		= 0.0f;
		Vertex[i].color	= 0xffffffff;
		Vertex[i].u		= 0.0f;
		Vertex[i].v		= 0.0f;
	}

	// Create vertexBuffer 
	m_VB = new cVertexBuffer();
	if(m_VB->Create(m_Graphics, 120, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
		return FALSE;
	if(m_VB->Set(0, 120, &Vertex) == FALSE)
		return FALSE;

	return TRUE;
}

BOOL cNumber::ShowNumber(int number){
	// Check out-bound
	if ((number < 0) || (number > 9999))
		return FALSE;

	if ((m_Graphics == NULL)||(m_Texture == NULL))
		return FALSE;

	if (m_VB->IsLoaded() == FALSE)
		return FALSE;

	// Lock vertex buffer
	if (m_VB->Lock(m_Count*24, 24) == FALSE)
		return FALSE;
	
	sVertex *Vertex = (sVertex*)m_VB->GetPtr();

	m_Length[m_Count] = 0;

	int i, index;
	
	//============\ Set texture coordinate of vertex buffer/===============
	// Set V Coordinate : V is up to side
	if (m_IsPlayerSide == TRUE)	index = 0;
	else						index = 1;

	for ( i=0 ; i<24 ; i+=6){
		Vertex[i].v     = Vertex[i + 2].v = Vertex[i + 4].v = (index + 1) / 2.0f;	
		Vertex[i + 1].v = Vertex[i + 3].v = Vertex[i + 5].v = index / 2.0f;		
	}
	
	// Set U Coordinate : U is up to digit number
	if (number == 0){
		m_Length[m_Count] = 4;
		// Show Miss!!
		index = 10;
		for ( i=0 ; i<24 ; i+=6){
			Vertex[i].u     = Vertex[i + 1].u = Vertex[i + 5].u = index / 14.0f;	
			Vertex[i + 2].u = Vertex[i + 3].u = Vertex[i + 4].u = (index + 1) / 14.0f;
			index++;
		}
	}else{
		int digit[4];
		digit[0] = number / 1000;
		number = number - (digit[0] * 1000);
		digit[1] = number / 100;
		number = number - (digit[1] * 100);
		digit[2] = number / 10;
		number = number - (digit[2] * 10);
		digit[3] = number;

		index = 0;
		BOOL isFirst = TRUE;
		for ( i=0 ; i<24 ; i+=6){
			if (digit[index] == 0 && isFirst == TRUE){
				Vertex[i].u     = Vertex[i + 1].u =	Vertex[i + 2].u = 0.0f;		
				Vertex[i + 3].u = Vertex[i + 4].u =	Vertex[i + 5].u = 0.0f;		
				Vertex[i].v     = Vertex[i + 1].v =	Vertex[i + 2].v = 0.0f;		
				Vertex[i + 3].v = Vertex[i + 4].v =	Vertex[i + 5].v = 0.0f;		
			}else{
				isFirst = FALSE;
				m_Length[m_Count]++;
				Vertex[i].u     = Vertex[i + 1].u = Vertex[i + 5].u = digit[index] / 14.0f;	
				Vertex[i + 2].u = Vertex[i + 3].u = Vertex[i + 4].u = (digit[index] + 1) / 14.0f;
			}
			index++;
		}
	}

	m_VB->Unlock();

	// Set time
	m_Time[m_Count] = timeGetTime();

	// Increase count
	m_Count++;
	if (m_Count >= 5)	m_Count = 0;

	return TRUE;
}

BOOL cNumber::Render()
{
	if ((m_VB->IsLoaded() == FALSE)||(m_Texture->IsLoaded()==FALSE))
		return FALSE;

	SetAnimate();

	// Render Number
	m_Graphics->SetTexture(0, m_Texture);
	m_VB->Render(0, 40, D3DPT_TRIANGLELIST);

	return TRUE;
}

void cNumber::SetAnimate(){
	if (m_VB->Lock(0, 120) == FALSE)
		return;
	
	sVertex *Vertex = (sVertex*)m_VB->GetPtr();

	int i, j, index;
	float size, height;

	for( i=0 ; i<5 ; i++)
	{
		DWORD DiffTime = timeGetTime() - m_Time[i];

		if (DiffTime > 1500)
		{
			// Do not display
			for ( j=0 ; j<24 ; j++){
				index = i*24 + j;
				Vertex[index].x	= Vertex[index].y = 0.0f;
			}
		}
		else
		{			
			if (DiffTime < 300){
				height = 1.45f + DiffTime * 0.001f;
				size = 0.5;
			}else{
				height = 0.5f + DiffTime * 0.0025f;
				size = 0.12f;
			}
			float temp = 4.0f -  (m_Length[i] / 2.0f);

			for ( j=0 ; j<4 ; j++){
				index = i*24 + j*6;
				Vertex[index].x     = Vertex[index + 1].x = Vertex[index + 5].x = 2.0f * size * (j-temp) + 0.5f;
				Vertex[index + 2].x = Vertex[index + 3].x = Vertex[index + 4].x = 2.0f * size * (j-temp+1) + 0.5f;
				Vertex[index].y     = Vertex[index + 2].y = Vertex[index + 4].y = height;
				Vertex[index + 1].y = Vertex[index + 3].y = Vertex[index + 5].y = 3.0f * size + height;
			}
		}
	}
	
	m_VB->Unlock();
}

