/***********************************************************************
 *
 * PROJECT:     PreWap
 * FILE:        Display.h
 *
 * DESCRIPTION: Display.h contains the prototypes for general use functions.
 *
 **********************************************************************/

#ifndef GLOBALDISPLAY_H
#define GLOBALDISPLAY_H


typedef struct
	{
		UInt16 NCo;
		UInt16 NCc;
	}page;

/***********************************************************************
 *
 *   Global variables
 *
 ***********************************************************************/

UInt16 v=0,count=0,templateStk[10],NumF=0;
page pageCard[20];
Int16 EndNumF,Nevent=-1;
FormPtr dynaFrm[100];
Boolean prev=false;

//initial button's id and form's id
#define MainButton					1700
#define TemButton					1800
#define FrmFirst					2000

#endif

/***********************************************************************
 *
 * END OF GlobalDisplay.h
 *
 ***********************************************************************/


