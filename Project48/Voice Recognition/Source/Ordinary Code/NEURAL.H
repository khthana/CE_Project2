#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <math.h>			//For tanh

int filesize(char *filename);
char * myread(char *filename);
float m[39][27];
char * pEnd;

FILE *stream;

// returns a float in the range -1.0f -> - 1.0f
#define RANDOM_CLAMP    (((float)rand()-(float)rand())/RAND_MAX)

//returns a float between 0 & 1
#define RANDOM_NUM		((float)rand()/(RAND_MAX+1))

using namespace std;

//*************************************************************************************************

class Dendrite {
	public:       
		double d_weight;											//Weight of the neuron
        unsigned long d_points_to;									//The index of the neuron of the next layer to which it points
               
		Dendrite(double weight=0.0, unsigned long points_to=0){		//Constructor               
			d_weight    = weight;		
			d_points_to = points_to;								//Give it a initial value      
		}  
};

//*************************************************************************************************

class Neuron  {  
	public: 
		unsigned long n_ID;		//ID of a particular neuron in a layer
								//Used to find a particular neuron in an array
	    double n_value;			//Value which Neuron currently is holding
	    double n_bias;			//Bias of the neuron
        double n_delta;			//Used in back  prop. Note it is backprop specific
        
		Dendrite *Dendrites;	//Dendrites
      
		//Constructor assigning initial values
	    Neuron(unsigned long ID=0,double value=0.0,double bias=0.0){          
			n_ID    = ID;
            n_value = value;
            n_bias  = bias;
            n_delta = 0.0;         
		}

        void SetDendrites(unsigned long dendrite){		//Set the dendrites from the neuron to given dendrite  
			Dendrites=new Dendrite[dendrite];
  
			for(int i=0;i<dendrite;i++){     
				Dendrites[i].d_points_to=i;				// Initialize the dendrite to attach to next layer          
			}
		}

};

//*************************************************************************************************

class Layer{     
	public:     
		Neuron *Neurons;							//Pointer to array of neurons

		/*Layer(unsigned long size=1){				//size is no. of neurons in it
			Neurons = new Neuron [size];
		}  */
     
		void Initialize(unsigned long size) {		//Initialize the layer        
			Neurons = new Neuron [size];            
		}
    
		~Layer(){									//destructor deletes Neurons from the memory    
			delete Neurons;  	 
		}
     
		Neuron GetNeuron(unsigned long index){		//Give the neuron at index          
			return Neurons[index];                               	 
		}
     
		void SetNeuron(Neuron neuron,unsigned long index){		//sets the neuron        
			Neurons[index]=neuron;       	 
		}

};

//*************************************************************************************************

class Network {							//***** The real neural network *****      
	public:  
		
		double net_learning_rate;		//Learning rate of network
        Layer *Layers;					//The total layers in network
        unsigned long net_tot_layers;	//Number of layers
        double *net_inputs;				//Input array
        double *net_outputs;			//Output layers
        unsigned long *net_layers;		//Array which tells no. of neurons in each layer
             
		//double GetRand(void);
             
		Network() {
        //Blank Constructor     
		}

		//*********************************************************************
		//--------------------------- Load Weight  ----------------------------
		
