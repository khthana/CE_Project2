#include "CMedia.h"

CMManager::CMManager()
{
	t_pPlayer = NULL;
	MediaTable.clear();
}

HRESULT CMManager::init()
{
	CoInitialize(NULL);
	return S_OK;
}

void CMManager::cleanup()
{
	if (t_pPlayer != NULL)
		t_pPlayer->close();
	MediaTable.clear();
}

CMVideo::CMVideo()
{
	m_pGraphBuilder = NULL;
	m_pController = NULL;
	m_pSeeker= NULL;
	m_pAudio= NULL;
	m_pVideo= NULL;
	m_pWindow= NULL;
}

HRESULT CMVideo::open(TCHAR* filename,HWND const hwnd)
{
	HRESULT hr;
	if FAILED(hr = CoCreateInstance(CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER, 
                    IID_IGraphBuilder, (void **)&m_pGraphBuilder))
					return E_FAIL;
	WCHAR wstrFilename[MAX_PATH];
	MultiByteToWideChar( CP_ACP, 0, filename, -1, 
                         wstrFilename, MAX_PATH );
	
    hr = m_pGraphBuilder->RenderFile(wstrFilename, NULL);
	if (FAILED(hr = m_pGraphBuilder->QueryInterface(IID_IMediaControl, (void **)&m_pController)))
	{
		close();
		return E_FAIL;
	};

	if (FAILED(hr = m_pGraphBuilder->QueryInterface(IID_IMediaSeeking, (void **)&m_pSeeker)))
	{
		close();
		return E_FAIL;
	};

	GUID t_format = TIME_FORMAT_MEDIA_TIME;
	if (m_pSeeker->IsFormatSupported(&t_format) != S_OK) 
	{
		close();
		return E_FAIL;
	};
	m_pSeeker->SetTimeFormat(&t_format);

    if (FAILED(hr = m_pGraphBuilder->QueryInterface(IID_IVideoWindow, (void **)&m_pWindow)))
	{
		close();
		return E_FAIL;
	};
	if (FAILED(hr = m_pWindow->put_Owner((OAHWND)hwnd)))
	{
		close();
		return E_FAIL;
	};
	
    if (FAILED(hr = m_pGraphBuilder->QueryInterface(IID_IBasicVideo, (void **)&m_pVideo)))
	{
		close();
		return E_FAIL;
	};

    hr = m_pGraphBuilder->QueryInterface(IID_IBasicAudio, (void **)&m_pAudio);
	return S_OK;
}

void CMVideo::close()
{
	if (m_pController != NULL) 
	{
		m_pController->Stop();
		m_pController->Release();
	}
	if (m_pSeeker != NULL) m_pSeeker->Release();
	if (m_pAudio != NULL) m_pAudio->Release();
	if (m_pVideo != NULL) m_pVideo->Release();
	if (m_pWindow != NULL) 
	{
		m_pWindow->put_Owner (NULL);
		m_pWindow->Release();
	}
	if (m_pGraphBuilder != NULL) m_pGraphBuilder->Release();
}

HRESULT CMVideoPlayer::play()
{
	HRESULT hr;
	if (m_pController == NULL) return E_FAIL;
	if (FAILED(hr = m_pController->Run())) return E_FAIL;
	else return S_OK;
}

HRESULT CMVideoPlayer::stop()
{
	HRESULT hr;
	if (m_pController == NULL) return E_FAIL;
	if (FAILED(hr = m_pController->Stop())) return E_FAIL;
	else return S_OK;
}

HRESULT CMVideoPlayer::pause()
{
	HRESULT hr;
	if (m_pController == NULL) return E_FAIL;
	if (FAILED(hr = m_pController->Pause())) return E_FAIL;
	else return S_OK;
}

BOOL CMVideoPlayer::isPlay()
{
	HRESULT hr;
	if (m_pController == NULL) return FALSE;
	LONG state;
	if (FAILED(hr = m_pController->GetState(INFINITE,&state))) return FALSE;
	if (state == State_Running) return TRUE;
	else return FALSE;
}

BOOL CMVideoPlayer::isStop()
{
	HRESULT hr;
	if (m_pController == NULL) return FALSE;
	LONG state;
	if (FAILED(hr = m_pController->GetState(INFINITE,&state))) return FALSE;
	if (state == State_Stopped) return TRUE;
	else return FALSE;
}

BOOL CMVideoPlayer::isPause()
{
	HRESULT hr;
	if (m_pController == NULL) return FALSE;
	LONG state;
	if (FAILED(hr = m_pController->GetState(INFINITE,&state))) return FALSE;
	if (state == State_Paused) return TRUE;
	else return FALSE;
}

HRESULT CMVideo::getCurrentPosition(LONGLONG& pos)
{
	HRESULT hr;
	LONGLONG t_pos;
	if (m_pSeeker == NULL) return E_FAIL;
	if (FAILED(hr = m_pSeeker->GetCurrentPosition(&t_pos))) return E_FAIL;
	pos = t_pos;
	return S_OK;
}

HRESULT CMVideo::setPostion(LONGLONG const curpos,LONGLONG const endpos)
{
	HRESULT hr;
	LONGLONG c_pos = curpos;
	LONGLONG e_pos = endpos;
	if (m_pSeeker == NULL) return E_FAIL;
	if (FAILED(hr = m_pSeeker->SetPositions(&c_pos,AM_SEEKING_NoPositioning,&e_pos,AM_SEEKING_NoPositioning))) 
		return E_FAIL;
	return S_OK;
}

HRESULT CMVideo::getStopPosition(LONGLONG& pos)
{
	HRESULT hr;
	LONGLONG t_pos;
	if (m_pSeeker == NULL) return E_FAIL;
	if (FAILED(hr = m_pSeeker->GetStopPosition(&t_pos))) return E_FAIL;
	pos = t_pos;
	return S_OK;
}

HRESULT CMVideo::getFileVideoSize(LONG& width,LONG& height)
{
	HRESULT hr;
	LONG t_width;
	LONG t_height;
	if (m_pVideo == NULL) return E_FAIL;
	if (FAILED(hr = m_pVideo->GetVideoSize(&t_width,&t_height))) return E_FAIL;
	return S_OK;
}

HRESULT CMVideoPlayer::FullScreen(HWND ghApp)
{
	HRESULT hr;
    LONG lMode;
    static HWND hDrain=0;

	if (m_pWindow == NULL) return E_FAIL;
    if (FAILED(hr = m_pWindow->get_FullScreenMode(&lMode))) return E_FAIL;

    if (lMode == OAFALSE)
    {
        if (FAILED(hr = m_pWindow->get_MessageDrain((OAHWND *) &hDrain))) return E_FAIL;
        if (FAILED(hr =m_pWindow->put_MessageDrain((OAHWND) ghApp))) return E_FAIL;       
        lMode = OATRUE;
        if (FAILED(hr = m_pWindow->put_FullScreenMode(lMode))) return E_FAIL;;
		return S_OK;
    }
	return E_FAIL;
}
//	HRESULT WindowScreen();

//HRESULT CMVideo::setPlayRate(TCHAR* name,double rate)
//{
//
//}

