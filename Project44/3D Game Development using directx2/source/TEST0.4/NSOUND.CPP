#include "stdafx.h"
#include "nsound.h"

//-----------------------------------------------------------------------------
// Name: OnInitDialog()
// Desc: Initializes the dialogs (sets up UI controls, etc.)
//-----------------------------------------------------------------------------
HRESULT NSOUND::Create(HWND hWnd)
{
    HRESULT hr;
	m_hWnd	= hWnd;

    // Load the icon
#ifdef _WIN64
    HINSTANCE hInst = (HINSTANCE) GetWindowLongPtr(hWnd, GWLP_HINSTANCE);
#else
    HINSTANCE hInst = (HINSTANCE) GetWindowLong(hWnd, GWL_HINSTANCE);
#endif

    // Create a static IDirectSound in the CSound class.  
    // Set coop level to DSSCL_PRIORITY, and set primary buffer 
    // format to stereo, 22kHz and 16-bit output.
    m_pSoundManager = new CSoundManager();

    if (FAILED(hr = m_pSoundManager->Initialize(hWnd, DSSCL_PRIORITY, 2, 22050, 16)))
    {
        // initialize error handle here
        return hr;
    }

	return S_OK;
}




//-----------------------------------------------------------------------------
// Name: OnOpenSoundFile()
// Desc: Called when the user requests to open a sound file
//-----------------------------------------------------------------------------
HRESULT NSOUND::LoadFile(char* strFileName) 
{
    HRESULT hr;

	// playing 
/*    if (m_pSound)
    {
        m_pSound->Stop();
        m_pSound->Reset();
    }*/

    // Free any previous sound, and make a new one
//    SAFE_DELETE(m_pSound);

	CSound*	sound;
    // Load the wave file into a DirectSound buffer
    if (FAILED(hr = m_pSoundManager->Create(&sound, strFileName, 0, GUID_NULL)))
    {
        // failed handle here
        return S_FALSE; 
    }

	m_pSound.push_back(sound);

	return S_OK;
}




//-----------------------------------------------------------------------------
// Name: OnPlaySound()
// Desc: User hit the "Play" button
//-----------------------------------------------------------------------------
HRESULT NSOUND::Play(BOOL bLooped) 
{
    HRESULT hr;

    DWORD dwFlags = bLooped ? DSBPLAY_LOOPING : 0L;
    if (FAILED(hr = m_pSound.back()->Play(0, dwFlags)))
        return hr;

    return S_OK;
}

HRESULT NSOUND::Pause()
{
/*	if (m_pSound)
		m_pSound->Stop();*/
	return S_OK;
}

HRESULT NSOUND::Stop()
{
/*	if (m_pSound)
	{
		m_pSound->Stop();
		m_pSound->Reset();
	}*/
	return S_OK;
}

VOID NSOUND::Clear()
{
	
}