		void LoadWBij (void) {  

			char* aa;
			string axx,str;
			aa = "WEIGHTij.txt";			
											
			string constructorString (myread(aa));

			int x = 0;
			int y = 0;
			int count1 = 0;

			axx = myread("WEIGHTij.txt");												

 			const char* str2;
	 
			int j=0,k=0;
			
			for(int s = 0; s < filesize("WEIGHTij.txt"); s++){							
				if ( constructorString[s] != '\t' && constructorString[s] != '\n' ){x++;}		
				else {		
					if (constructorString[s] == '\n')		
						x = x-1;
				
					str	= axx.substr(y,x);		
					str2= str.c_str();					// const char	
					
					float 	tempMatrix = atof(str2);		
			
					Layers[0].Neurons[k].Dendrites[j].d_weight	= tempMatrix;					//**											//**	
		
					y = y+x+1;		
					x = 0;
							
					k++;
			
					if(k==net_layers[0])														//**
					{		
						j++;
						k=0;
					};

					if (constructorString[s] == '\n')		
						y = y+1;
					
					count1++;			//
				}		
			}
			cout << "weight IJ = " << count1 << "\n";
		}
		//---------------------------------------------------------------------
		void LoadWBjk (void) {  

			char* aa;
			string axx,str;
			aa = "WEIGHTjk.txt";														

			string constructorString (myread(aa));

			int x = 0;
			int y = 0;
			int count2 = 0;

			axx = myread("WEIGHTjk.txt");												

 			const char* str2;
	 
			int j=0,k=0;
			
			for(int s = 0; s < filesize("WEIGHTjk.txt"); s++){	
				if ( constructorString[s] != '\t' && constructorString[s] != '\n' ){x++;}		
				else {		
					if (constructorString[s] == '\n')		
						x = x-1;
				
					str	= axx.substr(y,x);		
					str2= str.c_str();					// const char	
					
					float 	tempMatrix = atof(str2);		
			
					Layers[1].Neurons[k].Dendrites[j].d_weight	= tempMatrix;															//**	
		
					y = y+x+1;		
					x = 0;
							
					k++;
			
					if(k==net_layers[1])													
					{		
						j++;
						k=0;
					};

					if (constructorString[s] == '\n')		
						y = y+1;

					count2++;
				}		
			}
			cout << "weight JK = " << count2 << "\n";
		}
		//---------------------------------------------------------------------
		void LoadBiasJ (void) {  

			char* aa;
			string axx,str;
			aa = "BiasJ.txt";														

			string constructorString (myread(aa));

			int x = 0;
			int y = 0;
			int count2 = 0;

			axx = myread("BiasJ.txt");												

 			const char* str2;
	 
			int j=0,k=0;
			
			for(int s = 0; s < filesize("BiasJ.txt"); s++){	
				if ( constructorString[s] != '\t' && constructorString[s] != '\n' ){x++;}		
				else {		
					if (constructorString[s] == '\n')		
						x = x-1;
				
					str	= axx.substr(y,x);		
					str2= str.c_str();					// const char	
					
					float 	tempMatrix = atof(str2);		
			
					Layers[1].Neurons[k].n_bias	= tempMatrix;															//**	
		
					y = y+x+1;		
					x = 0;
							
					k++;
			
					if(k==net_layers[1])													
					{		
						j++;
						k=0;
					};

					if (constructorString[s] == '\n')		
						y = y+1;

					count2++;
				}		
			}
		//	cout << "weight JK = " << count2 << "\n";
		}
		//---------------------------------------------------------------------
		void LoadBiasK (void) {  

			char* aa;
			string axx,str;
			aa = "BiasK.txt";														

			string constructorString (myread(aa));

			int x = 0;
			int y = 0;
			int count2 = 0;

			axx = myread("BiasK.txt");												

 			const char* str2;
	 
			int j=0,k=0;
			
			for(int s = 0; s < filesize("BiasK.txt"); s++){	
				if ( constructorString[s] != '\t' && constructorString[s] != '\n' ){x++;}		
				else {		
					if (constructorString[s] == '\n')		
						x = x-1;
				
					str	= axx.substr(y,x);		
					str2= str.c_str();					// const char	
					
					float 	tempMatrix = atof(str2);		
			
					Layers[2].Neurons[k].n_bias	= tempMatrix;															//**	
		
					y = y+x+1;		
					x = 0;
							
					k++;
			
					if(k==net_layers[1])													
					{		
						j++;
						k=0;
					};

					if (constructorString[s] == '\n')		
						y = y+1;

					count2++;
				}		
			}
			//cout << "weight JK = " << count2 << "\n";
		}

		//*********************************************************************

		void InitWB(void){							//Randomize weights and biases     
			int i,j,k;

			for(i=0;i<net_tot_layers;i++){          
				for(j=0;j<net_layers[i];j++){             
					if(i!=(net_tot_layers-1)){			//Last layer does not require weights               
						Layers[i].Neurons[j].SetDendrites(net_layers[i+1]);			//Initialize the dendites
						for(k=0;k<net_layers[i+1];k++){                
							Layers[i].Neurons[j].Dendrites[k].d_weight=GetRand();	//Let weight be the random value			   
						} 			  
					} 			  
					if(i!=0){							//First layer does not need biases			  
						Layers[i].Neurons[j].n_bias=GetRand(); 			  
					}       		  
				}             
			}       	 
		}


