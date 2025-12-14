#pragma warning(disable:4786)
#ifndef __NMUSIC_H
#define __NMUSIC_H


#include <dshow.h>
#include <malloc.h>
// using directshow to play music
#include <vector>
#include <string>

using namespace std;

class NMUSIC
{
private:
	HWND			m_hWnd;
	IGraphBuilder*	m_pGB;
	IMediaControl*	m_pMCtrl;
	IMediaSeeking*	m_pMSeek;
	IBaseFilter*	m_pNow;
	IBaseFilter*	m_pNext;
	vector<string>	m_PlayList;

public:
	~NMUSIC()
	{
		Clear();
	}

	HRESULT InitGraph();
	HRESULT	SwapSourceFilter(char*);
	VOID	Clear();

};



#endif
