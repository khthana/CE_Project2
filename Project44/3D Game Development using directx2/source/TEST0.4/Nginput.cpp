#include "stdafx.h"
#include "nginput.h"

static LPDIRECTINPUTDEVICE8	g_pJS	= NULL;


BOOL CALLBACK EnumAxesCallback( const DIDEVICEOBJECTINSTANCE* pdidoi,
                                VOID* pContext )
{
    HWND hDlg = (HWND)pContext;

    DIPROPRANGE diprg; 
    diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
    diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
    diprg.diph.dwHow        = DIPH_BYID; 
    diprg.diph.dwObj        = pdidoi->dwType; // Specify the enumerated axis
    diprg.lMin              = -1000; 
    diprg.lMax              = +1000; 
    
	// Set the range for the axis
	if (FAILED(g_pJS->SetProperty(DIPROP_RANGE, &diprg.diph)))
		return DIENUM_STOP;

    return DIENUM_CONTINUE;
}

BOOL CALLBACK EnumJoysticksCallback( const DIDEVICEINSTANCE* pdidInstance,
                                     VOID* pContext)
{
    HRESULT hr;

	LPDIRECTINPUT8       pDI	= (LPDIRECTINPUT8)pContext;         
    // Obtain an interface to the enumerated joystick.
    hr = pDI->CreateDevice(	pdidInstance->guidInstance, &g_pJS, NULL);

    // If it failed, then we can't use this joystick. (Maybe the user unplugged
    // it while we were in the middle of enumerating it.)
    if (FAILED(hr)) 
        return DIENUM_CONTINUE;

    // Stop enumeration. Note: we're just taking the first joystick we get. You
    // could store all the enumerated joysticks and let the user pick.
    return DIENUM_STOP;
}


HRESULT NINPUT::CreateInput(HWND hWnd)
{
	InitialInput(hWnd);

	return S_OK;
}

NINPUT::NINPUT()
{
	m_pDI		= NULL;
	m_pKB		= NULL;
	m_pMouse	= NULL;
}

NINPUT::~NINPUT()
{

}

HRESULT NINPUT::InitialInput(HWND hWnd)
{
	if (hWnd==NULL)
		return S_FALSE;

	m_hWnd	= hWnd;

#ifdef _WIN64
    HINSTANCE hInst = (HINSTANCE) GetWindowLongPtr(m_hWnd, GWLP_HINSTANCE);
#else
    HINSTANCE hInst = (HINSTANCE) GetWindowLong(m_hWnd, GWL_HINSTANCE);
#endif

	// Create a DInput object
	HRESULT	hr;
    if (FAILED(hr = DirectInput8Create(	GetModuleHandle(NULL), 
										DIRECTINPUT_VERSION,
										IID_IDirectInput8, 
										(VOID**)&m_pDI, NULL)))
        return hr;

	return S_OK;
}

HRESULT NINPUT::CreateKeyboard(BOOL bExclusive, BOOL bForeground, BOOL bWinKey)
{
	DWORD	dwFlags;
	HRESULT	hr;

	if (m_pDI==NULL)
		return E_FAIL;

	if (bExclusive)
        dwFlags		= DISCL_EXCLUSIVE;
    else
        dwFlags		= DISCL_NONEXCLUSIVE;

    if (bForeground)
        dwFlags		|= DISCL_FOREGROUND;
    else
        dwFlags		|= DISCL_BACKGROUND;

    // Disabling the windows key is only allowed only if we are in foreground nonexclusive
    if (bWinKey && !bExclusive && bForeground)
        dwFlags		|= DISCL_NOWINKEY;
    
    // Obtain an interface to the system keyboard device.
    if (FAILED(hr = m_pDI->CreateDevice(GUID_SysKeyboard, &m_pKB, NULL)))
        return hr;
    
    // Predefine of keyboard data format is array of byte 256 entry
    if (FAILED(hr = m_pKB->SetDataFormat(&c_dfDIKeyboard)))
        return hr;

    // Setcooperative level of operation
    hr = m_pKB->SetCooperativeLevel(m_hWnd, dwFlags);
    if (hr == DIERR_UNSUPPORTED && !bForeground && bExclusive)
    {
        //FreeDirectInput();
        return E_FAIL;
    }

    if (FAILED(hr))
        return hr;
/*
    if( !m_bImmediate )
    {
        // Default buffer is 0 so we must specific new value
        DIPROPDWORD dipdw;

        dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
        dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
        dipdw.diph.dwObj        = 0;
        dipdw.diph.dwHow        = DIPH_DEVICE;
        dipdw.dwData            = NIKB_BUFFERSIZE; // Arbitary buffer size

        if (FAILED(hr = m_pKB->SetProperty(DIPROP_BUFFERSIZE, &dipdw.diph)))
            return hr;
    }
*/
    // Acquire the newly created device
    m_pKB->Acquire();
	return S_OK;
}

