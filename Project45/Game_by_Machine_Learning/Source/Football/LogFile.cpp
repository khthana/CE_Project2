// LogFile.cpp: implementation of the CLogFile class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "LogFile.h"

#include <stdio.h>

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

#ifdef C_LOG

CLogFile g_cLog;

CLogFile::CLogFile()
{
	
}

CLogFile::~CLogFile()
{

}

void CLogFile::Write(const char * fmt, ...)
{
	char	Buffer[256];
	va_list	va;
	va_start(va, fmt);

	lstrcpy(Buffer, "");
	wvsprintf(&Buffer[lstrlen(Buffer)], fmt, va);
	AddDate(Buffer);
	lstrcat(Buffer, "\n");
	WriteInternal(Buffer);
}

void CLogFile::Clear()
{
	ClearFile();
}

void CLogFile::WriteInternal(const char *Buffer)
{
	FileWrite(Buffer);
}

void CLogFile::FileWrite(const char *buff)
{
	FILE *fp = fopen(CLOG_FILENAME, "a");
	ASSERT(fp!=NULL);

	fprintf(fp, buff);

	fclose(fp);
}

void CLogFile::ClearFile()
{
	DeleteFile(CLOG_FILENAME);
}

void CLogFile::AddDate(char *Buffer)
{
	char Buf[128];
	SYSTEMTIME	st;

	GetSystemTime(&st);
	sprintf(Buf," (%d-%d-%d::%d.%d)",st.wDay,st.wMonth,st.wYear,st.wHour,st.wMinute);
	strcat(Buffer,Buf);
}

#endif