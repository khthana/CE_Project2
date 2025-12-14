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

#include "Parser.h"
#include "PrewapRsc.h"

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
Char* Lines[50];
MemHandle fld[50], fldA[50], fldB[50];
UInt8 st[50];
Attrb TableAttr[50];


/***********************************************************************
 *
 *   Internal Functions
 *
 ***********************************************************************/

Err ShowMessage(UInt16 ObjectID, Char* sMsg1, Char* sMsg2, Char* sMsg3)
{
	Err err;
	err = FrmCustomAlert(ObjectID, sMsg1, sMsg2, sMsg3);
	return err;
}

/*Count for find the character that we want to cut out*/
UInt16 FindChar(Char key[200], Char c)
{
	UInt16 n;	
		
	n = 0;
	while(key[n]!=c)
		n++;
	return n;
}

/*Cut Header space*/
UInt16 HSpace(Char ant[200])
{
	UInt16 h;
	
	h = 0;
	while((ant[h]==' ')||(ant[h]=='\n')||(ant[h]=='\t')||(ant[h]=='\r'))				
		h++;
	return h;
}

/*Cut Tail space*/
UInt16 TSpace(Char ant[200],UInt16 len)
{
	UInt16 t;
	
	t = len-1;
	while((ant[t]==' ')||(ant[t]=='\n')||(ant[t]=='\t')||(ant[t]=='\r'))				
		t--;
	return t;
}

/*Change EscapeCharacter to character*/
UInt16 ChangeEscape(Char* text,UInt16 s)
{	
	Char* Escape[] = {"&apos;","&lt;","&gt;","&amp;","&nbsp;","&quot;","&#34;","&#38;","&#39;","&#60;","&#62;","&#160;"};
	Char* semi;
	MemHandle sm;
	UInt16 len, n, i, j, o, a, flag=0;
	Int16 comp;
	Char tmp[200], tmp2[200], newText[200], Ec[30];
	
	n = 0;
	o = 0;
	a = 0;
	sm = MemHandleNew(8);
	semi = MemHandleLock(sm);
	len = StrLen(text);
	StrCopy(tmp,text);
	StrCopy(tmp2,tmp);
	while(n<=len-1)
	{		
		if(tmp[n]!='&')
		{
			if((tmp[n]=='\'')||(tmp[n]=='\"'))
			{
				flag = 1;
				ShowMessage(DisplayAlert,"Error!", " ", "\' or \"");	
				break;
			}
			newText[o] = tmp[n];
			if(tmp[n]=='$')
			{
				if(tmp[n+1]=='$')
					n = n+1;
				else
				{
					//variable
				}
			}
		}		
		else
		{
			semi = StrChr(tmp2,';');
			if(semi==NULL)
			{
				flag = 1;
				ShowMessage(DisplayAlert,"Error!", " ", "&");
				break;
			}
			i = FindChar(tmp2,';');
			StrNCopy(Ec,tmp+n,i+a-n+1);			
			Ec[i+a-n+1] = '\0';			
			for(j=0;j<=11;j++)
			{	
				comp = StrCompare(Ec,Escape[j]);				
				if(comp==0)
				{					
					if(j==0)
					{
						newText[o] = '\'';
						newText[o+1] = '\0'; 											
						n = n+5;
					}
					else if(j==8)
					{
						newText[o] = '\'';	
						newText[o+1] = '\0'; 					
						n = n+4;
					}
					else if(j==1)
					{
						newText[o] = '<';	
						newText[o+1] = '\0'; 					
						n = n+3;
					}
					else if(j==9)
					{
						newText[o] = '<';	
						newText[o+1] = '\0'; 					
						n = n+4;
					}
					else if(j==2)
					{
						newText[o] = '>';	
						newText[o+1] = '\0'; 					
						n = n+3;
					}
					else if(j==10)
					{
						newText[o] = '>';	
						newText[o+1] = '\0'; 					
						n = n+4;
					}
					else if((j==3)||(j==7))
					{
						newText[o] = '&';	
						newText[o+1] = '\0'; 					
						n = n+4;
					}					
					else if((j==4)||(j==11))
					{
						newText[o] = ' ';	
						newText[o+1] = '\0'; 					
						n = n+5;
					}					
					else if(j==5)
					{
						newText[o] = '\"';	
						newText[o+1] = '\0'; 					
						n = n+5;
					}
					else if(j==6)
					{
						newText[o] = '\"';	
						newText[o+1] = '\0'; 					
						n = n+4;
					}
					break;
				}
			}
			StrCopy(tmp2,tmp+i+a+1);			
			a = i+1;
		}		
		n++;
		o++;
	}
	newText[o] = '\0';
	if(flag==0)
		StrCopy(Lines[s],newText);
	MemHandleUnlock(sm);
	return flag;
}

