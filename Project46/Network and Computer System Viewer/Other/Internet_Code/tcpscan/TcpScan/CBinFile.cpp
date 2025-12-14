/*
	CBinFile.cpp
	Classe base per files binari (SDK).
	Luca Piergentili, 31/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "strcpyn.h"
#include "window.h"
#include "CBinFile.h"

/*
	CBinFile()
*/
CBinFile::CBinFile()
{
	m_bShowErrors = FALSE;
	m_hHandle = INVALID_HANDLE_VALUE;
	m_dwError = 0L;
	memset(m_szError,'\0',sizeof(m_szError));
}

/*
	~CBinFile()
*/
CBinFile::~CBinFile()
{
	CBinFile::Close();
}

/*
	Open()
*/
BOOL CBinFile::Open(LPCSTR lpcszFileName,BOOL bCreateIfNotExist/*=TRUE*/,DWORD dwAccessMode/*=GENERIC_READ|GENERIC_WRITE*/,DWORD dwShareMode/*=FILE_SHARE*/)
{
	BOOL bOpen = FALSE;

	if(m_hHandle==INVALID_HANDLE_VALUE)
	{
		strcpyn(m_szFileName,lpcszFileName,sizeof(m_szFileName));
		
		if((m_hHandle = ::CreateFile(lpcszFileName,dwAccessMode,dwShareMode,NULL,bCreateIfNotExist ? OPEN_ALWAYS : OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL))==INVALID_HANDLE_VALUE)
			SetLastErrorCode(::GetLastError());
		else
			bOpen = TRUE;
	}

	return(bOpen);
}

/*
	Create()
*/
BOOL CBinFile::Create(LPCSTR lpcszFileName,DWORD dwAccessMode/*=GENERIC_READ|GENERIC_WRITE*/,DWORD dwShareMode/*=FILE_SHARE*/,DWORD dwAttribute/*=FILE_ATTRIBUTE_NORMAL*/)
{
	BOOL bCreated = FALSE;

	if(m_hHandle==INVALID_HANDLE_VALUE)
	{
		strcpyn(m_szFileName,lpcszFileName,sizeof(m_szFileName));

		if((m_hHandle = ::CreateFile(lpcszFileName,dwAccessMode,dwShareMode,NULL,CREATE_ALWAYS,dwAttribute,NULL))==INVALID_HANDLE_VALUE)
			SetLastErrorCode(::GetLastError());
		else
			bCreated = TRUE;
	}

	return(bCreated);
}

/*
	Read()
*/
DWORD CBinFile::Read(LPVOID lpBuffer,DWORD dwToRead)
{
	DWORD dw = 0L;

	if(m_hHandle!=INVALID_HANDLE_VALUE)
	{
		if(!::ReadFile(m_hHandle,lpBuffer,dwToRead,&dw,NULL))
		{
			dw = FILE_EOF;
			SetLastErrorCode(::GetLastError());
		}
	}

	return(dw);
}

/*
	Write()
*/
DWORD CBinFile::Write(LPCVOID lpcBuffer,DWORD dwToWrite)
{
	DWORD dw = 0L;

	if(m_hHandle!=INVALID_HANDLE_VALUE)
	{
		if(!::WriteFile(m_hHandle,lpcBuffer,dwToWrite,&dw,NULL))
		{
			dw = FILE_EOF;
			SetLastErrorCode(::GetLastError());
		}
	}

	return(dw);
}

/*
	Seek()
*/
DWORD CBinFile::Seek(LONG lOffset,DWORD dwOrigin)
{
	DWORD dwOffset = FILE_EOF;

	if(m_hHandle!=INVALID_HANDLE_VALUE)
	{
		if((dwOffset = ::SetFilePointer(m_hHandle,lOffset,NULL,dwOrigin))==0xFFFFFFFF)
			SetLastErrorCode(::GetLastError());
	}

	return(dwOffset);
}

/*
	Close()
*/
BOOL CBinFile::Close(void)
{
	BOOL flag = FALSE;

	if(m_hHandle!=INVALID_HANDLE_VALUE)
	{
		if(::CloseHandle(m_hHandle))
		{
			flag = TRUE;
			m_hHandle = INVALID_HANDLE_VALUE;
		}
		else
			SetLastErrorCode(::GetLastError());
	}

	return(flag);
}

/*
	SetLastErrorCode()
*/
void CBinFile::SetLastErrorCode(DWORD error)
{
	m_dwError = error;
	memset(m_szError,'\0',sizeof(m_szError));

	::FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,
				NULL,
				m_dwError,
				MAKELANGID(LANG_NEUTRAL,SUBLANG_SYS_DEFAULT),
				(LPSTR)m_szError,
				sizeof(m_szError)-1,
				NULL 
				);

	if(m_bShowErrors)
	{
		char szError[512];
		_snprintf(szError,sizeof(szError)-1,"%s:\n%s",m_szFileName,m_szError);
		::MessageBox(NULL,szError,"CBinFile",MB_ICONERROR|MB_SETFOREGROUND|MB_TOPMOST);
	}
}
