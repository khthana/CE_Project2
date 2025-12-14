#pragma warning(disable:4786)
#ifndef __NVIDEO_H
#define __NVIDEO_H

#include <dshow.h>
// use directshow to play video

class NVIDEO
{
private:
	HWND	m_hWnd;
	HWND	m_hDrain;
	
	IGraphBuilder*	m_pGB;
	IMediaControl*	m_pMCtrl;
	IMediaSeeking*	m_pMSeek;
	IMediaEventEx*	m_pMEvent;
	IVideoWindow*	m_pWnd;

	HRESULT SetFullScreen();

public:

	~NVIDEO()
	{
		Clear();
	}

	HRESULT InitGraph(HWND hWnd);
	HRESULT	PlayMedia(char*);
	VOID	Clear();
};

#endif