/*Check Tag*/
Int16 CheckTag(Char* Line, UInt8 state)
{
	UInt16 i;
	Int16 flag;	
	Char* Tag1[] = {"wml","card" ,"do"    ,"p"     ,"table"   ,"b"      ,"i"     ,"u" ,"em","strong",
					  "big","small","select","option","optgroup","onevent","anchor","go","a" ,"template",
					  "tr" ,"td"   ,"refresh" };					
	Char* Tag3[] = {"input","prev","img","setvar","noop","postfield","timer","br","go"};
		
	if(state==3)
	{
		for(i=0;i<=8;i++)
		{			
			flag = StrCompare(Tag3[i],Line);			
			if (flag==0)				
				break;
		}
	}
	else
	{
		for(i=0;i<=22;i++)
		{
			flag = StrCompare(Tag1[i],Line);
			if (flag==0)
				break;
		}
	}
	return flag;
}

UInt16 WhatTag(Char* Line, UInt16 state)
{
	UInt16 i,n;
	Int16 flag;	
	Char* Tag1[] = {"wml","card" ,"do"    ,"p"     ,"table"   ,"b"      ,"i"     ,"u" ,"em","strong",
					  "big","small","select","option","optgroup","onevent","anchor","go","a" ,"template",
					  "tr" ,"td"   ,"refresh" };					
	Char* Tag3[] = {"input","prev","img","setvar","noop","postfield","timer","br","go"};
		
	if(state==3)
	{
		for(i=0;i<=8;i++)
		{			
			flag = StrCompare(Tag3[i],Line);			
			if (flag==0)
			{
				n = 23+i;			
				break;
			}
		}
	}
	else
	{
		for(i=0;i<=22;i++)
		{
			flag = StrCompare(Tag1[i],Line);
			if (flag==0)
			{
				n = i;			
				break;
			}
		}
	}
	return n;
}

Char MapTag(UInt16 n)
{
	Char m;
	
	switch(n)
	{
		case 0: m = 'A'; break;
		case 1: m = 'B'; break;
		case 2: m = 'C'; break;
		case 3: m = 'D'; break;
		case 4: m = 'E'; break;
		case 5: m = 'F'; break;
		case 6: m = 'G'; break;
		case 7: m = 'H'; break;
		case 8: m = 'I'; break;
		case 9: m = 'J'; break;
		case 10: m = 'K'; break;
		case 11: m = 'L'; break;
		case 12: m = 'M'; break;
		case 13: m = 'N'; break;
		case 14: m = 'O'; break;
		case 15: m = 'P'; break;
		case 16: m = 'Q'; break;
		case 17: m = 'R'; break;
		case 18: m = 'S'; break;
		case 19: m = 'T'; break;
		case 20: m = 'U'; break;
		case 21: m = 'V'; break;
		case 22: m = 'W'; break;
		case 23: m = 'X'; break;
		case 24: m = 'Y'; break;
		case 25: m = 'Z'; break;
		case 26: m = 'q'; break;
		case 27: m = 'r'; break;
		case 28: m = 's'; break;
		case 29: m = 't'; break;
		case 30: m = 'u'; break;
		case 31: m = 'v'; break;
		case 32: m = 'w'; break;	
	}
	return m;
}