		//*********************************************************************

		//----------------------------- Record file ----------------------------- 

		void ReccordWBij(void){
	
			stream = fopen( "WEIGHTij.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{	
				for (int j=0;j<net_layers[1];j++){													
					for(int k=0;k<net_layers[0];k++){													
						fprintf( stream, "%f", Layers[0].Neurons[k].Dendrites[j].d_weight);			
						if ( k != net_layers[0] -1)													
							fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}
		}
	  
		//*********************************************************************
				
		void ReccordWBjk(void){
		
			stream = fopen( "WEIGHTjk.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{	
				for (int j=0;j<net_layers[2];j++){													
					for(int k=0;k<net_layers[1];k++){													
						fprintf( stream, "%f", Layers[1].Neurons[k].Dendrites[j].d_weight);			
						if ( k != net_layers[1] -1)													
							fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}
		}
	  
		//*********************************************************************

		void ReccordBiasJ(void){
		
			stream = fopen( "BiasJ.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{	
				for (int j=0;j<1;j++){													
					for(int k=0;k<net_layers[1];k++){													
						fprintf( stream, "%f", Layers[1].Neurons[k].n_bias);			
						if ( k != net_layers[1] -1)													
							fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}
		}

		//*********************************************************************

		void ReccordBiasK(void){
		
			stream = fopen( "BiasK.txt", "w+" );
   
			if( stream == NULL )printf( "The file fscanf.out was not opened\n" );
			else{	
				for (int j=0;j<1;j++){													
					for(int k=0;k<net_layers[2];k++){													
						fprintf( stream, "%f", Layers[2].Neurons[k].n_bias);			
						if ( k != net_layers[2] -1)													
							fprintf( stream, "%s","\t");
					}
					fprintf( stream, "%s","\n");
				}
				fclose( stream );
			}
		}

		//*********************************************************************

		int SetData(double learning_rate,unsigned long layers[],unsigned long tot_layers) {	//Function to set various parameters of the net     
			if (tot_layers<2) return(-1);					//Return error if total no. of layers < 2
															//Because input and output layers are necessary
            net_learning_rate=learning_rate;
            net_layers= new unsigned long [tot_layers];		//Initialize the layers array
            Layers=new Layer[tot_layers];
            
			for(int i=0;i<tot_layers;i++){         
				net_layers[i]=layers[i];          
				Layers[i].Initialize(layers[i]);			//Initialize each layer with the specified size             
			}
                 
			net_inputs=new double[layers[0]];     
			net_outputs=new double[layers[tot_layers-1]];     
			net_tot_layers=tot_layers;
                 
			return 0;         
		}
		
		//---------------------- Load Input to neurons ------------------------

		int SetInputs(double inputs[]){					//Function to set the inputs     
			for(int i=0;i<net_layers[0];i++){         
				Layers[0].Neurons[i].n_value=inputs[i];             
			}             
			return 0;
		}  

		//--------------------- Return output to compare ----------------------
   
		double * GetOutput(void){								//Gives the output of the net      
			double *outputs;   
			int i,j,k;
   
			outputs=new double[net_layers[net_tot_layers-1]];	//Temp ouput array
    
			for(i=1;i<net_tot_layers;i++){      
				for(j=0;j<net_layers[i];j++){   
					Layers[i].Neurons[j].n_value=0;   
					for(k=0;k<net_layers[i-1];k++){      
						Layers[i].Neurons[j].n_value=Layers[i].Neurons[j].n_value+Layers[i-1].Neurons[k].n_value*Layers[i-1].Neurons[k].Dendrites[j].d_weight; //Multiply and add all the inputs     
					}         
					Layers[i].Neurons[j].n_value=Layers[i].Neurons[j].n_value+Layers[i].Neurons[j].n_bias;	//Add bias
					Layers[i].Neurons[j].n_value=Limiter(Layers[i].Neurons[j].n_value);						//Squash that value          
				}              
			}
                    
			for(i=0;i<net_layers[net_tot_layers-1];i++){							// output of output layer
				outputs[i]=Layers[net_tot_layers-1].Neurons[i].n_value;             
			}
                                
			return outputs;		//Return the outputs                  
		}
   
		void Update(void){		//Just a dummy function    

            GetOutput();
        
		}

		//---------------------------------------------------------------------

		double ChkStop (double target[]){
			double Target, Actual, Delta;

			Target=target[0];						//Target value            
			Actual=Layers[2].Neurons[0].n_value;	//Actual value            
			Delta= abs(Target - Actual);

			return Delta;
		}
  
		double Limiter(double value){		//Limiet to limit value between 1 and -1 (sigmoid function)   
			//return tanh(value);			//Currently using tanh
            return (1.0/(1+exp(-value)));         
			//return ((3.432/(1+exp(-(0.667*value))))-1.716);
		}

		double GetRand(void){			//Return a random number between range -1 to 1 using time to seed the srand function   
			time_t timer;				//Represents time values in mktime and time ->long integer      
			struct tm *tblock;			//Used by asctime, gmtime, _gmtime64, localtime, 
										//_localtime64, mktime, _mktime64, and strftime to store and retrieve time information
            timer=time(NULL);
            tblock=localtime(&timer);
            int seed=int(tblock->tm_sec+100*RANDOM_CLAMP+100*RANDOM_NUM);
            //srand(tblock->tm_sec);
            srand(seed);
            return ((RANDOM_CLAMP+RANDOM_NUM)/286);            
		}
   
		double SigmaWeightDelta(unsigned long layer_no, unsigned long neuron_no){	//Calculate sum of weights * delta. 
																					//Used in back prop. layer_no is layer number. 
																					//Layer number and neuron number can be zero      
			double result=0.0;     
			
			for(int i=0;i<net_layers[layer_no+1];i++) {								//Go through all the neurons in the next layer       
				result=result+Layers[layer_no].Neurons[neuron_no].Dendrites[i].d_weight*Layers[layer_no+1].Neurons[i].n_delta; //Comput the summation           
			}
                 
			return result;          
		}																			//neuron_no is neuron number. This function is used in back prop

		//---------------------------------------------------------------------

		int Train(double inputs[],double outputs[]){			//The standard Backprop Learning algorithm   
			int i,j,k;
            double Target, Actual, Delta;

			SetInputs(inputs);									//Set the inputs
            
			Update();											//Update all the values
            
			//SetOutputs(outputs);								//Set the outputs
            for(i=net_tot_layers-1;i>0;i--){					//Go from last layer to first layer   
				for(j=0;j<net_layers[i];j++) {					//Go thru every neuron   
					if(i==net_tot_layers-1){					//***Weight training in Output layer, Needs special atential 
						Target=outputs[j];						//Target value
                        Actual=Layers[i].Neurons[j].n_value;	//Actual value
                        Delta= (Target - Actual) * Actual * (1 - Actual); //Function to compute error
                        Layers[i].Neurons[j].n_delta=Delta;		//Compute the delta
                        for(k=0;k<net_layers[i-1];k++) {  
							Layers[i-1].Neurons[k].Dendrites[j].d_weight += Delta*net_learning_rate*Layers[i-1].Neurons[k].n_value;		//Calculate the new weights       
						}   
						Layers[i].Neurons[j].n_bias = Layers[i].Neurons[j].n_bias + Delta*net_learning_rate*1;							//n_value is always 1 for bias   

					} 
					else {										//In Hidden layer
																//Target value   
						Actual=Layers[i].Neurons[j].n_value;	//Actual value
                        Delta=  Actual * (1 - Actual)* SigmaWeightDelta(i,j);	//Function to compute error
                        for(k=0;k<net_layers[i-1];k++){   
							Layers[i-1].Neurons[k].Dendrites[j].d_weight += Delta*net_learning_rate*Layers[i-1].Neurons[k].n_value; //Calculate the new weights   
						}
						if(i!=0)								//Input layer does not have a bias
							Layers[i].Neurons[j].n_bias = Layers[i].Neurons[j].n_bias+ Delta*net_learning_rate*1; //n_value is always 1 for bias   
					} 
					
				} 
			} 

			return 0;         
		}
         
//		~Network(){ delete Layers; }

};

//*************************************************************************************************

void RECOGNITION(Matrix buff){ 

      Network my;

      unsigned long inp=646;
      unsigned long hid=20;
      unsigned long outp=10;
      unsigned long layers[3];
      
	  layers[0]=inp;								
      layers[1]=hid;
      layers[2]=outp;
      
	  int i=0,j=0,k=0;

	  //double input[]={1,0};
	  double *outputs;

      unsigned long iter=0;
      
	  my.SetData(0.2,layers,3);						

	  my.InitWB();

      double tr_inp[101][646];
	  
	  //double buff[38][17];
	  double test[1][646];				

	  double cmd[10][10]  =		{	{1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0},
									{0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0},
									{0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0},
									{0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0},
									{0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0},
									{0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0},
									{0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0},
									{0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0},
									{0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0},
									{0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0}};

	  char ch;

	  cout << "Start Loading Data...\n\n";

	  //*****************************************
	  for(i=0 ; i<1 ; i++){
			char* aa;
			string axx,str;
			aa = "tr_input.txt";			
											
			string constructorString (myread(aa));

			int x = 0;
			int y = 0;

			axx = myread("tr_input.txt");												

 			const char* str2;
	 
			int j=0;k=0;
			
			for(int s = 0; s < filesize("tr_input.txt"); s++){							
				if ( constructorString[s] != '\t' && constructorString[s] != '\n' ){x++;}		
				else {		
					if (constructorString[s] == '\n')		
						x = x-1;
				
					str	= axx.substr(y,x);		
					str2= str.c_str();					// const char	
					
					float 	tempMatrix = atof(str2);		
			
						tr_inp[j][k]	= tempMatrix;					
		
					y = y+x+1;		
					x = 0;
							
					k++;
			
					if(k==647)						
					{		
						j++;
						k=0;
					};

					if (constructorString[s] == '\n')		
						y = y+1;
					
				}		
			}
	  }
	  //*****************************************
	  cout << "End Loading Data !!\n\n";

	  cout << "Start Loading Input...\n\n";	
	  //*****************************************
	  for(i=0 ; i<1 ; i++){
		/*	char* aa;
			string axx,str;
			aa = "Ceptrum.txt";			
											
			string constructorString (myread(aa));

			int x = 0;
			int y = 0;

			axx = myread("Ceptrum.txt");												

 			const char* str2;
	 
			int j=0,k=0;
			
			for(int s = 0; s < filesize("Ceptrum.txt"); s++){							
				if ( constructorString[s] != '\t' && constructorString[s] != '\n' ){x++;}		
				else {		
					if (constructorString[s] == '\n')		
						x = x-1;
				
					str	= axx.substr(y,x);		
					str2= str.c_str();					// const char	
					
					float 	tempMatrix = atof(str2);		
					
					buff[j][k]	= tempMatrix;			
	
					y = y+x+1;		
					x = 0;
							
					k++;
			
					if(k==17)									
					{		
						j++;
						k=0;
					};

					if (constructorString[s] == '\n')		
						y = y+1;
					
				}		
			}*/

			k=0;

			for(i=0;i < 38;i ++){
				for(j=0;j<17;j++){
					test[0][k] = buff(i,j);
					k++;
				}
			}
	  }
	  //*******************************************
	  cout << "End Loading Input...\n\n";
		

	  cout << "<L>	for Loading database \n";
	  cout << "<R>	for Recognition \n";
	  cout << "<T>	for Training \n";
	  cout << "<Q>	for Quit program \n";			cout << "Press only 1 choice then Enter : ";
	  cin >> ch;

	  while (ch != 'q' && ch != 'Q'){
	  
	  //--------------------------- LOAD WEIGHT -------------------------------		
	
		  if( ch == 'l' || ch == 'L'){
		      cout << "\nLoading database... \n";

			  my.LoadWBij();
	          my.LoadWBjk();
			  my.LoadBiasJ();
			  my.LoadBiasK();

			  cout << "Ending Loading";

			  cout << "\n\n";
		  }
	  
	  //----------------------------- TRAINING --------------------------------

		  if( ch == 't' || ch == 'T'){

			  double SQQERR;
			  double ERR;

			  int count=0;

			  cout <<"Enter number of training Iterations : ";
      
			  cin >>iter;
	  
			  cout<<"\nStarting Training... ";
      
			  for(i=0;i<iter;i++){

				  k = 0;
				  
				  SQQERR = 0;		
				  ERR = 0.0;

				  //cout<<"\nTraining : "<<i+1;
				  
				  for(j=0;j<100;j++){

					  ERR = my.Train(tr_inp[j],cmd[k]);

					  k++;

					  if(k == 10 ){ 
						 // k ++;
						  k = 0;
					  }

					  SQQERR += ERR;

				  }

				  count++;

				  SQQERR = SQQERR/2;
				  
				  cout << count << " -> SQQERR = " << SQQERR <<"\n";
	  
			  }

			  //*************************	
			  my.ReccordWBij();
			  my.ReccordWBjk();
			  my.ReccordBiasJ();
			  my.ReccordBiasK();
			  //*************************

			  cout<<"\nEnding Training. ";
		  }

	  //---------------------------- RECOGNIZE --------------------------------

	      if( ch == 'r' || ch == 'R'){
			  
			cout<<"\n\nStarting Testing... \n";
      
			  for(j=0;j<1;j++){

				  my.SetInputs(test[j]);

				  outputs=my.GetOutput();
      
				  for(i=0;i<outp;i++){
              
					  cout<<"\nOutput"<<i<<" : "<<outputs[i];
		  
				  }
		
				  if(outputs[0] > 0.80 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
					   system("start Winword");
				   }

		           else if(outputs[0] < 0.75 && outputs[1] > 0.80 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
					   system("start Powerpnt");
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] > 0.80 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
					   system("start Excel");
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] > 0.80 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
					   system("start Notepad");
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] > 0.80 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
			           system("start Mspaint");
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] > 0.80 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
					   system("start Iexplore");
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] > 0.80 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
			           system("start Msimn");   
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] > 0.80 && outputs[8] < 0.75 && outputs[9] < 0.75 ){
			           system("start Msmsgs"); 
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] > 0.80 && outputs[9] < 0.75 ){
					   system("start mplayer2");					   
				   }

				   else if(outputs[0] < 0.75 && outputs[1] < 0.75 && outputs[2] < 0.75 && outputs[3] < 0.75 && outputs[4] < 0.75 && outputs[5] < 0.75 && outputs[6] < 0.75 && outputs[7] < 0.75 && outputs[8] < 0.75 && outputs[9] > 0.80 ){
					   system("start pinball");
				   }
				   
				   else{
			           cout << "\nProgram can not recognize your sound !!" ;
				   }
      
				  delete outputs;
	  
				  double *outputs;
			  }

			  cout<<"\n\nEnd Testing.\n\n";
		  }

		  cout << "\n----------------------------------------------------------------------------\n\n";
		  cout << "<L>	for Loading database \n";
	      cout << "<R>	for Recognition \n";
	      cout << "<T>	for Training \n";
	      cout << "<Q>	for Quit program \n\n";			cout << "Press only 1 choice then Enter : ";
	      cin >> ch;
		  cout << "\n";

	  }
	  cin.get();
}

//*************************************************************************************************

//******************************** Support File *******************************

char * myread(char *filename)
{
	FILE *fp;

  
	
	fp = fopen(filename, "rb");
	fseek(fp, 0L, SEEK_END ); 
	size_t endPos = ftell( fp ); 
	
	fseek(fp, 0, SEEK_SET);

	char *tag_buffer;
	tag_buffer = (char*) malloc (endPos);

	fread(tag_buffer, sizeof(char),endPos, fp);
	fclose(fp);
	return tag_buffer;
}


int filesize(char *filename)
{
	FILE *fp;

  
	
	fp = fopen(filename, "rb");
	fseek(fp, 0L, SEEK_END ); 
	size_t endPos = ftell( fp ); 
	fclose(fp);
	return endPos;
}

//*****************************************************************************