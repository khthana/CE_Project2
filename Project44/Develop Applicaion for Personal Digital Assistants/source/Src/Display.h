/***********************************************************************
 *
 * PROJECT:     PreWap
 * FILE:        Display.h
 *
 * DESCRIPTION: Display.h contains the prototypes for general use functions.
 *
 **********************************************************************/

#ifndef DISPLAY_H
#define DISPLAY_H


/***********************************************************************
 *
 *   Internal Functions
 *
 ***********************************************************************/
Char* CheckAndPrepareUrl(Char* oldUrl);
 
static UInt16 WhatAttr(Char* at);

//TableAttr[i].val and TableAttr[i].NoLine are globals from parser
void FindWAP(UInt16 id);

FontID GetFont(UInt16 fnt);

UInt16 GetAlign(Char align,UInt16 len,Char* text);

void CreateButton(Char* label,UInt16 templa,UInt16 Cc,UInt16 y);

void CreateButton2(Char* label,UInt16 templa,UInt16 Cc,UInt16 y);

Char GetP(UInt16 Co);

void GetGo(UInt16 Co);

UInt16 GetA(UInt16 Co,UInt16 y,Char align);

UInt16 GetImage(UInt16 Co,UInt16 y,Char align);

void GetDo(UInt16 Co,UInt16 templa,UInt16 Cc,UInt16 y);

void DrawPage(UInt16 Co,UInt16 Cc);

UInt16 GetA2(UInt16 Co,UInt16 y,Char align);

UInt16 GetImage2(UInt16 Co,UInt16 y,Char align);

void GetDo2(UInt16 Co,UInt16 templa,UInt16 Cc,UInt16 y);

void DrawPage2(UInt16 Co,UInt16 Cc);

void MainButtonFunc();

void OpenPage();


#endif

/***********************************************************************
 *
 * END OF Display.h
 *
 ***********************************************************************/