/*check nested tag*/
Boolean CheckNested(UInt16 TotalLines) 
{
	Int16 CurrentLevel = -1, j = -1, flagT;
	UInt16 i, n, f, k=1;
	Char* stack[200];
	MemHandle stk[200];
	Char tag[200];
	
	for(i=1;i<=TotalLines-1;i++)
	{
		if((st[i]!=0)&(st[i]!=4))
		{
			if(st[i]==1)
			{				
				CurrentLevel++;
				j++;
				stk[j] = MemHandleNew(20);
				stack[j] = MemHandleLock(stk[j]);
				StrCopy(stack[j],Lines[i]); //push				
			}
			else if(st[i]==2)
			{
				if(CurrentLevel!=-1)
				{	
					if(*stack[j]==*Lines[i])
					{	
						MemHandleUnlock(stk[j]);				
						j--;									
						CurrentLevel--;
					}
					else					
						break;
				}
				else
				{
					ShowMessage(DisplayAlert,"Attempted close of </", Lines[i], ">");
					k = 0;
					break;
				}
			}			
		}
		else if(st[i]==0)
			f = ChangeEscape(Lines[i],i);
		//if(f!=1)
			//ShowMessage(DisplayAlert, Lines[i], " ", "\nGot it!");
	}// end for
	if(CurrentLevel!=-1)
	{		
		ShowMessage(DisplayAlert,"Nested tags are illegal.", " ","Did you miss an endtag?");
		k = 0;
	}
	else if(k!=0)
	{		
		for(n=1;n<=TotalLines-1;n++)
		{	if((st[n]!=0)&(st[n]!=4))
			{
				StrCopy(tag,Lines[n]);
				StrToLower(Lines[n],tag);				
				flagT = CheckTag(Lines[n],st[n]);			
				if(flagT!=0)
				{				
					ShowMessage(DisplayAlert, "Error! ", Lines[n], " illegal at that position or unknown tag");
					k = 0;
					break;
				}				
			}
		}		
	}
	if(k==0)
		return false;
	else
		return true;
}

