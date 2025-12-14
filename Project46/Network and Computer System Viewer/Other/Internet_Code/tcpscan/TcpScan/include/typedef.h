/*
	typedef.h
	Definizione dei tipi (CRT).
	Luca Piergentili, 27/07/93
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TYPEDEF_H
#define _TYPEDEF_H 1

/*
	_BOOL_TYPE
*/
#ifndef _BOOL_TYPE
	#ifdef _WINDOWS
		#include "window.h"
	#else
		typedef int BOOL;
		#define TRUE 1
		#define FALSE 0
	#endif
	#define _BOOL_TYPE 1
#endif

/*
	tipi specifici per Win32
*/
#ifndef _WINDOWS
	#ifdef WIN32
		#define VOID
		#define FAR
		#define NEAR
		#define PASCAL
		#define CDECL
	#else
		#define VOID			void
		#define FAR			far
		#define NEAR			near
		#define PASCAL			pascal
		#define CDECL			_cdecl
	#endif

	typedef unsigned char		BYTE;
	typedef unsigned short int	WORD;
	typedef unsigned long		DWORD;
	typedef unsigned int		UINT;
	typedef signed short		HWND;
	typedef signed long			HANDLE;
	#ifdef STRICT
		typedef signed long		LONG;
	#else
		#define LONG long
	#endif
	typedef char NEAR*			PSTR;
	typedef char NEAR*			NPSTR;
	typedef char FAR*			LPSTR;
	typedef const char FAR*		LPCSTR;
	typedef BYTE NEAR*			PBYTE;
	typedef BYTE FAR*			LPBYTE;
	typedef int NEAR*			PINT;
	typedef int FAR*			LPINT;
	typedef WORD NEAR*			PWORD;
	typedef WORD FAR*			LPWORD;
	typedef long NEAR*			PLONG;
	typedef long FAR*			LPLONG;
	typedef DWORD NEAR*			PDWORD;
	typedef DWORD FAR*			LPDWORD;
	typedef void FAR*			LPVOID;

	#define LOBYTE(w)			((BYTE)(w))
	#define HIBYTE(w)			((BYTE)(((UINT)(w) >> 8) & 0xff))
	#define LOWORD(l)			((WORD)(DWORD)(l))
	#define HIWORD(l)			((WORD)((((DWORD)(l)) >> 16) & 0xffff))
	#define MAKELONG(l,h)		((LONG)(((WORD)(l)) | (((DWORD)((WORD)(h))) << 16)))
	#define MAKELP(sel,off)		((void FAR*)MAKELONG((off),(sel)))
	#define SELECTOROF(lp)		HIWORD(lp)
	#define OFFSETOF(lp)		LOWORD(lp)
#endif /* _WINDOWS */

/*
	valori massimi per Win32
*/
#define BYTE_MAX				0xff
#define WORD_MAX				0xffff
#define DWORD_MAX				0xffffffff
#define DWORD_INVALID_VALUE		DWORD_MAX

/*
	FPCALLBACK
	tipo per il puntatore a funzione per le callback
*/
#ifndef _FPCALLBACK_TYPE
	#define _FPCALLBACK_TYPE 1
	typedef UINT (*FPCALLBACK)(LPVOID,LPVOID);
#endif // _FPCALLBACK_TYPE

#endif /* _TYPEDEF_H */
