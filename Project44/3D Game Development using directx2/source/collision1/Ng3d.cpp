#define STRICT

#include "stdafx.h"
#include <windows.h>
#include <windowsx.h>
#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"

NG3D* NG3D::m_cGraphics = NULL;

int compare(const VOID* arg1,const VOID* arg2)
{
	D3DDISPLAYMODE* p1 = (D3DDISPLAYMODE*)arg1;
	D3DDISPLAYMODE* p2 = (D3DDISPLAYMODE*)arg2;
	
	if (p1->Format > p2->Format)	return -1;
	if (p1->Format < p2->Format)	return +1;
	if (p1->Width  < p2->Width)		return -1;
	if (p1->Width  > p2->Width)		return +1;
	if (p1->Height < p2->Height)	return -1;
	if (p1->Height > p2->Height)	return +1;
	
	return 0;
}


// 
//	TO DO: Fill information and value used to create device.
//

NG3D::NG3D(NGCREATEINFO* sCreate)
{
	m_CreateInfo		= *sCreate;
	m_lpD3d				= NULL;
	m_lpDevice			= NULL;
	m_dwAdapter			= 0L;
	
	m_dwNumAdapters		= 0;
	m_lpBackBuffer		= NULL;

	GetClientRect(m_CreateInfo.hWnd,&m_rcClient);

	m_cGraphics	= this;
}

NG3D::~NG3D()
{
	ClearResource();
	REL(m_lpBackBuffer);
	REL(m_lpDevice);
	REL(m_lpD3d);
}

