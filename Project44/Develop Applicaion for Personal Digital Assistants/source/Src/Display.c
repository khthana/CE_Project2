/******************************************************************************
 *
 * Copyright (c) 1999 Palm Computing, Inc. or its subsidiaries.
 * All rights reserved.
 *
 * File: Starter.c
 *
 *****************************************************************************/

#include <PalmOS.h>
#include <StringMgr.h>
#include <SysEvtMgr.h>

#include "Parser.h"
#include "PrewapRsc.h"
#include "PreWAP.h"
#include "Display.h"
/***********************************************************************
 *
 *   Internal Structures
 *
 ***********************************************************************/

typedef struct
	{
		UInt16 NCo;
		UInt16 NCc;
	}page;

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

UInt16 v=0,count=0,count2=0,templateStk[10],NumF=0,NumF2=0;
page pageCard[20];
Int16 EndNumF;
FormPtr dynaFrm[30];
Boolean prev=false;
FormPtr UpDownForm[30];

UInt16 CoGlobal[30];
UInt16 CcGlobal[30];
UInt16 YGlobal[30];
UInt16 CoStatic[30];
UInt16 CcStatic[30];
UInt16 YGlobal2[30];


/*UInt16 CoGlobal;
UInt16 CcGlobal;
UInt16 YGlobal;
UInt16 CoStatic;
UInt16 CcStatic;
UInt16 YGlobal2;*/
Int16  Nevent=-1;

//initial button's id and form's id
#define MainButton					1900
#define TemButton					1800
#define FrmFirst					2000
#define FrmFirst2                   5000
#define UpButton					8800
#define	DownButton					8900

#define BLACK_UP_ARROW		"\x01"
#define BLACK_DOWN_ARROW	"\x02"
#define GRAY_UP_ARROW		"\x03"
#define GRAY_DOWN_ARROW		"\x04"

extern Char* 		Lines[100];
extern MemHandle 	fld[100];
extern MemHandle 	fldA[100];
extern MemHandle 	fldB[100];
extern UInt8 		st[100];
extern Attrb 		TableAttr[100];
extern Int16 		TotalAttr;
extern Char			preUrl[40];
extern Char         urlRefresh[40];
extern Boolean      newPage;

/***********************************************************************
 *
 *   Internal Functions
 *
 ***********************************************************************/
Char* CheckAndPrepareUrl(Char* oldUrl)
{
	Char*	newUrl;
	UInt16  lenOldUrl;
	UInt16  lenPreUrl;
	Int16  	i = 0;
	Int16	j = 0;
			

	lenOldUrl = StrLen(oldUrl);
	lenPreUrl = StrLen(preUrl);

	if ((StrNCompare(preUrl, "http://", 7) != 0) && (StrNCompare(oldUrl, "http://", 7) == 0))
	{
		for (i = (lenPreUrl-1) ; i >= 0 ; i--)
			preUrl[i+7] = preUrl[i];
		preUrl[lenPreUrl+7] = '\0';
		preUrl[6] = '/';
		preUrl[5] = '/';
		preUrl[4] = ':';
		preUrl[3] = 'p';
		preUrl[2] = 't';
		preUrl[1] = 't';
		preUrl[0] = 'h';
	}
	
	lenPreUrl = StrLen(preUrl);
	newUrl =  MemPtrNew(sizeof(Char) * (lenOldUrl + lenPreUrl));
	if (StrNCompare(oldUrl, preUrl, lenPreUrl) != 0)
	{
		for (i = 0; i < lenPreUrl ; i++ )
			newUrl[i] = preUrl[i];
		--i;
		for (i = lenPreUrl; i < (lenPreUrl+lenOldUrl) ; i++)
		{
			newUrl[i] = oldUrl[j];
			++j;
		}
		newUrl[i] = '\0';	
	}
	else
	{
		for (i=0; i < lenOldUrl; i++)
			newUrl[i] = oldUrl[i];
		newUrl[i] = '\0';
	}
	return newUrl;
}

