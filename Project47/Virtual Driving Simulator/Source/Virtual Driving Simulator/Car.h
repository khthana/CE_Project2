//-----------------------------------------------------------------------------
// Name: class CCar
// Desc: This class use for keep all car parameters
//-----------------------------------------------------------------------------
class CCar 
{
public:
	CCar(){ m_fWheelDirection = 0; m_fVelocity = 0.00f; m_iAccel = 0; m_iGear = 0; EngineState = false; m_iRPM = 0; m_fDirection = 0;};
public:
	D3DXVECTOR3 m_vFrontLeft;
	D3DXVECTOR3 m_vFrontRight;
	D3DXVECTOR3 m_vBackLeft;
	D3DXVECTOR3 m_vBackRight;
	D3DXVECTOR3 m_vCurrentPos;
	FLOAT       m_fWheelDirection;
	FLOAT		m_fVelocity;
	int			m_iAccel;
	int			m_iGear;
	int			m_iRPM;
	BOOL		m_fDirection;
    CD3DMesh*   m_pCar;
	BOOL	EngineState;
};
