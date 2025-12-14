#include "stdafx.h"
#include "nmusic.h"

#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }

//------------------------------------------------------------------------------
// Name: GraphInit()
// Desc: Initialization of DirectShow components and initial graph
//------------------------------------------------------------------------------
HRESULT NMUSIC::InitGraph(void)
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

    // Get the IMediaSeeking Interface
    if (FAILED(m_pGB->QueryInterface(	IID_IMediaSeeking,
										reinterpret_cast<void **>(&m_pMSeek))))
        return hr;

    // Create Source Filter for first file
/*    g_iNextFile = 0;

    // Create the intial graph
    if (FAILED (SwapSourceFilter()))
        return hr;
*/
    return S_OK;
}

//------------------------------------------------------------------------------
// Name: AppCleanUp)
// Desc: Clean up the application
//------------------------------------------------------------------------------
VOID NMUSIC::Clear()
{
    // Stop playback
    if (m_pMCtrl)
        m_pMCtrl->Stop();

    // Release all remaining pointers
    SAFE_RELEASE(m_pNext);
    SAFE_RELEASE(m_pNow);
    SAFE_RELEASE(m_pMSeek);
    SAFE_RELEASE(m_pMCtrl);
    SAFE_RELEASE(m_pGB);

    // Clean up COM
    CoUninitialize();
    return;
}

//------------------------------------------------------------------------------
// Name: SwapSourceFilter()
// Desc: This routine is used to change the source file in the current graph.
//       First the graph is stopped, then the current source filter is removed.
//       The new source filter is added, the output pin on this filter is
//       rendered, and playback is restarted.
//
//       When this routine is called during initialization, there is no
//       currently running graph. In that case, Stop becomes a no-op. The source
//       filter is added to an empty graph. Then during the render call, all
//       necessary filters required to play this source are added to the graph.
//
//       On subsequent calls, Stopping the graph allows filters to be removed.
//       When the old source filter is removed, all other filters are still
//       left in the graph. The new source filter is added, and then the render
//       operation reconnects the graph. Since all of the necessary filters for
//       playback are already in the graph (if the two files have the same file
//       type), these filters are reused. Existing filters in the graph are
//       always used first, if possible, during a Render operation. This avoids
//       having to create new filter instances with each change.
//------------------------------------------------------------------------------
HRESULT NMUSIC::SwapSourceFilter(char* strTitle)
{
    HRESULT hr		= S_OK;
    IPin*	pPin	= NULL;
//    TCHAR szFilename[MAX_PATH];
    WCHAR wFileName[MAX_PATH];

    // Determine the file to load based on DirectX Media path (from SDK)
/*    _tcscpy( szFilename, DXUtil_GetDXSDKMediaPath() );
    _tcscat( szFilename, pstrFiles[g_iNextFile % g_iNumFiles]);
    _tcscpy( g_szCurrentFile, pstrFiles[g_iNextFile % g_iNumFiles]);
    g_iNextFile++;*/

    // Make sure that this file exists
    DWORD dwAttr = GetFileAttributes(strTitle);
    if (dwAttr == (DWORD)-1)
        return ERROR_FILE_NOT_FOUND;

    #ifndef UNICODE
        MultiByteToWideChar(CP_ACP, 0, strTitle, -1, wFileName, MAX_PATH);
    #else
        lstrcpy(wFileName, strTitle);
    #endif

    // OPTIMIZATION OPPORTUNITY
	// This will open the file, which is expensive. To optimize, this
    // should be done earlier, ideally as soon as we knew this was the
    // next file to ensure that the file load doesn't add to the
    // filter swapping time & cause a hiccup.
    //
    // Add the new source filter to the graph. (Graph can still be running)
    hr = m_pGB->AddSourceFilter(wFileName, wFileName, &m_pNext);

    // Get the first output pin of the new source filter. Audio sources 
    // typically have only one output pin, so for most audio cases finding 
    // any output pin is sufficient.
    if (SUCCEEDED(hr)) 
		hr = m_pNext->FindPin(L"Output", &pPin);  

    // Stop the graph
    if (SUCCEEDED(hr))
        hr = m_pMCtrl->Stop();

    // Break all connections on the filters. You can do this by adding 
    // and removing each filter in the graph
    if (SUCCEEDED(hr)) 
	{
        IEnumFilters*	pFilterEnum = NULL;
        IBaseFilter*	pFilterTemp = NULL;

        if (SUCCEEDED(hr = m_pGB->EnumFilters(&pFilterEnum))) 
		{
            int iFiltCount = 0;
            int iPos = 0;

            // Need to know how many filters. If we add/remove filters during the
            // enumeration we'll invalidate the enumerator
            while (S_OK == pFilterEnum->Skip(1)) 
                iFiltCount++;
            
			// Allocate space, then pull out all of the 
            IBaseFilter **ppFilters = reinterpret_cast<IBaseFilter**>
                                      (_alloca(sizeof(IBaseFilter*)* iFiltCount));
            pFilterEnum->Reset();

            while (S_OK == pFilterEnum->Next(1, &(ppFilters[iPos++]), NULL));
            SAFE_RELEASE(pFilterEnum);

            for (iPos = 0; iPos < iFiltCount; iPos++) {
                m_pGB->RemoveFilter(ppFilters[iPos]);
				// Put the filter back, unless it is the old source
				if (ppFilters[iPos] != m_pNow) {
					m_pGB->AddFilter(ppFilters[iPos], NULL);
                }
				SAFE_RELEASE(ppFilters[iPos]);
            }
        }
    }

    // We have the new ouput pin. Render it
    if (SUCCEEDED(hr)) {
        hr = m_pGB->Render(pPin);
        m_pNow = m_pNext;
        m_pNext = NULL;
    }

    SAFE_RELEASE(pPin);
    SAFE_RELEASE(m_pNext); // In case of errors

    // Re-seek the graph to the beginning
    if (SUCCEEDED(hr)) {
        LONGLONG llPos = 0;
        hr = m_pMSeek->SetPositions(&llPos, AM_SEEKING_AbsolutePositioning,
                                           &llPos, AM_SEEKING_NoPositioning);
    } 

    // Start the graph
    if (SUCCEEDED(hr)) {
        hr = m_pMCtrl->Run();
    }

    // Release the old source filter.
    SAFE_RELEASE(m_pNow)
    return S_OK;   
}