HRESULT	NINPUT::CreateMouse(BOOL bExclusive, BOOL bForeground)
{
	DWORD	dwFlags;
	HRESULT hr;

	if (bExclusive)
        dwFlags = DISCL_EXCLUSIVE;
    else
        dwFlags = DISCL_NONEXCLUSIVE;

    if (bForeground)
        dwFlags |= DISCL_FOREGROUND;
    else
        dwFlags |= DISCL_BACKGROUND;
   
    // Obtain an interface to the system mouse device.
    if (FAILED(hr = m_pDI->CreateDevice(GUID_SysMouse, &m_pMouse, NULL)))
        return hr;
    
    // Predefine data format
    if (FAILED(hr = m_pMouse->SetDataFormat(&c_dfDIMouse2)))
        return hr;
    
    // Setcooprative level
    hr = m_pMouse->SetCooperativeLevel(m_hWnd, dwFlags);
    if (hr == DIERR_UNSUPPORTED && !bForeground && bExclusive)
    {
        //FreeDirectInput();
        return E_FAIL;
    }

    if (FAILED(hr))
        return hr;
/*
    if (!m_bImmediate)
    {
        // Setup buffer size
        DIPROPDWORD dipdw;
        dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
        dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
        dipdw.diph.dwObj        = 0;
        dipdw.diph.dwHow        = DIPH_DEVICE;
        dipdw.dwData            = NIMOUSE_BUFFERSIZE; // Arbitary buffer size

        if (FAILED(hr = m_pMouse->SetProperty(DIPROP_BUFFERSIZE, &dipdw.diph)))
            return hr;
    }
*/
    // Acquire the newly created device
    m_pMouse->Acquire();
	return S_OK;
}

HRESULT NINPUT::CreateJoystick()
{
	HRESULT	hr;
	// Look for a simple joystick we can use for this sample program.
    if (FAILED(hr = m_pDI->EnumDevices(	DI8DEVCLASS_GAMECTRL, 
										EnumJoysticksCallback,
                                        m_pDI, DIEDFL_ATTACHEDONLY)))
        return hr;

	m_pJS	= g_pJS;
    // Make sure we got a joystick
    if (NULL == m_pJS)
    {
		// Not found joystick handle here
		return S_OK;
    }

    // Set the data format to "simple joystick" - a predefined data format 
    //
    // A data format specifies which controls on a device we are interested in,
    // and how they should be reported. This tells DInput that we will be
    // passing a DIJOYSTATE2 structure to IDirectInputDevice::GetDeviceState().
    if (FAILED(hr = m_pJS->SetDataFormat(&c_dfDIJoystick2)))
        return hr;

    // Set the cooperative level to let DInput know how this device should
    // interact with the system and with other DInput applications.
    if (FAILED(hr = m_pJS->SetCooperativeLevel(	m_hWnd, DISCL_EXCLUSIVE|
														DISCL_FOREGROUND)))
        return hr;

    // Enumerate the axes of the joyctick and set the range of each axis. Note:
    // we could just use the defaults, but we're just trying to show an example
    // of enumerating device objects (axes, buttons, etc.).
    if (FAILED(hr = m_pJS->EnumObjects(	EnumAxesCallback, (VOID*)m_hWnd, DIDFT_AXIS)))
        return hr;

	return S_OK;
}

