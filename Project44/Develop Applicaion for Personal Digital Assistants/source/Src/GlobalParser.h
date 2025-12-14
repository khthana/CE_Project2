/***********************************************************************
 *
 * PROJECT:     PreWap	
 * FILE:        GlobalParser.h
 *
 * DESCRIPTION: GlobalParser.h contains the  Internal Structures and Global variable
 *				for the functions in Parser.c, which are used to present text 
 *              fields for inputing a URL and any POST data for that URL,
 *              then retrieve and display the response.
 *
 **********************************************************************/
 
#ifndef GLOBALPARSER_H
#define GLOBALPARSER_H


/***********************************************************************
//Parser.c -> Internal Structures and Global variable 
/***********************************************************************
 *
 *   Internal Structures
 *
 ***********************************************************************/
typedef struct
	{	UInt16 NoLine;
		Char* attr;
		Char* val;
	}Attrb;	

/***********************************************************************
 *
 *   Global variables
 *
 ***********************************************************************/
//static Boolean HideSecretRecords;
Char* Lines[100];
MemHandle fld[100], fldA[100], fldB[100];
UInt8 st[100];
Attrb TableAttr[100];
Int16 TotalAttr=0;

//End of Parser.c -> Internal Structures and Global variable 

#endif

/***********************************************************************
 *
 *   END GlobalParser.h
 *
 ***********************************************************************/