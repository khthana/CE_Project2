/***=========================================================================
====                                                                     ====
====                          D C U t i l i t y                          ====
====                                                                     ====
=============================================================================
====                                                                     ====
====    File name           :  Snaper Helper.h                           ====
====    Project name        :  Windows Snaper                            ====
====    Project number      :  ---                                       ====
====    Creation date       :  28/11/2002                                ====
====    Author(s)           :  Dany Cantin                               ====
====                                                                     ====
====                  Copyright © DCUtility  2003                        ====
====                                                                     ====
=============================================================================
===========================================================================*/
#ifndef SNAPERHELPER_H_
#define SNAPERHELPER_H_

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef __cplusplus
    extern "C" {
#endif // __cplusplus

#ifdef SNAPERHELPER_EXPORT
    #define SNAPERHELPER_API __declspec(dllexport)
#else
    #define SNAPERHELPER_API __declspec(dllimport)
#endif

SNAPERHELPER_API BOOL BeginKeyboardHook(HWND hWnd);
SNAPERHELPER_API BOOL EndKeyboardHook(HWND hWnd);
SNAPERHELPER_API BOOL BeginMouseHook(HWND hWnd);
SNAPERHELPER_API BOOL EndMouseHook(HWND hWnd);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // SNAPERHELPER_H_