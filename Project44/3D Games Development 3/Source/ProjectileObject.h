#pragma once
#include "d3dx8.h"
#include "Engine\StaticModel.h"

class CProjectileObject : public CStaticModel  
{
public:
	CProjectileObject();
	CProjectileObject( D3DXVECTOR3 vPos, D3DXVECTOR3 vStartVelocity, float fGravity );
	virtual ~CProjectileObject();

private:
	D3DXVECTOR3 m_vStartVelocity;          // Unit Vector of, v, t
	D3DXVECTOR3 m_vCurrentVelocity;
	float       m_fGravity;

public:
	virtual BOOL Process( float fElapseTime );
	virtual HRESULT Render(); 
	
	BOOL IsReachTarget();

private:
	CSLandModel *m_pLand;

public:
	void SetLand( CSLandModel *pLand );

protected:
	// Cache Triangle Use for GetHigh
	CCacheTriangle CacheTri;

};

//=============================== CProjectileObjectList ==================================
class CProjectileObjectList 
{
public:
	CProjectileObjectList();
	~CProjectileObjectList();

private:
	CPtrArray m_arObject;

public:
	void Add(  D3DXVECTOR3 vPos, D3DXVECTOR3 vStartVelocity, float fGravity = 9.8f );
	void RemoveAll();
	virtual BOOL Process( float fElapseTime );
	virtual HRESULT Render(); 
	
	// Get Information
	inline int GetNumObject() { return m_arObject.GetUpperBound() + 1; };

private:
	CSLandModel *m_pLand;

public:
	void SetLand( CSLandModel *pLand );

};


