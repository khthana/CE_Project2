/*
	env.h
	Definizione delle macro per l'ambiente (da includere solo nei .c/.cpp).
	Luca Piergentili, 22/01/93
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _ENV_H
#define _ENV_H 1

#ifndef _MSC_VER
  #pragma message("\t\t\terror: _MSC_VER not defined")
  #error unsupported compiler
#endif

#ifdef __cplusplus
  #pragma message("\t\t\tC++ compile mode")
#else
  #pragma message("\t\t\tC compile mode")
#endif

/*
	_CONSOLE
*/
#ifndef _CONSOLE
  #pragma message("\t\t\t_CONSOLE not defined")
#else
  #pragma message("\t\t\t_CONSOLE defined")
#endif

/*
	WIN32/_WIN32
*/
#ifdef WIN32
  #ifndef _WIN32
    #define _WIN32
  #endif
#endif

#ifdef _WIN32
  #ifndef WIN32
    #define WIN32
  #endif
#endif

#ifndef _WIN32
  #pragma message("\t\t\t_WIN32 not defined")
#else
  #pragma message("\t\t\t_WIN32 defined")
#endif

/*
	_WINDOWS
*/
#ifndef _WINDOWS
  #pragma message("\t\t\t_WINDOWS not defined")
#else
  #pragma message("\t\t\t_WINDOWS defined")
#endif

/*
	MFC
*/
#if defined(_AFX) || defined(_AFXDLL)
  #pragma message("\t\t\tMFC defined")
#endif

#endif /* _ENV_H */
