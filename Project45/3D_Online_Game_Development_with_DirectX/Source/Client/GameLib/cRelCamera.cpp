#include "Core_Global.h"
#include "cRelCamera.h"
#include <math.h>

//============================================================================
// Class : cRelativeCamera
//============================================================================
cRelativeCamera::cRelativeCamera(){
	m_Graphics = NULL;

	m_XEye = m_YEye = m_ZEye = 0.0f;
	m_XRender = m_ZRender = 0.0f;
	m_Length	= 18.0;
	m_Zeta		= 60;
	m_Alpha		= 0;

	D3DXMatrixIdentity(&m_BillboardMatrix);	
}

BOOL cRelativeCamera::Free(){
	m_Graphics = NULL;

	m_XEye = m_YEye = m_ZEye = 0.0f;
	m_XRender = m_ZRender = 0.0f;
	m_Length	= 18.0;
	m_Zeta		= 60;
	m_Alpha		= 0;

	D3DXMatrixIdentity(&m_BillboardMatrix);	

	return TRUE;
}

BOOL cRelativeCamera::Create(cGraphics *Graphics){
	Free();

	if ((m_Graphics = Graphics) == NULL)
		return FALSE;

	// Pre-calculate sin&cos
	double temp = 3.1415926535 / 180.0;
	for(int i=0 ; i<360 ; i++){
		m_cos[i] = (float) cos( i * temp );
		m_sin[i] = (float) sin( i * temp );
	}

	// Init Camera
	Update();

	return TRUE;
}

void cRelativeCamera::CalculateOffset(float *XOffset, float* YOffset, float *ZOffset){
	int tempAngle = m_Alpha - 90;
	if (tempAngle < 0)	tempAngle = tempAngle + 360;
	*XOffset = (float) (m_Length * m_cos[m_Zeta] * m_cos[tempAngle]);	
	*YOffset = (float) (m_Length * m_sin[m_Zeta]);
	*ZOffset = (float) (m_Length * m_cos[m_Zeta] * m_sin[tempAngle]);  
}

void cRelativeCamera::SetLength(float Length){
	// Length Between [13.0, 18.0]
	if (Length < 13.0)
		m_Length = 13.0;
	else if (Length > 18.0)
		m_Length = 18.0;
	else
		m_Length = Length;		
}

void cRelativeCamera::SetZeta(int Zeta){
	// Zeta Between [40, 65]
	if (Zeta < 40)
		m_Zeta = 40;
	else if (Zeta > 65)
		m_Zeta = 65;
	else
		m_Zeta = Zeta;
}

void cRelativeCamera::SetAlpha(int Alpha){
	m_Alpha = Alpha;

	// Alpha Between [0, 359]
	while (m_Alpha < 0)
		m_Alpha = m_Alpha + 360;
	if (m_Alpha >= 360)
		m_Alpha = m_Alpha % 360;
}

void cRelativeCamera::AddLength(float DeltaLength){
	SetLength(m_Length + DeltaLength);
}
void cRelativeCamera::AddZeta(int DeltaZeta){
	SetZeta(m_Zeta + DeltaZeta);
}
void cRelativeCamera::AddAlpha(int DeltaAlpha){
	SetAlpha(m_Alpha + DeltaAlpha);
}

void cRelativeCamera::RelateTo(float XEye, float YEye, float ZEye){
	m_XEye = XEye;
	m_YEye = YEye;
	m_ZEye = ZEye;
}

void cRelativeCamera::Update(){
	
	float XOffset, YOffset, ZOffset;
	CalculateOffset(&XOffset, &YOffset, &ZOffset);
	m_Camera.Point(XOffset + m_XEye, YOffset + m_YEye, ZOffset + m_ZEye,
				   m_XEye, m_YEye, m_ZEye);

	// Calclate XRender and ZRender
	int temp = m_Alpha - 135;
	if (temp < 0)	temp = temp + 360;

	m_XRender = (0.7071067812f * (m_cos[temp])) + 0.5f;
	m_ZRender = (0.7071067812f * (m_sin[temp])) + 0.5f;
}

D3DXMATRIX	cRelativeCamera::GetBillboardMetrix(){
	D3DXMATRIX matBillboard, matView, matTransposed;

	D3DXMatrixIdentity(&matBillboard);

	// Caculate Billboarding Matrix
	if(m_Graphics != NULL && m_Graphics->GetDeviceCOM() != NULL) {
      m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_VIEW, &matView);
      D3DXMatrixTranspose(&matTransposed, &matView);
      matTransposed._41 = matTransposed._42 = matTransposed._43 = matTransposed._14 = matTransposed._24 = matTransposed._34 = 0.0f;
    } else {
      D3DXMatrixIdentity(&matTransposed);
    }

	// Apply billboard matrix
    D3DXMatrixMultiply(&matBillboard, &matBillboard, &matTransposed);

	return matBillboard;
}
