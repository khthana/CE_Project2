#pragma warning(disable:4786)
#ifndef __NGTEXFILE_H
#define __NGTEXFILE_H

#include "ngfile.h"
#include "ngtexture.h"

#include <queue>
#include <string>

using namespace std;

class NGTX2File
{
private:
	NGFILE		m_file;

	NGIMAGE*	ReadImage();
	NGDATA2D*	ReadData2d();

public:
	NGTX2File(){};
	~NGTX2File(){};

	BOOL	LoadTX2(string, NGRes2d*);
};

#endif