UInt16 WhatAttr(Char* at)
{
	UInt16 i,n;
	Int16 flag;	
	Char* Attrib[] = {"id"     ,"title" ,"newcontext","href" ,"columns" ,"type" ,"src"   ,"label"  ,"align" ,"mode",
						"alt"    ,"name"  ,"maxlength" ,"value","multiple","iname","ivalue","emptyok","format","method",
						"ontimer","onpick","onenterforward","onenterbackward","height","width","vspace","hspace"};
	for(i=0;i<=27;i++)
	{
		flag = StrCompare(Attrib[i],at);
		if (flag==0)
		{
			n = i;
			break;
		}
	}
	return n;		
}


//static Boolean MainFormHandleEvent(EventPtr eventP);

//TableAttr[i].val and TableAttr[i].NoLine are globals from parser
void FindWAP(UInt16 id)
{  
	Char* 		IDC;
	MemHandle 	dd;
	UInt16 		ll,i=0;
	Char* 		urlNext;
	
	
	dd = MemHandleNew(16);
	IDC = MemHandleLock(dd);
	StrIToA(IDC,id);
	//ShowMessage(DisplayAlert," ", " ", IDC);
	
	ll = id-MainButton-1;
	while(TableAttr[i].NoLine!=ll)
		i++;
	//ShowMessage(DisplayAlert,"href=", " ", TableAttr[i].val);
	urlNext = MemPtrNew(sizeof(char) * (StrLen(TableAttr[i].val) + StrLen(preUrl)+7));
	urlNext = CheckAndPrepareUrl(TableAttr[i].val);
	
	//Keep present URL in URLRefresh for Reload
	for (i = 0; i < StrLen(urlNext) ; i++ )
		urlRefresh[i] = urlNext[i];
	urlRefresh[i] = '\0';
    CutUrl();
    //FrmEraseForm(dynaFrm[NumF]);
    //FrmEraseForm(UpDownForm[NumF2]);
	URLStart(urlNext);
	MemHandleUnlock(dd);
}

FontID GetFont(UInt16 fnt)
{
	switch(fnt)
	{	
		case 1: return stdFont; break;
		case 2: return boldFont; break;
		case 3: return largeFont; break;
		default: return stdFont; break;
	}
}

UInt16 GetAlign(Char align,UInt16 len,Char* text)
{
	UInt16 x,txtwidth;
	
	txtwidth = FntCharsWidth(text,len);    // get width of string
	switch(align)
	{	
		case 'l': x = 0; break;
		case 'r': x = 160-txtwidth; break;
		case 'c': x = (160-(txtwidth))/2; break;
		default: x = 0; break;
	}
	return x;
}

void CreateButton(Char* label,UInt16 templa,UInt16 Cc,UInt16 y)
{
	ControlPtr Button1,Button2;
	
	if((Cc*10)<=160)
	{
		if(templa==0)
			Button1 = CtlNewControl ((void**)&dynaFrm[NumF], MainButton, buttonCtl,label, 9, 139, 36,12, stdFont, 1,false);
		else
			Button2 = CtlNewControl ((void**)&dynaFrm[NumF], TemButton, buttonCtl,label, 100, 139, 36,12, stdFont, 1,false);
	}
	else
	{
		if(templa==0)
			Button1 = CtlNewControl ((void**)&dynaFrm[NumF], MainButton, buttonCtl,label, 9, y, 36,12, stdFont, 1,false);
		else
			Button2 = CtlNewControl ((void**)&dynaFrm[NumF], TemButton, buttonCtl,label, 100, y, 36,12, stdFont, 1,false);
	}
}

