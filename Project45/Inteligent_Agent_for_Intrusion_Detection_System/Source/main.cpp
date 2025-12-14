/***************************************************************************
                          main.cpp  -  description
                             -------------------
    begin                : Thu Mar 24 14:20:06 ICT 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/
#include <iostream.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#include "getCol.h"
#include "getNameID.h"
#include "fuzzy.h"
#include "inputNeuron.h"
#include "Neuron.h"
#include "invertID.h"
#include "checkHacker.h"

#define numInput 85+1
#define numNeuron 100
#define numOutput 6
#define numUser 5+1
#define range 50
#define shareRange 0.2
       

int findNum(char);
int findID(char);
double fuzzy(int, int);     // (frequence,range,shareRange)

void returnEachCol4(char,char,int,int,double);
void returnEachCol3(char,char,int,double);
void neuron(double, double ,int, int, int, int,int);

int main()
{ int i,j;
  char data[20];
  double learn = 0.1;
  char real2[numUser][15];
  int allDay[numUser];
  int sumDay;
  sumDay = 0;
  getNameFileID(real2,numUser);
//  cout<<real2[3];
  inputNeuronForCheck(real2,numInput,numUser);
  checkHacker(numUser,numNeuron,numInput,numOutput);

  gets(data);
  ave_fuzzy(real2, numInput, numUser,allDay);
 // gets(data);
  for (i=1; i<numUser; i++)
  {  sumDay += allDay[i];
   }
  sumDay++;

    FILE *ipNeuron;
  double ioNeuron[sumDay+1][numInput];
  char one[20];
  int two=0,three=0;
  double four;

// Clear ioNeron;
  for (i=0; i<sumDay; i++)
    for (j=0; j<numInput; j++)
      ioNeuron[i][j] = 0;

  ipNeuron = fopen("inputNeuron","r");
  while ( feof(ipNeuron) == 0 && two < sumDay)
  { fgets(data,30,ipNeuron);
  //  cout<<data<<endl;
    if (strstr(data,"#") == 0)
    { returnEachCol4(data,one,two,three,four);
      if ((strcmp(data,"ioNeuron")) && (three < numInput))
        ioNeuron[two][three] = four;
    }
  }
  fclose(ipNeuron);
  neuron(&ioNeuron[0][0],learn,sumDay,numNeuron,numInput,numOutput,allDay);
  return EXIT_SUCCESS;
}