Int16 table(Char c,UInt16 j)
{					//	   0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
	Int16 Table[16][33]={{ 0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//WAP
						 { 2, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Body
						 {-1, 4,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 3,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Template
						 {-1, 7, 5, 7,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 6,-1,-1,-1, 7,-1,-1,-1,-1,-1,-1,-1,-1,-1, 7,-1,-1,-1},//Event 
						 {-1,51, 8, 8,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 8,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 8,-1,-1,-1},//Content
						 {-1,10,10,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 9,-1,-1,-1},//Timer
						 {-1,-1,-1,26,12,24,25,21,22,23,19,20,16,-1,-1,-1,13,-1,11,-1,-1,-1,-1,15,-1,17,-1,-1,-1,-1,14,-1,18},//TextLink
						 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,30,-1,-1,-1,-1,31,-1,28,-1,-1,27,-1,-1,-1,29,-1},//Task	
						 {-1,-1,-1,-1,33,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,32,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Row
						 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,35,34,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Col
					 	 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,38,36,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Op
						 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,41,-1,-1,-1,-1,-1,-1,-1,-1,40,-1,39,-1,-1,-1,-1},//PS 
						 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,43,-1,42,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Optgroup
						 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,45,44,45,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1},//Option
						 {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,48,-1,46,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,47},//ET
						 {-1,50,-1,49,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}};//Text
	UInt16 i;
	
	switch(c)
	{
		case 'a': i = 0; break;
		case 'b': i = 1; break; 
		case 'c': i = 2; break;
		case 'd': i = 3; break;
		case 'e': i = 4; break;
		case 'f': i = 5; break;
		case 'g': i = 6; break;
		case 'h': i = 7; break;
		case 'i': i = 8; break;
		case 'j': i = 9; break;
		case 'k': i = 10; break;
		case 'l': i = 11; break;
		case 'm': i = 12; break;
		case 'n': i = 13; break;
		case 'o': i = 14; break;
		case 'p': i = 15; break;
	}
	return Table[i][j];				
}

Char* extract(Int16 result,UInt16 i,Char stk[500])
{	
	Char* stack;
	MemHandle sk;
	
	sk = MemHandleNew(200);
	stack = MemHandleLock(sk);
	switch(result)
	{
		case 0: stk[i] = 'A';
				stk[i+1] = 'b';
				stk[i+2] = 'c';
				stk[i+3] = 'A';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 1: stk[i] = 'b';
				stk[i+1] = 'B';
				stk[i+2] = 'e';
				stk[i+3] = 'B';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 2: case 4:case 7: case 10: case 26: case 33: case 35:
		case 38:case 41: case 43: case 45: case 48: case 50: 
				stk[i] = '\0';
				StrCopy(stack,stk);
			    break;
		case 3: stk[i] = 'T';
				stk[i+1] = 'd';
				stk[i+2] = 'T';
				stk[i+3] = '\0';
				StrCopy(stack,stk);
				break;
		case 5: stk[i] = 'd';
				stk[i+1] = 'C';
				stk[i+2] = 'h';
				stk[i+3] = 'C';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 6: stk[i] = 'd';
				stk[i+1] = 'P';
				stk[i+2] = 'h';
				stk[i+3] = 'P';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 8: stk[i] = 'p';
				stk[i+1] = 'd';
				stk[i+2] = 'f';
				stk[i+3] = 'd';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 9: stk[i] = 't';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 11: stk[i] = 'g';			
				stk[i+1] = 'S';
				stk[i+2] = 'w';	
				stk[i+3] = 'S';	
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 12: stk[i] = 'g';
				stk[i+1] = 'E';
				stk[i+2] = 'i';
				stk[i+3] = 'E';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 13: stk[i] = 'g';
				stk[i+1] = 'Q';
				stk[i+2] = 'h';
				stk[i+3] = 'Q';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 14: stk[i] = 'g';
				stk[i+1] = 'u';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 15: stk[i] = 'g';
				stk[i+1] = 'X';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 16: stk[i] = 'g';
				stk[i+1] = 'M';
				stk[i+2] = 'k';
				stk[i+3] = 'M';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 17: stk[i] = 'g';
				stk[i+1] = 'Z';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 18: stk[i] = 'g';
				stk[i+1] = 'w';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 19: stk[i] = 'g';
				stk[i+1] = 'K';
				stk[i+2] = 'w';
				stk[i+3] = 'K';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 20: stk[i] = 'g';
				stk[i+1] = 'L';
				stk[i+2] = 'w';
				stk[i+3] = 'L';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 21: stk[i] = 'g';
				stk[i+1] = 'H';
				stk[i+2] = 'w';
				stk[i+3] = 'H';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 22: stk[i] = 'g';
				stk[i+1] = 'I';
				stk[i+2] = 'w';
				stk[i+3] = 'I';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 23: stk[i] = 'g';
				stk[i+1] = 'J';
				stk[i+2] = 'w';
				stk[i+3] = 'J';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 24: stk[i] = 'g';
				stk[i+1] = 'F';
				stk[i+2] = 'w';
				stk[i+3] = 'F';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 25: stk[i] = 'g';
				stk[i+1] = 'G';
				stk[i+2] = 'w';
				stk[i+3] = 'G';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 27: stk[i] = 'r';
				stk[i+1] = '\0';
				StrCopy(stack,stk);
				break;
		case 28: stk[i] = 'Y';
				stk[i+1] = '\0';
				StrCopy(stack,stk);
				break;
		case 29: stk[i] = 'v';
				stk[i+1] = '\0';
				StrCopy(stack,stk);
				break;
		case 30: stk[i] = 'R';
				stk[i+1] = 'l';
				stk[i+2] = 'R';
				stk[i+3] = '\0';
				StrCopy(stack,stk);
				break;
		case 31: stk[i] = 'W';
				stk[i+1] = 'q';	
				stk[i+2] = 'W';
				stk[i+3] = '\0';
				StrCopy(stack,stk);
				break;
		case 32: stk[i] = 'i';
				stk[i+1] = 'U';
				stk[i+2] = 'j';
				stk[i+3] = 'U';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 34: stk[i] = 'j';
				stk[i+1] = 'V';
				stk[i+2] = 'w';
				stk[i+3] = 'V';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 36: stk[i] = 'n';
				stk[i+1] = '\0';			
				StrCopy(stack,stk);
				break;
		case 37: stk[i] = 'm';
				stk[i+1] = '\0';
				StrCopy(stack,stk);
				break;
		case 39: stk[i] = 'l';
				stk[i+1] = 's';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 40: stk[i] = 'l';
				stk[i+1] = 'q';
				stk[i+2] = '\0';
				StrCopy(stack,stk);
				break;
		case 42: stk[i] = 'm';
				stk[i+1] = 'O';
				stk[i+2] = 'n';
				stk[i+3] = 'O';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 44: stk[i] = 'n';
				stk[i+1] = 'N';
				stk[i+2] = 'o';
				stk[i+3] = 'N';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
		case 46: stk[i] = 'P';
				stk[i+1] = 'v';
				stk[i+2] = 'P';
				stk[i+3] = '\0';
				StrCopy(stack,stk);
				break;
		case 47: case 52 : 
				stk[i] = 'w';
				stk[i+1] = '\0';
				StrCopy(stack,stk);
				break;
		case 49: stk[i] = 'p';
				stk[i+1] = 'D';
				stk[i+2] = 'g';
				stk[i+3] = 'D';
				stk[i+4] = '\0';
				StrCopy(stack,stk);
				break;
	}
	return stack;
}

/*must always have tag wml and then card after header*/
Boolean CheckOrder(Int16 AllLine)
{		
	Int16 result,i=0;
	UInt16 n=2,b=1,len,tag;
	Char stk[200],MTag;
	Char* vari;
	Char* sck;
	Char* temp;
	MemHandle vv,sk,tmp;
	
	vv = MemHandleNew(8);
	vari = MemHandleLock(vv);
	tmp = MemHandleNew(8);
	temp = MemHandleLock(tmp);
	sk = MemHandleNew(200);
	sck = MemHandleLock(sk);
	
	stk[i] = 'a';
	do
	{
		if(st[n]!=4)
		{
			if(st[n]!=0)
				tag = WhatTag(Lines[n],st[n]);				
			else
				tag = 32;		
			result = table(stk[i],tag);
			if(result>=0)
			{				
				sck = extract(result,i,stk);
				StrCopy(stk,sck);
				//ShowMessage(DisplayAlert, "stack", " ",sck);
				len = StrLen(sck);
				i = len-1;
				MTag = MapTag(tag);				
				while(stk[i]==MTag)
				{					
					n++;
					i--;
					if(st[n]!=0)
						tag = WhatTag(Lines[n],st[n]);				
					else
						tag = 32;
					MTag = MapTag(tag);					
				}				
			}
			else
			{
				b = 0;
				break;
			}
		}
		else
			n++;
	} while(i>0);
	
	if(b==0)
		return false;
	else
		return true;
	MemHandleUnlock(vv);
	MemHandleUnlock(sk);
	MemHandleUnlock(tmp);
}

/*Clear space, enter, and tab*/
void CleanString(Char* text,UInt16 n)
{
	Char txt[200], tmp[200];
	UInt16 len, i, j = 0, s = 0;
		
	len = StrLen(text);
	StrCopy(txt,text);
	for(i=0;i<=len-1;i++)
	{
		if((txt[i]!='\n')&(txt[i]!='\t')&(txt[i]!='\r'))	//update
		{
			if(txt[i]==' ')
			{
				if(s==0)
				{
					tmp[j] = txt[i];
					j++;
				}
				s++;
			}
			else
			{
				s = 0;
				tmp[j] = txt[i];
				j++;
			}			
		}		
	}
	tmp[j] = '\0';
	StrCopy(Lines[n],tmp);
}

/*Check Attribute*/
Int16 CheckAttr(Char* At)
{
	UInt16 i;
	Int16 flagAttr;
	
	Char* Attrib[] = {"id"     ,"title" ,"newcontext","href" ,"columns" ,"type" ,"src"   ,"label"  ,"align" ,"mode",
						"alt"    ,"name"  ,"maxlength" ,"value","multiple","iname","ivalue","emptyok","format","method",
						"ontimer","onpick","onenterforward","onenterbackward","height","width","vspace","hspace"};

	for(i=0;i<=27;i++)
	{
		flagAttr = StrCompare(Attrib[i],At);
		if(flagAttr==0)		
			break;
	}	
	return flagAttr;
}

/*Seperate attribute and value in tag*/		
Int16 parseParms(Char at[200], UInt16 m)
{
	UInt16 j, l, n, h, t;
	Int16 k;
	Char* Eq=NULL;
	Char* quote=NULL;
	Char* tmp;
	Char* space=NULL;
	MemHandle MEq, Mq, tt, sp;
	Char tmp1[200], tmp2[200] ,str[200];
	
	MEq = MemHandleNew(8);
	Mq = MemHandleNew(8);
	sp = MemHandleNew(8);	
	Eq = MemHandleLock(MEq);
	quote = MemHandleLock(Mq);
	space = MemHandleLock(sp);
	tt = MemHandleNew(100);
	tmp = MemHandleLock(tt);
	k=0;	
	if((st[m]==1)||(st[m]==3))
	{														
		StrCopy(str,at);
		Eq = StrChr(str,'=');
		if(Eq==NULL)
		{
			k = -3;
			ShowMessage(DisplayAlert, "Error! ", "= ", "is missing");
		}
		while(Eq!=NULL)
		{					
			TableAttr[k].NoLine = m;				
			fldA[k] = MemHandleNew(20);
			TableAttr[k].attr = MemHandleLock(fldA[k]);										
			j = FindChar(str,'=');			
			StrNCopy(tmp1,str,j);
			tmp1[j]='\0';			
			t = TSpace(tmp1,j);
			if(t!=j-1)
			{
				StrNCopy(tmp,tmp1,t+1);
				tmp[t+1] = '\0';
			}
			else
				tmp = tmp1;				
			StrToLower(TableAttr[k].attr,tmp);			
			StrCopy(at,str+j+1);
			StrCopy(str,at);
			quote = StrChr(str,'"');
			if(quote!=NULL)
			{		
				fldB[k] = MemHandleNew(200);
				TableAttr[k].val = MemHandleLock(fldB[k]);
				l = FindChar(str,'"');			
				StrCopy(at,str+l+1);	
				StrCopy(str,at);
				quote = StrChr(str,'"');
				if(quote!=NULL)
				{
					n = FindChar(str,'"');
					StrNCopy(tmp2,str,n);
					tmp2[n]='\0';
					h = HSpace(tmp2);
					t = TSpace(tmp2,n);
					if((n-h)>0)
					{
						StrNCopy(tmp,tmp2+h,t-h+1);
						tmp[t-h+1]='\0';						
					}
					else
						tmp = tmp2;						
					StrCopy(TableAttr[k].val,tmp);					
				}
				else	//no next quote
				{	
					k=-1;
					break;
				}
			}
			else	//no quote
			{	
				k=-2;
				break;
			}			
			StrCopy(tmp2,quote+1);
			h = HSpace(tmp2);
			StrCopy(str,tmp2+h);			
			Eq = StrChr(str,'=');
			quote = StrChr(str,'"');
			if((Eq==NULL)&(quote!=NULL))
			{
				ShowMessage(DisplayAlert, "Error! ", "over ", "value.");	
				break;
			}
			k++;				
		}
		//For attribute error
		if(k==-1)			
			ShowMessage(DisplayAlert, "Error! ", "quote are  ", "not matches.");			
		if(k==-2)
			ShowMessage(DisplayAlert, "Error! ", "value  is ", "not right.");		
	}		
	MemHandleUnlock(MEq);
	MemHandleUnlock(Mq);	
	MemHandleUnlock(tt);	
	MemHandleUnlock(sp);	
	return k;
}

/*Get state for each tag*/
UInt16 GetState(Char Tag[200], UInt16 lenstr)
{
	UInt8 state;	//0=Undefined, 1=Tag_Open, 2=Tag_close, 3=Tag_Selfcontained, 4=Comment
	
	if(Tag[0]=='/')
		state = 2;
	else if(Tag[lenstr-1]=='/')
		state = 3;
	else if(Tag[0]=='!')
		state = 4;
	else
		state = 1;
	return state;
}

/*seperate file out to tag*/
Int16 CutLine(Char* text)
{	
	UInt16 i, h, t, n, lentag, lenstr;
	Int16 bracket, k;
	UInt8 f, b;
	WChar letter;	
	Char* Dest;
	MemHandle fld1;
	Char ant[200], stack[200];
		
	fld1 = MemHandleNew(8);
	Dest = MemHandleLock(fld1);
	lenstr = StrLen(text);	
	n = 0;
	f = 0;
	k = 0;
	b = 0;
	bracket = 0;
	for(i=0; i<lenstr; i++)
	{	
		if((f==0)||(f==3))
		{
			fld[k] = MemHandleNew(200);
			Lines[k] = MemHandleLock(fld[k]);
		}
		StrNCopy(Dest,text+i,1);
		letter = *Dest;		
		if(letter == '<')
		{	
			bracket++;
			stack[b]=letter;
			b++;
			if(f==2)
			{				
				StrNCopy(ant,text+i-n-1,n+1);				
				ant[n+1]='\0';
				lentag = n+1;
				st[k] = 0;
				/*cut space, tab, and enter in line is not tag*/				
				h = HSpace(ant);
				t = TSpace(ant,lentag);
				if((lentag-h)>0)
				{
					StrNCopy(ant,text+i-n-1+h,t-h+1);
					ant[t-h+1]='\0';
					StrCopy(Lines[k],ant);									
					k++;
					f=3;					
				}
			}  
			else
				f=1;			
			n=0;
		}
		else if(letter == '>')
		{
			stack[b]=letter;
			b++;
			bracket--;
			n++;
			f=0;			
			StrNCopy(ant,text+i-n,n+1);
			ant[n+1]='\0';
			lentag = n+1;						
			st[k] = 1;						
			StrCopy(Lines[k],ant);			
			n=0;
			k++;
		}
		else
		{			
			if(f==0)
			{
				f=2;
				n=0;		
			}			
			else if(f==3)
			{
				f=4;
				n++;
			}
			else
				n++;
		}
		//for repeat brackets
		if(stack[b-1]==stack[b-2])
			break;		
	}
	//for file that have no tag or no closed tag	
	if(f==2)
	{
		StrNCopy(ant,text+lenstr-n,n);				
		ant[n]='\0';
		lentag = n;				
		st[k] = 0;
		/*cut space, tab, and enter in line is not tag*/
		h = HSpace(ant);
		t = TSpace(ant,lentag);
		if((lentag-h)>0)
		{
			StrNCopy(ant,text+lenstr-n+h,t-h+1);
			ant[t-h+1]='\0';
			StrCopy(Lines[k],ant);									
			k++;			
		}
	}
	//Error when brackets are not matchs
	if(bracket!=0)
	{
		ShowMessage(DisplayAlert, "Error! ", "Brackets are  ", "not matches.");
		k=-1;
	}
	MemHandleUnlock(fld1);
	return k;		
}

//Cut brackets out and then check tag in them
void CutBracket(Int16 j)
{		
	UInt16 i, k, lentag;
	UInt8 h, t;
	Char tag[200], ant[200];	

	//j is number of tags
	for(i=1;i<=j-1;i++)
	{			
		k = StrLen(Lines[i]);		
		if(st[i]!=0)	//Cut <> evey state except state 0
		{
			StrNCopy(tag,Lines[i]+1,k-2);
			tag[k-2] = '\0';
			lentag = k-2;	
			StrCopy(Lines[i],tag);		
			h = HSpace(tag);
			t = TSpace(tag,lentag);		
			if((k-3-h)>0)
			{
				StrNCopy(tag,Lines[i]+h,t-h+1);
				tag[t-h+1]='\0';
				StrCopy(Lines[i],tag);				
			}			
			k = StrLen(Lines[i]);
			StrCopy(ant,Lines[i]);
			st[i] = GetState(ant,k);			
			if(st[i]==2)				//state 2 is closed tag cut </...> but still have space
			{
				StrNCopy(tag,Lines[i]+1,k-1);
				tag[k-1] = '\0';
				StrCopy(Lines[i],tag);				
			}
			if(st[i]==3)				//state 3 is selfcontained cut <.../> but still have space
			{
				StrNCopy(tag,Lines[i],k-1);
				tag[k-1] = '\0';		
				StrCopy(Lines[i],tag);				
			}
			if(st[i]==4)
				ShowMessage(DisplayAlert, "Comment", " ", "ja");
		}								
		
	}
}

//check header
Boolean CheckHeader()
{
	Char header[30], token[30], temp[30];
	Char* check=NULL;
	MemHandle chk;
	UInt16 c, h, t;
	Int16 match;
	Boolean flag=true;
	
	chk = MemHandleNew(1);
	check = MemHandleLock(chk); 
	
	StrToLower(header,Lines[0]);
	check = StrChr(Lines[0],' ');
	if(check!=NULL)
	{//0
		c = FindChar(header,' ');
		StrNCopy(token,header,c);
		token[c] = '\0';		
		match = StrCompare(token,"<?xml");
		if(match==0)
		{//1
			StrCopy(temp,header+c+1);
			h = HSpace(temp);
			StrCopy(header,temp+h);
			check = StrChr(header,'=');
			if(check!=NULL)
			{//2
				c = FindChar(header,'=');
				StrNCopy(token,header,c);
				token[c] = '\0';				
				t = TSpace(token,c);
				StrNCopy(temp,token,t+1);		
				temp[t+1] = '\0';
				StrCopy(token,temp);				
				match = StrCompare(token,"version");
				if(match==0)
				{//3
					StrCopy(temp,header+c+1);
					h = HSpace(temp);
					StrCopy(header,temp+h);
					check = StrChr(header,'"');
					if(check!=NULL)
					{//4
						StrCopy(temp,header+1);
						h = HSpace(temp);
						StrCopy(header,temp+h);
						check = StrChr(header,'"');
						if(check!=NULL)
						{//5
							c = FindChar(header,'"');
							StrNCopy(token,header,c);
							token[c] = '\0';
							t = TSpace(token,c);
							StrNCopy(temp,token,t);		
							temp[t] = '\0';
							StrCopy(token,temp);
							match = StrCompare(token,"1.0");							
							if(match==0)
							{
								StrCopy(temp,header+c);
								h = HSpace(temp);
								StrCopy(header,temp+h);
								match = StrCompare(token,"?>");
								if(match!=0)
									flag = false;
							}							
						}//5
						else
							flag = false;						
					}//4
					else
						flag = false;					
				}//3
				else
					flag = false;				
			}//2
			else
				flag = false;			
		}//1
		else
			flag = false;		
	}//0
	else
		flag = false;	
	MemHandleUnlock(chk);
	return flag;
}

void MainOKButtonFunc()
{
	FieldPtr fpWAP;	
	MemHandle hdTxt, fc, tt;	
	Char* cpTxtWAP= "";
	Char* fChar=NULL;
	Char* tmp2;
	Int16 j, p, flagA;
	UInt16 i, l, m, h;
	Char tag[200], at[200], tmp[200];
	Boolean header, f;
	
	fpWAP = GetObjectPtr(ResponseDataField);
	if(FldGetTextLength(fpWAP)>0)
	{	hdTxt = FldGetTextHandle(fpWAP);
		cpTxtWAP = MemHandleLock(hdTxt);
		MemHandleUnlock(hdTxt);
	}	
	fc = MemHandleNew(8);
	fChar = MemHandleLock(fc);
	tt = MemHandleNew(200);
	tmp2 = MemHandleLock(tt);
	j = CutLine(cpTxtWAP);
	if(j>0) //j<0 Error because of bracket, j=0 Error because of no character in file
	{	
		header = CheckHeader();
		if(header)	//Error if header false
		{
			if(j>1)	//Error if it has only header
			{		
				CutBracket(j);
				for(i=1;i<=j-1;i++)
				{						
					if(st[i]==0)
						CleanString(Lines[i],i);			
					fChar = StrChr(Lines[i],' ');
					if((fChar!=NULL)&(st[i]!=0)&(st[i]!=4)) //this tag has attribute
					{							
						StrCopy(tag,Lines[i]);
						l =	FindChar(tag,' ');
						StrNCopy(tag,Lines[i],l);
						tag[l] = '\0';								
						StrCopy(tmp,Lines[i]+l+1);				
						StrCopy(Lines[i],tag);
						h = HSpace(tmp);
						StrCopy(at,tmp+h);			
						p = parseParms(at,i);
						if(p>0) //p<0 is Error
						{
							for(m=0;m<=p-1;m++)
							{	
								flagA = CheckAttr(TableAttr[m].attr);							
								if(flagA!=0)
								{																
									ShowMessage(DisplayAlert, "Error! ", TableAttr[m].attr, " illegal at that position or unknown attribute");	
									goto error;
								}												
							}// for parseParms					
						}
						else
							goto error;										
					}			
					StrCopy(tag,Lines[i]);
					StrCopy(Lines[i],tag);
				}// for loop					
				f = CheckOrder(j);
				if(f)
					//DrawPage();
					ShowMessage(DisplayAlert, "Sorry! ", "Under", " Construction");				
				else
					ShowMessage(DisplayAlert, "Error! ", "Maybe tag isn't match", " or task not in event.");
			}
			else
		 		ShowMessage(DisplayAlert, "Error!", " tag", " is illegal.");  		
		}//if header
		else
			ShowMessage(DisplayAlert, "Error!", " header", " is illegal.");
	}
	else if(j==0)
		ShowMessage(DisplayAlert, "Error!", " tag", " is illegal.");
	error:
		
	MemHandleUnlock(tt);
	MemHandleUnlock(fc);
}


void MainClearButtonFunc()
{
	FieldPtr fpWAP;
	
	fpWAP = GetObjectPtr(ResponseDataField);
	FldSetTextHandle(fpWAP, 0);
	FldDrawField(fpWAP);
}


/***********************************************************************
 *
 * FUNCTION:    GetObjectPtr
 *
 * DESCRIPTION: This routine returns a pointer to an object in the current
 *              form.
 *
 * PARAMETERS:  formId - id of the form to display
 *
 * RETURNED:    void *
 *
 * REVISION HISTORY:
 *
 *
 ***********************************************************************/
MemPtr GetObjectPtr(UInt16 objectID)
{
	FormPtr frmP;

	frmP = FrmGetActiveForm();
	return FrmGetObjectPtr(frmP, FrmGetObjectIndex(frmP, objectID));
}