void CreateButton2(Char* label,UInt16 templa,UInt16 Cc,UInt16 y)
{
	ControlPtr Button1,Button2;
	
	if((Cc*10)<=160)
	{
		if(templa==0)	
			Button1 = CtlNewControl ((void**)&UpDownForm[NumF2], MainButton, buttonCtl,label, 9, 139, 36,12, stdFont, 1,false);
		else
			Button2 = CtlNewControl ((void**)&UpDownForm[NumF2], TemButton, buttonCtl,label, 100, 139, 36,12, stdFont, 1,false);
	}
	else
	{
		if(templa==0)	
			Button1 = CtlNewControl ((void**)&UpDownForm[NumF2], MainButton, buttonCtl,label, 9, y, 36,12, stdFont, 1,false);
		else
			Button2 = CtlNewControl ((void**)&UpDownForm[NumF2], TemButton, buttonCtl,label, 100, y, 36,12, stdFont, 1,false);
	}
}

//TableAttr[i].val and TableAttr[i].NoLine,TableAttr[i].attr, and TotalAttr are global from parser
Char GetP(UInt16 Co)
{
	UInt16 n,i,at;
	Int16 flag;
	Char align='l';
	
	for(i=0;i<TotalAttr;i++)
	{							
		if(TableAttr[i].NoLine==Co)
		{							
			n = i;
			break;
		}
	}
	while(TableAttr[n].NoLine==Co)
	{
		at = WhatAttr(TableAttr[n].attr);
		if(at==8)	//align	
		{						
			flag = StrCompare(TableAttr[n].val,"left");
			if(flag==0)								
				align = 'l';
			else
			{
				flag = StrCompare(TableAttr[n].val,"right");
				if(flag==0)
					align = 'r';
				else
				{
					flag = StrCompare(TableAttr[n].val,"center");
					if(flag==0)								
						align = 'c';
					//else error
				}
			}
		}
		n++;
	}
	return align;
}

//Lines[],TotalAttr,TableAttr[i].val,TableAttr[i].NoLine and TableAttr[i].attr are globals from parser
void GetGo(UInt16 Co)
{
	UInt16 i,n,at,len;
	Int16 flag;
	Char letter;
	Char* href;
	MemHandle hrf;
		
	for(i=0;i<TotalAttr;i++)
	{
		if(TableAttr[i].NoLine==Co)
		{						
			n = i;
			break;
		}
	}
	while(TableAttr[n].NoLine==Co)
	{
		at = WhatAttr(TableAttr[n].attr);
		if(at==3)	//href
		{	
			len = StrLen(TableAttr[n].val);
			hrf = MemHandleNew(len*4);		
			href = MemHandleLock(hrf);
			StrNCopy(href,TableAttr[n].val,1);
			letter = *href;
			if(letter=='#')
			{
				StrCopy(href,TableAttr[n].val+1);
			    i = n;
				do
				{
					i++;
					flag = StrCompare(TableAttr[i].val,href);							
				} while((flag!=0) && (i<TotalAttr));
				if(i>=TotalAttr)
				{
					//error
				}
				else
				{
					pageCard[NumF].NCo = TableAttr[i].NoLine;						
					n = pageCard[NumF].NCo+1;						
					do
					{
						flag = StrCompare(Lines[n],"card");
						n++;												
					} while(flag!=0);
					pageCard[NumF].NCc = n-1;
				}
			}
		}
		//else error
		n++;
	}
	MemHandleUnlock(hrf);
}

//Lines[Co] from parser
UInt16 GetA(UInt16 Co,UInt16 y,Char align)
{	
	UInt16 len,txtwidth;
	ControlPtr link;
	
	Co++;	
	if(st[Co]==0)
	{
		len = StrLen(Lines[Co]);
		txtwidth = FntCharsWidth(Lines[Co],len);
		link = CtlNewControl ((void**)&dynaFrm[NumF], MainButton+Co, buttonCtl,Lines[Co], GetAlign(align,len,Lines[Co]), y, txtwidth,10, stdFont, 1,false);
		link->attr.frame = noButtonFrame;
	}
	Co++;
	return Co;
}

UInt16 GetA2(UInt16 Co,UInt16 y,Char align)
{	
	UInt16 len,txtwidth;
	ControlPtr link;
	
	Co++;	
	if(st[Co]==0)
	{
		len = StrLen(Lines[Co]);
		txtwidth = FntCharsWidth(Lines[Co],len);
		link = CtlNewControl ((void**)&UpDownForm[NumF2], MainButton+Co, buttonCtl,Lines[Co], GetAlign(align,len,Lines[Co]), y, txtwidth,10, stdFont, 1,false);
		link->attr.frame = noButtonFrame;
	}
	Co++;
	return Co;
}


