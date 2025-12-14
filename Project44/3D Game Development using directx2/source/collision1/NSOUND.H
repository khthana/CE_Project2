#ifndef __NSOUND_H
#define __NSOUND_H

#include "dsutil.h"
#include <vector>

using namespace std;

class NSOUND
{
private:
	HWND			m_hWnd;
	CSoundManager*	m_pSoundManager;
	vector<CSound*>	m_pSound;		


public:

	HRESULT	Create(HWND);
	HRESULT LoadFile(char*);
	HRESULT Play(BOOL);
	HRESULT Pause();
	HRESULT Stop();
	VOID	Clear();
};


#endif