HRESULT	NINPUT::Pool()
{
	HRESULT hr;

    if (NULL == m_pKB) 
        return S_OK;
    
    ZeroMemory(&m_diks, sizeof(m_diks));
    hr = m_pKB->GetDeviceState(sizeof(m_diks), &m_diks);
    if (FAILED(hr)) 
    {
        // DI not have any lost device check so retry if we can
		hr = m_pKB->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pKB->Acquire();

        return S_OK; 
    }

    if (NULL == m_pMouse) 
        return S_OK;
    
    ZeroMemory(&m_dims2, sizeof(m_dims2));
    hr = m_pMouse->GetDeviceState(sizeof(DIMOUSESTATE2), &m_dims2);
    if (FAILED(hr)) 
    {
        // If input is lost then acquire and keep trying 
		hr = m_pMouse->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pMouse->Acquire();

        if (hr == DIERR_OTHERAPPHASPRIO || 
            hr == DIERR_NOTACQUIRED) 
		{
            // Unacquired handle here
		}

        return S_OK; 
    }  

    if (NULL == m_pJS) 
        return S_OK;

    // Poll the device to read the current state
    if (FAILED(hr = m_pJS->Poll()))  
    {
        // DInput is telling us that the input stream has been
        // interrupted. We aren't tracking any state between polls, so
        // we don't have any special reset that needs to be done. We
        // just re-acquire and try again.
        hr = m_pJS->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pJS->Acquire();

        // hr may be DIERR_OTHERAPPHASPRIO or other errors.  This
        // may occur when the app is minimized or in the process of 
        // switching, so just try again later 
        return S_OK; 
    }

    // Get the input's device state
    if (FAILED(hr = m_pJS->GetDeviceState(sizeof(DIJOYSTATE2), &m_dijs2)))
        return hr; // The device should have been acquired during the Poll()

    return S_OK;
}