//TotalAttr,TableAttr[i].val,TableAttr[i].NoLine and TableAttr[i].attr are globals from parser
UInt16 GetImage(UInt16 Co,UInt16 y,Char align)
{
	UInt16 i,n,at,len;
	
	for(i=0;i<TotalAttr;i++)
	{
		if(TableAttr[i].NoLine==Co)
		{						
			n = i;
			break;
		}
	}
	while(TableAttr[n].NoLine==Co)
	{
		at = WhatAttr(TableAttr[n].attr);
		if(at==6)	//src
		{
		}
		else if(at==10)	//alt
		{	
			len = StrLen(TableAttr[n].val);
			FrmNewLabel (&dynaFrm[NumF], FrmFirst+count+Co, TableAttr[n].val, GetAlign(align,len,TableAttr[n].val), y, largeBoldFont);
		}
		n++;
	}
	return y+6;
}

UInt16 GetImage2(UInt16 Co,UInt16 y,Char align)
{
	UInt16 i,n,at,len;
	
	for(i=0;i<TotalAttr;i++)
	{
		if(TableAttr[i].NoLine==Co)
		{						
			n = i;
			break;
		}
	}
	while(TableAttr[n].NoLine==Co)
	{
		at = WhatAttr(TableAttr[n].attr);
		if(at==6)	//src
		{
		}
		else if(at==10)	//alt
		{	
			len = StrLen(TableAttr[n].val);
			FrmNewLabel (&UpDownForm[NumF2], FrmFirst+count+Co, TableAttr[n].val, GetAlign(align,len,TableAttr[n].val), y, largeBoldFont);
		}
		n++;
	}
	return y+6;
}


//TotalAttr,TableAttr[i].val,TableAttr[i].NoLine and TableAttr[i].attr are globals from parser
void GetDo(UInt16 Co,UInt16 templa,UInt16 Cc, UInt16 y)
{
	UInt16 i,n,at;
	Int16 flag;
	
	for(i=0;i<TotalAttr;i++)
	{
		if(TableAttr[i].NoLine==Co)
		{						
			n = i;
			break;
		}
	}
	while(TableAttr[n].NoLine==Co)
	{
		at = WhatAttr(TableAttr[n].attr);
		if(at==5)	//type
		{
			flag = StrCompare(TableAttr[n].val,"accept");
			if(flag!=0)
			{
				flag = StrCompare(TableAttr[n].val,"prev");
				if(flag!=0)						
				{
					flag = StrCompare(TableAttr[n].val,"option");
					if(flag!=0)
					{
						//error
					}							
				}
			}						
		}
		else if(at==7)	//label
		{										
			CreateButton(TableAttr[n].val,templa,Cc,y);
		}					
		else if(at==11)	//name
		{					
		}
		//else error
		n++;
	}//while
}

void GetDo2(UInt16 Co,UInt16 templa,UInt16 Cc,UInt16 y)
{
	UInt16 i,n,at;
	Int16 flag;
	
	for(i=0;i<TotalAttr;i++)
	{
		if(TableAttr[i].NoLine==Co)
		{						
			n = i;
			break;
		}
	}
	while(TableAttr[n].NoLine==Co)
	{
		at = WhatAttr(TableAttr[n].attr);
		if(at==5)	//type
		{
			flag = StrCompare(TableAttr[n].val,"accept");
			if(flag!=0)
			{
				flag = StrCompare(TableAttr[n].val,"prev");
				if(flag!=0)						
				{
					flag = StrCompare(TableAttr[n].val,"option");
					if(flag!=0)
					{
						//error
					}							
				}
			}						
		}
		else if(at==7)	//label
		{										
			CreateButton2(TableAttr[n].val,templa,Cc,y);
		}					
		else if(at==11)	//name
		{					
		}
		//else error
		n++;
	}//while
}

