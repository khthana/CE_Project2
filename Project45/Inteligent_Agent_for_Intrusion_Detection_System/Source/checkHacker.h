/***************************************************************************
                          checkHacker.h  -  description
                             -------------------
    begin                : Tue Mar 25 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/

void checkHacker(int numUser1,int numNeuron1, int numInput1, int numOutput1)
{ int i,j,k;
  FILE *weight_thres,*ipNeuron;
  char data[30];
  char one[20];
  int two=0,three=0;
  double four;
  bool col4 = true;

  double w1[numInput1][numNeuron1]; // w1 = the weight in the first Layer.
  double w2[numNeuron1][numOutput1];  // w2 = the weight in the second Layer.

  double y11[numNeuron1];  // output in first layer
  double y2[numOutput1]; // output in secound layer

  double threshold1[numInput1];    // threshold neural frist layer
  double threshold2[numNeuron1];   // threshold neural second layer

  bool hack;
  hack = false;
  
//Get weight and threshold to parameter
  weight_thres = fopen("Weight_threshold","r");
  while ( feof(weight_thres) == 0 )
  { fgets(data,30,weight_thres);
    if (strstr(data,"#"))
    { if (strstr(data,"Weight") ) col4 = true;
      else if (strstr(data,"Threshold") ) col4 = false;
    }
    else
    { if (col4)
      { returnEachCol4(data,one,two,three,four);
        if ((strstr(data,"w1")))
        { w1[two][three] = four;

        }
        else if ((strstr(data,"w2")))
        { w2[two][three] = four;

        }
      }
      else
      { returnEachCol3(data,one,two,four);
        if ((strstr(data,"threshold1")))
        { threshold1[two] = four;

        }
        else if ((strstr(data,"threshold2"))) threshold2[two] = four;
      }
    }
  }
///Get inputNeuron for checking Hacker
///Read parameter for inputNeuron
  FILE *hacker,*mailfile;
  
  double ioNeuron[numUser1][numInput1];
  cout<<"############ Intrusion Log ############"<<endl;
  

// Clear ioNeron;
  for (i=0; i<numUser1; i++)
    for (j=0; j<numInput1; j++)
      ioNeuron[i][j] = 0;

  ipNeuron = fopen("ipNeuronForCheck","r");
  two =0;
  while ( (feof(ipNeuron) == 0) && (two < numUser1))
  { fgets(data,30,ipNeuron);
    if (!strstr(data,"#"))
    { returnEachCol4(data,one,two,three,four);
      if ((strstr(data,"ioNeuron")) && (three < numInput1))
      {  ioNeuron[two][three] = four;
      }
    }
  }

  fclose(ipNeuron);
  char tmpDay[30];
  char *p;
  mailfile = fopen("mailfile","w");
  fprintf(mailfile,"Intrusion detection system found that\n\n");
  fclose(mailfile);
  time_t rawtime; 
for (int n=1; n<numUser1; n++)
// Calculate the actual outputs of the neurons in the hidden layer;
// y = sigmoid[sumi(xi*wij-thresholdj]
{ for ( j=0; j<numNeuron1; j++)
    for ( i=1; i<numInput1; i++)
      y11[j] += ioNeuron[n][i]*w1[i][j];
  for ( j=0; j<numNeuron1; j++)
    y11[j] = y11[j]-threshold1[j];
  for ( j=0; j<numNeuron1; j++)
    y11[j] = 1/(1+exp(-y11[j])); //sigmoid activation function

// Calculate the actual output of the neurons in the output layer;
  for ( k=0; k<numOutput1; k++)
    for ( j=0; j<numNeuron1; j++)
      y2[k] += y11[j]*w2[j][k];
  for ( k=0; k<numOutput1; k++)
    y2[k] = y2[k]-threshold2[k];
  for ( k=0; k<numOutput1; k++)
    y2[k]=1/(1+exp(-y2[k]));

  
  int actY[numOutput1];
  initOutput(n,actY,numOutput1);
  for (i=0; i<numOutput1; i++)
  { if (y2[i] <= 0.5)
      y2[i] = 0;
    else
      y2[i] =1;
    if (actY[i] != y2[i])
    { invertID(n,data);
      time(&rawtime);
      strcpy(tmpDay,ctime(&rawtime));
      p = strchr(tmpDay,'\n') ;
      tmpDay[p-tmpDay] = '\t';
      cout<<tmpDay<<data<<endl;
      hacker = fopen("Hacker","a");
      fprintf(hacker,"%s%s\n",tmpDay,data);
      fclose(hacker);
      mailfile = fopen("mailfile","a");
      fprintf(mailfile,"%s%s\n",tmpDay,data);
      fclose(mailfile);
      hack = true;
      break;
    }
  }
   
  
}
  if (hack)
  { 
    mailfile = fopen("mailfile","a");
    fprintf(mailfile,"\nPlease check that user profile");
    fclose(mailfile);
    system("mail -s 'Intrusion Alert!!' 's2010176@kmitl.ac.th' < mailfile");
  }
  else
  { cout<<"Not found anomaly behavior."<<endl;
  }
}