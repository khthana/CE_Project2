#pragma warning(disable:4786)
#ifndef __NGMDLFILE_H
#define __NGMDLFILE_H

#include "ngfile.h"
#include "ngframe.h"
#include "ngmtrl.h"
#include "nganime.h"
#include "ngmodel.h"
#include "ngmisc.h"
#include "ngcollision.h"

#include <queue>
#include <string>
#include <list>
#include <stack>

;using namespace std;
/*
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
*/

class NGMD2File
{
private:
	NGFILE		m_file;

	NGFRAME*	ReadFrame();
	NGANIME*	ReadAnime();
	NGMTRLS*	ReadMtrl();
	NGCOLLIDE*	ReadCollide();

public:
	NGMD2File();
	~NGMD2File();

	NGModel*	LoadMD2(string);
};

#endif