/*
HRESULT NIKEYBOARD::CreateDevice(HWND hWnd)
{
	HRESULT hr;

	m_hWnd = hWnd;

#ifdef _WIN64
    HINSTANCE hInst = (HINSTANCE) GetWindowLongPtr(m_hWnd, GWLP_HINSTANCE);
#else
    HINSTANCE hInst = (HINSTANCE) GetWindowLong(m_hWnd, GWL_HINSTANCE);
#endif

    if (m_bExclusive)
        m_Flags		= DISCL_EXCLUSIVE;
    else
        m_Flags		= DISCL_NONEXCLUSIVE;

    if (m_bForeground)
        m_Flags		|= DISCL_FOREGROUND;
    else
        m_Flags		|= DISCL_BACKGROUND;

    // Disabling the windows key is only allowed only if we are in foreground nonexclusive
    if (m_bWinKey && !m_bExclusive && m_bForeground)
        m_Flags		|= DISCL_NOWINKEY;

    // Create a DInput object
    if (FAILED(hr = DirectInput8Create(	GetModuleHandle(NULL), 
										DIRECTINPUT_VERSION,
										IID_IDirectInput8, 
										(VOID**)&m_pDI, NULL)))
        return hr;
    
    // Obtain an interface to the system keyboard device.
    if (FAILED(hr = m_pDI->CreateDevice(GUID_SysKeyboard, &m_pKB, NULL)))
        return hr;
    
    // Predefine of keyboard data format is array of byte 256 entry
    if (FAILED(hr = m_pKB->SetDataFormat(&c_dfDIKeyboard)))
        return hr;

    // Setcooperative level of operation
    hr = m_pKB->SetCooperativeLevel(m_hWnd, m_Flags);
    if (hr == DIERR_UNSUPPORTED && !m_bForeground && m_bExclusive)
    {
        FreeDirectInput();
        return S_OK;
    }

    if (FAILED(hr))
        return hr;

    if( !m_bImmediate )
    {
        // Default buffer is 0 so we must specific new value
        DIPROPDWORD dipdw;

        dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
        dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
        dipdw.diph.dwObj        = 0;
        dipdw.diph.dwHow        = DIPH_DEVICE;
        dipdw.dwData            = NIKB_BUFFERSIZE; // Arbitary buffer size

        if (FAILED(hr = m_pKB->SetProperty(DIPROP_BUFFERSIZE, &dipdw.diph)))
            return hr;
    }

    // Acquire the newly created device
    m_pKB->Acquire();

    return S_OK;
}

//-----------------------------------------------------------------------------
// Name: ReadImmediateData()
// Desc: Read the input device's state when in immediate mode and display it.
//-----------------------------------------------------------------------------
HRESULT NIKEYBOARD::ReadImmediateData()
{
    HRESULT hr;

    if (NULL == m_pKB) 
        return S_OK;
    
    ZeroMemory(&m_diks, sizeof(m_diks));
    hr = m_pKB->GetDeviceState(sizeof(m_diks), &m_diks);
    if (FAILED(hr)) 
    {
        // DI not have any lost device check so retry if we can
        hr = m_pKB->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pKB->Acquire();

        return S_OK; 
    }

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: ReadBufferedData()
// Desc: Read the input device's state when in buffered mode and display it.
//-----------------------------------------------------------------------------
HRESULT NIKEYBOARD::ReadBufferedData()
{
    DWORD              dwElements;
    HRESULT            hr;

    if (NULL == m_pKB) 
        return S_OK;
    
    dwElements = NIKB_BUFFERSIZE;
    hr = m_pKB->GetDeviceData(	sizeof(DIDEVICEOBJECTDATA),
								m_didod, &dwElements, 0);
    if (hr != DI_OK) 
    {
		// buffer data must carefully with DIBUFFEROVERFLOW
		// if this happen we will lost new data (not old)
        hr = m_pKB->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pKB->Acquire();

        if ( hr == DIERR_OTHERAPPHASPRIO || 
             hr == DIERR_NOTACQUIRED ) 
		{
			// Unacquired handle here
		}

        return S_OK; 
    }

    if (FAILED(hr))  
        return hr;

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: FreeDirectInput()
// Desc: Initialize the DirectInput variables.
//-----------------------------------------------------------------------------
VOID NIKEYBOARD::FreeDirectInput()
{
    if (m_pKB) 
        m_pKB->Unacquire();
    
	m_pKB->Release();
	m_pDI->Release();
}

LPVOID NIKEYBOARD::GetInput(BOOL buffer)
{
	if (buffer)
		return m_didod;
	return m_diks;
}

//-----------------------------------------------------------------------------
// Name: EnumJoysticksCallback()
// Desc: Called once for each enumerated joystick. If we find one, create a
//       device interface on it so we can play with it.
//-----------------------------------------------------------------------------


static LPDIRECTINPUTDEVICE8	g_pJS	= NULL;


//-----------------------------------------------------------------------------
// Name: EnumAxesCallback()
// Desc: Callback function for enumerating the axes on a joystick
//-----------------------------------------------------------------------------
BOOL CALLBACK EnumAxesCallback( const DIDEVICEOBJECTINSTANCE* pdidoi,
                                VOID* pContext )
{
    HWND hDlg = (HWND)pContext;

    DIPROPRANGE diprg; 
    diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
    diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
    diprg.diph.dwHow        = DIPH_BYID; 
    diprg.diph.dwObj        = pdidoi->dwType; // Specify the enumerated axis
    diprg.lMin              = -1000; 
    diprg.lMax              = +1000; 
    
	// Set the range for the axis
	if (FAILED(g_pJS->SetProperty(DIPROP_RANGE, &diprg.diph)))
		return DIENUM_STOP;

    return DIENUM_CONTINUE;
}

BOOL CALLBACK EnumJoysticksCallback( const DIDEVICEINSTANCE* pdidInstance,
                                     VOID* pContext)
{
    HRESULT hr;

	LPDIRECTINPUT8       pDI	= (LPDIRECTINPUT8)pContext;         
    // Obtain an interface to the enumerated joystick.
    hr = pDI->CreateDevice(	pdidInstance->guidInstance, &g_pJS, NULL);

    // If it failed, then we can't use this joystick. (Maybe the user unplugged
    // it while we were in the middle of enumerating it.)
    if (FAILED(hr)) 
        return DIENUM_CONTINUE;

    // Stop enumeration. Note: we're just taking the first joystick we get. You
    // could store all the enumerated joysticks and let the user pick.
    return DIENUM_STOP;
}

//-----------------------------------------------------------------------------
// Name: InitDirectInput()
// Desc: Initialize the DirectInput variables.
//-----------------------------------------------------------------------------
HRESULT NIJOYSTICK::CreateDevice(HWND hWnd)
{


    HRESULT hr;

	m_hWnd	= hWnd;

    // Register with the DirectInput subsystem and get a pointer
    // to a IDirectInput interface we can use.
    // Create a DInput object
    if (FAILED(hr = DirectInput8Create(	GetModuleHandle(NULL), 
										DIRECTINPUT_VERSION,
										IID_IDirectInput8, 
										(VOID**)&m_pDI, NULL)))
        return hr;

    // Look for a simple joystick we can use for this sample program.
    if (FAILED(hr = m_pDI->EnumDevices(	DI8DEVCLASS_GAMECTRL, 
										EnumJoysticksCallback,
                                        m_pDI, DIEDFL_ATTACHEDONLY)))
        return hr;

	m_pJS	= g_pJS;
    // Make sure we got a joystick
    if (NULL == m_pJS)
    {
		// Not found joystick handle here
		return S_OK;
    }

    // Set the data format to "simple joystick" - a predefined data format 
    //
    // A data format specifies which controls on a device we are interested in,
    // and how they should be reported. This tells DInput that we will be
    // passing a DIJOYSTATE2 structure to IDirectInputDevice::GetDeviceState().
    if (FAILED(hr = m_pJS->SetDataFormat(&c_dfDIJoystick2)))
        return hr;

    // Set the cooperative level to let DInput know how this device should
    // interact with the system and with other DInput applications.
    if (FAILED(hr = m_pJS->SetCooperativeLevel(	m_hWnd, DISCL_EXCLUSIVE|
														DISCL_FOREGROUND)))
        return hr;

    // Determine how many axis the joystick has (so we don't error out setting
    // properties for unavailable axis)
    m_diCaps.dwSize	= sizeof(DIDEVCAPS);
    if (FAILED(hr = m_pJS->GetCapabilities(&m_diCaps)))
        return hr;

    // Enumerate the axes of the joyctick and set the range of each axis. Note:
    // we could just use the defaults, but we're just trying to show an example
    // of enumerating device objects (axes, buttons, etc.).
    if (FAILED(hr = m_pJS->EnumObjects(	EnumAxesCallback, (VOID*)m_hWnd, DIDFT_AXIS)))
        return hr;

    return S_OK;
}



//-----------------------------------------------------------------------------
// Name: UpdateInputState()
// Desc: Get the input device's state and display it.
//-----------------------------------------------------------------------------
HRESULT NIJOYSTICK::Pool()
{
    HRESULT     hr;
    

    if (NULL == m_pJS) 
        return S_OK;

    // Poll the device to read the current state
    if (FAILED(hr = m_pJS->Poll()))  
    {
        // DInput is telling us that the input stream has been
        // interrupted. We aren't tracking any state between polls, so
        // we don't have any special reset that needs to be done. We
        // just re-acquire and try again.
        hr = m_pJS->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pJS->Acquire();

        // hr may be DIERR_OTHERAPPHASPRIO or other errors.  This
        // may occur when the app is minimized or in the process of 
        // switching, so just try again later 
        return S_OK; 
    }

    // Get the input's device state
    if (FAILED(hr = m_pJS->GetDeviceState(sizeof(DIJOYSTATE2), &m_dijs2)))
        return hr; // The device should have been acquired during the Poll()

    return S_OK;
}

LPVOID	NIJOYSTICK::GetInput(BOOL)
{
	return &m_dijs2;
}


//-----------------------------------------------------------------------------
// Name: FreeDirectInput()
// Desc: Initialize the DirectInput variables.
//-----------------------------------------------------------------------------
VOID NIJOYSTICK::Clear()
{
    // Unacquire the device one last time just in case 
    // the app tried to exit while the device is still acquired.
    if (m_pJS) 
        m_pJS->Unacquire();
    
    // Release any DirectInput objects.
    m_pJS->Release();
    m_pDI->Release();
}


HRESULT NIMOUSE::CreateDevice(HWND hWnd)
{
    HRESULT hr;

	m_hWnd	= hWnd;

	if (m_bExclusive)
        m_Flags = DISCL_EXCLUSIVE;
    else
        m_Flags = DISCL_NONEXCLUSIVE;

    if (m_bForeground)
        m_Flags |= DISCL_FOREGROUND;
    else
        m_Flags |= DISCL_BACKGROUND;

    // Create a DInput object
    if (FAILED(hr = DirectInput8Create(	GetModuleHandle(NULL), DIRECTINPUT_VERSION, 
                                        IID_IDirectInput8, (VOID**)&m_pDI, NULL)))
        return hr;
    
    // Obtain an interface to the system mouse device.
    if (FAILED(hr = m_pDI->CreateDevice(GUID_SysMouse, &m_pMouse, NULL)))
        return hr;
    
    // Predefine data format
    if (FAILED(hr = m_pMouse->SetDataFormat(&c_dfDIMouse2)))
        return hr;
    
    // Setcooprative level
    hr = m_pMouse->SetCooperativeLevel(m_hWnd, m_Flags);
    if (hr == DIERR_UNSUPPORTED && !m_bForeground && m_bExclusive)
    {
        FreeDirectInput();
        // Unsupported handle here
        return S_OK;
    }

    if (FAILED(hr))
        return hr;

    if (!m_bImmediate)
    {
        // Setup buffer size
        DIPROPDWORD dipdw;
        dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
        dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
        dipdw.diph.dwObj        = 0;
        dipdw.diph.dwHow        = DIPH_DEVICE;
        dipdw.dwData            = NIMOUSE_BUFFERSIZE; // Arbitary buffer size

        if (FAILED(hr = m_pMouse->SetProperty(DIPROP_BUFFERSIZE, &dipdw.diph)))
            return hr;
    }

    // Acquire the newly created device
    m_pMouse->Acquire();

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: ReadImmediateData()
// Desc: Read the input device's state when in immediate mode and display it.
//-----------------------------------------------------------------------------
HRESULT NIMOUSE::ReadImmediateData()
{
    HRESULT       hr;

    if (NULL == m_pMouse) 
        return S_OK;
    
    ZeroMemory(&m_dims2, sizeof(m_dims2));
    hr = m_pMouse->GetDeviceState(sizeof(DIMOUSESTATE2), &m_dims2);
    if (FAILED(hr)) 
    {
        // If input is lost then acquire and keep trying 
        hr = m_pMouse->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pMouse->Acquire();

        if (hr == DIERR_OTHERAPPHASPRIO || 
            hr == DIERR_NOTACQUIRED) 
		{
            // Unacquired handle here
		}

        return S_OK; 
    }
    
    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: ReadBufferedData()
// Desc: Read the input device's state when in buffered mode and display it.
//-----------------------------------------------------------------------------
HRESULT NIMOUSE::ReadBufferedData()
{
    DWORD              dwElements;
    HRESULT            hr;

    if (NULL == m_pMouse) 
        return S_OK;
    
    dwElements = NIMOUSE_BUFFERSIZE;
    hr = m_pMouse->GetDeviceData(	sizeof(DIDEVICEOBJECTDATA),
                                    m_didod, &dwElements, 0);
    if (hr != DI_OK) 
    {
        hr = m_pMouse->Acquire();
        while (hr == DIERR_INPUTLOST) 
            hr = m_pMouse->Acquire();

        if (hr == DIERR_OTHERAPPHASPRIO || 
            hr == DIERR_NOTACQUIRED ) 
		{
			// Unacquired handle here
		}

        return S_OK; 
    }

    if( FAILED(hr) )  
        return hr;

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: FreeDirectInput()
// Desc: Initialize the DirectInput variables.
//-----------------------------------------------------------------------------
VOID NIMOUSE::FreeDirectInput()
{
    if (m_pMouse) 
        m_pMouse->Unacquire();
    
    m_pMouse->Release();
	m_pDI->Release();
}

LPVOID NIMOUSE::GetInput(BOOL buffer)
{
	if (buffer)
		return m_didod;
	return &m_dims2;
}

*/


