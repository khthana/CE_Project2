/***********************************************************************
 *
 * PROJECT:     PreWap
 * FILE:        Parser.h
 *
 * DESCRIPTION: Parser.h contains the prototypes for general use functions.
 *
 **********************************************************************/

#ifndef PARSER_H
#define PARSER_H


/***********************************************************************
 *
 *   Internal Functions
 *
 ***********************************************************************/

 /***********************************************************************
 *
 * FUNCTION:    GetObjectPtr
 *
 * DESCRIPTION: This routine returns a pointer to an object in the current
 *              form.
 *
 * PARAMETERS:  formId - id of the form to display
 *
 * RETURNED:    MemPtr
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
MemPtr GetObjectPtr(UInt16 objectID);

Err ShowMessage(UInt16 ObjectID, Char* sMsg1, Char* sMsg2, Char* sMsg3);

/*Count for find the character that we want to cut out*/
UInt16 FindChar(Char key[200], Char c);

/*Cut Header space*/
UInt16 HSpace(Char ant[200]);

/*Cut Tail space*/
UInt16 TSpace(Char ant[200],UInt16 len);

/*Change EscapeCharacter to character*/
UInt16 ChangeEscape(Char* text,UInt16 s);

/*Check Tag*/
Int16 CheckTag(Char* Line, UInt8 state);

UInt16 WhatTag(Char* Line, UInt16 state);

Char MapTag(UInt16 n);

Int16 table(Char c,UInt16 j);

Char* extract(Int16 result,UInt16 i,Char stk[200]);

/*must always have tag wml and then card after header*/
Boolean CheckOrder(Int16 AllLine);

/*Clear space, enter, and tab*/
void CleanString(Char* text,UInt16 n);

/*Check Attribute*/
Int16 CheckAttr(Char* At);

/*Seperate attribute and value in tag*/		
void parseParms(Char at[200], UInt16 m);

/*Get state for each tag*/
UInt16 GetState(Char Tag[200], UInt16 lenstr);

/*seperate file out to tag*/
Int16 CutLine(Char* text);

//Cut brackets out and then check tag in them
void CutBracket(Int16 j);

//check header
Boolean CheckHeader();

void MainOKButtonFunc(MemHandle);

void MainClearButtonFunc();


#endif

/***********************************************************************
 *
 * END OF Parser.h
 *
 ***********************************************************************/


