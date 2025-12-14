/***************************************************************************
                          Neuron.h  -  description
                             -------------------
    begin                : Tu Feb 25 2003
    copyright            : (C) 2003 by Nat
    email                : nat@localhost.localdomain
 ***************************************************************************/
//#include "invertID.h"
//int getID(int,int,int);
int getID(int ID, int allDay[],int numUser1)
{ int day=0;
  for (int i=1; i<numUser1; i++)
    if (ID > day && ID <= (day+allDay[i]))
      return i;
    else day += allDay[i];
}

double Random()
// Random weight and threshold in range
{ double c;
  c = rand()/double(RAND_MAX);
  if (c>0.24)
    c = (c/2)-0.24;
  else if ((rand()%2) == 0)
    c = -c;

  return c;
}

void initOutput(int id, int actY[], int output)
// Fix Output() = UserID;
{ int i,j;
  int invertBinary[output];
  for (i=0; i<output; i++)
  { invertBinary[i] = 0;
    actY[i] = 0;
  }
  for (i=0, j=0; id>0; i++)
  { invertBinary[i] = id%2;
    id = id/2;
    j++;
  }
  for (i=output,j= 0; j<output; j++)
    actY[--i] = invertBinary[j];


}



//-------------------------NEURON ----------------------///

 int neuron(double *x, double learn, int numUser, int numNeuron,int numInput, int numOutput,int allDay[])
{
  double w1[numInput][numNeuron]; // w1 = the weight in the first Layer.
  double w2[numNeuron][numOutput];  // w2 = the weight in the second Layer.
  double delW1[numInput][numNeuron];  // delW1 = old weight - new weight in the first Layer.
  double delW2[numNeuron][numOutput]; // delW2 = old weight - new weight in the second Layer.
  double y11[numNeuron];  // output in first layer
  double y2[numOutput]; // output in secound layer
  int actY[numUser][numOutput];
  double threshold1[numInput];    // threshold neural frist layer
  double threshold2[numNeuron];   // threshold neural second layer
  double delThreashold1[numInput];   // threshold neural frist layer
  double delThreashold2[numNeuron];  // threshold neural second layer

  double gradient1[numOutput];
  double gradient2[numOutput];
  double error[numUser][numOutput];
  double tempBound = 2.4/10;
  double sumError = 100;
  int i,j,k;
  FILE *stream;

  stream = fopen("Project","w");

  for (i=1; i<numUser; i++)
    for (j=1; j<numInput; j++)
      fprintf(stream,"x[%d][%d] %f\n",i,j,x[i*numInput+j]) ;


  for (i=1; i<numUser; i++)
  { initOutput(getID(i,allDay,numUser),actY[i],numOutput);
  }
  char buff[20];
  gets(buff);
  int actY1[numUser][numInput];
  for (int i=0; i<numUser; i++)
  { fprintf(stream,"\n %d output : ",i);
    for (int j=0; j<numOutput; j++)
    { fprintf(stream,"%i",actY[getID(i,allDay,numUser)][j]);
      actY1[i][j] = actY[i][j];
    }
  }

//-------------------------------------------------------//
// Step1: Innitial threshold and weight ////
//-------------------------------------------------------//
  srand((unsigned)time(NULL));
  // Random threshold neural frist layer
  for ( j=1; j<numInput; j++)
    threshold1[j] = Random();
  // Random threshold neural second layer
  for ( k=0; k<numNeuron; k++)
    threshold2[k] = Random();
  // Random weight neural frist layer
  for ( i=1; i<numInput; i++)
    for (j=0; j<=numNeuron; j++)
      w1[i][j] = Random();
  // Random weight neural second layer
  for ( j=0; j<numNeuron; j++)
    for ( k=0; k<=numOutput; k++)
      w2[j][k] = Random();


//*++++++++++++++++++++++++Print Init Weight and Threshold on File+++++++++++++++++++

  fprintf(stream,"=========================== Initialize ==============================\n");
  fprintf(stream,"Initialize Weight (Hidden Layer) =\n");
  for(i=1 ; i<numInput ; i++){
    fprintf(stream,"[%d]",i);
    for(j=0 ; j<numOutput ; j++)
      fprintf(stream,"[%d] %f",j,w1[i][j]);
    fprintf(stream,"\n");
  }
  fprintf(stream,"Initialize Weight (Output Layer) =\n");
  for(j=0 ; j<numNeuron ; j++){
    fprintf(stream,"[%d]",j);
    for(k=0 ; k<numOutput ; k++)
      fprintf(stream,"(%d)%f",k,w2[j][k]);
    fprintf(stream,"\n");
  }
  fprintf(stream,"Initialize Threshold (Hidden Layer) =\n");
  for(j=0 ; j<numNeuron ; j++)
  fprintf(stream,"(%d)%f ",j,threshold1[j]);
  fprintf(stream,"\n");
  fprintf(stream,"Initialize Threshold (Output Layer) =\n");
  for(k=0 ; k<numOutput ; k++)
  fprintf(stream,"(%d)%f ",k,threshold2[k]);
  fprintf(stream,"\n");
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  int count = 0;
  int iteration ;



while(sumError>0.01){
  count++;
  fprintf(stream,"\n");
  fprintf(stream,"==================== EPOCH : %d ==========================\n",count);
  cout<<"==================== EPOCH : "<<count<<" =========================="<<endl;
for(iteration=0 ; iteration<numUser ; iteration++){
//----------------------------------------------------------------------//
//  Step 2 : Activateion, activate the back-propagatin neural network
//----------------------------------------------------------------------//

  for (j=0; j<numNeuron; j++)
    y11[j]=0;
  for (k=0; k<numOutput; k++)
    y2[k]=0;
// Calculate the actual outputs of the neurons in the hidden layer;
// y = sigmoid[sumi(xi*wij-thresholdj]
  for ( j=0; j<numNeuron; j++)
    for ( i=1; i<numInput; i++)
    {  y11[j] += x[iteration*numInput+i]*w1[i][j];
/////////////////////////////////////////////////////    
//      cout<<i<<","<<j<<" "<<y11[j]<<" "<<x[iteration*numInput+i]<<endl;
    }
  for ( j=0; j<numNeuron; j++)
    y11[j] = y11[j]-threshold1[j];
  for ( j=0; j<numNeuron; j++)
    y11[j] = 1/(1+exp(-y11[j])); //sigmoid activation function

// Calculate the actual output of the neurons in the output layer;
//  cout<<"Weight cal output "<<w1[0]<<endl;
  for ( k=0; k<numOutput; k++)
    for ( j=0; j<numNeuron; j++)
      y2[k] += y11[j]*w2[j][k];
  for ( k=0; k<numOutput; k++)
    y2[k] = y2[k]-threshold2[k];
  for ( k=0; k<numOutput; k++)
    y2[k]=1/(1+exp(-y2[k]));

//-------------------------------------------------------------------------//
// Step 3 : Weight training, Update the weight in the back-propagation network propagating
//       backward the <=s asscoiated with output neurons.
//-------------------------------------------------------------------------//
// Calculate the <= gradient for the neurons in the output layer:
  for ( k=0; k<numOutput; k++)
    error[iteration][k] = 0;
    gradient2[k] = 0;
  for ( j=0; j<numNeuron; j++)
    gradient1[j] = 0;
// find error

  for ( k=0; k<numOutput; k++){
    error[iteration][k] = actY1[iteration][k]-y2[k];
     gradient2[k] =y2[k]*(1-y2[k])*error[iteration][k];
  }

// Calculate the weight corrections
  for ( j=0; j<=numNeuron; j++)
    for ( k=0; k<=numOutput; k++)
      delW2[j][k] = learn*y2[j]*gradient2[k];// Error gradient

//Update weight at the output neurons
  for ( j=0; j<=numNeuron; j++)
    for ( k=0; k<=numOutput; k++)
      w2[j][k] = w2[j][k]+delW2[j][k];
//Calculate the delta threshold in the hidden layer
  for ( k=0; k<numOutput; k++)
    delThreashold2[k]=learn*(-1)*gradient2[k];

// Calculate the error gradient for the neurons in the hidden layer:
  double sum;
  for ( j=0; j<numNeuron; j++){
    sum=0;
    for ( k=0; k<numOutput; k++)
      sum += gradient2[k]*w2[j][k];
    gradient1[j] = y11[j]*(1-y11[j])*sum;
  }

// Calcute the delta weight corrections in hidden layer
  for ( i=1; i<numInput; i++)
    for ( j=0; j<numNeuron; j++)
      delW1[i][j]=learn*x[iteration*numInput+i]*gradient1[j];
  for ( j=0; j<numNeuron; j++)
    delThreashold1[j]=learn*(-1)*gradient1[j];
// Last update weight and threshold
  for ( i=1; i<numInput; i++)
    for ( j=0; j<numNeuron; j++)
      w1[i][j] = w1[i][j]+delW1[i][j];
  for ( j=0; i<numNeuron; i++)
    for ( k=0; j<numOutput; j++)
      w2[j][k] = w2[j][k]+delW2[j][k];
  for ( i=1; i<=numInput; i++)
    threshold1[i] = threshold1[i]+delThreashold1[i];
  for ( j=0; j<=numNeuron; j++)
    threshold2[j] = threshold2[j]+delThreashold2[j];
}

//--------------------------------------------------------------
// STEP 4 : Iteration
//--------------------------------------------------------------
  double temp = sumError;
  sumError = 0;
  for ( i=1; i<numUser; i++)
    for ( j=0; j< numOutput ; j++){
      sumError = sumError + pow(error[i][j], 2);

  }

  cout<<"Sum of squared errers = "<<sumError<<endl;
}

  fprintf(stream,"======================= Final Weight & Threshold =========================\n");
  fprintf(stream,"New Weight (Hidden Layer) =\n");
  for(i=0 ; i<numInput ; i++){
   for(j=0 ; j<numNeuron ; j++)
      fprintf(stream,"w1[%d][%d] = %f;\n",i,j,w1[i][j]);
  }

  for(j=0 ; j<numNeuron ; j++){
    for(k=0 ; k<numOutput ; k++)
      fprintf(stream,"w2[%d][%d] = %f;\n",j,k,w2[j][k]);
  }

  for(j=0 ; j<numInput ; j++)
    fprintf(stream,"threshold1[%d] = %f;\n",j,threshold1[j]);
  fprintf(stream,"New Threshold (Output Layer) =\n");
  for(k=0 ; k<numNeuron ; k++)
    fprintf(stream,"threshold2[%d] = %f;\n",k,threshold2[k]);
  fclose(stream);


  FILE *weight_thres;
  weight_thres = fopen("Weight_threshold","w");
    fprintf(weight_thres,"#======================= Final Weight & Threshold =========================\n");
  fprintf(weight_thres,"#New Weight (Hidden Layer) =\n");
  for(i=0 ; i<numInput ; i++){
   for(j=0 ; j<numNeuron ; j++)
      fprintf(weight_thres,"w1\t%d\t%d\t%f\n",i,j,w1[i][j]);
  }

  for(j=0 ; j<numNeuron ; j++){
    for(k=0 ; k<numOutput ; k++)
      fprintf(weight_thres,"w2\t%d\t%d\t%f\n",j,k,w2[j][k]);
  }

  for(j=0 ; j<numInput ; j++)
    fprintf(weight_thres,"threshold1\t%d\t%f\n",j,threshold1[j]);

  fprintf(weight_thres,"#New Threshold (Output Layer) =\n");

  for(k=0 ; k<numNeuron ; k++)
    fprintf(weight_thres,"threshold2\t%d\t%f;\n",k,threshold2[k]);
  fclose(stream);

}