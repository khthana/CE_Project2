/*
	window.h
	Header per l'ambiente Win32 (SDK/MFC).
	Grazie al disegno a cazzo di cane degli headers relativi, MFC non accetta l'inclusione del
	file <windows.h>, per cui deve ricavare il tipo di ambiente utilizzato ed includere quanto
	necessario.
	Luca Piergentili, 29/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _WINDOW_H
#define _WINDOW_H 1

#if defined(_WINDOWS)
	//#define _WIN95 1
	//#define _WIN98 1
	#define _WINNT 1

	#if defined(_WIN95) || defined(_WIN98) || defined(_WINNT)
	  #ifndef WIN32
	    #define WIN32
	  #endif
	  #ifndef _WIN32
	    #define _WIN32
	  #endif
	  #ifdef _WIN95
	    #pragma message("\t\t\tcompiling for _WIN95")
	  #endif
	  #ifdef _WIN98
	    #pragma message("\t\t\tcompiling for _WIN98")
	  #endif
	  #ifdef _WINNT
	    #pragma message("\t\t\tcompiling for _WINNT")
	  #endif
	#endif

	#if defined(_AFX) || defined(_AFXDLL)
		#ifdef WIN32_SDK
			#undef WIN32_SDK
		#endif
		#define WIN32_MFC 1
		#pragma message("\t\t\tWIN32_MFC defined")
		#include <afx.h>
		#include <afxwin.h>
		#include <afxext.h>
		#include <afxcmn.h>
		#include <afxdlgs.h>
		#include <afxmt.h>
		#include <afxole.h>
		#include <afxadv.h>
	#else
		#ifdef WIN32_MFC
			#undef WIN32_MFC
		#endif
		#define WIN32_SDK 1
		#pragma message("\t\t\tWIN32_SDK defined")
		#define STRICT 1
		#include <windows.h>
		#include <windowsx.h>
	#endif
	#include <shlobj.h>
#else
	#pragma message("\t\t\twarning: "__FILE__" included into a non-SDK/MFC environment")
#endif

#endif // _WINDOW_H
