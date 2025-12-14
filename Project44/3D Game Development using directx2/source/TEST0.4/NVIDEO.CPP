#include "stdafx.h"
#include "nvideo.h"

#define RELEASE(i) {if (i) i->Release(); i = NULL;}

HRESULT NVIDEO::InitGraph(HWND hWnd)
{
	HRESULT hr;

    // Initialize COM
    if (FAILED(hr = CoInitialize(NULL)))
        return hr;

    // Create DirectShow Graph
    if (FAILED(hr = CoCreateInstance(	CLSID_FilterGraph, NULL,
										CLSCTX_INPROC, IID_IGraphBuilder,
										reinterpret_cast<void **>(&m_pGB))))
        return hr;

    // Get the IMediaControl Interface
    if (FAILED(m_pGB->QueryInterface(	IID_IMediaControl,
										reinterpret_cast<void **>(&m_pMCtrl))))
        return hr;

	// Get the IVideoWindow Interface
	if (FAILED(m_pGB->QueryInterface(	IID_IVideoWindow,
										reinterpret_cast<void **>(&m_pWnd))))
        return hr;

	// Get the IMediaEventEx
	if (FAILED(m_pGB->QueryInterface(	IID_IMediaEventEx,
										reinterpret_cast<void **>(&m_pMEvent))))
        return hr;

	return S_OK;
}

HRESULT NVIDEO::PlayMedia(char* strFile)
{
    HRESULT	hr	= S_OK;
    WCHAR	wFile[MAX_PATH];

#ifndef UNICODE
    MultiByteToWideChar(CP_ACP, 0, strFile, -1, wFile, MAX_PATH);
#else
    lstrcpy(wFile, szFile);
#endif

    // Allow DirectShow to create the FilterGraph for this media file
    if (FAILED(hr = m_pGB->RenderFile(wFile, NULL))) 
		return hr;


    // Set the message drain of the video window to point to our hidden
    // application window.  This allows keyboard input to be transferred
    // to our main window for processing.
    //
    // If this is an audio-only or MIDI file, then put_MessageDrain will fail.
    //
    ;
    if (FAILED(hr = m_pWnd->put_MessageDrain((OAHWND)m_hWnd)))
		return hr;

    // Set fullscreen
    if (FAILED(hr = SetFullScreen())) 
        return hr;

    // Display first frame of the movie
    
    if (FAILED(hr = m_pMCtrl->Pause())) 
        return hr;

    // Start playback
    if (FAILED(hr = m_pMCtrl->Run())) 
        return hr;

    return hr;
}

HRESULT NVIDEO::SetFullScreen()
{
    HRESULT hr=S_OK;
    LONG lMode;

    if (!m_pWnd)
        return S_FALSE;

    // Read current state
    if (FAILED(hr = m_pWnd->get_FullScreenMode(&lMode)))
		return hr;

    if (lMode == 0)  /* OAFALSE */
    {
        // Save current message drain
        if (FAILED(hr = m_pWnd->get_MessageDrain((OAHWND *)&m_hDrain)))
			return hr;

        // Set message drain to application main window
        if (FAILED(hr = m_pWnd->put_MessageDrain((OAHWND)m_hWnd)))
			return hr;

        // Switch to full-screen mode
        lMode = -1;  /* OATRUE */
		if (FAILED(hr = m_pWnd->put_FullScreenMode(lMode)))
			return hr;
    }

    return hr;
}

VOID NVIDEO::Clear()
{
    // Release the DirectShow interfaces
    RELEASE(m_pGB);
    RELEASE(m_pMCtrl);
    RELEASE(m_pWnd);
    RELEASE(m_pMEvent);

    CoUninitialize();
}