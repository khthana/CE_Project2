#pragma warning(disable:4786)
#ifndef __NG3D_H
#define __NG3D_H

#include <d3d8.h>
#include "ngtypes.h"

#define MAX_ADAPTER 8
#define MIN_WIDTH	800
#define MIN_HEIGHT	600

class NG3D
{
protected:
	NGCREATEINFO			m_CreateInfo;

	RECT					m_rcClient;

	DWORD					m_dwNumAdapters;			
    DWORD					m_dwAdapter;
	DWORD					m_dwBehavior; 

	LPDIRECT3D8				m_lpD3d;
	LPDIRECT3DDEVICE8		m_lpDevice;
	
	D3DPRESENT_PARAMETERS	m_d3dpp;
	D3DCAPS8				m_d3dCaps; 

	LPDIRECT3DSURFACE8		m_lpBackBuffer;
    D3DSURFACE_DESC			m_d3dsdBackBuffer;

	NGADAPTERINFO			m_AdaptersInfo[8];
	NGMODEINFO*				m_pModeInfo;

	NG3D(NGCREATEINFO*);

	BOOL					FindDepthStencilFormat(UINT,D3DDEVTYPE,D3DFORMAT,D3DFORMAT*); 
	HRESULT					InitialGraphics();
	HRESULT					InitialDevice();
	HRESULT					CheckDevice();
	HRESULT					FindPreferDevice();
	
	static NG3D*		m_cGraphics;

public:
	~NG3D();

	static	HRESULT			CreateGraphics(NGCREATEINFO*);

	HRESULT					ResizeScene(RECT*);
	BOOL					TestAdapter(NGADAPTERINFO*&, INT&);

	virtual	LPVOID			CreateScene(LPVOID);
	virtual	HRESULT			ConfirmDevice(D3DCAPS8*,DWORD,D3DFORMAT);
	virtual HRESULT			ClearResource();
	virtual	HRESULT			RestoreResource();
	virtual	HRESULT			Render();

	// Accessors
	LPDIRECT3DDEVICE8		GetDevice()			{return m_lpDevice;};
	NGADAPTERINFO*			GetAdapterInfo(UINT id)	{ return &m_AdaptersInfo[id];};
	DWORD					GetAdapterCount()	{ return m_dwNumAdapters;};
	D3DCAPS8*				GetDeviceCaps()		{ return &m_d3dCaps;};
	NGCREATEINFO*			GetCreateInfo()		{ return &m_CreateInfo;};

	static NG3D*		GetGraphics()		{ return m_cGraphics;};
};

inline NG3D* Graphics()
{
	return NG3D::GetGraphics();
}
	
#endif