HRESULT NG3D::CheckDevice()
{	
	UINT dwNumAdapters	= 0;

	// Adapter check
	for (UINT iAdapter=0;iAdapter < m_lpD3d->GetAdapterCount();iAdapter++)
	{
		NGADAPTERINFO*	pAdapter	= &m_AdaptersInfo[m_dwNumAdapters];
		pAdapter->dwNumModes	= 0;

		m_lpD3d->GetAdapterIdentifier(iAdapter,0,&pAdapter->d3dAdapterID);
		m_lpD3d->GetAdapterDisplayMode(iAdapter,&pAdapter->d3ddmDesktop);

		// Mode check
		D3DDISPLAYMODE	modes[100];
		D3DFORMAT		formats[20];
		UINT dwNumModes		= 0;
		UINT dwNumFormats	= 0;
		UINT dwNumAdapterModes	= m_lpD3d->GetAdapterModeCount(iAdapter);
		for (UINT iMode=0;iMode < dwNumAdapterModes;iMode++)
		{
			D3DDISPLAYMODE	d3dMode;
			
			m_lpD3d->EnumAdapterModes(iAdapter,iMode,&d3dMode);

			if (d3dMode.Width<MIN_WIDTH||d3dMode.Height<MIN_HEIGHT)
				continue;

			for (UINT m=0;m < dwNumModes;m++)
			{
				if ((modes[m].Width==d3dMode.Width)	&&
					(modes[m].Height==d3dMode.Height) &&
					(modes[m].Format==d3dMode.Format))
					break;
			}

			if (m==dwNumModes)
			{
				modes[dwNumModes]	= d3dMode;
				modes[dwNumModes].RefreshRate	= 0;
				dwNumModes++;
			}

			for (UINT f=0;f < dwNumFormats;f++)
			{
				if (formats[f]==modes[dwNumModes-1].Format)
					break;
			}

			if (f==dwNumFormats)
			{
				formats[dwNumFormats]	= modes[dwNumModes-1].Format;
				dwNumFormats++;
			}
		}
		
		// sort mode by width,height and bit depth
		qsort(modes,dwNumModes,sizeof(D3DDISPLAYMODE),compare);

		// Device capacity check
		NGDEVICEINFO*	pDevice;

		pDevice	= &pAdapter->devices;
        pDevice->d3dDeviceType	= D3DDEVTYPE_HAL;
		m_lpD3d->GetDeviceCaps(iAdapter,D3DDEVTYPE_HAL,&pDevice->d3dCaps);

		pDevice->bCanDoWindow	= FALSE;
		pDevice->bDesktopWindow	= FALSE;

		BOOL		bFormatConfirmed[20];
	    DWORD		dwBehavior[20];
	    D3DFORMAT	fmtDepthStencil[20];
	    for (DWORD f=0;f < dwNumFormats;f++)
	    {
	        bFormatConfirmed[f]	= FALSE;
	        fmtDepthStencil[f]	= D3DFMT_UNKNOWN;
	
	        if (FAILED(m_lpD3d->CheckDeviceType(iAdapter,D3DDEVTYPE_HAL,formats[f],
												formats[f],FALSE)))
	            continue;
	
	        if (pDevice->d3dCaps.Caps2 & D3DCAPS2_CANRENDERWINDOWED)
	        {
				pDevice->bCanDoWindow	= TRUE;
				
				if (pAdapter->d3ddmDesktop.Format==formats[f])
					pDevice->bDesktopWindow	= TRUE;
			}
			else
			{
				pDevice->bCanDoWindow	= FALSE;
				pDevice->bDesktopWindow	= FALSE;
			}
	
	        // Check Device Capacity to select what behavior to use 
			// Checking for Hardware Device
	        if (pDevice->d3dCaps.DevCaps&D3DDEVCAPS_HWTRANSFORMANDLIGHT)
	        {
	            if (pDevice->d3dCaps.DevCaps&D3DDEVCAPS_PUREDEVICE)
	            {
					// Device can perform T&L by not use any SW
	                dwBehavior[f] = D3DCREATE_HARDWARE_VERTEXPROCESSING|D3DCREATE_PUREDEVICE;
	
	                if (SUCCEEDED(ConfirmDevice(&pDevice->d3dCaps,dwBehavior[f],formats[f])))
	                    bFormatConfirmed[f] = TRUE;
	            }
				
	            if (FALSE==bFormatConfirmed[f])
	            {
					// Device can perform T&L but maybe use some SW
	                dwBehavior[f] = D3DCREATE_HARDWARE_VERTEXPROCESSING;
	
	                if (SUCCEEDED(ConfirmDevice(&pDevice->d3dCaps,dwBehavior[f],formats[f])))
	                    bFormatConfirmed[f] = TRUE;
	            }
	
	            if (FALSE==bFormatConfirmed[f])
	            {
					// Device can perform T&L but require some SW
	                dwBehavior[f] = D3DCREATE_MIXED_VERTEXPROCESSING;
	
	                if (SUCCEEDED(ConfirmDevice(&pDevice->d3dCaps,dwBehavior[f],formats[f])))
	                    bFormatConfirmed[f] = TRUE;
	            }
	        }
	
	        // Checking for Software Device
	        if (FALSE==bFormatConfirmed[f])
	        {
	            dwBehavior[f] = D3DCREATE_SOFTWARE_VERTEXPROCESSING;
	
	            if (SUCCEEDED(ConfirmDevice(&pDevice->d3dCaps,dwBehavior[f],formats[f])))
	                bFormatConfirmed[f] = TRUE;
	        }
	
	        // Find a suitable depth/stencil buffer format for this device/format
	        if (bFormatConfirmed[f] && m_CreateInfo.bUseDepthBuffer)
	        {
	            if (!FindDepthStencilFormat(iAdapter,D3DDEVTYPE_HAL,formats[f],&fmtDepthStencil[f]))
	            {
	                bFormatConfirmed[f] = FALSE;
	            }
	        }
	    }

		// Fill in data
		for (DWORD i=0L; i<dwNumModes; i++ )
	    {
		    for( DWORD f=0; f<dwNumFormats; f++ )
		    {
			    if( modes[i].Format == formats[f] )
				{
					if( bFormatConfirmed[f] == TRUE )
					{
						// Add this mode to the device's list of valid modes
						pAdapter->modes[pAdapter->dwNumModes].dwWidth	= modes[i].Width;
						pAdapter->modes[pAdapter->dwNumModes].dwHeight	= modes[i].Height;
						pAdapter->modes[pAdapter->dwNumModes].d3dFormat	= modes[i].Format;
						pAdapter->modes[pAdapter->dwNumModes].dwBehavior	= dwBehavior[f];
						pAdapter->modes[pAdapter->dwNumModes].d3dStencilFormat = fmtDepthStencil[f];
						pAdapter->dwNumModes++;
					}
				}
			}
		}

		if (pAdapter->dwNumModes > 0)
			m_dwNumAdapters++;
	}
	
	if (m_dwNumAdapters==0)
		return DEVICE_ERR_NOSUPPORTDEVICE;

	return S_OK;
}

