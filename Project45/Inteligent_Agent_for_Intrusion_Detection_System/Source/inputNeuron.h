/***************************************************************************
                          inputNeuron.h  -  description
                             -------------------
    begin                : Thu Mar 20 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/

int findNum(char);
int findID(char); 
void Find_Max(int MaxNumUse[], char real2[][15], int numNode,int numUser1)
{ int i,j,k;
  FILE *User;
  char data[25];
  int tmp[numNode];
  char tmp2[numUser1][15];
  for (i=0; i<numNode; i++)
    MaxNumUse[i] = 0;
 int node, num;

  for (k=1; k<numUser1; k++)
  { User = fopen(real2[k],"r"); // opent File user
    while (feof(User) == 0 )
    { fgets(data,25,User);
      if ((strstr(data,"#") == NULL  )) //  count Date
      { node = findID(data);
        num = findNum(data);
         if (num > MaxNumUse[node])
          MaxNumUse[node] = num;
      
       }
    }
    fclose(User);

  }

 
  FILE *stream;
  stream = fopen("MaxNumUse","w");
  for (i=1; i<numNode; i++)
    fprintf(stream,"%d\t%i\n",i,MaxNumUse[i]);
  fclose(stream);

}

// File average per node and do Fuzzy
// pre-- realID = "URSE/s2010169", inputNeuron = return reference after do fuzzy
// numNode = numInput;
//void ave_fuzzy(int numNode, int numUser1)
void ave_fuzzy(char real2[][15],int numNode, int numUser1,int allDay[])
{ int i,j;
  FILE *stream, *input;
  char data[25];
  double inputNeuron[numNode];
  int tmp1, MachineID;
  double tmp;
  int MaxNumUse[numNode];

// init all date
  for (i=0; i<numUser1; i++)
    allDay[i] = 0;
  MachineID = 1;
  Find_Max(MaxNumUse,real2,numNode,numUser1);
  input = fopen("inputNeuron","w");
  fclose(input);
  int numDate;
  double fuzzy_tmp[15][numNode];
  
  for (i=1; i<numUser1; i++)
  {  stream = fopen(real2[i],"r");  // opent File user
      numDate=0;
    for (int d=1; d<=14; d++)
     for (j=0; j<numNode; j++)
     {  fuzzy_tmp[d][j] = 0;
     }
    
    fgets (data,25,stream);
    //Get sum of fuzzy per Node
    while (feof(stream) == 0 && numDate<=14)
    { fgets(data,25,stream);
      if (strstr(data,"#") != NULL) //  count Date
      { numDate++;
      }
      else
      {  tmp1 = findID(data);
        fuzzy_tmp[numDate][tmp1] = fuzzy(findNum(data),MaxNumUse[tmp1]);  //get sumpernode
         }
    }
        allDay[i] = numDate;
  
    // Get parameter in inputNeuron File
  
    input = fopen("inputNeuron","a");
    fprintf(input,"ioNeuron\t%i\t0\t%i\n",i,numDate);

    for (int d=1; (d<=numDate && d <= 14); d++)
    { for (j=1; j<numNode; j++)
      {    fprintf(input,"ioNeuron\t%i\t%d\t%f\n",MachineID,j,fuzzy_tmp[d][j]);

      }
      MachineID++;
    }
    fclose(input);
   }
}


void inputNeuronForCheck(char real2[][15],int numNode, int numUser1)
{ int i=0,j=0;
  int tmp1;
  FILE *stream,*input;
  char data[25];
  double ioNeuron[numUser1][numNode];
  int MaxNumUse[numNode];
  //init ioNeuron
  for (i=0; i<numUser1; i++)
    for (j=0; j<numNode; j++)
    { ioNeuron[i][j] = 0;
    }           
///// Get parameter MaxNumUse from file "MaxNumUse"
  stream = fopen("MaxNumUse","r");
  for(i=0; (i<numNode && (feof(stream) == 0)); i++)
  { fgets(data,25,stream);
    MaxNumUse[findID(data)] = findNum(data);
  }
  
  for (i=1; i<numUser1; i++)
  { stream = fopen(real2[i],"r");  // opent File user
    fgets(data,25,stream);
    //Get sum of fuzzy per Node
    bool frist = false;
    while (feof(stream) == 0)
    { fgets(data,25,stream);
      if (strstr(data,"#") <= 0)
      { tmp1 = findID(data);
        ioNeuron[i][tmp1] = fuzzy(findNum(data),MaxNumUse[tmp1]);
      }
      else
      { if (frist) break;
        frist = true;
      }
    }
    

  }
  input = fopen("ipNeuronForCheck","w");
  for (i=1; i<numUser1; i++)
    for (j=1; j<numNode; j++)
      fprintf(input,"ioNeuron\t%d\t%d\t%f\n",i,j,ioNeuron[i][j]);
  
  fclose(input);
}