void DrawPage(UInt16 Co,UInt16 Cc)
{
	FormPtr MainPF;	
	EventType openEvent;
	MenuBarType Menu;
	UInt16 tagId,i,n,len,at,fnt=1,y=20,linetemplate;
	Char align;
	ControlPtr but[6];
	GraphicControlType buttonGraphic[6];	
	ControlPtr up,down;
	UInt16 a;
	
	if (NumF2 > 0)
	{
		for (a = 0; a <= NumF2 ; a ++)
		{
			FrmEraseForm(UpDownForm[a]);
		}
	}
   	CoGlobal[NumF]=CoStatic[NumF];
   	CcGlobal[NumF]=CcStatic[NumF];
    FrmEraseForm(dynaFrm[NumF]);
	NumF++;
	EndNumF = NumF;
	MainPF = FrmGetFormPtr(MainForm);	
	dynaFrm[NumF] = FrmNewForm(FrmFirst+count, "Olala  Wap    ", 0, 0, 160, 160, false, 0, 0, MainFormMenuBar);		
	FrmSetActiveForm(dynaFrm[NumF]);
	FrmSetEventHandler(dynaFrm[NumF], MainFormHandleEvent);	
	Menu = *MenuInit(1000);
	
	up   = CtlNewControl ((void**)&dynaFrm[NumF], UpButton  , buttonCtl,BLACK_UP_ARROW, 149, 145, 11, 8, symbol7Font, 1,false);
	down = CtlNewControl ((void**)&dynaFrm[NumF], DownButton, buttonCtl, BLACK_DOWN_ARROW, 149, 152, 11, 8, symbol7Font, 1,false);

	newPage  = true;
	CoStatic[NumF] = Co;
	CcStatic[NumF] = Cc;
	CoGlobal[NumF] = Co;
	CcGlobal[NumF] = Cc;

	
	buttonGraphic[0] = *CtlNewGraphicControl((void **)&dynaFrm[NumF],1003,buttonCtl,1500,1500,71,1,13,11,1,true);
	buttonGraphic[1] = *CtlNewGraphicControl((void **)&dynaFrm[NumF],1001,buttonCtl,1200,1200,88,1,11,11,1,true);
	buttonGraphic[2] = *CtlNewGraphicControl((void **)&dynaFrm[NumF],1005,buttonCtl,1300,1300,102,1,11,11,1,true);
	buttonGraphic[3] = *CtlNewGraphicControl((void **)&dynaFrm[NumF],1006,buttonCtl,1700,1700,117,1,11,11,1,true);
	buttonGraphic[4] = *CtlNewGraphicControl((void **)&dynaFrm[NumF],1002,buttonCtl,1400,1400,130,1,14,11,1,true);
	buttonGraphic[5] = *CtlNewGraphicControl((void **)&dynaFrm[NumF],1004,buttonCtl,1600,1600,147,1,11,11,1,true);
	but[0] = (ControlPtr)FrmGetObjectPtr (dynaFrm[NumF],FrmGetObjectIndex (dynaFrm[NumF],1003));
	but[1] = (ControlPtr)FrmGetObjectPtr (dynaFrm[NumF],FrmGetObjectIndex (dynaFrm[NumF],1001));
	but[2] = (ControlPtr)FrmGetObjectPtr (dynaFrm[NumF],FrmGetObjectIndex (dynaFrm[NumF],1005));
	but[3] = (ControlPtr)FrmGetObjectPtr (dynaFrm[NumF],FrmGetObjectIndex (dynaFrm[NumF],1006));
	but[4] = (ControlPtr)FrmGetObjectPtr (dynaFrm[NumF],FrmGetObjectIndex (dynaFrm[NumF],1002));
	but[5] = (ControlPtr)FrmGetObjectPtr (dynaFrm[NumF],FrmGetObjectIndex (dynaFrm[NumF],1004));
	but[0]->attr.frame = noButtonFrame;
	but[1]->attr.frame = noButtonFrame;
	but[2]->attr.frame = noButtonFrame;
	but[3]->attr.frame = noButtonFrame;
	but[4]->attr.frame = noButtonFrame;
	but[5]->attr.frame = noButtonFrame;
	while(Co<Cc)
	{
		if(st[Co]!=4)
		{
			tagId = WhatTag(Lines[Co],st[Co]);
			if(tagId==1)	//card
			{
				for(i=0;i<TotalAttr;i++)
				{
					if(TableAttr[i].NoLine==Co)
					{						
						n = i;						
						break;
					}
				}
				while(TableAttr[n].NoLine==Co)
				{
					at = WhatAttr(TableAttr[n].attr);
					if(at==0)	//id
					{
						//ShowMessage(DisplayAlert,"val id", " ", val[n]);
					}
					else if(at==1)	//title
					{					
						len = StrLen(TableAttr[n].val);
						FrmNewLabel (&dynaFrm[NumF], FrmFirst+count+Co, TableAttr[n].val, GetAlign('c',len,TableAttr[n].val), 18, boldFont);
					}
					/*else if(at==2)	//newcontext
						ShowMessage(DisplayAlert,"val newcontext", " ", val[n]);
					else if(at==21)	//ontimer
						ShowMessage(DisplayAlert,"val ontimer", " ", val[n]);
					else if(at==23)	//onenterforward
						ShowMessage(DisplayAlert,"val onenterforward", " ", val[n]);
					else if(at==24)	//onenterbackward
						ShowMessage(DisplayAlert,"val onenterbackward", " ", val[n]);
					//else error*/
					n++;				
				}			
			}//card
			else if((tagId==2)&&(st[Co]==1))	//do
				GetDo(Co,0,Cc,y);//*****
			else if((tagId==25)&&(st[Co]==3))	//image				
				y = GetImage(Co,y,align);
			else if((tagId==31)&&(st[Co]==3))	//go
				GetGo(Co);
			else if((tagId==3)&&(st[Co]==1))	//p
			{
				align = GetP(Co);
				y = y+10;
			}
			else if((tagId==30)&&(st[Co]==3))	//br
				y = y+11;
			else if((tagId==18)&&(st[Co]==1))	//a
				Co = GetA(Co,y,align);
			/*else if((tagId==12)&&(st[Co]==1))	//select
				GetSelect(Co);
			else if((tagId==13)&&(st[Co]==1))	//option
				y = GetOption(Co,y);*/
			else if(st[Co]==0)		
	    	{	
				len = StrLen(Lines[Co]);				
				FrmNewLabel (&dynaFrm[NumF], FrmFirst+count+Co, Lines[Co], GetAlign(align,len,Lines[Co]), y, GetFont(fnt));
			}
		}
		Co++;
	}
	if(Nevent>=0)
	{
		i = 0;
		while(i<=Nevent)
		{
			linetemplate = templateStk[i];
			tagId = WhatTag(Lines[linetemplate],st[linetemplate]);
			if((tagId==2)&&(st[linetemplate]==1))	//do
				GetDo(linetemplate,1,Cc,y);
			i++;
		}
	}
	YGlobal[NumF] = y + 12;	
	YGlobal2[NumF] = y + 12;	
	UpDownForm[NumF2] = dynaFrm[NumF];	
	openEvent.eType = frmOpenEvent;
	openEvent.data.frmOpen.formID = FrmFirst+count;
	EvtAddEventToQueue (&openEvent);
	count = count+100;	
}	