BOOL NG3D::FindDepthStencilFormat(	UINT iAdapter,D3DDEVTYPE DeviceType,D3DFORMAT TargetFormat,
										D3DFORMAT* pDepthStencilFormat)
{
	DWORD	dwMinDepthBits		= m_CreateInfo.dwMinDepthBits;
	DWORD	dwMinStencilBits	= m_CreateInfo.dwMinStencilBits;

    if (dwMinDepthBits<=16 && dwMinStencilBits==0)
    {
        if (SUCCEEDED(m_lpD3d->CheckDeviceFormat(iAdapter,DeviceType,TargetFormat,
													D3DUSAGE_DEPTHSTENCIL,D3DRTYPE_SURFACE,D3DFMT_D16)))
        {
            if (SUCCEEDED(m_lpD3d->CheckDepthStencilMatch(iAdapter,DeviceType,TargetFormat,TargetFormat, 
															D3DFMT_D16)))
            {
                *pDepthStencilFormat = D3DFMT_D16;
                return TRUE;
            }
        }
    }

    if (dwMinDepthBits<=15 && dwMinStencilBits<=1)
    {
        if (SUCCEEDED(m_lpD3d->CheckDeviceFormat(iAdapter,DeviceType,TargetFormat,
												D3DUSAGE_DEPTHSTENCIL,D3DRTYPE_SURFACE,D3DFMT_D15S1)))
        {
            if (SUCCEEDED(m_lpD3d->CheckDepthStencilMatch(iAdapter,DeviceType,TargetFormat,TargetFormat, 
															D3DFMT_D15S1)))
            {
                *pDepthStencilFormat = D3DFMT_D15S1;
                return TRUE;
            }
        }
    }

    if (dwMinDepthBits<=24 && dwMinStencilBits==0)
    {
        if (SUCCEEDED(m_lpD3d->CheckDeviceFormat(iAdapter,DeviceType,TargetFormat,
												D3DUSAGE_DEPTHSTENCIL,D3DRTYPE_SURFACE,D3DFMT_D24X8)))
        {
            if (SUCCEEDED(m_lpD3d->CheckDepthStencilMatch(iAdapter,DeviceType,TargetFormat,TargetFormat, 
															D3DFMT_D24X8)))
            {
                *pDepthStencilFormat = D3DFMT_D24X8;
                return TRUE;
            }
        }
    }

    if (dwMinDepthBits<=24 && dwMinStencilBits<=8)
    {
        if (SUCCEEDED(m_lpD3d->CheckDeviceFormat(iAdapter,DeviceType,TargetFormat,
												D3DUSAGE_DEPTHSTENCIL,D3DRTYPE_SURFACE,D3DFMT_D24S8)))
        {
            if (SUCCEEDED(m_lpD3d->CheckDepthStencilMatch(iAdapter,DeviceType,
															TargetFormat,TargetFormat,D3DFMT_D24S8)))
            {
                *pDepthStencilFormat = D3DFMT_D24S8;
                return TRUE;
            }
        }
    }

    if (dwMinDepthBits<=24 && dwMinStencilBits<=4)
    {
        if (SUCCEEDED(m_lpD3d->CheckDeviceFormat(iAdapter,DeviceType,TargetFormat,D3DUSAGE_DEPTHSTENCIL,
													D3DRTYPE_SURFACE,D3DFMT_D24X4S4)))
        {
            if (SUCCEEDED(m_lpD3d->CheckDepthStencilMatch(iAdapter,DeviceType,TargetFormat,TargetFormat, 
															D3DFMT_D24X4S4)))
            {
                *pDepthStencilFormat = D3DFMT_D24X4S4;
                return TRUE;
            }
        }
    }

    if (dwMinDepthBits<=32 && dwMinStencilBits==0)
    {
        if (SUCCEEDED(m_lpD3d->CheckDeviceFormat(iAdapter,DeviceType,TargetFormat,
													D3DUSAGE_DEPTHSTENCIL,D3DRTYPE_SURFACE,D3DFMT_D32)))
        {
            if (SUCCEEDED(m_lpD3d->CheckDepthStencilMatch(iAdapter,DeviceType,TargetFormat,TargetFormat, 
															D3DFMT_D32)))
            {
                *pDepthStencilFormat = D3DFMT_D32;
                return TRUE;
            }
        }
    }
    return FALSE;
}

