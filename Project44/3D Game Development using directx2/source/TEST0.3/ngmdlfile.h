#pragma warning(disable:4786)
#ifndef __NGMDLFILE_H
#define __NGMDLFILE_H

#include "ngfile.h"
#include "ngframe.h"
#include "nganime.h"
#include "ngmodel.h"

#include <queue>
#include <string>
#include <list>
#include <stack>

using namespace std;

class NGMDLFILE
{
protected:
	// Attribute
	NGFILE		m_File;

	// Implementation
	DWORD		WriteFrame(NGFRAME*);
	DWORD		WriteAnime(NGANIME*);
	DWORD		ReadFrame(NGFRAME*);
	DWORD		ReadAnime(NGANIME*);

public:
	NGMDLFILE()	{};
	~NGMDLFILE(){};

	NGMODEL*	LoadFile(char*);
	DWORD		SaveFile(char*,NGMODEL*);
};

#endif