void DrawPage2(UInt16 Co,UInt16 Cc)
{
	FormPtr MainPF;	
	EventType openEvent;
	MenuBarType Menu;
	UInt16 tagId,i,n,len,at,fnt=1,y=20,linetemplate;
	Char align;
	ControlPtr but[6];
	GraphicControlType buttonGraphic[6];	
	ControlPtr up,down;
	
	
	//FrmEraseForm(UpDownForm[NumF2]);
	FrmEraseForm(dynaFrm[NumF]);
	NumF2++;
	//EndNumF = NumF2;
	MainPF = FrmGetFormPtr(MainForm);	
	UpDownForm[NumF2] = FrmNewForm(FrmFirst2+count2, "Olala  Wap    ", 0, 0, 160, 160, false, 0, 0, MainFormMenuBar);		
	FrmSetActiveForm(UpDownForm[NumF2]);
	FrmSetEventHandler(UpDownForm[NumF2], MainFormHandleEvent);	
	Menu = *MenuInit(1000);
	
	up   = CtlNewControl ((void**)&UpDownForm[NumF2], UpButton  , buttonCtl,BLACK_UP_ARROW, 149, 145, 11, 8, symbol7Font, 1,false);
	down = CtlNewControl ((void**)&UpDownForm[NumF2], DownButton, buttonCtl, BLACK_DOWN_ARROW, 149, 152, 11, 8, symbol7Font, 1,false);

	
	buttonGraphic[0] = *CtlNewGraphicControl((void **)&UpDownForm[NumF2],1003,buttonCtl,1500,1500,71,1,13,11,1,true);
	buttonGraphic[1] = *CtlNewGraphicControl((void **)&UpDownForm[NumF2],1001,buttonCtl,1200,1200,88,1,11,11,1,true);
	buttonGraphic[2] = *CtlNewGraphicControl((void **)&UpDownForm[NumF2],1005,buttonCtl,1300,1300,102,1,11,11,1,true);
	buttonGraphic[3] = *CtlNewGraphicControl((void **)&UpDownForm[NumF2],1006,buttonCtl,1700,1700,117,1,11,11,1,true);
	buttonGraphic[4] = *CtlNewGraphicControl((void **)&UpDownForm[NumF2],1002,buttonCtl,1400,1400,130,1,14,11,1,true);
	buttonGraphic[5] = *CtlNewGraphicControl((void **)&UpDownForm[NumF2],1004,buttonCtl,1600,1600,147,1,11,11,1,true);
	but[0] = (ControlPtr)FrmGetObjectPtr (UpDownForm[NumF2],FrmGetObjectIndex (UpDownForm[NumF2],1003));
	but[1] = (ControlPtr)FrmGetObjectPtr (UpDownForm[NumF2],FrmGetObjectIndex (UpDownForm[NumF2],1001));
	but[2] = (ControlPtr)FrmGetObjectPtr (UpDownForm[NumF2],FrmGetObjectIndex (UpDownForm[NumF2],1005));
	but[3] = (ControlPtr)FrmGetObjectPtr (UpDownForm[NumF2],FrmGetObjectIndex (UpDownForm[NumF2],1006));
	but[4] = (ControlPtr)FrmGetObjectPtr (UpDownForm[NumF2],FrmGetObjectIndex (UpDownForm[NumF2],1002));
	but[5] = (ControlPtr)FrmGetObjectPtr (UpDownForm[NumF2],FrmGetObjectIndex (UpDownForm[NumF2],1004));
	but[0]->attr.frame = noButtonFrame;
	but[1]->attr.frame = noButtonFrame;
	but[2]->attr.frame = noButtonFrame;
	but[3]->attr.frame = noButtonFrame;
	but[4]->attr.frame = noButtonFrame;
	but[5]->attr.frame = noButtonFrame;
	while(Co<Cc)
	{
		if(st[Co]!=4)
		{
			tagId = WhatTag(Lines[Co],st[Co]);
			if(tagId==1)	//card
			{
				for(i=0;i<TotalAttr;i++)
				{
					if(TableAttr[i].NoLine==Co)
					{						
						n = i;						
						break;
					}
				}
				while(TableAttr[n].NoLine==Co)
				{
					at = WhatAttr(TableAttr[n].attr);
					if(at==0)	//id
					{
						//ShowMessage(DisplayAlert,"val id", " ", val[n]);
					}
					else if(at==1)	//title
					{					
						len = StrLen(TableAttr[n].val);
						FrmNewLabel (&UpDownForm[NumF2], FrmFirst2+count2+Co, TableAttr[n].val, GetAlign('c',len,TableAttr[n].val), 18, boldFont);
					}
					/*else if(at==2)	//newcontext
						ShowMessage(DisplayAlert,"val newcontext", " ", val[n]);
					else if(at==21)	//ontimer
						ShowMessage(DisplayAlert,"val ontimer", " ", val[n]);
					else if(at==23)	//onenterforward
						ShowMessage(DisplayAlert,"val onenterforward", " ", val[n]);
					else if(at==24)	//onenterbackward
						ShowMessage(DisplayAlert,"val onenterbackward", " ", val[n]);
					//else error*/
					n++;				
				}			
			}//card
			else if((tagId==2)&&(st[Co]==1))	//do
				GetDo2(Co,0,Cc,y);
			else if((tagId==25)&&(st[Co]==3))	//image				
				y = GetImage2(Co,y,align);
			else if((tagId==31)&&(st[Co]==3))	//go
				GetGo(Co);
			else if((tagId==3)&&(st[Co]==1))	//p
			{
				align = GetP(Co);
				y = y+10;
			}
			//else if((tagId==
			else if((tagId==30)&&(st[Co]==3))	//br
				y = y+11;
			else if((tagId==18)&&(st[Co]==1))	//a
				Co = GetA2(Co,y,align);
			/*else if((tagId==12)&&(st[Co]==1))	//select
				GetSelect(Co);
			else if((tagId==13)&&(st[Co]==1))	//option
				y = GetOption(Co,y);*/
			else if(st[Co]==0)		
	    	{	
				len = StrLen(Lines[Co]);				
				FrmNewLabel (&UpDownForm[NumF2], FrmFirst2+count2+Co, Lines[Co], GetAlign(align,len,Lines[Co]), y, GetFont(fnt));
			}
		}
		Co++;
	}
	if(Nevent>=0)
	{
		i = 0;
		while(i<=Nevent)
		{
			linetemplate = templateStk[i];
			tagId = WhatTag(Lines[linetemplate],st[linetemplate]);
			if((tagId==2)&&(st[linetemplate]==1))	//do
				GetDo2(linetemplate,1,Cc,y);
			i++;
		}
	}
	YGlobal2[NumF] = y + 12;	
	openEvent.eType = frmOpenEvent;
	openEvent.data.frmOpen.formID = FrmFirst2+count2;
	EvtAddEventToQueue (&openEvent);
	count2 = count2+100;	
}	