HRESULT NG3D::FindPreferDevice()
{
	UINT iAdapter	= m_CreateInfo.dwAdapter;
	UINT iWidth		= m_CreateInfo.dwWidth;
	UINT iHeight	= m_CreateInfo.dwHeight;
	UINT iFormat	= m_CreateInfo.dwMode;

	if (iAdapter >= m_dwNumAdapters)
		iAdapter	= 0;

	m_CreateInfo.dwAdapter	= iAdapter;

	NGADAPTERINFO*	pAdapter	= &m_AdaptersInfo[iAdapter];

	bool	bFoundMode		= FALSE;
	bool	bFoundFormat	= FALSE;
	UINT	iDefaultMode	= 0;
	for (UINT iMode=0;iMode < pAdapter->dwNumModes;iMode++)
	{
		if ((iWidth==pAdapter->modes[iMode].dwWidth)	&&
			(iHeight==pAdapter->modes[iMode].dwHeight))
		{
			if (!bFoundMode)
				iDefaultMode = iMode;

			bFoundMode = TRUE;

			switch (iFormat)
			{
				case 16:
					switch (pAdapter->modes[iMode].d3dFormat)
					{
						case D3DFMT_R5G6B5: 
						case D3DFMT_X1R5G5B5:
						case D3DFMT_A1R5G5B5:
							m_CreateInfo.dwMode	= iMode;
							bFoundFormat	= TRUE;
							break;
					}
					break;
				case 32:
					switch (pAdapter->modes[iMode].d3dFormat)
					{
						case D3DFMT_A8R8G8B8: 
						case D3DFMT_X8R8G8B8:
							m_CreateInfo.dwMode	= iMode;
							bFoundFormat	= TRUE;
							break;
					}
					break;
				default: m_CreateInfo.dwMode	= 0;
			}
		}
	}

	if (!bFoundMode)
		m_CreateInfo.dwMode	= 0;

	if (!bFoundFormat)
		m_CreateInfo.dwMode	= iDefaultMode;

	if (SUCCEEDED(m_lpD3d->CheckDeviceMultiSampleType(iAdapter,D3DDEVTYPE_HAL,
											pAdapter->d3ddmDesktop.Format,
											TRUE,D3DMULTISAMPLE_2_SAMPLES)))
		pAdapter->d3dWindowMultiSampleType	= D3DMULTISAMPLE_2_SAMPLES;
	else
		pAdapter->d3dWindowMultiSampleType	= D3DMULTISAMPLE_NONE;

	if (SUCCEEDED(m_lpD3d->CheckDeviceMultiSampleType(iAdapter,D3DDEVTYPE_HAL,
											pAdapter->modes[m_CreateInfo.dwMode].d3dFormat,
											FALSE,D3DMULTISAMPLE_2_SAMPLES)))
		pAdapter->d3dMultiSampleType	= D3DMULTISAMPLE_2_SAMPLES;
	else
		pAdapter->d3dMultiSampleType	= D3DMULTISAMPLE_NONE;

	return S_OK;
}

HRESULT NG3D::InitialDevice()
{

	HRESULT hr;	

	FindPreferDevice();
	NGADAPTERINFO*	pAdapterInfo	= &m_AdaptersInfo[m_CreateInfo.dwAdapter];
	NGDEVICEINFO*	pDeviceInfo		= &pAdapterInfo->devices;
	NGMODEINFO*		pModeInfo		= &pAdapterInfo->modes[m_CreateInfo.dwMode];
	m_pModeInfo						= &pAdapterInfo->modes[m_CreateInfo.dwMode];
	
	
	ZeroMemory(&m_d3dpp,sizeof(m_d3dpp));
	m_d3dpp.Windowed				= m_CreateInfo.bWindow;
	m_d3dpp.BackBufferCount			= m_CreateInfo.dwNumDepthBuffer;
	
	m_d3dpp.SwapEffect				= D3DSWAPEFFECT_DISCARD;
	m_d3dpp.EnableAutoDepthStencil	= m_CreateInfo.bUseDepthBuffer;
	m_d3dpp.AutoDepthStencilFormat	= pModeInfo->d3dStencilFormat;
	m_d3dpp.hDeviceWindow			= m_CreateInfo.hWnd;
	m_d3dpp.Flags					= D3DPRESENTFLAG_LOCKABLE_BACKBUFFER;

	if (!m_CreateInfo.bWindow)
	{
		// Fullscreen mode
		m_d3dpp.MultiSampleType	 = D3DMULTISAMPLE_NONE;//pAdapterInfo->d3dMultiSampleType;
		m_d3dpp.BackBufferWidth  = pModeInfo->dwWidth;
		m_d3dpp.BackBufferHeight = pModeInfo->dwHeight;
		m_d3dpp.BackBufferFormat = pModeInfo->d3dFormat;
	}
	else
	{
		m_d3dpp.MultiSampleType	 = D3DMULTISAMPLE_NONE;
		m_d3dpp.BackBufferWidth  = m_rcClient.right - m_rcClient.left;
		m_d3dpp.BackBufferHeight = m_rcClient.bottom - m_rcClient.top;
		m_d3dpp.BackBufferFormat = pAdapterInfo->d3ddmDesktop.Format;
	}


    if (FAILED(hr = m_lpD3d->CreateDevice(	m_dwAdapter,
											D3DDEVTYPE_HAL,
											m_CreateInfo.hWnd,
											D3DCREATE_SOFTWARE_VERTEXPROCESSING,
											//pModeInfo->dwBehavior,
											&m_d3dpp,
											&m_lpDevice)))
		return CheckError(hr,"Init device failed");
	
	m_lpDevice->GetDeviceCaps(&m_d3dCaps);
	m_dwBehavior	= pModeInfo->dwBehavior;

	m_lpDevice->GetBackBuffer(0,D3DBACKBUFFER_TYPE_MONO,&m_lpBackBuffer);
	m_lpBackBuffer->GetDesc(&m_d3dsdBackBuffer);
	m_lpBackBuffer->Release();
	
	// Set up the fullscreen cursor
	if (m_CreateInfo.bCursor&&!m_CreateInfo.bWindow)
	{
	    HCURSOR hCursor;
#ifdef _WIN64
        hCursor	= (HCURSOR)GetClassLongPtr(m_CreateInfo.hWnd,GCLP_HCURSOR);
#else
		hCursor = (HCURSOR)GetClassLong(m_CreateInfo.hWnd,GCL_HCURSOR);
#endif
        SetCursor(hCursor);
		m_lpDevice->ShowCursor(TRUE);
	}
	return S_OK;
}

