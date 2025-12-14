#ifndef _CRELCAMERA_H_
#define _CRELCAMERA_H_

#include "Core_Global.h"

//============================================================================
// Class : cRelativeCamera
//============================================================================
class cRelativeCamera
{
	private:
		cGraphics	*m_Graphics;
		cCamera		m_Camera;
		float		m_XEye, m_YEye, m_ZEye;
		float		m_Length;	
		int			m_Zeta;		
		int			m_Alpha;	

		// Pre-calculate sin&cos;
		float		m_sin[360];
		float		m_cos[360];

		// x and z that use to render billboarding object
		float		m_XRender;
		float		m_ZRender;

		D3DXMATRIX	m_BillboardMatrix;

	private:
		void CalculateOffset(float *XOffset, float *YOffset, float *ZOffset);	
		
		// Should use these functions for out-bound protecting
		void SetLength(float Length);	
		void SetZeta(int Zeta);			
		void SetAlpha(int Alpha);

	public:
		cRelativeCamera();

		BOOL Create(cGraphics *Graphics);
		BOOL Free();

		cCamera*	GetCamera()				{ return &m_Camera; }
		int			GetOrient()				{ return m_Alpha; }
		float		GetXRender()			{ return m_XRender; }
		float		GetZRender()			{ return m_ZRender; }
		D3DXMATRIX	GetBillboardMetrix();

		void AddLength(float DeltaLength);	
		void AddZeta(int DeltaZeta);			
		void AddAlpha(int DeltaAlpha);

		void RelateTo(float XEye, float YEye, float ZEye);

		void Update();
};

#endif