void MainButtonFunc()
{
	UInt16 PFrm;	
	FormPtr DelFrm;
	
	PFrm = FrmGetActiveFormID();
	DelFrm = FrmGetFormPtr(PFrm);	
	DrawPage(pageCard[NumF].NCo,pageCard[NumF].NCc);
}

//WhatTag from parser
void OpenPage()
{
	UInt16 Co,Cc,i=1,flag,tagId;
	
	while(st[i]==4)
		i++;
	tagId = WhatTag(Lines[i],st[i]);
	if((tagId==0)&&(st[i]==1))
		i++;
	tagId = WhatTag(Lines[i],st[i]);
	if((tagId==19)&&(st[i]==1))	//template
	{		
		do
		{
			i++;
			Nevent++;
			tagId = WhatTag(Lines[i],st[i]);
			if((tagId==2)&&(st[i]==1))	//do
				templateStk[Nevent]=i;
			else if((tagId==31)&&(st[i]==3))	//go
				templateStk[Nevent]=i;
			else if((tagId==24)&&(st[i]==3))	//prev
				prev = true;
		} while((tagId!=19)&&(st[i]!=2));
		i++;		
	}	
	do
	{
		flag = StrCompare(Lines[i],"card");
		i++;
	} while(flag!=0);
		Co = i-1;
	do
	{
		flag = StrCompare(Lines[i],"card");
		i++;
	} while(flag!=0);
	Cc = i-1;
	pageCard[NumF].NCo = Co;
	pageCard[NumF].NCc = Cc;
	DrawPage(Co,Cc);
}