HRESULT	NG3D::ResizeScene(RECT* pRect)
{
	HRESULT hr;

	m_d3dpp.BackBufferWidth	= pRect->right - pRect->left;
	m_d3dpp.BackBufferHeight= pRect->bottom - pRect->top;

    // Release all vidmem objects
    if (FAILED(hr = ClearResource()))
        return hr;

    // Reset the device
    if (FAILED(hr = m_lpDevice->Reset(&m_d3dpp)))
        return hr;

    // Store render target surface desc
    LPDIRECT3DSURFACE8 pBackBuffer;
    m_lpDevice->GetBackBuffer(0,D3DBACKBUFFER_TYPE_MONO,&pBackBuffer);
    pBackBuffer->GetDesc(&m_d3dsdBackBuffer);
    pBackBuffer->Release();

    // Set up the fullscreen cursor
	if (m_CreateInfo.bCursor&&!m_CreateInfo.bWindow)
	{
	    HCURSOR hCursor;
#ifdef _WIN64
        hCursor	= (HCURSOR)GetClassLongPtr(m_CreateInfo.hWnd,GCLP_HCURSOR);
#else
		hCursor = (HCURSOR)GetClassLong(m_CreateInfo.hWnd,GCL_HCURSOR);
#endif
        SetCursor(hCursor);
		m_lpDevice->ShowCursor(TRUE);
	}

    // Initialize the app's device-dependent objects
    hr = RestoreResource();
    if( FAILED(hr) )
        return hr;

    return S_OK;
}

HRESULT NG3D::InitialGraphics()
{

	if (NULL==(m_lpD3d = Direct3DCreate8(D3D_SDK_VERSION)))
		return E_FAIL;

	CheckError(CheckDevice(),"Check Device");
	CheckError(InitialDevice(),"Initial Device");

	return S_OK;
}

HRESULT NG3D::CreateGraphics(NGCREATEINFO* pCreateInfo)
{
	if (m_cGraphics)
		return E_FAIL;

	new NG3D(pCreateInfo);

	Graphics()->InitialGraphics();
	
	return S_OK;
}

// virtual function declare

HRESULT NG3D::ConfirmDevice(D3DCAPS8* d3dcaps,DWORD dwBehavior,D3DFORMAT d3dFormat)
{
	if( dwBehavior & D3DCREATE_HARDWARE_VERTEXPROCESSING )
        return E_FAIL;
	return S_OK;
}

HRESULT NG3D::ClearResource()
{
	return S_OK;
}

HRESULT NG3D::RestoreResource()
{
	return S_OK;
}

HRESULT NG3D::Render()
{
	return S_OK;
}

LPVOID	NG3D::CreateScene(LPVOID lpScene)
{
	return lpScene;
}


