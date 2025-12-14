/*
	CTextFile.h
	Classe derivata per interfaccia file testo (SDK).
	Luca Piergentili, 06/07/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CTEXTFILE_H
#define _CTEXTFILE_H 1

#include "window.h"
#include "CBinFile.h"

class CTextFile : public CBinFile
{
public:
	CTextFile() : CBinFile() {}
	virtual ~CTextFile() {}

	void		GoTop			(void) {CBinFile::Seek(0L,FILE_BEGIN);}
	void		GoBottom			(void) {CBinFile::Seek(0L,FILE_END);}
	DWORD	ReadLine			(LPSTR lpBuffer,DWORD dwToRead);
	DWORD	WriteLine			(LPCSTR lpcBuffer,DWORD dwToWrite = (DWORD)-1);
	DWORD	WriteFormattedLine	(LPSTR fmt,...);
};

#endif // _CTEXTFILE
