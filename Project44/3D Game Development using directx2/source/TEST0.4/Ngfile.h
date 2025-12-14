#pragma warning(disable:4786)
#ifndef __NGFILE_H
#define __NGFILE_H

#include <windows.h>
#include <assert.h>
#include "ngmisc.h"

#include <queue>
#include <string>
#include <list>
#include <stack>

using namespace std;

class NGFILE
{
protected:
	FILE*			m_fp;
	std::string		m_filename;

public:

	NGFILE();
	~NGFILE();

	bool Create(const char* filename);
	bool Exists(const char* filename);
	bool Append(const char* filename);
	bool Open(const char* filename);
	bool Close();
	
	bool ReadBuff(void* pBuffer,int buffSize,int itemCount=1);
	bool WriteBuff(void* pBuffer,int buffSize,int itemCount=1);
	std::string ReadLine();
	bool TokenizeNextNCLine(std::queue< std::string >* pList, char commentChar = '#');

	template <class type>
	bool Read(type* data)
	{
		return ReadBuff(data, sizeof(type));
	}

	template <class type>
	bool Write(type& data)
	{
		return WriteBuff(&data, sizeof(type));
	}

	std::string	GetFilename() {return m_filename;};

	bool ReadString(string&);
};

#endif